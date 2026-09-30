# Acto Jurídico — Tramo 4, sub-tramo 4.3: La inoponibilidad (IV.E)

> Informe de cambios propuestos. Sigue el método de
> `docs/manuales/actualizar-manuales-existentes.md`. No se ha tocado el
> manual todavía: este documento se detiene a la espera de la
> aprobación de Laura.

## 0. Alcance y fuentes

- Fuente principal: Boetsch `principal_14` ("La inoponibilidad", pp. 170
  a 177 de 221; la p. 177 es donde empieza "F. El fraude a la ley",
  fuente del sub-tramo 4.4, y no se toca acá).
- Anexo secundario: `Anexo_secundario_AJ_Ineficacia.pdf` (Bozzo e
  Ibarra), apartado "g) La inoponibilidad" (pp. 17-19 del PDF del
  anexo). **Aporta contenido nuevo real**: la distinción de DUCCI entre
  efectos y realidad jurídica del acto, y las precisiones de VODANOVIC y
  LÓPEZ SANTA MARÍA sobre quiénes pueden alegarla, más un cuarto criterio
  de diferencia con la nulidad que Boetsch no trae.
- También se revisó la fila "INOPONIBILIDAD" de
  `INEFICACIA JURÍDICA_Cuadro comparativo.pdf` (Bozzo e Ibarra): no
  aporta nada que este tramo no tenga ya. Ese cuadro completo (con las
  demás causales: suspensión, resolución, resciliación, revocación,
  renuncia, retractación, caducidad, muerte) queda reservado para el
  sub-tramo 4.5 (Otras causales), donde sí hace falta.
- Manual actual: `04_Acto_Juridico_Manual.html`, líneas 2857-2905
  (`id="cIV-E"` a `id="cIV-E-5"`, justo antes de `id="cIV-F"`).
- **Nota sobre la base de esta rama:** se creó primero desde
  `origin/main`, que todavía no tiene el tramo 4.2 mergeado; se corrigió
  haciendo `git merge --ff-only` con `worktree-acto-juridico-tramo4-2-simulacion`
  antes de escribir este informe, porque IV.D (justo antes de IV.E) se
  reescribió por completo en 4.2 y trabajar sobre la versión vieja
  habría generado conflictos. Esta rama incluye entonces los cambios de
  4.2 además de los propios de 4.3. Laura puede mergear cualquiera de
  las dos primero; si mergea 4.2 primero, este tramo se aplica limpio
  encima.

## 1. Qué se hizo para este informe

- Extracción completa de `principal_14` con `fitz` (8 páginas).
- Lectura completa del `IV.E` actual del manual.
- Revisión completa del apartado "g) La inoponibilidad" del anexo Bozzo
  e Ibarra.
- Revisión de la fila "INOPONIBILIDAD" del cuadro comparativo general
  (ver nota en la sección 0).
- Revisión de `Memorice_ART y Definiciones.pdf`: solo trae la definición
  de Boetsch, ya reflejada en el manual (con el matiz de la sección 3.1
  abajo). Sin contenido nuevo.
- Verificación artículo por artículo contra `Apuntes/Codigo Civil
  Chileno.pdf` de los 24 artículos del Código Civil citados en el tramo
  (1707, 1902, 2513, 447, 246, 225, 1703, 1815, 1916, 2390, 1749, 1756,
  1757, 2079, 2160, 2154, 2468, 803, 94, 1216, 2058, 1490, 1491, 1432):
  **los 24 coinciden exactamente** con el texto vigente. Los arts. 127 y
  356 inc. 3° del Código de Comercio y el art. 419 del COT, que también
  cita Boetsch, quedan fuera del alcance de esta verificación (no están
  en el Código Civil); se toman tal como Boetsch los transcribe, igual
  que en los tramos anteriores.
- Chequeo mecánico (balance de etiquetas, guiones largos, párrafos de
  más de 1.200 caracteres) corrido **sobre el IV.E actual, antes** de
  proponer cambios, para distinguir lo que ya estaba mal de lo que se
  toca ahora: encontré un párrafo de **1.446 caracteres** en el punto
  2.1(i) (ver 3.2); el resto, sin problemas.

