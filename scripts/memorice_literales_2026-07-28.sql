-- Memorice: artículos de "Transcripción literal" que faltaban en la base,
-- detectados en la auditoría de fuentes del 2026-07-28
-- (ver el artifact de auditoría para el detalle completo por materia).
-- Texto verbatim verificado contra Apuntes/Codigo Civil Chileno.pdf y,
-- para los 2 de Código de Comercio, contra leyes-cl.com (mirror de
-- leychile.cl, que no cargó en esta sesión — vale la pena que Laura
-- confirme estos dos puntualmente contra leychile.cl antes de darlos
-- por definitivos, el resto ya está verificado contra el Código Civil).
--
-- Descartados de esta tanda (no van en el SQL):
--   - art. 156: no aparece en el manual, fue un error de extracción.
--   - art. 2210: está derogado (Ley 18.010, 1981); el manual lo cita a
--     propósito como contraste histórico, no como regla vigente.
--   - arts. 1551 y 1558 NO se extienden a Extracontractual: cuando ese
--     manual los cita, dice explícitamente "la responsabilidad
--     CONTRACTUAL lo exige..." — los usa para contrastar, no los aplica
--     como regla propia de Extracontractual.

-- ════════════════════════════════════════════════════════════════════════
-- Contractual — Código Civil
-- ════════════════════════════════════════════════════════════════════════

insert into public.memorice_articulos
  (id, materia, subtema, articulo, texto, prioridad_ocultamiento, palabras_criticas, fuente)
values (
  'cc-art-1238',
  'contractual',
  'Repudiación de herencia por los acreedores (acción oblicua)',
  '1238',
  'Los acreedores del que repudia en perjuicio de los derechos de ellos, podrán hacerse autorizar por el juez para aceptar por el deudor. En este caso la repudiación no se rescinde sino en favor de los acreedores y hasta concurrencia de sus créditos; y en el sobrante subsiste.',
  '[["repudia", "en perjuicio"], ["autorizar por el juez"], ["hasta concurrencia de sus créditos"], ["*"]]'::jsonb,
  array['repudia', 'autorizar por el juez', 'hasta concurrencia de sus créditos'],
  'Código Civil, art. 1238'
)
on conflict (id) do nothing;

insert into public.memorice_articulos
  (id, materia, subtema, articulo, texto, prioridad_ocultamiento, palabras_criticas, fuente)
values (
  'cc-art-1486',
  'contractual',
  'Riesgo en las obligaciones condicionales',
  '1486',
  'Si antes del cumplimiento de la condición la cosa prometida perece sin culpa del deudor, se extingue la obligación; y por culpa del deudor, el deudor es obligado al precio, y a la indemnización de perjuicios. Si la cosa existe al tiempo de cumplirse la condición, se debe en el estado en que se encuentre, aprovechándose el acreedor de los aumentos o mejoras que haya recibido la cosa, sin estar obligado a dar más por ella, y sufriendo su deterioro o disminución, sin derecho alguno a que se le rebaje el precio; salvo que el deterioro o disminución proceda de culpa del deudor; en cuyo caso el acreedor podrá pedir o que se rescinda el contrato o que se le entregue la cosa, y además de lo uno o lo otro tendrá derecho a indemnización de perjuicios. Todo lo que destruye la aptitud de la cosa para el objeto a que según su naturaleza o según la convención se destina, se entiende destruir la cosa.',
  '[["perece sin culpa"], ["por culpa del deudor", "obligado al precio"], ["indemnización de perjuicios"], ["*"]]'::jsonb,
  array['perece sin culpa', 'por culpa del deudor', 'indemnización de perjuicios'],
  'Código Civil, art. 1486'
)
on conflict (id) do nothing;

insert into public.memorice_articulos
  (id, materia, subtema, articulo, texto, prioridad_ocultamiento, palabras_criticas, fuente)
values (
  'cc-art-1521',
  'contractual',
  'Riesgo y mora en obligaciones solidarias',
  '1521',
  'Si la cosa perece por culpa o durante la mora de uno de los deudores solidarios, todos ellos quedan obligados solidariamente al precio, salva la acción de los codeudores contra el culpable o moroso. Pero la acción de perjuicios a que diere lugar la culpa o mora, no podrá intentarla el acreedor sino contra el deudor culpable o moroso.',
  '[["perece por culpa", "durante la mora"], ["obligados solidariamente al precio"], ["culpable o moroso"], ["*"]]'::jsonb,
  array['solidariamente', 'culpable o moroso'],
  'Código Civil, art. 1521'
)
on conflict (id) do nothing;

