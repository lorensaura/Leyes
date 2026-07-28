#!/usr/bin/env python3
"""
Sincroniza Airtable -> Supabase para Flashcards y Preguntas_Evaluacion.

Airtable sigue siendo donde Laura edita el contenido (varias bases: la
original "Digesto" para Flashcards/Temas, y una base por materia para
Preguntas_Evaluacion). Este script copia lo publicado hacia las tablas de
Supabase (flashcards, preguntas_evaluacion), que son las que la app
consulta en producción — no se editan a mano ahí.

Elementos_Clave y Opciones_MC (2026-07-27) dejaron de ser tablas
separadas vinculadas por link -- consumían más de 700 registros del cupo
de 1.000 por base del plan Free de Airtable. Ahora viven como campos de
texto en la misma fila de Preguntas_Evaluacion (`elementos_clave_texto`,
`opciones_texto`), uno por línea. Formato:
  elementos_clave_texto: "texto :: keywords" (o "texto :: keywords ::
    pregunta_socratica" si esa 3a parte existe), una línea por elemento.
  opciones_texto: "A) texto || rationale", una línea por opción A-D; la
    rationale de la correcta empieza con "CORRECTO." (convención ya usada
    en todo el contenido existente, no hace falta una columna aparte).
Ver parsear_elementos_clave/parsear_opciones abajo. El esquema de
Supabase no cambió: preguntas_evaluacion.elementos_clave sigue siendo un
array de solo texto (compatibilidad con api/interrogador.js).

Alternativas y Memorice (tabla `alternativas`/`memorice_articulos`) NO
pasan por Airtable (decidido 2026-07-27): Laura las redacta directo como
SQL y las corre ella misma en el SQL Editor de Supabase — modo más rápido
para ítems que no necesitan quedar perfectos a la primera. Ver
`docs/prompt-generacion-contenido-practica.md` para el formato del INSERT.

Correr a pedido, cuando Laura avise que agregó o cambió contenido en Airtable:
    python3 scripts/sync_airtable_supabase.py

Requiere AIRTABLE_TOKEN y SUPABASE_SECRET_KEY en .env (o el entorno).
"""

import json
import os
import re
import urllib.parse
import urllib.request
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
ENV_FILE = ROOT / ".env"

SUPABASE_URL = "https://byyukzhxhtopojgvgglp.supabase.co"

FLASHCARDS_BASE = "appjP6jK8Jbm5uaeG"

PREGUNTAS_BASES = {
    "Responsabilidad contractual": "appxeVxAE53yIqRPa",
    "Responsabilidad extracontractual": "appz8ePbArPV9cbE3",
    "Responsabilidad precontractual": "appeZI0TkAC3uaeVW",
}


def cargar_env():
    valores = {}
    if ENV_FILE.exists():
        for linea in ENV_FILE.read_text(encoding="utf-8").splitlines():
            if "=" in linea and not linea.strip().startswith("#"):
                k, v = linea.split("=", 1)
                valores[k.strip()] = v.strip()
    for k in ("AIRTABLE_TOKEN", "SUPABASE_SECRET_KEY"):
        if k in os.environ:
            valores[k] = os.environ[k]
    faltan = [k for k in ("AIRTABLE_TOKEN", "SUPABASE_SECRET_KEY") if not valores.get(k)]
    if faltan:
        raise SystemExit(f"Falta(n) en .env: {', '.join(faltan)}")
    return valores["AIRTABLE_TOKEN"], valores["SUPABASE_SECRET_KEY"]


def airtable_fetch_all(token, base, table):
    registros = []
    offset = None
    while True:
        params = {"pageSize": 100}
        if offset:
            params["offset"] = offset
        url = f"https://api.airtable.com/v0/{base}/{urllib.parse.quote(table)}?{urllib.parse.urlencode(params)}"
        req = urllib.request.Request(url, headers={"Authorization": f"Bearer {token}"})
        with urllib.request.urlopen(req) as resp:
            data = json.load(resp)
        registros.extend(data.get("records", []))
        offset = data.get("offset")
        if not offset:
            break
    return registros


def supabase_upsert(secret_key, tabla, filas, on_conflict="airtable_id", lote=200):
    total = 0
    for i in range(0, len(filas), lote):
        chunk = filas[i:i + lote]
        if not chunk:
            continue
        body = json.dumps(chunk).encode("utf-8")
        url = f"{SUPABASE_URL}/rest/v1/{tabla}?on_conflict={on_conflict}"
        req = urllib.request.Request(
            url,
            data=body,
            method="POST",
            headers={
                "apikey": secret_key,
                "Authorization": f"Bearer {secret_key}",
                "Content-Type": "application/json",
                "Prefer": "resolution=merge-duplicates,return=minimal",
            },
        )
        with urllib.request.urlopen(req) as resp:
            resp.read()
        total += len(chunk)
    return total


