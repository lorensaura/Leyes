# Flashcards de Acto Jurídico: lote 10 (tema 28 Representación y tema 29 Modalidades). Última tanda.
# Criterio de pocas tarjetas (Laura, 2026-10-08): una por subtema, dos solo si el subtema junta ideas distintas.
A = lambda n: f'<span class="art">art. {n}</span>'
AS = lambda n: f'<span class="art">arts. {n}</span>'
NO_CONFUNDIR = []
NUEVAS = [
 # T28 Representación
 ('T28.1', 'Concepto', 'basica', '¿Qué es la representación y cuáles son sus clases según su origen?',
  'Es la relación en que una persona (el <b>representante</b>) tiene poder para celebrar actos jurídicos en lugar e interés de otra (el <b>representado</b>), de modo que los efectos recaen de inmediato y solo sobre el representado, como si él mismo hubiera contratado (' + A(1448) + '). Según su origen, es <b>legal</b>, cuando la ley atribuye el poder porque el representado está impedido de actuar por sí solo (' + A(43) + '), o <b>voluntaria</b>, cuando nace de la decisión del interesado de otorgar poder a otro.',
  'V'),
 ('T28.2', 'Distinción', 'intermedia', '¿Son lo mismo el mandato y el apoderamiento? ¿Puede haber mandato sin representación y representación sin mandato?',
  '<b>No</b> son lo mismo. El <b>mandato</b> es un contrato por el que el mandante confía al mandatario la gestión de uno o más negocios (' + A(2116) + '); el <b>apoderamiento</b> es un acto unilateral por el que una persona confiere a otra la facultad de representarla. Por eso son independientes: hay <b>mandato sin representación</b> cuando el mandatario contrata a su propio nombre, y <b>representación sin mandato</b> en la representación legal y en la agencia oficiosa.',
  'V.3.3'),
 ('T28.3', 'Regla', 'intermedia', '¿Qué teoría explica la naturaleza jurídica de la representación en el derecho chileno y por qué se descartan las demás?',
  'La de la <b>representación modalidad</b>: es la voluntad del representante la que forma el acto, y la ley desvía sus efectos hacia el representado. <b>ALESSANDRI</b> la apoya en el tenor del ' + A(1448) + ', y la Corte Suprema la acoge. Las teorías de la <b>ficción</b>, del <b>nuntius</b> o mensajero y de la <b>cooperación de voluntades</b> se descartan porque no explican la representación legal: el demente o el impúber no tienen una voluntad que transmitir ni con la que cooperar.',
  'V.4'),
 ('T28.4', 'Distinción', 'intermedia', '¿Quién debe ser capaz en la representación legal y en la voluntaria?',
  'En la <b>legal</b>, el <b>representante</b> debe ser capaz; el representado normalmente no lo es, y por eso necesita representante. En la <b>voluntaria</b>, el <b>representado</b> debe ser capaz, porque de ello depende la validez del apoderamiento; el representante puede ser <b>incapaz relativo</b>, como el menor adulto que actúa como mandatario sin autorización de su representante legal (' + A(2128) + '), porque lo que arriesga es el patrimonio ajeno.',
  'V.5.1'),
 ('T28.4', 'Regla', 'avanzada', 'Según VIAL, ¿cuándo vician el acto representativo el error, la fuerza o el dolo?',
  '<b>VIAL</b> distingue: (i) el <b>error del representante</b> vicia el consentimiento solo si ese mismo error sería relevante para el representado; (ii) la <b>fuerza o el dolo</b> determinante sobre el <b>representante</b> sí vician el consentimiento y permiten rescindir el contrato; y (iii) si el vicio lo sufre el <b>representado</b>, lo anulable es el <b>poder</b> mismo y, a través de él, el acto representativo.',
  'V.5.3'),
 ('T28.5', 'Enumeración', 'intermedia', '¿Qué requisitos deben concurrir para que haya representación y produzca sus efectos?',
  '(i) <b>Declaración de voluntad del representante</b>, que es quien contrata; (ii) <b>contemplatio domini</b>: que el representante deje claro que actúa a nombre y por cuenta de otro, y que el tercero lo entienda así (' + A(1448) + '; si el mandatario obra a su propio nombre, no obliga al mandante frente a terceros, ' + A(2151) + '); y (iii) <b>poder</b>, legal o voluntario, ejercido <b>dentro de sus límites</b>. Cumplidos, los derechos y obligaciones quedan radicados en el representado.',
  'V.6'),
 ('T28.6', 'Regla', 'intermedia', '¿Qué sanción tiene el acto del representante sin poder o que se extralimita, y qué características tiene su ratificación?',
  'Es <b>inoponible</b> al representado, que solo debe cumplir lo contraído dentro de los límites del mandato, salvo que lo <b>ratifique</b>, expresa o tácitamente (' + A(2160) + '). Esta ratificación, distinta de la que sanea la nulidad relativa, es <b>unilateral</b>, <b>recepticia</b> (produce efectos cuando la conocen el representante y el tercero), <b>irrevocable</b> una vez producidos sus efectos, y <b>retroactiva</b> a la fecha del contrato.',
  'V.8 y V.9'),
 ('T28.7', 'Distinción', 'intermedia', 'Estipulación para otro y promesa de hecho ajeno: ¿en qué consisten y cuál es una verdadera excepción a la relatividad de los contratos?',
  'En la <b>estipulación para otro</b>, el estipulante hace prometer al promitente una prestación en favor de un tercero, el único que puede exigirla; mientras este no acepte, las partes pueden revocar el contrato (' + A(1449) + '). En la <b>promesa de hecho ajeno</b>, un contratante se compromete a que un tercero dará, hará o no hará algo; el tercero solo se obliga si ratifica, y si no, el otro contratante tiene acción de perjuicios contra el promitente (' + A(1450) + '). Solo la <b>estipulación para otro</b> es una excepción a la relatividad: en la promesa, el tercero se obliga por su propia voluntad.',
  'V.10'),
 # T29 Modalidades
 ('T29.1', 'Concepto', 'basica', '¿Qué es la condición y cómo se clasifica?',
  'Es un hecho <b>futuro e incierto</b> del cual depende el nacimiento o la extinción de un derecho (' + AS('1070 y 1473') + '). Se clasifica: por la naturaleza del hecho, en <b>positivas y negativas</b> (' + A(1474) + '); por su realizabilidad, en <b>posibles e imposibles</b> (' + A(1475) + '); por su efecto, en <b>suspensivas y resolutorias</b> (' + A(1479) + '); y según de quién depende, en <b>potestativas, casuales y mixtas</b> (' + A(1477) + ').',
  'VI.A'),
 ('T29.1', 'Regla', 'intermedia', '¿Son válidas las condiciones potestativas? ¿Cuál es la excepción y por qué?',
  'Por regla general, <b>sí</b>. La excepción es la condición <b>suspensiva puramente potestativa</b> que depende de la mera voluntad del <b>deudor</b> (ej.: "te pago cinco millones si quiero"): es nula, porque el deudor no manifiesta una voluntad seria de obligarse. La <b>resolutoria</b> puramente potestativa del deudor sí vale, porque la obligación ya nació y solo su extinción queda sujeta a su voluntad.',
  'VI.A.2.4'),
 ('T29.2', 'Distinción', 'intermedia', '¿Qué efectos produce la condición suspensiva y la resolutoria según esté pendiente, cumplida o fallida?',
  '<b>Suspensiva</b>: pendiente, el derecho no existe; lo pagado puede repetirse (' + A(1485) + '), pero el acreedor tiene un derecho eventual, transmisible y que le permite pedir providencias conservativas (' + A(1492) + '); cumplida, el derecho nace con efecto retroactivo; fallida, el acto se tiene por no celebrado. <b>Resolutoria</b>: pendiente, el acto produce todos sus efectos; cumplida, el derecho se extingue retroactivamente y debe restituirse lo recibido (' + A(1487) + '); fallida, el derecho se consolida.',
  'VI.A.3'),
 ('T29.3', 'Distinción', 'basica', '¿Qué es el plazo y en qué se diferencia de la condición?',
  'Es un hecho <b>futuro y cierto</b> del cual depende el ejercicio o la extinción de un derecho (el Código lo define como la época que se fija para el cumplimiento de la obligación, ' + A(1494) + '). Diferencias: (i) el plazo es <b>cierto</b>, la condición incierta; (ii) el plazo afecta la <b>exigibilidad</b> del derecho, la condición su <b>existencia</b>; (iii) lo pagado antes del plazo <b>no se restituye</b> (' + A(1495) + '), lo pagado antes de cumplirse la condición sí (' + A(1485) + '); y (iv) el plazo puede ser convencional, legal o judicial; la condición solo nace de la voluntad o de la ley.',
  'VI.B'),
 ('T29.4', 'Distinción', 'intermedia', '¿Qué es el modo, en qué se diferencia de la condición suspensiva y qué ocurre si no se cumple?',
  'Es la carga impuesta a quien recibe algo a título gratuito de aplicarlo a un fin especial, como hacer ciertas obras (' + A(1089) + '). A diferencia de la condición suspensiva, <b>no suspende la adquisición</b> del derecho: "la condición suspende, pero no obliga; el modo no suspende, pero obliga". El beneficiario puede exigir su cumplimiento judicialmente, pero el incumplimiento solo extingue el derecho si hay <b>cláusula resolutoria</b>, que no se presume (' + A(1090) + ').',
  'VI.C'),
]