## 2. Inventario unidad por unidad

| Unidad | Fuente | Manual actual | Estado |
|---|---|---|---|
| E.1 Concepto | Boetsch p. 170 | Presente, pero con un matiz que contradice a la fuente (ver 3.1) | **Parcial** (3.1, 3.2) |
| E.1 Concepto (quiénes pueden alegarla) | Boetsch p. 170 + **anexo** | Presente el resultado (terceros relativos sí, absolutos no, salvo excepciones); falta la atribución a los autores que lo sostienen | **Parcial** (3.2) |
| E.2 Intro (forma/fondo) | Boetsch p. 171 | Presente, completo | **Está** |
| E.2.1(i) Publicidad: contraescrituras (art. 1707) | Boetsch pp. 171-172 | Presente el resultado, pero comprimido en un solo párrafo de 1.446 caracteres, con un paréntesis que nunca cierra bien y sin la frase "entre las partes la contraescritura es perfectamente válida" | **Parcial** (3.3) |
| E.2.1(i) Publicidad: casos b-f (cesión de crédito, prescripción, interdicción, patria potestad, cuidado personal) | Boetsch pp. 172-173 | Presentes, pero mezclados en el mismo párrafo de arriba | **Está** en el fondo, **falta reestructurar** (3.3) |
| E.2.1(ii) Falta de fecha cierta | Boetsch p. 173 | Presente el art. 1703 y el art. 419 COT; falta la mención al art. 127 del C. de Comercio | **Parcial** (3.4) |
| E.2.2(i)-(v) Inoponibilidades de fondo | Boetsch pp. 173-175 | Presentes y completas | **Está**; una imprecisión menor en (por asociación) el art. 2058 de la sección E.3 (3.6) |
| E.3 Nacidas de la nulidad o resolución | Boetsch p. 176 | Presente, completa | **Está**, precisar cita del art. 2058 (3.6) |
| E.4 Maneras de hacer valer | Boetsch p. 176 | Presente, completa | **Está** |
| E.5 Diferencias con la nulidad | Boetsch pp. 176-177 | Presente en prosa (3 diferencias de Boetsch); el anexo agrega una cuarta | **Parcial** (3.7) |

**Conclusión del inventario:** a diferencia de la lesión (4.1), pero
como la simulación (4.2), acá el anexo sí aporta contenido de fondo:
la distinción de Ducci y las atribuciones de autoría sobre quiénes
alegan la inoponibilidad (3.2), y un cuarto criterio de diferencia con
la nulidad (3.7). El problema principal, sin embargo, no es contenido
faltante sino de **forma**: el punto 2.1(i) comprime seis casos
distintos y un debate doctrinal en un solo párrafo desbalanceado en sus
paréntesis, que además omite una frase de la fuente.

## 3. Cambios propuestos

### 3.1 Corregir un error de contenido en E.1

El manual dice hoy: "esos terceros pueden oponerse a que les alcancen
los efectos, **favorables o desfavorables**, de ese acto o de su
ineficacia". Eso no es lo que dice Boetsch, que habla solo de "efectos
que los perjudican". Revisé también la fila del cuadro comparativo
general, que dice que la inoponibilidad "simplemente no afecta a
terceros el acto... sin embargo, sí puede aprovecharles": eso es
distinto de decir que el tercero puede oponerse a un efecto
*favorable*, que no tiene sentido (nadie se opone a lo que lo
beneficia). Propuesta: volver a la fórmula de la fuente.

> Antes: "...esos terceros pueden oponerse a que les alcancen los
> efectos, favorables o desfavorables, de ese acto o de su ineficacia."
>
> Después: "...esos terceros pueden oponerse a que los alcancen esos
> efectos, que los perjudican."

### 3.2 Enriquecer E.1 con DUCCI, VODANOVIC y LÓPEZ SANTA MARÍA (anexo)

El anexo agrega tres ideas que hoy no están:

1. La inoponibilidad "no implica un vicio del acto, no afecta su
   validez" (frase textual del anexo, útil para que quede explícito).
2. La distinción de **DUCCI** entre los *efectos* de un acto jurídico
   (los derechos y obligaciones que de él emanan, que solo obligan a
   las partes) y su *realidad jurídica* (que los terceros, en
   principio, no pueden desconocer).