insert into public.memorice_articulos
  (id, materia, subtema, articulo, texto, prioridad_ocultamiento, palabras_criticas, fuente)
values (
  'cc-art-1535',
  'contractual',
  'Concepto de cláusula penal',
  '1535',
  'La cláusula penal es aquella en que una persona, para asegurar el cumplimiento de una obligación, se sujeta a una pena, que consiste en dar o hacer algo en caso de no ejecutar o de retardar la obligación principal.',
  '[["asegurar el cumplimiento"], ["se sujeta a una pena"], ["no ejecutar", "o de retardar"], ["*"]]'::jsonb,
  array['asegurar el cumplimiento', 'dar o hacer algo', 'no ejecutar', 'retardar'],
  'Código Civil, art. 1535'
)
on conflict (id) do nothing;

insert into public.memorice_articulos
  (id, materia, subtema, articulo, texto, prioridad_ocultamiento, palabras_criticas, fuente)
values (
  'cc-art-1557',
  'contractual',
  'Momento desde el cual se debe la indemnización',
  '1557',
  'Se debe la indemnización de perjuicios desde que el deudor se ha constituido en mora, o si la obligación es de no hacer, desde el momento de la contravención.',
  '[["constituido en mora"], ["obligación de no hacer"], ["momento de la contravención"], ["*"]]'::jsonb,
  array['constituido en mora', 'contravención'],
  'Código Civil, art. 1557'
)
on conflict (id) do nothing;

insert into public.memorice_articulos
  (id, materia, subtema, articulo, texto, prioridad_ocultamiento, palabras_criticas, fuente)
values (
  'cc-art-1559',
  'contractual',
  'Indemnización moratoria en obligaciones de dinero',
  '1559',
  'Si la obligación es de pagar una cantidad de dinero, la indemnización de perjuicios por la mora está sujeta a las reglas siguientes: 1ª. Se siguen debiendo los intereses convencionales, si se ha pactado un interés superior al legal, o empiezan a deberse los intereses legales, en el caso contrario; quedando, sin embargo, en su fuerza las disposiciones especiales que autoricen el cobro de los intereses corrientes en ciertos casos. 2ª. El acreedor no tiene necesidad de justificar perjuicios cuando sólo cobra intereses; basta el hecho del retardo. 3ª. Los intereses atrasados no producen interés. 4ª. La regla anterior se aplica a toda especie de rentas, cánones y pensiones periódicas.',
  '[["intereses convencionales", "intereses legales"], ["no tiene necesidad de justificar perjuicios"], ["intereses atrasados no producen interés"], ["*"]]'::jsonb,
  array['intereses convencionales', 'intereses legales', 'no producen interés'],
  'Código Civil, art. 1559'
)
on conflict (id) do nothing;

insert into public.memorice_articulos
  (id, materia, subtema, articulo, texto, prioridad_ocultamiento, palabras_criticas, fuente)
values (
  'cc-art-1568',
  'contractual',
  'Concepto de pago efectivo',
  '1568',
  'El pago efectivo es la prestación de lo que se debe.',
  '[["prestación de lo que se debe"], ["*"]]'::jsonb,
  array['prestación de lo que se debe'],
  'Código Civil, art. 1568'
)
on conflict (id) do nothing;

insert into public.memorice_articulos
  (id, materia, subtema, articulo, texto, prioridad_ocultamiento, palabras_criticas, fuente)
values (
  'cc-art-1569',
  'contractual',
  'Principio de identidad e integridad del pago',
  '1569',
  'El pago se hará bajo todos respectos en conformidad al tenor de la obligación; sin perjuicio de lo que en casos especiales dispongan las leyes. El acreedor no podrá ser obligado a recibir otra cosa que lo que se le deba ni aun a pretexto de ser de igual o mayor valor la ofrecida.',
  '[["tenor de la obligación"], ["no podrá ser obligado a recibir otra cosa"], ["*"]]'::jsonb,
  array['tenor de la obligación', 'no podrá ser obligado a recibir otra cosa'],
  'Código Civil, art. 1569'
)
on conflict (id) do nothing;

