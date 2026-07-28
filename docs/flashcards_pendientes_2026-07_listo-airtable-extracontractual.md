# Flashcards de Extracontractual listas para pegar en Airtable

> Derivado de `docs/flashcards_pendientes_2026-07_revision-extracontractual.md`
> (el análisis de qué es nuevo y qué es redundante). Este archivo ya tiene
> las 46 candidatas seleccionadas ahí redactadas en el **esquema real** de
> la base `Digesto Extracontractual`, tabla `Flashcards`: columnas
> `pregunta`, `respuesta`, `dificultad` (`basica`/`intermedia`/`avanzada`,
> sin tilde en "basica") y `tema`, que es un link a la tabla `Temas`, no
> texto libre.
>
> **Importante sobre `tema`:** probé por API si alcanza con escribir el
> nombre del eje como texto para que quede enlazado, y no funciona así (la
> API exige el ID del registro de `Temas`, no el nombre). No pude probar
> si pegar el nombre directo en la grilla de Airtable sí lo enlaza solo
> (es un comportamiento de la interfaz que no se puede probar por API), así
> que no lo doy por seguro. Más seguro: pega primero `pregunta`,
> `respuesta` y `dificultad` desde las tablas de abajo, y después completa
> `tema` a mano en cada fila eligiendo el eje correcto del desplegable (el
> encabezado de cada tabla dice cuál es). Si preferís probar a pegar el
> nombre directo en la columna de link, Airtable va a preguntar antes de
> crear un registro nuevo en `Temas`; si te pregunta eso, cancelá y elegí
> el existente a mano, así no quedan Temas duplicados.
>
> No lleva columnas `materia` ni `subtema`: esa tabla no las tiene.
>
> Se dejaron fuera unas 10 candidatas de baja prioridad o puramente
> ilustrativas que se mencionan en el doc de revisión (ejemplos que
> repiten un punto ya nombrado en otra carta del mismo eje); si querés
> agregar alguna de esas igual, están detalladas ahí.
>
> Antes de pegar: correr primero `scripts/contenido_practica_2026-07.sql`
> en Supabase si no se hizo (117 Alternativas + 32 Memorice ya redactadas
> desde 2026-07-24, sin relación con este archivo pero pendiente hace
> tiempo; no mezclar los dos, son tablas distintas. Después de pegar
> estas 46 en Airtable, correr `python3 scripts/sync_airtable_supabase.py`
> para que lleguen a Supabase y a la app.

## Eje A, tema: "1. Concepto, regulación y funciones de la responsabilidad civil extracontractual"

| pregunta | respuesta | dificultad |
|---|---|---|
| ¿Cuáles son las cuatro funciones de la responsabilidad extracontractual? | <em>(i)</em> Reparación del daño; <em>(ii)</em> garantía de la libertad de actuar (<em>alterum non laedere</em>); <em>(iii)</em> prevención; <em>(iv)</em> punición (excluida como regla general). | intermedia |
| Según Barros, ¿es la obligación de indemnizar extracontractual de "primer grado" o de "segundo grado"? | De <strong>primer grado</strong>: nace originariamente del hecho dañoso, sin que exista un vínculo obligatorio previo entre las partes. | avanzada |
| Según el <span class="art">artículo 1437</span>, ¿de qué hecho nace la obligación de indemnizar en sede extracontractual? | De <strong>un hecho que ha inferido injuria o daño a otra persona</strong>, como en los delitos y cuasidelitos. | basica |

## Eje B, tema: "2. Responsabilidad civil y responsabilidad penal"

| pregunta | respuesta | dificultad |
|---|---|---|
| ¿En qué tres casos taxativos produce cosa juzgada civil una sentencia absolutoria penal (<span class="art">artículo 179 CPC</span>)? | <em>(i)</em> Inexistencia del hecho; <em>(ii)</em> ausencia de relación entre el hecho y el acusado; <em>(iii)</em> ausencia de todo indicio contra el acusado. | avanzada |
| Si la absolución penal se debió a duda razonable, no a inexistencia del hecho, ¿puede la víctima demandar civilmente? | Sí. La insuficiencia probatoria <strong>no es una causal</strong> del art. 179; la víctima puede probar la culpa civil, de estándar más bajo. | avanzada |

## Eje C, tema: "3. Delimitación de estatutos: contractual, cuasicontractual y derecho común"

| pregunta | respuesta | dificultad |
|---|---|---|
| ¿Cuáles son los tres argumentos de Alessandri para sostener que el derecho común es el contractual? | <em>(i)</em> Único régimen regulado genéricamente; <em>(ii)</em> el epígrafe "Del efecto de las obligaciones"; <em>(iii)</em> la graduación de la culpa en obligaciones legales. | avanzada |

## Eje D, tema: "4. Sistemas o modelos de atribución de responsabilidad"

| pregunta | respuesta | dificultad |
|---|---|---|
| Según el <span class="art">artículo 2327</span>, ¿puede el tenedor de un animal fiero exonerarse probando que no pudo evitar el daño? | No. La norma dice expresamente que <strong>"no será oído"</strong>: es un caso de responsabilidad estricta. | avanzada |
| ¿Por qué se dice que la culpa civil se ha "objetivado"? | Porque el juicio de culpa compara <strong>en abstracto</strong> la conducta con el estándar del hombre prudente, y no exige un reproche moral personal al autor. | avanzada |

## Eje E, tema: "5. La capacidad delictual"

| pregunta | respuesta | dificultad |
|---|---|---|
| ¿Qué es el "discernimiento" exigido al menor entre siete y dieciséis años? | La aptitud de comprender la <strong>ilicitud</strong> del acto y de apreciar mínimamente su <strong>riesgo</strong>; ambos elementos deben concurrir. | avanzada |
| ¿Vincula al juez civil el decreto de interdicción por demencia? | Para Barros y Alessandri, no: es solo un <strong>antecedente</strong>; el interdicto puede ser tenido por capaz si conservaba discernimiento. | avanzada |
| ¿Tiene el guardián acción de reembolso contra el incapaz que causó el daño? | No, porque responde de su <strong>propia culpa</strong> (falta de vigilancia), no de una culpa ajena (a contrario sensu del <span class="art">artículo 2325</span>). | avanzada |

## Eje F, tema: "6. El hecho voluntario. Caso fortuito y personas jurídicas"

| pregunta | respuesta | dificultad |
|---|---|---|
| ¿Es lo mismo la demencia que el sonambulismo, para efectos de la responsabilidad? | No. La demencia es <strong>incapacidad permanente</strong>; el sonambulismo es <strong>falta transitoria de voluntariedad</strong> del acto concreto. | avanzada |

## Eje G, tema: "7. La antijuridicidad y las causales de justificación"

| pregunta | respuesta | dificultad |
|---|---|---|
| Según Barros, ¿qué función cumplen las causales de justificación en sede civil? | Servir de <strong>excusa razonable para el hombre prudente</strong>: eliminan la culpabilidad, no (según él) la antijuridicidad. | avanzada |
| ¿Es lo mismo renunciar a un derecho que aceptar un riesgo? | No. La renuncia está sujeta a los límites de los <span class="art">artículos 12 y 1465</span>; la <strong>aceptación de un riesgo razonable e informado</strong> es válida incluso sobre bienes indisponibles. | avanzada |

## Eje H, tema: "8. La culpabilidad: dolo y culpa"

| pregunta | respuesta | dificultad |
|---|---|---|
| ¿Por qué es un error llamar "subjetiva" a la responsabilidad por culpa, según la crítica de Barros? | Porque no exige reproche personal al sujeto; es, en rigor, <strong>objetiva</strong> (comparación con un patrón general). | avanzada |
| De la distinción entre delito y cuasidelito civil, ¿qué consecuencia tiene sobre las cláusulas de irresponsabilidad? | Son válidas respecto de la <strong>culpa</strong>, pero nunca respecto del <strong>dolo</strong> (<span class="art">artículo 1465</span>: la condonación del dolo futuro no vale). | avanzada |

## Eje I, tema: "9. Prueba de la culpa y presunciones de culpabilidad por el hecho propio (art. 2329)"

| pregunta | respuesta | dificultad |
|---|---|---|
| ¿Qué máxima del derecho anglosajón expresa la idea de la presunción del <span class="art">artículo 2329</span>? | <em>Res ipsa loquitur</em>: "dejad que las cosas hablen por sí mismas". | avanzada |
| ¿Está sujeta a alguna limitación especial la prueba de la culpa? | No. A diferencia de los actos y contratos, puede probarse por <strong>cualquier medio</strong> (testigos, presunciones, peritajes), sin restricciones. | intermedia |

## Eje J, tema: "10. El daño: concepto y requisitos de resarcibilidad"

| pregunta | respuesta | dificultad |
|---|---|---|
| ¿Cuáles son los siete requisitos de resarcibilidad del daño? | Lesionar un <strong>interés legítimo</strong>; ser <strong>cierto</strong>; tener <strong>relación directa</strong> con el hecho; no estar <strong>ya indemnizado</strong>; tener <strong>magnitud suficiente</strong>; ser <strong>previsible</strong>; y ser <strong>personal</strong> de la víctima. | avanzada |
| ¿Cómo se avalúa la indemnización por pérdida de una oportunidad? | En una <strong>fracción</strong> del beneficio esperado, proporcional a la <strong>probabilidad real</strong> de haberlo obtenido. | avanzada |
| Si varios coautores cometen un mismo delito o cuasidelito, ¿cómo responden entre sí? | <strong>Solidariamente</strong> por todo el perjuicio (<span class="art">artículo 2317</span>): la víctima puede cobrar el total a cualquiera de ellos. | intermedia |

## Eje K, tema: "11. Clases de daño (I): el daño patrimonial"

| pregunta | respuesta | dificultad |
|---|---|---|
| ¿Por qué se abandonó el concepto abstracto de daño patrimonial? | Porque permitía que un <strong>seguro propio</strong> de la víctima redujera indebidamente la indemnización debida por el responsable. | avanzada |

## Eje L, tema: "12. Clases de daño (II): el daño moral"

| pregunta | respuesta | dificultad |
|---|---|---|
| ¿Se acepta en Chile el "wrongful birth"? ¿Y el "wrongful life"? | El <strong>wrongful birth</strong> sí (nacimiento imprevisto por negligencia médica); el <strong>wrongful life</strong> se rechaza, por contradecir la dignidad de la persona. | avanzada |

## Eje M, tema: "13. La causalidad"

| pregunta | respuesta | dificultad |
|---|---|---|
| ¿Es la determinación de la causalidad una cuestión de hecho o de derecho? | <strong>Ambas cosas</strong>: que el hecho fue condición necesaria es de hecho; calificar el daño como <strong>directo</strong> es de derecho (casable). | avanzada |
| ¿Cómo se distribuye la responsabilidad entre dos causantes de hechos distintos, cada uno suficiente por sí solo para el daño? | En <strong>proporción a la participación</strong> de cada uno, con efecto práctico análogo a la solidaridad. | avanzada |

## Eje N, tema: "14. Régimen general y casos particulares de responsabilidad por el hecho ajeno (art. 2320)"

| pregunta | respuesta | dificultad |
|---|---|---|
| ¿Responde el mandante por los hechos ilícitos del mandatario? | No, porque el mandato se otorga para actos <strong>lícitos</strong> y no hay verdadero vínculo de subordinación. | avanzada |
| ¿Qué exige la jurisprudencia para que el tercero civilmente responsable se exonere probando que no pudo impedir el hecho? | Una <strong>imposibilidad total y absoluta</strong>, casi nunca acreditada en la práctica. | avanzada |

## Eje O, tema: "15. Responsabilidad del empresario"

| pregunta | respuesta | dificultad |
|---|---|---|
| ¿Responde una sociedad controladora por los daños de la sociedad que controla? | Solo si la controlada <strong>carece de autonomía funcional y patrimonial</strong> real; el solo control accionario no basta. | avanzada |

## Eje P, tema: "16. Responsabilidad por el hecho de las cosas: animales, ruina de edificio, cosas que caen o se arrojan"

| pregunta | respuesta | dificultad |
|---|---|---|
| ¿Cómo se divide la indemnización si varios habitantes de un edificio pudieron causar la caída de un objeto? | Se <strong>divide entre todos</strong> ellos, excepción al principio de solidaridad del <span class="art">artículo 2317</span>. | avanzada |

## Eje Q, tema: "17. Regímenes legales de responsabilidad objetiva"

| pregunta | respuesta | dificultad |
|---|---|---|
| ¿Puede un trabajador demandar al empleador además de recibir el seguro de la <span class="art">Ley N° 16.744</span>? | Sí, si el accidente se debió a <strong>culpa o dolo del empleador</strong>: acción complementaria por lo no cubierto, incluido el daño moral. | avanzada |
| ¿Cuál es la verdadera diferencia entre culpa y responsabilidad estricta, más allá de que ambas tengan elementos objetivos? | El <strong>injusto de la conducta</strong> (culpa) frente al <strong>injusto de que la víctima soporte el riesgo</strong> (estricta). | avanzada |

## Eje R, tema: "18. Responsabilidad del Estado"

| pregunta | respuesta | dificultad |
|---|---|---|
| ¿Exige la "falta de servicio" identificar a un funcionario específico negligente? | No. Se limita a calificar si el <strong>servicio en su conjunto</strong> debió funcionar de un modo distinto. | avanzada |
| ¿Es la falta de servicio un régimen de responsabilidad estricta pura? | No. Conserva un <strong>juicio normativo</strong> (comparación con el estándar razonable de la función pública), aunque marcadamente objetivo. | avanzada |
| ¿Cuál es la objeción principal a la doctrina de la responsabilidad estricta pura del Estado? | Transformaría al Estado en un <strong>seguro social universal</strong> frente a cualquier daño de su actividad. | avanzada |

## Eje S, tema: "19. La acción por daño contingente (art. 2333)"

| pregunta | respuesta | dificultad |
|---|---|---|
| ¿Qué consecuencia económica tiene ejercer la acción popular del <span class="art">artículo 2333</span>? | Quien la ejerce debe ser <strong>indemnizado de las costas</strong> y del valor de su tiempo y diligencia. | avanzada |
| ¿Por qué existe una "paradoja" en el fundamento de la acción de daño contingente? | Porque si la acción <strong>tiene éxito</strong>, nunca podrá verificarse ex post que la amenaza era realmente seria. | avanzada |

## Eje T, tema: "20. Objeto y extensión de la reparación"

| pregunta | respuesta | dificultad |
|---|---|---|
| ¿Qué efecto produce la reparación en naturaleza ya realizada sobre la indemnización en equivalente? | La <strong>disminuye correlativamente</strong>, en la medida en que corrigió el daño. | avanzada |
| ¿Desde cuándo corren los reajustes e intereses del daño material, según la práctica jurisprudencial dominante? | Desde la <strong>notificación de la demanda</strong> o desde la <strong>sentencia</strong>, no desde el hecho ilícito. | avanzada |
| ¿Por qué el daño moral no admite el mismo debate sobre retrotraer el reajuste al momento del hecho? | Porque no existe como <strong>cifra determinada</strong> hasta que el juez la fija en la <strong>sentencia</strong>. | avanzada |

## Eje U, tema: "21. Legitimación activa y pasiva"

| pregunta | respuesta | dificultad |
|---|---|---|
| ¿Responde el encubridor siempre igual que el mero beneficiario del dolo ajeno? | No. Si su reticencia buscaba <strong>aprovecharse</strong> del dolo conociéndolo, responde <strong>como autor</strong> por el total. | avanzada |

## Eje V, tema: "22. Tribunal, procedimiento y extinción de la acción (art. 2332)"

| pregunta | respuesta | dificultad |
|---|---|---|
| ¿Se suspende el plazo de prescripción del <span class="art">artículo 2332</span> en favor de los incapaces? | No; por ser una prescripción de <strong>corto tiempo especial</strong>, no se suspende conforme a las reglas generales. | avanzada |

## Eje W, tema: "23. Dualidad o unidad de regímenes; diferencias entre estatutos"

| pregunta | respuesta | dificultad |
|---|---|---|
| ¿Cuáles son los tres grados de culpa que distingue el <span class="art">artículo 44</span>? | <strong>Culpa grave</strong>, <strong>culpa leve</strong> y <strong>culpa levísima</strong>. | basica |
| ¿Es admisible pactar de antemano una cláusula penal para un daño extracontractual futuro frente a un tercero? | No; equivaldría a una <strong>condonación anticipada</strong> del dolo o la culpa grave futuros. | avanzada |

## Eje X, tema: "24. Cúmulo o concurso de responsabilidades"

| pregunta | respuesta | dificultad |
|---|---|---|
| ¿Pueden acumularse en un mismo juicio la acción contractual de las partes y la extracontractual de un tercero ajeno, por un mismo hecho? | Sí, sin inconveniente, porque ambas emanan <strong>directa e inmediatamente</strong> de ese mismo hecho. | avanzada |

## Eje Y, tema: "25. Responsabilidad precontractual, por nulidad y postcontractual"

| pregunta | respuesta | dificultad |
|---|---|---|
| ¿Existe responsabilidad por el solo desistimiento de una negociación, según la doctrina tradicional? | No; es el ejercicio <strong>legítimo</strong> del derecho a desistirse de un contrato eventual. | intermedia |
| ¿Por qué la calificación extracontractual uniforme de estas tres situaciones no resuelve el problema por sí sola? | Porque obliga a introducir <strong>correctivos</strong> al estándar abstracto de culpa (buena fe, confianza, lealtad). | avanzada |

## Total: 46 flashcards nuevas, ninguna todavía en Airtable