3. La atribución de autoría de lo que el manual ya dice sobre terceros
   relativos y absolutos: **VODANOVIC** los llama "terceros
   interesados"; **LÓPEZ SANTA MARÍA** explica que los terceros
   absolutos excepcionalmente sí pueden invocarla, precisamente en los
   casos de venta, arrendamiento y prenda de cosa ajena que el manual
   ya cita más abajo (arts. 1815, 1916 inciso 2° y 2390).

Propuesta de reescritura completa del primer párrafo de E.1 (incorpora
también la corrección de 3.1):

```html
<p>La inoponibilidad es la sanción legal que consiste en el impedimento de hacer valer, frente a ciertos terceros, un derecho nacido de un acto jurídico válido, o de uno nulo, revocado o resuelto: esos terceros pueden oponerse a que los alcancen esos efectos, que los perjudican. No implica un vicio del acto ni afecta su validez: para explicarla, <strong>DUCCI</strong> distingue entre los efectos de un acto jurídico (los derechos y obligaciones que de él emanan, que solo obligan a las partes) y su realidad jurídica, que los terceros no pueden desconocer, salvo que en determinadas circunstancias la ley misma los autorice a alegar que el acto no les empece.</p>

<p>Quienes pueden alegarla son, por lo general, los <strong>terceros relativos</strong> (los que no pueden estimarse representantes de las partes, pero están o estarán en relaciones jurídicas con ellas; para <strong>VODANOVIC</strong>, los llamados terceros interesados), y no los <strong>terceros absolutos</strong>, completamente extraños al acto. Como advierte <strong>LÓPEZ SANTA MARÍA</strong>, hay excepciones puntuales en que también un tercero absoluto puede invocarla: así ocurre con el verdadero dueño en la venta, el arrendamiento o la prenda de cosa ajena, casos en que la inoponibilidad cede precisamente en su beneficio.</p>
```

(El segundo párrafo actual del punto, sobre que el Código no regula la
inoponibilidad de forma orgánica, sigue igual después de esto.)

### 3.3 Reestructurar 2.1(i): separar los seis casos y restaurar el razonamiento sobre la clandestinidad

El párrafo actual mide 1.446 caracteres y tiene un problema de
redacción: abre un paréntesis antes de "art. 1707 inciso 2°" que no se
cierra hasta 900 caracteres después, después de haber metido adentro
todo el debate sobre la clandestinidad. Además, omite una frase de
Boetsch: "Entre las partes la contraescritura es perfectamente válida,
pues la disposición transcrita sólo tiene por objeto proteger a los
terceros." Y comprime en la misma oración larga los seis casos (a-f del
original), cuando el resto del manual usa listas con letra subrayada
(`enum-a`) para este tipo de enumeración.

Propuesta de reescritura completa de 2.1(i), como lista de seis casos
más un párrafo aparte para el debate doctrinal:

```html
<p>Destinadas a que los terceros conozcan un acto o un hecho jurídicamente relevante. Casos:</p>

<span class="enum-a"><span class="num">a)&nbsp;&nbsp;&nbsp;&nbsp;</span><span class="tit">Contraescrituras</span></span>
<p>Las contraescrituras privadas hechas para alterar lo pactado en una escritura pública nunca producen efectos contra terceros, precisamente por ser privadas (<span class="art">art. 1707</span> inciso 1°). Las contraescrituras públicas, en cambio, solo son inoponibles a los terceros si no se ha tomado razón de su contenido al margen de la escritura matriz y del traslado en cuya virtud obró el tercero (<span class="art">art. 1707</span> inciso 2°). Entre las partes, la contraescritura es en todo caso perfectamente válida, porque la norma solo tiene por objeto proteger a los terceros.</p>

<p>Algunos autores clasifican el caso del inciso 1° como una <em>inoponibilidad por clandestinidad</em>, de fondo, por tratarse de un acto celebrado ocultamente que los terceros no pudieron conocer. Esa clasificación es discutible: exigiría acreditar un ánimo de ocultamiento o mala fe de los otorgantes que la norma no pide. En rigor, los dos incisos del <span class="art">art. 1707</span> regulan cuestiones estrictamente formales, propias del título que regula los instrumentos y su valor probatorio: (i) la contraescritura privada nunca produce efecto contra terceros, precisamente por ser privada; (ii) la contraescritura pública eventualmente puede producirlo si cumple esas formas de publicidad, precisamente por ser pública.</p>

<span class="enum-a"><span class="num">b)&nbsp;&nbsp;&nbsp;&nbsp;</span><span class="tit">Cesión de un crédito personal</span></span>
<p>No produce efecto contra el deudor ni contra terceros mientras no se notifica al deudor o este la acepta (<span class="art">art. 1902</span>).</p>

<span class="enum-a"><span class="num">c)&nbsp;&nbsp;&nbsp;&nbsp;</span><span class="tit">Sentencia que declara una prescripción</span></span>
<p>No vale contra terceros sin su competente inscripción (<span class="art">art. 2513</span>).</p>

<span class="enum-a"><span class="num">d)&nbsp;&nbsp;&nbsp;&nbsp;</span><span class="tit">Interdicción por disipación</span></span>
<p>No es oponible a terceros mientras la sentencia que la declara no se inscriba en el Registro de Interdicciones (<span class="art">art. 447</span>).</p>

<span class="enum-a"><span class="num">e)&nbsp;&nbsp;&nbsp;&nbsp;</span><span class="tit">Patria potestad</span></span>
<p>Mientras una subinscripción relativa a su ejercicio no sea cancelada por otra posterior, todo nuevo acuerdo o resolución es inoponible a terceros (<span class="art">art. 246</span>).</p>

<span class="enum-a"><span class="num">f)&nbsp;&nbsp;&nbsp;&nbsp;</span><span class="tit">Cuidado personal</span></span>
<p>La misma regla rige para los acuerdos o resoluciones sobre el cuidado personal de los hijos, mientras la nueva subinscripción no sea cancelada por otra posterior (<span class="art">art. 225</span> inciso final).</p>
```

Con esto, ningún párrafo supera los 1.200 caracteres y se recupera la
frase de Boetsch que faltaba.

### 3.4 Cajas `.ley` para los arts. 1707 y 246 (opcional)

Como el debate del caso a) gira enteramente sobre el texto exacto de
los dos incisos del art. 1707, y el art. 246 es, según la propia
Boetsch, una de las pocas normas que usa literalmente la palabra
"inoponible", propongo transcribirlos en cajas `.ley` (no hay ninguna
en el manual todavía para el art. 1707, pese a que se cita seis veces
en IV.D; esta sería la primera vez que se transcribe completo).

```html
<p class="ley"><span class="ley-num">Art. 1707.</span>"Las escrituras privadas hechas por los contratantes para alterar lo pactado en escritura pública, <strong>no producirán efecto contra terceros</strong>. Tampoco lo producirán las contraescrituras públicas, cuando no se ha tomado razón de su contenido al margen de la escritura matriz cuyas disposiciones se alteran en la contraescritura, y del traslado en cuya virtud ha obrado el tercero."</p>
```

```html
<p class="ley"><span class="ley-num">Art. 246.</span>"Mientras una subinscripción relativa al ejercicio de la patria potestad no sea cancelada por otra posterior, todo nuevo acuerdo o resolución será <strong>inoponible a terceros</strong>."</p>
```

Ubicación sugerida: la de 1707 después del primer párrafo del caso a)
(3.3); la de 246 después del caso e). Es opcional: el punto queda
completo sin ellas, pero ayudan a fijar el texto exacto que sostiene
todo el debate del caso a).

### 3.5 Ejemplo propio para la cesión de crédito (opcional)

El caso b) (cesión de un crédito, art. 1902) es abstracto y se presta
para un ejemplo corto, apoyado además en el art. 1905, que dice
expresamente qué puede hacer el deudor mientras no se le notifica.
Ningún ejemplo de Boetsch se reemplaza acá (la fuente no trae ninguno
para este caso): es una adición nueva, no una sustitución.

