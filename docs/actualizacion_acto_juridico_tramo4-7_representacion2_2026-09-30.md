# Acto Jurídico — Tramo 4, sub-tramo 4.7: La representación, V.6 a V.10 (requisitos a otras hipótesis)

> Informe de cambios propuestos. Sigue el método de
> `docs/manuales/actualizar-manuales-existentes.md`. No se ha tocado el
> manual todavía: este documento se detiene a la espera de la
> aprobación de Laura.

## 0. Alcance y fuentes

- Fuente principal: Boetsch `principal_16` (el mismo PDF de 4.5 y 4.6,
  "Otras causales de ineficacia" y "La representación", pp. 186 a 208
  de 221). Este tramo cubre **V.6 a V.10** (pp. 200-208 de 221), el
  final del PDF fragmentado y de todo el capítulo V. El capítulo VI
  (Modalidades de los actos jurídicos) empieza en otro PDF fragmentado
  (`principal_17`), fuera de este tramo.
- Anexo secundario: mismo resultado que en 4.6. Revisado completo por
  búsqueda de texto ya en esa sesión: solo tres menciones sueltas de
  "represent-", ninguna es una sección dedicada. No aporta contenido a
  este tramo tampoco.
- Manual actual: `04_Acto_Juridico_Manual.html`, líneas 3180-3220
  (`id="cV-6"` a `id="cV-10-2"`, justo antes de `id="cVI"`).
- **Nota sobre la base de esta rama:** se sigue trabajando en
  `worktree-acto-juridico-tramo4-5-otras-causales`, que ya trae los
  cambios de 4.2, 4.3, 4.4, 4.5 y 4.6, todavía sin mergear. El tramo
  V.6-V.10 no fue tocado por ninguno de esos seis tramos.

## 1. Qué se hizo para este informe

- Extracción completa de `principal_16` con `fitz`, páginas 200-208 (la
  200 solo para tomar el final de la p. 199 que ya se usó en 4.6, sin
  repetir el contenido de V.5.5).
- Lectura completa de V.6-V.10 actual del manual (líneas 3180-3220).
- Igual que V.1-V.5 en 4.6, **este tramo tampoco viene de una
  reescritura de esta sesión**: ya estaba en el formato nuevo, pero
  nunca auditado unidad por unidad contra Boetsch.
- Verificación artículo por artículo contra `Apuntes/Codigo Civil
  Chileno.pdf` de los 10 artículos nuevos citados en el tramo (1581,
  2290, 2160, 2173, 2131, 2122, 2154, 1449, 1450, 1694): **los 10
  coinciden exactamente**. Los demás artículos citados (43, 1448,
  2128, 2151) ya se habían verificado en el tramo 4.6.
- Chequeo mecánico corrido **sobre V.6-V.10 actual, antes** de proponer
  cambios: balance de etiquetas OK, cero guiones largos y guillemets;
  dos párrafos cerca del límite (1.155 y 1.123 caracteres, en V.8(ii) y
  V.9) que con los agregados de este informe pasarían de 1.200, así
  que se dividen.

## 2. Inventario unidad por unidad

