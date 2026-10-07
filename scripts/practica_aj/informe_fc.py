import os as _os
AQUI = _os.path.dirname(_os.path.abspath(__file__))
REPO = _os.path.dirname(_os.path.dirname(AQUI))
GEN = _os.path.join(AQUI, 'generado') + '/'
import json, html
import sys
LOTE, NUM, DESC = sys.argv[1], sys.argv[2], sys.argv[3]
filas = json.load(open(f'{GEN}filas_{LOTE}.json'))
cat = json.load(open(REPO + '/scripts/aj_temas_subtemas.json'))
E = html.escape
orden = [(t, s) for t in cat['temas'] for s in t['subtemas']]
nc = [f for f in filas if f['tipo'] == 'No confundir']
nuevas = [f for f in filas if f['tipo'] != 'No confundir']
def tarjeta(f):
    return (f"<article><div class='meta'>{f['id']} · {E(f['tipo'])} · {f['dificultad']} · <span class='resp'>respaldo: {E(f['respaldo'])}</span></div>"
            f"<p class='q'>{E(f['pregunta']).replace('&lt;span class=&quot;art&quot;&gt;', '').replace('&lt;/span&gt;', '')}</p><p class='a'>{f['respuesta']}</p></article>")
def bloque(lista):
    out = ''
    for t, s in orden:
        fs = [f for f in lista if f['codigo'] == s['codigo']]
        if not fs: continue
        out += f"<h3>{t['numero']}. {E(t['nombre'])} <span class='sub'>· {E(s['nombre'])}</span></h3>" + ''.join(tarjeta(f) for f in fs)
    return out
doc = f"""<!doctype html><html lang="es"><head><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1">
<title>Flashcards AJ lote {NUM}</title><style>
:root{{--bg:#FAF8F5;--fg:#1d1d1f;--mut:#6b6b70;--line:#e3ded6;--acc:#C41E2E;--card:#fff}}
@media (prefers-color-scheme:dark){{:root:not([data-theme="light"]){{--bg:#17171a;--fg:#ececef;--mut:#a0a0a8;--line:#34343a;--card:#202024;--acc:#ff6b78}}}}
:root[data-theme="dark"]{{--bg:#17171a;--fg:#ececef;--mut:#a0a0a8;--line:#34343a;--card:#202024;--acc:#ff6b78}}
body{{background:var(--bg);color:var(--fg);font:16px/1.55 Georgia,serif;margin:0;padding:24px 16px 80px}} main{{max-width:820px;margin:0 auto}}
h1{{font-size:1.6rem;margin:0 0 6px}} h2{{font-size:1.25rem;border-bottom:2px solid var(--acc);padding-bottom:4px;margin-top:40px}}
h3{{font:600 1rem system-ui;margin:26px 0 6px}} .sub{{color:var(--mut);font-weight:500}} .intro{{font:.93rem system-ui;color:var(--mut)}}
article{{background:var(--card);border:1px solid var(--line);border-radius:8px;padding:12px 16px;margin:8px 0}}
.meta{{font:.74rem system-ui;color:var(--mut);margin-bottom:4px}} .q{{font-weight:700;margin:4px 0}} .a{{margin:4px 0}} .art{{font-weight:600}}
</style></head><body><main>
<h1>Flashcards de Acto Jurídico: lote {NUM}</h1>
<p class="intro">{len(filas)} flashcards nuevas, {E(DESC)}, todas en Airtable (base Digesto Acto Jurídico, tabla Flashcards) <b>sin publicar y marcadas Revisar</b>, cada una ligada a su tema y con su subtema. Todos los subtemas de estos temas quedan con al menos una flashcard. Cada tarjeta indica el pasaje del manual que la respalda; un script verificó que cada artículo y autor citado aparezca en esa misma sección.</p>
{(f'<h2>Recuadros "No confundir" ({len(nc)})</h2>' + bloque(nc)) if nc else ''}
<h2>Flashcards ({len(nuevas)})</h2>{bloque(nuevas)}
</main></body></html>"""
assert '—' not in doc
open(f'/Users/lorensaura/Desktop/DERECHO LIBRE/Informes/Informe_AJ_flashcards_lote{NUM}.html', 'w', encoding='utf-8').write(doc)
print('ok')
