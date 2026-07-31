# Arreglo: preguntas "menciona N de M posibles" calificaban mal (2026-07-31)

> Hallazgo de Laura practicando `rc-just-001` (ahora recategorizado a
> Extracontractual, ver abajo): la app calificaba como incorrecta una
> respuesta que en realidad era correcta, porque el ítem solo tenía
> `elementos_clave` para 3 de las 9 diferencias reales que ofrece el
> manual, y ella nombró 3 distintas, igualmente válidas. Regla nueva
> agregada a `docs/prompt-generacion-contenido-practica.md` sección 0.25
> para no repetir esto al redactar contenido nuevo.

## El arreglo de código (ya aplicado)

`app/alternativas.html`, función `evaluarRespuesta()`: se agregó soporte
para un campo nuevo, `minimo_elementos`. Si está presente, la app da
crédito completo con cualquier `minimo_elementos` elementos correctos de
`elementos_clave` (no exige el total). Si no está presente, el
comportamiento es el de siempre (exige el 100%), así que ningún ítem
existente cambia de comportamiento salvo que se le agregue el campo a
propósito. Verificado con una simulación de la fórmula (no con Chrome
headless todavía — pendiente probarlo en vivo una vez cargados los datos
de abajo).

## Prerrequisito: agregar la columna

Correr primero, una sola vez:

```sql
alter table public.evaluacion_practica
  add column if not exists minimo_elementos integer;
```

(Mismo contenido que `scripts/supabase_schema_minimo_elementos.sql`.)

## Ítems corregidos

### 1. `rc-just-001` → se mueve a Extracontractual, eje 23