```html
<div class="ejemplo">
  <span class="caja-tipo">Ejemplo</span>
  <span class="caja-titulo">La deuda que Nicolás no sabía que había cambiado de dueño</span>
  <p>Bernarda le presta cien mil pesos a Nicolás. Meses después, sin decirle nada a Nicolás, Bernarda cede ese crédito a su hermano Tomás. Como la cesión nunca se le notificó a Nicolás ni este la aceptó, le es inoponible (<span class="art">art. 1902</span>): Nicolás sigue pudiendo pagarle válidamente a Bernarda, que incluso podría verse embargado el crédito por sus propios acreedores, como si la cesión nunca hubiera ocurrido (<span class="art">art. 1905</span>).</p>
</div>
```

### 3.6 Completar 2.1(ii) con el art. 127 del Código de Comercio

Boetsch cierra el punto de la fecha cierta con una precisión mercantil
que hoy no está en el manual: en asuntos mercantiles, las escrituras
privadas que guardan uniformidad con los libros de los comerciantes
hacen fe de su fecha respecto de terceros, aun fuera de los casos del
art. 1703 (C. de Comercio, art. 127; no verificable contra el Código
Civil, se toma de Boetsch). Propuesta: agregar una oración al final del
punto.

> Después de "...también desde su protocolización (art. 419 COT).":
> agregar "Tratándose de asuntos mercantiles, las escrituras privadas
> que guarden uniformidad con los libros de los comerciantes hacen fe
> de su fecha respecto de terceros, aun fuera de esos casos (C. de
> Comercio, art. 127)."

### 3.7 Precisar la cita del art. 2058 en E.3

El manual dice hoy: "la nulidad de una sociedad de hecho es inoponible
a los terceros de buena fe (art. 2058)". El artículo, verificado,
dice algo un poco distinto: la nulidad del *contrato* de sociedad no
perjudica las acciones de los terceros de buena fe contra *cada uno de
los socios*, cuando la sociedad existió de hecho. Propuesta de ajuste
menor:

> Antes: "...la nulidad de una sociedad de hecho es inoponible a los
> terceros de buena fe (art. 2058)..."
>
> Después: "...si la sociedad existió de hecho, la nulidad de su
> contrato no perjudica las acciones que tienen los terceros de buena
> fe contra cada uno de los socios (art. 2058)..."

### 3.8 Convertir E.5 (Diferencias con la nulidad) en cuadro comparativo

Boetsch da tres diferencias en prosa corrida. El anexo agrega una
cuarta que Boetsch no trae: la declaración de oficio. Con cuatro
criterios distintos, corresponde un cuadro comparativo (la regla es
tres o más). Fusioné las dos primeras diferencias de Boetsch (que en
el fondo son la misma idea mirada dos veces: a quién priva de eficacia
y a quién protege) en una sola fila para no ser redundante.

```html
<table>
<colgroup><col style="width:22%"><col style="width:39%"><col style="width:39%"></colgroup>
<tr><th>Criterio</th><th>Nulidad</th><th>Inoponibilidad</th></tr>
<tr><td>Origen de la causa</td><td>Un vicio o infracción presente en el momento del nacimiento del acto jurídico</td><td>El acto jurídico es válido; una circunstancia posterior o externa determina su ineficacia frente a terceros</td></tr>
<tr><td>Alcance de la ineficacia y a quién protege</td><td>Priva de eficacia al acto tanto respecto de las partes como de los terceros; protege a las partes del acto</td><td>Deja el acto eficaz entre las partes; solo priva de efectos a ciertos terceros de buena fe, a quienes protege</td></tr>
<tr><td>Orden público o privado</td><td>De orden público: no puede renunciarse anticipadamente</td><td>De orden privado, establecida a favor de los terceros: sí puede renunciarse</td></tr>
<tr><td>Declaración de oficio</td><td>La absoluta puede y debe declararla el juez de oficio si aparece de manifiesto en el acto o contrato (<span class="art">art. 1683</span>)</td><td>Nunca puede declararse de oficio: debe alegarla el interesado</td></tr>
</table>
```

### 3.9 Señalar una inconsistencia de Boetsch (no se resuelve sola)