insert into public.memorice_articulos
  (id, materia, subtema, articulo, texto, prioridad_ocultamiento, palabras_criticas, fuente)
values (
  'cc-art-1670',
  'contractual',
  'Pérdida de la cosa debida (teoría de los riesgos)',
  '1670',
  'Cuando el cuerpo cierto que se debe perece, o porque se destruye, o porque deja de estar en el comercio, o porque desaparece y se ignora si existe, se extingue la obligación; salvas empero las excepciones de los artículos subsiguientes.',
  '[["cuerpo cierto"], ["se destruye", "deja de estar en el comercio", "desaparece"], ["se extingue la obligación"], ["*"]]'::jsonb,
  array['cuerpo cierto', 'se extingue la obligación'],
  'Código Civil, art. 1670'
)
on conflict (id) do nothing;

insert into public.memorice_articulos
  (id, materia, subtema, articulo, texto, prioridad_ocultamiento, palabras_criticas, fuente)
values (
  'cc-art-1672',
  'contractual',
  'Pérdida de la cosa por culpa o mora del deudor',
  '1672',
  'Si el cuerpo cierto perece por culpa o durante la mora del deudor, la obligación del deudor subsiste, pero varía de objeto; el deudor es obligado al precio de la cosa y a indemnizar al acreedor. Sin embargo, si el deudor está en mora y el cuerpo cierto que se debe perece por caso fortuito que habría sobrevenido igualmente a dicho cuerpo en poder del acreedor, sólo se deberá la indemnización de los perjuicios de la mora. Pero si el caso fortuito pudo no haber sucedido igualmente en poder del acreedor, se debe el precio de la cosa y los perjuicios de la mora.',
  '[["subsiste", "varía de objeto"], ["precio de la cosa", "indemnizar al acreedor"], ["caso fortuito"], ["*"]]'::jsonb,
  array['subsiste', 'varía de objeto', 'precio de la cosa'],
  'Código Civil, art. 1672'
)
on conflict (id) do nothing;

insert into public.memorice_articulos
  (id, materia, subtema, articulo, texto, prioridad_ocultamiento, palabras_criticas, fuente)
values (
  'cc-art-1677',
  'contractual',
  'Cesión de acciones contra terceros responsables',
  '1677',
  'Aunque por haber perecido la cosa se extinga la obligación del deudor, podrá exigir el acreedor que se le cedan los derechos o acciones que tenga el deudor contra aquellos por cuyo hecho o culpa haya perecido la cosa.',
  '[["se extinga la obligación"], ["se le cedan los derechos o acciones"], ["*"]]'::jsonb,
  array['se le cedan los derechos o acciones'],
  'Código Civil, art. 1677'
)
on conflict (id) do nothing;

insert into public.memorice_articulos
  (id, materia, subtema, articulo, texto, prioridad_ocultamiento, palabras_criticas, fuente)
values (
  'cc-art-1678',
  'contractual',
  'Destrucción por hecho voluntario del deudor que ignoraba la obligación',
  '1678',
  'Si la cosa debida se destruye por un hecho voluntario del deudor, que inculpablemente ignoraba la obligación, se deberá solamente el precio sin otra indemnización de perjuicios.',
  '[["hecho voluntario del deudor"], ["inculpablemente ignoraba"], ["solamente el precio"], ["*"]]'::jsonb,
  array['hecho voluntario', 'inculpablemente ignoraba', 'solamente el precio'],
  'Código Civil, art. 1678'
)
on conflict (id) do nothing;

insert into public.memorice_articulos
  (id, materia, subtema, articulo, texto, prioridad_ocultamiento, palabras_criticas, fuente)
values (
  'cc-art-1873',
  'contractual',
  'Acciones del vendedor por mora en el pago del precio',
  '1873',
  'Si el comprador estuviere constituido en mora de pagar el precio en el lugar y tiempo dichos, el vendedor tendrá derecho para exigir el precio o la resolución de la venta, con resarcimiento de perjuicios.',
  '[["constituido en mora"], ["exigir el precio", "o la resolución de la venta"], ["*"]]'::jsonb,
  array['exigir el precio', 'resolución de la venta'],
  'Código Civil, art. 1873'
)
on conflict (id) do nothing;

