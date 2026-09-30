# Acto Jurídico — Tramo 4, sub-tramo 4.2: La simulación (IV.D)

> Informe de cambios propuestos. Sigue el método de
> `docs/manuales/actualizar-manuales-existentes.md`. No se ha tocado el
> manual todavía: este documento se detiene a la espera de la
> aprobación de Laura.

## 0. Alcance y fuentes

- Fuente principal: Boetsch `principal_13` (Boetsch, "La simulación",
  pp. 160 a 170 de 221; la p. 160 es la misma que cierra el tramo 4.1 y
  no se repite).
- Anexo secundario: `Anexo_secundario_AJ_Ineficacia.pdf` (Bozzo e
  Ibarra), sección "LA SIMULACIÓN" (pp. 23 a 27 del PDF del anexo, hasta
  antes de "El fraude a la ley", que es fuente del sub-tramo 4.4, no de
  este). **Aporta contenido nuevo real** (ver sección 2 y 3 abajo), a
  diferencia del tramo 4.1, donde el anexo no aportaba nada.
- Manual actual: `04_Acto_Juridico_Manual.html`, líneas 2744-2811
  (`id="cIV-D"` a `id="cIV-D-4-4"`, justo antes de `id="cIV-E"`).

## 1. Qué se hizo para este informe

- Extracción completa del texto de `principal_13` con `fitz`.
- Lectura completa del `IV.D` actual del manual.
- Revisión completa de la sección "LA SIMULACIÓN" del anexo Bozzo e
  Ibarra (viene justo antes de "El fraude a la ley" en el mismo PDF).
- Cruce unidad por unidad entre fuente, anexo y manual.
- Verificación artículo por artículo contra `Apuntes/Codigo Civil
  Chileno.pdf` (arts. 10, 686, 1467, 1490, 1491, 1681, 1707, 1709, 1768,
  1796, 1876).
- Verificación por búsqueda web del fallo con rol que trae el anexo
  (Corte Suprema, rol N° 9.631-2012): confirmado que existe y que
  corresponde a lo que dice el anexo (ver sección 6).

## 2. Inventario unidad por unidad

| Unidad | Fuente | Manual actual | Estado |
|---|---|---|---|
| D.1 Concepto | Boetsch p. 160-161 | Presente, con la definición de LEÓN suelta en el párrafo (no en caja `.definicion`) | **Está**, formato a ajustar (3.1) |
| D.1 Concepto (diferencia con reserva mental) | Boetsch p. 161 + **anexo** | Presente la conclusión, falta el razonamiento y los ejemplos del anexo | **Parcial** (3.2) |
| D.2 Ordenamiento jurídico chileno | Boetsch p. 161-162 | Presente, completo (códigos extranjeros, derecho penal, derecho tributario) | **Está** |
| D.3 Simulación lícita | Boetsch p. 162-165 | Presente casi completo | **Parcial**: falta el motivo del art. 686 y el matiz de "motivos inocentes o morales" del anexo (3.3, opcional) |
| D.4.1 Requisitos | Boetsch p. 166 (a-d) | Presente en prosa con negrita, sin lista | **Parcial**: falta convertir a enumeración `(i)-(iv)` (regla de formato) y falta el fallo con rol del anexo (3.4) |
| D.4.2 Clases: absoluta y relativa | Boetsch p. 166-167 | Presente, completo en el fondo | **Parcial**: dos ejemplos son los de la fuente, no propios (3.5) |
| D.4.3 Sanción civil | Boetsch p. 167-168 | Presente, completo | **Está**; cuadro de efectos del anexo es una ampliación opcional (3.6) |
| D.4.4 Consideraciones probatorias | Boetsch p. 168-170 | Presente, pero sin la cita de Ferrara ni el punto del art. 1709 | **Parcial** (3.7) |
| — La acción de simulación | **Solo en el anexo** (no está en Boetsch ni en el manual) | No existe en el manual | **Falta** (3.8) |

**Conclusión del inventario:** a diferencia del tramo 4.1, aquí el
anexo Bozzo e Ibarra sí trae contenido de fondo que Boetsch no trae:
matices sobre la reserva mental, un fallo con rol verificable para los
requisitos de la simulación ilícita, una distinción más fina de los
efectos entre partes y terceros, reglas probatorias (art. 1709) y un
punto completo sobre la acción de simulación que hoy no existe en el
manual.

