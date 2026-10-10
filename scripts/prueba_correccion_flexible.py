"""Mide la corrección de Evaluación: la literal de antes contra la flexible (2026-10-09).

La flexible es la de keywordPresente() en app/alternativas.html, copiada aquí tal cual:
una keyword cuenta si aparece literal, o si todas sus palabras con significado aparecen
dentro de una ventana de 8 palabras de la respuesta (las de más de 3 letras se comparan
por sus primeras 5 letras; las cortas y los números, exactas). Aprobar = 75% de los
elementos (con 3 elementos, los 3; con 4, 3).

Pruebas:
1. Banco publicado (Supabase evaluacion_practica): ¿obtiene la respuesta modelo todos
   sus elementos? ¿aprueba?
2. Respuestas de prueba de Nulidad (lote_aplic1): correctas con palabras propias y
   equivocadas (incluidas negaciones). Las escribió Claude, que también redactó las
   keywords: es una prueba optimista.
3. "Ensalada": todas las palabras de las keywords del ítem, revueltas, sin razonamiento.
   Mide cuánto puede aprobar quien solo enumera términos.
4. Reportes reales (evaluacion_reportes) y, cuando existan, reclamos
   (evaluacion_correcciones).

Uso: python3 scripts/prueba_correccion_flexible.py
"""
import json, os, random, re, sys, unicodedata, urllib.request
AQUI = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, AQUI)
from tablero_cobertura_aj import env, SUPABASE

VACIAS = set('el la los las de del y o a en que por para con se su sus un una lo al es son le les ya este esta'.split())
def qt(s): return ''.join(c for c in unicodedata.normalize('NFD', (s or '').lower()) if unicodedata.category(c) != 'Mn')
def palabras(s): return [w for w in re.findall(r'[a-z0-9]+', qt(s)) if w not in VACIAS]
def misma(p, w):
    if p.isdigit() or w.isdigit() or len(p) <= 3 or len(w) <= 3: return p == w
    return p[:5] == w[:5]
def literal(kw, texto): return qt(kw) in qt(texto)
def flexible(kw, texto):
    if literal(kw, texto): return True
    pal, ws = palabras(kw), palabras(texto)
    if not pal: return False
    n = max(len(pal), 8)
    return any(all(any(misma(p, w) for w in ws[i:i + n]) for p in pal) for i in range(len(ws)))
def nota(elementos, texto, fn):
    ok = [any(fn(k, texto) for k in el.get('keywords', [])) for el in elementos]
    return sum(ok), len(ok), bool(ok) and sum(ok) / len(ok) >= 0.75

PRUEBA_OK = {
 'aj-aplic-004': 'No tiene razón. Las normas de nulidad del Código Civil son generales y se aplican a todo el derecho privado, incluidos los contratos comerciales. Además son normas de orden público, así que las partes no pueden dejarlas sin efecto por contrato, y la nulidad no se puede renunciar de antemano.',
 'aj-aplic-005': 'No es correcto. Una vez declarada, la nulidad relativa produce los mismos efectos que la absoluta: las partes vuelven al estado en que estaban antes del contrato y deben restituirse lo que recibieron. La diferencia está en el tipo de requisito omitido: si mira a la naturaleza del acto es absoluta, si mira a la calidad de las partes es relativa.',
 'aj-aplic-006': 'Es nulidad relativa. El art. 1682 dice que cualquier otro vicio distinto de los de nulidad absoluta produce nulidad relativa, por lo que esta es la regla general. La fuerza no está entre las causales de nulidad absoluta.',
 'aj-aplic-007': 'El primer contrato tiene causa ilícita porque premia un delito, y eso produce nulidad absoluta. El juez puede declararla de oficio porque el vicio aparece de manifiesto en el contrato. El segundo tiene un error sustancial, que produce nulidad relativa, y esa solo se puede declarar si la parte afectada la pide; el juez no puede declararla por su cuenta.',
 'aj-aplic-008': 'La curadora no puede, porque el vicio tiene que existir al momento de celebrar el contrato y en 2023 Hernán era capaz. La incapacidad posterior no anula el contrato. Felipe tampoco, porque la nulidad solo beneficia a quien la pidió (art. 1690); él tendría que demandar por su cuenta.',
 'aj-aplic-014': 'La ratificación no sirve porque la nulidad absoluta no se puede ratificar. Pero la acción está prescrita: pasaron más de diez años desde que se celebró el contrato en 2013, y el plazo se cuenta desde la celebración aunque Benjamín fuera menor. Rubén tiene razón en que el contrato produjo efectos mientras no se declaró nulo por sentencia.',
 'aj-aplic-017': 'Ximena no puede, porque solo puede pedir la nulidad relativa la persona protegida, que es Ramiro, la víctima de la fuerza. Si Ramiro muere, sus herederos pueden pedirla. Si cedió sus derechos, el cesionario también puede.',
 'aj-aplic-019': 'El plazo es de cuatro años. Lucas: se cuenta desde que terminaron las amenazas en 2022, así que todavía puede hasta 2026. Marta: en el dolo se cuenta desde que se celebró el contrato, no desde que lo descubrió, así que el plazo venció en marzo de 2024 y ya no puede. Pedro: desde que cumplió 18, en 2021, así que puede hasta marzo de 2025.',
}
PRUEBA_MAL = {
 'aj-aplic-004': 'Tiene razón. Como es un contrato mercantil, se rige por el Código de Comercio y no por el Código Civil, y las partes son libres de pactar lo que quieran porque prima la autonomía de la voluntad.',
 'aj-aplic-006': 'Corresponde nulidad absoluta, porque la fuerza es un vicio grave que afecta el consentimiento y la ley debe proteger a la víctima.',
 'aj-aplic-007': 'El juez puede declarar de oficio la nulidad de ambos contratos, porque en los dos hay un vicio que consta en el proceso.',
 'aj-aplic-014': 'La ratificación de 2022 saneó la nulidad, porque Benjamín ya era mayor de edad y confirmó el contrato. Por eso la demanda no prospera.',
 'aj-aplic-017': 'Ximena sí puede pedir la nulidad porque es parte del contrato. Los herederos no pueden porque la acción es personal.',
 'aj-aplic-019': 'El plazo es de diez años desde la celebración para todos, así que los tres todavía pueden.',
 'aj-aplic-008': 'La curadora sí puede, porque hoy Hernán es incapaz y eso vicia el contrato. Y Felipe también se libera, porque la sentencia de Lorena anula la compra para ambos hermanos.',
 'aj-aplic-018': 'Agustín puede pedir la nulidad de las dos compras, porque es menor de edad y la ley siempre protege al incapaz, aunque haya mentido o adulterado documentos.',
}

