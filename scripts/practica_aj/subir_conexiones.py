"""Crea (si no existe) la tabla Conexiones en la base Digesto Acto Jurídico y carga las
conexiones extraídas del manual por extraer_conexiones.py (generado/conexiones.json).

Para qué (Laura, 2026-10-10): que los exámenes con IA de toda una materia, o de varias,
puedan ir conectando materias: cada fila dice qué punto de Acto Jurídico se conecta con
qué materia, y dónde. Se alimenta de los recuadros "Conexiones" del manual; se pueden
agregar filas a mano en Airtable.

Uso: python3 scripts/practica_aj/subir_conexiones.py [--subir]
Sin --subir solo muestra qué haría. No duplica: salta los id ya cargados.
"""
import json, os, sys, urllib.parse
AQUI = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, AQUI)
from airtable_aj import req, todos, BASE

TABLA = 'Conexiones'
MATERIAS = ['Acto Jurídico (mismo manual)', 'Bienes', 'Contratos', 'Obligaciones', 'Familia', 'Sucesorio',
            'Responsabilidad Contractual', 'Responsabilidad Extracontractual', 'Responsabilidad Precontractual',
            'Procesal', 'Comercial', 'Teoría de la Ley', 'Personas']
filas = json.load(open(os.path.join(AQUI, 'generado', 'conexiones.json'), encoding='utf-8'))
meta = req('GET', f'https://api.airtable.com/v0/meta/bases/{BASE}/tables')['tables']
temas_tabla = next(t for t in meta if t['name'] == 'Temas')
existe = any(t['name'] == TABLA for t in meta)
subir = '--subir' in sys.argv

if not existe:
    print('Se crea la tabla', TABLA)
    if subir:
        req('POST', f'https://api.airtable.com/v0/meta/bases/{BASE}/tables', {
            'name': TABLA,
            'description': ('Conexiones de Acto Jurídico con otras materias (y dentro del mismo manual), '
                            'para que los exámenes con IA de toda la materia puedan relacionar materias. '
                            'Origen: recuadros "Conexiones" del manual.'),
            'fields': [
                {'name': 'id', 'type': 'singleLineText'},
                {'name': 'tema', 'type': 'multipleRecordLinks', 'options': {'linkedTableId': temas_tabla['id']}},
                {'name': 'subtema', 'type': 'singleLineText'},
                {'name': 'seccion_manual', 'type': 'singleLineText', 'description': 'Sección del manual de AJ donde está el recuadro'},
                {'name': 'recuadro', 'type': 'singleLineText', 'description': 'Título del recuadro Conexiones'},
                {'name': 'materia_conectada', 'type': 'singleSelect', 'options': {'choices': [{'name': m} for m in MATERIAS]}},
                {'name': 'descripcion', 'type': 'multilineText', 'description': 'Qué institución o artículo de la otra materia se conecta'},
                {'name': 'referencia_en_otra_materia', 'type': 'singleLineText',
                 'description': 'Dónde está en el otro apunte; [FALTA] hasta que ese apunte esté terminado'},
                {'name': 'texto_original', 'type': 'multilineText', 'description': 'La línea tal cual en el manual'},
                {'name': 'Revision_status', 'type': 'singleSelect', 'options': {'choices': [{'name': 'Revisar'}, {'name': 'Verificado'}]}},
                {'name': 'notas', 'type': 'multilineText'},
            ]})

ya = {r['fields'].get('id') for r in todos(TABLA)} if (existe or subir) else set()
temas = {r['fields']['nombre']: r['id'] for r in todos('Temas')}
nuevas = [f for f in filas if f['id'] not in ya]
print(f'{len(filas)} conexiones en el manual; {len(nuevas)} por cargar')
if not subir:
    sys.exit()
for i in range(0, len(nuevas), 10):
    req('POST', f'https://api.airtable.com/v0/{BASE}/{urllib.parse.quote(TABLA)}', {'typecast': True, 'records': [{'fields': {
        'id': f['id'], 'tema': [temas[f['tema']]], 'subtema': f['subtema'] or '', 'seccion_manual': f['seccion'],
        'recuadro': f['titulo'], 'materia_conectada': f['materia_destino'], 'descripcion': f['descripcion'],
        'referencia_en_otra_materia': f['referencia_destino'], 'texto_original': f['texto_original'],
        'Revision_status': 'Revisar'}} for f in nuevas[i:i + 10]]})
print('cargadas:', len(nuevas), '| total en la tabla:', len(todos(TABLA)))