| Unidad | Fuente | Manual actual | Estado |
|---|---|---|---|
| V.6.1 Declaración de voluntad del representante | Boetsch p. 200 | Presente la regla de capacidad en legal y convencional; falta la explicación de por qué importa la capacidad del representado en la convencional (la cita de "un autor" sobre la nulidad del mandato) | **Parcial** (3.1) |
| V.6.2 Contemplatio domini | Boetsch p. 201 | Presente, completo | **Está** |
| V.6.3 Existencia de poder y límites | Boetsch pp. 201-202 | Presente en sustancia; falta la explicación de por qué la agencia oficiosa es un caso de representación legal | **Parcial** (3.2) |
| V.7 Efectos de la representación | Boetsch p. 202 | Presente, completo | **Está** |
| V.8 (i) La inoponibilidad como sanción general | Boetsch pp. 202-203 | Presente, completo | **Está** |
| V.8 (ii) Responsabilidad del representante-mandatario que se extralimitó | Boetsch pp. 203-205 | Presente el núcleo frente al mandante; frente a los terceros, muy resumido: falta la distinción entre el mandatario que no informó sus poderes (responde) y el que sí los informó (nada se le reprocha), y la conexión con la promesa de hecho ajeno (art. 1450) | **Parcial** (3.3) |
| V.9 La ratificación | Boetsch pp. 205-206 | Presente casi todas las características (i)-(viii); faltan cuatro matices puntuales (capacidad sobrevenida del representado incapaz, segundo ejemplo de ratificación tácita, por qué puede ratificarse en cualquier momento, fundamento doctrinal de la irrevocabilidad) | **Parcial** (3.4) |
| V.10 Otras hipótesis en que los efectos alcanzan a terceros | Boetsch p. 207 | **Falta el párrafo introductorio completo**: el manual pasa del título directo a "10.1. Estipulación para otro" sin explicar el principio de la relatividad, por qué la representación no es técnicamente una excepción, ni presentar las dos hipótesis que siguen | **Falta** (3.5) |
| V.10.1 Estipulación para otro | Boetsch pp. 207-208 | Presente, completo; podría agregarse una caja `.ley` con el art. 1449 completo, que Boetsch cita textual | **Está** (mejora en 3.6) |
| V.10.2 Promesa de hecho ajeno | Boetsch p. 208 | Presente, completo; misma observación sobre el art. 1450 | **Está** (mejora en 3.6) |

**Conclusión del inventario:** este es el tramo con menos huecos de los
tres de "La representación": la mayoría de las unidades ya estaban
completas. La única falta real es el párrafo introductorio de V.10, que
no existe; el resto son matices de fondo puntuales (3.1, 3.2, 3.3, 3.4)
y una mejora de formato para acercar dos artículos citables a la
convención de cajas `.ley` (3.6).

## 3. Cambios propuestos

### 3.1 Completar V.6.1 con la razón de la capacidad del representado en la convencional

Boetsch explica, citando a un autor sin nombrar, por qué importa que
el representado sea capaz en la representación convencional: si es
incapaz, el mandato que otorgue es nulo, y anulado el mandato no hay
mandatario.

> Párrafo de V.6.1 se reemplaza por:

```html
<p>Es el representante quien contrata y declara su propia voluntad. En la <strong>representación legal</strong>, el representante debe ser capaz (de lo contrario sus actos son nulos) y no es necesario que el representado lo sea. En la <strong>convencional</strong>, se exige que el representado sea capaz tanto para el mandato como para el acto celebrado a su nombre: si el mandante es incapaz, no puede consentir, y el mandato que otorgue será nulo, absoluta o relativamente según su incapacidad; declarada esa nulidad, no habrá mandatario, y quien actuó como tal ejecuta actos que no comprometen al mandante. El Código admite, con todo, que el mandatario mismo sea un incapaz relativo, como el menor adulto (<span class="art">arts. 1581 y 2128</span>), porque el acto no compromete su propio patrimonio sino el del representado.</p>
```

### 3.2 Completar V.6.3 con la razón de por qué la agencia oficiosa es representación legal

> Párrafo de V.6.3 se reemplaza por:

```html
<p>El representante debe tener poder, legal o voluntario (<span class="art">art. 1448</span>), y obrar dentro de sus límites; si los excede, carece de poder y el acto es inoponible al representado. Hay, con todo, dos casos en que los efectos del acto se radican igualmente en otra persona pese a la falta o exceso de poder: la <strong>agencia oficiosa</strong>, cuando el interesado no ratifica pero el negocio le resultó útil, caso en que hay igualmente representación legal, porque es la ley la que le impone cumplir las obligaciones contraídas por el gerente en la gestión (<span class="art">art. 2290</span>); y la <strong>ratificación</strong> posterior del interesado, que equivale a un poder retroactivo. El poder de representación se extingue por revocación (acto unilateral del poderdante), por la muerte del representado o del representante, y por la incapacidad legal sobreviniente de este último.</p>
```

### 3.3 Dividir y completar V.8(ii) con la distinción frente a terceros

