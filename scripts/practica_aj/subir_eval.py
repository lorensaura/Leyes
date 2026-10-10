"""Revisa y, con --subir, carga a Airtable una tanda de Evaluación de Acto Jurídico
(Aplicación, Detección de error, Justificación o Discriminación MC).

Uso: python3 scripts/practica_aj/subir_eval.py lote_aplic1 [--subir | --actualizar]

El lote es un módulo de esta carpeta con TABLA, PREFIJO e ITEMS (ver lote_aplic1.py).
Controles, todos obligatorios antes de subir:
- subtema existente en el catálogo (scripts/aj_temas_subtemas.json);
- cero guiones largos y comillas angulares en todos los campos;
- cada artículo citado (caso, enunciado, respuesta, elementos, articulos) y cada autor
  en mayúsculas aparece en alguna de las secciones del manual indicadas como respaldo;
- entre 3 y 4 elementos clave, cada uno con 4 a 6 keywords;
- keywords pensadas para la corrección flexible de la app (docs/prompts-practica/
  elementos-clave.md): de 1 a 4 palabras con significado, sin repetirse entre
  elementos, sin que la corrección flexible las encuentre ya en el caso, el enunciado
  o la repregunta (`pregunta`) de su propio elemento; avisa (sin bloquear) de las de
  una sola palabra que no es un número;
- la respuesta modelo obtiene todos los elementos con la corrección de la app
  (keywordPresente(), copiada en scripts/prueba_correccion_flexible.py);
- enunciado + caso no repetidos respecto de lo que ya está en la tabla.
Sin --subir solo revisa y deja generado/filas_<lote>.json para el informe.
Con --subir, y cero problemas, carga sin publicar y en Revisar.
Con --actualizar, reescribe en Airtable los ítems del lote ya cargados (los reconoce
por caso + enunciado y conserva su id); sirve para corregir keywords o textos.
"""
import importlib, json, os, re, sys, unicodedata
AQUI = os.path.dirname(os.path.abspath(__file__))
REPO = os.path.dirname(os.path.dirname(AQUI))
GEN = os.path.join(AQUI, 'generado') + '/'
sys.path.insert(0, AQUI)
sys.path.insert(0, os.path.join(REPO, 'scripts'))
from airtable_aj import req, todos, BASES_EVAL, base_eval  # noqa: E402
from prueba_correccion_flexible import flexible, palabras  # noqa: E402
import urllib.parse  # noqa: E402

LOTE = next(a for a in sys.argv[1:] if a.startswith('lote_'))
m = importlib.import_module(LOTE)
cat = json.load(open(os.path.join(REPO, 'scripts', 'aj_temas_subtemas.json'), encoding='utf-8'))
sub = {s['codigo']: (s['nombre'], t['nombre'], t['numero']) for t in cat['temas'] for s in t['subtemas']}

# Texto del manual por sección, con la misma convención de códigos que verificar_respaldo.py
manual = open(GEN + 'manual.txt', encoding='utf-8').read().split('\n')
cod = []; h1 = h2l = h2n = h3 = ''
for l in manual:
    mm = re.match(r'^(#{1,3}) (.*)', l)
    if mm:
        niv, t = len(mm.group(1)), mm.group(2)
        if niv == 1: h1 = t.split('.')[0]; h2l = h2n = h3 = ''
        elif niv == 2:
            if re.match(r'^[A-G]\. ', t): h2l = t[0]; h2n = h3 = ''
            elif re.match(r'^[A-G]\.\d', t): h2l = t.split()[0]; h2n = h3 = ''
            else: h2n = t.split('.')[0]; h3 = ''
        else: h3 = t.split('.')[1] if '.' in t else ''
    cod.append('.'.join(x for x in [h1, h2l, h2n] if x) + ('.' + h3 if h3 else ''))
def seccion(base):
    return '\n'.join(l for c, l in zip(cod, manual) if c == base or c.startswith(base + '.'))

