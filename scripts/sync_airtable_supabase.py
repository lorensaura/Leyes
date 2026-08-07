#!/usr/bin/env python3
"""
Sincroniza Airtable -> Supabase para Flashcards, Preguntas_Evaluacion y Evaluación.

Airtable sigue siendo donde Laura edita el contenido (varias bases: la
original "Digesto" para Flashcards/Temas, y una base por materia para
Preguntas_Evaluacion y, desde 2026-07-28, para Evaluación). Este script
copia lo publicado hacia las tablas de Supabase (flashcards,
preguntas_evaluacion, evaluacion_practica), que son las que la app
consulta en producción, no se editan a mano ahí.

Evaluación (Aplicación/Detección de error/Justificación/Discriminación MC,
2026-07-28): antes vivía hardcodeada en `const banco` de
app/alternativas.html, sin poder editarse sin tocar código. Se migró a
Airtable (una tabla por tipo en cada base de materia) y de ahí a la tabla
nueva `evaluacion_practica` en Supabase. Es distinta de Preguntas_Evaluacion,
que sigue siendo el banco de examen real usado como grounding del
Interrogador IA, no se tocan entre sí.

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

Campo `tema` (2026-07-29): Preguntas_Evaluacion y las 4 tablas de Evaluación
ya tenían en Airtable un campo de link `tema` -> `Temas` (igual al que usa
Flashcards desde siempre), pero este script lo ignoraba -- sync_preguntas
leía `tema_texto` (texto libre aparte) y sync_evaluacion mandaba `tema =
null` siempre. Se corrige acá: se resuelve el link igual que ya hacía
`_leer_flashcards_de_base`, y se agrega la columna `tema` a
`preguntas_evaluacion` en Supabase (ver
scripts/supabase_schema_tema_link.sql, correrla antes de este script si
todavía no se corrió). No se toca `tema_texto` ni `subtema`, que siguen
existiendo con su mismo uso.

Reconciliación (2026-07-29): antes de cada upsert se compara cuántas filas
publicadas hay en Airtable contra cuántas hay ya en Supabase, y se avisa si
Supabase tenía menos -- señal de contenido cargado en Airtable que nunca
llegó a sincronizarse (así se encontraron 225 Flashcards de "Digesto
Contractual" el 2026-07-29, cargadas en algún momento y nunca traídas).

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


def supabase_count(secret_key, tabla):
    url = f"{SUPABASE_URL}/rest/v1/{tabla}?select=id"
    req = urllib.request.Request(url, headers={
        "apikey": secret_key,
        "Authorization": f"Bearer {secret_key}",
        "Prefer": "count=exact",
        "Range": "0-0",
    })
    with urllib.request.urlopen(req) as resp:
        content_range = resp.headers.get("Content-Range", "0-0/0")
    return int(content_range.split("/")[-1])


def avisar_si_faltaban(tabla, antes, total_airtable):
    if antes < total_airtable:
        print(f"  Aviso: Supabase tenia {antes} filas de {tabla} antes de este sync, "
              f"Airtable publicado suma {total_airtable} ({total_airtable - antes} sin sincronizar hasta ahora)")


# Campo Revision_status (Flashcards, Preguntas_Evaluacion, y las 4 tablas de
# Evaluación en las bases de materia): mientras Laura no lo marque "Verificado",
# el item no sube a Supabase aunque este "publicado", para que las alumnas beta
# no vean contenido que todavia no paso su revision (pedido 2026-08-07). No
# alcanza con saltarlo al subir -- si un item que YA estaba en Supabase se
# marca "Revisar" despues (o se despublica), el script tiene que sacarlo de
# Supabase activamente (ver supabase_delete), porque el upsert nunca borra
# solo por dejar de mandar una fila.
NECESITA_REVISION = {"Revisar", "Verificar"}


def necesita_revision(fields):
    return fields.get("Revision_status") in NECESITA_REVISION


def necesita_borrado(fields):
    return not fields.get("publicado") or necesita_revision(fields)


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


def supabase_delete(secret_key, tabla, airtable_ids, lote=100):
    total = 0
    for i in range(0, len(airtable_ids), lote):
        chunk = airtable_ids[i:i + lote]
        if not chunk:
            continue
        filtro = ",".join(chunk)
        url = f"{SUPABASE_URL}/rest/v1/{tabla}?airtable_id=in.({filtro})"
        req = urllib.request.Request(url, method="DELETE", headers={
            "apikey": secret_key,
            "Authorization": f"Bearer {secret_key}",
            "Prefer": "return=representation",
        })
        with urllib.request.urlopen(req) as resp:
            borrados = json.load(resp)
        total += len(borrados)
    return total


def _leer_temas(airtable_token, base):
    temas = airtable_fetch_all(airtable_token, base, "Temas")
    info_tema = {}
    for t in temas:
        info_tema[t["id"]] = {
            "materia": t["fields"].get("materia"),
            "nombre": t["fields"].get("nombre"),
        }
    return info_tema


def _resolver_tema(fields, info_tema):
    tema_ids = fields.get("tema", [])
    if not tema_ids:
        return None
    return (info_tema.get(tema_ids[0]) or {}).get("nombre")


def _leer_flashcards_de_base(airtable_token, base, materia_default):
    info_tema = _leer_temas(airtable_token, base)

    flashcards = airtable_fetch_all(airtable_token, base, "Flashcards")
    candidatos = []
    for f in flashcards:
        fields = f["fields"]
        tema_ids = fields.get("tema", [])
        info = info_tema.get(tema_ids[0]) if tema_ids else None
        candidatos.append({
            "airtable_id": f["id"],
            "fields": fields,
            "fila": {
                "airtable_id": f["id"],
                "materia": (info or {}).get("materia") or materia_default,
                "tema": (info or {}).get("nombre"),
                "pregunta": fields.get("pregunta", ""),
                "respuesta": fields.get("respuesta", ""),
                "dificultad": fields.get("dificultad", "basica"),
                "publicado": True,
            },
        })
    return candidatos


def sync_flashcards(airtable_token, supabase_key):
    # Base "Digesto" original (Flashcards de Contractual cargadas ahí antes
    # de que existiera el patrón de una base por materia).
    candidatos = _leer_flashcards_de_base(airtable_token, FLASHCARDS_BASE, "Responsabilidad contractual")

    # Bases por materia (Digesto Contractual/Extracontractual/Precontractual):
    # cada una tiene su propia tabla Flashcards con el mismo esquema
    # (tema como link a Temas, dificultad "basica"/"intermedia"/"avanzada"
    # sin tilde). Antes de este fix, esta tabla nunca se leía y cualquier
    # Flashcard cargada ahí, aunque marcada publicado=true, nunca llegaba
    # a Supabase (hallazgo 2026-07-28, ver docs/contenido-airtable-supabase.md).
    for materia, base in PREGUNTAS_BASES.items():
        if base == FLASHCARDS_BASE:
            continue
        candidatos.extend(_leer_flashcards_de_base(airtable_token, base, materia))

    # La tabla Flashcards de "Digesto Contractual" comparte el mismo id
    # interno de registro de Airtable que la Flashcards de la base "Digesto"
    # original (225 registros, verificado 2026-07-29) -- pero ojo, NO
    # comparten todos los campos: `publicado` y `Revision_status` resultaron
    # ser independientes entre las dos copias (verificado 2026-08-07, caso
    # real de las 5 flashcards de "efecto relativo del contrato": desmarcar
    # `publicado` en una base no lo desmarcaba en la otra). El bucle de
    # arriba lee el registro dos veces con valores de campo potencialmente
    # distintos; acá se deduplica por id quedándonos con la última lectura
    # (la de la base de materia, que es la que Laura suele editar), y desde
    # ese único candidato por id se decide si sube o se borra -- así nunca
    # queda un id en las dos listas ni se decide con datos mezclados de las
    # dos bases.
    candidatos_por_id = {c["airtable_id"]: c for c in candidatos}

    filas = []
    malos_ids = []
    for c in candidatos_por_id.values():
        if necesita_borrado(c["fields"]):
            malos_ids.append(c["airtable_id"])
        else:
            filas.append(c["fila"])

    antes = supabase_count(supabase_key, "flashcards")
    n = supabase_upsert(supabase_key, "flashcards", filas)
    borradas = supabase_delete(supabase_key, "flashcards", malos_ids)
    print(f"Flashcards: {n} sincronizadas, {borradas} borradas (no publicado / Revisar)")
    avisar_si_faltaban("flashcards", antes, len(filas))


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
    antes = supabase_count(supabase_key, "preguntas_evaluacion")
    total = 0
    total_airtable = 0
    for materia, base in PREGUNTAS_BASES.items():
        info_tema = _leer_temas(airtable_token, base)
        preguntas = airtable_fetch_all(airtable_token, base, "Preguntas_Evaluacion")

        filas = []
        malos_ids = []
        for p in preguntas:
            fields = p["fields"]
            if necesita_borrado(fields):
                malos_ids.append(p["id"])
                continue
            elementos_texto = parsear_elementos_clave(fields.get("elementos_clave_texto", ""))
            opciones_pregunta = parsear_opciones(fields.get("opciones_texto", ""))
            filas.append({
                "airtable_id": p["id"],
                "materia": fields.get("materia", ""),
                "tema": _resolver_tema(fields, info_tema),
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
        borradas = supabase_delete(supabase_key, "preguntas_evaluacion", malos_ids)
        print(f"{materia}: {n} preguntas sincronizadas, {borradas} borradas (no publicado / Revisar)")
        total += n
        total_airtable += len(filas)

    print(f"Total preguntas: {total}")
    avisar_si_faltaban("preguntas_evaluacion", antes, total_airtable)


TABLAS_EVALUACION = {
    "Aplicación": "aplicacion",
    "Detección de error": "deteccion_error",
    "Justificación": "justificacion",
    "Discriminación MC": "discriminacion_mc",
}


def _fila_evaluacion_texto(record, materia, tipo, tema_nombre):
    fields = record["fields"]
    elementos = fields.get("elementos_clave") or "[]"
    try:
        elementos_clave = json.loads(elementos)
    except (TypeError, json.JSONDecodeError):
        elementos_clave = []
    return {
        "airtable_id": record["id"],
        "codigo": fields.get("id"),
        "materia": materia,
        "tipo": tipo,
        "tema": tema_nombre,
        "subtema": fields.get("subtema"),
        "caso": fields.get("caso"),
        "enunciado": fields.get("enunciado", ""),
        "respuesta_modelo": fields.get("respuesta_modelo"),
        "elementos_clave": elementos_clave,
        "opciones": [],
        "correcta": None,
        "articulos_referencia": fields.get("articulos_referencia"),
        "objetivo_pedagogico": fields.get("objetivo_pedagogico"),
        "publicado": True,
    }


def _fila_evaluacion_mc(record, materia, tema_nombre):
    fields = record["fields"]
    opciones = [
        {
            "letra": letra,
            "texto": fields.get(f"opcion_{letra.lower()}", ""),
            "rationale": fields.get(f"rationale_{letra.lower()}", ""),
        }
        for letra in ("A", "B", "C", "D")
    ]
    return {
        "airtable_id": record["id"],
        "codigo": fields.get("id"),
        "materia": materia,
        "tipo": "discriminacion_mc",
        "tema": tema_nombre,
        "subtema": fields.get("subtema"),
        "caso": fields.get("caso"),
        "enunciado": fields.get("enunciado", ""),
        "respuesta_modelo": None,
        "elementos_clave": [],
        "opciones": opciones,
        "correcta": fields.get("correcta"),
        "articulos_referencia": fields.get("articulos_referencia"),
        "objetivo_pedagogico": fields.get("objetivo_pedagogico"),
        "publicado": True,
    }


def sync_evaluacion(airtable_token, supabase_key):
    # Evaluación (Aplicación/Detección de error/Justificación/Discriminación MC),
    # migrada 2026-07-28 desde el banco hardcodeado de app/alternativas.html hacia
    # una tabla por tipo en cada base de materia. Distinta de Preguntas_Evaluacion
    # (banco de examen real, grounding del Interrogador IA, no se toca acá).
    antes = supabase_count(supabase_key, "evaluacion_practica")
    total = 0
    total_airtable = 0
    for materia, base in PREGUNTAS_BASES.items():
        info_tema = _leer_temas(airtable_token, base)
        filas = []
        malos_ids = []
        for tabla, tipo in TABLAS_EVALUACION.items():
            registros = airtable_fetch_all(airtable_token, base, tabla)
            for r in registros:
                if necesita_borrado(r["fields"]):
                    malos_ids.append(r["id"])
                    continue
                tema_nombre = _resolver_tema(r["fields"], info_tema)
                if tipo == "discriminacion_mc":
                    filas.append(_fila_evaluacion_mc(r, materia, tema_nombre))
                else:
                    filas.append(_fila_evaluacion_texto(r, materia, tipo, tema_nombre))

        n = supabase_upsert(supabase_key, "evaluacion_practica", filas)
        borradas = supabase_delete(supabase_key, "evaluacion_practica", malos_ids)
        print(f"{materia}: {n} items de Evaluación sincronizados, {borradas} borrados (no publicado / Revisar)")
        total += n
        total_airtable += len(filas)

    print(f"Total Evaluación: {total}")
    avisar_si_faltaban("evaluacion_practica", antes, total_airtable)


def main():
    airtable_token, supabase_key = cargar_env()
    sync_flashcards(airtable_token, supabase_key)
    sync_preguntas(airtable_token, supabase_key)
    sync_evaluacion(airtable_token, supabase_key)
    print("Listo.")


if __name__ == "__main__":
    main()
