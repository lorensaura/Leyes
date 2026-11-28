# Evaluación de Acto Jurídico, tanda 8: Discriminación MC del tema 20 (Nulidad), segunda y última tanda.
# Completa lo que dejó lote_mc1.py hacia el tope de la regla de cantidad, sin repetir elementos ni
# escenarios de la tanda 1, con los mismos criterios: distractores que son errores jurídicos reales,
# paridad de extensión, la correcta nunca como única opción con su conclusión (una opción equivocada
# llega a la conclusión correcta por una razón errada), fronteras entre temas y posición repartida.
#
# Formato de cada ítem: el mismo de lote_mc1.py.
TABLA = 'Discriminación MC'
PREFIJO = 'aj-mc'

ITEMS = [
 # T21.01 Reglas, concepto general y especies de nulidad (15 exámenes; la tanda 1 dejó 2)
 dict(sub='T21.01',
  caso='Marta le vende su auto a Ignacio en $8.000.000, pagaderos en cuatro cuotas. El contrato cumple todos los requisitos que la ley exige para su valor. Ignacio paga la primera cuota y deja de pagar las demás, y Marta quiere demandar la nulidad de la compraventa.',
  enunciado='¿Puede Marta pedir la nulidad?',
  opciones=[
   ('Sí: nulidad absoluta, porque el contrato quedó sin precio, que es de su esencia.',
    'Incorrecto. El precio se pactó al celebrar el contrato: no falta. Que después no se pague es un incumplimiento, no la omisión de un requisito del acto.'),
   ('No: la falta de pago es un incumplimiento posterior, no un vicio del contrato.',
    'CORRECTO. La nulidad es la sanción por la omisión de los requisitos que la ley prescribe para el valor de un acto según su especie y la calidad o estado de las partes (art. 1681). Este contrato los cumplió todos al celebrarse. Lo que falla después es su cumplimiento, y un hecho posterior no puede volver nulo un acto que nació válido.'),
   ('Sí: nulidad relativa, porque la falta de pago perjudica solo a Marta.',
    'Incorrecto. La nulidad relativa sanciona la omisión de un requisito exigido en atención a la calidad o estado de las partes. La falta de pago no es un requisito omitido, sino un incumplimiento posterior.'),
   ('No: como el contrato ya se cumplió en parte, la nulidad ya no procede.',
    'Incorrecto. Llega a la conclusión correcta por una razón equivocada: que el contrato se haya cumplido en parte no impide la nulidad, porque la sentencia que la declara borra hacia atrás los efectos ya producidos. Aquí no hay nulidad porque no hay vicio.')],
  correcta='B',
  articulos='1681',
  objetivo='Evaluar si el alumno reconoce que la nulidad sanciona la omisión de requisitos al celebrarse el acto, y la distingue del incumplimiento posterior.',
  respaldo=['IV.B.1.2', 'IV.B.1.3', 'IV.B.1.7']),

 # T21.03 Diferencias entre nulidad absoluta y relativa (5 exámenes; la tanda 1 dejó 1)
 dict(sub='T21.03',
  caso='En un juicio, Gabriela le cobra a Francisco el precio de una moto que le vendió. En la propia escritura de compraventa consta que Francisco tenía 16 años al firmarla y que sus padres no la autorizaron. Ninguna de las partes alega la nulidad.',
  enunciado='¿Puede el juez declarar de oficio la nulidad de la compraventa?',
  opciones=[
   ('Sí: el vicio aparece de manifiesto en la escritura, y eso basta para declararla.',
    'Incorrecto. La declaración de oficio cuando el vicio aparece de manifiesto es propia de la nulidad absoluta. El acto de un menor adulto adolece de nulidad relativa, que el juez no puede declarar sino a pedimento de parte (art. 1684).'),
   ('Sí: el juez debe proteger de oficio a los incapaces, aunque estos no lo pidan.',
    'Incorrecto. La nulidad relativa protege al incapaz, pero deja en sus manos la decisión de alegarla: el art. 1684 dispone que no puede ser declarada por el juez sino a pedimento de parte.'),
   ('No: el vicio no aparece de manifiesto, porque la edad debe probarse aparte.',
    'Incorrecto. Llega a la conclusión correcta por una razón equivocada: la edad consta en la propia escritura, así que el vicio sí aparece de manifiesto. Igual no puede declararse de oficio, porque la nulidad es relativa.'),
   ('No: esta nulidad solo se declara a petición de parte, aunque sea manifiesta.',
    'CORRECTO. La nulidad del acto de un menor adulto es relativa, y la nulidad relativa no puede ser declarada por el juez sino a pedimento de parte (art. 1684). Que el vicio aparezca de manifiesto en el acto solo importa para la absoluta (art. 1683).')],
  correcta='D',
  articulos='1683, 1684',
  objetivo='Evaluar si el alumno sabe que la declaración de oficio es exclusiva de la nulidad absoluta, aunque el vicio de la relativa aparezca de manifiesto.',
  respaldo=['IV.B.1.6', 'IV.B.2.4', 'IV.B.3.4']),

 # T21.06 Nulidad absoluta: concepto, causales y fundamento (10 exámenes; la tanda 1 dejó 2)
 dict(sub='T21.06',
  caso='Rocío le vende a Tomás un caballo de carrera. Ninguno de los dos sabe que el caballo había muerto el día anterior, de modo que la cosa vendida ya no existía cuando se celebró el contrato.',
  enunciado='Para la doctrina que niega que el Código Civil distinga la inexistencia de la nulidad, ¿qué sanción afecta a la compraventa?',
  opciones=[
   ('Nulidad absoluta: el Código trata la falta de objeto igual que el objeto ilícito.',
    'CORRECTO. Para esta doctrina, aunque el art. 1682 solo menciona el objeto ilícito, la falta de objeto se sanciona igual: el art. 1461 equipara el hecho físicamente imposible, la falta de objeto más radical, con el moralmente imposible. Por eso quienes rechazan la inexistencia agregan la falta de objeto a las causales de nulidad absoluta.'),
   ('Nulidad relativa: el art. 1682 no menciona la falta de objeto, y rige la regla general.',
    'Incorrecto. Es la conclusión que la tesis contraria le atribuye a esta doctrina para criticarla, y que califica de aberración. Quienes niegan la inexistencia no llegan a ella: sostienen que la falta de objeto queda comprendida en la nulidad absoluta.'),
   ('Inexistencia: sin objeto el contrato no llega a nacer, y no hay nada que anular.',
    'Incorrecto. Es la respuesta de la doctrina contraria, la que acepta la inexistencia. La pregunta pide la de quienes la niegan.'),
   ('Nulidad absoluta, que Rocío puede alegar aunque supiera que el caballo había muerto.',
    'Incorrecto. Acierta en la sanción, pero no en quién puede alegarla: queda excluido de la acción quien celebró el contrato sabiendo o debiendo saber el vicio que lo invalidaba (art. 1683).')],
  correcta='A',
  articulos='1461, 1682, 1683',
  objetivo='Evaluar si el alumno sabe cómo sanciona la falta de objeto la doctrina que niega la inexistencia, y la distingue de la tesis contraria.',
  respaldo=['IV.B.2.2', 'IV.B.2.4', 'IV.A.4', 'II.C.2']),

 # T21.07 Nulidad absoluta: quién la declara o pide (14 exámenes; la tanda 1 dejó 2)
 dict(sub='T21.07',
  caso='Inés le encarga a Lucas, su mandatario (la persona a quien encomendó celebrar actos en su nombre), que le compre un terreno. Lucas lo compra sabiendo que el contrato tiene un vicio de nulidad absoluta. Inés no lo sabía ni tenía cómo saberlo, y no intervino en la compra. Ahora quiere demandar la nulidad absoluta.',
  enunciado='Según la postura que hoy se impone, ¿puede Inés alegarla?',
  opciones=[
   ('No: lo que hace el representante se estima hecho por el representado.',
    'Incorrecto. Es el argumento de la postura contraria, con apoyo en el art. 1448. Hoy se impone la otra: la prohibición alcanza a quien intervino directamente en el contrato, no a quien actuó representado.'),
   ('No: el art. 1683 excluye a quien celebró el contrato, por sí o por otro.',
    'Incorrecto. El art. 1683 excluye a quien ejecutó el acto o celebró el contrato sabiendo o debiendo saber el vicio. Según la postura que se impone, eso no alcanza a quien actuó representado, salvo que su propia voluntad haya concurrido en el vicio.'),
   ('Sí: la exclusión alcanza solo a quien intervino directamente en el contrato.',
    'CORRECTO. Hoy se impone que la prohibición del art. 1683 alcanza a quien intervino directamente en el acto o contrato, no a quien actuó representado, salvo que se acredite de modo inequívoco que su propia voluntad concurrió en el vicio. El dolo es personalísimo, y el representante solo está autorizado para ejecutar actos lícitos.'),
   ('Sí, y también Lucas, porque compró en nombre ajeno y no para sí mismo.',
    'Incorrecto. Acierta en que Inés puede alegarla, pero no Lucas: él intervino directamente en el contrato sabiendo el vicio, y a él lo excluye el art. 1683.')],
  correcta='C',
  articulos='1448, 1683',
  objetivo='Evaluar si el alumno aplica la postura que hoy se impone sobre el representado frente a la exclusión del art. 1683, y la distingue de la contraria.',
  respaldo=['IV.B.2.4']),

 dict(sub='T21.07',
  caso='El fiscal judicial de la Corte Suprema, que integra el ministerio público regulado en el Código Orgánico de Tribunales (no la fiscalía que investiga delitos), toma conocimiento de un contrato cuyo objeto ilícito consta en su propio texto, y que ninguna de las partes ha impugnado. No tiene ningún interés patrimonial en él, pero estima que atenta contra la moral, y pide su nulidad.',
  enunciado='¿Puede el fiscal judicial pedir la nulidad absoluta?',
  opciones=[
   ('No: quien alega la nulidad absoluta debe acreditar un interés pecuniario.',
    'Incorrecto. El interés pecuniario se exige a los particulares que la alegan. El ministerio público tiene una vía propia: el art. 1683 le permite pedirla en el interés de la moral o de la ley.'),
   ('Sí: el ministerio público puede pedirla en el interés de la moral o de la ley.',
    'CORRECTO. El art. 1683 dispone que la nulidad absoluta puede asimismo pedirse por el ministerio público en el interés de la moral o de la ley. Se trata del organismo auxiliar de la administración de justicia del art. 350 COT, no del que participa en el proceso penal.'),
   ('No: solo pueden pedirla las partes, y el juez declararla si el vicio es manifiesto.',
    'Incorrecto. La nulidad absoluta tiene tres caminos: la declaración de oficio por el juez, la petición de todo el que tenga interés y la petición del ministerio público.'),
   ('Sí: el vicio consta en el propio contrato, y eso lo habilita para pedir la nulidad.',
    'Incorrecto. Llega a la conclusión correcta por una razón equivocada: que el vicio aparezca de manifiesto en el acto es la condición para que el juez la declare de oficio. El ministerio público puede pedirla en el interés de la moral o de la ley, conste o no el vicio en el contrato.')],
  correcta='B',
  articulos='1683',
  objetivo='Evaluar si el alumno sabe que el ministerio público puede pedir la nulidad absoluta en el interés de la moral o de la ley, sin interés pecuniario.',
  respaldo=['IV.B.2.4']),

 # T21.08 Nulidad absoluta: saneamiento y no opera de pleno derecho (9 exámenes; la tanda 1 dejó 1)
 dict(sub='T21.08',
  caso='Andrea le vende a Joaquín un terreno mediante un contrato con causa ilícita. Joaquín toma posesión del terreno y lo arrienda a un tercero. Andrea se arrepiente: le escribe que "el contrato es nulo de pleno derecho y no vale nada", y le exige que desocupe el terreno. Nadie ha demandado la nulidad.',
  enunciado='Para la doctrina tradicional, ¿en qué situación está el contrato?',
  opciones=[
   ('No produce efectos: por la gravedad del vicio, la nulidad absoluta opera sola.',
    'Incorrecto. Es la opinión de quienes discrepan de la doctrina tradicional: para ellos, la gravedad de la nulidad absoluta hace que opere de pleno derecho. La doctrina tradicional exige que el juez la declare.'),
   ('Produce efectos, porque la nulidad absoluta se sanea mientras nadie la alegue.',
    'Incorrecto. Llega a la conclusión correcta por una razón equivocada: el acto produce efectos porque la nulidad necesita ser declarada, no porque se sanee mientras nadie la alega. La nulidad absoluta solo se sanea por el transcurso de diez años (art. 1683).'),
   ('No produce efectos: el juez debe declarar de oficio la nulidad absoluta.',
    'Incorrecto. El juez debe declararla de oficio cuando el vicio aparece de manifiesto en el acto, pero eso supone un juicio y una sentencia. Mientras no la dicte, el acto produce sus efectos.'),
   ('Produce todos sus efectos, hasta que una sentencia declare la nulidad.',
    'CORRECTO. Para la doctrina tradicional, la nulidad absoluta no opera de pleno derecho: necesita ser declarada por el juez, como se deduce de las normas que hablan de la nulidad judicialmente declarada (arts. 1687 y 1689, entre otras). Mientras esa sentencia no exista, el acto nulo absolutamente sigue produciendo todos sus efectos.')],
  correcta='D',
  articulos='1683, 1687, 1689',
  objetivo='Evaluar si el alumno sabe que, para la doctrina tradicional, la nulidad absoluta no opera de pleno derecho, y la distingue de la opinión contraria y del saneamiento.',
  respaldo=['IV.B.2.7', 'IV.B.2.4', 'IV.B.2.6']),

 # T21.09 Nulidad relativa: definición, fundamento, causales y características (11 exámenes; la tanda 1 dejó 1)
 dict(sub='T21.09',
  caso='Patricio le vende su auto a Ramón porque este lo amenazó, de manera seria y creíble, con golpear a su hijo si no firmaba. Sin la amenaza, Patricio no habría vendido.',
  enunciado='¿Qué sanción afecta a la compraventa?',
  opciones=[
   ('Nulidad absoluta: amenazar con un delito hace ilícito el contrato que se obtiene.',
    'Incorrecto. La fuerza moral injusta, grave y determinante es un vicio del consentimiento, y su sanción es la nulidad relativa (art. 1682 inc. final), no la nulidad absoluta que corresponde al objeto o a la causa ilícitos.'),
   ('Inexistencia o nulidad absoluta, según la doctrina: bajo amenaza no hay voluntad.',
    'Incorrecto. Esa es la sanción de la fuerza física, en que por medios violentos se fabrica una apariencia de consentimiento y no hay voluntad alguna. En la fuerza moral la víctima sí manifiesta su voluntad, solo que no es libre.'),
   ('Nulidad relativa: Patricio manifestó su voluntad, aunque no la formó libremente.',
    'CORRECTO. Es fuerza moral: la víctima manifiesta su voluntad, consciente pero no libre, bajo la amenaza de un mal. La fuerza moral injusta, grave y determinante vicia el consentimiento, y el acto adolece de nulidad relativa (art. 1682 inc. final).'),
   ('Nulidad relativa: toda presión que influya en una decisión vicia la voluntad.',
    'Incorrecto. Llega a la conclusión correcta por una razón equivocada: no toda presión vicia el consentimiento. Solo lo hace la fuerza moral injusta, grave y determinante, como la que sufrió Patricio.')],
  correcta='C',
  articulos='1682',
  objetivo='Evaluar si el alumno reconoce la fuerza moral como causal de nulidad relativa, y la distingue de la fuerza física y del objeto o causa ilícitos.',
  respaldo=['IV.B.3.2', 'II.A.7.2', 'II.A.7.6']),

 # T21.10 Nulidad relativa: quiénes pueden alegarla (11 exámenes; la tanda 1 dejó 2)
 dict(sub='T21.10',
  caso='Tomás, de 17 años, le compró un auto a Verónica sin autorización de sus padres. Para convencerla, le mostró una cédula de identidad que él mismo había adulterado para aparentar 19 años. Tomás murió meses después sin haber demandado, y sus herederos quieren pedir la nulidad de la compra.',
  enunciado='¿Pueden los herederos de Tomás pedirla?',
  opciones=[
   ('No: si el incapaz usó dolo para inducir el contrato, tampoco pueden sus herederos.',
    'CORRECTO. Si de parte del incapaz ha habido dolo para inducir al acto o contrato, ni él ni sus herederos o cesionarios pueden alegar la nulidad (art. 1685). Mostrar una cédula adulterada es más que afirmar su edad: es dolo, y ya no hay negligencia que reprochar a Verónica.'),
   ('Sí: la sanción por el dolo del incapaz es personal y no alcanza a sus herederos.',
    'Incorrecto. Ese argumento se discute para los herederos de quien celebró a sabiendas un acto absolutamente nulo (art. 1683). Para el dolo del incapaz, el art. 1685 lo resuelve expresamente: ni él ni sus herederos o cesionarios.'),
   ('Sí: decir que era mayor de edad no inhabilita al incapaz para pedir la nulidad.',
    'Incorrecto. La simple aserción de mayor edad no lo inhabilita, pero Tomás hizo más que afirmarlo: adulteró su cédula. Eso es dolo, y el art. 1685 le cierra la puerta a él y a sus herederos.'),
   ('No: los herederos solo pueden alegar la nulidad que su causante ya inició.',
    'Incorrecto. Llega a la conclusión correcta por una razón equivocada: los herederos pueden alegar la nulidad relativa aunque su causante no la haya iniciado, porque le suceden en ese derecho. Aquí no pueden porque hubo dolo del incapaz (art. 1685).')],
  correcta='A',
  articulos='1683, 1685',
  objetivo='Evaluar si el alumno aplica el art. 1685 a los herederos del incapaz que usó dolo, y lo distingue de la simple aserción de mayor edad.',
  respaldo=['IV.B.3.4', 'IV.B.2.4']),

 # T21.11 Nulidad relativa: saneamiento por el transcurso del tiempo (15 exámenes; la tanda 1 dejó 2)
 dict(sub='T21.11',
  caso='El 1 de junio de 2021, Lucía compró una pintura convencida de que era un óleo original, y era una reproducción. Nadie la engañó: se equivocó sola. Lo descubrió el 1 de marzo de 2023. Hoy es 1 de agosto de 2025.',
  enunciado='¿Puede Lucía todavía pedir la rescisión?',
  opciones=[
   ('Sí: el cuadrienio corre desde que descubrió el error, hasta el 1 de marzo de 2027.',
    'Incorrecto. En el caso de error, el cuadrienio se cuenta desde el día de la celebración del contrato, no desde que se descubre (art. 1691).'),
   ('No: el cuadrienio corrió desde la celebración y venció el 1 de junio de 2025.',
    'CORRECTO. Lucía incurrió en un error sustancial: creyó que la pintura tenía una calidad esencial que no tenía (art. 1454 inc. 1°). En el caso de error o de dolo, el cuadrienio se cuenta desde el día de la celebración del acto o contrato (art. 1691). Venció el 1 de junio de 2025, antes de hoy, aunque Lucía descubrió el error recién en 2023.'),
   ('Sí: tiene diez años desde la celebración, es decir, hasta el 1 de junio de 2031.',
    'Incorrecto. Diez años desde la celebración es el plazo de la nulidad absoluta (art. 1683). El error sustancial produce nulidad relativa, que se sanea en cuatro años.'),
   ('No: como nadie la engañó, su error no le da derecho a pedir la nulidad.',
    'Incorrecto. Llega a la conclusión correcta por una razón equivocada: creer que una reproducción es un original es un error sobre una calidad esencial de la cosa, es decir, un error sustancial (art. 1454 inc. 1°), que es causal de nulidad relativa aunque nadie lo haya provocado. No puede pedirla porque venció el cuadrienio.')],
  correcta='B',
  articulos='1454, 1683, 1691',
  objetivo='Evaluar si el alumno cuenta el cuadrienio del error desde la celebración y no desde su descubrimiento.',
  respaldo=['IV.B.3.5', 'IV.B.3.2', 'II.A.5.3']),
]

