"""Acceso mínimo a las bases de Airtable de Acto Jurídico (token del .env del repo principal).

Desde el 2026-10-10 AJ usa tres bases, para no topar el límite de 1.000 registros por base:
- BASE: "Digesto Acto Jurídico" (Temas, Flashcards, Conexiones).
- BASES_EVAL: la Evaluación (Aplicación, Detección de error, Justificación, Discriminación MC),
  partida por capítulo del manual: temas 1 a 17 (caps. I a III) y temas 18 a 29 (caps. IV a VI).
  Cada una tiene su propia tabla Temas con los mismos nombres.
"""
import json, os, time, urllib.parse, urllib.request
AQUI = os.path.dirname(os.path.abspath(__file__))
BASE = 'appBDWY3eCXgxBGpL'
BASES_EVAL = {'I-III': 'apps4GBOUCo8c5JV6', 'IV-VI': 'appjmtz9O5CARhCYe'}
TABLAS_EVAL = ('Aplicación', 'Detección de error', 'Justificación', 'Discriminación MC')


def base_eval(numero_tema):
    """Base de Evaluación que corresponde a un tema del catálogo (1 a 29)."""
    return BASES_EVAL['I-III'] if numero_tema <= 17 else BASES_EVAL['IV-VI']
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


def todos(tabla, base=BASE):
    out, off = [], None
    while True:
        d = req('GET', f'https://api.airtable.com/v0/{base}/{urllib.parse.quote(tabla)}?pageSize=100' + (f'&offset={off}' if off else ''))
        out += d['records']; off = d.get('offset')
        if not off: return out
