# Acto Jurídico — Tramo 4, sub-tramo 4.4: El fraude a la ley (IV.F)

> Informe de cambios propuestos. Sigue el método de
> `docs/manuales/actualizar-manuales-existentes.md`. No se ha tocado el
> manual todavía: este documento se detiene a la espera de la
> aprobación de Laura.

## 0. Alcance y fuentes

- Fuente principal: Boetsch `principal_15` ("El fraude a la ley", pp.
  177 a 186 de 221; coincide exactamente con el "Página N de 221" de
  cada hoja del PDF, sin solape).
- Anexo secundario: `Anexo_secundario_AJ_Ineficacia.pdf` (Bozzo e
  Ibarra), apartado "El fraude a la ley" (pp. 25-26 del PDF del anexo,
  justo después de la simulación). **Aporta contenido nuevo real**: una
  cita de VIAL DEL RÍO (con FERRARA) que distingue fraude de
  simulación por "eludir" versus "esconder", y tres diferencias
  puntuales de VODANOVIC entre ambas figuras que Boetsch no enumera así.
- Manual actual: `04_Acto_Juridico_Manual.html`, líneas 2959-3011
  (`id="cIV-F"` a justo antes de `id="cIV-G"`).
- **Nota sobre la base de esta rama:** se creó desde
  `worktree-acto-juridico-tramo4-3-inoponibilidad` (no desde
  `origin/main`), porque esa rama trae ya los cambios de 4.2 y 4.3 sin
  mergear. IV.F no fue tocado en 4.2 ni 4.3, así que esta rama no
  arrastra ningún cambio de contenido de esos tramos en esta sección;
  solo evita conflictos de merge. Laura puede mergear 4.2, 4.3 y 4.4 en
  cualquier orden.

## 1. Qué se hizo para este informe

- Extracción completa de `principal_15` con `fitz` (10 páginas, pp.
  177-186 de Boetsch, confirmadas una por una contra el pie de página
  "Página N de 221").
- Lectura completa del `IV.F` actual del manual.
- Revisión completa del apartado "El fraude a la ley" del anexo Bozzo e
  Ibarra (pp. 25-26).
- Verificación artículo por artículo contra `Apuntes/Codigo Civil
  Chileno.pdf` de los 15 artículos del Código Civil citados en el
  tramo (10, 11, 219, 497, 539, 541, 555, 706, 803, 1467, 1578, 1662,
  1792-24, 2317, 2467, 2468): **los 15 coinciden exactamente** con el
  texto vigente. El art. 12 del Código Civil argentino, el art. 1344
  del Código italiano, el art. 83 de la Ley de Matrimonio Civil y el
  art. 4 ter del Código Tributario, que también cita Boetsch, quedan
  fuera del alcance de esta verificación (no están en el Código
  Civil chileno); se toman tal como Boetsch los transcribe, igual que
  en los tramos anteriores con normas de otros cuerpos legales.
- **Error de tipeo encontrado en la fuente y ya corregido en el
  manual**: en la p. 185, Boetsch escribe "otras derechamente declaran
  la nulidad del acto (v.gr. art. 1573 N° 3)". El art. 1573 no tiene
  nada que ver con esto (regula el pago sin conocimiento del deudor).
  El artículo correcto es el **1578 N° 3** ("si se paga al deudor
  insolvente en fraude de los acreedores a cuyo favor se ha abierto
  concurso"), que el propio Boetsch cita bien dos páginas antes (p.
  179) y que el manual ya usa correctamente. No hace falta ningún
  cambio: se deja constancia para que quede registrado por qué el
  manual no coincide literalmente con esa frase puntual de la fuente.
- Chequeo mecánico (balance de etiquetas, guiones largos, párrafos de
  más de 1.200 caracteres) corrido **sobre el IV.F actual, antes** de
  proponer cambios: balance de etiquetas OK, cero guiones largos y
  guillemets, pero **dos párrafos superan los 1.200 caracteres** (uno
  de 1.900 en la sección 2, otro de 2.438 en la 4.2); el resto, sin
  problemas.