Es el ítem que Laura practicó. El contenido (diferencias entre estatuto
contractual y extracontractual) no es un tema de Contractual: el propio
manual de Contractual remite su desarrollo al de Extracontractual, y ahí
existe una sección dedicada, el eje 23 ("W. Dualidad o unidad de
regímenes; diferencias entre estatutos"), que enumera **nueve**
diferencias reales (prueba de la culpa, graduación de la culpa, mora,
capacidad, solidaridad, extensión de la reparación/previsibilidad/daño
moral, avaluación anticipada mediante cláusula penal, efectos del dolo,
prescripción). El enunciado pide solo tres. Se expandieron los
`elementos_clave` de 3 a 9 (uno por cada diferencia real del manual) y se
agregó `minimo_elementos = 3`.

**Importante — esto no es solo un cambio de `materia`:**
`scripts/sync_airtable_supabase.py` asigna la `materia` de cada fila
según la base de Airtable de la que la lee (`Digesto Contractual` →
`materia = 'Responsabilidad contractual'`, siempre, sin mirar el
contenido). El `UPDATE` de abajo cambia `materia` directo en Supabase,
lo que corrige la app *ahora*, pero **el registro original sigue
existiendo en la tabla `Justificación` de la base `Digesto Contractual`
en Airtable**. La próxima vez que corra el sync, ese registro se va a
volver a sincronizar como Contractual, pisando este arreglo. Para que el
arreglo sea permanente, alguien tiene que mover el registro en Airtable
mismo: borrarlo de `Digesto Contractual` y recrearlo en `Digesto
Extracontractual` (tabla `Justificación`), linkeado al eje 23 ahí. Hasta
que eso pase, no se debe volver a correr `sync_airtable_supabase.py` sin
antes revisar que este ítem no se haya revertido.

```sql
update public.evaluacion_practica
set
  materia = 'Responsabilidad extracontractual',
  tema = '23. Dualidad o unidad de regímenes; diferencias entre estatutos',
  minimo_elementos = 3,
  elementos_clave = '[
    {"texto": "Señala la presunción de culpa contractual (art. 1547 inc. 3°) vs. prueba por la víctima en extracontractual", "keywords": ["1547", "presume", "presuncion", "victima prueba", "extracontractual prueba", "se da por hecho", "no necesita probar la culpa", "al reves en extracontractual"], "pregunta": "En un contrato, ¿quién tiene que probar que no hubo culpa? ¿Se mantiene ese mismo reparto si el daño no viene de un contrato?"},
    {"texto": "Señala la graduación tripartita de la culpa (art. 44) según a quién beneficia el contrato, ausente como tal en extracontractual", "keywords": ["44", "grave", "leve", "levisima", "gradua", "beneficia el contrato", "tres grados"], "pregunta": "¿La culpa contractual se gradúa según algún criterio? ¿Existe ese mismo criterio en materia extracontractual?"},
    {"texto": "Señala la exigencia de mora en materia contractual (arts. 1551, 1557) frente a su innecesariedad en materia extracontractual", "keywords": ["1551", "1557", "mora", "constituir en mora", "no es necesario constituir en mora", "nace directamente"], "pregunta": "¿Hace falta constituir en mora al deudor para poder cobrar la indemnización? ¿Ocurre lo mismo si el daño no viene de un contrato?"},
    {"texto": "Señala que las incapacidades contractuales son más amplias (mayoría de edad, interdicción) que las incapacidades delictuales (dementes, menores de 7, y de 7 a 16 sin discernimiento)", "keywords": ["incapa", "capacidad delictual", "dieciocho", "siete anos", "dieciseis", "discernimiento", "mas amplias"], "pregunta": "¿Es incapaz de la misma manera quien no puede contratar y quien no puede cometer un delito o cuasidelito civil?"},
    {"texto": "Señala que la solidaridad es la regla general entre coautores de un delito o cuasidelito civil, mientras que en materia contractual la regla general es la simple conjunción salvo fuente expresa de solidaridad", "keywords": ["solidaridad", "solidario", "simplemente conjunta", "regla general", "dos o mas personas", "coautores"], "pregunta": "Si dos personas cometen juntas un delito o cuasidelito civil, ¿cómo responden frente a la víctima? ¿Es la misma regla si dos deudores incumplen un mismo contrato?"},
    {"texto": "Menciona la extensión del daño / previsibilidad (art. 1558) y el daño moral como diferencia de régimen", "keywords": ["1558", "previstos", "imprevistos", "previsibilidad", "extension", "dolo o culpa", "incumple con dolo", "responde de mas perjuicios", "dano moral"], "pregunta": "¿La cantidad de perjuicios que se pueden cobrar cambia según haya solo culpa o haya dolo? ¿En qué artículo está eso?"},
    {"texto": "Señala que solo en materia contractual cabe avaluar anticipadamente el daño mediante cláusula penal, exigible sin necesidad de prueba del monto", "keywords": ["clausula penal", "avaluacion anticipada", "sin necesidad de probar", "no es admisible en la responsabilidad extracontractual", "avaluar anticipadamente"], "pregunta": "¿Se puede pactar de antemano el monto de la indemnización en un contrato? ¿Podría pactarse eso mismo antes de que ocurra un hecho ilícito futuro?"},
    {"texto": "Señala que el dolo agrava expresamente la responsabilidad del deudor en materia contractual, mientras que en extracontractual no produce, por regla general, efectos distintos de los de la culpa (salvo el art. 2316)", "keywords": ["2316", "dolo", "agravante", "no produce efectos distintos", "agrava"], "pregunta": "¿El dolo del deudor cambia en algo su responsabilidad en materia contractual? ¿Ocurre lo mismo, por regla general, en materia extracontractual?"},
    {"texto": "Señala la diferencia de prescripción (plazo general de largo tiempo en contractual / plazo especial de corto tiempo en extracontractual)", "keywords": ["2515", "2332", "5 anos", "4 anos", "prescripcion", "plazo distinto", "largo tiempo", "corto tiempo"], "pregunta": "¿El plazo para demandar es el mismo en ambos estatutos, o hay una diferencia entre ellos?"}
  ]'::jsonb
where codigo = 'rc-just-001';
```

### 2. `rc-aplic-002` → se mueve a Extracontractual, eje 14

Detectado por el agente de Fase 0 REC: el caso (repartidor que choca a
una peatona ajena a cualquier contrato, arts. 2320/2317/2325) es
responsabilidad por el hecho ajeno, no contractual. Mismo aviso que el
ítem anterior: este `UPDATE` corrige Supabase ahora, pero el registro
sigue en la base `Digesto Contractual` de Airtable y hay que moverlo ahí
también antes de volver a correr el sync.

```sql
update public.evaluacion_practica
set
  materia = 'Responsabilidad extracontractual',
  tema = '14. Régimen general y casos particulares de responsabilidad por el hecho ajeno (art. 2320)'
where codigo = 'rc-aplic-002';
```

### 3. `rc-just-009` → mismo problema, ya estaba en Contractual (no cambia de materia)

"Explica al menos cuatro diferencias entre la acción oblicua... y la
pauliana..." El manual (`s7d`) trae un recuadro de **ORREGO** titulado
literalmente "Seis diferencias entre la acción oblicua y la pauliana",
y el ítem solo tenía 4 de esas 6 en `elementos_clave`. Se completaron
las 2 que faltaban (acción directa/representación, y crédito exigible
vs. a plazo) y se agregó `minimo_elementos = 4`. Este no cambia de
materia ni de eje, ya estaba bien clasificado.

```sql
update public.evaluacion_practica
set
  minimo_elementos = 4,
  elementos_clave = '[
    {"texto": "Explica que la oblicua supone un actuar negligente del deudor, mientras la pauliana exige un acto fraudulento", "keywords": ["negligente", "fraudulento", "culpa", "fraude"], "pregunta": "¿Qué conducta del deudor da origen a cada una de estas dos acciones: negligencia o fraude?"},
    {"texto": "Señala que la oblicua incorpora bienes que nunca estuvieron en el patrimonio del deudor, mientras la pauliana reincorpora bienes que salieron fraudulentamente", "keywords": ["nunca estuvieron", "reincorpora", "salieron del patrimonio", "bienes que ya salieron"], "pregunta": "¿La oblicua trae bienes nuevos al patrimonio, o recupera bienes que ya habían salido de él?"},
    {"texto": "Explica que los bienes obtenidos por la oblicua benefician a todos los acreedores, mientras los de la pauliana solo benefician al acreedor que la ejerció", "keywords": ["todos los acreedores", "solo al acreedor que la ejerció", "beneficia a todos"], "pregunta": "¿Si un acreedor ejerce con éxito la acción oblicua, se benefician también los demás acreedores del deudor? ¿Y si ejerce la pauliana?"},
    {"texto": "Señala que la pauliana prescribe en un año desde el acto o contrato, mientras la oblicua no tiene una regla única de prescripción", "keywords": ["un año", "prescribe", "no tiene regla única"], "pregunta": "¿En cuánto tiempo prescribe la acción pauliana? ¿Existe un plazo único equivalente para la oblicua?"},
    {"texto": "Señala que la pauliana es una acción directa que pertenece por derecho propio a los acreedores, mientras que en la oblicua actúan en nombre y representación del deudor", "keywords": ["accion directa", "derecho propio", "representacion del deudor", "actuan en nombre"], "pregunta": "Cuando un acreedor ejerce la acción pauliana, ¿actúa a nombre propio o representando al deudor? ¿Es igual en la oblicua?"},
    {"texto": "Señala que parte de la doctrina niega la acción oblicua si el crédito no es actualmente exigible, mientras que la pauliana puede intentarla también el acreedor a plazo", "keywords": ["credito exigible", "acreedor a plazo", "1496", "insolvencia", "caducar el plazo"], "pregunta": "¿Puede un acreedor cuyo crédito todavía no es exigible (a plazo) ejercer la acción pauliana? ¿Y la oblicua?"}
  ]'::jsonb
where codigo = 'rc-just-009';
```

## Revisadas y descartadas (no tienen el mismo problema)

Se revisaron los otros 3 ítems de Justificación con patrón "menciona/
explica N [algo]" en todo el banco:

- `cont-just-001` ("dos consecuencias prácticas" de culpa grave = dolo):
  el manual, en el pasaje exacto de esa asimilación (art. 44), solo
  nombra dos consecuencias (perjuicios imprevistos del art. 1558 y
  condonación anticipada prohibida). No hay una tercera opción válida
  flotando, el ítem está bien como está.
- `rc-just-003` ("al menos dos ejes de discusión doctrinal" sobre
  obligaciones de medio/resultado): el recuadro del manual dice
  literalmente "Primero... Segundo...", cierra la enumeración en dos.
  Bien como está.
- `pre-just-005` (Precontractual): no es un "N de M", es una pregunta de
  fundamento único. No aplica.

No se auditaron los tipos Aplicación/Detección de error con el mismo
criterio en esta pasada (el patrón "menciona N de M" es mucho más común
en Justificación por su formato de respuesta libre); si aparece un caso
similar ahí, aplica la misma regla (sección 0.25 del prompt maestro).
