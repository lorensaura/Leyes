#!/usr/bin/env python3
"""
Aplica en Airtable las correcciones de REC (Contractual) que quedaron
decididas el 2026-07-31 pero nunca escritas en ningun lado que sobreviva
un sync: la clasificacion por eje de 40 items de Evaluacion (Fase 0,
docs/fase0_rec_clasificacion_2026-07-31.md) y la reclasificacion de 82
Flashcards (docs/reclasificacion_flashcards_rec_2026-07-31_detalle.csv),
mas la subida del primer lote de contenido nuevo del eje 5 (4 items de
Evaluacion + 5 Flashcards).

Un UPDATE hecho solo en Supabase no sobrevive el proximo
sync_airtable_supabase.py, porque ese script lee el tema desde el link
a Temas que tiene cada fila en Airtable. Por eso este script escribe en
Airtable (fuente real), no en Supabase directamente -- correr
sync_airtable_supabase.py despues para que el cambio baje a Supabase.

Requiere AIRTABLE_TOKEN en .env. Pensado para correrse paso a paso
(cada funcion imprime su propio resultado); si una llamada se bloquea a
mitad de camino, lo que ya se aplico queda aplicado (Airtable no
revierte por si solo), solo falta re-intentar el resto.

Uso:
    python3 scripts/aplicar_correcciones_pendientes.py relink-evaluacion
    python3 scripts/aplicar_correcciones_pendientes.py relink-flashcards
    python3 scripts/aplicar_correcciones_pendientes.py subir-eje5
    python3 scripts/aplicar_correcciones_pendientes.py todo
"""

import csv
import json
import os
import re
import sys
import urllib.parse
import urllib.request
import urllib.error
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
ENV_FILE = ROOT / ".env"

CONTRACTUAL_BASE = "appxeVxAE53yIqRPa"

TABLAS_EVALUACION = {
    "aplicacion": "Aplicación",
    "deteccion": "Detección de error",
    "justificacion": "Justificación",
    "discriminacion_mc": "Discriminación MC",
}

FASE0_DOC = ROOT / "docs" / "fase0_rec_clasificacion_2026-07-31.md"
FLASHCARDS_CSV = ROOT / "docs" / "reclasificacion_flashcards_rec_2026-07-31_detalle.csv"


SUPABASE_URL = "https://byyukzhxhtopojgvgglp.supabase.co"


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
    if not valores.get("AIRTABLE_TOKEN"):
        raise SystemExit("Falta AIRTABLE_TOKEN en .env")
    return valores["AIRTABLE_TOKEN"], valores.get("SUPABASE_SECRET_KEY")


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


def airtable_patch_lote(token, base, table, updates):
    """updates: lista de {"id": record_id, "fields": {...}}. Lotes de 10 (limite de Airtable)."""
    ok, fallidas = 0, []
    for i in range(0, len(updates), 10):
        chunk = updates[i:i + 10]
        body = json.dumps({"records": chunk}).encode("utf-8")
        url = f"https://api.airtable.com/v0/{base}/{urllib.parse.quote(table)}"
        req = urllib.request.Request(url, data=body, method="PATCH", headers={
            "Authorization": f"Bearer {token}",
            "Content-Type": "application/json",
        })
        try:
            with urllib.request.urlopen(req) as resp:
                json.load(resp)
            ok += len(chunk)
        except urllib.error.HTTPError as e:
            print(f"  ERROR en lote {i}-{i+len(chunk)}: {e.code} {e.read().decode('utf-8', 'replace')}")
            fallidas.extend(chunk)
    return ok, fallidas


def airtable_post_lote(token, base, table, registros_fields):
    """registros_fields: lista de dicts de fields (sin id de Airtable, se crea nuevo)."""
    creados, fallidos = [], []
    for i in range(0, len(registros_fields), 10):
        chunk = registros_fields[i:i + 10]
        body = json.dumps({"records": [{"fields": f} for f in chunk]}).encode("utf-8")
        url = f"https://api.airtable.com/v0/{base}/{urllib.parse.quote(table)}"
        req = urllib.request.Request(url, data=body, method="POST", headers={
            "Authorization": f"Bearer {token}",
            "Content-Type": "application/json",
        })
        try:
            with urllib.request.urlopen(req) as resp:
                data = json.load(resp)
            creados.extend(data.get("records", []))
        except urllib.error.HTTPError as e:
            print(f"  ERROR creando lote {i}-{i+len(chunk)}: {e.code} {e.read().decode('utf-8', 'replace')}")
            fallidos.extend(chunk)
    return creados, fallidos


def temas_nombre_a_id(token, base):
    temas = airtable_fetch_all(token, base, "Temas")
    return {r["fields"]["nombre"]: r["id"] for r in temas}


def parse_fase0_pairs():
    """codigo -> eje, leido de los statements SQL del doc de Fase 0 REC."""
    doc = FASE0_DOC.read_text(encoding="utf-8")
    pairs = re.findall(r"set tema = '([^']+)' where codigo = '([^']+)';", doc)
    return {codigo: tema for tema, codigo in pairs}


def relink_evaluacion(token):
    print("=== Relinkeando 40 items de Evaluacion (Fase 0 REC) ===")
    codigo_to_eje = parse_fase0_pairs()
    print(f"  {len(codigo_to_eje)} pares codigo->eje leidos de {FASE0_DOC.name}")

    nombre_a_id = temas_nombre_a_id(token, CONTRACTUAL_BASE)

    # codigo -> (tabla, record_id)
    codigo_a_record = {}
    for tipo, tabla in TABLAS_EVALUACION.items():
        registros = airtable_fetch_all(token, CONTRACTUAL_BASE, tabla)
        for r in registros:
            cod = r["fields"].get("id")
            if cod:
                codigo_a_record[cod] = (tabla, r["id"])

    por_tabla = {}
    faltantes = []
    for codigo, eje in codigo_to_eje.items():
        rec = codigo_a_record.get(codigo)
        if not rec:
            faltantes.append(codigo)
            continue
        tabla, record_id = rec
        tema_id = nombre_a_id.get(eje)
        if not tema_id:
            print(f"  AVISO: eje '{eje}' no existe en catalogo Temas (item {codigo})")
            continue
        por_tabla.setdefault(tabla, []).append({"id": record_id, "fields": {"tema": [tema_id]}})

    if faltantes:
        print(f"  AVISO: {len(faltantes)} codigos no encontrados en Airtable: {faltantes}")

    total_ok, total_fail = 0, 0
    for tabla, updates in por_tabla.items():
        ok, fallidas = airtable_patch_lote(token, CONTRACTUAL_BASE, tabla, updates)
        print(f"  {tabla}: {ok} relinkeados, {len(fallidas)} fallidos")
        total_ok += ok
        total_fail += len(fallidas)
    print(f"Total: {total_ok} ok, {total_fail} fallidos, {len(faltantes)} no encontrados")
    return total_ok, total_fail


def relink_flashcards(token):
    print("=== Relinkeando 82 Flashcards reclasificadas ===")
    if not FLASHCARDS_CSV.exists():
        raise SystemExit(f"No existe {FLASHCARDS_CSV}")

    nombre_a_id = temas_nombre_a_id(token, CONTRACTUAL_BASE)
    # el CSV solo trae el numero de eje (ej. "8"), no el nombre completo
    numero_a_id = {}
    for nombre, rec_id in nombre_a_id.items():
        m = re.match(r"(\d+)\.", nombre)
        if m:
            numero_a_id[m.group(1)] = rec_id

    updates = []
    with open(FLASHCARDS_CSV, encoding="utf-8") as f:
        reader = csv.DictReader(f)
        for row in reader:
            if row["tema_actual"] == row["tema_real"]:
                continue
            tema_id = numero_a_id.get(row["tema_real"])
            if not tema_id:
                print(f"  AVISO: eje '{row['tema_real']}' no existe en catalogo (id {row['id']})")
                continue
            updates.append({"id": row["airtable_id"], "fields": {"tema": [tema_id]}})

    print(f"  {len(updates)} tarjetas a relinkear")
    ok, fallidas = airtable_patch_lote(token, CONTRACTUAL_BASE, "Flashcards", updates)
    print(f"Total: {ok} ok, {len(fallidas)} fallidos")
    return ok, len(fallidas)


# --- Contenido nuevo del eje 5 (docs/evaluacion_nueva_2026-07-31_contractual_eje5.md
# y docs/flashcards_nuevas_2026-07-31_contractual_eje5.md), ya redactado y auditado. ---

