"""Publica en Airtable las Flashcards de AJ aprobadas por Laura: marca
publicado = true y Revision_status = Verificado. No toca el texto.
Después hay que correr scripts/sync_airtable_supabase.py para que lleguen a la app.
Uso: python3 publicar_fc.py            (muestra cuántas publicaría)
     python3 publicar_fc.py --aplicar  (escribe en Airtable)"""
import json, os, sys, time, urllib.request, urllib.parse
AQUI = os.path.dirname(os.path.abspath(__file__))
env, _dir = {}, AQUI
while not os.path.exists(os.path.join(_dir, '.env')) and _dir != '/':
    _dir = os.path.dirname(_dir)
for l in open(os.path.join(_dir, '.env')):
    l = l.strip()
    if '=' in l and not l.startswith('#'):
        k, v = l.split('=', 1); env[k] = v.strip().strip('"').strip("'")
URL = 'https://api.airtable.com/v0/appBDWY3eCXgxBGpL/' + urllib.parse.quote('Flashcards')
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
pend = [r for r in recs if not r['fields'].get('publicado') or r['fields'].get('Revision_status') != 'Verificado']
print(len(recs), 'Flashcards en la base;', len(pend), 'por publicar')
if '--aplicar' not in sys.argv:
    sys.exit()
for k in range(0, len(pend), 10):
    req('PATCH', URL, {'records': [{'id': r['id'], 'fields': {'publicado': True, 'Revision_status': 'Verificado'}}
                                   for r in pend[k:k + 10]]})
print('publicadas en Airtable:', len(pend))