def n(s):
    s = unicodedata.normalize('NFD', s.lower())
    return re.sub(r'[^a-z0-9 ]', '', ''.join(c for c in s if unicodedata.category(c) != 'Mn'))

def quitar_tildes(s):
    return ''.join(c for c in unicodedata.normalize('NFD', s.lower()) if unicodedata.category(c) != 'Mn')

def articulos_citados(texto):
    """Números de artículo citados con 'art.' o 'arts.', sin incisos ni numerales."""
    nums = set()
    for frag in re.findall(r'\barts?\. ([^():;"]+)', texto):
        frag = re.split(r'\.\s', frag)[0]
        frag = re.sub(r'inc\. (\d+[°º]?|final)', '', frag)
        frag = re.sub(r'N[º°] ?\d+', '', frag)
        nums.update(re.findall(r'\b\d{1,4}\b', frag))
    return nums

# La Evaluación de AJ vive en dos bases, por capítulo (ver airtable_aj.py): se leen las dos,
# los ids siguen un solo correlativo, y cada ítem va a la base de su tema.
existentes = [(b, r) for b in BASES_EVAL.values() for r in todos(m.TABLA, b)]
ACTUALIZAR = '--actualizar' in sys.argv
ya = {n(r['fields'].get('caso', '') + r['fields'].get('enunciado', '')): r for _, r in existentes}
ids = [r['fields'].get('id') for _, r in existentes if r['fields'].get('id')]
siguiente = max([int(i.split('-')[-1]) for i in ids] or [0]) + 1
temas = {b: {r['fields']['nombre']: r['id'] for r in todos('Temas', b)} for b in BASES_EVAL.values()}

problemas, avisos, filas = [], [], []
for it in m.ITEMS:
    clave = n(it['caso'] + it['enunciado'])
    previo = ya.get(clave)
    if ACTUALIZAR and previo:
        iid = previo['fields']['id']
    else:
        iid = f'{m.PREFIJO}-{siguiente:03d}'; siguiente += 1
    if it['sub'] not in sub:
        problemas.append(f'{iid}: subtema {it["sub"]} no existe'); continue
    elementos = [dict(texto=t, keywords=k, pregunta=p) for t, k, p in it['elementos']]
    todo = ' '.join([it['caso'], it['enunciado'], it['respuesta'], it['objetivo']] +
                    [e['texto'] + ' ' + e['pregunta'] + ' ' + ' '.join(e['keywords']) for e in elementos])
    if re.search('[—–«»]', todo): problemas.append(f'{iid}: guion largo o comillas angulares')
    respaldo = '\n'.join(seccion(s) for s in it['respaldo'])
    for s in it['respaldo']:
        if not seccion(s): problemas.append(f'{iid}: sección {s} no encontrada en el manual')
    citados = articulos_citados(todo) | set(re.findall(r'\b\d{1,4}\b', re.sub(r'N[º°] ?\d+|inc\. \S+', '', it['articulos'])))
    for a in sorted(citados):
        if not re.search(r'\b' + a + r'\b', respaldo): problemas.append(f'{iid}: art. {a} no está en su respaldo {it["respaldo"]}')
    for autor in re.findall(r'\b([A-ZÁÉÍÓÚÑ]{4,}(?: [A-ZÁÉÍÓÚÑ]{4,})*)\b', todo):
        if autor not in ('COT',) and autor not in respaldo: problemas.append(f'{iid}: autor {autor} no está en su respaldo')
    if not 3 <= len(elementos) <= 4: problemas.append(f'{iid}: {len(elementos)} elementos clave')
    vistos = set()
    for e in elementos:
        if not 4 <= len(e['keywords']) <= 6: problemas.append(f'{iid}: elemento con {len(e["keywords"])} keywords: {e["texto"][:40]}')
        for k in e['keywords']:
            if k != n(k): problemas.append(f'{iid}: keyword con tildes o signos: {k}')
            if k in vistos: problemas.append(f'{iid}: keyword repetida entre elementos: {k}')
            vistos.add(k)
            pal = palabras(k)
            if len(pal) > 4: problemas.append(f'{iid}: keyword de más de 4 palabras con significado (vuelve a ser frase exacta): {k}')
            if len(pal) == 1 and not pal[0].isdigit(): avisos.append(f'{iid}: keyword de una sola palabra, revisar que pruebe el elemento: {k}')
            # una keyword que la corrección ya encuentra en la pregunta la "obtiene" cualquier respuesta que la repita
            if flexible(k, it['caso'] + ' ' + it['enunciado']):
                problemas.append(f'{iid}: keyword ya presente en el caso o el enunciado: {k}')
            if flexible(k, e['pregunta']):
                problemas.append(f'{iid}: keyword presente en la repregunta de su elemento (la regala): {k}')
        # misma corrección que la app (keywordPresente en app/alternativas.html)
        if not any(flexible(k, it['respuesta']) for k in e['keywords']):
            problemas.append(f'{iid}: la respuesta modelo no obtiene el elemento "{e["texto"][:50]}"')
    if previo and not ACTUALIZAR: problemas.append(f'{iid}: ya existe en Airtable (usar --actualizar para corregirlo)')
    if ACTUALIZAR and not previo: problemas.append(f'{iid}: --actualizar, pero no está en Airtable')
    nombre_sub, nombre_tema, numero_tema = sub[it['sub']]
    filas.append(dict(id=iid, codigo=it['sub'], subtema=nombre_sub, tema=nombre_tema, base=base_eval(numero_tema), caso=it['caso'],
                      enunciado=it['enunciado'], respuesta_modelo=it['respuesta'], elementos_clave=elementos,
                      articulos_referencia=it['articulos'], objetivo_pedagogico=it['objetivo'], respaldo=it['respaldo']))

