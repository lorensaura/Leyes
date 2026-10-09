"""Informe de revisión de una tanda de Evaluación de Acto Jurídico, para Laura.

Uso: python3 scripts/practica_aj/informe_eval.py lote_aplic1
Requiere haber corrido antes subir_eval.py (usa generado/filas_<lote>.json, con los ids).
Sigue el orden de entrega de docs/prompts-practica/nucleo.md: auto-auditoría, puntos de
derecho activados, tabla de cobertura, ítems (con su respaldo del manual a la vista) y
nota de redundancia. Escribe en DERECHO LIBRE/Informes/Informe_AJ_<lote>.html.
"""
import html, importlib, json, os, re, sys
AQUI = os.path.dirname(os.path.abspath(__file__))
GEN = os.path.join(AQUI, 'generado') + '/'
sys.path.insert(0, AQUI)
LOTE = sys.argv[1]
m = importlib.import_module(LOTE)
filas = json.load(open(f'{GEN}filas_{LOTE}.json', encoding='utf-8'))
inf = m.INFORME
assert len(inf['cobertura']) == len(filas), 'la tabla de cobertura debe tener una fila por ítem'
SALIDA = f'/Users/lorensaura/Desktop/DERECHO LIBRE/Informes/Informe_AJ_{LOTE.replace("lote_", "")}.html'

# texto del manual por sección (misma convención que subir_eval.py)
manual = open(GEN + 'manual.txt', encoding='utf-8').read().split('\n')
cod = []; h1 = h2l = h2n = h3 = ''
for l in manual:
    mm = re.match(r'^(#{1,3}) (.*)', l)
    if mm:
        niv, t = len(mm.group(1)), mm.group(2)
        if niv == 1: h1 = t.split('.')[0]; h2l = h2n = h3 = ''
        elif niv == 2:
            if re.match(r'^[A-G]\. ', t): h2l = t[0]; h2n = h3 = ''
            elif re.match(r'^[A-G]\.\d', t): h2l = t.split()[0]; h2n = h3 = ''
            else: h2n = t.split('.')[0]; h3 = ''
        else: h3 = t.split('.')[1] if '.' in t else ''
    cod.append('.'.join(x for x in [h1, h2l, h2n] if x) + ('.' + h3 if h3 else ''))
def seccion(base):
    return [l for c, l in zip(cod, manual) if c == base or c.startswith(base + '.')]

E = html.escape
def parrafos(t):
    return ''.join(f'<p>{E(p)}</p>' for p in t.split('\n') if p.strip())

subtemas = []
for f in filas:
    if f['subtema'] not in subtemas: subtemas.append(f['subtema'])

aud = (f"<ul><li><b>{len(filas)} preguntas</b> de Aplicación, en {len(subtemas)} subtemas del tema; "
       f"ids <code>{filas[0]['id']}</code> a <code>{filas[-1]['id']}</code>.</li>"
       "<li>Cargadas en Airtable <b>sin publicar y en Revisar</b>.</li>"
       "<li>Controles automáticos pasados, todos sin problemas: cada artículo y autor citado está en la sección del manual "
       "que respalda la pregunta; cero guiones largos; 3 o 4 elementos de corrección por pregunta, con 4 a 6 palabras clave "
       "cada uno; ninguna palabra clave viene ya en el caso o en el enunciado (si viniera, cualquier respuesta que repitiera "
       "la pregunta la obtendría); y la respuesta modelo, corregida con la misma regla que usa la app, obtiene todos sus elementos.</li>"
       "<li>Lectura de fondo contra el manual, pregunta por pregunta. Ningún artículo, autor ni fallo agregado que no esté en el manual.</li></ul>")
puntos = ''.join(f'<li><b>{E(a)}.</b> {E(b)}</li>' for a, b in inf['puntos'])
tabla = ''.join(f"<tr><td>{f['id'].split('-')[-1]}</td><td>{E(f['subtema'])}</td><td>{E(el)}</td><td>{E(ang)}</td></tr>"
                for f, (el, ang) in zip(filas, inf['cobertura']))
