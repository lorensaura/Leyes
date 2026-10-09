# Correcciones propuestas en la revisión de las 291 Flashcards de AJ (2026-10-09).
# Criterios: prompt de digesto-revision (condice con el manual, alucinaciones,
# alcance) + regla anti-alucinación de docs/prompts-practica/nucleo.md.
# Cada corrección: (id, nivel, problema, campo, texto actual, texto propuesto).
# nivel: 'fondo' (dato que no calza con el manual), 'precision' (atribución o
# alcance más amplio que el manual), 'forma' (formato o redacción).
# NO se aplican solas: esperan la aprobación de Laura.
A = lambda n: f'<span class="art">art. {n}</span>'

CORRECCIONES = [
 ('aj-fc-248', 'fondo',
  'Atribuye el tope de diez años al art. 2520 inc. 2°. El manual lo pone en el art. 1692 inc. final; el 2520 inc. 2° es el principio general que esa norma aplica (IV.B.4.4 (i)).',
  'respuesta', 'tiene un tope de diez años desde la celebración del acto (' + A('2520 inc. 2°') + ')',
  'tiene un tope de diez años desde la celebración del acto (' + A('1692 inc. final') + ')'),
 ('aj-fc-156', 'fondo',
  'La cita del art. 1467 está cortada: el artículo dice "sin una causa real y lícita".',
  'respuesta', '("no puede haber obligación sin una causa")',
  '("no puede haber obligación sin una causa real y lícita")'),
 ('aj-fc-101', 'precision',
  'Dice que se presume el justo temor cuando el mal amenaza "a la víctima". El manual solo menciona la presunción respecto del consorte, ascendientes y descendientes (II.A.7.3 (ii) c)).',
  'respuesta', 'Se presume justo temor cuando el mal amenaza a la víctima, su <b>consorte</b>',
  'Se presume justo temor cuando el mal amenaza al <b>consorte</b>'),
 ('aj-fc-159', 'precision',
  'Los dos casos de actos sin causa real son los que identifica VIAL, y el de los simulados es "una opinión propia" suya (II.D.5 (i)). La tarjeta los presenta como regla general.',
  'respuesta', 'Casos sin causa real:', 'Casos sin causa real, según VIAL:'),
 ('aj-fc-278', 'precision',
  'Generaliza el ejemplo: el manual dice que caducan los testamentos privilegiados "en los casos que la ley señala" y da como ejemplo el verbal otorgado a bordo de un buque de guerra, si el testador sobrevive al peligro (art. 1053).',
  'respuesta', 'como el testamento privilegiado cuando el testador sobrevive (' + A('1212 inc. 2°') + ')',
  'como los testamentos privilegiados en los casos que la ley señala (' + A('1212 inc. 2°') + '): el verbal otorgado a bordo de un buque de guerra caduca si el testador sobrevive al peligro (' + A(1053) + ')'),
 ('aj-fc-089', 'precision',
  '"Por eso el dolo exige..." crea una relación de causa que el manual no hace: los elementos del dolo están en II.A.6.1 (iii) sin ese "por eso".',
  'respuesta', 'Por eso el dolo exige', 'El dolo exige, además,'),
 ('aj-fc-005', 'precision',
  'Agrega "ordinaria" a la prenda; el manual dice solo "la prenda" (I.8.7). Laura (2026-10-09): cambiar a "prenda civil".',
  'respuesta', 'depósito, prenda ordinaria)', 'depósito, prenda civil)'),
 ('aj-fc-060', 'forma',
  'La pregunta habla de "aceptación", pero el segundo caso (art. 1233) es repudio. Además dice "del manual".',
  'pregunta', '¿Cuándo vale el silencio como aceptación por disposición de la ley? Dé los dos casos del manual.',
  '¿En qué casos le da la ley al silencio valor de manifestación de voluntad? Dé dos ejemplos.'),
 ('aj-fc-009', 'forma',
  'Alude al "ejemplo del ladrón y el comprador", que ya no está en el manual (hoy es el de la Coni y el Kevin con la bicicleta, I.4 b)). El contenido sigue siendo correcto.',
  'pregunta', 'En el ejemplo del ladrón y el comprador, ¿qué distingue el efecto práctico del efecto jurídico?',
  'Quien compra una cosa y quien la roba persiguen el mismo fin. ¿Qué distingue el efecto práctico del efecto jurídico?'),
 ('aj-fc-157', 'forma', '"Pothier" va sin el formato de autor (negrita y mayúscula), como en el resto.',
  'respuesta', 'calzan con Pothier (', 'calzan con <b>POTHIER</b> ('),
 ('aj-fc-193', 'forma', 'El "art. 6° A" no tiene el formato de artículo.',
  'respuesta', '(art. 6° A)', '(' + A('6° A') + ')'),
 ('aj-fc-222', 'forma', 'El "art. 37 de la Ley de Matrimonio Civil" no tiene el formato de artículo.',
  'respuesta', 'y art. 37 de la Ley de Matrimonio Civil)', 'y ' + A('37 de la Ley de Matrimonio Civil') + ')'),
 ('aj-fc-232', 'forma', 'Tutea ("Compara"); el resto de las tarjetas usa "usted" (Dé, Mencione, Distinga).',
  'pregunta', 'Compara los plazos', 'Compare los plazos'),
 ('aj-fc-270', 'forma', 'Tutea ("Da ejemplos"); el resto usa "usted".',
  'pregunta', 'Da ejemplos de cada una.', 'Dé ejemplos de cada una.'),
]

