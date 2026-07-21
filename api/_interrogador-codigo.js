// Artículos del Código Civil chileno relevantes a Responsabilidad civil
// (contractual y extracontractual), para que el Interrogador IA cite el
// texto legal exacto y nunca "invente" una norma o su redacción.
//
// Fuente: texto consolidado del Código Civil (DFL 1, 2000, Ministerio de
// Justicia) publicado por la Biblioteca del Congreso Nacional, vía Justia
// Chile (chile.justia.com). Extraído y revisado a mano el 2026-07-13:
// el HTML fuente tiene marcas de agua de página que a veces se comen una
// letra o insertan la referencia a la ley que modificó el artículo en
// medio del texto — se corrigió comparando cada artículo con el original.
//
// Alcance: solo los títulos usados por el examinador (ver ALCANCE DE LA
// MATERIA en _interrogador-prompt.js), no el Código completo. Si el
// Interrogador amplía su materia más adelante, hay que sumar los títulos
// nuevos acá (no existe script que regenere esto — es curado a mano).
//
// 2026-07-20: se agregaron los artículos de Código Civil sobre
// interpretación de los contratos (1560, 1563, 1566), condonación del
// dolo futuro (1465), condición potestativa (1478) y efectos de la
// nulidad (1687), más los artículos 97 a 106 del Código de Comercio
// (formación del consentimiento), para dar grounding al alcance nuevo de
// Responsabilidad Precontractual. Fuente de estos: leyes-cl.com (texto
// vigente), cruzado contra el fragmento citado por Justia en resultados
// de búsqueda para los arts. 98 y 100 — BCN/Justia no fueron accesibles
// por fetch simple al momento de la curación (misma limitación que en
// 2026-07-13, ver arriba).

