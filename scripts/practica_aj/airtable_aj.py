"""Acceso mínimo a la base de Airtable de Acto Jurídico (token del .env del repo principal)."""
import json, os, time, urllib.parse, urllib.request
AQUI = os.path.dirname(os.path.abspath(__file__))
BASE = 'appBDWY3eCXgxBGpL'
_dir = os.path.dirname(os.path.dirname(AQUI))
# En una worktree el .env vive en la raíz del repo principal: se busca hacia arriba.
while not os.path.exists(os.path.join(_dir, '.env')) and _dir != '/':
    _dir = os.path.dirname(_dir)
_env = {}
for l in open(os.path.join(_dir, '.env'), encoding='utf-8'):
    l = l.strip()
    if '=' in l and not l.startswith('#'):
        k, v = l.split('=', 1); _env[k.strip()] = v.strip().strip('"').strip("'")
TOKEN = _env['AIRTABLE_TOKEN']


def req(method, url, body=None):
    r = urllib.request.Request(url, method=method, data=json.dumps(body).encode() if body is not None else None,
                               headers={'Authorization': 'Bearer ' + TOKEN, 'Content-Type': 'application/json'})
    time.sleep(0.25)
    return json.load(urllib.request.urlopen(r))


def todos(tabla):
    out, off = [], None
    while True:
        d = req('GET', f'https://api.airtable.com/v0/{BASE}/{urllib.parse.quote(tabla)}?pageSize=100' + (f'&offset={off}' if off else ''))
        out += d['records']; off = d.get('offset')
        if not off: return out
