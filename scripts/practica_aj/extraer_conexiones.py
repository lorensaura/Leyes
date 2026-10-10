"""Extrae los recuadros "Conexiones" del manual de Acto Jurídico, una fila por cada
materia conectada, para la tabla Conexiones de Airtable (base Digesto Acto Jurídico).

Cada recuadro del manual tiene un título y una línea por materia: "Materia (arts. ...):
descripción. Revisar apunte de X, sección (p. __)." o "En este manual: ...".
Deja el resultado en generado/conexiones.json (con sección, tema y subtema del
catálogo) para revisarlo y, con subir_conexiones.py, cargarlo.

Uso: python3 scripts/practica_aj/extraer_conexiones.py
"""
import json, os, re
AQUI = os.path.dirname(os.path.abspath(__file__))
REPO = os.path.dirname(os.path.dirname(AQUI))
GEN = os.path.join(AQUI, 'generado') + '/'
manual = open(GEN + 'manual.txt', encoding='utf-8').read().split('\n')
cat = json.load(open(os.path.join(REPO, 'scripts', 'aj_temas_subtemas.json'), encoding='utf-8'))

# código de sección por línea (misma convención que subir_eval.py)
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

def rangos(ref):
    """'IV.B.1.8-9' -> ['IV.B.1.8', 'IV.B.1.9']; 'II.A.5.2 (ii)' -> ['II.A.5.2']; 'I.1-4' -> I.1..I.4"""
    ref = re.sub(r'\s*\(.*', '', ref).strip()
    m = re.match(r'^(.*?)(\d+)-(\d+)$', ref)
    if m: return [f'{m.group(1)}{i}' for i in range(int(m.group(2)), int(m.group(3)) + 1)]
    return [ref]

def ubicar(seccion):
    """Subtema del catálogo cuya referencia es el prefijo más largo de la sección."""
    mejor = None
    for t in cat['temas']:
        for s in t['subtemas']:
            for r in rangos(s['ref']):
                if seccion == r or seccion.startswith(r + '.'):
                    if not mejor or len(r) > mejor[0]: mejor = (len(r), t['nombre'], s['nombre'])
    return (mejor[1], mejor[2]) if mejor else (None, None)

MATERIAS = ['Responsabilidad Contractual', 'Responsabilidad Extracontractual', 'Responsabilidad Precontractual',
            'Derecho Sucesorio', 'Sucesorio', 'Contratos', 'Compraventa', 'Obligaciones', 'Bienes', 'Familia', 'Personas',
            'Derecho Procesal', 'Procesal', 'Derecho Comercial', 'Comercial', 'Derecho Penal', 'Teoría de la Ley']

ES_CONEXION = re.compile(r'^[A-ZÁÉÍÓÚ][\wÁÉÍÓÚáéíóúñ ]{2,40}( \([^)]*\))?: ')
# nombres de materia unificados (el manual usa variantes)
NORMALIZAR = {'Derecho Sucesorio': 'Sucesorio', 'Derecho de Familia': 'Familia', 'Derecho Procesal': 'Procesal',
              'Responsabilidad extracontractual': 'Responsabilidad Extracontractual', 'Compraventa': 'Contratos',
              'Sociedades': 'Comercial'}
# recuadros fuera de las secciones del catálogo: tema asignado a mano
TEMA_SIN_SUBTEMA = {'II.A.8': 'Vicios del consentimiento en general'}

filas = []
for i, l in enumerate(manual):
    if l.strip() != '[Conexiones]': continue
    titulo = manual[i + 1].strip().strip('[]').strip()
    j = i + 2
    # una línea de conexión empieza con "Materia (arts. ...):" o con "En este manual:";
    # el recuadro termina en la primera que no (el manual no deja línea en blanco después)
    while j < len(manual) and (manual[j].startswith('En este manual:') or ES_CONEXION.match(manual[j])):
        linea = manual[j].strip(); j += 1
        tema, subtema = ubicar(cod[i])
        if not tema: tema = TEMA_SIN_SUBTEMA.get(cod[i])
        if linea.startswith('En este manual:'):
            destino, desc, ref = 'Acto Jurídico (mismo manual)', linea[len('En este manual:'):].strip(), ''
        else:
            destino = next((m for m in MATERIAS if linea.startswith(m)), linea.split(':')[0].split(' (')[0])
            destino = NORMALIZAR.get(destino, destino)
            cuerpo = linea.split(':', 1)[1].strip() if ':' in linea else linea
            partes = re.split(r'\s(?=Revisar (?:apunte|manual))', cuerpo, maxsplit=1)
            desc, ref = partes[0].strip(), (partes[1].strip() if len(partes) > 1 else '')
            arts = re.search(r'\((arts?\.[^)]*)\)', linea.split(':', 1)[0])
            if arts: desc = f'{desc} ({arts.group(1)})' if arts.group(1) not in desc else desc
        filas.append(dict(seccion=cod[i], tema=tema, subtema=subtema, titulo=titulo, materia_destino=destino,
                          descripcion=desc, referencia_destino=ref, texto_original=linea))
for n, f in enumerate(filas, 1): f['id'] = f'aj-con-{n:03d}'
json.dump(filas, open(GEN + 'conexiones.json', 'w', encoding='utf-8'), ensure_ascii=False, indent=1)
print(len(filas), 'conexiones en', len({f['titulo'] for f in filas}), 'recuadros')