INFORME = dict(
 titulo='Discriminación MC · Tema 20: Nulidad (tanda 2)',
 puntos=[
  ('Concepto de nulidad (IV.B.1.2)', 'Sanción por la omisión de requisitos al celebrarse el acto, no por el incumplimiento posterior.'),
  ('Diferencias (IV.B.1.6)', 'La declaración de oficio es exclusiva de la absoluta, aunque el vicio de la relativa sea manifiesto.'),
  ('Causales de la absoluta (IV.B.2.2 e IV.A.4.2)', 'La falta de objeto para la doctrina que niega la inexistencia.'),
  ('Quién la pide (IV.B.2.4)', 'El representado (postura que hoy se impone) y el ministerio público en el interés de la moral.'),
  ('No opera de pleno derecho (IV.B.2.7)', 'La nulidad absoluta necesita sentencia, según la doctrina tradicional, frente a quienes creen que opera sola.'),
  ('Causales de la relativa (IV.B.3.2)', 'La fuerza moral, frente a la física y al objeto o causa ilícitos.'),
  ('Titulares de la relativa (IV.B.3.4)', 'Herederos del incapaz que usó dolo (art. 1685).'),
  ('Saneamiento por el tiempo (IV.B.3.5)', 'Cuadrienio del error desde la celebración.'),
 ],
 cobertura=[
  ('Nulidad frente a incumplimiento', 'Concepto'),
  ('Declaración de oficio solo en la absoluta', 'Diferencia entre especies'),
  ('Falta de objeto sin inexistencia', 'Postura doctrinal'),
  ('El representado y el art. 1683', 'Postura que se impone'),
  ('Ministerio público e interés moral', 'Titular propio'),
  ('La absoluta no opera de pleno derecho', 'Doctrina tradicional frente a la contraria'),
  ('Fuerza moral: nulidad relativa', 'Frente a fuerza física e ilicitud'),
  ('Herederos del incapaz doloso (art. 1685)', 'Titulares'),
  ('Cuadrienio del error', 'Cómputo con fechas'),
 ],
 revisar=[
  ('aj-mc-022', 'Punto discutido (inexistencia): la pregunta pide la respuesta de una doctrina determinada, y la de la doctrina contraria aparece como distractor. Mira si el enunciado deja claro de qué doctrina se trata.'),
  ('aj-mc-023', 'Punto discutido (el representado), con la postura que según el manual hoy se impone. Es el mismo punto de aj-just-025, ahora para discriminar entre las dos posturas.'),
  ('aj-mc-025', 'Punto discutido (si la nulidad absoluta opera de pleno derecho), con la doctrina tradicional como respuesta. Mira si el enunciado deja claro de qué doctrina se trata.'),
  ('aj-mc-026', 'Toca la fuerza, que tiene su propio tema: el caso da por cumplidos sus requisitos y solo pregunta la sanción. Mira la frontera.'),
  ('aj-mc-020', 'Distingue nulidad de incumplimiento sin nombrar la resolución (tema 27). Mira si falta nombrarla.'),
  ('aj-mc-028', 'Cálculo con fechas, con un distractor que toca el error sin dolo: el error sustancial vicia aunque nadie lo provoque. Mira la frontera con el tema Error.'),
 ],
 avisos=[
  '<b>Nueve y no quince:</b> con estas 9, Discriminación MC de Nulidad queda en 25. Para llegar al tope de ~30 faltan preguntas en "reglas y especies", "nulidad absoluta: causales", "nulidad relativa: causales", "quiénes alegan la relativa" y "saneamiento por el tiempo", pero lo que queda de esos pasajes ya se usó en esta tanda o en la 1 con otro escenario, se repetiría casi igual en Aplicación (los cómputos de plazos) o es materia de otro tema (los requisitos del error, la fuerza, el dolo y la lesión; la ratificación; las edades de la capacidad). Prefiero dejarlo aquí antes que repetir.',
  '<b>Mismos criterios que la tanda 1:</b> cada distractor es un error jurídico real; las cuatro opciones tienen extensión pareja; y la correcta nunca es la única con su conclusión: en cada pregunta, una opción equivocada llega a la misma conclusión por una razón errada, o acierta en una parte y falla en otra. Además, cambié en las dos tandas las opciones del tipo "…, pero solo si…": todas eran incorrectas, y una alumna podía aprender a descartarlas sin saber la materia.',
  '<b>Posición de la correcta:</b> 2 en A, 3 en B, 2 en C y 2 en D en esta tanda; sumadas las dos tandas, 6 en A, 7 en B, 6 en C y 6 en D.',
  '<b>Puntos discutidos, presentados como tales:</b> la inexistencia (022, se pide la respuesta de una doctrina determinada), el representado (023, con la postura que hoy se impone según el manual) y si la nulidad absoluta opera de pleno derecho (025, se pide la de la doctrina tradicional).',
 ],
 redundancia='Ningún elemento repite uno de la tanda 1, y donde un punto ya se tocó el ángulo es el inverso: la tanda 1 negó al ministerio público la nulidad relativa (007) y exigió interés pecuniario al particular (013); aquí 024 le reconoce al ministerio público la absoluta sin interés pecuniario. La tanda 1 trató la declaración de oficio de la absoluta cuando el vicio no es manifiesto (012); aquí 021 trata la relativa cuando sí lo es. Frente a otros tipos: 023 repite el punto de aj-just-025 (allí se fundamenta, aquí se discrimina entre las posturas); 027 se parece a los casos del art. 1685 de Aplicación y Detección de error, pero pregunta por los herederos; 025 aplica a la nulidad absoluta el principio de que la nulidad necesita sentencia, que la tanda 1 (008) aplicó a la relativa, ahora frente a la doctrina que cree que la absoluta opera de pleno derecho; 028 es un cómputo parecido a los de Detección de error (el plazo no corre desde que se descubre el vicio), con otro escenario.',
)
