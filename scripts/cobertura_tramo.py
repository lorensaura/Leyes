"""Cobertura de un tramo: ¿el manual toca todo lo que trae la fuente, y con
suficiente desarrollo?

Mide, para un tramo (rango de páginas de la fuente frente a una sección del
manual), cuatro cosas y las resume en un semáforo para el informe del tramo:

1. Densidad: caracteres del manual / caracteres de la fuente (sin
   encabezados de página). Meta 80-90% (`docs/manuales/proceso.md` 4.1).
   Bajo 75% es señal de resumen de más.
2. Artículos: artículos citados en la fuente que también aparecen en el
   manual. Un artículo que falta casi siempre es un punto omitido.
3. Autores: autores citados en la fuente (lista de doctrina chilena
   frecuente) que también aparecen en el manual.
4. Subtítulos: títulos y subtítulos de la fuente cuyas palabras clave
   aparecen en el manual (detecta temas enteros que no se tocaron).

No reemplaza el chequeo de unidades del inventario (proceso.md 4.2): es
una alarma rápida y objetiva que va arriba de cada informe.

Uso:
  python3 scripts/cobertura_tramo.py \
      --fuente "Apuntes/CIVIL/Bienes/Apuntes/BOETSCH Apuntes Bienes 2021.pdf" \
      --paginas 184-191 \
      --manual 05_Bienes_Manual.html --desde cV-5 --hasta cV-5-A-2 \
      [--html bloque.html] [--titulo "Tramo 11a"]

--desde es el id del primer encabezado del tramo; --hasta, el id del primer
encabezado que ya NO es del tramo (se excluye). Sin --hasta, hasta el final.
"""
import argparse, html as H, re, sys, unicodedata
from pathlib import Path

AUTORES = ["ALESSANDRI", "SOMARRIVA", "VODANOVIC", "CLARO SOLAR", "PEÑAILILLO",
           "VIAL", "ABELIUK", "MEZA BARROS", "RAMOS PAZOS", "ORREGO", "BOETSCH",
           "DOMÍNGUEZ", "CORRAL", "BARROS", "FUEYO", "STITCHKIN", "ROZAS",
           "TRUCCO", "BELLO", "SAVIGNY", "IHERING", "POTHIER", "PLANIOL",
           "RIPERT", "ROSENDE", "LECAROS", "FIGUEROA", "SANTA CRUZ", "PESCIO",
           "LEÓN HURTADO", "DUCCI", "TAPIA", "ATRIA", "GUZMÁN BRITO", "VERGARA",
           "MEJÍAS", "ELORRIAGA", "AEDO", "SAN MARTÍN", "LÓPEZ SANTA MARÍA",
           "VELASCO", "LIGEROPOULO", "ROMÁN", "DE LA MAZA", "PIZARRO", "PEÑA",
           "BAHAMONDES", "CONTARDO", "BRANTT", "ZELAYA", "LYON", "ROSSO"]
VACIAS = set("""de la el los las del y o en a por para con que se su sus un una al lo
como es son sin sobre entre más este esta estos estas cual cuales cuando donde
también ser hay otra otro otras otros caso casos parte general generales""".split())


def norm(s):
    s = unicodedata.normalize("NFD", s.lower())
    return "".join(c for c in s if unicodedata.category(c) != "Mn")


def leer_pdf(ruta, desde, hasta):
    try:
        import fitz
        d = fitz.open(ruta)
        return [d[i].get_text() for i in range(desde - 1, hasta)]
    except ImportError:
        from pypdf import PdfReader
        r = PdfReader(ruta)
        return [r.pages[i].extract_text() or "" for i in range(desde - 1, hasta)]


def limpiar_fuente(paginas):
    """Quita encabezados repetidos (los que aparecen en casi todas las páginas)."""
    conteo = {}
    for p in paginas:
        for l in set(x.strip() for x in p.split("\n") if x.strip()):
            conteo[l] = conteo.get(l, 0) + 1
    umbral = max(2, int(len(paginas) * 0.6))
    repetidas = {l for l, n in conteo.items() if n >= umbral}
    lineas = []
    for p in paginas:
        for l in p.split("\n"):
            t = l.strip()
            if not t or t in repetidas or re.fullmatch(r"_+", t) or re.match(r"P[aá]gina \d+ de \d+", t):
                continue
            lineas.append(t)
    return lineas


def seccion_manual(html, desde, hasta):
    i = html.find(f'id="{desde}"')
    if i < 0:
        sys.exit(f"No encontré id=\"{desde}\" en el manual")
    i = html.rfind("<", 0, i)
    j = len(html)
    if hasta:
        k = html.find(f'id="{hasta}"', i)
        if k < 0:
            sys.exit(f"No encontré id=\"{hasta}\" en el manual")
        j = html.rfind("<", 0, k)
    frag = re.sub(r"<(script|style)[^>]*>.*?</\1>", " ", html[i:j], flags=re.S)
    return re.sub(r"\s+", " ", H.unescape(re.sub(r"<[^>]+>", " ", frag))).strip()


def articulos(texto):
    t = norm(texto)
    nums = set()
    for m in re.finditer(r"\bart(?:iculo|s?\.)?s?\s*((?:\d{1,4}(?:\s*(?:bis|inc\.?\s*\d+))?[\s,y°ºo]*)+)", t):
        for n in re.findall(r"\d{1,4}", m.group(1)):
            if 1 <= int(n) <= 2524:
                nums.add(int(n))
    return nums