EJE5_EVALUACION = {
    "aplicacion": [{
        "id": "rc-aplic-013",
        "subtema": "El hecho del deudor como tercera modalidad de imputación, aplicado al comodato",
        "caso": "María le presta a Jorge (comodato) su bicicleta de alta gama por un mes. A las tres semanas, sin decirle nada a María, Jorge se la vende a un compañero de trabajo.",
        "enunciado": "¿Bajo qué factor de imputación responde Jorge frente a María, y qué norma lo regula específicamente?",
        "respuesta_modelo": "Jorge responde por el \"hecho del deudor\", la tercera modalidad de imputación que ORREGO agrega al dolo y la culpa: conductas del deudor que, sin ser necesariamente dolosas ni encuadrarse limpiamente en la negligencia, determinan el incumplimiento por haber dispuesto de la cosa. El artículo 2187 hace responsable precisamente al comodatario que enajena la cosa prestada. No hace falta calificar la conducta como dolosa (el relato no establece que Jorge quisiera dañar a María) ni como culpa en sentido estricto (vender la bicicleta no es un descuido, es un acto voluntario de disposición): basta la enajenación misma, regulada por el art. 2187, para generar la responsabilidad.",
        "articulos_referencia": "2187",
        "objetivo_pedagogico": "Evaluar si el alumno reconoce el \"hecho del deudor\" como una tercera modalidad de imputación, distinta del dolo y la culpa, aplicándola a la hipótesis concreta del art. 2187.",
        "elementos_clave": [
            {"texto": "Identifica que la enajenación de la cosa prestada configura \"hecho del deudor\", no dolo ni culpa en sentido estricto", "keywords": ["hecho del deudor", "tercera modalidad", "no es dolo ni culpa"], "pregunta": "¿Qué factor de imputación explica que Jorge responda por vender la bicicleta?"},
            {"texto": "Cita el art. 2187 como la norma que hace responsable al comodatario que enajena la cosa", "keywords": ["art. 2187", "comodatario", "enajena la cosa"], "pregunta": "¿Qué artículo regula esta hipótesis?"},
            {"texto": "Explica que no hace falta probar dolo ni culpa porque la sola disposición de la cosa genera la responsabilidad", "keywords": ["no requiere dolo", "no requiere culpa", "disposición de la cosa"], "pregunta": "¿Hace falta probar intención de dañar o negligencia?"},
        ],
    }],
    "deteccion": [{
        "id": "rc-detect-011",
        "subtema": "El hecho del deudor (art. 1678) frente al caso fortuito",
        "caso": "Un alumno responde: \"Si Pedro, deudor de un cuerpo cierto, destruye la cosa creyendo de buena fe que ya no estaba obligado a conservarla, eso es un caso fortuito, porque Pedro no actuó con dolo ni con culpa: simplemente se equivocó.\"",
        "enunciado": "Identifica el error del alumno y explica cómo debe calificarse jurídicamente esa conducta.",
        "respuesta_modelo": "El alumno confunde el \"hecho del deudor\" con el caso fortuito. El artículo 1678 regula precisamente esta hipótesis: si la cosa debida se destruye por un hecho voluntario del deudor que inculpablemente ignoraba la obligación, se deberá solamente el precio, sin otra indemnización de perjuicios. Es un hecho voluntario del propio deudor (él mismo destruyó la cosa), no un hecho ajeno e irresistible como exige el caso fortuito, que por definición proviene de una causa externa al deudor. Que Pedro ignorara inculpablemente la obligación explica por qué la ley atenúa su responsabilidad (solo debe el precio, no la indemnización completa), pero no lo exonera del todo como ocurriría con un caso fortuito genuino.",
        "articulos_referencia": "1678",
        "objetivo_pedagogico": "Evaluar si el alumno distingue el \"hecho del deudor\" (voluntario, propio, con responsabilidad atenuada) del caso fortuito (ajeno, irresistible, exonera por completo).",
        "elementos_clave": [
            {"texto": "Identifica que el alumno confunde hecho del deudor con caso fortuito", "keywords": ["confunde hecho del deudor", "caso fortuito"], "pregunta": "¿Cuál es el error del alumno?"},
            {"texto": "Explica que el caso fortuito exige un hecho ajeno e irresistible, mientras que aquí el propio deudor destruyó la cosa (hecho voluntario propio)", "keywords": ["hecho ajeno e irresistible", "hecho voluntario propio"], "pregunta": "¿Qué exige el caso fortuito que no se da acá?"},
            {"texto": "Cita el art. 1678 y su efecto atenuado (solo se debe el precio, no la indemnización completa)", "keywords": ["art. 1678", "solo el precio", "no indemnización completa"], "pregunta": "¿Qué norma regula esto y cuál es su efecto?"},
        ],
    }],
    "justificacion": [{
        "id": "rc-just-011",
        "subtema": "El hecho del deudor como categoría autónoma de imputación",
        "enunciado": "¿Por qué ORREGO trata el \"hecho del deudor\" como una tercera modalidad de imputación, distinta del dolo y de la culpa? Ilustra con al menos dos hipótesis legales.",
        "respuesta_modelo": "Porque hay conductas del deudor que determinan el incumplimiento sin encuadrar limpiamente ni en el dolo (que exige intención positiva de dañar, o al menos conciencia de que el incumplimiento causará perjuicio) ni en la culpa (que supone negligencia, imprudencia o impericia en el cumplimiento). El hecho del deudor cubre casos en que el deudor dispuso voluntariamente de la cosa o provocó la imposibilidad, sin que sea necesario, o incluso posible, calificar esa conducta como dolosa o negligente. Dos hipótesis legales lo ilustran: el artículo 2187, que hace responsable al comodatario que enajena la cosa prestada (un acto voluntario de disposición, no necesariamente doloso ni negligente); y el artículo 1678, que regula al deudor que destruye la cosa debida por un hecho voluntario propio, ignorando inculpablemente la obligación (tampoco dolo, porque no hay intención de dañar, ni culpa en sentido estricto, porque no actúa negligentemente respecto de una obligación que ignora).",
        "articulos_referencia": "2187, 1678",
        "objetivo_pedagogico": "Evaluar si el alumno explica por qué el hecho del deudor constituye una categoría de imputación autónoma, y si puede ilustrarla con las hipótesis legales que la ejemplifican.",
        "elementos_clave": [
            {"texto": "Explica que el hecho del deudor cubre conductas que no encuadran limpiamente ni en el dolo ni en la culpa", "keywords": ["no encuadra en dolo", "no encuadra en culpa"], "pregunta": "¿Por qué es una categoría distinta del dolo y la culpa?"},
            {"texto": "Ilustra con el art. 2187 (comodatario que enajena la cosa)", "keywords": ["art. 2187", "comodatario enajena"], "pregunta": "¿Qué ejemplo legal lo muestra en el comodato?"},
            {"texto": "Ilustra con el art. 1678 (deudor que destruye la cosa por hecho voluntario propio, ignorando inculpablemente la obligación)", "keywords": ["art. 1678", "hecho voluntario propio", "ignora inculpablemente"], "pregunta": "¿Qué otro ejemplo legal existe?"},
        ],
    }],
    "discriminacion_mc": [{
        "id": "rc-mc-010",
        "subtema": "El hecho del deudor (art. 2187) frente a las otras modalidades de imputación",
        "caso": "María le presta (comodato) su bicicleta de alta gama a Jorge por un mes. A las tres semanas, sin decirle nada a María, Jorge se la vende a un compañero de trabajo.",
        "enunciado": "¿Bajo qué factor de imputación responde Jorge frente a María, y qué norma lo regula específicamente?",
        "opciones": {
            "a": ("Dolo, porque vendió la bicicleta con la intención positiva de causarle un perjuicio a María",
                  "Error: no hay antecedentes de que Jorge haya actuado con la intención positiva de dañar a María; el dolo exige esa intención, o al menos la conciencia de causar el perjuicio, y el relato no lo establece."),
            "b": ("Culpa leve, porque no fue lo suficientemente diligente al disponer de un bien que no era suyo",
                  "Error: la culpa supone negligencia o descuido en el cumplimiento de la obligación de restituir, pero vender la cosa prestada no es un descuido: es un acto deliberado de disposición, no una falta de cuidado."),
            "c": ("Hecho del deudor, porque el artículo 2187 hace responsable al comodatario que enajena la cosa prestada",
                  "CORRECTO. El art. 2187 regula exactamente esta hipótesis: el comodatario que enajena la cosa prestada responde por esta tercera modalidad de imputación (hecho del deudor), sin que sea necesario calificar su conducta como dolosa ni como culposa en sentido estricto."),
            "d": ("Caso fortuito, porque Jorge no tenía cómo prever que necesitaría vender la bicicleta",
                  "Error: el caso fortuito exige un hecho ajeno e irresistible al deudor; aquí la venta fue un acto voluntario del propio Jorge, no un hecho externo e imprevisible que escapara a su control."),
        },
        "correcta": "C",
        "articulos_referencia": "2187",
        "objetivo_pedagogico": "Evaluar si el alumno distingue el \"hecho del deudor\" (art. 2187) del dolo, la culpa y el caso fortuito, en un caso concreto de comodato.",
    }],
}

EJE5_FLASHCARDS = [
    {
        "pregunta": "Enumere los seis requisitos que deben concurrir copulativamente para que proceda la indemnización de perjuicios, según ORREGO (siguiendo a ALESSANDRI).",
        "respuesta": "1.º Incumplimiento; 2.º que sea <b>imputable</b> (dolo o culpa); 3.º que el deudor esté en <b>mora</b>; 4.º que existan <b>perjuicios</b>; 5.º <b>relación de causalidad</b>; 6.º que no concurra una <b>causal de exención</b>.",
        "dificultad": "basica",
    },
    {
        "pregunta": "¿Qué significa que estos seis requisitos sean \"copulativos\"?",
        "respuesta": "Que deben concurrir <b>todos</b>: basta que falte uno solo para que no proceda la indemnización, aunque los demás sí estén presentes.",
        "dificultad": "basica",
    },
    {
        "pregunta": "¿Qué dos formas reviste la imputabilidad en materia contractual?",
        "respuesta": "El <b>dolo</b> y la <b>culpa</b> (a las que ORREGO agrega, como tercera modalidad de imputación, el <em>hecho del deudor</em>).",
        "dificultad": "basica",
    },
    {
        "pregunta": "Si el incumplimiento de un contrato se debe a un hecho ajeno e irresistible al deudor, ¿qué ocurre con la obligación de indemnizar?",
        "respuesta": "El deudor queda <b>exonerado</b>: falta el requisito de <b>imputabilidad</b>, porque el incumplimiento no proviene de su dolo, culpa o hecho propio, sino de caso fortuito o fuerza mayor.",
        "dificultad": "intermedia",
    },
    {
        "pregunta": "¿Por qué el manual trata \"que no concurra una causal de exención\" como un requisito aparte, y no simplemente como la ausencia de imputabilidad?",
        "respuesta": "Porque aunque el incumplimiento sea imputable (haya dolo o culpa) y estén presentes los demás requisitos, la indemnización igual puede rechazarse si el deudor acredita una <b>causal de exención</b> distinta (se desarrollan en la Sección 6 del manual, eje 17).",
        "dificultad": "intermedia",
    },
]


