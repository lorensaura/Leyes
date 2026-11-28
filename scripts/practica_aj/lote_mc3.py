# Evaluación de Acto Jurídico, tanda 9: Discriminación MC del tema 20 (Nulidad), tercera tanda.
# Completa el tope de la regla de cantidad en los cinco subtemas que quedaron bajo él (Laura rechazó
# quedarse en 25 por no repetir escenarios de Aplicación: cada tipo debe poder usarse solo).
# Criterios: el caso da hechos y no calificaciones; distractores que son errores jurídicos reales;
# una opción "semi correcta" por pregunta (conclusión correcta por una razón equivocada); ninguna
# fórmula exclusiva de las incorrectas; paridad de extensión; fronteras entre temas; posición repartida.
#
# Formato de cada ítem: el mismo de lote_mc1.py.
TABLA = 'Discriminación MC'
PREFIJO = 'aj-mc'

ITEMS = [
 # T21.01 Reglas, concepto general y especies de nulidad (15 exámenes; tenía 3)
 dict(sub='T21.01',
  caso='El 1 de marzo de 2024, Claudio le vende su departamento a Marcela, que para convencerlo le muestra una tasación falsa que le asigna la mitad de su valor real; sin ese engaño, Claudio no lo habría vendido. En una cláusula del contrato, ambos declaran que "renuncian desde ya a pedir la nulidad de este contrato". Claudio descubre el engaño el 1 de junio de 2024 y demanda la rescisión el 1 de agosto de 2025.',
  enunciado='¿Le impide la cláusula a Claudio pedir la rescisión?',
  opciones=[
   ('Sí: la nulidad relativa mira solo al interés de las partes, que pueden renunciarla.',
    'Incorrecto. El beneficiado puede renunciar a la nulidad relativa después de celebrado el acto, confirmándolo, pero no por anticipado: las reglas sobre nulidad son de orden público, y el art. 1469 priva de efecto a las cláusulas del contrato en que se renuncia la acción de nulidad.'),
   ('No: las reglas sobre la nulidad son de orden público, y una cláusula no puede derogarlas.',
    'CORRECTO. Las reglas del Título XX del Libro IV son de aplicación estricta y las partes no pueden derogarlas. Por eso el art. 1469 dispone que los actos que la ley declara inválidos no dejan de serlo por las cláusulas que en ellos se introduzcan y en que se renuncie la acción de nulidad. Claudio demandó dentro del cuadrienio, que se cuenta desde la celebración (art. 1691).'),
   ('Sí: el contrato es ley para las partes, y Claudio aceptó la renuncia al firmarlo.',
    'Incorrecto. La fuerza obligatoria del contrato no alcanza a esta cláusula: el art. 1469 dispone que los actos que la ley declara inválidos no dejan de serlo por las cláusulas en que se renuncie la acción de nulidad.'),
   ('No: el cuadrienio corre desde que Claudio descubrió el engaño, y eso no lo cambia la cláusula.',
    'Incorrecto. Llega a la conclusión correcta por una razón equivocada: en el caso de dolo, el cuadrienio se cuenta desde la celebración del contrato, no desde que se descubre el engaño (art. 1691). La cláusula no impide la demanda porque la acción de nulidad no puede renunciarse por anticipado (art. 1469).')],
  correcta='B',
  articulos='1469, 1691',
  objetivo='Evaluar si el alumno sabe que las reglas sobre nulidad son de orden público y que la acción de nulidad no puede renunciarse por anticipado en el propio contrato.',
  respaldo=['IV.B.1.1', 'IV.B.1.7', 'IV.B.3.5', 'IV.B.3.6']),

 # T21.06 Nulidad absoluta: concepto, causales y fundamento (10 exámenes; tenía 3)
 dict(sub='T21.06',
  caso='Carla le vende a su primo Rodrigo, en $20.000.000, los derechos que le corresponderán en la herencia de su tío Ernesto cuando este muera. Ernesto está vivo, conoce el contrato y lo firma en señal de que está de acuerdo.',
  enunciado='¿Qué sanción afecta a la compraventa?',
  opciones=[
   ('Nulidad absoluta: la ley prohíbe contratar sobre la sucesión de una persona viva.',
    'CORRECTO. El art. 1463 prohíbe que el derecho de suceder por causa de muerte a una persona viva sea objeto de una donación o contrato, aun cuando intervenga el consentimiento de esa misma persona. Es un caso de objeto ilícito, y el objeto ilícito es causal de nulidad absoluta (art. 1682).'),
   ('Nulidad absoluta: la herencia de una persona viva aún no existe, y sin cosa no hay objeto.',
    'Incorrecto. Llega a la conclusión correcta por una razón equivocada: pueden ser objeto de un contrato no solo las cosas que existen, sino también las que se espera que existan (art. 1461). El contrato es nulo porque la ley prohíbe pactar sobre la sucesión de una persona viva, y su objeto es ilícito (art. 1463).'),
   ('Ninguna: Ernesto consintió en el contrato, y la herencia que se vende es de sus bienes.',
    'Incorrecto. El art. 1463 prohíbe el pacto aun cuando intervenga el consentimiento de la misma persona de cuya sucesión se trata. Su aprobación no salva el contrato.'),
   ('Nulidad relativa: la prohibición protege a Ernesto, y solo él o sus herederos la alegan.',
    'Incorrecto. La prohibición del art. 1463 no protege a una persona determinada, sino a la moral y al orden público: el contrato tiene objeto ilícito, y su sanción es la nulidad absoluta (art. 1682).')],
  correcta='A',
  articulos='1461, 1463, 1682',
  objetivo='Evaluar si el alumno reconoce en el pacto sobre sucesión futura un caso de objeto ilícito sancionado con nulidad absoluta, y no lo confunde con la falta de objeto.',
  respaldo=['IV.B.2.2', 'IV.A.4.2', 'II.C.4.2', 'II.C.2.1']),

 # T21.09 Nulidad relativa: definición, fundamento, causales y características (11 exámenes; tenía 2)
 dict(sub='T21.09',
  caso='Hace un año, un juez declaró a Gonzalo en interdicción por disipación (por dilapidar su patrimonio en apuestas) y le nombró un curador. La semana pasada, sin intervención de su curador, Gonzalo le vendió su camioneta a Felipe.',
  enunciado='¿Qué sanción afecta a la compraventa?',
  opciones=[
   ('Nulidad absoluta: quien está bajo interdicción carece de voluntad, como el demente.',
    'Incorrecto. El disipador no está privado de razón: es un incapaz relativo (art. 1447 inc. 3°). Sus actos pueden valer si se cumplen las formas que la ley exige, y si se omiten, la sanción es la nulidad relativa, no la absoluta de los actos del demente.'),
   ('Ninguna: la venta de una camioneta solo requiere el acuerdo en la cosa y el precio.',
    'Incorrecto. Además del acuerdo, el acto requiere capacidad. Gonzalo está bajo interdicción por disipación y es incapaz relativo (art. 1447 inc. 3°): no puede vender por sí solo, sin su curador.'),
   ('Nulidad relativa: Gonzalo es incapaz relativo y vendió sin su curador.',
    'CORRECTO. El disipador bajo interdicción de administrar lo suyo es relativamente incapaz (art. 1447 inc. 3°), y los actos de los relativamente incapaces celebrados sin las formas que la ley exige adolecen de nulidad relativa (art. 1682 inc. final).'),
   ('Nulidad relativa: la disipación vicia el consentimiento de quien vende sus bienes.',
    'Incorrecto. Llega a la conclusión correcta por una razón equivocada: la disipación no es un vicio del consentimiento (los vicios son el error, la fuerza y el dolo). La causal es la incapacidad relativa del disipador bajo interdicción (art. 1447 inc. 3°).')],
  correcta='C',
  articulos='1447, 1682',
  objetivo='Evaluar si el alumno reconoce en el acto del disipador interdicto una causal de nulidad relativa, y lo distingue del acto del demente y de los vicios del consentimiento.',
  respaldo=['IV.B.3.2', 'II.B.3.2', 'II.B.3.1']),

 dict(sub='T21.09',
  caso='Sofía, de 16 años, le vendió su guitarra a Tomás sin autorización de sus padres. Al cumplir 18 años, sabiendo que la venta podía anularse, firmó ante notario una declaración en que dice que confirma la venta y renuncia a pedir su nulidad. Un año después se arrepiente y quiere recuperar la guitarra.',
  enunciado='¿Qué sanción afecta hoy a la compraventa?',
  opciones=[
   ('Nulidad relativa: el acto de un incapaz no puede sanearse por la sola voluntad de las partes.',
    'Incorrecto. Eso es lo que ocurre en la nulidad absoluta, que no puede sanearse por la ratificación de las partes (art. 1683). La nulidad relativa protege a personas determinadas, y por eso puede sanearse por la ratificación de quien podía alegarla (art. 1684).'),
   ('Ninguna: Sofía ya es mayor de edad, y al cesar su incapacidad la venta quedó válida.',
    'Incorrecto. Llega a la conclusión correcta por una razón equivocada: que cese la incapacidad no sanea el acto, solo hace correr el cuadrienio para pedir la rescisión (art. 1691). La venta quedó sana porque Sofía, ya capaz, la ratificó.'),
   ('Nulidad relativa, que Sofía puede alegar por cuatro años desde que cumplió 18.',
    'Incorrecto. Ese sería el plazo si Sofía no hubiera hecho nada (art. 1691). Pero la nulidad relativa también se sanea por la ratificación de quien podía alegarla (art. 1684), y Sofía la ratificó.'),
   ('Ninguna: la nulidad relativa se sanea por la ratificación de quien podía alegarla.',
    'CORRECTO. Una de las características de la nulidad relativa, que se desprende de que protege a personas determinadas, es que puede sanearse por la ratificación de las partes (art. 1684). Sofía, ya mayor de edad y en cuyo beneficio se estableció la nulidad, declaró que confirmaba la venta: el vicio desapareció.')],
  correcta='D',
  articulos='1683, 1684, 1691',
  objetivo='Evaluar si el alumno sabe que la nulidad relativa, a diferencia de la absoluta, se sanea por la ratificación, y no la confunde con el solo cese de la incapacidad.',
  respaldo=['IV.B.3.3', 'IV.B.3.4', 'IV.B.3.5', 'IV.B.3.6', 'IV.B.1.6']),

 # T21.10 Nulidad relativa: quiénes pueden alegarla (11 exámenes; tenía 3)
 dict(sub='T21.10',
  caso='Camila, de 17 años, le compra un computador a Diego sin autorización de sus padres. Antes de firmar, le dice que tiene 18 años; Diego le cree y no le pide su cédula de identidad. Un mes después, Camila quiere pedir la nulidad de la compra.',
  enunciado='¿Puede Camila pedirla?',
  opciones=[
   ('Sí: decir que es mayor de edad no le impide alegarla; Diego debió cerciorarse.',
    'CORRECTO. La aserción de mayor edad no inhabilita al incapaz para obtener el pronunciamiento de nulidad (art. 1685, segunda parte). Fue Diego quien actuó con negligencia, al conformarse con la sola palabra de Camila sin verificar su edad.'),
   ('No: al mentir sobre su edad, Camila actuó con dolo, y el dolo le impide alegarla.',
    'Incorrecto. El art. 1685 distingue: el dolo del incapaz para inducir el contrato le impide alegar la nulidad, pero la simple aserción de mayor edad no. Camila solo dijo que tenía 18 años; no empleó ningún artificio, como una cédula adulterada.'),
   ('No: la engañada fue la contraparte, y por eso es Diego quien puede alegar la nulidad.',
    'Incorrecto. La nulidad relativa solo puede alegarla aquel en cuyo beneficio la estableció la ley (art. 1684). La incapacidad protege a Camila, no a Diego.'),
   ('Sí: el menor puede alegar la nulidad aunque haya engañado a la contraparte sobre su edad.',
    'Incorrecto. Llega a la conclusión correcta por una razón equivocada: si el incapaz usó dolo para inducir el contrato, ni él ni sus herederos o cesionarios pueden alegar la nulidad (art. 1685). Camila puede porque no hubo dolo, solo la aserción de su edad.')],
  correcta='A',
  articulos='1684, 1685',
  objetivo='Evaluar si el alumno distingue la simple aserción de mayor edad, que no impide al incapaz alegar la nulidad, del dolo del art. 1685.',
  respaldo=['IV.B.3.4']),

 # T21.11 Nulidad relativa: saneamiento por el transcurso del tiempo (15 exámenes; tenía 3)
 dict(sub='T21.11',
  caso='El 1 de abril de 2022, Esteban le vendió su parcela a Rosa porque ella le mostró un informe falso según el cual el terreno no tenía agua; sin ese engaño, no la habría vendido. Esteban descubrió el engaño el 1 de mayo de 2022 y murió el 1 de abril de 2024 sin haber demandado. Su único heredero es su hijo Martín, de 30 años. Hoy es 1 de junio de 2026.',
  enunciado='¿Puede Martín todavía pedir la rescisión?',
  opciones=[
   ('Sí: para el heredero, el cuadrienio empieza a correr de nuevo desde la muerte de su padre.',
    'Incorrecto. El heredero mayor de edad no recibe un cuadrienio nuevo: si el plazo ya corría, solo goza de lo que reste (art. 1692). El plazo no se interrumpe ni se reinicia con la muerte del causante.'),
   ('Sí: como heredero, tiene diez años desde la celebración, hasta el 1 de abril de 2032.',
    'Incorrecto. El tope de diez años desde la celebración es el límite de la suspensión a favor de los herederos menores de edad (art. 1692). Martín es mayor: para él no hay suspensión, y rige el residuo del cuadrienio.'),
   ('No: como heredero mayor de edad, solo tenía el residuo, que venció el 1 de abril de 2026.',
    'CORRECTO. En el caso de dolo, el cuadrienio se cuenta desde la celebración (art. 1691): corría desde el 1 de abril de 2022. Si los herederos son mayores de edad, el plazo no se suspende y gozan solo de lo que reste (art. 1692). A Martín le quedaban dos años, que vencieron el 1 de abril de 2026.'),
   ('No: el cuadrienio corrió desde que se descubrió el engaño, y venció el 1 de mayo de 2026.',
    'Incorrecto. Llega a la conclusión correcta por una razón equivocada: en el caso de dolo, el cuadrienio se cuenta desde la celebración del contrato, no desde que se descubre el engaño (art. 1691). Venció el 1 de abril de 2026.')],
  correcta='C',
  articulos='1691, 1692',
  objetivo='Evaluar si el alumno aplica el art. 1692 al heredero mayor de edad, que solo goza del residuo del cuadrienio, y lo distingue de la suspensión a favor del heredero menor.',
  respaldo=['IV.B.3.5']),
]

