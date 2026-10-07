"""Extrae del manual: (1) los 23 recuadros No confundir completos y
(2) el texto plano de cada sección h1/h2/h3, con marcas de recuadro, para leer por tramos."""
import os as _os
AQUI = _os.path.dirname(_os.path.abspath(__file__))
REPO = _os.path.dirname(_os.path.dirname(AQUI))
GEN = _os.path.join(AQUI, 'generado') + '/'

import re, html, sys
M = REPO + '/04_Acto_Juridico_Manual.html'
OUT = GEN + ''
s = open(M, encoding='utf-8').read()
cl = lambda x: ' '.join(html.unescape(re.sub('<[^>]+>', ' ', x)).split())
# 1. No confundir: desde <div class="callout"> hasta su cierre balanceado
nc = []
for m in re.finditer(r'<div class="callout"[^>]*>', s):
    i = m.end(); depth = 1
    while depth:
        a = s.find('<div', i); b = s.find('</div>', i)
        if a != -1 and a < b: depth += 1; i = a + 4
        else: depth -= 1; i = b + 6
    nc.append(cl(s[m.start():i]))
open(OUT + 'no_confundir.txt', 'w').write('\n\n'.join(f'[{n}] {t}' for n, t in enumerate(nc, 1)))
# 2. Texto por bloques (párrafos, enumeraciones, recuadros) con encabezados
body = s[s.find('<h1'):]
body = re.sub(r'<(script|style)[^>]*>.*?</\1>', '', body, flags=re.S)
body = re.sub(r'<h([1-3])[^>]*>(.*?)</h\1>', lambda m: '\n\n' + '#' * int(m.group(1)) + ' ' + cl(m.group(2)) + '\n', body, flags=re.S)
body = re.sub(r'<(div|span) class="(caja-tipo|caja-titulo)"[^>]*>(.*?)</\1>', lambda m: '\n[' + cl(m.group(3)) + '] ', body, flags=re.S)
body = re.sub(r'<span class="enum-[iac][^"]*">', '\n', body)
body = re.sub(r'<(p|li|tr|br)[^>]*>', '\n', body)
txt = html.unescape(re.sub('<[^>]+>', '', body))
txt = re.sub(r'[ \t ]+', ' ', txt); txt = re.sub(r'\n\s*\n+', '\n', txt)
open(OUT + 'manual.txt', 'w').write(txt)
print(len(nc), 'recuadros;', len(txt), 'caracteres de texto')