## 2. Inventario unidad por unidad

| Unidad | Fuente | Manual actual | Estado |
|---|---|---|---|
| F.1 Concepto | Boetsch pp. 177-178 | Presente y completo (casos clásicos, COVIELLO, LARENZ, VIAL, ALCALDE) | **Está** |
| F.2 Ordenamiento jurídico nacional | Boetsch pp. 178-180 | Presente; falta completar la lista de artículos (1662 y 1792-24, que Boetsch sí enumera junto a los demás) y el párrafo mide 1.900 caracteres | **Parcial** (3.1) |
| F.3 Requisitos | Boetsch pp. 180-181 | Presente y completo (i)-(iii) | **Está** |
| F.4.1 Fraude a la ley y simulación | Boetsch pp. 181-182 + **anexo** | Presente el contenido de Boetsch; falta la cita de VIAL/FERRARA y las tres diferencias de VODANOVIC del anexo | **Parcial** (3.3) |
| F.4.2 Fraude a la ley y abuso del derecho | Boetsch pp. 182-184 | Presente y completo, pero el párrafo mide 2.438 caracteres | **Parcial** (3.2) |
| F.5 Sanción al fraude a la ley | Boetsch pp. 184-186 | Presente y completo (las dos posturas, el análisis propio de Boetsch en a/b/c) | **Está** |

**Conclusión del inventario:** a diferencia de los sub-tramos
anteriores (lesión, simulación, inoponibilidad), acá **no falta
contenido de fondo de Boetsch**: la sección ya refleja fielmente las
seis unidades de la fuente, con buena redacción propia. El anexo sí
aporta algo puntual y valioso en 4.1 (contenido nuevo, no solo
redacción distinta). El problema principal es de **forma**: dos
párrafos superan el máximo de 1.200 caracteres.

## 3. Cambios propuestos

### 3.1 Dividir el párrafo de F.2 y completar la lista de artículos

El párrafo mide 1.900 caracteres. Se divide en tres, en un punto de
quiebre natural (después de la justificación moral de DOMÍNGUEZ, y
otra vez a mitad de la enumeración de artículos). De paso se agregan
los **arts. 1662 y 1792-24**, que Boetsch enumera junto a los demás en
su lista (i)-(x) pero que hoy faltan en la lista del manual (aunque
aparecen más abajo, en la sección 5, no estaban acá donde Boetsch los
pone por primera vez).

```html
<p>A diferencia de códigos más modernos (como el argentino de 2014, cuyo <span class="art">art. 12</span> lo regula expresamente), el nuestro no contempla un reconocimiento general del fraude a la ley. Sin perjuicio de ello, no hay controversia en que el Código de BELLO se inspira en el principio <strong><em>fraus omnia corrumpit</em></strong> (el fraude todo lo corrompe). Como expresa DOMÍNGUEZ, a esa conclusión se puede llegar tanto desde la moral como desde el texto positivo de la ley: desde el iusnaturalismo, el valor de un acto es inseparable de su fin desde el instante en que este se establece, si es ilícito. Un fin lícito no legitima un acto ilícito, el fin no justifica los medios; pero un fin ilícito vicia el acto intrínsecamente lícito, y nadie puede aprovecharse de la bondad propia de un acto para usarlo con un fin diverso al que le es propio.</p>

<p>Ya el <strong>Mensaje</strong> del propio Código alude, en su primer párrafo, a <em>los abusos que introduce la mala fe, fecunda en arbitrios para eludir precauciones legales</em>. Desde el texto positivo, el principio aparece de forma constante en normas puntuales: el <span class="art">art. 11</span>, que manda aplicar la ley aunque se alegue ausencia de fraude en el caso concreto; el <span class="art">art. 219</span>, sobre el fraude de falso parto; el <span class="art">art. 497 Nº 12</span>, que inhabilita para ser guardador a quien por fraude fue condenado a indemnizar a su pupilo; el <span class="art">art. 539 Nº 2</span>, que establece como causal de remoción del guardador el fraude en el ejercicio de su cargo, reiterada en el <span class="art">art. 541</span>.</p>

<p>El <span class="art">art. 555</span>, a propósito de las asociaciones, alude al <em>delito de fraude</em>; el <span class="art">art. 706</span> exige para la posesión de buena fe la convicción de haber adquirido el dominio por medios exentos de fraude; el <span class="art">art. 803</span> sanciona la renuncia fraudulenta del usufructo; el <span class="art">art. 1578 Nº 3</span> anula el pago hecho al deudor insolvente en fraude de sus acreedores; el <span class="art">art. 1662</span> excluye la compensación frente a la indemnización por un acto de fraude; el <span class="art">art. 1792-24</span> permite perseguir los bienes enajenados en fraude de los derechos del cónyuge acreedor en la participación en los gananciales; y el <span class="art">art. 2317</span> hace solidaria la responsabilidad de quienes cometen un fraude en conjunto.</p>
```

