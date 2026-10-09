"""Aplica en Airtable las correcciones aprobadas de correcciones_revision.py.
Solo cambia el campo indicado (pregunta o respuesta); no toca publicado ni
Revision_status. Si el texto actual ya no está, no aplica esa corrección.
Además actualiza los lote_fcN.py y generado/filas_lote_fc*.json para que
sigan cuadrando con Airtable (el cruce se hace por el texto de la pregunta).
Uso: python3 aplicar_correcciones.py            (muestra qué haría)
     python3 aplicar_correcciones.py --aplicar  (escribe en Airtable)"""
import glob, json, os, re, sys, time, urllib.request, urllib.parse
from correcciones_revision import CORRECCIONES
AQUI = os.path.dirname(os.path.abspath(__file__))
env, _dir = {}, AQUI
while not os.path.exists(os.path.join(_dir, '.env')) and _dir != '/':
    _dir = os.path.dirname(_dir)
for l in open(os.path.join(_dir, '.env')):
    l = l.strip()
    if '=' in l and not l.startswith('#'):
        k, v = l.split('=', 1); env[k] = v.strip().strip('"').strip("'")
BASE, TABLA = 'appBDWY3eCXgxBGpL', 'Flashcards'
URL = f'https://api.airtable.com/v0/{BASE}/{urllib.parse.quote(TABLA)}'
def req(method, url, body=None):
    r = urllib.request.Request(url, method=method, data=json.dumps(body).encode() if body is not None else None,
                               headers={'Authorization': 'Bearer ' + env['AIRTABLE_TOKEN'], 'Content-Type': 'application/json'})
    time.sleep(0.25)
    return json.load(urllib.request.urlopen(r))
recs, off = [], None
while True:
    d = req('GET', URL + '?pageSize=100' + (f'&offset={off}' if off else ''))
    recs += d['records']; off = d.get('offset')
    if not off: break
por_id = {r['fields'].get('id'): r for r in recs}

cambios = []
for (i, nivel, prob, campo, viejo, nuevo) in CORRECCIONES:
    actual = por_id[i]['fields'].get(campo, '')
    if viejo not in actual:
        print('YA APLICADA O CAMBIADA, se omite:', i); continue
    cambios.append((i, campo, viejo, nuevo, actual, actual.replace(viejo, nuevo)))
    print(f'{i} [{nivel}] {campo}: ...{viejo[:50]}... -> ...{nuevo[:50]}...')
if '--aplicar' not in sys.argv:
    sys.exit(print(len(cambios), 'cambios listos; nada escrito (usar --aplicar)'))

for k in range(0, len(cambios), 10):
    req('PATCH', URL, {'records': [{'id': por_id[i]['id'], 'fields': {campo: nuevo_txt}}
                                   for (i, campo, _, _, _, nuevo_txt) in cambios[k:k + 10]]})
print('aplicadas en Airtable:', len(cambios))

# Mantener los lotes al día. En generado/ el texto es HTML; en lote_fcN.py
# los artículos se escriben con A()/AS(), así que se cambia lo que calce
# literal y se avisa lo que no.
plano = lambda t: re.sub(r'\s+', ' ', re.sub(r'<[^>]+>', '', t)).strip()
for f in glob.glob(os.path.join(AQUI, 'generado', 'filas_lote_fc*.json')):
    filas = json.load(open(f)); tocado = False
    for fila in filas:
        for (i, campo, viejo, nuevo, actual, _) in cambios:
            if plano(fila['pregunta']) == plano(por_id[i]['fields']['pregunta']) and viejo in fila[campo]:
                fila[campo] = fila[campo].replace(viejo, nuevo); tocado = True
    if tocado: json.dump(filas, open(f, 'w'), ensure_ascii=False, indent=1)
for f in glob.glob(os.path.join(AQUI, 'lote_fc*.py')):
    s = open(f, encoding='utf-8').read(); s0 = s
    for (i, campo, viejo, nuevo, _, _) in cambios:
        if viejo in s: s = s.replace(viejo, nuevo)
    if s != s0: open(f, 'w', encoding='utf-8').write(s); print('lote actualizado:', os.path.basename(f))