def subir_lote(token, tema_nombre, evaluacion_por_tipo, flashcards=None):
    """Sube un lote nuevo de contenido (Evaluacion + opcionalmente Flashcards)
    para un eje de Contractual. evaluacion_por_tipo: dict tipo -> lista de
    items (mismo formato que EJE5_EVALUACION). flashcards: lista de dicts
    pregunta/respuesta/dificultad (mismo formato que EJE5_FLASHCARDS)."""
    print(f"=== Subiendo lote nuevo: {tema_nombre} ===")
    nombre_a_id = temas_nombre_a_id(token, CONTRACTUAL_BASE)
    tema_id = nombre_a_id.get(tema_nombre)
    if not tema_id:
        raise SystemExit(f"No se encontro '{tema_nombre}' en el catalogo de Temas")

    total_ok = 0

    for tipo, items in evaluacion_por_tipo.items():
        tabla = TABLAS_EVALUACION[tipo]
        registros = []
        for item in items:
            fields = {
                "id": item["id"],
                "tema": [tema_id],
                "subtema": item["subtema"],
                "articulos_referencia": item["articulos_referencia"],
                "objetivo_pedagogico": item["objetivo_pedagogico"],
                "publicado": True,
            }
            if item.get("caso"):
                fields["caso"] = item["caso"]
            fields["enunciado"] = item["enunciado"]
            if tipo == "discriminacion_mc":
                for letra, (texto, rationale) in item["opciones"].items():
                    fields[f"opcion_{letra}"] = texto
                    fields[f"rationale_{letra}"] = rationale
                fields["correcta"] = item["correcta"]
            else:
                fields["respuesta_modelo"] = item["respuesta_modelo"]
                fields["elementos_clave"] = json.dumps(item["elementos_clave"], ensure_ascii=False)
            registros.append(fields)
        creados, fallidos = airtable_post_lote(token, CONTRACTUAL_BASE, tabla, registros)
        print(f"  {tabla}: {len(creados)} creados, {len(fallidos)} fallidos")
        total_ok += len(creados)

    if flashcards:
        fc_registros = [
            {
                "tema": [tema_id],
                "pregunta": fc["pregunta"],
                "respuesta": fc["respuesta"],
                "dificultad": fc["dificultad"],
                "publicado": True,
            }
            for fc in flashcards
        ]
        creados, fallidos = airtable_post_lote(token, CONTRACTUAL_BASE, "Flashcards", fc_registros)
        print(f"  Flashcards: {len(creados)} creados, {len(fallidos)} fallidos")
        total_ok += len(creados)

    print(f"Total creado: {total_ok}")
    return total_ok


def subir_eje5(token):
    return subir_lote(
        token,
        "5. Requisitos de la indemnización de perjuicios",
        EJE5_EVALUACION,
        EJE5_FLASHCARDS,
    )


EJE3_EVALUACION = {
    "aplicacion": [{
        "id": "rc-aplic-014",
        "subtema": "Incumplimiento imperfecto y retardo simultáneos, aceptados por el acreedor (arts. 1556, 1591)",
        "caso": "Un taller mecánico se compromete a reparar el motor de un auto y entregarlo el lunes. Lo entrega el miércoles (dos días de atraso) y, además, sin haber cambiado un filtro que también estaba incluido en la reparación pactada. El dueño del auto, sin decir nada, recibe el auto y paga el precio acordado.",
        "enunciado": "¿Qué tipo(s) de incumplimiento hay en este caso, y qué efecto tiene que el dueño haya recibido el auto sin objetar nada?",
        "respuesta_modelo": "Hay dos formas de incumplimiento a la vez: retardo (la entrega debía ser el lunes y fue el miércoles) y cumplimiento imperfecto (no se cambió el filtro pactado), ambos incumplimientos parciales según el art. 1556. Como el acreedor no está obligado a recibir un pago que no sea íntegro (art. 1591), si hubiera rechazado la entrega en esas condiciones, habría incumplimiento total. Pero al recibir el auto y pagar sin objetar, el dueño acepta el cumplimiento imperfecto y tardío: la deuda subsiste reducida (correspondiente al filtro no cambiado), y el taller queda expuesto a la indemnización moratoria por el atraso, sin que el incumplimiento se convierta en total.",
        "articulos_referencia": "1556, 1591",
        "objetivo_pedagogico": "Evaluar si el alumno reconoce que un mismo caso puede combinar retardo y cumplimiento imperfecto, y si aplica correctamente la regla del art. 1591 sobre el efecto de que el acreedor acepte, en vez de rechazar, un pago no íntegro.",
        "elementos_clave": [
            {"texto": "Identifica el retardo (entrega el miércoles en vez del lunes)", "keywords": ["retardo", "dos días de atraso", "art. 1556"], "pregunta": "¿Qué forma de incumplimiento hay por la fecha de entrega?"},
            {"texto": "Identifica el cumplimiento imperfecto (el filtro no cambiado)", "keywords": ["cumplimiento imperfecto", "incumplimiento parcial", "filtro"], "pregunta": "¿Qué otra forma de incumplimiento hay, además del retardo?"},
            {"texto": "Explica que al recibir sin objetar, el dueño acepta el pago imperfecto y tardío en vez de rechazarlo, por lo que la deuda subsiste reducida y no se convierte en incumplimiento total", "keywords": ["acepta el pago", "no rechaza", "subsiste reducida", "no es total", "art. 1591"], "pregunta": "¿Qué efecto tiene que el dueño haya recibido el auto sin decir nada?"},
        ],
    }],
    "deteccion": [{
        "id": "rc-detect-012",
        "subtema": "El incumplimiento es un concepto objetivo, distinto de la imputabilidad",
        "caso": "Un alumno responde: \"El incumplimiento contractual es, por definición, un concepto subjetivo: solo hay incumplimiento cuando el deudor actuó con dolo o culpa. Si el deudor no cumplió por un simple error de cálculo sin mala intención, no hay incumplimiento, sino un problema distinto.\"",
        "enunciado": "Identifica el error del alumno y explica la naturaleza real del concepto de incumplimiento.",
        "respuesta_modelo": "El alumno confunde el incumplimiento con la imputabilidad. El incumplimiento (que no se pague íntegra y oportunamente lo debido, art. 1556) es un concepto de carácter objetivo: basta que el pago no se haya verificado en los términos pactados, sin que importe si el deudor actuó con dolo, con culpa o sin ninguno de los dos. Que el incumplimiento provenga de un obrar doloso o negligente del deudor es una cuestión distinta, la imputabilidad, que recién se examina después de constatado el incumplimiento, y que es la que abre la puerta a la indemnización de perjuicios (junto con el daño), no al incumplimiento mismo.",
        "articulos_referencia": "1556",
        "objetivo_pedagogico": "Evaluar si el alumno distingue el incumplimiento (objetivo, basta el hecho del no pago íntegro y oportuno) de la imputabilidad (dolo o culpa del deudor), que son requisitos distintos y sucesivos.",
        "elementos_clave": [
            {"texto": "Identifica que el alumno confunde incumplimiento con imputabilidad", "keywords": ["confunde incumplimiento", "imputabilidad"], "pregunta": "¿Cuál es el error del alumno?"},
            {"texto": "Explica que el incumplimiento es un concepto objetivo: basta que el pago no se haya verificado íntegra y oportunamente", "keywords": ["concepto objetivo", "no importa dolo ni culpa", "art. 1556"], "pregunta": "¿Qué hace falta para que exista incumplimiento?"},
            {"texto": "Explica que la imputabilidad es una cuestión distinta y posterior, necesaria solo para la indemnización de perjuicios", "keywords": ["imputabilidad distinta", "cuestión posterior", "indemnización de perjuicios"], "pregunta": "¿Para qué hace falta entonces el dolo o la culpa?"},
        ],
    }],
    "justificacion": [{
        "id": "rc-just-012",
        "subtema": "El incumplimiento como concepto objetivo y su separación de la imputabilidad",
        "enunciado": "¿Por qué se dice que el incumplimiento contractual es un concepto \"de carácter objetivo\"? ¿Qué consecuencia práctica tiene separar el incumplimiento de la imputabilidad del deudor?",
        "respuesta_modelo": "Es objetivo porque basta con verificar, mirando el contenido de la obligación, si hubo pago íntegro y oportuno o no: no se necesita indagar en la conducta interna del deudor. El artículo 1556 describe el incumplimiento en tres hipótesis (no cumplir, cumplir imperfectamente, retardar el cumplimiento) sin exigir ningún elemento de dolo o culpa. La consecuencia práctica de separar incumplimiento de imputabilidad es que el incumplimiento por sí solo ya habilita al acreedor a pedir el cumplimiento forzado o la resolución (art. 1489); solo si además se quiere la indemnización de perjuicios hace falta acreditar, adicionalmente, que el incumplimiento es imputable al deudor (dolo o culpa) y que causó un daño.",
        "articulos_referencia": "1556, 1489",
        "objetivo_pedagogico": "Evaluar si el alumno explica por qué el incumplimiento es un concepto objetivo y distingue qué remedios habilita por sí solo frente a los que exigen además imputabilidad.",
        "elementos_clave": [
            {"texto": "Explica que el incumplimiento se verifica objetivamente, sin indagar en la conducta interna del deudor", "keywords": ["objetivo", "sin indagar conducta", "sin dolo ni culpa"], "pregunta": "¿Por qué el incumplimiento es un concepto objetivo?"},
            {"texto": "Cita el art. 1556 y sus tres hipótesis sin elemento subjetivo", "keywords": ["art. 1556", "tres hipótesis", "no cumplir, imperfecto, retardo"], "pregunta": "¿Qué norma lo describe y cómo?"},
            {"texto": "Explica que el incumplimiento por sí solo habilita cumplimiento forzado y resolución, mientras que la indemnización exige además imputabilidad y daño", "keywords": ["cumplimiento forzado", "resolución", "indemnización exige más", "imputabilidad y daño"], "pregunta": "¿Qué consecuencia práctica tiene esta separación?"},
        ],
    }],
    "discriminacion_mc": [{
        "id": "rc-mc-011",
        "subtema": "Cumplimiento imperfecto vs. incumplimiento total vs. retardo (art. 1556)",
        "caso": "Un taller de costura se obliga a confeccionar un vestido de novia para el 10 de agosto. Lo entrega el 10 de agosto, pero con la talla equivocada, que la novia no puede usar sin arreglos adicionales.",
        "enunciado": "¿Qué tipo de incumplimiento hay, según la clasificación del art. 1556?",
        "opciones": {
            "a": ("Incumplimiento total, porque el vestido entregado no sirve para el uso que la novia necesitaba",
                  "Error: hay ejecución de la obligación (se confeccionó y entregó un vestido), no una ausencia total de cumplimiento; el defecto de talla es un problema de integridad de la prestación, no de inexistencia total de ella."),
            "b": ("Cumplimiento imperfecto, un incumplimiento parcial, porque la obligación se ejecutó pero no en forma íntegra",
                  "CORRECTO. El vestido se confeccionó y entregó a tiempo, pero con un defecto (la talla) que impide su uso sin ajustes: eso es cumplir la obligación, pero no íntegramente, la hipótesis del cumplimiento imperfecto del art. 1556."),
            "c": ("Retardo, porque la entrega tardía es lo único que compromete al taller",
                  "Error: la entrega se hizo en la fecha pactada (10 de agosto); no hay retardo, el problema es la calidad/talla de lo entregado, no la oportunidad de la entrega."),
            "d": ("No hay incumplimiento, porque el vestido efectivamente se confeccionó y entregó en la fecha pactada",
                  "Error: que se haya entregado algo en la fecha pactada no basta; el pago debe ser íntegro (identidad e integridad), y un vestido de talla equivocada no cumple ese estándar, por lo que sigue habiendo incumplimiento (parcial)."),
        },
        "correcta": "B",
        "articulos_referencia": "1556",
        "objetivo_pedagogico": "Evaluar si el alumno distingue cumplimiento imperfecto de incumplimiento total y de retardo, en un caso donde la entrega es oportuna pero defectuosa.",
    }],
}