def autores(texto):
    t = norm(texto)
    return {a for a in AUTORES if re.search(r"\b" + re.escape(norm(a)) + r"\b", t)}


def es_subtitulo(l):
    if len(l) > 90 or len(l) < 4 or l.endswith((".", ",", ";")) and not re.match(r"^[IVX]+\.\d", l):
        return False
    letras = [c for c in l if c.isalpha()]
    if not letras:
        return False
    mayus = sum(c.isupper() for c in letras) / len(letras)
    numerado = re.match(r"^([IVX]+\.|\d+(\.\d+)*[.)]|[a-zA-Z][.)]|[A-Z]\.\d)\s*\S", l)
    return mayus > 0.6 or (numerado and len(l.split()) <= 10)


def palabras_clave(l):
    return [w for w in re.findall(r"[a-zñ]{5,}", norm(l)) if w not in VACIAS]


def semaforo(p, verde, amarillo):
    return "🟢" if p >= verde else ("🟡" if p >= amarillo else "🔴")


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--fuente", required=True)
    ap.add_argument("--paginas", required=True, help="ej. 184-191 (páginas del PDF)")
    ap.add_argument("--manual", required=True)
    ap.add_argument("--desde", required=True)
    ap.add_argument("--hasta")
    ap.add_argument("--html")
    ap.add_argument("--titulo", default="Tramo")
    a = ap.parse_args()

    p1, p2 = (int(x) for x in a.paginas.split("-"))
    lineas = limpiar_fuente(leer_pdf(a.fuente, p1, p2))
    fuente = " ".join(lineas)
    manual = seccion_manual(Path(a.manual).read_text(encoding="utf-8"), a.desde, a.hasta)
    man_n = norm(manual)

    dens = len(manual) / max(1, len(fuente)) * 100
    art_f, art_m = articulos(fuente), articulos(manual)
    art_falt = sorted(art_f - art_m)
    art_p = 100 if not art_f else len(art_f & art_m) / len(art_f) * 100
    aut_f, aut_m = autores(fuente), autores(manual)
    aut_falt = sorted(aut_f - aut_m)
    aut_p = 100 if not aut_f else len(aut_f & aut_m) / len(aut_f) * 100
    subs, sub_falt = [], []
    for l in lineas:
        if es_subtitulo(l):
            pc = palabras_clave(l)
            if not pc:
                continue
            subs.append(l)
            if sum(w in man_n for w in pc) / len(pc) < 0.6:
                sub_falt.append(l)
    sub_p = 100 if not subs else (len(subs) - len(sub_falt)) / len(subs) * 100

    # Índice: lo que más indica "tema no tocado" pesa más.
    indice = 0.4 * art_p + 0.3 * sub_p + 0.3 * aut_p
    if dens < 75:
        indice = min(indice, 74)  # resumir de más nunca sale en verde
    filas = [
        ("Densidad (caracteres manual / fuente)", f"{dens:.0f}%", semaforo(dens, 80, 75), "mínimo 80% (más es normal: voz propia y ejemplos)"),
        ("Artículos de la fuente presentes", f"{art_p:.0f}% ({len(art_f & art_m)}/{len(art_f)})",
         semaforo(art_p, 95, 85), ", ".join(f"art. {n}" for n in art_falt) or "ninguno falta"),
        ("Autores de la fuente presentes", (f"{aut_p:.0f}% ({len(aut_f & aut_m)}/{len(aut_f)})" if aut_f else "sin autores en la fuente"),
         semaforo(aut_p, 95, 85), ", ".join(aut_falt) or "ninguno falta"),
        ("Subtítulos de la fuente tocados", f"{sub_p:.0f}% ({len(subs) - len(sub_falt)}/{len(subs)})",
         semaforo(sub_p, 90, 80), " · ".join(sub_falt[:12]) or "todos"),
    ]
    print(f"{a.titulo} · fuente p. {a.paginas} · manual #{a.desde} a #{a.hasta or 'fin'}")
    print(f"ÍNDICE DE COBERTURA: {indice:.0f}% {semaforo(indice, 90, 80)}")
    for f in filas:
        print(f"  {f[2]} {f[0]}: {f[1]}  |  falta: {f[3]}")

    if a.html:
        tr = "".join(f"<tr><td>{f[2]} {H.escape(f[0])}</td><td><b>{H.escape(f[1])}</b></td>"
                     f"<td>{H.escape(f[3])}</td></tr>" for f in filas)
        bloque = (f'<section class="cobertura"><h2>Cobertura del tramo: '
                  f'{indice:.0f}% {semaforo(indice, 90, 80)}</h2>'
                  f"<p>¿Toca todo lo que trae la fuente (p. {H.escape(a.paginas)}) y con suficiente "
                  f"desarrollo? 🟢 bien · 🟡 revisar · 🔴 falta contenido o está resumido de más. "
                  f"Lo que falta se verifica a mano: puede ser un falso aviso (p. ej. un artículo "
                  f"citado de pasada).</p><table><tr><th>Medida</th><th>Resultado</th>"
                  f"<th>Qué falta</th></tr>{tr}</table></section>")
        Path(a.html).write_text(bloque, encoding="utf-8")
        print(f"Bloque HTML: {a.html}")


if __name__ == "__main__":
    main()
