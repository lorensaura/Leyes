#!/usr/bin/env python3
"""
Sincroniza Airtable -> Supabase para Flashcards, Preguntas_Evaluacion y Alternativas.

Airtable sigue siendo donde Laura edita el contenido (varias bases: la
original "Digesto" para Flashcards/Temas, una base por materia para
Preguntas_Evaluacion/Elementos_Clave/Opciones_MC, y una base única
"Alternativas" con las tres materias juntas, distinguidas por su propio
campo `materia`). Este script copia lo publicado hacia las tablas de
Supabase (flashcards, preguntas_evaluacion, alternativas), que son las que
la app consulta en producción — no se editan a mano ahí.

Correr a pedido, cuando Laura avise que agregó o cambió contenido en Airtable:
    python3 scripts/sync_airtable_supabase.py

Requiere AIRTABLE_TOKEN y SUPABASE_SECRET_KEY en .env (o el entorno).
"""

import json
import os
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

# Base nueva para el modelo "Alternativas" (2026-07-27), una sola base para
# las tres materias (mismo patrón que FLASHCARDS_BASE, no el de
# PREGUNTAS_BASES): las tres bases de Preguntas_Evaluacion ya están al 40-53%
# del cupo de 1.000 registros del plan Free de Airtable (429/533/401 al
# revisar), así que Alternativas va en una base propia para no competir por
# ese cupo, pero en volumen esperado (~30-50 ítems por materia) no justifica
# tres bases separadas — más simple para Laura tener un solo lugar, con un
# campo `materia` por fila, igual que ya funciona Flashcards. Todavía no
# existe — Laura la crea a partir de "Alternativas" (ver
# docs/contenido-airtable-supabase.md para el esquema de campos) y pega acá
# el ID. Mientras el valor sea None, sync_alternativas() se salta sin fallar.
ALTERNATIVAS_BASE = None  # TODO: ID de la base "Alternativas"


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


def sync_flashcards(airtable_token, supabase_key):
    temas = airtable_fetch_all(airtable_token, FLASHCARDS_BASE, "Temas")
    info_tema = {}
    for t in temas:
        info_tema[t["id"]] = {
            "materia": t["fields"].get("materia"),
            "nombre": t["fields"].get("nombre"),
        }

    flashcards = airtable_fetch_all(airtable_token, FLASHCARDS_BASE, "Flashcards")
    filas = []
    for f in flashcards:
        fields = f["fields"]
        if not fields.get("publicado"):
            continue
        tema_ids = fields.get("tema", [])
        info = info_tema.get(tema_ids[0]) if tema_ids else None
        filas.append({
            "airtable_id": f["id"],
            "materia": (info or {}).get("materia") or "Responsabilidad contractual",
            "tema": (info or {}).get("nombre"),
            "pregunta": fields.get("pregunta", ""),
            "respuesta": fields.get("respuesta", ""),
            "dificultad": fields.get("dificultad", "basica"),
            "publicado": True,
        })

    n = supabase_upsert(supabase_key, "flashcards", filas)
    print(f"Flashcards: {n} sincronizadas")


def sync_preguntas(airtable_token, supabase_key):
    total = 0
    for materia, base in PREGUNTAS_BASES.items():
        preguntas = airtable_fetch_all(airtable_token, base, "Preguntas_Evaluacion")
        elementos = airtable_fetch_all(airtable_token, base, "Elementos_Clave")
        opciones = airtable_fetch_all(airtable_token, base, "Opciones_MC")

        texto_elemento = {e["id"]: e["fields"].get("texto", "") for e in elementos}

        opciones_por_pregunta = {}
        for o in opciones:
            fields = o["fields"]
            for pid in fields.get("pregunta", []):
                opciones_por_pregunta.setdefault(pid, []).append({
                    "letra": fields.get("letra", "?"),
                    "texto": fields.get("texto", ""),
                    "rationale": fields.get("rationale", ""),
                })

        filas = []
        for p in preguntas:
            fields = p["fields"]
            if not fields.get("publicado"):
                continue
            elementos_ids = fields.get("Elementos_Clave", [])
            elementos_texto = [texto_elemento[eid] for eid in elementos_ids if eid in texto_elemento]
            opciones_pregunta = sorted(
                opciones_por_pregunta.get(p["id"], []), key=lambda o: o["letra"]
            )
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


def sync_alternativas(airtable_token, supabase_key):
    if not ALTERNATIVAS_BASE:
        return
    letras = ["A", "B", "C", "D"]
    registros = airtable_fetch_all(airtable_token, ALTERNATIVAS_BASE, "Alternativas")
    filas = []
    for r in registros:
        fields = r["fields"]
        if not fields.get("publicado"):
            continue
        correcta_letra = (fields.get("correcta") or "A").strip().upper()
        if correcta_letra not in letras:
            correcta_letra = "A"
        opciones = [fields.get(f"opcion_{l.lower()}", "") for l in letras]
        por_que_no = []
        for l in letras:
            if l == correcta_letra:
                continue
            texto = fields.get(f"por_que_no_{l.lower()}")
            if texto:
                por_que_no.append(f"{l}: {texto}")
        filas.append({
            "id": r["id"],
            "materia": (fields.get("materia") or "").strip().lower(),
            "subtema": fields.get("subtema"),
            "nivel_exigencia": fields.get("nivel_exigencia", 3),
            "pregunta": fields.get("pregunta", ""),
            "opciones": opciones,
            "correcta": letras.index(correcta_letra),
            "retroalimentacion": {
                "correcta": fields.get("por_que_correcta", ""),
                "por_que_no": por_que_no,
            },
            "fuente": fields.get("fuente"),
            "publicado": True,
        })
    n = supabase_upsert(supabase_key, "alternativas", filas, on_conflict="id")
    print(f"Alternativas: {n} sincronizadas")


def main():
    airtable_token, supabase_key = cargar_env()
    sync_flashcards(airtable_token, supabase_key)
    sync_preguntas(airtable_token, supabase_key)
    sync_alternativas(airtable_token, supabase_key)
    print("Listo.")


if __name__ == "__main__":
    main()
