# Acto Jurídico — Tramo 4, sub-tramos 4.8 y 4.9 unificados: VI. Modalidades de los actos jurídicos (completo)

> Informe de cambios propuestos. Sigue el método de
> `docs/manuales/actualizar-manuales-existentes.md`. No se ha tocado el
> manual todavía: este documento se detiene a la espera de la
> aprobación de Laura. A pedido de Laura, este informe trata **todo el
> título VI de una vez** (los sub-tramos 4.8 y 4.9 planeados en
> `estado_acto-juridico.md`), en vez de dividirlo en dos.

## 0. Alcance y fuentes

- Fuente principal: Boetsch `principal_17`, "MODALIDADES DEL AJ" (pp.
  209 a 221 de 221, las 13 páginas finales del apunte completo). Es un
  PDF distinto al `principal_16` de los tramos 4.5-4.7.
- Anexos revisados, ninguno aporta contenido nuevo a Modalidades:
  - `Anexo_secundario_AJ_Ineficacia.pdf` (Bozzo e Ibarra): las siete
    menciones de "condici-" que trae son todas sobre conversión
    (IV.B.4.5, ya cerrado en el tramo 3) o sobre las causales de
    ineficacia en sentido estricto de IV.G (ya cerrado en 4.5). No
    trata la condición, el plazo o el modo como institución.
  - `INEFICACIA JURÍDICA_Cuadro comparativo.pdf` (mismo autor, 3
    páginas): es enteramente el cuadro de IV.G, ya usado por completo
    en el tramo 4.5. Su fila "SUSPENSIÓN" menciona condición y plazo
    solo de paso, sin nada nuevo.
  - `Memorice_ART y Definiciones.pdf`: el glosario llega hasta la
    sección "4. REPRESENTACIÓN" y no tiene una sección de Modalidades.
    No hay definiciones de condición, plazo o modo ahí; queda pendiente
    para cuando se trabaje el Memorice de este capítulo (ver sección 5).
- Manual actual: `04_Acto_Juridico_Manual.html`, líneas 3232-3350
  (`id="cVI"` hasta el final del archivo).
- Rama: se sigue trabajando en `worktree-acto-juridico-tramo4-5-otras-causales`
  (el nombre quedó del sub-tramo 4.5; ya trae los tramos 4.2 a 4.7,
  todos mergeados a `main`, así que en la práctica esta rama arranca
  limpia desde `main`). VI no fue tocado por ningún tramo anterior.

## 1. Qué se hizo para este informe

- Extracción completa de `principal_17` con `fitz` (13 páginas, texto
  limpio de encabezados y pies de página).
- Lectura completa de VI actual del manual (líneas 3232-3350): **igual
  que V.1-V.10, VI tampoco viene de una reescritura de esta sesión**,
  ya estaba en el formato nuevo (`h1`/`h2.grupo`/`h2`/`h3`, `span.art`,
  un recuadro `.dato-grado`), pero nunca se había auditado unidad por
  unidad contra Boetsch. Primer cruce.
- Verificación artículo por artículo de los 28 artículos citados contra
  `Apuntes/Codigo Civil Chileno.pdf`: **26 coinciden**; se encontraron
  **dos artículos que no cuadran con el texto vigente** (sección 4).
- Chequeo mecánico corrido sobre VI actual, antes de proponer cambios:
  balance de etiquetas OK, cero guiones largos y guillemets, ningún
  párrafo sobre 1.200 caracteres.
- Razón de caracteres actual del tramo: **53,7%** (14.169 caracteres en
  el manual contra 26.399 en Boetsch, limpio de encabezados). Está en
  línea con los tramos ya cerrados (37,5% a 52,6% en el tramo 3 antes y
  después de la reparación).

## 2. Inventario unidad por unidad