def subir_eje3(token):
    return subir_lote(token, "3. El incumplimiento: noción objetiva", EJE3_EVALUACION)


EJE7_EVALUACION = {
    "aplicacion": [{
        "id": "rc-aplic-015",
        "subtema": "El dolo contractual no se presume; debe probarse (art. 1459)",
        "caso": "En un contrato de arriendo de un local comercial, el arrendatario deja de pagar tres meses de renta. El arrendador demanda alegando que el arrendatario dejó de pagar dolosamente, con el propósito deliberado de perjudicarlo, pero en el juicio solo logra acreditar el hecho del no pago, sin aportar ninguna prueba sobre la intención del arrendatario.",
        "enunciado": "¿Puede el arrendador obtener que se califique el incumplimiento como doloso, con los efectos que eso trae? Fundamenta.",
        "respuesta_modelo": "No puede, mientras no pruebe el dolo. El dolo no se presume, salvo en los casos especialmente previstos por la ley; en los demás, debe probarse (art. 1459). El arrendador, que es quien alega que el incumplimiento fue doloso, soporta la carga de acreditarlo, y no basta con probar el solo hecho del no pago (el incumplimiento objetivo), que en todo caso hace presumir la culpa del arrendatario (art. 1547 inc. 3°), pero no el dolo. Mientras el arrendador no acredite la intención o al menos la conciencia de perjudicarlo, el incumplimiento se calificará como culpable, no doloso, con las consecuencias más benignas que eso trae para el arrendatario (perjuicios solo previstos, posibilidad de condonación anticipada de la culpa).",
        "articulos_referencia": "1459, 1547",
        "objetivo_pedagogico": "Evaluar si el alumno aplica correctamente la regla de que el dolo no se presume (a diferencia de la culpa) y debe ser probado por quien lo alega.",
        "elementos_clave": [
            {"texto": "Identifica que el dolo no se presume y debe probarse por quien lo alega (el arrendador)", "keywords": ["dolo no se presume", "debe probarse", "art. 1459"], "pregunta": "¿Quién debe probar el dolo y qué regla lo exige?"},
            {"texto": "Señala que el solo incumplimiento objetivo no basta para probar dolo, aunque sí hace presumir la culpa", "keywords": ["incumplimiento no prueba dolo", "presunción de culpa distinta"], "pregunta": "¿Basta con probar el no pago para tener por acreditado el dolo?"},
            {"texto": "Concluye que sin esa prueba, el incumplimiento se califica como culpable, no doloso, con efectos más benignos", "keywords": ["se califica culpable", "efectos más benignos"], "pregunta": "¿Cómo se califica entonces el incumplimiento?"},
        ],
    }],
    "justificacion": [{
        "id": "rc-just-013",
        "subtema": "Por qué el dolo agrava la responsabilidad pero no hasta los perjuicios indirectos (art. 1558)",
        "enunciado": "¿Por qué el dolo agrava la responsabilidad del deudor extendiéndola a los perjuicios imprevistos, pero el art. 1558 traza un límite que ni el dolo traspasa? Explica cuál es ese límite y por qué existe.",
        "respuesta_modelo": "Si el incumplimiento es culpable, el deudor solo responde de los perjuicios directos previstos (los que se previeron o pudieron preverse al tiempo del contrato). El dolo agrava esa responsabilidad extendiéndola también a los perjuicios directos imprevistos, porque quien incumple deliberadamente pierde la protección que la previsibilidad ordinariamente concede al deudor de buena fe. Sin embargo, el art. 1558 traza una frontera infranqueable: en ningún caso, ni siquiera mediando dolo, se responde de los perjuicios indirectos. El límite existe porque la extensión de la responsabilidad, aun agravada por el dolo, sigue exigiendo una relación causal directa entre el incumplimiento y el perjuicio; los perjuicios indirectos rompen esa cadena causal directa, y ni la gravedad de la conducta del deudor puede suplir esa falta de conexión causal inmediata.",
        "articulos_referencia": "1558",
        "objetivo_pedagogico": "Evaluar si el alumno explica la extensión que el dolo agrega a la responsabilidad (previstos → también imprevistos) y por qué existe igual un límite (los indirectos) que ni el dolo traspasa.",
        "elementos_clave": [
            {"texto": "Explica que si hay solo culpa, el deudor responde de perjuicios directos previstos únicamente", "keywords": ["perjuicios previstos", "solo culpa"], "pregunta": "¿De qué perjuicios responde el deudor si solo hay culpa?"},
            {"texto": "Explica que el dolo extiende la responsabilidad a los perjuicios directos imprevistos", "keywords": ["dolo extiende", "imprevistos"], "pregunta": "¿Qué agrega el dolo a esa responsabilidad?"},
            {"texto": "Explica que ni el dolo lleva a responder de los perjuicios indirectos, por faltar relación causal directa", "keywords": ["nunca indirectos", "límite infranqueable", "relación causal directa"], "pregunta": "¿Hay algún límite que ni el dolo traspasa?"},
        ],
    }],
    "discriminacion_mc": [{
        "id": "rc-mc-012",
        "subtema": "El dolo se aprecia en concreto y no admite grados, a diferencia de la culpa",
        "caso": "En un contrato de suministro, el proveedor deja intencionalmente de entregar la mercadería para vendérsela a otro cliente que pagaba más. Al ser demandado, argumenta ante el tribunal: \"Sí hubo intención de incumplir, pero fue un dolo menor, casi como una culpa levísima, porque nunca quise arruinar a la contraparte, solo aprovechar una mejor oferta.\"",
        "enunciado": "¿Es jurídicamente sostenible pedir que se gradúe el dolo del proveedor como \"menor\", asimilándolo a un grado de culpa?",
        "opciones": {
            "a": ("Sí, porque el dolo admite grados igual que la culpa, y el juez debe medir su intensidad caso a caso",
                  "Error: a diferencia de la culpa, que se aprecia en abstracto y admite tres grados (grave, leve, levísima), el dolo se aprecia en concreto y no admite grados: o hay intención (o representación consciente) de dañar, o no la hay."),
            "b": ("No, porque el dolo se aprecia en concreto, atendiendo a la intención o representación efectiva del deudor, y no admite graduación alguna",
                  "CORRECTO. El dolo se valora en concreto según la intención o representación efectiva del deudor incumplidor; no existen grados de dolo, a diferencia de la culpa, que se aprecia en abstracto conforme a un modelo ideal de conducta y admite tres grados."),
            "c": ("No, porque el dolo siempre equivale a la culpa grave, así que corresponde aplicar directamente el estándar de la culpa grave",
                  "Error: la equivalencia es en sentido inverso y solo para un efecto puntual (art. 44: la culpa grave equivale al dolo, no al revés); no significa que el dolo se mida con la escala de graduación de la culpa."),
            "d": ("Sí, porque el artículo 1547 gradúa la responsabilidad del deudor según el grado de dolo con que actuó, igual que gradúa la culpa",
                  "Error: el art. 1547 gradúa la culpa según a quién beneficia el contrato (levísima/leve/grave); no contiene ninguna graduación del dolo, que se aprecia en concreto y sin grados."),
        },
        "correcta": "B",
        "articulos_referencia": "44, 1547",
        "objetivo_pedagogico": "Evaluar si el alumno distingue que el dolo se aprecia en concreto y no admite grados, evitando la confusión inversa con la equivalencia del art. 44.",
    }],
}


def subir_eje7(token):
    return subir_lote(token, "7. El dolo contractual", EJE7_EVALUACION)