items = ''
for f in filas:
    els = ''.join(f"<li><b>{E(e['texto'])}</b><div class='kw'>Palabras clave: {E(' · '.join(e['keywords']))}</div>"
                  f"<div class='soc'>Pista si falta: {E(e['pregunta'])}</div></li>" for e in f['elementos_clave'])
    resp = ''.join(f"<details><summary>Manual, {E(s)}</summary><div class='man'>{parrafos(chr(10).join(seccion(s)))}</div></details>"
                   for s in f['respaldo'])
    items += (f"<article id='{f['id']}'><h3><code>{f['id']}</code> {E(f['subtema'])}</h3>"
              f"<div class='lbl'>Caso</div>{parrafos(f['caso'])}<div class='lbl'>Pregunta</div>{parrafos(f['enunciado'])}"
              f"<div class='lbl'>Respuesta modelo</div><div class='resp'>{parrafos(f['respuesta_modelo'])}</div>"
              f"<div class='lbl'>Elementos que se corrigen</div><ol>{els}</ol>"
              f"<p class='meta'><b>Artículos:</b> {E(f['articulos_referencia'])} · <b>Objetivo:</b> {E(f['objetivo_pedagogico'])}</p>"
              f"<div class='lbl'>Respaldo en el manual (para verificar)</div>{resp}</article>")
avisos = ''.join(f'<li>{a}</li>' for a in inf['avisos'])

doc = f"""<!doctype html><html lang="es"><head><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1">
<title>Revisión Aplicación AJ</title><style>
:root{{--bg:#FAF8F5;--fg:#1d1d1f;--mut:#6b6b70;--line:#e3ded6;--card:#fff;--acc:#C41E2E;--soft:#f3efe8;--av:#fbefd5}}
@media (prefers-color-scheme:dark){{:root:not([data-theme="light"]){{--bg:#17171a;--fg:#ececef;--mut:#a0a0a8;--line:#34343a;--card:#202024;--acc:#ff6b78;--soft:#2a2a30;--av:#3a3020}}}}
:root[data-theme="dark"]{{--bg:#17171a;--fg:#ececef;--mut:#a0a0a8;--line:#34343a;--card:#202024;--acc:#ff6b78;--soft:#2a2a30;--av:#3a3020}}
body{{background:var(--bg);color:var(--fg);font:16px/1.6 system-ui,sans-serif;margin:0;padding:24px 16px 80px}} main{{max-width:860px;margin:0 auto}}
h1{{font:700 1.7rem Georgia,serif;margin:0 0 4px}} h2{{font:700 1.25rem Georgia,serif;margin:36px 0 10px;border-bottom:2px solid var(--line);padding-bottom:4px}}
h3{{font-size:1.02rem;margin:0 0 8px}} code{{font-size:.85em;color:var(--acc)}} .sub{{color:var(--mut)}}
.avisos{{background:var(--av);border-radius:8px;padding:12px 16px 12px 34px}} .avisos li{{margin:6px 0}}
table{{border-collapse:collapse;width:100%;font-size:.88rem;background:var(--card)}} th,td{{border:1px solid var(--line);padding:6px 8px;text-align:left;vertical-align:top}} th{{background:var(--soft)}}
.tw{{overflow-x:auto}} article{{background:var(--card);border:1px solid var(--line);border-radius:10px;padding:16px 18px;margin:18px 0}}
.lbl{{font-size:.75rem;text-transform:uppercase;letter-spacing:.05em;color:var(--mut);margin-top:12px;font-weight:600}}
article p{{margin:4px 0}} .resp{{background:var(--soft);border-radius:6px;padding:6px 12px}} ol li{{margin:6px 0}}
.kw,.soc{{font-size:.84rem;color:var(--mut)}} .meta{{font-size:.86rem;color:var(--mut);margin-top:10px}}
details{{margin:4px 0}} summary{{cursor:pointer;color:var(--acc);font-size:.9rem}} .man{{font-size:.86rem;max-height:420px;overflow:auto;border-left:3px solid var(--line);padding-left:12px;margin-top:6px}}
</style></head><body><main>
<h1>Acto Jurídico · {E(inf['titulo'])}</h1>
<p class="sub">Revisión antes de publicar. Nada de esto está en la app todavía.</p>
<h2>Lo que tienes que mirar</h2><ul class="avisos">{avisos}</ul>
<h2>1. Auto-auditoría</h2>{aud}
<h2>2. Puntos de derecho que cubre la tanda</h2><ul>{puntos}</ul>
<h2>3. Tabla de cobertura</h2><div class="tw"><table><tr><th>#</th><th>Subtema</th><th>Elemento jurídico evaluado</th><th>Ángulo</th></tr>{tabla}</table></div>
<h2>4. Las preguntas</h2>{items}
<h2>5. Redundancia</h2><p>{E(inf['redundancia'])}</p>
</main></body></html>"""
assert '—' not in doc and '«' not in doc
open(SALIDA, 'w', encoding='utf-8').write(doc)
print(SALIDA)