# Lo que dice el manual, literal, para aprobar sin abrirlo.
CITAS = {
 'aj-fc-248': 'Y hay un tope absoluto: el propio art. 1692 inciso final dice que, pese a la suspensión, nunca puede pedirse la rescisión pasados diez años desde la celebración del acto, aplicación del mismo principio que hace que, transcurridos diez años, dejen de considerarse las suspensiones establecidas a favor de ciertas personas (art. 2520 inc. 2°).',
 'aj-fc-156': 'Art. 1467. "No puede haber obligación sin una causa real y lícita; pero no es necesario expresarla.',
 'aj-fc-101': 'No es necesario que la amenaza recaiga sobre la propia víctima. El artículo menciona también a su consorte, sus ascendientes y sus descendientes, y respecto de ellos se presume que el mal amenazado infundió un justo temor.',
 'aj-fc-159': 'Es raro que un acto no tenga causa, pero puede pasar. [...] VIAL identifica dos casos: [...] Los actos simulados [...] Es una opinión propia [...] Los actos cuyo único motivo es creer, por error, que existe una obligación.',
 'aj-fc-278': 'así caducan los testamentos privilegiados en los casos que la ley señala (art. 1212 inciso 2°), como el testamento verbal otorgado a bordo de un buque de guerra, que caduca si el testador sobrevive al peligro (art. 1053)',
 'aj-fc-089': 'El dolo y el error tienen algo en común: en ambos la víctima se representa la realidad de manera falsa. La diferencia está en el origen de esa falsa representación. En el error, la persona se equivoca sola; en el dolo, alguien la hace equivocarse.',
 'aj-fc-005': 'Un acto es real si, además de la voluntad, necesita la entrega de una cosa para perfeccionarse: el comodato, el mutuo, el depósito, la prenda.',
 'aj-fc-060': 'La ley también le da valor al silencio, aunque en sentido inverso, en el caso del asignatario que no se pronuncia sobre la herencia: si está constituido en mora de declarar si la acepta o la repudia, su silencio vale como repudio.',
 'aj-fc-009': 'La Coni y el Kevin quieren exactamente lo mismo: andar en la misma bicicleta eléctrica. La Coni la compra en una tienda de Providencia; el Kevin se la lleva sin permiso del estacionamiento del metro.',
}