El párrafo actual (1.155 caracteres) ya está cerca del máximo. Se
divide en dos, siguiendo la propia estructura a)/b) de Boetsch, y se
completa la parte de terceros con la distinción entre el mandatario
que informó sus poderes limitados y el que no, más la conexión con la
promesa de hecho ajeno (art. 1450, que se trata en V.10.2 de este
mismo tramo).

> Párrafo actual de V.8(ii) se reemplaza por dos:

```html
<p>Frente al mandante, el mandatario extralimitado responde contractualmente por incumplir su deber de ceñirse a los términos del mandato (<span class="art">art. 2131</span>), en la medida que ese exceso le haya causado un perjuicio efectivo: si el mandante no resultó obligado frente a terceros, en principio no hay perjuicio que reclamar; pero puede haberlo aunque el mandante no quede obligado, como cuando el mandatario, además de extralimitarse, ni siquiera ejecutó el negocio encomendado (se le encargó vender un predio y lo hipotecó en su lugar). Si el mandante ratifica los contratos del mandatario, se entiende que renuncia a la acción de perjuicios en su contra, aunque esos contratos le resulten dañosos, porque asumió voluntariamente cumplirlos. Y la responsabilidad del mandatario cesa si se excedió del mandato por una necesidad imperiosa, caso en que pasa a actuar como agente oficioso (<span class="art">art. 2122</span>).</p>

<p>Frente a los terceros, en cambio, el mandatario en principio no responde (<span class="art">art. 2154</span>), salvo que concurra alguna de dos circunstancias: que no les haya dado suficiente conocimiento de sus poderes, o que se haya obligado personalmente ante ellos. En el primer caso, la falta de diligencia es imputable al mandatario, y responde extracontractualmente frente a los terceros que de buena fe creyeron que sus poderes eran más amplios de lo que en realidad eran; si, en cambio, dio a conocer debidamente sus poderes limitados, nada puede reprochársele: los terceros tuvieron ocasión de advertir la insuficiencia y asumieron el riesgo de que el mandante no ratificara. En el segundo caso, el mandatario asume voluntariamente la responsabilidad frente a los terceros si el mandante no ratifica lo actuado más allá de los límites del mandato, en un supuesto similar al de la promesa de hecho ajeno (<span class="art">art. 1450</span>), con la diferencia de que ahí no hay representación de por medio.</p>
```

### 3.4 Dividir y completar V.9 con cuatro matices de Boetsch

El primer párrafo actual (1.123 caracteres) también está cerca del
máximo. Se divide en dos, y se agregan los cuatro matices que Boetsch
trae en su lista (i)-(viii) y el manual había resumido de más.

> Primer párrafo de V.9 se reemplaza por dos (el segundo párrafo sobre
> solemnidades, que ya está completo, queda igual a continuación):

```html
<p>Cuando quien se dice representante no lo es, o el representante verdadero se extralimita, el representado no queda afectado por el contrato, salvo que voluntariamente lo apruebe: esa aprobación es la ratificación, distinta de la ratificación que sanea la nulidad relativa. Es un acto jurídico unilateral, procedente tanto en la representación legal como en la voluntaria (en esta última está expresamente prevista, a propósito del mandatario que actuó más allá de los límites del mandato, <span class="art">art. 2160</span>; en la legal, procede porque la ley no la prohíbe, y el representado incapaz podrá ratificar una vez que su incapacidad haya cesado). Puede ser expresa o tácita: esta última, cualquier hecho inequívoco del representado que manifieste su voluntad de aceptar lo obrado en su nombre, como exigir los derechos que el contrato le otorga o caucionar las obligaciones que le impone.</p>

<p>Es recepticia (produce efectos una vez conocida por representante y tercero), debe emanar del representado, sus herederos o representantes legales (con capacidad suficiente), y puede hacerse en cualquier momento, incluso después de la muerte de cualquiera de las partes o del propio representante, porque es independiente del contrato al que se refiere: este ya produjo sus efectos, aunque en suspenso, a la espera de que el representado los haga suyos. Es irrevocable una vez producida, porque los actos jurídicos unilaterales, salvo el testamento, no pueden dejarse sin efecto por la sola voluntad de su autor cuando ya generaron consecuencias en un patrimonio ajeno (la Corte Suprema ha resuelto que no cabe la revocación unilateral de la ratificación que ya produjo efectos respecto de terceros), y opera con efecto retroactivo a la fecha del contrato celebrado por el representante.</p>
```

