-- Memorice: Acto Jurídico -- paso 2, actualizar los 2 artículos que ya
-- existían en memorice_articulos bajo otra materia (se suma 'acto_juridico'
-- en vez de duplicar la fila, convención de docs/practica.md addendum 2026-07-28).
-- Correr DESPUÉS del archivo de los 38 INSERT.

update public.memorice_articulos
set materia = 'contractual,acto_juridico',
    subtema = 'Condonación del dolo',
    fuente = $tag$Código Civil, art. 1465 (objeto/causa ilícita en Acto Jurídico, dolo en el cumplimiento en Contractual)$tag$
where id = 'cc-art-1465';

update public.memorice_articulos
set materia = 'precontractual,acto_juridico',
    texto = $tag$La nulidad pronunciada en sentencia que tiene la fuerza de cosa juzgada, da a las partes derecho para ser restituidas al mismo estado en que se hallarían si no hubiese existido el acto o contrato nulo; sin perjuicio de lo prevenido sobre el objeto o causa ilícita. En las restituciones mutuas que hayan de hacerse los contratantes en virtud de este pronunciamiento, será cada cual responsable de la pérdida de las especies o de su deterioro, de los intereses y frutos, y del abono de las mejoras necesarias, útiles o voluptuarias, tomándose en consideración los casos fortuitos y la posesión de buena o mala fe de las partes; todo ello según las reglas generales y sin perjuicio de lo dispuesto en el siguiente artículo.$tag$,
    prioridad_ocultamiento = $tag$[["fuerza de cosa juzgada", "al mismo estado en que se hallarían"], ["sin perjuicio de lo prevenido sobre el objeto o causa ilícita"], ["mejoras necesarias, útiles o voluptuarias", "posesión de buena o mala fe de las partes"], ["*"]]$tag$::jsonb,
    palabras_criticas = array['fuerza de cosa juzgada', 'mismo estado', 'objeto o causa ilícita', 'restituciones mutuas', 'buena o mala fe']
where id = 'cc-art-1687';
