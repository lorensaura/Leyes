import os as _os
AQUI = _os.path.dirname(_os.path.abspath(__file__))
REPO = _os.path.dirname(_os.path.dirname(AQUI))
GEN = _os.path.join(AQUI, 'generado') + '/'
import json, re, sys, html, time, urllib.request, unicodedata
sys.path.insert(0, AQUI)
import importlib
LOTE = next((a for a in sys.argv[1:] if a.startswith('lote_')), 'lote_fc')
_m = importlib.import_module(LOTE)
NO_CONFUNDIR, NUEVAS = _m.NO_CONFUNDIR, _m.NUEVAS
cat = json.load(open(REPO + '/scripts/aj_temas_subtemas.json'))
sub = {s['codigo']: (s['nombre'], t['nombre']) for t in cat['temas'] for s in t['subtemas']}
manual = open(GEN + 'manual.txt', encoding='utf-8').read()
env = {}
# El .env vive en la raíz del repo principal: en una worktree, se busca hacia arriba.
_dir = REPO
while not _os.path.exists(_os.path.join(_dir, '.env')) and _dir != '/':
    _dir = _os.path.dirname(_dir)
for l in open(_os.path.join(_dir, '.env')):
    l = l.strip()
    if '=' in l and not l.startswith('#'):
        k, v = l.split('=', 1); env[k] = v.strip().strip('"').strip("'")
T = env['AIRTABLE_TOKEN']; BASE = 'appBDWY3eCXgxBGpL'
def req(method, url, body=None):
    r = urllib.request.Request(url, method=method, data=json.dumps(body).encode() if body is not None else None,
                               headers={'Authorization': 'Bearer ' + T, 'Content-Type': 'application/json'})
    time.sleep(0.25)
    return json.load(urllib.request.urlopen(r))
def todos(tabla):
    out, off = [], None
    while True:
        d = req('GET', f'https://api.airtable.com/v0/{BASE}/{urllib.parse.quote(tabla)}?pageSize=100' + (f'&offset={off}' if off else ''))
        out += d['records']; off = d.get('offset')
        if not off: return out
import urllib.parse
def n(s):
    s = unicodedata.normalize('NFD', s.lower()); return re.sub(r'[^a-z0-9 ]', '', ''.join(c for c in s if unicodedata.category(c) != 'Mn'))

existentes = todos('Flashcards')
ya_preg = {n(r['fields'].get('pregunta', '')) for r in existentes}
ya_ids = {r['fields'].get('id') for r in existentes}
siguiente = max(int(i.split('-')[-1]) for i in ya_ids if i) + 1
temas = {r['fields']['nombre']: r['id'] for r in todos('Temas')}

problemas = []; filas = []
for grupo in (NO_CONFUNDIR, NUEVAS):
    for (sc, tipo, dif, preg, resp, respaldo) in grupo:
        iid = f'aj-fc-{siguiente:03d}'; siguiente += 1
        if sc not in sub: problemas.append(f'{iid}: subtema {sc} no existe')
        for campo in (preg, resp):
            if '—' in campo or '–' in campo or '«' in campo or '»' in campo: problemas.append(f'{iid}: guion largo o comillas angulares')
            for tag in re.findall(r'<(\w+)', campo):
                if tag not in ('b', 'i', 'em', 'strong', 'u', 'span'): problemas.append(f'{iid}: etiqueta {tag}')
        # cada artículo citado debe aparecer en el manual
        for a in re.findall(r'arts?\. ([^<]+)</span>', preg + resp):
            for num in re.findall(r'\d{1,4}', a.split(' C.')[0].split(' Ley')[0]):
                if not re.search(r'\b' + num + r'\b', manual): problemas.append(f'{iid}: art. {num} no aparece en el manual')
        if dif not in ('basica', 'intermedia', 'avanzada'): problemas.append(f'{iid}: dificultad')
        if n(preg) in ya_preg: problemas.append(f'{iid}: pregunta duplicada')
        ya_preg.add(n(preg))
        nombre_sub, nombre_tema = sub[sc]
        filas.append(dict(id=iid, subtema=nombre_sub, tema=nombre_tema, tipo=tipo, dificultad=dif, pregunta=preg, respuesta=resp, respaldo=respaldo, codigo=sc))
print('tarjetas:', len(filas), 'problemas:', problemas or 'ninguno')
SALIDA = f'{GEN}filas_{LOTE}.json'
json.dump(filas, open(SALIDA, 'w'), ensure_ascii=False, indent=1)
import subprocess
v = subprocess.run(['python3', _os.path.join(AQUI, 'verificar_respaldo.py'), SALIDA], capture_output=True, text=True).stdout
print(v.strip())
if ' 0 citas fuera' not in v: problemas.append('verificación de respaldo con fallos')
if problemas or '--subir' not in sys.argv:
    sys.exit()
creadas = 0
for i in range(0, len(filas), 10):
    req('POST', f'https://api.airtable.com/v0/{BASE}/{urllib.parse.quote("Flashcards")}', {'records': [{'fields': {
        'id': f['id'], 'tema': [temas[f['tema']]], 'subtema': f['subtema'], 'tipo': f['tipo'], 'dificultad': f['dificultad'],
        'pregunta': f['pregunta'], 'respuesta': f['respuesta'], 'publicado': False, 'Revision_status': 'Revisar'}} for f in filas[i:i + 10]]})
    creadas += len(filas[i:i + 10])
print('creadas en Airtable:', creadas, '| total Flashcards ahora:', len(todos('Flashcards')))