module.exports = `
===== CÓDIGO CIVIL: ARTÍCULOS DE REFERENCIA (RESPONSABILIDAD) =====

TÍTULO PRELIMINAR

Art. 44. La ley distingue tres especies de culpa o descuido.
Culpa grave, negligencia grave, culpa lata, es la que consiste en no
manejar los negocios ajenos con aquel cuidado que aun las personas
negligentes y de poca prudencia suelen emplear en sus negocios propios.
Esta culpa en materias civiles equivale al dolo.
Culpa leve, descuido leve, descuido ligero, es la falta de aquella
diligencia y cuidado que los hombres emplean ordinariamente en sus
negocios propios. Culpa o descuido, sin otra calificación, significa
culpa o descuido leve. Esta especie de culpa se opone a la diligencia o
cuidado ordinario o mediano. El que debe administrar un negocio como un
buen padre de familia es responsable de esta especie de culpa.
Culpa o descuido levísimo es la falta de aquella esmerada diligencia que
un hombre juicioso emplea en la administración de sus negocios
importantes. Esta especie de culpa se opone a la suma diligencia o
cuidado.
El dolo consiste en la intención positiva de inferir injuria a la
persona o propiedad de otro.

Art. 45. Se llama fuerza mayor o caso fortuito el imprevisto a que no
es posible resistir, como un naufragio, un terremoto, el apresamiento de
enemigos, los actos de autoridad ejercidos por un funcionario público,
etc.

LIBRO IV — TÍTULO IV: DE LAS OBLIGACIONES CONDICIONALES

Art. 1489. En los contratos bilaterales va envuelta la condición
resolutoria de no cumplirse por uno de los contratantes lo pactado.
Pero en tal caso podrá el otro contratante pedir a su arbitrio o la
resolución o el cumplimiento del contrato, con indemnización de
perjuicios.

LIBRO IV — TÍTULO XI: DE LAS OBLIGACIONES CON CLÁUSULA PENAL

Art. 1535. La cláusula penal es aquella en que una persona, para
asegurar el cumplimiento de una obligación, se sujeta a una pena, que
consiste en dar o hacer algo en caso de no ejecutar o de retardar la
obligación principal.

Art. 1536. La nulidad de la obligación principal acarrea la de la
cláusula penal, pero la nulidad de ésta no acarrea la de la obligación
principal.
Con todo, cuando uno promete por otra persona, imponiéndose una pena
para el caso de no cumplirse por ésta lo prometido, valdrá la pena,
aunque la obligación principal no tenga efecto por falta del
consentimiento de dicha persona.
Lo mismo sucederá cuando uno estipula con otro a favor de un tercero, y
la persona con quien se estipula se sujeta a una pena para el caso de
no cumplir lo prometido.

Art. 1537. Antes de constituirse el deudor en mora, no puede el
acreedor demandar a su arbitrio la obligación principal o la pena, sino
sólo la obligación principal; ni constituido el deudor en mora, puede
el acreedor pedir a un tiempo el cumplimiento de la obligación
principal y la pena, sino cualquiera de las dos cosas a su arbitrio; a
menos que aparezca haberse estipulado la pena por el simple retardo, o
a menos que se haya estipulado que por el pago de la pena no se
entiende extinguida la obligación principal.

Art. 1538. Háyase o no estipulado un término dentro del cual deba
cumplirse la obligación principal, el deudor no incurre en la pena sino
cuando se ha constituido en mora, si la obligación es positiva. Si la
obligación es negativa, se incurre en la pena desde que se ejecuta el
hecho de que el deudor se ha obligado a abstenerse.

Art. 1539. Si el deudor cumple solamente una parte de la obligación
principal y el acreedor acepta esa parte, tendrá derecho para que se
rebaje proporcionalmente la pena estipulada por la falta de
cumplimiento de la obligación principal.

Art. 1540. Cuando la obligación contraída con cláusula penal es de
cosa divisible, la pena, del mismo modo que la obligación principal, se
divide entre los herederos del deudor a prorrata de sus cuotas
hereditarias. El heredero que contraviene a la obligación, incurre pues
en aquella parte de la pena que corresponde a su cuota hereditaria; y
el acreedor no tendrá acción alguna contra los coherederos que no han
contravenido a la obligación.
Exceptúase el caso en que habiéndose puesto la cláusula penal con la
intención expresa de que no pudiera ejecutarse parcialmente el pago,
uno de los herederos ha impedido el pago total: podrá entonces
exigirse a este heredero toda la pena, o a cada uno su respectiva
cuota, quedándole a salvo su recurso contra el heredero infractor.
Lo mismo se observará cuando la obligación contraída con cláusula
penal es de cosa indivisible.

Art. 1541. Si a la pena estuviere afecto hipotecariamente un inmueble,
podrá perseguirse toda la pena en él, salvo el recurso de indemnización
contra quien hubiere lugar.

Art. 1542. Habrá lugar a exigir la pena en todos los casos en que se
hubiere estipulado, sin que pueda alegarse por el deudor que la
inejecución de lo pactado no ha inferido perjuicio al acreedor o le ha
producido beneficio.

Art. 1543. No podrá pedirse a la vez la pena y la indemnización de
perjuicios, a menos de haberse estipulado así expresamente; pero
siempre estará al arbitrio del acreedor pedir la indemnización o la
pena.

Art. 1544. Cuando por el pacto principal una de las partes se obligó a
pagar una cantidad determinada, como equivalente a lo que por la otra
parte debe prestarse, y la pena consiste asimismo en el pago de una
cantidad determinada, podrá pedirse que se rebaje de la segunda todo lo
que exceda al duplo de la primera, incluyéndose ésta en él.
La disposición anterior no se aplica al mutuo ni a las obligaciones de
valor inapreciable o indeterminado. En el primero se podrá rebajar la
pena en lo que exceda al máximum del interés que es permitido
estipular. En las segundas se deja a la prudencia del juez moderarla,
cuando atendidas las circunstancias pareciere enorme.

LIBRO IV — TÍTULO XII: DEL EFECTO DE LAS OBLIGACIONES

Art. 1545. Todo contrato legalmente celebrado es una ley para los
contratantes, y no puede ser invalidado sino por su consentimiento
mutuo o por causas legales.

Art. 1546. Los contratos deben ejecutarse de buena fe, y por
consiguiente obligan no sólo a lo que en ellos se expresa, sino a todas
las cosas que emanan precisamente de la naturaleza de la obligación, o
que por la ley o la costumbre pertenecen a ella.

Art. 1547. El deudor no es responsable sino de la culpa lata en los
contratos que por su naturaleza sólo son útiles al acreedor; es
responsable de la leve en los contratos que se hacen para beneficio
recíproco de las partes; y de la levísima, en los contratos en que el
deudor es el único que reporta beneficio.
El deudor no es responsable del caso fortuito, a menos que se haya
constituido en mora (siendo el caso fortuito de aquellos que no
hubieran dañado a la cosa debida, si hubiese sido entregada al
acreedor), o que el caso fortuito haya sobrevenido por su culpa.
La prueba de la diligencia o cuidado incumbe al que ha debido
emplearlo; la prueba del caso fortuito al que lo alega.
Todo lo cual, sin embargo, se entiende sin perjuicio de las
disposiciones especiales de las leyes, y de las estipulaciones expresas
de las partes.

Art. 1548. La obligación de dar contiene la de entregar la cosa; y si
ésta es una especie o cuerpo cierto, contiene además la de conservarlo
hasta la entrega, so pena de pagar los perjuicios al acreedor que no se
ha constituido en mora de recibir.

Art. 1549. La obligación de conservar la cosa exige que se emplee en
su custodia el debido cuidado.

Art. 1550. El riesgo del cuerpo cierto cuya entrega se deba, es siempre
a cargo del acreedor; salvo que el deudor se constituya en mora de
efectuarla, o que se haya comprometido a entregar una misma cosa a dos
o más personas por obligaciones distintas; en cualquiera de estos
casos, será a cargo del deudor el riesgo de la cosa, hasta su entrega.

Art. 1551. El deudor está en mora,
1.º Cuando no ha cumplido la obligación dentro del término estipulado,
salvo que la ley en casos especiales exija que se requiera al deudor
para constituirle en mora;
2.º Cuando la cosa no ha podido ser dada o ejecutada sino dentro de
cierto espacio de tiempo, y el deudor lo ha dejado pasar sin darla o
ejecutarla;
3.º En los demás casos, cuando el deudor ha sido judicialmente
reconvenido por el acreedor.

Art. 1552. En los contratos bilaterales ninguno de los contratantes
está en mora dejando de cumplir lo pactado, mientras el otro no lo
cumple por su parte, o no se allana a cumplirlo en la forma y tiempo
debidos.

Art. 1553. Si la obligación es de hacer y el deudor se constituye en
mora, podrá pedir el acreedor, junto con la indemnización de la mora,
cualquiera de estas tres cosas, a elección suya:
1.ª Que se apremie al deudor para la ejecución del hecho convenido;
2.ª Que se le autorice a él mismo para hacerlo ejecutar por un tercero
a expensas del deudor;
3.ª Que el deudor le indemnice de los perjuicios resultantes de la
infracción del contrato.

Art. 1554. La promesa de celebrar un contrato no produce obligación
alguna; salvo que concurran las circunstancias siguientes:
1.ª Que la promesa conste por escrito;
2.ª Que el contrato prometido no sea de aquellos que las leyes
declaran ineficaces;
3.ª Que la promesa contenga un plazo o condición que fije la época de
la celebración del contrato;
4.ª Que en ella se especifique de tal manera el contrato prometido,
que sólo falten para que sea perfecto, la tradición de la cosa, o las
solemnidades que las leyes prescriban.
Concurriendo estas circunstancias habrá lugar a lo prevenido en el
artículo precedente.

Art. 1555. Toda obligación de no hacer una cosa se resuelve en la de
indemnizar los perjuicios, si el deudor contraviene y no puede
deshacerse lo hecho.
Pudiendo destruirse la cosa hecha, y siendo su destrucción necesaria
para el objeto que se tuvo en mira al tiempo de celebrar el contrato,
será el deudor obligado a ella, o autorizado el acreedor para que la
lleve a efecto a expensas del deudor.
Si dicho objeto puede obtenerse cumplidamente por otros medios, en
este caso será oído el deudor que se allane a prestarlo.
El acreedor quedará de todos modos indemne.

Art. 1556. La indemnización de perjuicios comprende el daño emergente
y lucro cesante, ya provengan de no haberse cumplido la obligación, o
de haberse cumplido imperfectamente, o de haberse retardado el
cumplimiento.
Exceptúanse los casos en que la ley la limita expresamente al daño
emergente.

Art. 1557. Se debe la indemnización de perjuicios desde que el deudor
se ha constituido en mora, o si la obligación es de no hacer, desde el
momento de la contravención.

Art. 1558. Si no se puede imputar dolo al deudor, sólo es responsable
de los perjuicios que se previeron o pudieron preverse al tiempo del
contrato; pero si hay dolo, es responsable de todos los perjuicios que
fueron una consecuencia inmediata o directa de no haberse cumplido la
obligación o de haberse demorado su cumplimiento.
La mora producida por fuerza mayor o caso fortuito no da lugar a
indemnización de perjuicios.
Las estipulaciones de los contratantes podrán modificar estas reglas.

Art. 1559. Si la obligación es de pagar una cantidad de dinero, la
indemnización de perjuicios por la mora está sujeta a las reglas
siguientes:
1.ª Se siguen debiendo los intereses convencionales, si se ha pactado
un interés superior al legal, o empiezan a deberse los intereses
legales, en el caso contrario; quedando, sin embargo, en su fuerza las
disposiciones especiales que autoricen el cobro de los intereses
corrientes en ciertos casos.
2.ª El acreedor no tiene necesidad de justificar perjuicios cuando
sólo cobra intereses; basta el hecho del retardo.
3.ª Los intereses atrasados no producen interés.
4.ª La regla anterior se aplica a toda especie de rentas, cánones y
pensiones periódicas.

LIBRO IV — TÍTULO XXXIV: DE LOS CUASICONTRATOS (norma introductoria)

Art. 2284. Las obligaciones que se contraen sin convención, nacen o de
la ley, o del hecho voluntario de una de las partes.
Las que nacen de la ley se expresan en ella.
Si el hecho de que nacen es lícito, constituye un cuasicontrato. Si el
hecho es ilícito, y cometido con intención de dañar, constituye un
delito. Si el hecho es culpable, pero cometido sin intención de dañar,
constituye un cuasidelito.
En este título se trata solamente de los cuasicontratos.

LIBRO IV — TÍTULO XXXV: DE LOS DELITOS Y CUASIDELITOS

Art. 2314. El que ha cometido un delito o cuasidelito que ha inferido
daño a otro, es obligado a la indemnización; sin perjuicio de la pena
que le impongan las leyes por el delito o cuasidelito.

Art. 2315. Puede pedir esta indemnización no sólo el que es dueño o
poseedor de la cosa que ha sufrido el daño, o su heredero, sino el
usufructuario, el habitador o el usuario, si el daño irroga perjuicio a
su derecho de usufructo o de habitación o uso. Puede también pedirla en
otros casos el que tiene la cosa con obligación de responder de ella;
pero sólo en ausencia del dueño.

Art. 2316. Es obligado a la indemnización el que hizo el daño, y sus
herederos. El que recibe provecho del dolo ajeno, sin ser cómplice en
él, sólo es obligado hasta concurrencia de lo que valga el provecho.

Art. 2317. Si un delito o cuasidelito ha sido cometido por dos o más
personas, cada una de ellas será solidariamente responsable de todo
perjuicio procedente del mismo delito o cuasidelito, salvas las
excepciones de los artículos 2323 y 2328.
Todo fraude o dolo cometido por dos o más personas produce la acción
solidaria del precedente inciso.

Art. 2318. El ebrio es responsable del daño causado por su delito o
cuasidelito.

Art. 2319. No son capaces de delito o cuasidelito los menores de siete
años ni los dementes; pero serán responsables de los daños causados por
ellos las personas a cuyo cargo estén, si pudiere imputárseles
negligencia.
Queda a la prudencia del juez determinar si el menor de dieciséis años
ha cometido el delito o cuasidelito sin discernimiento; y en este caso
se seguirá la regla del inciso anterior.

Art. 2320. Toda persona es responsable no sólo de sus propias
acciones, sino del hecho de aquellos que estuvieren a su cuidado.
Así el padre, y a falta de éste la madre, es responsable del hecho de
los hijos menores que habiten en la misma casa.
Así el tutor o curador es responsable de la conducta del pupilo que
vive bajo su dependencia y cuidado.
Así los jefes de colegios y escuelas responden del hecho de los
discípulos, mientras están bajo su cuidado; y los artesanos y
empresarios del hecho de sus aprendices o dependientes, en el mismo
caso.
Pero cesará la obligación de esas personas si con la autoridad y el
cuidado que su respectiva calidad les confiere y prescribe, no
hubieren podido impedir el hecho.
[Nota: este inciso final fue modificado por la Ley 18.802 (1989); si el
alumno cita una redacción distinta a la de arriba, verifícala antes de
corregir.]

Art. 2321. Los padres serán siempre responsables de los delitos o
cuasidelitos cometidos por sus hijos menores, y que conocidamente
provengan de mala educación, o de los hábitos viciosos que les han
dejado adquirir.

Art. 2322. Los amos responderán de la conducta de sus criados o
sirvientes, en el ejercicio de sus respectivas funciones; y esto aunque
el hecho de que se trate no se haya ejecutado a su vista.
Pero no responderán de lo que hayan hecho sus criados o sirvientes en
el ejercicio de sus respectivas funciones, si se probare que las han
ejercido de un modo impropio que los amos no tenían medio de prever o
impedir, empleando el cuidado ordinario, y la autoridad competente. En
este caso toda la responsabilidad recaerá sobre dichos criados o
sirvientes.

Art. 2323. El dueño de un edificio es responsable a terceros (que no
se hallen en el caso del artículo 934), de los daños que ocasione su
ruina acaecida por haber omitido las necesarias reparaciones, o por
haber faltado de otra manera al cuidado de un buen padre de familia.
Si el edificio perteneciere a dos o más personas proindiviso, se
dividirá entre ellas la indemnización a prorrata de sus cuotas de
dominio.

Art. 2324. Si el daño causado por la ruina de un edificio proviniere
de un vicio de construcción, tendrá lugar la responsabilidad prescrita
en la regla 3.a del artículo 2003.

Art. 2325. Las personas obligadas a la reparación de los daños
causados por las que de ellas depende, tendrán derecho para ser
indemnizadas sobre los bienes de éstas, si los hubiere, y si el que
perpetró el daño lo hizo sin orden de la persona a quien debía
obediencia, y era capaz de delito o cuasidelito, según el artículo
2319.

Art. 2326. El dueño de un animal es responsable de los daños causados
por el mismo animal, aun después que se haya soltado o extraviado;
salvo que la soltura, extravío o daño no pueda imputarse a culpa del
dueño o del dependiente encargado de la guarda o servicio del animal.
Lo que se dice del dueño se aplica a toda persona que se sirva de un
animal ajeno; salva su acción contra el dueño, si el daño ha
sobrevenido por una calidad o vicio del animal, que el dueño con
mediano cuidado o prudencia debió conocer o prever, y de que no le dio
conocimiento.

Art. 2327. El daño causado por un animal fiero, de que no se reporta
utilidad para la guarda o servicio de un predio, será siempre
imputable al que lo tenga, y si alegare que no le fue posible evitar el
daño, no será oído.

Art. 2328. El daño causado por una cosa que cae o se arroja de la
parte superior de un edificio, es imputable a todas las personas que
habitan la misma parte del edificio, y la indemnización se dividirá
entre todas ellas; a menos que se pruebe que el hecho se debe a la
culpa o mala intención de alguna persona exclusivamente, en cuyo caso
será responsable esta sola.
Si hubiere alguna cosa que, de la parte superior de un edificio o de
otro paraje elevado, amenace caída y daño, podrá ser obligado a
removerla el dueño del edificio o del sitio, o su inquilino, o la
persona a quien perteneciere la cosa o que se sirviere de ella; y
cualquiera del pueblo tendrá derecho para pedir la remoción.

Art. 2329. Por regla general todo daño que pueda imputarse a malicia
o negligencia de otra persona, debe ser reparado por ésta. Son
especialmente obligados a esta reparación:
1.º El que dispara imprudentemente un arma de fuego;
2.º El que remueve las losas de una acequia o cañería en calle o
camino, sin las precauciones necesarias para que no caigan los que por
allí transitan de día o de noche;
3.º El que, obligado a la construcción o reparación de un acueducto o
puente que atraviesa un camino lo tiene en estado de causar daño a los
que transitan por él.

Art. 2330. La apreciación del daño está sujeta a reducción, si el que
lo ha sufrido se expuso a él imprudentemente.

Art. 2331. Las imputaciones injuriosas contra el honor o el crédito de
una persona no dan derecho para demandar una indemnización pecuniaria,
a menos de probarse daño emergente o lucro cesante, que pueda
apreciarse en dinero; pero ni aun entonces tendrá lugar la
indemnización pecuniaria, si se probare la verdad de la imputación.

Art. 2332. Las acciones que concede este título por daño o dolo,
prescriben en cuatro años contados desde la perpetración del acto.

Art. 2333. Por regla general, se concede acción popular en todos los
casos de daño contingente que por imprudencia o negligencia de alguien
amenace a personas indeterminadas; pero si el daño amenazare solamente
a personas determinadas, sólo alguna de éstas podrá intentar la acción.

Art. 2334. Si las acciones populares a que dan derecho los artículos
precedentes, parecieren fundadas, será el actor indemnizado de todas
las costas de la acción, y se le pagará lo que valgan el tiempo y
diligencia empleados en ella, sin perjuicio de la remuneración
específica que conceda la ley en casos determinados.

LIBRO IV — TÍTULO XLII: DE LA PRESCRIPCIÓN

Art. 2515. Este tiempo es en general de tres años para las acciones
ejecutivas y de cinco para las ordinarias.
La acción ejecutiva se convierte en ordinaria por el lapso de tres
años, y convertida en ordinaria durará solamente otros dos.
[Nota: el plazo de la acción ejecutiva fue modificado por la Ley
16.952; si el alumno cita un plazo distinto para la ejecutiva,
verifícalo antes de corregir.]

LIBRO IV — TÍTULO II: DE LOS ACTOS Y DECLARACIONES DE VOLUNTAD (dolo)

Art. 1465. El pacto de no pedir más en razón de una cuenta aprobada, no
vale en cuanto al dolo contenido en ella, si no se ha condonado
expresamente. La condonación del dolo futuro no vale.

LIBRO IV — TÍTULO IV: DE LAS OBLIGACIONES CONDICIONALES (complemento)

Art. 1478. Son nulas las obligaciones contraídas bajo una condición
potestativa que consista en la mera voluntad de la persona que se
obliga.
Si la condición consiste en un hecho voluntario de cualquiera de las
partes, valdrá.

LIBRO IV — TÍTULO XII: DEL EFECTO DE LAS OBLIGACIONES (interpretación
de los contratos)

Art. 1560. Conocida claramente la intención de los contratantes, debe
estarse a ella más que a lo literal de las palabras.

Art. 1563. En aquellos casos en que no apareciere voluntad contraria
deberá estarse a la interpretación que mejor cuadre con la naturaleza
del contrato.
Las cláusulas de uso común se presumen aunque no se expresen.

Art. 1566. No pudiendo aplicarse ninguna de las reglas precedentes de
interpretación, se interpretarán las cláusulas ambiguas a favor del
deudor.
Pero las cláusulas ambiguas que hayan sido extendidas o dictadas por una
de las partes, sea acreedora o deudora, se interpretarán contra ella,
siempre que la ambigüedad provenga de la falta de una explicación que
haya debido darse por ella.

LIBRO IV — TÍTULO XX: DE LA NULIDAD Y LA RESCISIÓN

Art. 1687. La nulidad pronunciada en sentencia que tiene la fuerza de
cosa juzgada, da a las partes derecho para ser restituidas al mismo
estado en que se hallarían si no hubiese existido el acto o contrato
nulo; sin perjuicio de lo prevenido sobre el objeto o causa ilícita.
En las restituciones mutuas que hayan de hacerse los contratantes en
virtud de este pronunciamiento, será cada cual responsable de la pérdida
de las especies o de su deterioro, de los intereses y frutos, y del
abono de las mejoras necesarias, útiles o voluptuarias, tomándose en
consideración los casos fortuitos y la posesión de buena o mala fe de
las partes; todo ello según las reglas generales y sin perjuicio de lo
dispuesto en el siguiente artículo.

===== CÓDIGO DE COMERCIO: ARTÍCULOS DE REFERENCIA (FORMACIÓN DEL
CONSENTIMIENTO) =====

LIBRO II — TÍTULO II: DE LAS CONVENCIONES MERCANTILES EN GENERAL

Art. 97. Para que la propuesta verbal de un negocio imponga al
proponente la respectiva obligación, se requiere que sea aceptada en el
acto de ser conocida por la persona a quien se dirigiere; y no mediando
tal aceptación, queda el proponente libre de todo compromiso.

Art. 98. La propuesta hecha por escrito deberá ser aceptada o desechada
dentro de veinticuatro horas, si la persona a quien se ha dirigido
residiere en el mismo lugar que el proponente, o a vuelta de correo, si
estuviere en otro diverso.
Vencidos los plazos indicados, la propuesta se tendrá por no hecha, aun
cuando hubiere sido aceptada.
En caso de aceptación extemporánea, el proponente será obligado, bajo
responsabilidad de daños y perjuicios, a dar pronto aviso de su
retractación.

Art. 99. El proponente puede arrepentirse en el tiempo medio entre el
envío de la propuesta y la aceptación, salvo que al hacerla se hubiere
comprometido a esperar contestación o a no disponer del objeto del
contrato, sino después de desechada o de transcurrido un determinado
plazo.
El arrepentimiento no se presume.

Art. 100. La retractación tempestiva impone al proponente la obligación
de indemnizar los gastos que la persona a quien fue encaminada la
propuesta hubiere hecho, y los daños y perjuicios que hubiere sufrido.
Sin embargo, el proponente podrá exonerarse de la obligación de
indemnizar, cumpliendo el contrato propuesto.

Art. 101. Dada la contestación, si en ella se aprobare pura y
simplemente la propuesta, el contrato queda en el acto perfeccionado y
produce todos sus efectos legales, a no ser que antes de darse la
respuesta ocurra la retractación, muerte o incapacidad legal del
proponente.

Art. 102. La aceptación condicional será considerada como una propuesta.

Art. 103. La aceptación tácita produce los mismos efectos y está sujeta
a las mismas reglas que la expresa.

Art. 104. Residiendo los interesados en distintos lugares, se entenderá
celebrado el contrato, para todos sus efectos legales, en el de la
residencia del que hubiere aceptado la propuesta primitiva o la
propuesta modificada.

Art. 105. Las ofertas indeterminadas contenidas en circulares,
catálogos, notas de precios corrientes, prospectos, o en cualquiera otra
especie de anuncios impresos, no son obligatorias para el que las hace.
Dirigidos los anuncios a personas determinadas, llevan siempre la
condición implícita de que al tiempo de la demanda no hayan sido
enajenados los efectos ofrecidos, de que no hayan sufrido alteración en
su precio, y de que existan en el domicilio del oferente.

Art. 106. El contrato propuesto por el intermedio de corredor se tendrá
por perfecto desde el momento en que los interesados aceptaren pura y
simplemente la propuesta.
`;