| Unidad | Fuente | Manual actual | Estado |
|---|---|---|---|
| VI.1 Concepto | Boetsch p. 209 | Presente Ramos/Abeliuk; falta la razón concreta de por qué la solidaridad y la representación son modalidades (Boetsch la da, el manual solo las nombra) | **Parcial** (3.1) |
| VI.2 Características a/b/c | Boetsch pp. 209-210 | Contenido completo, pero colapsado en un párrafo corrido, sin los marcadores a)/b)/c) que exige `formato.md` sección 2 | **Parcial, formato** (3.2) |
| VI.3 Actos que pueden sujetarse a modalidades | Boetsch p. 210 | Falta la razón de por qué los actos patrimoniales admiten modalidades ("puede hacerse todo lo que la ley no prohíbe") y el glosado de "actual" e "indisolublemente" del art. 102 | **Parcial** (3.3) |
| VI.4 Lugar en que el Código se ocupa de las modalidades | Boetsch p. 210 | Presente en síntesis; falta el detalle de títulos y párrafos exactos | **Parcial** (3.4) |
| A.1 Concepto de la condición | Boetsch pp. 210-211 | Presente, completo | **Está**, con problema de cita (sección 4.1) |
| A.2 Clasificaciones (intro) | Boetsch p. 211 | Falta la frase introductoria que enumera los cuatro criterios antes de 2.1 | **Falta** (3.5) |
| A.2.1 Positivas y negativas | Boetsch p. 211 | Presente, completo | **Está** |
| A.2.2 Posibles e imposibles | Boetsch pp. 211-212 | Presente, completo | **Está** |
| A.2.3 Suspensiva y resolutoria | Boetsch p. 212 | Presente el texto del art. 1479 y los ejemplos; falta la reformulación doctrinal ("en otras palabras...") | **Parcial** (3.6) |
| A.2.4 Potestativa, casual o mixta | Boetsch pp. 212-214 | Presente, completo, con recuadro sobre la única condición inválida | **Está**, recuadro en clase retirada (sección 5) |
| A.3 Estados de la condición (intro) | Boetsch p. 214 | Presente, completo | **Está** |
| A.3.1 Efectos de la condición suspensiva | Boetsch pp. 214-215 | Presente (i)(ii)(iii), completo en sustancia | **Está** |
| A.3.2 Efectos de la condición resolutoria | Boetsch pp. 215-216 | Presente (i)(ii)(iii); en (ii) falta la frase "las cosas vuelven al estado en que se hallaban..." | **Parcial** (3.7) |
| B.1 Concepto del plazo | Boetsch p. 216 | Presente, completo | **Está** |
| B.2 Semejanzas y diferencias | Boetsch p. 217 | Contenido completo (3 semejanzas + 4 diferencias), pero colapsado en un párrafo, sin la estructura a)/b)/c) de Boetsch | **Parcial, formato** (3.8) |
| B.3 Clasificaciones (intro + 3.1 a 3.4) | Boetsch pp. 217-219 | 3.1, 3.3 y 3.4 completos; en 3.2 (determinado/indeterminado) falta la precisión de "dos cosas que se saben de antemano" | **Parcial** (3.9) |
| B.4.1 Efectos del plazo suspensivo | Boetsch pp. 219-220 | Presente, completo | **Está** |
| B.4.2 Efectos del plazo extintivo | Boetsch p. 220 | Falta el ejemplo del arrendamiento | **Falta** (3.10) |
| C.1 Concepto del modo | Boetsch pp. 220-221 | Presente, completo, con los dos ejemplos (escuelas y estatua); falta el matiz "al menos en general" | **Parcial** (3.11) |
| C.2 Efectos del modo | Boetsch p. 221 | Presente, completo | **Está** |
| C.3 Cumplimiento del modo | Boetsch p. 221 | Presente, completo | **Está**, con problema de cita (sección 4.2) |

**Conclusión del inventario:** a diferencia de varios tramos previos,
VI **no tenía huecos grandes**: todos los ejemplos y todas las reglas
de Boetsch están en el manual. Lo que falta son matices puntuales de
redacción (3.1, 3.3, 3.6, 3.7, 3.9, 3.10, 3.11), dos incumplimientos de
formato que sí son obligatorios según `formato.md` (3.2 y 3.8, las
enumeraciones a)/b)/c) colapsadas en prosa), y dos citas de artículo
que no coinciden con el Código vigente (sección 4). También se
proponen cajas `.ley` nuevas siguiendo la convención de los tramos 3 y
4.7 (sección 3.12).