EJE4_EVALUACION = {
    "aplicacion": [{
        "id": "rc-aplic-016",
        "subtema": "Obligación de medio: la ausencia de culpa exonera (ejemplo médico)",
        "caso": "Un médico trata a un paciente con una enfermedad grave, siguiendo el protocolo clínico vigente y con toda la diligencia exigible, pero el paciente fallece. La familia demanda al médico por incumplimiento contractual, alegando que \"no logró curar\" al paciente.",
        "enunciado": "¿Es la obligación del médico de medio o de resultado? ¿Basta que el médico haya actuado con diligencia, aunque el paciente no se curara, para exonerarlo?",
        "respuesta_modelo": "Es una obligación de medio: el médico se compromete a poner la diligencia y los conocimientos necesarios para tratar de curar al paciente, sin garantizar la curación misma. En las obligaciones de medio, la diligencia cumple una función integradora de la prestación, de modo que si, pese a haberse actuado diligentemente, no se alcanza el resultado esperado (la curación), no se configura responsabilidad: la ausencia de culpa es, en sí misma, una causal de exención. Como el médico siguió el protocolo clínico vigente y actuó con la diligencia exigible, queda exonerado, aunque el paciente haya fallecido: no basta con el resultado adverso, hace falta que ese resultado se deba a una falta de diligencia del médico.",
        "articulos_referencia": "",
        "objetivo_pedagogico": "Evaluar si el alumno reconoce que en las obligaciones de medio, a diferencia de las de resultado, la sola ausencia de culpa exonera al deudor.",
        "elementos_clave": [
            {"texto": "Identifica la obligación del médico como de medio, no de resultado", "keywords": ["obligación de medio", "no garantiza el resultado"], "pregunta": "¿Qué tipo de obligación tiene el médico?"},
            {"texto": "Explica que en obligaciones de medio la ausencia de culpa es, por sí sola, causal de exención", "keywords": ["ausencia de culpa exonera", "función integradora"], "pregunta": "¿Basta la sola diligencia para exonerar en este tipo de obligación?"},
            {"texto": "Concluye que el médico queda exonerado pese al resultado adverso, porque actuó diligentemente", "keywords": ["exonerado", "resultado adverso no basta"], "pregunta": "¿Queda entonces exonerado el médico?"},
        ],
    }],
    "deteccion": [{
        "id": "rc-detect-013",
        "subtema": "Regímenes de exención distintos: obligaciones de medio vs. de resultado",
        "caso": "Un alumno responde: \"Da lo mismo si la obligación es de medio o de resultado: en ambos casos, el deudor se exonera con solo probar que actuó con la diligencia debida, sin necesidad de acreditar un caso fortuito.\"",
        "enunciado": "Identifica el error del alumno y explica la regla correcta.",
        "respuesta_modelo": "El alumno confunde el régimen de exención de ambos tipos de obligación. En las obligaciones de medio, en efecto, la sola ausencia de culpa exonera al deudor. Pero en las obligaciones de resultado ocurre lo contrario: la culpa no es un elemento a considerar para determinar el incumplimiento, y el deudor únicamente se exonera acreditando un evento de fuerza mayor que le imposibilitó ejecutar la obligación debida; no basta con probar que actuó diligentemente, sin más. Por eso \"da lo mismo\" es incorrecto: el régimen de exención depende justamente de qué tipo de obligación es.",
        "articulos_referencia": "",
        "objetivo_pedagogico": "Evaluar si el alumno distingue los regímenes de exención distintos entre obligaciones de medio (basta ausencia de culpa) y de resultado (exige fuerza mayor).",
        "elementos_clave": [
            {"texto": "Identifica que el alumno confunde los regímenes de exención de ambos tipos de obligación", "keywords": ["confunde regímenes", "no da lo mismo"], "pregunta": "¿Cuál es el error del alumno?"},
            {"texto": "Explica que en obligaciones de medio basta la ausencia de culpa para exonerar", "keywords": ["obligaciones de medio", "ausencia de culpa"], "pregunta": "¿Qué régimen rige en las obligaciones de medio?"},
            {"texto": "Explica que en obligaciones de resultado se exige acreditar fuerza mayor, no basta la diligencia", "keywords": ["obligaciones de resultado", "exige fuerza mayor"], "pregunta": "¿Y en las de resultado?"},
        ],
    }],
    "discriminacion_mc": [{
        "id": "rc-mc-013",
        "subtema": "Obligación de resultado: exige fuerza mayor, no basta la diligencia",
        "caso": "Un contratista se compromete a construir una piscina y entregarla terminada en 60 días. A los 40 días, un temporal de lluvias sin precedentes en la zona, declarado zona de catástrofe, inunda la obra y destruye buena parte de lo avanzado, retrasando la entrega 3 meses más.",
        "enunciado": "¿Bajo qué régimen de exención puede liberarse el contratista, considerando que su obligación es de resultado?",
        "opciones": {
            "a": ("Le basta probar que actuó con toda la diligencia posible durante la construcción",
                  "Error: en las obligaciones de resultado, como la del contratista, la sola ausencia de culpa no exonera; se exige acreditar un evento de fuerza mayor que haya imposibilitado la ejecución."),
            "b": ("Debe acreditar que el temporal constituyó un evento de fuerza mayor que le imposibilitó ejecutar la obligación",
                  "CORRECTO. En las obligaciones de resultado, el deudor solo se exonera acreditando un evento de fuerza mayor (como este temporal sin precedentes, declarado zona de catástrofe) que le imposibilitó cumplir; la diligencia por sí sola no basta."),
            "c": ("No puede exonerarse en ningún caso, porque las obligaciones de resultado no admiten ninguna causal de exención",
                  "Error: las obligaciones de resultado sí admiten exención, pero únicamente por fuerza mayor, no por cualquier causal; el temporal descrito calza en esa hipótesis."),
            "d": ("Le basta con que el retraso no le sea imputable, sin necesidad de calificarlo como fuerza mayor",
                  "Error: no basta la sola ausencia de imputabilidad genérica; en las obligaciones de resultado específicamente se exige acreditar fuerza mayor, un estándar más exigente que la mera ausencia de culpa."),
        },
        "correcta": "B",
        "articulos_referencia": "",
        "objetivo_pedagogico": "Evaluar si el alumno aplica correctamente el régimen de exención de las obligaciones de resultado (exige fuerza mayor, no basta diligencia) a un caso concreto.",
    }],
}


def subir_eje4(token):
    return subir_lote(token, "4. Obligaciones de medios y de resultado", EJE4_EVALUACION)


EJE9_EVALUACION = {
    "aplicacion": [{
        "id": "rc-aplic-017",
        "subtema": "\"La mora purga la mora\" (art. 1552) en los contratos bilaterales",
        "caso": "En un contrato de compraventa, el comprador debía pagar el precio el día 1 de cada mes y el vendedor debía entregar la mercadería el día 5. Llegado el día 10, ni el comprador pagó ni el vendedor entregó nada. El comprador demanda al vendedor exigiéndole la indemnización de perjuicios moratorios, alegando que el vendedor está en mora desde el día 5.",
        "enunciado": "¿Está el vendedor en mora, tal como alega el comprador? Fundamenta.",
        "respuesta_modelo": "No está en mora, o al menos el comprador no puede constituirlo válidamente en mora mientras él mismo tampoco haya cumplido ni esté llano a cumplir. En los contratos bilaterales rige la regla del art. 1552: ninguno de los contratantes está en mora dejando de cumplir lo pactado mientras el otro no cumple por su parte, ni se allana a cumplirlo. Es la excepción de contrato no cumplido proyectada sobre la mora: \"la mora purga la mora\", la mora de uno neutraliza la del otro. Como el comprador tampoco pagó el precio en la fecha pactada (el día 1) ni acredita estar llano a hacerlo, no puede constituir en mora al vendedor ni cobrarle indemnización moratoria.",
        "articulos_referencia": "1552",
        "objetivo_pedagogico": "Evaluar si el alumno aplica correctamente la regla \"la mora purga la mora\" (art. 1552) para determinar que un contratante que tampoco ha cumplido no puede constituir en mora a la contraparte.",
        "elementos_clave": [
            {"texto": "Identifica que rige la regla del art. 1552 en los contratos bilaterales", "keywords": ["art. 1552", "contratos bilaterales"], "pregunta": "¿Qué norma rige la mora en los contratos bilaterales?"},
            {"texto": "Explica la regla \"la mora purga la mora\": ninguno está en mora mientras el otro tampoco cumple ni está llano a cumplir", "keywords": ["mora purga la mora", "ninguno en mora"], "pregunta": "¿Qué dice esa regla?"},
            {"texto": "Concluye que el comprador, al no haber pagado tampoco, no puede constituir en mora al vendedor", "keywords": ["comprador tampoco cumplió", "no puede constituir en mora"], "pregunta": "¿Puede entonces el comprador cobrar la indemnización?"},
        ],
    }],
    "justificacion": [{
        "id": "rc-just-014",
        "subtema": "Efecto de la mora sobre el riesgo del caso fortuito (arts. 1547, 1672)",
        "enunciado": "¿Por qué se dice que la mora \"traslada al deudor el riesgo de la cosa\"? Explica este efecto y su excepción.",
        "respuesta_modelo": "Porque, conforme a los artículos 1547 inciso 2° y 1672 inciso 2°, el deudor que está en mora responde incluso del caso fortuito que sobreviene estando en mora, cuando por regla general el caso fortuito lo exoneraría. Esto traslada al deudor moroso el riesgo de la pérdida de la cosa: si antes de la mora esa pérdida fortuita lo habría liberado, estando en mora la soporta él. La excepción es que el deudor puede liberarse igual si prueba que la cosa habría perecido lo mismo en poder del acreedor de haberse cumplido oportunamente: en tal caso, la mora no fue la causa real de la pérdida, y no sería justo hacerlo responder por un daño que de todos modos habría ocurrido.",
        "articulos_referencia": "1547, 1672",
        "objetivo_pedagogico": "Evaluar si el alumno explica el efecto de la mora sobre el riesgo del caso fortuito y su excepción (perecimiento igual en poder del acreedor).",
        "elementos_clave": [
            {"texto": "Explica que el deudor moroso responde incluso del caso fortuito sobrevenido durante la mora", "keywords": ["responde del caso fortuito", "deudor moroso"], "pregunta": "¿Qué ocurre con el caso fortuito sobrevenido durante la mora?"},
            {"texto": "Cita los arts. 1547 inc. 2° y 1672 inc. 2°", "keywords": ["art. 1547 inc. 2", "art. 1672 inc. 2"], "pregunta": "¿Qué normas regulan esto?"},
            {"texto": "Explica la excepción: se libera si prueba que la cosa habría perecido igual en poder del acreedor", "keywords": ["excepción", "habría perecido igual", "en poder del acreedor"], "pregunta": "¿Hay alguna forma de que el deudor moroso igual se libere?"},
        ],
    }],
}


def subir_eje9(token):
    return subir_lote(token, "9. La mora", EJE9_EVALUACION)


EJE6_EVALUACION = {
    "deteccion": [{
        "id": "rc-detect-014",
        "subtema": "Las cuatro fuentes jerárquicas para determinar el grado de culpa",
        "caso": "Un alumno responde: \"El artículo 1547 siempre determina de qué culpa responde el deudor en un contrato, independientemente de lo que hayan pactado las partes o de lo que digan otras normas del Código, porque es la regla general en materia de responsabilidad contractual.\"",
        "enunciado": "Identifica el error del alumno y explica el orden correcto para determinar el grado de culpa.",
        "respuesta_modelo": "El alumno se equivoca al tratar el art. 1547 como la primera y única fuente. En realidad, el grado de culpa de que responde el deudor se determina siguiendo un orden de prelación de cuatro fuentes: primero, lo que las partes hayan estipulado; segundo, las leyes especiales, de haberlas; tercero, las normas del Código Civil propias de cada contrato (por ejemplo, culpa levísima en el comodato, art. 2178, o culpa grave en el depósito, art. 2222); y solo a falta de las tres anteriores, en cuarto y último lugar, opera supletoriamente el art. 1547, que distribuye la culpa según a quién beneficia el contrato. El art. 1547 no es, entonces, la regla que siempre se aplica: es la norma general y supletoria, que cede ante la estipulación de las partes, las leyes especiales y las normas propias de cada contrato.",
        "articulos_referencia": "1547, 2178, 2222",
        "objetivo_pedagogico": "Evaluar si el alumno conoce el orden jerárquico de las cuatro fuentes para determinar el grado de culpa, y no trata el art. 1547 como la única o primera fuente.",
        "elementos_clave": [
            {"texto": "Identifica que el alumno trata erróneamente al art. 1547 como la única/primera fuente", "keywords": ["error", "art. 1547 no es la única fuente"], "pregunta": "¿Cuál es el error del alumno?"},
            {"texto": "Enumera el orden correcto: estipulación de las partes, leyes especiales, normas del Código propias del contrato, y supletoriamente el art. 1547", "keywords": ["orden jerárquico", "cuatro fuentes"], "pregunta": "¿Cuál es el orden correcto para determinar el grado de culpa?"},
            {"texto": "Explica que el art. 1547 es la norma general y supletoria, no la primera", "keywords": ["general y supletoria", "cede ante las demás"], "pregunta": "¿Qué lugar ocupa entonces el art. 1547?"},
        ],
    }],
}


