"""Verifica, tarjeta por tarjeta, que cada artículo citado aparezca en la
sección del manual indicada como respaldo (no solo en cualquier parte)."""
import os as _os
AQUI = _os.path.dirname(_os.path.abspath(__file__))
REPO = _os.path.dirname(_os.path.dirname(AQUI))
GEN = _os.path.join(AQUI, 'generado') + '/'

import json, re, sys
manual = open(GEN + 'manual.txt', encoding='utf-8').read().split('\n')
# Código de sección para cada línea: I / II.A / II.A.5 / II.A.5.3
cod = []; h1 = h2l = h2n = h3 = ''
for l in manual:
    m = re.match(r'^(#{1,3}) (.*)', l)
    if m:
        niv, t = len(m.group(1)), m.group(2)
        if niv == 1: h1 = t.split('.')[0]; h2l = h2n = h3 = ''
        elif niv == 2:
            if re.match(r'^[A-G]\. ', t): h2l = t[0]; h2n = h3 = ''
            elif re.match(r'^[A-G]\.\d', t): h2l = t.split()[0]; h2n = h3 = ''  # B.1, B.2 de la nulidad
            else: h2n = t.split('.')[0]; h3 = ''
        else: h3 = t.split('.')[1] if '.' in t else ''
    c = '.'.join(x for x in [h1, h2l, h2n] if x) + ('.' + h3 if h3 else '')
    cod.append(c)
def rango(base):
    lin = [l for c, l in zip(cod, manual) if c == base or c.startswith(base + '.')]
    return '\n'.join(lin)
archivo = sys.argv[1] if len(sys.argv) > 1 else GEN + 'filas.json'
filas = json.load(open(archivo))
fallos = []
for f in filas:
    base = re.match(r'([IVX]+(?:\.[A-G](?:\.\d)?)?(?:\.\d+)?(?:\.\d+)?)', f['respaldo']).group(1)
    texto = rango(base)
    # secciones adicionales del mismo respaldo ("7.6 y 7.7")
    for extra in re.findall(r'(?:y|,) (\d+\.\d+)', f['respaldo']):
        texto += rango(base.rsplit('.', 2)[0] + '.' + extra)
    if not texto: fallos.append((f['id'], base, 'sección no encontrada')); continue
    for a in re.findall(r'arts?\. ([^<]+)</span>', f['pregunta'] + f['respuesta']):
        for num in re.findall(r'\d{1,4}', re.split(r' C\.| Ley| inc| Nº| regla', a)[0]):
            if not re.search(r'\b' + num + r'\b', texto):
                fallos.append((f['id'], base, 'art. ' + num))
    for autor in re.findall(r'<b>([A-ZÁÉÍÓÚÑ]{3,}(?: [A-ZÁÉÍÓÚÑ]{3,})*)</b>', f['pregunta'] + f['respuesta']):
        if autor not in texto:
            fallos.append((f['id'], base, 'autor ' + autor))
print(len(filas), 'tarjetas revisadas;', len(fallos), 'citas fuera de su sección')
for x in fallos: print('  ', x)