insert into public.memorice_articulos
  (id, materia, subtema, articulo, texto, prioridad_ocultamiento, palabras_criticas, fuente)
values (
  'cc-art-1877',
  'contractual',
  'Concepto del pacto comisorio',
  '1877',
  'Por el pacto comisorio se estipula expresamente que, no pagándose el precio al tiempo convenido, se resolverá el contrato de venta. Entiéndese siempre esta estipulación en el contrato de venta; y cuando se expresa, toma el nombre de pacto comisorio, y produce los efectos que van a indicarse.',
  '[["pacto comisorio"], ["no pagándose el precio"], ["se resolverá el contrato"], ["*"]]'::jsonb,
  array['pacto comisorio', 'se resolverá el contrato'],
  'Código Civil, art. 1877'
)
on conflict (id) do nothing;

insert into public.memorice_articulos
  (id, materia, subtema, articulo, texto, prioridad_ocultamiento, palabras_criticas, fuente)
values (
  'cc-art-1878',
  'contractual',
  'El pacto comisorio no priva de la elección de acciones',
  '1878',
  'Por el pacto comisorio no se priva al vendedor de la elección de acciones que le concede el artículo 1873.',
  '[["no se priva al vendedor"], ["elección de acciones"], ["*"]]'::jsonb,
  array['no se priva', 'elección de acciones'],
  'Código Civil, art. 1878'
)
on conflict (id) do nothing;

insert into public.memorice_articulos
  (id, materia, subtema, articulo, texto, prioridad_ocultamiento, palabras_criticas, fuente)
values (
  'cc-art-1880',
  'contractual',
  'Prescripción del pacto comisorio',
  '1880',
  'El pacto comisorio prescribe al plazo prefijado por las partes, si no pasare de cuatro años, contados desde la fecha del contrato. Transcurridos estos cuatro años, prescribe necesariamente, sea que se haya estipulado un plazo más largo o ninguno.',
  '[["prescribe al plazo prefijado"], ["cuatro años"], ["prescribe necesariamente"], ["*"]]'::jsonb,
  array['cuatro años', 'prescribe necesariamente'],
  'Código Civil, art. 1880'
)
on conflict (id) do nothing;

insert into public.memorice_articulos
  (id, materia, subtema, articulo, texto, prioridad_ocultamiento, palabras_criticas, fuente)
values (
  'cc-art-2187',
  'contractual',
  'Comodato: enajenación por herederos que ignoraban el préstamo',
  '2187',
  'Si los herederos del comodatario, no teniendo conocimiento del préstamo, hubieren enajenado la cosa prestada, podrá el comodante (no pudiendo o no queriendo hacer uso de la acción reivindicatoria, o siendo ésta ineficaz) exigir de los herederos que le paguen el justo precio de la cosa prestada o que le cedan las acciones que en virtud de la enajenación les competan, según viere convenirle. Si tuvieron conocimiento del préstamo, resarcirán todo perjuicio, y aun podrán ser perseguidos criminalmente según las circunstancias del hecho.',
  '[["no teniendo conocimiento del préstamo"], ["justo precio"], ["tuvieron conocimiento", "resarcirán todo perjuicio"], ["*"]]'::jsonb,
  array['no teniendo conocimiento', 'justo precio', 'tuvieron conocimiento'],
  'Código Civil, art. 2187'
)
on conflict (id) do nothing;

insert into public.memorice_articulos
  (id, materia, subtema, articulo, texto, prioridad_ocultamiento, palabras_criticas, fuente)
