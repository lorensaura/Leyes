"""Arma el informe de la revisión de las Flashcards de AJ contra el manual.
Lee generado/revision_fc.json (de revisar_fc.py) y correcciones_revision.py.
Comprueba que cada texto actual a corregir exista tal cual en Airtable.
Uso: python3 informe_revision.py"""
import os, json, html, re, collections
from correcciones_revision import CORRECCIONES, CITAS
AQUI = os.path.dirname(os.path.abspath(__file__))
E = html.escape
filas = {x['id']: x for x in json.load(open(os.path.join(AQUI, 'generado', 'revision_fc.json')))}
for (i, nivel, prob, campo, viejo, nuevo) in CORRECCIONES:
    assert viejo in filas[i][campo], f'{i}: el texto actual no está en Airtable'
    if i in CITAS:  # la cita del manual debe estar literal (salvo los [...])
        manual = open(os.path.join(AQUI, 'generado', 'manual.txt'), encoding='utf-8').read().replace('."', '. "')
        for trozo in CITAS[i].split('[...]'):
            assert trozo.strip(' .:') in manual, f'{i}: cita no literal: {trozo[:60]}'
    nuevo_txt = filas[i][campo].replace(viejo, nuevo)
    assert chr(0x2014) not in nuevo_txt and chr(0xab) not in nuevo_txt, i

NOMBRE_LOTE = {'sin lote (2026-09-28)': ('1', 'Cap. I, primeras tarjetas (2026-09-28)'),
    'lote_fc': ('2', 'No confundir + Cap. I y II.A'), 'lote_fc3': ('3', 'Capacidad y objeto'),
    'lote_fc4': ('4', 'Objeto ilícito y causa'), 'lote_fc5': ('5', 'Formalidades y efectos'),
    'lote_fc6': ('6', 'Ineficacia e inexistencia'), 'lote_fc7': ('7', 'Nulidad'),
    'lote_fc8': ('8', 'Ratificación y efectos de la nulidad'),
    'lote_fc9': ('9', 'Lesión, simulación, inoponibilidad, fraude, otras'),
    'lote_fc10': ('10', 'Representación y modalidades')}
por_lote = collections.OrderedDict((k, [0, 0]) for k in NOMBRE_LOTE)
con_hallazgo = {c[0] for c in CORRECCIONES}
for x in filas.values():
    por_lote[x['lote']][0] += 1
    if x['id'] in con_hallazgo: por_lote[x['lote']][1] += 1
cuenta = collections.Counter(c[1] for c in CORRECCIONES)

def mostrar(t):  # deja ver el formato real de la tarjeta
    return t
def resaltar(texto, trozo, clase):
    return mostrar(texto).replace(trozo, f'<mark class="{clase}">{trozo}</mark>')
ETIQ = {'fondo': 'Corregir: dato que no calza', 'precision': 'Precisar: va más allá del manual', 'forma': 'Forma o redacción'}
bloques = ''
for nivel in ('fondo', 'precision', 'forma'):
    items = [c for c in CORRECCIONES if c[1] == nivel]
    bloques += f'<h2>{ETIQ[nivel]} ({len(items)})</h2>'
    for (i, _, prob, campo, viejo, nuevo) in items:
        f = filas[i]
        actual = f[campo]; propuesto = actual.replace(viejo, nuevo)
        otro = 'respuesta' if campo == 'pregunta' else 'pregunta'
        bloques += (f"<article class='{nivel}'><div class='meta'>{i} · lote {NOMBRE_LOTE[f['lote']][0]} · {E(f['subtema'])}</div>"
                    f"<p class='prob'>{E(prob)}</p>"
                    + (f"<p class='cita'><span class='lab'>Lo que dice el manual</span><br>{E(CITAS[i])}</p>" if i in CITAS else '')
                    + (f"<p class='q'>{f['pregunta']}</p>" if campo == 'respuesta' else '')
                    + f"<div class='par'><div><span class='lab'>Hoy ({campo})</span><p>{resaltar(actual, viejo, 'del')}</p></div>"
                    f"<div><span class='lab'>Propuesta</span><p>{resaltar(propuesto, nuevo, 'ins')}</p></div></div></article>")

tabla = ''.join(f"<tr><td>{NOMBRE_LOTE[k][0]}</td><td>{E(NOMBRE_LOTE[k][1])}</td><td>{v[0]}</td><td>{v[1] or '<span class=ok>ninguna</span>'}</td></tr>"
                for k, v in por_lote.items())