## 3. Cambios propuestos

### 3.1 Formato: la definición de LEÓN a caja `.definicion`

Hoy la definición de Avelino LEÓN está dentro del primer párrafo de
D.1, como el resto del manual la trataría con `<em>`. En casi todos los
demás puntos "Concepto" del manual, la definición central va en su
propia caja `<p class="definicion">` (ver p. ej. `cIV-A-1`, `cIV-B-1`,
nulidad absoluta/relativa). Propuesta: separar la frase de LEÓN en su
propio párrafo `.definicion`, sin cambiar el texto.

### 3.2 Ampliar D.1 con el razonamiento del anexo sobre la reserva mental

El manual ya dice que la simulación "solo cabe en los actos bilaterales
y en los unilaterales recepticios", pero esa frase viene del anexo
(Bozzo e Ibarra, que a su vez cita a Ferrara) y hoy aparece sin el
razonamiento que la sostiene ni sus consecuencias. El anexo agrega dos
ideas que faltan:

1. Los ejemplos de actos unilaterales recepticios (notificación al
   deudor de la cesión de un crédito, notificación de un despido,
   formulación de una oferta).
2. La consecuencia práctica: mientras el acto con reserva mental es en
   principio **válido**, el acto simulado es **generalmente nulo**,
   porque quien recibe la declaración falsa no solo conoce el
   desacuerdo, sino que lo ha querido junto con el declarante (de ahí
   que también se exija un "acto unitario" o unidad de acción de
   voluntades entre las partes).

Propuesta de párrafo a agregar al final de D.1:

> Por exigir ese acuerdo, la simulación requiere además un **acto
> unitario**, o unidad de acción de voluntades: la disconformidad entre
> lo querido y lo declarado debe ser querida y compartida por ambas
> partes. De ahí una diferencia práctica con la reserva mental: el acto
> jurídico con reserva mental es, en principio, **válido**, porque la
> contraparte ignora el desacuerdo; el acto simulado, en cambio, es
> generalmente **nulo**, porque quien recibe la declaración no solo
> conoce esa disconformidad, sino que la ha querido junto al
> declarante.

(Ejemplos de actos unilaterales recepticios: quedan solo como
referencia en este informe, no propongo agregarlos al manual porque
alargan el punto sin aportar mucho más que la regla ya explicada.)

### 3.3 D.3: motivo del art. 686 y "motivos inocentes o morales" (opcional)

Dos añadidos menores, ambos verificados:

1. El manual explica la mecánica de la simulación lícita en la
   compraventa de inmuebles (instrucciones notariales), pero no dice
   **por qué** las partes son reacias a pagar el precio de inmediato.
   Boetsch lo explica por el sistema chileno de transferencia de
   dominio de inmuebles, que se perfecciona con la inscripción
   (`art. 686`): el comprador solo quiere soltar el precio cuando el
   inmueble ya está inscrito a su nombre. Propuesta de frase a insertar
   antes de "Mediante el otorgamiento de una compraventa parcialmente
   simulada...": "Como la tradición del dominio de un inmueble se
   perfecciona con la inscripción del título (`art. 686`), el comprador
   solo está dispuesto a que se libere el precio una vez que el
   inmueble queda inscrito a su nombre."
2. El anexo agrega que la simulación lícita "generalmente está
   determinada por motivos inocentes o morales (por ejemplo, por
   modestia o desinterés, para realizar anónimamente el bien)".
   Propuesta: una frase corta al inicio del punto 3, después de "La
   doctrina y la jurisprudencia distinguen así entre simulación lícita
   e ilícita": "La lícita suele responder a motivos inocentes, como la
   modestia o el deseo de hacer el bien anónimamente."

Ambos son opcionales: no corrigen nada, solo completan matices. Laura
decide si los incluye.

### 3.4 D.4.1 Requisitos: convertir a lista y agregar el fallo con rol