def main():
    e = env()
    H = {'apikey': e['SUPABASE_SECRET_KEY'], 'Authorization': 'Bearer ' + e['SUPABASE_SECRET_KEY']}
    def get(p):
        with urllib.request.urlopen(urllib.request.Request(SUPABASE + p, headers=H)) as r: return json.load(r)
    banco = [x for x in get('evaluacion_practica?select=codigo,respuesta_modelo,elementos_clave') if x.get('elementos_clave')]
    lote = os.path.join(AQUI, 'practica_aj', 'generado', 'filas_lote_aplic1.json')
    aj = {f['id']: dict(codigo=f['id'], respuesta_modelo=f['respuesta_modelo'], elementos_clave=f['elementos_clave'])
          for f in json.load(open(lote, encoding='utf-8'))} if os.path.exists(lote) else {}
    todos = banco + [x for k, x in aj.items() if k not in {b['codigo'] for b in banco}]

    print(f'1. RESPUESTA MODELO ({len(todos)} ítems: banco publicado + Nulidad sin publicar)')
    for fn, nom in ((literal, 'literal (antes)'), (flexible, 'flexible (ahora)')):
        r = [nota(x['elementos_clave'], x['respuesta_modelo'], fn) for x in todos]
        print(f'   {nom:17} todos los elementos: {sum(a == b for a, b, _ in r):3}   aprueba: {sum(c for *_, c in r):3}')

    print('2. RESPUESTAS DE PRUEBA DE NULIDAD')
    for nom, D in (('correctas', PRUEBA_OK), ('equivocadas', PRUEBA_MAL)):
        for fn, fnom in ((literal, 'literal'), (flexible, 'flexible')):
            r = [nota(aj[i]['elementos_clave'], t, fn) for i, t in D.items() if i in aj]
            print(f'   {nom:11} {fnom:8} aprueban {sum(c for *_, c in r)} de {len(r)}')

    print('3. ENSALADA DE PALABRAS CLAVE, sin razonamiento (todos los ítems)')
    rnd = random.Random(1)
    for fn, nom in ((literal, 'literal'), (flexible, 'flexible')):
        ap = 0
        for x in todos:
            ws = [w for el in x['elementos_clave'] for k in el.get('keywords', []) for w in palabras(k)]
            rnd.shuffle(ws)
            ap += nota(x['elementos_clave'], ' '.join(ws), fn)[2]
        print(f'   {nom:8} aprueban {ap} de {len(todos)}')

    rep = get('evaluacion_reportes?select=evaluacion_codigo,respuesta_alumna,elementos_clave_snapshot')
    print(f'4. REPORTES REALES DE ALUMNAS: {len(rep)}')
    for r in rep:
        a, b = (nota(r['elementos_clave_snapshot'], r['respuesta_alumna'], fn) for fn in (literal, flexible))
        print(f"   {r['evaluacion_codigo']}: literal {a[0]}/{a[1]}, flexible {b[0]}/{b[1]}")

if __name__ == '__main__':
    main()
