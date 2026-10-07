"""Tablero de cobertura de Práctica de Acto Jurídico, por tema y subtema.

Cuenta en vivo cuántas preguntas tiene Digesto en cada uno de los 29 temas
y 132 subtemas de `scripts/aj_temas_subtemas.json` (catálogo armado el
2026-10-07 a partir del índice del manual y de 81 exámenes de grado
reales), y lo cruza con la relevancia de cada tema en esos exámenes.

Fuentes que cuenta:
- Airtable, base `Digesto Acto Jurídico`: Aplicación, Detección de error,
  Justificación, Discriminación MC y Flashcards, por el texto del campo
  `subtema` (debe ser exactamente el nombre del subtema del catálogo).
- Supabase `alternativas` (materia acto_juridico), por `subtema`, más las
  Alternativas que estén en `scripts/alternativas_acto_juridico_*.sql`
  y todavía no se hayan cargado (cuentan como borrador).
- Memorice (artículos y definiciones): por id, según el mapa `memorice`
  del catálogo; incluye las definiciones en SQL sin correr.
- Recuadros "No confundir" del manual (lista `no_confundir` del
  catálogo): por decisión de Laura, cada uno se convirtió en Flashcard
  (2026-10-07, aj-fc-023 a 045); la columna los muestra como referencia.

Escribe el tablero en `docs/preguntas-acto-juridico.md` (entre las
marcas `<!-- tablero:inicio -->` y `<!-- tablero:fin -->`) y en el
informe `DERECHO LIBRE/Informes/Informe_AJ_relevancia_temas.html`.

Uso: python3 scripts/tablero_cobertura_aj.py
"""
import collections, glob, html, json, re, urllib.parse, urllib.request
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
CAT = json.loads((ROOT / 'scripts' / 'aj_temas_subtemas.json').read_text(encoding='utf-8'))
DOC = ROOT / 'docs' / 'preguntas-acto-juridico.md'
INFORME = Path('/Users/lorensaura/Desktop/DERECHO LIBRE/Informes/Informe_AJ_relevancia_temas.html')
BASE = 'appBDWY3eCXgxBGpL'
TABLAS = {'A': 'Aplicación', 'D': 'Detección de error', 'J': 'Justificación', 'M': 'Discriminación MC', 'FC': 'Flashcards'}
SUPABASE = 'https://byyukzhxhtopojgvgglp.supabase.co/rest/v1/'
COLS = ['A', 'D', 'J', 'M', 'ALT', 'FC', 'NC', 'MEM']
TITULOS = {'A': 'Aplicación', 'D': 'Detección de error', 'J': 'Justificación', 'M': 'Discr. MC', 'ALT': 'Alternativas',
           'FC': 'Flashcards', 'NC': 'Recuadros No confundir (ya incluidos en Flashcards)', 'MEM': 'Memorice'}


def env():
    v = {}
    # En una worktree el .env vive en la raíz del repo principal: se busca hacia arriba.
    archivo = next(p / '.env' for p in [ROOT, *ROOT.parents] if (p / '.env').exists())
    for l in archivo.read_text(encoding='utf-8').splitlines():
        if '=' in l and not l.strip().startswith('#'):
            k, x = l.split('=', 1); v[k.strip()] = x.strip().strip('"').strip("'")
    return v


def get(url, headers):
    with urllib.request.urlopen(urllib.request.Request(url, headers=headers)) as r:
        return json.load(r)


def airtable(token, tabla):
    out, off = [], None
    while True:
        u = f'https://api.airtable.com/v0/{BASE}/{urllib.parse.quote(tabla)}?pageSize=100' + (f'&offset={off}' if off else '')
        d = get(u, {'Authorization': 'Bearer ' + token})
        out += d['records']; off = d.get('offset')
        if not off: return out


def nivel(pct):
    return 'Alta' if pct >= 25 else ('Media' if pct >= 10 else 'Baja')