def _leer_flashcards_de_base(airtable_token, base, materia_default):
    temas = airtable_fetch_all(airtable_token, base, "Temas")
    info_tema = {}
    for t in temas:
        info_tema[t["id"]] = {
            "materia": t["fields"].get("materia"),
            "nombre": t["fields"].get("nombre"),
        }

    flashcards = airtable_fetch_all(airtable_token, base, "Flashcards")
    filas = []
    for f in flashcards:
        fields = f["fields"]
        if not fields.get("publicado"):
            continue
        tema_ids = fields.get("tema", [])
        info = info_tema.get(tema_ids[0]) if tema_ids else None
        filas.append({
            "airtable_id": f["id"],
            "materia": (info or {}).get("materia") or materia_default,
            "tema": (info or {}).get("nombre"),
            "pregunta": fields.get("pregunta", ""),
            "respuesta": fields.get("respuesta", ""),
            "dificultad": fields.get("dificultad", "basica"),
            "publicado": True,
        })
    return filas


def sync_flashcards(airtable_token, supabase_key):
    # Base "Digesto" original (Flashcards de Contractual cargadas ahí antes
    # de que existiera el patrón de una base por materia).
    filas = _leer_flashcards_de_base(airtable_token, FLASHCARDS_BASE, "Responsabilidad contractual")

    # Bases por materia (Digesto Contractual/Extracontractual/Precontractual):
    # cada una tiene su propia tabla Flashcards con el mismo esquema
    # (tema como link a Temas, dificultad "basica"/"intermedia"/"avanzada"
    # sin tilde). Antes de este fix, esta tabla nunca se leía y cualquier
    # Flashcard cargada ahí, aunque marcada publicado=true, nunca llegaba
    # a Supabase (hallazgo 2026-07-28, ver docs/contenido-airtable-supabase.md).
    for materia, base in PREGUNTAS_BASES.items():
        if base == FLASHCARDS_BASE:
            continue
        filas.extend(_leer_flashcards_de_base(airtable_token, base, materia))

    n = supabase_upsert(supabase_key, "flashcards", filas)
    print(f"Flashcards: {n} sincronizadas")


def parsear_elementos_clave(texto):
    if not texto:
        return []
    elementos = []
    for linea in texto.splitlines():
        linea = linea.strip()
        if not linea:
            continue
        elementos.append(linea.split(" :: ", 1)[0].strip())
    return elementos


def parsear_opciones(texto):
    if not texto:
        return []
    opciones = []
    for linea in texto.splitlines():
        linea = linea.strip()
        m = re.match(r"^([A-D])\)\s*(.*?)\s*\|\|\s*(.*)$", linea)
        if not m:
            continue
        letra, opcion_texto, rationale = m.groups()
        opciones.append({"letra": letra, "texto": opcion_texto, "rationale": rationale})
    return sorted(opciones, key=lambda o: o["letra"])


def sync_preguntas(airtable_token, supabase_key):
    total = 0
    for materia, base in PREGUNTAS_BASES.items():
        preguntas = airtable_fetch_all(airtable_token, base, "Preguntas_Evaluacion")

        filas = []
        for p in preguntas:
            fields = p["fields"]
            if not fields.get("publicado"):
                continue
            elementos_texto = parsear_elementos_clave(fields.get("elementos_clave_texto", ""))
            opciones_pregunta = parsear_opciones(fields.get("opciones_texto", ""))
            filas.append({
                "airtable_id": p["id"],
                "materia": fields.get("materia", ""),
                "tema_texto": fields.get("tema_texto", materia),
                "subtema": fields.get("subtema"),
                "tipo": fields.get("tipo"),
                "enunciado": fields.get("enunciado", ""),
                "respuesta_modelo": fields.get("respuesta_modelo"),
                "articulos_referencia": fields.get("articulos_referencia"),
                "objetivo_pedagogico": fields.get("objetivo_pedagogico"),
                "fuente": fields.get("fuente"),
                "elementos_clave": elementos_texto,
                "opciones_mc": opciones_pregunta,
                "publicado": True,
            })

        n = supabase_upsert(supabase_key, "preguntas_evaluacion", filas)
        print(f"{materia}: {n} preguntas sincronizadas")
        total += n

    print(f"Total preguntas: {total}")


def main():
    airtable_token, supabase_key = cargar_env()
    sync_flashcards(airtable_token, supabase_key)
    sync_preguntas(airtable_token, supabase_key)
    print("Listo.")


if __name__ == "__main__":
    main()
