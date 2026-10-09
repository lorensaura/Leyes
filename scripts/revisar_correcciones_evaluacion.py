"""Junta lo que registró la app al corregir Evaluación, para que la IA lo revise.

Lee la tabla evaluacion_correcciones de Supabase (ver
scripts/supabase_schema_evaluacion_correcciones.sql) y arma, por pregunta y por
elemento, los casos que hay que mirar:
- RECLAMOS: la alumna apretó "Lo dije con otras palabras". ¿Lo dijo de verdad?
  Si sí, proponer la variante como keyword nueva. Si no, ignorarlo (y si se
  repite en un mismo elemento, avisar: puede que la pauta esté mal explicada).
- APROBADAS POR COINCIDENCIA FLEXIBLE: la keyword no estaba literal, sino sus
  palabras cerca. ¿La respuesta era correcta en ese punto? Si no, proponer
  ajustar o sacar esa keyword (agregar keywords no arregla un falso positivo).
- APROBADAS POR RECLAMO: revisar con más cuidado, porque la alumna se dio el
  punto a sí misma.

Escribe DERECHO LIBRE/Documentos de trabajo/correcciones_evaluacion_<fecha>.json
con cada caso, la respuesta de la alumna, la respuesta modelo y las keywords
vigentes. La IA (Claude, en una sesión) lo lee, juzga caso por caso y arma un
informe con propuestas para Laura; nada se cambia en Airtable sin su aprobación.

Uso: python3 scripts/revisar_correcciones_evaluacion.py [--desde AAAA-MM-DD]
"""
import collections, datetime, json, os, sys, urllib.parse, urllib.request
AQUI = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, AQUI)
from tablero_cobertura_aj import env, SUPABASE

SALIDA = '/Users/lorensaura/Desktop/DERECHO LIBRE/Documentos de trabajo'


def main():
    desde = sys.argv[sys.argv.index('--desde') + 1] if '--desde' in sys.argv else '2000-01-01'
    e = env()
    H = {'apikey': e['SUPABASE_SECRET_KEY'], 'Authorization': 'Bearer ' + e['SUPABASE_SECRET_KEY']}
    def get(p):
        with urllib.request.urlopen(urllib.request.Request(SUPABASE + p, headers=H)) as r: return json.load(r)
    filas = get('evaluacion_correcciones?select=*&order=creado_en&creado_en=gte.' + urllib.parse.quote(desde))
    modelos = {x['codigo']: x for x in get('evaluacion_practica?select=codigo,enunciado,respuesta_modelo,elementos_clave')}

    casos = collections.defaultdict(lambda: {'reclamos': [], 'aprobadas_flexible': [], 'aprobadas_por_reclamo': []})
    for f in filas:
        base = dict(fecha=f['creado_en'][:10], respuesta_alumna=f['respuesta_alumna'], credito=f['credito'])
        if f['evento'] == 'reclamo':
            casos[(f['evaluacion_codigo'], f['elemento_reclamado'])]['reclamos'].append(base)
            if f.get('aprobada_por_reclamo'):
                casos[(f['evaluacion_codigo'], '(toda la respuesta)')]['aprobadas_por_reclamo'].append(base)
        elif f.get('aprobada'):
            for d in f['detalle']:
                if d['como'] == 'flexible':
                    casos[(f['evaluacion_codigo'], d['texto'])]['aprobadas_flexible'].append(dict(base, keyword=d['keyword']))

    salida = []
    for (codigo, elemento), c in sorted(casos.items()):
        m = modelos.get(codigo, {})
        el = next((x for x in m.get('elementos_clave') or [] if x.get('texto') == elemento), None)
        salida.append(dict(codigo=codigo, elemento=elemento, keywords_vigentes=el and el.get('keywords'),
                           enunciado=m.get('enunciado'), respuesta_modelo=m.get('respuesta_modelo'), **c))
    os.makedirs(SALIDA, exist_ok=True)
    ruta = os.path.join(SALIDA, f'correcciones_evaluacion_{datetime.date.today()}.json')
    json.dump(salida, open(ruta, 'w', encoding='utf-8'), ensure_ascii=False, indent=1)
    n = lambda k: sum(len(x[k]) for x in salida)
    print(f'{len(filas)} filas leídas desde {desde}. Para revisar: {n("reclamos")} reclamos, '
          f'{n("aprobadas_flexible")} aprobaciones por coincidencia flexible, {n("aprobadas_por_reclamo")} aprobadas por reclamo.')
    print('Archivo:', ruta)


if __name__ == '__main__':
    main()