def contar():
    e = env()
    por_nombre = {s['nombre']: s['codigo'] for t in CAT['temas'] for s in t['subtemas']}
    c = collections.defaultdict(collections.Counter)
    sin_subtema = []
    for col, tabla in TABLAS.items():
        for r in airtable(e['AIRTABLE_TOKEN'], tabla):
            sub = por_nombre.get((r['fields'].get('subtema') or '').strip())
            if sub: c[sub][col] += 1
            else: sin_subtema.append(f"{tabla}: {r['fields'].get('id')}")
    h = {'apikey': e['SUPABASE_SECRET_KEY'], 'Authorization': 'Bearer ' + e['SUPABASE_SECRET_KEY']}
    alts = get(SUPABASE + 'alternativas?select=id,subtema&materia=ilike.*acto_juridico*', h)
    vistos = set()
    for a in alts:
        vistos.add(a['id'])
        sub = por_nombre.get((a['subtema'] or '').strip())
        if sub: c[sub]['ALT'] += 1
        else: sin_subtema.append(f"alternativas: {a['id']}")
    borrador = 0
    for f in sorted(glob.glob(str(ROOT / 'scripts' / 'alternativas_acto_juridico_*.sql'))):
        txt = Path(f).read_text(encoding='utf-8')
        for m in re.finditer(r"values \(\s*'([^']+)',\s*'[^']*',\s*'((?:[^']|'')*)'", txt):
            if m.group(1) in vistos: continue
            sub = por_nombre.get(m.group(2).replace("''", "'"))
            if sub: c[sub]['ALT'] += 1; borrador += 1; vistos.add(m.group(1))
    for mid, sub in CAT['memorice'].items():
        c[sub]['MEM'] += 1
    for nc in CAT['no_confundir']:
        c[nc['subtema']]['NC'] += 1
    return c, sin_subtema, borrador


def tablero(c):
    filas = []
    tot = collections.Counter()
    for t in CAT['temas']:
        tt = collections.Counter()
        for s in t['subtemas']: tt.update(c[s['codigo']])
        tot.update(tt)
        filas.append(('tema', t, tt))
        for s in t['subtemas']:
            filas.append(('sub', s, c[s['codigo']]))
    return filas, tot


def markdown(filas, tot, n):
    z = lambda v: str(v) if v else '·'
    L = ['<!-- tablero:inicio -->',
         f'*Generado por `scripts/tablero_cobertura_aj.py`. No editar a mano: correr el script de nuevo.*', '',
         '| Tema / subtema | Sección | Relevancia | Exámenes (de %d) | ' % n + ' | '.join(TITULOS[k] for k in COLS) + ' |',
         '|---|---|---|---|' + '---|' * len(COLS)]
    for tipo, x, cnt in filas:
        if tipo == 'tema':
            L.append(f"| **{x['numero']}. {x['nombre']}** | {x['ref']} | **{nivel(x['pct'])}** | **{x['examenes']} ({x['pct']}%)** | " + ' | '.join(f'**{z(cnt[k])}**' for k in COLS) + ' |')
        else:
            L.append(f"| &nbsp;&nbsp;&nbsp;{x['nombre']} | {x['ref']} | | {z(x['examenes'])} | " + ' | '.join(z(cnt[k]) for k in COLS) + ' |')
    L.append('| **Total** | | | | ' + ' | '.join(f'**{tot[k]}**' for k in COLS) + ' |')
    L.append('<!-- tablero:fin -->')
    return '\n'.join(L)