INFORME = dict(
 titulo='Discriminación MC · Tema 20: Nulidad (tanda 3)',
 puntos=[
  ('Reglas del Código (IV.B.1.1 y 1.7)', 'Las reglas sobre nulidad son de orden público: una cláusula del contrato no puede renunciar a la acción (art. 1469).'),
  ('Causales de la absoluta (IV.B.2.2 y II.C.4.2)', 'El pacto sobre sucesión futura: objeto ilícito, no falta de objeto.'),
  ('Causales de la relativa (IV.B.3.2)', 'El acto del disipador interdicto. Características: la relativa se sanea por la ratificación.'),
  ('Titulares de la relativa (IV.B.3.4)', 'La simple aserción de mayor edad no inhabilita al incapaz (art. 1685, segunda parte).'),
  ('Saneamiento por el tiempo (IV.B.3.5)', 'El heredero mayor de edad goza solo del residuo del cuadrienio (art. 1692).'),
 ],
 cobertura=[
  ('Orden público de las reglas sobre nulidad', 'Renuncia anticipada en el contrato'),
  ('Pacto sobre sucesión futura', 'Objeto ilícito frente a falta de objeto'),
  ('Disipador interdicto: nulidad relativa', 'Frente al demente y a los vicios del consentimiento'),
  ('La relativa se sanea por la ratificación', 'Frente a la absoluta y al cese de la incapacidad'),
  ('Simple aserción de mayor edad', 'Frente al dolo del incapaz'),
  ('Heredero mayor: residuo del cuadrienio', 'Cómputo con fechas, frente al heredero menor'),
 ],
 revisar=[
  ('aj-mc-029', 'Toca dos subtemas a la vez: el orden público de las reglas (reglas y especies) y la prohibición de renunciar por anticipado a la nulidad (art. 1469, principios comunes). Mira si la pregunta queda bien en "reglas y especies".'),
  ('aj-mc-030', 'Usa el art. 1463 (objeto ilícito, otro tema), pero solo para la sanción: el caso da los hechos y la alumna deduce el objeto ilícito, como en aj-mc-006. Mira la frontera.'),
  ('aj-mc-032', 'Toca la ratificación, que tiene su propio tema (22), pero solo como característica de la nulidad relativa (IV.B.3.3): el caso da por cumplidos sus requisitos (Sofía ya es capaz y sabe del vicio). Es además la primera pregunta de Nulidad en que la correcta es "Ninguna". Mira la frontera.'),
  ('aj-mc-034', 'Cálculo con fechas (heredero mayor y residuo del cuadrienio). Es el ángulo inverso de aj-mc-019 (heredero menor con tope de diez años). Revisa las fechas.'),
 ],
 avisos=[
  '<b>Con estas 6, Discriminación MC de Nulidad queda en 31:</b> 4 en cada uno de los subtemas importantes (reglas y especies, causales de la absoluta, quién la pide, causales de la relativa, titulares de la relativa y saneamiento por el tiempo), 2 en diferencias y en saneamiento de la absoluta (subtemas de menos de 10 exámenes), y 1 en cada subtema chico. Es el tope de la regla de cantidad.',
  '<b>Mismos criterios de las tandas 1 y 2:</b> el caso da hechos y no calificaciones (la alumna deduce el dolo, la fuerza, la incapacidad o el objeto ilícito); en cada pregunta hay una opción que llega a la conclusión correcta por una razón equivocada; ninguna fórmula aparece solo en opciones incorrectas; y las cuatro opciones tienen extensión pareja.',
  '<b>Posición de la correcta:</b> 2 en A, 1 en B, 2 en C y 1 en D en esta tanda; sumadas las tres tandas, 8 en A, 8 en B, 8 en C y 7 en D.',
  '<b>Figura de otra materia explicada en el caso:</b> la interdicción por disipación (031: "por dilapidar su patrimonio en apuestas"), sin decir que el disipador es incapaz relativo, que es lo que la alumna debe deducir.',
 ],
 redundancia='Ningún elemento repite uno de las tandas 1 y 2. Donde el punto ya se tocó, el ángulo es otro: la tanda 1 trató al demente interdicto (010, nulidad absoluta); aquí 031 trata al disipador interdicto (relativa). La tanda 1 trató que la nulidad absoluta no se sanea por ratificación (014); aquí 032 trata la relativa, que sí se sanea. La tanda 2 trató el dolo del incapaz que adulteró su cédula (027); aquí 033 trata la simple aserción de su edad, la otra mitad del art. 1685. La tanda 1 trató al heredero menor (019); aquí 034 trata al heredero mayor. La tanda 2 trató la falta de objeto para quienes niegan la inexistencia (022); aquí 030 distingue el objeto ilícito del pacto sobre sucesión futura de la falta de objeto. Frente a otros tipos: 029 toca la prohibición de renunciar por anticipado a la nulidad, que no aparece en Discriminación MC; 033 y 034 se parecen a casos del art. 1685 y del art. 1692 de Aplicación y Detección de error, con otro escenario.',
)