values (
  'cc-art-2468',
  'contractual',
  'Acción pauliana: requisitos y prescripción',
  '2468',
  'En cuanto a los actos ejecutados antes de la cesión de bienes o la apertura del concurso, se observarán las disposiciones siguientes: 1a. Los acreedores tendrán derecho para que se rescindan los contratos onerosos, y las hipotecas, prendas y anticresis que el deudor haya otorgado en perjuicio de ellos, estando de mala fe el otorgante y el adquirente, esto es, conociendo ambos el mal estado de los negocios del primero. 2a. Los actos y contratos no comprendidos bajo el número precedente, inclusos las remisiones y pactos de liberación a título gratuito, serán rescindibles, probándose la mala fe del deudor y el perjuicio de los acreedores. 3a. Las acciones concedidas en este artículo a los acreedores expiran en un año contado desde la fecha del acto o contrato.',
  '[["rescindan los contratos onerosos"], ["mala fe del otorgante y el adquirente"], ["un año"], ["*"]]'::jsonb,
  array['mala fe', 'rescindan', 'un año'],
  'Código Civil, art. 2468'
)
on conflict (id) do nothing;

-- ════════════════════════════════════════════════════════════════════════
-- Contractual — Código de Comercio
-- Fuente: leyes-cl.com (mirror de leychile.cl, que no cargó en esta
-- sesión). Recomiendo confirmar estos dos puntualmente contra
-- leychile.cl antes de darlos por definitivos.
-- ════════════════════════════════════════════════════════════════════════

insert into public.memorice_articulos
  (id, materia, subtema, articulo, texto, prioridad_ocultamiento, palabras_criticas, fuente)
values (
  'ccom-art-531',
  'contractual',
  'Presunción de responsabilidad del asegurador en el siniestro',
  '531',
  'El siniestro se presume ocurrido por un evento que hace responsable al asegurador. El asegurador puede acreditar que el siniestro ha sido causado por un hecho que no lo constituye en responsable de sus consecuencias, según el contrato o la ley.',
  '[["se presume ocurrido"], ["hace responsable al asegurador"], ["puede acreditar"], ["*"]]'::jsonb,
  array['se presume', 'responsable al asegurador'],
  'Código de Comercio, art. 531 (verificar contra leychile.cl)'
)
on conflict (id) do nothing;

insert into public.memorice_articulos
  (id, materia, subtema, articulo, texto, prioridad_ocultamiento, palabras_criticas, fuente)
values (
  'ccom-art-539',
  'contractual',
  'Nulidad del seguro por declaración falsa del asegurado',
  '539',
  'El contrato de seguro es nulo si el asegurado, a sabiendas, proporciona al asegurador información sustancialmente falsa al prestar la declaración a que se refiere el número 1° del artículo 524 y se resuelve si incurre en esa conducta al reclamar la indemnización de un siniestro. En dichos casos, pronunciada la nulidad o la resolución del seguro, el asegurador podrá retener la prima o demandar su pago y cobrar los gastos que le haya demandado acreditarlo, aunque no haya corrido riesgo alguno, sin perjuicio de la acción criminal.',
  '[["a sabiendas", "información sustancialmente falsa"], ["nulo", "se resuelve"], ["*"]]'::jsonb,
  array['a sabiendas', 'información sustancialmente falsa'],
  'Código de Comercio, art. 539 (verificar contra leychile.cl)'
)
on conflict (id) do nothing;

-- ════════════════════════════════════════════════════════════════════════
-- Extracontractual
-- ════════════════════════════════════════════════════════════════════════

insert into public.memorice_articulos
  (id, materia, subtema, articulo, texto, prioridad_ocultamiento, palabras_criticas, fuente)
values (
  'cc-art-391',
  'extracontractual',
  'Responsabilidad del tutor o curador (estándar de culpa leve)',
  '391',
  'El tutor o curador administra los bienes del pupilo, y es obligado a la conservación de estos bienes y a su reparación y cultivo. Su responsabilidad se extiende hasta la culpa leve inclusive.',
  '[["administra los bienes del pupilo"], ["culpa leve inclusive"], ["*"]]'::jsonb,
  array['culpa leve inclusive'],
  'Código Civil, art. 391'
)
on conflict (id) do nothing;

-- Extiende el art. 45 (caso fortuito) a Extracontractual: ese manual tiene
-- su propia sección dedicada al caso fortuito con jurisprudencia propia
-- (CS 1992, CS 1949), a diferencia de los arts. 1551/1558 que ese mismo
-- manual solo cita para contrastar con la regla contractual (dice
-- explícitamente "la responsabilidad CONTRACTUAL lo exige..."), por eso
-- esos dos no se tocan.
update public.memorice_articulos set materia = 'contractual,extracontractual' where id = 'cc-art-45';
