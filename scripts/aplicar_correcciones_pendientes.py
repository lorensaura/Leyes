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