### 3.2 Dividir el párrafo de F.4.2 (abuso del derecho)

El párrafo mide 2.438 caracteres. Se divide en tres, sin cambiar una
sola palabra: (a) el fundamento en la buena fe (FERREIRA, DIEZ-PICAZO,
BARROS), (b) el catálogo de conductas y el abuso de formas jurídicas,
(c) la relación entre fraude a la ley y abuso del derecho.

```html
<p>El abuso del derecho es una manifestación del principio de la buena fe como límite al ejercicio de los derechos subjetivos: quien lo traspasa obra de modo abusivo e ilícito. FERREIRA explica que la buena fe indica un límite, algo que no debe sobrepasarse sin provocar consecuencias negativas, representado por el respeto a los demás y el cumplimiento de las normas que la buena fe impone; DIEZ-PICAZO agrega que el ejercicio de un derecho subjetivo es contrario a la buena fe no solo cuando no se utiliza para la finalidad objetiva o función económica o social para la cual fue atribuido a su titular, sino también cuando se ejercita de una manera o en unas circunstancias que lo hacen desleal según las reglas que la conciencia social impone en el tráfico jurídico; y BARROS, en Chile, la resume como aquel núcleo de sentido que subyace a las normas atributivas de derechos, mostrándose en los límites que la norma no expresa pero da por supuestos.</p>

<p>Existe un amplio catálogo de conductas que la doctrina califica como abuso del derecho: el ejercicio de un derecho con el solo propósito de causar daño, la desproporción extrema entre el interés del titular y el efecto negativo que produce en otro, la conducta contraria a los actos propios, el ejercicio de un derecho adquirido de mala fe, y la desviación del fin de un derecho potestativo. Se exige siempre, según la doctrina mayoritaria, algún elemento subjetivo (dolo o culpa). Una variante suya, de especial relevancia tributaria, es el <em>abuso de formas jurídicas</em>, hoy reconocido en el <span class="art">art. 4 ter del Código Tributario</span>.</p>

<p>La doctrina discute si fraude a la ley y abuso del derecho son figuras similares, si están en relación de género a especie, o si son institutos distintos. El abuso del derecho, en sus hipótesis ordinarias, consiste en el ejercicio indebido de un derecho subjetivo concreto que perjudica a quien debe soportarlo; en el abuso de formas jurídicas, en cambio, al igual que en el fraude a la ley, lo que se abusa no es un derecho subjetivo frente a otra persona determinada, sino algo más genérico, la autonomía privada misma. En esa línea, BARROS los acerca al señalar que existe <em>abuso de la autonomía privada</em> cuando, para evitar la aplicación de una norma de orden público, se realizan actos formalmente lícitos que conducen al efecto económico que la ley pretendía impedir, siendo el fraude a la ley un tipo de esa desviación del fin en el ejercicio de una potestad.</p>
```