## 3. Cambios propuestos

### 3.1 Completar VI.1 con la razón de la solidaridad y la representación como modalidades

> Segunda mitad del primer párrafo de VI se reemplaza por:

```html
<p><strong>RAMOS</strong> define las modalidades como elementos establecidos por la ley, el testamento o la voluntad de las partes con el objeto de alterar los efectos normales de un negocio jurídico; para <strong>ABELIUK</strong>, son las cláusulas que las partes introducen para modificar esos efectos normales en cuanto a su existencia, exigibilidad o extinción. La <strong>condición</strong>, el <strong>plazo</strong> y el <strong>modo</strong> son las principales, pero no las únicas: cualquier alteración del efecto normal de un acto constituye una modalidad. Así, también lo es la <strong>solidaridad</strong>, porque lo normal, habiendo varios deudores o acreedores, es que cada uno solo pueda exigir o deba su cuota, y la solidaridad altera esa regla; las <strong>obligaciones alternativas o facultativas</strong>, en cuanto se apartan de la normalidad; y la <strong>representación</strong>, en cuanto los efectos del acto no se radican en quien lo celebra, sino en el patrimonio del representado.</p>
```

### 3.2 Reformatear VI.2 (Características) a la enumeración a)/b)/c) que exige `formato.md`

El contenido ya está completo; se reformatea a bloques `.enum-a`, que
es lo que corresponde según la regla de enumeraciones (explicación de
dos líneas o más por punto).

> El segundo párrafo de VI se reemplaza por:

```html
<p>Las modalidades tienen tres características.</p>

<span class="enum-a"><span class="num">a)&nbsp;&nbsp;&nbsp;&nbsp;</span><span class="tit">Son elementos accidentales de los actos jurídicos</span></span>
<p>No pertenecen esencial ni naturalmente al acto, sino que se le agregan mediante cláusulas especiales (<span class="art">art. 1444</span>). Excepcionalmente pueden no serlo: la condición resolutoria tácita es un elemento de la naturaleza, y en el contrato de promesa la condición o el plazo pasan a ser un elemento de la esencia (<span class="art">art. 1554 Nº 3</span>).</p>

<span class="enum-a"><span class="num">b)&nbsp;&nbsp;&nbsp;&nbsp;</span><span class="tit">Son excepcionales</span></span>
<p>La regla general es que los actos sean puros y simples: por eso quien alega una modalidad debe probarla, se interpretan restrictivamente y no se presumen, salvo la condición resolutoria tácita, que la ley presume envuelta en todo contrato bilateral (<span class="art">art. 1489</span>).</p>

<span class="enum-a"><span class="num">c)&nbsp;&nbsp;&nbsp;&nbsp;</span><span class="tit">Requieren una fuente que las cree</span></span>
<p>El testamento, la convención o la ley; la sentencia judicial normalmente no crea modalidades, salvo autorización legal expresa, como la que faculta al juez para fijar un plazo al poseedor vencido que debe restituir la cosa reivindicada (<span class="art">art. 904</span>).</p>
```

### 3.3 Completar VI.3 con la razón de los actos patrimoniales y el glosado del art. 102

> El tercer párrafo de VI se reemplaza por:

```html
<p>Los actos <strong>patrimoniales</strong> admiten modalidades por regla general, porque en derecho privado la regla fundamental es que puede hacerse todo lo que la ley no prohíbe. Excepcionalmente hay actos que no las admiten, como la aceptación o repudiación de una herencia (que no puede sujetarse a condición ni a plazo, <span class="art">art. 1227</span>) o la legítima rigorosa (que no admite condición, plazo, modo ni gravamen alguno, <span class="art">art. 1192</span>). Los actos de <strong>familia</strong>, en cambio, no admiten modalidades, porque sus efectos los fija la ley de forma imperativa: el matrimonio se define como un contrato que une a los cónyuges <em>actual e indisolublemente</em> (<span class="art">art. 102</span>). <strong>Actual</strong> significa que el matrimonio produce sus efectos inmediatamente de celebrado, sin que puedan supeditarse a una condición o a un plazo; <strong>indisolublemente</strong>, que su término no puede subordinarse a suceso alguno, porque dura toda la vida de los cónyuges.</p>
```

