"""Prepara la revisión de las Flashcards de AJ contra el manual (sin escribir en Airtable).

Baja de Airtable todas las Flashcards, las cruza con los lotes (para saber su
respaldo), avisa si alguna fue editada en Airtable después de subirla, y corre
controles mecánicos que verificar_respaldo.py no cubre:
  - cada fragmento entre comillas debe estar literal en su sección del manual;
  - números de artículo escritos fuera de <span class="art">;
  - apellidos de autores del manual escritos sin negrita y mayúscula.
Deja en generado/revision_fc.json cada tarjeta con el texto de su sección,
para la lectura de fondo (que la hace una persona o Claude, no el script).

Uso: python3 revisar_fc.py
"""
import glob, json, re, os, time, unicodedata, urllib.request, urllib.parse
AQUI = os.path.dirname(os.path.abspath(__file__))
GEN = os.path.join(AQUI, 'generado') + '/'
env, _dir = {}, AQUI
while not os.path.exists(os.path.join(_dir, '.env')) and _dir != '/':
    _dir = os.path.dirname(_dir)
for l in open(os.path.join(_dir, '.env')):
    l = l.strip()
    if '=' in l and not l.startswith('#'):
        k, v = l.split('=', 1); env[k] = v.strip().strip('"').strip("'")
BASE = 'appBDWY3eCXgxBGpL'
def todos(tabla):
    out, off = [], None
    while True:
        url = f'https://api.airtable.com/v0/{BASE}/{urllib.parse.quote(tabla)}?pageSize=100' + (f'&offset={off}' if off else '')
        r = urllib.request.Request(url, headers={'Authorization': 'Bearer ' + env['AIRTABLE_TOKEN']})
        d = json.load(urllib.request.urlopen(r)); time.sleep(0.25)
        out += d['records']; off = d.get('offset')
        if not off: return out

# Mismo código de sección por línea que verificar_respaldo.py
manual = open(GEN + 'manual.txt', encoding='utf-8').read().split('\n')
cod = []; h1 = h2l = h2n = h3 = ''
for l in manual:
    m = re.match(r'^(#{1,3}) (.*)', l)
    if m:
        niv, t = len(m.group(1)), m.group(2)
        if niv == 1: h1 = t.split('.')[0]; h2l = h2n = h3 = ''
        elif niv == 2:
            if re.match(r'^[A-G]\. ', t): h2l = t[0]; h2n = h3 = ''
            elif re.match(r'^[A-G]\.\d', t): h2l = t.split()[0]; h2n = h3 = ''
            else: h2n = t.split('.')[0]; h3 = ''
        else: h3 = t.split('.')[1] if '.' in t else ''
    cod.append('.'.join(x for x in [h1, h2l, h2n] if x) + ('.' + h3 if h3 else ''))
def rango(base):
    return '\n'.join(l for c, l in zip(cod, manual) if c == base or c.startswith(base + '.'))

def plano(t):
    return re.sub(r'\s+', ' ', re.sub(r'<[^>]+>', '', t)).strip()

def norm(t):
    t = unicodedata.normalize('NFC', plano(t)).replace('“', '"').replace('”', '"')
    return t.lower()

lotes = {}
for f in sorted(glob.glob(os.path.join(AQUI, 'generado', 'filas_lote_fc*.json'))):
    nombre = os.path.basename(f)[6:-5]
    for c in json.load(open(f)):
        c['lote'] = nombre
        lotes[plano(c['pregunta'])] = c  # por texto: filas_lote_fc6.json quedó con ids corridos

AUTORES = sorted({a for c in lotes.values() for a in re.findall(r'<b>([A-ZÁÉÍÓÚÑ]{3,}(?: [A-ZÁÉÍÓÚÑ]{3,})*)</b>', c['pregunta'] + c['respuesta'])})

salida, avisos = [], []
for r in sorted(todos('Flashcards'), key=lambda r: r['fields'].get('id', '')):
    f = r['fields']; i = f.get('id', '')
    c = lotes.get(plano(f.get('pregunta', '')))
    item = {'id': i, 'pregunta': f.get('pregunta', ''), 'respuesta': f.get('respuesta', ''),
            'subtema': f.get('subtema', ''), 'publicado': f.get('publicado', False),
            'estado': f.get('Revision_status'), 'respaldo': c['respaldo'] if c else None,
            'lote': c['lote'] if c else 'sin lote (2026-09-28)', 'problemas': []}
    if c and (plano(c['pregunta']) != plano(item['pregunta']) or plano(c['respuesta']) != plano(item['respuesta'])):
        item['problemas'].append('editada en Airtable (distinta del lote)')
    texto = ''
    if c:
        base = re.match(r'([IVX]+(?:\.[A-G](?:\.\d)?)?(?:\.\d+)?(?:\.\d+)?)', c['respaldo']).group(1)
        texto = rango(base)
        for extra in re.findall(r'(?:y|,) (\d+\.\d+)', c['respaldo']):
            texto += '\n' + rango(base.rsplit('.', 2)[0] + '.' + extra)
    item['seccion'] = texto
    cuerpo = item['pregunta'] + ' ' + item['respuesta']
    if texto:
        nt = norm(texto)
        for q in re.findall(r'"([^"]{12,})"', plano(item['respuesta']).replace('“', '"').replace('”', '"')):
            if norm(q).strip(' .,;') not in nt:
                item['problemas'].append('cita entre comillas no literal: "' + q[:80] + '"')
    fuera = re.sub(r'<span class="art">.*?</span>', '', cuerpo)
    if re.search(r'\barts?\.\s*\d', plano(fuera)):
        item['problemas'].append('artículo fuera de <span class="art">')
    for a in AUTORES:
        ap = a.split()[-1].capitalize()
        if re.search(r'\b' + ap + r'\b', plano(cuerpo)) and a not in cuerpo:
            item['problemas'].append('autor sin formato: ' + ap)
    salida.append(item)

json.dump(salida, open(os.path.join(AQUI, 'generado', 'revision_fc.json'), 'w'), ensure_ascii=False, indent=1)
print(len(salida), 'tarjetas en Airtable;', sum(1 for x in salida if x['respaldo']), 'con lote')
for x in salida:
    for p in x['problemas']:
        print(' ', x['id'], '|', p)