doc = f"""<!doctype html><html lang="es"><head><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1">
<title>Revisión Flashcards AJ</title><style>
:root{{--bg:#FAF8F5;--fg:#1d1d1f;--mut:#6b6b70;--line:#e3ded6;--acc:#C41E2E;--card:#fff;--del:#fde2e2;--ins:#dff3e4;--warn:#b26a00;--ok:#2e7d32}}
@media (prefers-color-scheme:dark){{:root:not([data-theme="light"]){{--bg:#17171a;--fg:#ececef;--mut:#a0a0a8;--line:#34343a;--card:#202024;--acc:#ff6b78;--del:#4a2326;--ins:#1f3b27;--warn:#f0b35a;--ok:#7bd88f}}}}
:root[data-theme="dark"]{{--bg:#17171a;--fg:#ececef;--mut:#a0a0a8;--line:#34343a;--card:#202024;--acc:#ff6b78;--del:#4a2326;--ins:#1f3b27;--warn:#f0b35a;--ok:#7bd88f}}
body{{background:var(--bg);color:var(--fg);font:16px/1.55 Georgia,serif;margin:0;padding:24px 16px 80px}} main{{max-width:900px;margin:0 auto}}
h1{{font-size:1.6rem;margin:0 0 6px}} h2{{font-size:1.25rem;border-bottom:2px solid var(--acc);padding-bottom:4px;margin-top:40px}}
.intro,.nota{{font:.95rem/1.55 system-ui;color:var(--mut)}} .intro b{{color:var(--fg)}}
.resumen{{display:flex;gap:12px;flex-wrap:wrap;margin:18px 0}} .resumen div{{flex:1 1 150px;background:var(--card);border:1px solid var(--line);border-radius:8px;padding:10px 14px;font:.85rem system-ui;color:var(--mut)}}
.resumen b{{display:block;font:700 1.6rem system-ui;color:var(--fg)}}
table{{width:100%;border-collapse:collapse;font:.9rem system-ui}} td,th{{border-bottom:1px solid var(--line);padding:6px 8px;text-align:left}} th{{color:var(--mut);font-weight:600}}
.ok{{color:var(--ok)}}
article{{background:var(--card);border:1px solid var(--line);border-left:4px solid var(--mut);border-radius:8px;padding:12px 16px;margin:12px 0}}
article.fondo{{border-left-color:var(--acc)}} article.precision{{border-left-color:var(--warn)}}
.meta{{font:.75rem system-ui;color:var(--mut)}} .prob{{font:600 .95rem/1.5 system-ui;margin:6px 0}} .q{{font-weight:700;margin:6px 0}}
.par{{display:grid;grid-template-columns:1fr 1fr;gap:12px}} @media (max-width:640px){{.par{{grid-template-columns:1fr}}}}
.par p{{margin:4px 0}} .lab{{font:600 .72rem system-ui;text-transform:uppercase;letter-spacing:.04em;color:var(--mut)}}
p.cita{{font-size:.93rem;background:var(--bg);border-radius:6px;padding:8px 12px;margin:8px 0}} mark.del{{background:var(--del);color:inherit}} mark.ins{{background:var(--ins);color:inherit}} .art{{font-weight:600}}
</style></head><body><main>
<h1>Revisión de las Flashcards de Acto Jurídico</h1>
<p class="intro">Se leyeron las <b>{len(filas)} Flashcards</b> que hoy están en Airtable, una por una, contra el texto actual del manual (incluidos los ejemplos nuevos de error de II.A.5.3). Criterios: los del revisor de <code>digesto-revision</code> (¿calza con el manual?, ¿hay alucinaciones?, ¿es de la materia?) y la regla anti-alucinación del prompt de Práctica: cada artículo, autor, fallo y cita debe estar en el manual, y ninguna tarjeta puede afirmar algo que el manual no dice.</p>
<div class="resumen"><div><b>0</b>artículos, autores o fallos inventados</div><div><b>{cuenta['fondo']}</b>datos que no calzan con el manual</div><div><b>{cuenta['precision']}</b>afirmaciones más amplias que el manual</div><div><b>{cuenta['forma']}</b>detalles de forma o redacción</div></div>
<p class="intro">Ninguna tarjeta trae contenido fuera del manual ni de otra materia. De las 269 que tienen archivo de lote, ninguna se editó en Airtable después de subirla; las 22 primeras no tienen archivo con qué compararlas. Las correcciones de abajo son propuestas: <b>no se cambió nada en Airtable</b>. Si las apruebas, se aplican todas de una vez y quedan en Revisar como el resto.</p>
<h2>Resultado por lote</h2><table><tr><th>Lote</th><th>Contenido</th><th>Tarjetas</th><th>Con algo que corregir</th></tr>{tabla}</table>
{bloques}
<h2>Cómo se hizo</h2><p class="nota">1) Un script bajó las {len(filas)} tarjetas de Airtable, las cruzó con los archivos de cada lote y comprobó que cada artículo y autor citado esté en la sección del manual que la respalda, que cada frase entre comillas esté literal en el manual y que los artículos y autores tengan su formato. 2) Después se leyó cada tarjeta junto al pasaje del manual que la respalda (las 22 primeras, que no tienen pasaje anotado, se buscaron a mano en el Capítulo I) y se marcó todo lo que el manual no dice o dice distinto.</p>
</main></body></html>"""
assert chr(0x2014) not in doc
dest = '/Users/lorensaura/Desktop/DERECHO LIBRE/Informes/Informe_AJ_revision_flashcards.html'
open(dest, 'w', encoding='utf-8').write(doc)
print('ok', dest, dict(cuenta))