### 3.4 Completar VI.4 con el detalle de títulos y párrafos

> El cuarto párrafo de VI se reemplaza por:

```html
<p>El Código trata las modalidades en el título IV del libro III, a propósito de las asignaciones testamentarias condicionales (párrafo 2), a día (párrafo 3) y modales (párrafo 4), y en los títulos IV, <em>De las obligaciones condicionales y modales</em>, y V, <em>De las obligaciones a plazo</em>, del libro IV.</p>
```

### 3.5 Agregar la frase introductoria que falta en A.2 (Clasificaciones)

> Antes de "2.1. Positivas y negativas", agregar:

```html
<p>Según el punto de vista que se considere, las condiciones se clasifican en positivas y negativas, posibles e imposibles, potestativas, casuales y mixtas, y suspensivas y resolutorias.</p>
```

### 3.6 Completar A.2.3 con la reformulación doctrinal

> Al final del párrafo de A.2.3, agregar la oración:

```html
En otras palabras, la condición suspensiva es el hecho futuro e incierto del cual depende el nacimiento o la adquisición de un derecho, y la resolutoria, aquel del cual depende su extinción.
```

(Queda como una oración más dentro del mismo párrafo existente, antes
de los ejemplos.)

### 3.7 Completar A.3.2(ii) con "las cosas vuelven al estado..."

> El párrafo de A.3.2(ii) se reemplaza por:

```html
<span class="enum-i">(ii) Cumplida.</span>
<p>El derecho se resuelve o extingue, también con <strong>fuerza retroactiva</strong>: deja de existir no solo hacia el futuro, sino como si nunca hubiese existido. Las cosas vuelven al estado en que se hallaban antes de la celebración del acto, y las partes deben quedar en la misma situación en que se encontraban antes, debiendo restituirse lo recibido bajo esa condición.</p>

<p class="ley"><span class="ley-num">Art. 1487.</span>"Cumplida la condición resolutoria, <strong>deberá restituirse lo que se hubiere recibido bajo tal condición</strong>, a menos que ésta haya sido puesta en favor del acreedor exclusivamente, en cuyo caso podrá éste, si quiere, renunciarla; pero será obligado a declarar su determinación, si el deudor lo exigiere."</p>
```

### 3.8 Reformatear B.2 (Semejanzas y diferencias) siguiendo la estructura de Boetsch

Boetsch separa esto en "2.1 Semejanzas" (3 puntos) y "2.2 Diferencias"
(4 puntos). Como las diferencias contrastan plazo y condición en 4
criterios distintos, se propone un **cuadro comparativo** para esa
parte (regla de `formato.md` 4.1: paralelos con 3 o más criterios), y
una lista breve `enum-i-run` para las semejanzas, que no contrastan
valores sino que enuncian rasgos comunes.

> El párrafo de B.2 se reemplaza por:

```html
<p>El plazo y la condición comparten tres rasgos: <span class="enum-i-run"><span class="num">(i)&nbsp;&nbsp;&nbsp;&nbsp;</span></span>ambos son modalidades de los actos jurídicos; <span class="enum-i-run"><span class="num">(ii)&nbsp;&nbsp;&nbsp;&nbsp;</span></span>ambos son hechos futuros; y <span class="enum-i-run"><span class="num">(iii)&nbsp;&nbsp;&nbsp;&nbsp;</span></span>ambos permiten impetrar medidas conservativas.</p>

<table>
<tr><th>Criterio</th><th>Plazo</th><th>Condición</th></tr>
<tr><td>Naturaleza del hecho</td><td>Cierto e inevitable</td><td>Incierto: puede o no ocurrir</td></tr>
<tr><td>Qué afecta</td><td>El ejercicio o la exigibilidad del derecho</td><td>La existencia misma del derecho</td></tr>
<tr><td>Lo pagado antes de su cumplimiento</td><td>No está sujeto a restitución (<span class="art">art. 1495</span>)</td><td>Puede repetirse mientras no se cumpla (<span class="art">art. 1485</span>)</td></tr>
<tr><td>Origen</td><td>Convencional, legal o judicial</td><td>Solo la voluntad de las partes o la ley</td></tr>
</table>
```