### 3.5 Agregar el párrafo introductorio que falta en V.10

El manual pasa directo del título "10. Otras hipótesis..." a "10.1.
Estipulación para otro", sin el párrafo que Boetsch trae explicando el
principio de la relatividad de los contratos y por qué, en rigor, la
representación no es una excepción a ese principio (el representado es
parte, no tercero).

> Al inicio de V.10, antes de "10.1. Estipulación para otro", agregar:

```html
<p>Los actos jurídicos producen, por regla general, efectos solo para las partes: es el principio de la relatividad de los contratos. La representación es una excepción solo aparente, porque en ella el acto beneficia o perjudica a quien sustituyó su voluntad por la del representante, es decir, al representado, y este es jurídicamente parte del acto (se considera parte tanto a quien obra personalmente como a quien obra por medio de representante), no un tercero. Hay, sin embargo, otras hipótesis en que sí son afectados por el acto verdaderos terceros, relativos o absolutos: la estipulación para otro y la promesa de hecho ajeno.</p>
```

### 3.6 Agregar cajas `.ley` con los arts. 1449 y 1450 completos

Boetsch cita ambos artículos de forma textual y completa; hoy el
manual solo los parafrasea. Siguiendo la convención de `.ley` para
artículos completos (con la frase clave en negrita), propongo agregar
una caja en cada subpunto, sin quitar el párrafo ya existente.

> Al final del párrafo de V.10.1, agregar:

```html
<p class="ley"><span class="ley-num">Art. 1449.</span>"Cualquiera puede estipular a favor de una tercera persona, aunque no tenga derecho para representarla; pero <strong>sólo esta tercera persona podrá demandar lo estipulado</strong>; y mientras no intervenga su aceptación expresa o tácita, es revocable el contrato por la sola voluntad de las partes que concurrieron a él. Constituyen aceptación tácita los actos que sólo hubieran podido ejecutarse en virtud del contrato."</p>
```

> Al final del párrafo de V.10.2, agregar:

```html
<p class="ley"><span class="ley-num">Art. 1450.</span>"Siempre que uno de los contratantes se compromete a que por una tercera persona, de quien no es legítimo representante, ha de darse, hacerse o no hacerse alguna cosa, <strong>esta tercera persona no contraerá obligación alguna, sino en virtud de su ratificación</strong>; y si ella no ratifica, el otro contratante tendrá acción de perjuicios contra el que hizo la promesa."</p>
```

## 4. Verificación de artículos y jurisprudencia

Los 10 artículos nuevos citados en este tramo se verificaron íntegros
contra `Apuntes/Codigo Civil Chileno.pdf`: **los 10 coinciden
exactamente** (1581, 2290, 2160, 2173, 2131, 2122, 2154, 1449, 1450,
1694). No hay jurisprudencia nueva con rol en este tramo: la única cita
jurisprudencial (la de la Corte Suprema sobre irrevocabilidad de la
ratificación, en V.9) ya estaba en el manual, sin rol ni fecha en
Boetsch tampoco, y no se propone tocarla.

## 5. Pendiente para Laura

1. Aprobar 3.1 a 3.6 (o indicar cuáles no incorporar).
2. Este es el último sub-tramo de "La representación" (V completo).
   Con la aprobación, sigue el capítulo VI (Modalidades de los actos
   jurídicos), fuera de esta rama de trabajo, ver
   `docs/manuales/estado_acto-juridico.md`.

Con la aprobación se reescribe V.6-V.10 con `Edit`, se verifica (balance
de etiquetas, cero guiones largos, ningún párrafo sobre 1.200
caracteres, frases clave del inventario presentes, diff línea por
línea de lo eliminado), se muestran capturas de Chrome headless.