def subir_eje6(token):
    return subir_lote(token, "6. La culpa contractual y su graduación", EJE6_EVALUACION)


EJE8_EVALUACION = {
    "justificacion": [{
        "id": "rc-just-015",
        "subtema": "La presunción de culpa contractual como ventaja frente a la vía extracontractual",
        "enunciado": "¿Por qué se dice que la presunción de culpa del art. 1547 inc. 3° es \"una de las principales ventajas de demandar por la vía contractual\"? Contrasta con la regla en materia extracontractual.",
        "respuesta_modelo": "Porque invierte la carga de la prueba a favor del acreedor. En sede contractual, acreditada la existencia de la obligación y el incumplimiento, la culpa del deudor se presume: es él quien debe probar que empleó la diligencia debida o que medió caso fortuito para liberarse, conforme al art. 1547 inc. 3°. En sede extracontractual, en cambio, la regla general es la inversa: es la víctima quien debe probar la culpa del autor del daño, salvo las presunciones específicas de los arts. 2320 y siguientes. Para un acreedor, litigar por la vía contractual es entonces más ventajoso en términos probatorios: le basta acreditar la obligación y el incumplimiento, sin tener que indagar ni probar qué pasó internamente en la conducta del deudor, carga que recae sobre este último.",
        "articulos_referencia": "1547, 2320",
        "objetivo_pedagogico": "Evaluar si el alumno explica la inversión de la carga de la prueba en materia contractual (presunción de culpa) y la contrasta correctamente con la regla general extracontractual.",
        "elementos_clave": [
            {"texto": "Explica que en sede contractual, acreditados obligación e incumplimiento, la culpa del deudor se presume", "keywords": ["presunción de culpa", "contractual"], "pregunta": "¿Qué se presume en materia contractual?"},
            {"texto": "Contrasta con la regla extracontractual: la víctima debe probar la culpa del autor (salvo presunciones específicas)", "keywords": ["extracontractual", "víctima prueba"], "pregunta": "¿Cómo es la regla en materia extracontractual?"},
            {"texto": "Concluye que esto es una ventaja probatoria para el acreedor que demanda por vía contractual", "keywords": ["ventaja probatoria", "acreedor"], "pregunta": "¿Por qué es esto una ventaja?"},
        ],
    }],
    "discriminacion_mc": [{
        "id": "rc-mc-014",
        "subtema": "Carga de la prueba del caso fortuito (jurisprudencia: Constructora Pardo y González, 2025)",
        "caso": "En un juicio por incumplimiento de un contrato de construcción, el constructor demandado invoca caso fortuito para excusar el retraso en la obra, pero no rinde ninguna prueba sobre las circunstancias del hecho que alega. El dueño de la obra, por su parte, tampoco presenta prueba sobre la culpa del constructor.",
        "enunciado": "Conforme al criterio de la Corte Suprema en el caso \"Constructora Pardo y González\" (11 de marzo de 2025, Rol N° 217.959-2023), ¿a quién corresponde la carga de la prueba en esta situación, y qué debería resolver el tribunal?",
        "opciones": {
            "a": ("Al dueño de la obra, porque es quien demanda y debe probar la culpa del constructor, igual que en materia extracontractual",
                  "Error: en materia contractual la culpa se presume (art. 1547 inc. 3°); no es el acreedor quien debe probarla, sino el deudor quien debe probar su diligencia o el caso fortuito."),
            "b": ("Al constructor, porque invocó el caso fortuito y no rindió la prueba de sus requisitos (impedimento ajeno, imprevisible e irresistible), por lo que su alegación debe rechazarse",
                  "CORRECTO. Conforme al art. 1547 inc. 3° y al criterio de la Corte Suprema en Constructora Pardo y González, quien invoca el caso fortuito debe probarlo; al no rendir esa prueba, la alegación se rechaza y el constructor queda responsable."),
            "c": ("A ninguno de los dos, porque al no haber prueba de ninguna parte el tribunal debe absolver al constructor por falta de prueba del incumplimiento",
                  "Error: el incumplimiento (retraso en la obra) no está en discusión; lo que falta de prueba es la causal de exención invocada por el constructor, cuya carga es suya, no del demandante."),
            "d": ("Al dueño de la obra, porque debe acreditar tanto el incumplimiento como la ausencia de caso fortuito para que proceda la indemnización",
                  "Error: el acreedor no debe probar la ausencia de caso fortuito; es el deudor quien, si quiere exonerarse invocándolo, debe probar su concurrencia."),
        },
        "correcta": "B",
        "articulos_referencia": "1547",
        "objetivo_pedagogico": "Evaluar si el alumno aplica correctamente la presunción de culpa contractual y la carga de la prueba del caso fortuito, con apoyo en la jurisprudencia real citada en el manual.",
    }],
}


def subir_eje8(token):
    return subir_lote(token, "8. Presunción de culpa y carga de la prueba", EJE8_EVALUACION)


EJE10_EVALUACION = {
    "deteccion": [{
        "id": "rc-detect-015",
        "subtema": "Imprevisibilidad del caso fortuito: fenómenos recurrentes (jurisprudencia de la sequía)",
        "caso": "Un alumno responde: \"Una empresa generadora de energía hidroeléctrica que no puede cumplir su contrato de suministro por una sequía puede siempre invocar caso fortuito, porque la sequía es un fenómeno natural ajeno a la voluntad de la empresa.\"",
        "enunciado": "Identifica el error del alumno, apoyándote en el criterio de la jurisprudencia.",
        "respuesta_modelo": "El alumno pasa por alto el requisito de imprevisibilidad. La Corte Suprema ha resuelto que la sequía no constituye en sí misma un caso fortuito, porque en períodos de escasez de recursos hídricos, frecuentes en nuestro país, es posible generar energía a niveles normales mediante otras vías (por ejemplo, sustituyendo con generación termoeléctrica). Un fenómeno recurrente y esperable en nuestra geografía no puede invocarse como imprevisto: falta el segundo de los tres requisitos clásicos del caso fortuito (ajenidad, imprevisibilidad e irresistibilidad). Que la sequía sea, en un sentido amplio, ajena a la voluntad de la empresa no basta: también debe ser imprevista, y un fenómeno que se repite periódicamente en el país no lo es.",
        "articulos_referencia": "45",
        "objetivo_pedagogico": "Evaluar si el alumno reconoce que la sola ajenidad de un hecho no basta para configurar caso fortuito, aplicando el criterio jurisprudencial sobre la sequía como fenómeno recurrente y no imprevisible.",
        "elementos_clave": [
            {"texto": "Identifica que al alumno le falta el requisito de imprevisibilidad, no le basta con la ajenidad", "keywords": ["imprevisibilidad", "no basta ajenidad"], "pregunta": "¿Qué requisito del caso fortuito pasa por alto el alumno?"},
            {"texto": "Cita el criterio jurisprudencial: la sequía no es caso fortuito por ser un fenómeno recurrente y esperable en el país", "keywords": ["sequía no es caso fortuito", "recurrente", "esperable"], "pregunta": "¿Qué ha dicho la jurisprudencia sobre la sequía específicamente?"},
            {"texto": "Explica que existen alternativas (generación termoeléctrica) que hacían evitable el incumplimiento", "keywords": ["generación termoeléctrica", "alternativas"], "pregunta": "¿Por qué la Corte descarta la sequía como caso fortuito en ese fallo?"},
        ],
    }],
    "justificacion": [{
        "id": "rc-just-016",
        "subtema": "Ajenidad del caso fortuito: el riesgo asumido por el propio deudor al contratar (ejemplo de Abeliuk)",
        "enunciado": "¿Por qué el ejemplo de ABELIUK del comerciante que vende mercadería que no tiene, y que luego no puede entregar por una fuerza mayor que le impide conseguirla, no constituye caso fortuito? Explica qué requisito falla y por qué.",
        "respuesta_modelo": "Falla el requisito de ajenidad (o inimputabilidad). El hecho ajeno exige que la circunstancia que impide el cumplimiento se encuentre fuera del ámbito de riesgos asumidos por el deudor en el contrato. En este ejemplo, el comerciante se comprometió a entregar mercadería que ni siquiera tenía disponible, contando con poder conseguirla a tiempo; el impedimento posterior (la fuerza mayor que le impidió traerla) no es, en rigor, ajeno a él, porque el riesgo de no poder conseguir a tiempo lo que prometió sin tenerlo ya es un riesgo que él mismo generó al comprometerse en esas condiciones. Como explica Abeliuk, es un caso de falta de previsión: el vendedor debió prever esa dificultad antes de obligarse. Por eso, aunque el evento final (la fuerza mayor) sea en sí mismo imprevisible e irresistible, el conjunto de la situación no configura caso fortuito, porque el origen del riesgo está en la propia conducta imprudente del deudor al contratar.",
        "articulos_referencia": "",
        "objetivo_pedagogico": "Evaluar si el alumno explica por qué la ajenidad no se mide en abstracto sino en función del contrato y los riesgos que el propio deudor asumió al obligarse.",
        "elementos_clave": [
            {"texto": "Identifica que falla el requisito de ajenidad (inimputabilidad)", "keywords": ["ajenidad", "inimputabilidad"], "pregunta": "¿Qué requisito del caso fortuito falla en este ejemplo?"},
            {"texto": "Explica que el riesgo de no conseguir la mercadería ya era un riesgo asumido por el comerciante al comprometerse sin tenerla", "keywords": ["riesgo asumido", "sin tenerla", "se comprometió"], "pregunta": "¿Por qué el impedimento no le es ajeno al comerciante?"},
            {"texto": "Señala que es un caso de falta de previsión: el vendedor debió prever esa dificultad antes de obligarse", "keywords": ["falta de previsión", "debió prever", "antes de obligarse"], "pregunta": "¿Cómo califica Abeliuk este caso?"},
        ],
    }],
}


