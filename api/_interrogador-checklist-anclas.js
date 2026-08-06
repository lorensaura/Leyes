// Curado a mano (no generado). Conecta el checklist de subtemas de
// api/_interrogador-prompt.js (sección "DURACIÓN Y COBERTURA", ítems a-k)
// con palabras clave por las que el router (ver api/interrogador.js,
// elegirContenidoDelTurno) puede reconocer que ese ítem está en juego en el
// turno actual -- tanto para decidir qué sección del manual cargar como
// para la red de seguridad por palabra clave que corre en paralelo al
// router.
//
// El campo `materia` ('compartido' | 'contractual' | 'extracontractual' |
// 'precontractual') es la fuente de verdad para filtrar este checklist y el
// índice de secciones cuando la interrogación es de una sola materia (ver
// INDICE_POR_MATERIA / ANCLAS_POR_MATERIA en api/interrogador.js) -- no
// mantener una tabla aparte que pueda desincronizarse de esta.
//
// Si Laura cambia el checklist en api/_interrogador-prompt.js, este archivo
// hay que actualizarlo a mano junto con ese cambio -- no se regenera solo.
module.exports = [
  {
    item: 'a',
    materia: 'compartido',
    descripcion: 'marco general y distinción de estatutos (contractual / extracontractual / precontractual)',
    pistas: ['marco general', 'estatutos de responsabilidad', 'efectos de las obligaciones', 'art. 1437', 'art. 2284', 'remedios', 'art. 1489'],
  },
  {
    item: 'b',
    materia: 'contractual',
    descripcion: 'graduación y prueba de la culpa contractual',
    pistas: ['graduación de la culpa', 'culpa grave', 'culpa leve', 'culpa levísima', 'art. 44', 'presunción de culpa', 'art. 1547', 'prueba del incumplimiento'],
  },
  {
    item: 'c',
    materia: 'contractual',
    descripcion: 'mora',
    pistas: ['mora', 'art. 1551', 'art. 1552', 'art. 1557', 'requisitos de la mora', 'mora del acreedor'],
  },
  {
    item: 'd',
    materia: 'contractual',
    descripcion: 'daños, previsibilidad y daño moral en sede contractual',
    pistas: ['daño previsible', 'art. 1556', 'art. 1558', 'avaluación de perjuicios', 'cláusula penal', 'art. 1535', 'daño moral contractual'],
  },
  {
    item: 'e',
    materia: 'extracontractual',
    descripcion: 'elementos de la responsabilidad extracontractual',
    pistas: ['delito civil', 'cuasidelito civil', 'art. 2284', 'art. 2314', 'capacidad delictual', 'art. 2319', 'elementos de la responsabilidad extracontractual'],
  },
  {
    item: 'f',
    materia: 'extracontractual',
    descripcion: 'hecho ajeno y hecho de las cosas',
    pistas: ['hecho ajeno', 'hecho de las cosas', 'art. 2320', 'art. 2321', 'art. 2322', 'art. 2323', 'art. 2326', 'art. 2328'],
  },
  {
    item: 'g',
    materia: 'extracontractual',
    descripcion: 'presunciones y responsabilidad objetiva/estricta',
    pistas: ['presunción de culpabilidad', 'art. 2329', 'responsabilidad estricta', 'responsabilidad objetiva', 'presunciones por el hecho propio'],
  },
  {
    item: 'h',
    materia: 'extracontractual',
    descripcion: 'daño y causalidad',
    pistas: ['daño patrimonial', 'daño moral', 'lucro cesante', 'daño emergente', 'causalidad', 'teoría de la equivalencia', 'causa adecuada', 'relación de causalidad'],
  },
  {
    item: 'i',
    materia: 'extracontractual',
    descripcion: 'acción: prescripción, solidaridad, culpa de la víctima',
    pistas: ['prescripción', 'art. 2332', 'art. 2515', 'solidaridad', 'art. 2317', 'culpa de la víctima', 'art. 2330', 'exposición imprudente'],
  },
  {
    item: 'j',
    materia: 'precontractual',
    descripcion: 'etapas y estatuto de la responsabilidad precontractual',
    pistas: ['tratos preliminares', 'oferta', 'art. 97', 'art. 98', 'art. 99', 'art. 100', 'art. 101', 'formación del consentimiento', 'contrato preparatorio', 'art. 1554', 'buena fe negocial'],
  },
  {
    item: 'k',
    materia: 'precontractual',
    descripcion: 'naturaleza jurídica y requisitos de la responsabilidad precontractual',
    pistas: ['naturaleza jurídica de la responsabilidad precontractual', 'ihering', 'faggella', 'saleilles', 'interés positivo', 'interés negativo', 'responsabilidad por nulidad', 'art. 1687', 'responsabilidad postcontractual'],
  },
];