json.dump(filas, open(f'{GEN}filas_{LOTE}.json', 'w'), ensure_ascii=False, indent=1)
print(f'{len(filas)} ítems ({m.TABLA}), ids {filas[0]["id"]} a {filas[-1]["id"]}')
print('problemas:', problemas or 'ninguno')
for a in avisos: print('aviso:', a)
if problemas or not ('--subir' in sys.argv or ACTUALIZAR):
    sys.exit(1 if problemas else 0)
por_base = {b: [f for f in filas if f['base'] == b] for b in BASES_EVAL.values()}
if ACTUALIZAR:
    for b, fs in por_base.items():
        for i in range(0, len(fs), 10):
            req('PATCH', f'https://api.airtable.com/v0/{b}/{urllib.parse.quote(m.TABLA)}', {'records': [{
                'id': ya[n(f['caso'] + f['enunciado'])]['id'], 'fields': {
                'subtema': f['subtema'], 'respuesta_modelo': f['respuesta_modelo'],
                'elementos_clave': json.dumps(f['elementos_clave'], ensure_ascii=False),
                'articulos_referencia': f['articulos_referencia'], 'objetivo_pedagogico': f['objetivo_pedagogico']}}
                for f in fs[i:i + 10]]})
    print('actualizados en Airtable:', len(filas))
    sys.exit(0)
for b, fs in por_base.items():
    for i in range(0, len(fs), 10):
        req('POST', f'https://api.airtable.com/v0/{b}/{urllib.parse.quote(m.TABLA)}', {'records': [{'fields': {
            'id': f['id'], 'tema': [temas[b][f['tema']]], 'subtema': f['subtema'], 'caso': f['caso'], 'enunciado': f['enunciado'],
            'respuesta_modelo': f['respuesta_modelo'], 'elementos_clave': json.dumps(f['elementos_clave'], ensure_ascii=False),
            'articulos_referencia': f['articulos_referencia'], 'objetivo_pedagogico': f['objetivo_pedagogico'],
            'publicado': False, 'Revision_status': 'Revisar'}} for f in fs[i:i + 10]]})
print('cargados en Airtable:', len(filas), '| total en la tabla ahora:', sum(len(todos(m.TABLA, b)) for b in BASES_EVAL.values()))