*(Alternativa, si Laura prefiere no usar tabla aquí: mantener las
cuatro diferencias como lista `enum-a` con título y párrafo, igual que
las Características de 3.2.)*

### 3.9 Completar B.3.2 (determinado e indeterminado) con la precisión de Boetsch

> El párrafo de B.3.2 se reemplaza por:

```html
<p>Es <strong>determinado</strong> cuando se sabe con anticipación el día exacto en que ocurrirá el hecho futuro (una fecha del calendario), e <strong>indeterminado</strong> cuando, aunque se sabe que el hecho ocurrirá, se ignora cuándo (la muerte de una persona). En el determinado se saben de antemano dos cosas: que el hecho ocurrirá, y el día en que ocurrirá; en el indeterminado, solo se sabe la primera.</p>
```

### 3.10 Agregar el ejemplo de plazo extintivo que falta en B.4.2

> El párrafo de B.4.2 se reemplaza por:

```html
<p>Pone fin a los efectos del acto y extingue el derecho, pero, a diferencia de la condición resolutoria, solo hacia el futuro: no afecta los efectos ya producidos en el pasado. Por ejemplo, si tomo una casa en arriendo hasta el primero de mayo del año siguiente, llegada esa fecha mi derecho a usarla cesa, sin que eso afecte los cánones ya devengados durante el arriendo.</p>
```

### 3.11 Agregar "al menos en general" en C.1

> En el segundo párrafo de C.1, la frase final se reemplaza por:

```html
...el modo no suspende, pero obliga, al menos en general.
```

### 3.12 Cajas `.ley` nuevas (artículos que Boetsch cita textuales)

Siguiendo la convención de los tramos 3 y 4.7: `.ley` solo para
artículos que la fuente transcribe completos. Se usa siempre el texto
**vigente del Código** (no el de Boetsch: ver sección 4.3, hay una
transcripción inexacta). Además de la de A.3.2(ii) (3.7), se proponen:

> Al final del párrafo de A.2.4 (después del recuadro de la condición
> inválida), agregar:

```html
<p class="ley"><span class="ley-num">Art. 1477.</span>"Se llama condición potestativa la que depende de la voluntad del acreedor o del deudor; casual la que depende de la voluntad de un tercero o de un acaso; <strong>mixta la que en parte depende de la voluntad del acreedor y en parte de la voluntad de un tercero o de un acaso</strong>."</p>
```

> Dentro de A.3.1(i) (Pendiente, condición suspensiva), después de
> "podrá repetirse mientras no se hubiere cumplido", agregar:

```html
<p class="ley"><span class="ley-num">Art. 1485.</span>"No puede exigirse el cumplimiento de la obligación condicional, sino verificada la condición totalmente. <strong>Todo lo que se hubiere pagado antes de efectuarse la condición suspensiva, podrá repetirse mientras no se hubiere cumplido</strong>."</p>
```

> Dentro de A.3.1(i), después de la mención del art. 1492 (transmisión
> a los herederos), agregar:

```html
<p class="ley"><span class="ley-num">Art. 1492.</span>"El derecho del acreedor que fallece en el intervalo entre el contrato condicional y el cumplimiento de la condición, <strong>se transmite a sus herederos</strong>; y lo mismo sucede con la obligación del deudor. Esta regla no se aplica a las asignaciones testamentarias, ni a las donaciones entre vivos. El acreedor podrá impetrar durante dicho intervalo las providencias conservativas necesarias."</p>
```

> Al final del primer párrafo de C.1 (Concepto del modo), agregar:

```html
<p class="ley"><span class="ley-num">Art. 1089.</span>"Si se asigna algo a una persona para que lo tenga por suyo con la obligación de aplicarlo a un fin especial, como el de hacer ciertas obras o sujetarse a ciertas cargas, <strong>esta aplicación es un modo y no una condición suspensiva</strong>. El modo, por consiguiente, no suspende la adquisición de la cosa asignada."</p>
```

> Al final del párrafo de C.3 (Cumplimiento del modo), después de la
> mención del art. 1090, agregar:

```html
<p class="ley"><span class="ley-num">Art. 1090.</span>"En las asignaciones modales se llama cláusula resolutoria la que impone la obligación de restituir la cosa y los frutos, si no se cumple el modo. <strong>No se entenderá que envuelven cláusula resolutoria cuando el testador no la expresa</strong>."</p>
```

Con estas cinco cajas nuevas más la de 3.7, el tramo suma **seis**
`.ley`. Es más de lo habitual en un solo tramo (el 3 y el 4.7 agregaron
una y dos respectivamente); se proponen todas porque el propio Boetsch
transcribe todos estos artículos de forma textual y completa, pero
Laura puede pedir que se reduzcan si ve el tramo recargado.

## 4. Verificación de artículos

Los 28 artículos citados en VI se verificaron íntegros contra
`Apuntes/Codigo Civil Chileno.pdf` (regex `Art. N.` sobre el texto
extraído con `fitz`). **26 coinciden.** Dos no:

### 4.1 Art. 1463 en A.1 (Concepto de la condición): no corresponde