### 3.3 Enriquecer F.4.1 con VIAL/FERRARA y las tres diferencias de VODANOVIC (anexo)

Después del párrafo actual de F.4.1 (que termina con el matiz de
ALCALDE), agregar:

```html
<p>En este sentido, <strong>VIAL DEL RÍO</strong> destaca, siguiendo a FERRARA, que con el acto en fraude a la ley se pretende eludir un precepto legal, mientras que con la simulación se pretende esconder u ocultar la violación de un precepto legal. <strong>VODANOVIC</strong>, por su parte, resume tres diferencias entre ambas figuras:</p>

<p><span class="enum-i-run lista" style="text-decoration:none"><span class="num">(i)&nbsp;&nbsp;&nbsp;&nbsp;</span><span class="tit">Realidad del acto</span></span>: el acto simulado produce solo una apariencia de contrato; el acto en fraude a la ley es real y efectivamente querido.</p>

<p><span class="enum-i-run lista" style="text-decoration:none"><span class="num">(ii)&nbsp;&nbsp;&nbsp;&nbsp;</span><span class="tit">Forma de la infracción</span></span>: el acto simulado, cuando es ilícito, viola la ley directamente; el fraudulento solo la viola de forma indirecta, respetando su letra pero contrariando su espíritu.</p>

<p><span class="enum-i-run lista" style="text-decoration:none"><span class="num">(iii)&nbsp;&nbsp;&nbsp;&nbsp;</span><span class="tit">Licitud</span></span>: la simulación puede ser lícita o ilícita; el fraude a la ley es siempre ilícito.</p>
```

El ejemplo de VODANOVIC sobre la compraventa entre cónyuges (<span
class="art">art. 1796</span>) que ya está en el manual, como caja
Ejemplo en F.2, es del mismo pasaje del anexo: queda donde está, no se
mueve.

### 3.4 Caja `.definicion` para el Concepto (opcional)

F.1 no tiene ninguna caja `.definicion` todavía, aunque el resto del
manual sí aísla una definición por punto. La cita de ALCALDE, la más
reciente y sintética de las cuatro que trae el párrafo actual, es la
candidata natural.

> Párrafo actual (termina así): "...ALCALDE, más recientemente, lo
> resume así: el acto o conducta fraudulenta tiene la apariencia de la
> licitud, aunque sus resultados sean, en definitiva, antijurídicos, y
> constituye una infracción encubierta, pero infracción al fin y al
> cabo, del ordenamiento."

Se reemplaza por:

```html
<p>Para <strong>COVIELLO</strong>, el acto es contrario a la ley cuando la voluntad del particular se enfrenta directa y abiertamente con ella, y está en fraude de la ley cuando, respetándola aparentemente, la viola en su espíritu aunque respete su letra. Para <strong>LARENZ</strong>, hay negocio en fraude cuando las partes buscan la finalidad de un negocio prohibido valiéndose de otro que no lo está. En Chile, <strong>VIAL</strong> lo describe como procedimientos en sí lícitos, o maniobras jurídicas con apariencia de legalidad, que permiten realizar lo que la ley prohíbe o dejar de hacer lo que ordena.</p>

<p class="definicion">Para <strong>ALCALDE</strong>, "el acto o conducta fraudulenta tiene la apariencia de la licitud, aunque sus resultados sean, en definitiva, antijurídicos, y constituye una infracción encubierta, pero infracción al fin y al cabo, del ordenamiento".</p>
```

### 3.5 Ejemplo propio para el requisito (ii) (opcional)