**Formato.** Los cuatro requisitos están hoy en un párrafo corrido con
negrita suelta. `docs/manuales/formato.md` es explícito: una lista de
requisitos va enumerada, con marcador según la profundidad (acá es
primer nivel: `(i)`), subrayada por tratarse de una lista de
requisitos (`.enum-i lista`), no en negrita. Propuesta de reescritura
completa del punto:

```html
<p>Es, según la Corte Suprema, la que perjudica o tiene la intención de perjudicar a terceros, o viola o tiene la intención de violar la ley. Sus requisitos son:</p>

<span class="enum-i lista"><span class="num">(i)&nbsp;&nbsp;&nbsp;&nbsp;</span><span class="tit">Disconformidad</span></span>
<p>Entre la voluntad real, efectiva y verdadera, y la voluntad declarada o manifestada.</p>

<span class="enum-i lista"><span class="num">(ii)&nbsp;&nbsp;&nbsp;&nbsp;</span><span class="tit">Deliberación y conciencia de la disconformidad</span></span>
<p>Voluntad y pleno conocimiento de que, queriéndose algo, se expresa una voluntad diferente. Es lo que distingue la simulación del error, donde también hay disconformidad entre lo querido y lo declarado, pero falta esa conciencia.</p>

<span class="enum-i lista"><span class="num">(iii)&nbsp;&nbsp;&nbsp;&nbsp;</span><span class="tit">Concierto entre las partes</span></span>
<p>Comunicación recíproca y acuerdo entre ellas en que lo manifestado es solo apariencia, porque lo realmente convenido es algo distinto, o la nada misma.</p>

<span class="enum-i lista"><span class="num">(iv)&nbsp;&nbsp;&nbsp;&nbsp;</span><span class="tit">Intención de engañar a terceros</span></span>
<p>Derivada de los tres requisitos anteriores.</p>
```

**Fondo.** El manual atribuye estos cuatro requisitos solo a "fallo de
30 de marzo de 2015, reiterado en fallo de 30 de marzo de 2017" (así
los cita Boetsch, sin rol). El anexo Bozzo e Ibarra cita el mismo
criterio, pero con un fallo anterior **con rol verificable**: Corte
Suprema, 13 de enero de 2014, rol N° 9.631-2012. Confirmé por búsqueda
web que ese rol existe y corresponde a un caso de nulidad absoluta por
simulación relativa de una compraventa a precio vil e irrisorio, fallado
por la Primera Sala Civil (ver sección 6). Como sí tiene rol, propongo
agregar una caja de jurisprudencia después de la lista:

```html
<div class="jurisprudencia">
  <span class="caja-tipo">Jurisprudencia</span>
  <span class="caja-titulo">Corte Suprema, 13 de enero de 2014, rol N° 9.631-2012</span>
  <p>Fija los cuatro elementos de la simulación ilícita recién enumerados. El mismo criterio se reitera en los fallos de 30 de marzo de 2015 y de 30 de marzo de 2017.</p>
</div>
```

### 3.5 D.4.2: dos ejemplos que no son propios

Regla de `docs/manuales/decisiones.md`: todos los ejemplos deben ser
propios (nombres chilenos), nunca los de la fuente. Dos ejemplos de
este punto reproducen la fuente casi literalmente:

**(a) Simulación absoluta.** Hoy: "el deudor que finge vender bienes a
un amigo para sustraerlos de sus acreedores" (es el ejemplo de Boetsch,
solo resumido). Propuesta de reemplazo:

> Rodrigo, acosado por sus acreedores, simula vender su camioneta a su
> primo Cristóbal (quien accede a figurar como comprador, sin pagar ni
> recibir jamás el vehículo) para sustraerla de un eventual embargo. El
> acto tiene toda la apariencia de una compraventa válida, pero en
> realidad no existió ninguna.

**(b) Simulación relativa por sustitución de sujeto.** Hoy: "A finge
vender a B, pero en realidad vende a C" (son las letras de Boetsch, sin
cambiar). El anexo trae un ejemplo alternativo, con un artículo
verificado (`art. 1796`, prohibición de compraventa entre cónyuges no
separados judicialmente) que permite un ejemplo con más contenido
jurídico que el A/B/C genérico. Propuesta de reemplazo:

> Cristina quiere vender su departamento a su marido Ignacio, pero el
> `art. 1796` prohíbe la compraventa entre cónyuges no separados
> judicialmente. Para sortear la prohibición, Cristina vende el
> departamento a su amiga Josefina, quien de inmediato se lo revende a
> Ignacio: en el acto secreto entre Cristina e Ignacio, los verdaderos
> contratantes, queda claro que el comprador real siempre fue Ignacio.
> Josefina, que solo figura en el título, es la interpuesta
> (prestanombre, palo blanco, hombre de paja o testaferro); Ignacio, el
> contratante efectivo y oculto, es el interponente.

Los otros dos ejemplos del punto (naturaleza: donación disimulada bajo
compraventa aparente; objeto: precio distinto al declarado) son
alusiones breves dentro de la frase, no relatos con los mismos
protagonistas de la fuente: propongo dejarlos como están. Laura puede
pedir que también se personifiquen si prefiere.

### 3.6 D.4.3: cuadro comparativo de efectos (opcional)

El manual resume la sanción civil de la simulación ilícita
(nulidad absoluta, arts. 1467 y 1681) pero no distingue, como sí lo
hace el anexo, los efectos **entre las partes** y **frente a
terceros**, para cada tipo de simulación. Es una distinción real y con
contenido de examen (quién puede alegar qué, contra quién). Propuesta
de cuadro, a insertar después del primer párrafo de 4.3:

```html
<table>
<colgroup><col style="width:20%"><col style="width:40%"><col style="width:40%"></colgroup>
<tr><th>Efecto</th><th>Simulación absoluta</th><th>Simulación relativa</th></tr>
<tr><td>Entre las partes</td><td>El acto aparente no produce efecto alguno; cualquiera de las partes puede enervar sus efectos, por vía de acción o de excepción, si la otra pretende hacerlo valer</td><td>Prima la voluntad real: rige el acto oculto y carece de valor el aparente. Ninguna parte puede oponer a la otra el acto simulado para eludir el cumplimiento del acto oculto: esa facultad, según el <span class="art">art. 1707</span>, es solo de los terceros</td></tr>
<tr><td>Frente a terceros de buena fe</td><td>El acto simulado o público se considera existente</td><td>También se considera existente y válido; las partes no pueden aprovecharse de su propia simulación frente a ellos</td></tr>
</table>

<p>En la simulación relativa, además, los terceros quedan doblemente protegidos: pueden atenerse al acto aparente, oponiendo una excepción de simulación (<span class="art">art. 1707</span>), o pueden optar por el acto real si el aparente los perjudica, ejerciendo una acción de simulación.</p>
```

Es el único cambio de fondo de este informe que es realmente opcional
en el sentido de "se puede prescindir sin perder algo esencial": el
punto ya está completo con la explicación de la nulidad absoluta. Lo
propongo porque es contenido verificado y con valor de examen, pero
Laura puede preferir dejar el punto como está.

### 3.7 D.4.4: cita de Ferrara y ampliación con el art. 1709

Dos añadidos:

**(a) Cita de Ferrara.** El anexo, citando a Ferrara, agrega una frase
que explica por qué la prueba directa es casi imposible en materia de
simulación. Es una cita vívida, útil para examen. Propuesta: agregarla
como segunda oración del primer párrafo del punto, después de "cobra
especial relevancia la prueba de presunciones":

> Como explica Ferrara, "los simuladores no serán tan ingenuos como
> para dejar accesibles testimonios de sus maniobras, para que luego se
> las enrostren y emerjan las consecuencias adversas a sus planes".

**(b) Carga de la prueba y art. 1709.** El anexo agrega una regla que
hoy no está en el manual: a quién corresponde probar la simulación, con
qué medios, y una distinción entre la prueba entre las partes y frente
a terceros, apoyada en el `art. 1709` (verificado, incisos 1° y 2°).
Propuesta de párrafo nuevo, después del párrafo de la cita de Ferrara y
antes de la caja de jurisprudencia de la C. de Concepción:

> Corresponde probarla a quien la alega, pues los actos y contratos se
> presumen sinceros. Los terceros pueden valerse de cualquier medio de
> prueba, incluida la prueba de testigos aun sobre obligaciones de más
> de dos unidades tributarias (`art. 1709` inc. 1°), porque lo que se
> prueba es la simulación, no la obligación misma. Entre las partes, en
> cambio, la prueba de testigos queda excluida (`art. 1709` inc. 2°) y
> rige las normas de la responsabilidad contractual. La jurisprudencia
> ha calificado la simulación ilícita como un verdadero **delito
> civil**, por lo que los terceros deben acreditarla conforme a las
> reglas de la prueba en materia delictual, no contractual.

### 3.8 Punto nuevo D.4.5: la acción de simulación

Esto no está ni en Boetsch ni en el manual: es contenido íntegro del
anexo Bozzo e Ibarra, y completa el punto 4 (hoy termina en las
consideraciones probatorias, sin decir nada sobre la acción misma).
Propuesta de punto nuevo, después de 4.4:

```html
<h3 id="cIV-D-4-5" style="text-decoration:none"><span class="num">4.5.&nbsp;&nbsp;&nbsp;&nbsp;</span><span class="tit">La acción de simulación</span></h3>

<p>Es una acción personal, declarativa, transmisible y prescriptible según las reglas generales. Entre las partes, el plazo de prescripción se cuenta desde que una de ellas pretende desconocer el acto real u oculto e investir de seriedad al simulado, porque solo desde ese momento existe interés en ejercerla. Los terceros solo pueden ejercerla si tienen un interés actual y de contenido patrimonial en que se declare la simulación (sin interés no hay acción), y el plazo corre desde que tuvieron conocimiento del acto disimulado; en todo caso, no puede entablarse una vez operada la prescripción adquisitiva de la cosa a favor de quien la adquirió con el contrato simulado.</p>

<p>La simulación puede dar lugar, además, a dos acciones independientes entre sí: la <strong>acción civil</strong>, para dejar sin efecto el contrato (declarando su nulidad o constatando su inexistencia) y obtener la indemnización de perjuicios; y la <strong>acción penal</strong>, contra quienes celebraron el contrato simulado con fraude en perjuicio de terceros.</p>
```

## 4. Verificación de artículos contra el Código Civil

Los 11 artículos citados en este tramo (10, 686, 1467, 1490, 1491,
1681, 1707, 1709, 1768, 1796, 1876) se verificaron íntegros contra
`Apuntes/Codigo Civil Chileno.pdf`. **Los 11 coinciden exactamente**
con el texto vigente citado en el manual y en las propuestas de este
informe. (Los artículos del Código Penal, del Código Tributario y de la
Ley N° 20.720 que cita Boetsch no se verifican contra el Código Civil
por definición; se toman por buenos tal como Boetsch los transcribe,
igual que en los tramos anteriores.)

## 5. Verificación jurisprudencial

El fallo con rol que trae el anexo Bozzo e Ibarra (Corte Suprema, 13 de
enero de 2014, rol N° 9.631-2012, Primera Sala Civil) se confirmó real
por búsqueda web: corresponde a un caso de nulidad absoluta de
compraventa por simulación relativa, con precio "vil e irrisorio",
acreditada por prueba de presunciones. Coincide con lo que dice el
anexo. Se propone en 3.4.

## 6. Pendiente para Laura

1. Aprobar 3.1 (formato, sin cambio de contenido).
2. Aprobar o descartar 3.2 (ampliación sobre reserva mental).
3. Decidir sobre 3.3 (dos añadidos opcionales y menores).
4. Aprobar 3.4 (conversión a lista + caja de jurisprudencia con el rol
   verificado).
5. Aprobar los dos ejemplos de reemplazo de 3.5 (u otros que Laura
   prefiera), y decidir si también se personifican los ejemplos de
   naturaleza y objeto.
6. Decidir sobre 3.6 (cuadro comparativo de efectos): sí, no, o en
   prosa en vez de tabla.
7. Aprobar 3.7 (cita de Ferrara + párrafo del art. 1709).
8. Aprobar 3.8 (punto nuevo 4.5, La acción de simulación).

Con la aprobación se reescribe IV.D con `Edit`, se verifica (balance de
etiquetas, cero guiones largos, frases clave del inventario presentes,
diff línea por línea de lo eliminado), se muestran capturas de Chrome
headless, y se sigue con el sub-tramo 4.3 (La inoponibilidad).