def informe(filas, tot, n, borrador, sin_subtema):
    E = html.escape
    def celda(v, alerta):
        cls = 'cero alerta' if (not v and alerta) else ('cero' if not v else '')
        return f"<td class='{cls}'>{v or '·'}</td>"
    rows = ''
    nivel_tema = None
    for tipo, x, cnt in filas:
        if tipo == 'tema':
            nivel_tema = nivel(x['pct'])
            otras = f"<div class='otras'>También en otras materias del examen: {E(x['otras_materias'])}</div>" if x['otras_materias'] else ''
            rows += (f"<tr class='tema'><td>{x['numero']}. {E(x['nombre'])}{otras}</td><td class='ref'>{E(x['ref'])}</td>"
                     f"<td class='n-{nivel_tema.lower()}'>{nivel_tema}</td><td><div class='bar'><span style='width:{x['pct']}%'></span></div>{x['examenes']} <span class='ref'>({x['pct']}%)</span></td>"
                     + ''.join(f"<td>{cnt[k] or '·'}</td>" for k in COLS) + '</tr>')
        else:
            alerta = nivel_tema in ('Alta', 'Media')
            rows += (f"<tr class='sub'><td>{E(x['nombre'])}</td><td class='ref'>{E(x['ref'])}</td><td></td><td>{x['examenes'] or '·'}</td>"
                     + ''.join(celda(cnt[k], alerta and k in ('A', 'D', 'J', 'M', 'ALT', 'FC')) for k in COLS) + '</tr>')
    rows += "<tr class='tema'><td>Total</td><td></td><td></td><td></td>" + ''.join(f'<td>{tot[k]}</td>' for k in COLS) + '</tr>'
    aviso = f"<p class='aviso'>Ítems sin subtema reconocible (no se cuentan): {E(', '.join(sin_subtema))}</p>" if sin_subtema else ''
    doc = f"""<!doctype html><html lang="es"><head><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1">
<title>Relevancia temas AJ</title><style>
:root{{--bg:#FAF8F5;--fg:#1d1d1f;--mut:#6b6b70;--line:#e3ded6;--acc:#C41E2E;--card:#fff;--tema:#f3efe8;--alta:#C41E2E;--media:#B7791F;--baja:#6b6b70;--alerta:#fbe9eb}}
@media (prefers-color-scheme:dark){{:root:not([data-theme="light"]){{--bg:#17171a;--fg:#ececef;--mut:#a0a0a8;--line:#34343a;--card:#202024;--tema:#2a2a30;--alta:#ff6b78;--media:#e0a84a;--baja:#a0a0a8;--alerta:#3a2226}}}}
:root[data-theme="dark"]{{--bg:#17171a;--fg:#ececef;--mut:#a0a0a8;--line:#34343a;--card:#202024;--tema:#2a2a30;--alta:#ff6b78;--media:#e0a84a;--baja:#a0a0a8;--alerta:#3a2226}}
body{{background:var(--bg);color:var(--fg);font:15px/1.5 system-ui,sans-serif;margin:0;padding:24px 16px 80px}} main{{max-width:1250px;margin:0 auto}}
h1{{font:700 1.6rem Georgia,serif;margin:0 0 6px}} p{{max-width:900px}} .tw{{overflow-x:auto;background:var(--card);border:1px solid var(--line);border-radius:8px}}
table{{border-collapse:collapse;width:100%;font-size:.84rem}} th,td{{padding:5px 8px;border-bottom:1px solid var(--line);text-align:center;vertical-align:middle}}
th{{position:sticky;top:0;background:var(--card);font-weight:600;font-size:.78rem}} td:first-child,th:first-child{{text-align:left}}
tr.tema td{{background:var(--tema);font-weight:700;border-top:2px solid var(--line)}} tr.sub td:first-child{{padding-left:26px}}
.ref{{color:var(--mut);font-size:.76rem;font-weight:400}} .otras{{color:var(--mut);font-size:.74rem;font-weight:400}}
.n-alta{{color:var(--alta)}} .n-media{{color:var(--media)}} .n-baja{{color:var(--baja);font-weight:500}}
.bar{{display:inline-block;width:60px;height:7px;background:var(--line);border-radius:4px;margin-right:6px;vertical-align:middle}} .bar span{{display:block;height:100%;background:var(--alta);border-radius:4px}}
td.cero{{color:var(--mut)}} td.alerta{{background:var(--alerta)}} .aviso{{color:var(--acc)}}
</style></head><body><main>
<h1>Acto Jurídico: relevancia y cobertura por tema y subtema</h1>
<p>Relevancia según <b>{n} exámenes de grado reales</b> (planilla Preguntas Grado ACA, hojas Civil y Lyon, 2018-2019, e interrogatorios orales). En la fila de cada tema, "Exámenes" cuenta en cuántos exámenes distintos apareció el tema; en cada subtema, en cuántos apareció ese punto (un examen puede tocar varios subtemas, y algunas preguntas solo se pudieron asignar al tema). La clasificación es automática y se revisó con muestras: sirve para comparar, no es un conteo exacto. Niveles: Alta = 25% o más de los exámenes, Media = 10% a 24%, Baja = menos de 10%.</p>
<p>Las columnas cuentan lo que tiene Digesto hoy, incluidos los borradores sin publicar ({borrador} Alternativas están en SQL sin correr). <b>En rosado</b>: subtemas de temas de relevancia Alta o Media que no tienen ninguna pregunta de ese tipo. <b>No confundir</b> = recuadros de ese tipo en el manual; los 23 ya están convertidos en Flashcards y se cuentan también en esa columna. <b>Memorice</b> = artículos y definiciones.</p>
{aviso}
<div class="tw"><table><tr><th>Tema / subtema</th><th>Sección</th><th>Relevancia</th><th>Exámenes (de {n})</th>{''.join(f'<th>{TITULOS[k]}</th>' for k in COLS)}</tr>{rows}</table></div>
</main></body></html>"""
    assert '\u2014' not in doc  # sin guiones largos
    INFORME.write_text(doc, encoding='utf-8')


def main():
    c, sin_subtema, borrador = contar()
    filas, tot = tablero(c)
    n = CAT['examenes_total']
    md = markdown(filas, tot, n)
    doc = DOC.read_text(encoding='utf-8')
    if '<!-- tablero:inicio -->' in doc:
        doc = re.sub(r'<!-- tablero:inicio -->.*?<!-- tablero:fin -->', lambda m: md, doc, flags=re.S)
        DOC.write_text(doc, encoding='utf-8')
        print('Tablero actualizado en', DOC.name)
    else:
        print('No encontré las marcas del tablero en', DOC.name)
    informe(filas, tot, n, borrador, sin_subtema)
    print('Informe:', INFORME)
    print('Totales:', dict(tot))
    if sin_subtema: print('Sin subtema reconocible:', sin_subtema)


if __name__ == '__main__':
    main()