def subir_eje10(token):
    return subir_lote(token, "10. El caso fortuito o fuerza mayor", EJE10_EVALUACION)


EJE12_EVALUACION = {
    "aplicacion": [{
        "id": "rc-aplic-018",
        "subtema": "Daño directo vs. indirecto en una cadena causal (art. 1558, ejemplo de las vacas de Pothier)",
        "caso": "Un agricultor compra semillas que el vendedor sabía que estaban en mal estado. Las semillas, al sembrarse, no germinan y arruinan la cosecha de ese año (el agricultor pierde lo que habría cosechado). Sin ingresos por la cosecha perdida, el agricultor no puede pagar el arriendo del campo, y el dueño del campo lo desaloja judicialmente, quedando sin domicilio ni actividad por varios meses.",
        "enunciado": "¿Qué parte de estos perjuicios puede cobrar el agricultor al vendedor de las semillas, conforme al art. 1558?",
        "respuesta_modelo": "Puede cobrar el daño directo: la pérdida de la cosecha que las semillas defectuosas no permitieron obtener, consecuencia inmediata y necesaria del incumplimiento. No puede cobrar, en cambio, el desalojo ni sus consecuencias posteriores (quedar sin domicilio ni actividad): esos perjuicios son daño indirecto, porque entre la venta de las semillas defectuosas y el desalojo se interponen otras causas independientes (la falta de pago del arriendo, la decisión del dueño del campo de desalojarlo), igual que en el ejemplo clásico de las vacas de Pothier, donde el comerciante que vendió una vaca enferma responde de los animales contagiados (daño directo) pero no de la ruina financiera final del comprador, encadenada pero remota. El artículo 1558 excluye los daños indirectos de la indemnización, incluso si hubiera mediado dolo del vendedor.",
        "articulos_referencia": "1558",
        "objetivo_pedagogico": "Evaluar si el alumno aplica la distinción entre daño directo e indirecto (art. 1558) a un caso nuevo con estructura de cadena causal, similar al ejemplo clásico de las vacas de Pothier.",
        "elementos_clave": [
            {"texto": "Identifica la pérdida de la cosecha como daño directo, consecuencia inmediata del incumplimiento", "keywords": ["daño directo", "pérdida de cosecha"], "pregunta": "¿Qué perjuicio es daño directo en este caso?"},
            {"texto": "Identifica el desalojo y sus consecuencias como daño indirecto, por interponerse otras causas", "keywords": ["daño indirecto", "otras causas se interponen"], "pregunta": "¿Y el desalojo, qué tipo de daño es?"},
            {"texto": "Concluye que el art. 1558 excluye los daños indirectos, incluso con dolo", "keywords": ["art. 1558", "excluye indirectos", "incluso con dolo"], "pregunta": "¿Se puede cobrar el daño indirecto aunque hubiera dolo del vendedor?"},
        ],
    }],
    "discriminacion_mc": [{
        "id": "rc-mc-015",
        "subtema": "Requisito de que el daño no esté ya reparado (compensatio lucri cum damno, subrogación del asegurador)",
        "caso": "Una empresa de transporte pierde en un incendio la mercadería que debía entregar a un cliente, incumpliendo el contrato de transporte. El cliente ya cobró el seguro de mercadería que había contratado por su cuenta, cubriendo el valor total de lo perdido, y además demanda a la empresa de transporte por el mismo monto.",
        "enunciado": "¿Puede el cliente cobrar la indemnización completa a la empresa de transporte, además de lo ya percibido del seguro?",
        "opciones": {
            "a": ("Sí, porque el seguro y la indemnización contractual son fuentes independientes y pueden acumularse sin límite",
                  "Error: el daño no puede ser indemnizado dos veces por el mismo hecho; el requisito de que el daño no esté ya reparado impide la doble reparación, sin perjuicio de la subrogación del asegurador."),
            "b": ("No, porque el daño ya fue reparado por el seguro, y uno de los requisitos del daño indemnizable es que no esté ya reparado o indemnizado; corresponde, en todo caso, la subrogación del asegurador",
                  "CORRECTO. Uno de los requisitos del daño indemnizable es que no haya sido ya satisfecho por otra vía; si el seguro ya cubrió el daño, no puede pretenderse doble reparación, sin perjuicio de que el asegurador se subrogue en los derechos del cliente contra la empresa de transporte."),
            "c": ("No, porque el contrato de seguro extingue por completo cualquier responsabilidad de la empresa de transporte frente al cliente",
                  "Error: el seguro no extingue la responsabilidad del deudor incumplidor; lo que ocurre es que el asegurador que ya pagó se subroga en la acción del cliente contra la empresa, no que la empresa quede liberada sin más."),
            "d": ("Sí, siempre que el cliente pruebe que el monto del seguro fue insuficiente para cubrir todo el perjuicio",
                  "Error: la pregunta plantea que el seguro cubrió el valor total de lo perdido, no un monto insuficiente; en ese supuesto no hay perjuicio adicional que cobrar directamente al cliente."),
        },
        "correcta": "B",
        "articulos_referencia": "",
        "objetivo_pedagogico": "Evaluar si el alumno reconoce el requisito de que el daño no esté ya reparado (compensatio lucri cum damno) y la figura de la subrogación del asegurador.",
    }],
}


def subir_eje12(token):
    return subir_lote(token, "12. Los perjuicios indemnizables", EJE12_EVALUACION)