El requisito (ii) de F.3 cita, como ejemplos doctrinales abstractos,
"la separación de bienes y liquidación de la sociedad conyugal como
forma de evadir el derecho de prenda general de los acreedores" y "la
constitución de sociedades para realizar actividades que a sus socios
no les sería lícito ejecutar". Ningún ejemplo de Boetsch se reemplaza
acá (la fuente no narra ninguno, solo los menciona en abstracto): es
una adición nueva.

```html
<div class="ejemplo">
  <span class="caja-tipo">Ejemplo</span>
  <span class="caja-titulo">La separación de bienes que llegó justo a tiempo</span>
  <p>El Gastón sabe que su empresa está a punto de quebrar. Para que sus acreedores no alcancen los bienes de la sociedad conyugal, se separa de bienes de común acuerdo con su mujer, la Antonia, y le transfiere de inmediato a ella el departamento y el auto. Cada acto, mirado aisladamente, es perfectamente lícito: la separación de bienes y la transferencia son actos permitidos. Pero la combinación persigue exactamente el resultado que la ley prohíbe: sustraer esos bienes del derecho de prenda general de sus acreedores.</p>
</div>
```

Ubicación sugerida: después del párrafo del requisito (ii) en F.3.

### 3.6 Conexión hacia Obligaciones: la acción pauliana (opcional)

El manual no tiene ninguna caja "Conexiones" en IV.F todavía. F.5 cita
ya el <span class="art">art. 2468</span>, que consagra la acción
pauliana, como fundamento de la sanción de inoponibilidad para el
fraude a los acreedores previo a la apertura de un concurso.

```html
<div class="conexiones">
  <span class="caja-tipo">Conexiones</span>
  <span class="caja-titulo">La acción pauliana o revocatoria</span>
  <p><strong>Obligaciones</strong> (<span class="art">art. 2468</span> y ss.): el fraude a los acreedores como fundamento de la acción pauliana. Revisar apunte de Obligaciones, [FALTA: sección] (p. __).</p>
</div>
```

Ubicación sugerida: al final de F.5, después del último párrafo.

## 4. Verificación de artículos y jurisprudencia

Los 15 artículos del Código Civil citados en este tramo se verificaron
íntegros contra `Apuntes/Codigo Civil Chileno.pdf` y **los 15
coinciden exactamente** (10, 11, 219, 497, 539, 541, 555, 706, 803,
1467, 1578, 1662, 1792-24, 2317, 2467, 2468; lista completa en la
sección 1, incluido el error de tipeo de la fuente ya corregido en el
manual). No hay jurisprudencia con rol en este tramo: Boetsch no cita
ningún fallo con rol en "El fraude a la ley" (solo menciona, sin rol,
que "la Corte Suprema así lo ha entendido" respecto del ejemplo de
VODANOVIC), así que no hay caja de jurisprudencia que agregar ni
`[FALTA: extracto del fallo]` que dejar pendiente.

## 5. Pendiente para Laura

1. Aprobar 3.1 (dividir el párrafo de F.2 en tres y completar la lista
   con los arts. 1662 y 1792-24).
2. Aprobar 3.2 (dividir el párrafo de F.4.2 en tres, sin cambiar el
   contenido).
3. Aprobar 3.3 (agregar VIAL/FERRARA y las tres diferencias de
   VODANOVIC, del anexo).
4. Decidir sobre 3.4 (caja `.definicion` con ALCALDE, opcional).
5. Decidir sobre 3.5 (ejemplo propio de la separación de bienes en
   fraude a los acreedores, opcional).
6. Decidir sobre 3.6 (caja de Conexiones hacia Obligaciones, opcional,
   quedaría con `[FALTA: sección]`).

Con la aprobación se reescribe IV.F con `Edit`, se verifica (balance
de etiquetas, cero guiones largos, ningún párrafo sobre 1.200
caracteres, frases clave del inventario presentes, diff línea por
línea de lo eliminado), se muestran capturas de Chrome headless, y se
sigue con el sub-tramo 4.5 (Otras causales, G.1-G.9).