El párrafo introductorio de la sección 2 de Boetsch (antes de dividir
en forma/fondo) enumera las inoponibilidades "de fondo" como
"concurrencia, clandestinidad, fraude, lesión de derechos adquiridos y
lesión de asignaciones forzosas", pero sus propias subsecciones tratan
la clandestinidad dentro de las de **forma** (caso a, ver 3.3) y en su
lugar agregan, entre las de fondo, la **falta de poder de
representación**, que la introducción no menciona. El manual actual no
reproduce esa enumeración introductoria (salta directo del párrafo
forma/fondo a "2.1 Inoponibilidades de forma"), así que hoy no arrastra
el error. No propongo agregar esa lista: si Laura quiere una oración
puente antes de 2.1, la versión correcta sería la que efectivamente
usan las subsecciones (concurrencia, falta de poder de representación,
fraude, lesión de derechos adquiridos, lesión de asignaciones
forzosas), no la de la introducción de Boetsch.

### 3.10 Conexiones (opcional)

El manual no tiene ninguna caja "Conexiones" en IV.E todavía. Dos
candidatas naturales, en el mismo formato que las de otras materias:

```html
<div class="conexiones">
  <span class="caja-tipo">Conexiones</span>
  <span class="caja-titulo">Cesión de un crédito personal</span>
  <p><strong>Obligaciones</strong> (<span class="art">arts. 1901 a 1908</span>): régimen completo de la cesión de créditos. Revisar apunte de Obligaciones, [FALTA: sección] (p. __).</p>
</div>
```

```html
<div class="conexiones">
  <span class="caja-tipo">Conexiones</span>
  <span class="caja-titulo">Lesión de las asignaciones forzosas</span>
  <p><strong>Sucesorio</strong> (<span class="art">art. 1216</span>): acción de reforma de testamento. Revisar apunte de Sucesorio, [FALTA: sección] (p. __).</p>
</div>
```

Como los apuntes de Obligaciones y Sucesorio todavía no existen (el
primero recién se está empezando, ver `docs/manuales/estado_obligaciones.md`),
quedarían con `[FALTA: sección]` hasta que existan, igual que las demás
cajas de Conexiones del manual.

## 4. Verificación de artículos y jurisprudencia

Los 24 artículos del Código Civil citados en este tramo se verificaron
íntegros contra `Apuntes/Codigo Civil Chileno.pdf` y **los 24 coinciden
exactamente** (ver la lista completa en la sección 1). No hay jurisprudencia
con rol en este tramo: Boetsch no cita ningún fallo en "La
inoponibilidad", así que no hay caja de jurisprudencia que agregar ni
`[FALTA: extracto del fallo]` que dejar pendiente.

## 5. Pendiente para Laura

1. Aprobar 3.1 (corrección: "favorables o desfavorables" no está en la
   fuente, se vuelve a "efectos que los perjudican").
2. Aprobar 3.2 (agregar DUCCI, VODANOVIC y LÓPEZ SANTA MARÍA).
3. Aprobar 3.3 (reestructurar el caso a-f en lista, sin cambiar el
   fondo, y restaurar la frase de Boetsch que faltaba).
4. Decidir sobre 3.4 (dos cajas `.ley`, opcional).
5. Decidir sobre 3.5 (ejemplo propio de la cesión de crédito, opcional).
6. Aprobar 3.6 (agregar la precisión mercantil del art. 127 C. Comercio).
7. Aprobar 3.7 (precisión menor en la cita del art. 2058).
8. Aprobar 3.8 (convertir Diferencias en cuadro comparativo de 4
   criterios).
9. Decidir sobre 3.9: no se propone ningún cambio, solo se deja
   registrada la inconsistencia de la fuente por si en algún momento se
   quiere agregar la oración puente.
10. Decidir sobre 3.10 (dos cajas de Conexiones hacia Obligaciones y
    Sucesorio, opcional, quedarían con `[FALTA: sección]`).

Con la aprobación se reescribe IV.E con `Edit`, se verifica (balance de
etiquetas, cero guiones largos, ningún párrafo sobre 1.200 caracteres,
frases clave del inventario presentes, diff línea por línea de lo
eliminado), se muestran capturas de Chrome headless, y se sigue con el
sub-tramo 4.4 (El fraude a la ley).