EJE13_EVALUACION = {
    "aplicacion": [{
        "id": "rc-aplic-019",
        "subtema": "Avaluación legal de perjuicios en obligaciones de dinero (art. 1559)",
        "caso": "Pedro le presta a Juan $5.000.000 sin fijar interés alguno en el contrato. Juan debía devolver el dinero el 1 de marzo, pero no lo hace. Pedro demanda exigiendo, además del capital, una indemnización por el atraso, sin haber sufrido ningún perjuicio concreto que pueda acreditar más allá del simple no pago oportuno.",
        "enunciado": "¿Puede Pedro cobrar algo por el atraso, aunque no pruebe haber sufrido un perjuicio concreto? ¿Qué régimen se aplica y cuánto puede cobrar?",
        "respuesta_modelo": "Sí puede cobrar. Al tratarse de una obligación de dinero sin pacto de intereses, se aplica la avaluación legal del art. 1559: los perjuicios moratorios se presumen (regla 2ª), de modo que Pedro no necesita probar ningún perjuicio concreto, basta el retardo. Como nada se pactó para la mora, corresponden los intereses legales (que en Chile equivalen al interés corriente, art. 19 Ley 18.010), devengados desde que Juan quedó en mora. Esta es una excepción a la regla general de que el daño debe probarse (art. 1698): en las obligaciones de dinero, el solo retardo basta para que se devenguen los intereses.",
        "articulos_referencia": "1559",
        "objetivo_pedagogico": "Evaluar si el alumno aplica correctamente la avaluación legal del art. 1559 (perjuicios presumidos, intereses legales) a una obligación de dinero sin pacto de intereses.",
        "elementos_clave": [
            {"texto": "Identifica que se aplica la avaluación legal del art. 1559 por tratarse de una obligación de dinero", "keywords": ["avaluación legal", "art. 1559", "obligación de dinero"], "pregunta": "¿Qué régimen de avaluación se aplica en este caso?"},
            {"texto": "Explica que los perjuicios moratorios se presumen, no requieren prueba", "keywords": ["perjuicios se presumen", "no requiere prueba"], "pregunta": "¿Necesita Pedro probar un perjuicio concreto?"},
            {"texto": "Concluye que corresponden los intereses legales (equivalentes al corriente) por no haberse pactado nada", "keywords": ["intereses legales", "interés corriente"], "pregunta": "¿Cuánto puede cobrar entonces?"},
        ],
    }],
    "deteccion": [{
        "id": "rc-detect-016",
        "subtema": "La cláusula penal no requiere prueba de perjuicios (función de avaluación anticipada)",
        "caso": "Un alumno responde: \"Aunque exista una cláusula penal válidamente pactada, el acreedor igual debe probar que sufrió un perjuicio real y su monto, porque de lo contrario sería un enriquecimiento sin causa cobrar la pena sin daño efectivo.\"",
        "enunciado": "Identifica el error del alumno y explica la regla correcta.",
        "respuesta_modelo": "El alumno desconoce la función primaria de la cláusula penal: la avaluación anticipada de los perjuicios. Precisamente porque las partes ya liquidaron por adelantado el daño al pactar la pena, acreditados la obligación y el incumplimiento, el juez debe condenar al pago de la pena sin que el acreedor pruebe perjuicio alguno (art. 1542), y sin que el deudor pueda alegar que el incumplimiento no le causó daño o le causó uno menor. Esa es, justamente, la gran ventaja probatoria de la cláusula penal frente a la avaluación judicial ordinaria, que sí exige probar la existencia y el monto de los perjuicios. No hay enriquecimiento sin causa: la causa es el contrato mismo, en el que el deudor aceptó libremente esa avaluación anticipada al obligarse.",
        "articulos_referencia": "1542",
        "objetivo_pedagogico": "Evaluar si el alumno reconoce que la cláusula penal exime al acreedor de probar perjuicios, por su función de avaluación anticipada.",
        "elementos_clave": [
            {"texto": "Identifica que el alumno desconoce la función de avaluación anticipada de la cláusula penal", "keywords": ["avaluación anticipada", "función primaria"], "pregunta": "¿Qué función de la cláusula penal desconoce el alumno?"},
            {"texto": "Explica que basta acreditar obligación e incumplimiento, sin probar perjuicio alguno (art. 1542)", "keywords": ["sin probar perjuicio", "art. 1542"], "pregunta": "¿Qué debe acreditar el acreedor para cobrar la pena?"},
            {"texto": "Explica que esta es la ventaja probatoria de la cláusula penal frente a la avaluación judicial", "keywords": ["ventaja probatoria", "frente a avaluación judicial"], "pregunta": "¿Por qué es esto una ventaja para el acreedor?"},
        ],
    }],
    "justificacion": [{
        "id": "rc-just-017",
        "subtema": "Por qué no se acumulan la cláusula penal y la indemnización ordinaria (art. 1543)",
        "enunciado": "¿Por qué el acreedor no puede exigir conjuntamente la cláusula penal y la indemnización ordinaria de perjuicios, salvo pacto expreso? ¿Qué opción tiene entonces si los daños reales superan la pena pactada?",
        "respuesta_modelo": "Porque ambas vías cumplen la misma función: reparar el mismo daño derivado del incumplimiento. Permitir que el acreedor cobre las dos a la vez importaría hacerlo cobrar dos veces por un mismo perjuicio, un doble pago no justificado (art. 1543). Por eso el acreedor debe optar entre la pena, con la ventaja de no probar perjuicios pero con el riesgo de que su monto sea inferior al daño real, o la indemnización ordinaria, probando los perjuicios efectivos, que pueden ser mayores. Esto revela que la cláusula penal es una garantía para el acreedor, pero no limita la responsabilidad del deudor: si los daños reales superan la pena, el acreedor puede desentenderse de ella y demandar derechamente la indemnización ordinaria, para obtener la reparación completa del daño efectivamente sufrido.",
        "articulos_referencia": "1543",
        "objetivo_pedagogico": "Evaluar si el alumno explica por qué la cláusula penal y la indemnización ordinaria son alternativas, no acumulables, y qué opción le conviene al acreedor según el caso.",
        "elementos_clave": [
            {"texto": "Explica que ambas vías reparan el mismo daño, y acumularlas sería un doble pago", "keywords": ["mismo daño", "doble pago", "art. 1543"], "pregunta": "¿Por qué no se pueden acumular?"},
            {"texto": "Señala que el acreedor debe optar entre pena (sin probar perjuicio) o indemnización ordinaria (probando perjuicio real)", "keywords": ["debe optar", "sin probar", "probando"], "pregunta": "¿Qué opciones tiene entonces el acreedor?"},
            {"texto": "Explica que si el daño real supera la pena, el acreedor puede desentenderse de ella y cobrar la indemnización ordinaria", "keywords": ["daño supera la pena", "indemnización ordinaria"], "pregunta": "¿Qué le conviene hacer si el daño real es mayor que la pena?"},
        ],
    }],
    "discriminacion_mc": [{
        "id": "rc-mc-016",
        "subtema": "Derecho alternativo del acreedor tras la mora: exigir la obligación principal o la pena (art. 1537)",
        "caso": "Un contratista se obliga a construir una bodega, con una cláusula penal de $10.000.000 para el caso de incumplimiento. Vencido el plazo sin que la obra esté terminada, el contratista queda constituido en mora.",
        "enunciado": "¿Qué puede hacer el dueño de la obra frente al contratista moroso?",
        "opciones": {
            "a": ("Debe exigir primero el cumplimiento forzado de la obligación principal, y solo si eso fracasa, cobrar la pena",
                  "Error: el art. 1537 no exige ese orden; constituido el deudor en mora, el acreedor adquiere un derecho alternativo, puede optar directamente por una u otra, sin necesidad de intentar primero el cumplimiento."),
            "b": ("Puede demandar, a su arbitrio, la obligación principal o la pena, pero no ambas a la vez salvo pacto expreso",
                  "CORRECTO. Constituido en mora el deudor, el acreedor adquiere un derecho alternativo (art. 1537): puede optar por demandar la obligación principal o la pena, pero no acumular ambas, salvo que se haya pactado expresamente que el pago de la pena no extingue la obligación principal."),
            "c": ("Solo puede cobrar la pena, porque una vez pactada cláusula penal, ya no puede exigirse el cumplimiento de la obligación principal",
                  "Error: el pacto de la cláusula penal no elimina la posibilidad de exigir el cumplimiento; el acreedor conserva la opción entre ambas vías, la pena es una alternativa, no un reemplazo forzoso."),
            "d": ("Puede exigir ambas cosas simultáneamente, porque la pena es independiente de la obligación principal y no requiere ninguna coordinación con ella",
                  "Error: por regla general no se acumulan la obligación principal y la pena (art. 1537), salvo las excepciones expresas de pena moratoria o pacto de no extinción."),
        },
        "correcta": "B",
        "articulos_referencia": "1537",
        "objetivo_pedagogico": "Evaluar si el alumno aplica correctamente el derecho alternativo del acreedor (art. 1537) entre exigir la obligación principal o la pena, una vez constituido el deudor en mora.",
    }],
}


def subir_eje13(token):
    return subir_lote(token, "13. Avaluación de perjuicios y cláusula penal", EJE13_EVALUACION)


# --- Borrado de Flashcards redundantes del eje 6 (auditoria 2026-07-31,
# corregida contra la regla de redundancia de la seccion 0.3: se
# restauraron 13 ids que la primera pasada iba a borrar por error --
# eran la unica version "abstracta" de un hecho cuya unica contraparte
# conservada era un caso concreto, lo que la seccion 0.3 dice
# explicitamente que no es redundancia. Lista final aprobada por Laura,
# 50 ids, ver conversacion 2026-07-31. ---

EJE6_IDS_A_BORRAR = [
    1, 11, 37, 186,
    45, 49, 62, 160,
    15, 109,
    132, 141,
    10, 58, 211,
    51, 100,
    5, 88,
    23, 92, 59,
    7, 12, 32, 191, 222,
    8, 72, 34, 82,
    44,
    83,
    93,
    142,
    84,
    200,
    203,
    25, 138, 156,
    110, 157, 163, 105,
    190, 182, 166,
    22,
    170,
]


def borrar_redundantes_eje6(token, supabase_key):
    print(f"=== Borrando {len(EJE6_IDS_A_BORRAR)} Flashcards redundantes del eje 6 ===")
    if not supabase_key:
        raise SystemExit("Falta SUPABASE_SECRET_KEY en .env")

    # id (Supabase) -> airtable_id, leido en vivo de Supabase (mas confiable
    # que fiarse del CSV de ayer, que puede haber quedado desactualizado
    # tras el relink de la Parte A).
    ids_str = ",".join(str(i) for i in EJE6_IDS_A_BORRAR)
    url = f"{SUPABASE_URL}/rest/v1/flashcards?select=id,airtable_id&id=in.({ids_str})"
    req = urllib.request.Request(url, headers={
        "apikey": supabase_key, "Authorization": f"Bearer {supabase_key}",
    })
    with urllib.request.urlopen(req) as resp:
        filas = json.load(resp)
    id_a_airtable = {f["id"]: f["airtable_id"] for f in filas}

    faltantes = [i for i in EJE6_IDS_A_BORRAR if i not in id_a_airtable]
    if faltantes:
        print(f"  AVISO: {len(faltantes)} ids no encontrados en Supabase: {faltantes}")

    # 1. Borrar en Airtable (fuente real).
    airtable_ids = list(id_a_airtable.values())
    ok_airtable, fallidos_airtable = 0, []
    for i in range(0, len(airtable_ids), 10):
        chunk = airtable_ids[i:i + 10]
        params = "&".join(f"records[]={rid}" for rid in chunk)
        url = f"https://api.airtable.com/v0/{CONTRACTUAL_BASE}/Flashcards?{params}"
        req = urllib.request.Request(url, method="DELETE", headers={"Authorization": f"Bearer {token}"})
        try:
            with urllib.request.urlopen(req) as resp:
                json.load(resp)
            ok_airtable += len(chunk)
        except urllib.error.HTTPError as e:
            print(f"  ERROR Airtable lote {i}: {e.code} {e.read().decode('utf-8', 'replace')}")
            fallidos_airtable.extend(chunk)
    print(f"  Airtable: {ok_airtable} borrados, {len(fallidos_airtable)} fallidos")

    # 2. Borrar en Supabase (no se revierte solo con el sync: el gotcha
    # documentado es que el sync nunca borra en Supabase lo que se borra
    # en Airtable).
    ok_supabase = 0
    supabase_ids = list(id_a_airtable.keys())
    for i in range(0, len(supabase_ids), 20):
        chunk = supabase_ids[i:i + 20]
        ids_chunk_str = ",".join(str(x) for x in chunk)
        url = f"{SUPABASE_URL}/rest/v1/flashcards?id=in.({ids_chunk_str})"
        req = urllib.request.Request(url, method="DELETE", headers={
            "apikey": supabase_key, "Authorization": f"Bearer {supabase_key}",
            "Prefer": "return=minimal",
        })
        try:
            with urllib.request.urlopen(req):
                pass
            ok_supabase += len(chunk)
        except urllib.error.HTTPError as e:
            print(f"  ERROR Supabase lote {i}: {e.code} {e.read().decode('utf-8', 'replace')}")
    print(f"  Supabase: {ok_supabase} borrados")

    print(f"Total: {ok_airtable} en Airtable, {ok_supabase} en Supabase, {len(faltantes)} no encontrados")
    return ok_airtable, ok_supabase


def main():
    if len(sys.argv) < 2:
        raise SystemExit(__doc__)
    accion = sys.argv[1]
    token, supabase_key = cargar_env()

    if accion == "relink-evaluacion":
        relink_evaluacion(token)
    elif accion == "relink-flashcards":
        relink_flashcards(token)
    elif accion == "subir-eje5":
        subir_eje5(token)
    elif accion == "subir-eje3":
        subir_eje3(token)
    elif accion == "subir-eje7":
        subir_eje7(token)
    elif accion == "subir-eje4":
        subir_eje4(token)
    elif accion == "subir-eje9":
        subir_eje9(token)
    elif accion == "subir-eje6":
        subir_eje6(token)
    elif accion == "subir-eje8":
        subir_eje8(token)
    elif accion == "subir-eje10":
        subir_eje10(token)
    elif accion == "subir-eje12":
        subir_eje12(token)
    elif accion == "subir-eje13":
        subir_eje13(token)
    elif accion == "borrar-redundantes-eje6":
        borrar_redundantes_eje6(token, supabase_key)
    elif accion == "todo":
        relink_evaluacion(token)
        print()
        relink_flashcards(token)
        print()
        subir_eje5(token)
    else:
        raise SystemExit(f"Accion desconocida: {accion}\n\n{__doc__}")


if __name__ == "__main__":
    main()