El manual cita "arts. 1070 y 1463" para la definición de condición
como hecho futuro e incierto. El art. 1463 del Código vigente es sobre
el **pacto de sucesión futura** ("el derecho de suceder por causa de
muerte a una persona viva no puede ser objeto de una donación o
contrato..."), sin relación con la condición. **Este error ya está en
el propio Boetsch** (su texto en la p. 210 cita literalmente "arts.
1070 y 1463"), no fue introducido por el manual.

El artículo que sí corresponde, verificado en el Código, es el **art.
1473**: "Es obligación condicional la que depende de una condición,
esto es, de un acontecimiento futuro que puede suceder o no", que es
exactamente la definición general de condición que usa el punto.
Propongo corregir la cita a "arts. 1070 y 1473", con la misma lógica
que la corrección del art. 1573→1578 del tramo 4.4 (un error de tipeo
de la fuente, no del Código).

### 4.2 Art. 1094 en C.3 (Cumplimiento del modo): no corresponde, sin reemplazo claro

El manual (siguiendo a Boetsch, que también lo cita así en la p. 221)
afirma que "la persona favorecida con el modo tiene derecho para
exigir judicialmente su cumplimiento" y cita el art. 1094. Pero el
texto vigente del art. 1094 es otra cosa: faculta al **juez** para
fijar el tiempo o la forma del modo cuando el testador no lo determinó
suficientemente. No dice nada sobre quién puede demandar su
cumplimiento.

Revisé los arts. 1089 a 1098 completos buscando la norma correcta y
**no encontré un artículo que otorgue expresamente esa acción** al
beneficiado con el modo; los arts. 1095 y 1096 tratan otras cosas
(transmisibilidad del modo a los herederos del asignatario, y reparto
del valor cuando opera la cláusula resolutoria). Puede que sea una
imprecisión del propio Boetsch, o que la acción se funde en principios
generales sin un artículo específico. **No propongo un reemplazo**,
porque no tengo uno verificado: dejo la observación para que Laura
decida (mantener la cita tal cual, citarla sin número de artículo, o
indicar ella el artículo correcto si lo conoce).

### 4.3 Nota adicional: transcripción inexacta de Boetsch en el art. 1485

No es un error de cita, sino de **transcripción**: Boetsch, al citar
textualmente el art. 1485 en la p. 214, escribe "...antes de
**verificarse** la condición suspensiva...", pero el texto vigente del
Código dice "...antes de **efectuarse** la condición suspensiva...".
La caja `.ley` propuesta en 3.12 usa la palabra correcta del Código
("efectuarse"), no la de Boetsch.

## 5. Pendiente para Laura

1. Aprobar 3.1 a 3.12 (o indicar cuáles no incorporar). Los puntos 3.2
   y 3.8 son correcciones de formato obligatorias según `formato.md`;
   el resto son adiciones de contenido de Boetsch.
2. **Art. 1463 → 1473** (sección 4.1): ¿corrijo la cita, siguiendo el
   mismo criterio que el art. 1578 del tramo 4.4?
3. **Art. 1094** (sección 4.2): sin reemplazo verificado. ¿Mantener la
   cita tal cual (fiel a Boetsch, aunque imprecisa), quitar el número
   de artículo y dejar la oración sin cita, o Laura conoce el artículo
   correcto?
4. **B.2, tabla vs. lista** (3.8): ¿la propuesta de cuadro comparativo
   para las diferencias plazo/condición, o prefiere mantenerlo como
   lista de texto?
5. **Recuadro `.dato-grado` de A.2.4** ("la única condición inválida"):
   la clase está retirada desde `formato.md` (no se usa en contenido
   nuevo), pero sigue en la hoja de estilos "hasta su revisión". No
   propongo tocarlo en este tramo porque esa revisión está pensada
   como una pasada aparte, igual que el bug de las tablas en
   Responsabilidad y Bienes. Si Laura prefiere resolverlo ahora, el
   equivalente natural sería `.callout` ("No confundir"), porque el
   contenido contrasta dos casos similares (condición suspensiva vs.
   resolutoria puramente potestativa del deudor).
6. **Ejemplos de la fuente sin "achilenizar"**: A diferencia de otros
   tramos, VI reutiliza casi textualmente los nombres y hechos de los
   ejemplos de Boetsch (Manuel, María, Juan Antonio, Pedro, Primus, la
   estrella con la mano), sin reemplazarlos por ejemplos propios con
   nombres chilenos, como pide la regla "ejemplos propios" desde el
   tramo 3. No até este cambio a la aprobación de 3.1-3.12 porque
   implica reescribir bastante más contenido del que hay huecos reales
   (serían 6-7 ejemplos nuevos, no correcciones puntuales). ¿Lo
   incorporamos en este mismo tramo, o queda para una pasada aparte,
   igual que el `.dato-grado`?
7. Con este tramo se cierra por completo el capítulo VI y, con él,
   **todo el tramo 4** (capítulos IV, V y VI de Ineficacia,
   Representación y Modalidades). El paso siguiente, según
   `estado_acto-juridico.md`, es volver al principio del manual:
   capítulos I, II y III.

Con la aprobación se reescribe VI con `Edit`, se verifica (balance de
etiquetas, cero guiones largos, ningún párrafo sobre 1.200 caracteres,
frases clave del inventario presentes, diff línea por línea de lo
eliminado), y se muestran capturas de Chrome headless.

## 6. Decisiones de Laura y segunda pasada

Laura aprobó todo el informe sin cambios ("Todo ok, apruebo todo"). Se
aplicaron los 12 cambios de contenido/formato (3.1 a 3.12) y la
corrección de cita del art. 1463 → 1473 (sección 4.1). Para los tres
puntos que no tenían una recomendación única, se aplicó el criterio por
defecto que el propio informe ya proponía:

- **B.2, tabla vs. lista** (3.8): se aplicó la tabla comparativa
  (era la propuesta principal del informe).
- **Ejemplos sin achilenizar**: Laura corrigió el criterio inicial de
  dejarlo para una pasada aparte ("deben modificarse ahora, no
  después, como lo estábamos haciendo antes"). Se reescribieron los 6
  ejemplos que reutilizaban nombres y hechos de Boetsch casi textuales
  (detalle en la sección 6).

Después de la primera pasada, Laura pidió dos correcciones adicionales
sobre lo que el informe había dejado sin resolver:

- **Recuadro `.dato-grado` de A.2.4**: Laura pidió bajarlo a texto
  corrido (mismo criterio que el tramo 4.1) y agregar un ejemplo
  propio, que no existía. Se agregó: Bastián y la Fernanda, contraste
  entre la condición suspensiva puramente potestativa nula (<em>te pago
  cinco millones si quiero</em>) y la resolutoria puramente potestativa
  válida (donación con reserva de revocarla cuando quiera el donante).
- **Art. 1094** (sección 4.2): Laura confirmó el texto vigente del
  artículo (coincide exactamente con el verificado contra el Código).
  Como ese texto no respalda la frase "la persona favorecida con el
  modo puede exigir judicialmente su cumplimiento" (que queda sin cita
  de artículo, tal como se dejó en el informe original), se usó para
  agregar contenido nuevo y genuino que antes faltaba: la regla del
  art. 1094 sobre el juez fijando el tiempo o la forma del modo cuando
  el testador no lo determinó suficientemente, con el resguardo del
  mínimo de un quinto del valor de la cosa para el asignatario modal.
  Se agregó como punto nuevo en C.3, con ejemplo propio (Camila y la
  casa) y caja `.ley` con el texto exacto que dio Laura.
- **Ejemplos sin achilenizar**: Laura pidió corregirlos ahora, en el
  mismo tramo, no en una pasada aparte. Se reescribieron los 6 que
  reutilizaban nombres y hechos de Boetsch casi textuales:
  - A.2.4, condición casual: "si Pedro deja el empleo, te lo reservo a
    ti" → "si el Cristóbal deja la pega en el taller, te la reservo a
    ti".
  - A.2.4, condición mixta: "si me caso con María, te donaré mi auto"
    → "si me caso con la Javiera, te donaré mi auto".
  - A.3.2(i), condición resolutoria pendiente: "dono una casa a
    Manuel..." → "le dono una casa a mi tío Walter...".
  - A.3.2(iii), condición resolutoria fallida: "dono un millón de
    pesos a Juan Antonio... si se casa con María" → "le dono un
    millón de pesos a mi primo Gonzalo... si se casa con la Antonia".
  - C.3, derecho a exigir el cumplimiento del modo: "se asigna una
    suma a Primus..." → "se asigna una suma a don Hernán... a su
    sobrina".
  - C.3, modo en beneficio exclusivo: "dejo a Manuel diez millones de
    pesos para que adquiera una biblioteca jurídica" → "le dejo a mi
    sobrina Constanza diez millones de pesos para que se arme una
    biblioteca jurídica".
  - No se tocó el ejemplo clásico de raíz romana de A.2.2 ("te doy mi
    fundo si tomas una estrella con la mano"): no tiene nombre propio,
    y el manual ya lo presenta como cita histórica, no como ejemplo de
    redacción propia.

**Verificación mecánica sobre VI ya reescrito:** balance de etiquetas
OK (incluidas las de `table`/`tr`/`th`/`td`, nuevas en este tramo),
cero guiones largos y guillemets, ningún párrafo sobre 1.200
caracteres, `git diff` línea por línea de lo eliminado (10 líneas,
las 10 correspondientes a los párrafos reemplazados de 3.1-3.12, nada
ajeno), capturas de Chrome headless revisadas bloque por bloque.

**Tabla de recuadros y elementos nuevos creados por el modelo:**

| Elemento | Ubicación | Contenido |
|---|---|---|
| Caja `.ley` | A.2.4, después del recuadro `.dato-grado` | Art. 1477 completo |
| Caja `.ley` | A.3.1(i) | Art. 1485 completo (texto del Código, no el de Boetsch: corrige "verificarse" → "efectuarse") |
| Caja `.ley` | A.3.1(i) | Art. 1492 completo |
| Caja `.ley` | A.3.2(ii) | Art. 1487 completo |
| Caja `.ley` | C.1 | Art. 1089 completo |
| Caja `.ley` | C.3 | Art. 1090 completo |
| Caja `.ley` | C.3 | Art. 1094 completo (regla nueva, ver más abajo) |
| Tabla (`<table>`) | B.2 | Cuadro comparativo plazo/condición, 4 criterios |

Con esto se cierra el tramo 4.8-4.9 y **todo el tramo 4** (capítulos
IV, V y VI). Commit y push hechos; `docs/manuales/estado_acto-juridico.md`
actualizado con el resultado.
