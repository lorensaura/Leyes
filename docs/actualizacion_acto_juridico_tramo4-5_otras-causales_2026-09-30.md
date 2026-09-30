# Acto Jurídico — Tramo 4, sub-tramo 4.5: Otras causales de ineficacia (IV.G)

> Informe de cambios propuestos. Sigue el método de
> `docs/manuales/actualizar-manuales-existentes.md`. No se ha tocado el
> manual todavía: este documento se detiene a la espera de la
> aprobación de Laura.

## 0. Alcance y fuentes

- Fuente principal: Boetsch `principal_16` ("Otras causales de
  ineficacia" y "La representación", pp. 186 a 208 de 221). **Solo
  cubre G.1 a G.6** (pp. 186-189): la suspensión, la resolución, la
  resciliación, la revocación, el desistimiento unilateral y la
  caducidad. En la p. 190 empieza "V. La representación", fuente del
  sub-tramo 4.6, que no se toca acá.
- Anexo: `INEFICACIA JURÍDICA_Cuadro comparativo.pdf` (Bozzo e Ibarra),
  las 3 páginas completas. Es un cuadro con columnas Concepto / Efecto
  respecto de partes / Efecto respecto de terceros para: inexistencia,
  nulidad absoluta, nulidad relativa, resciliación, resolución,
  **terminación**, inoponibilidad, revocación, **renuncia**,
  retractación, suspensión, caducidad, **muerte**. Las tres en negrita
  (terminación, renuncia, muerte) son **G.7, G.8 y G.9 del manual, y
  Boetsch no trae ninguna de las tres**: el anexo es su única fuente,
  ya confirmado en una sesión anterior (ver
  `docs/manuales/estado_acto-juridico.md`). Para G.1-G.6, el anexo
  coincide en sustancia con Boetsch, pero agrega el efecto frente a
  terceros con más precisión en dos casos (ver 3.1 y 3.2).
- Manual actual: `04_Acto_Juridico_Manual.html`, líneas 3042-3080
  (`id="cIV-G"` a `id="cIV-G-9"`, justo antes de `id="cV"`, La
  representación).
- **Nota sobre la base de esta rama:** se creó desde
  `worktree-acto-juridico-tramo4-4-fraude`, que trae ya los cambios de
  4.2, 4.3 y 4.4 sin mergear. IV.G no fue tocado por ninguno de esos
  tres tramos.

## 1. Qué se hizo para este informe

- Extracción completa de `principal_16` con `fitz`, páginas 186-190 (la
  190 solo para confirmar dónde termina G y empieza "V. La
  representación").
- Lectura completa del `IV.G` actual del manual.
- Lectura completa de las 3 páginas del cuadro comparativo del anexo.
- Verificación artículo por artículo contra `Apuntes/Codigo Civil
  Chileno.pdf` de los 9 artículos citados en el tramo (1716, 1489,
  1567, 2163, 1212, 1053, 1143, 1490, 1491): **los 9 coinciden
  exactamente**. El art. 2163 (causales de término del mandato) se usa
  tres veces (G.4, G.8, G.9) porque en un solo artículo el Código
  agrupa la revocación, la renuncia y la muerte como causales de
  término del mandato: verificado que es así, no es un error.
- Chequeo mecánico (balance de etiquetas, guiones largos, párrafos de
  más de 1.200 caracteres) corrido **sobre el IV.G actual, antes** de
  proponer cambios: **sin problemas de ningún tipo**. A diferencia de
  los tramos anteriores, este ya estaba impecable en la forma.

## 2. Inventario unidad por unidad

| Unidad | Fuente | Manual actual | Estado |
|---|---|---|---|
| G (intro) | Boetsch p. 186 | Presente, fiel | **Está** |
| G.1 La suspensión | Boetsch p. 187 | Presente, completo | **Está** |
| G.2 La resolución | Boetsch pp. 187-188 | Presente el concepto; falta el efecto frente a terceros que agrega el anexo (arts. 1490 y 1491) | **Parcial** (3.1) |
| G.3 La resciliación | Boetsch p. 188 | Presente, completo | **Está** |
| G.4 La revocación | Boetsch p. 188 | Presente, completo | **Está**; el anexo agrega ejemplos que se decide no incorporar (ver 3.4) |
| G.5 El desistimiento unilateral | Boetsch pp. 188-189 | Presente, completo | **Está** |
| G.6 La caducidad | Boetsch p. 189 | Presente, completo | **Está** |
| G.7 La terminación | **Solo anexo** (Boetsch no la trata) | Presente el concepto; falta el efecto frente a terceros del anexo | **Parcial** (3.2) |
| G.8 La renuncia | **Solo anexo** (Boetsch no la trata) | Presente el concepto y el efecto entre partes; falta el efecto frente a terceros del anexo | **Parcial** (3.2) |
| G.9 La muerte | **Solo anexo** (Boetsch no la trata) | Presente el concepto con ejemplos (mandato, sociedad, comodato); faltan el matrimonio como ejemplo, la sanción a la mala fe frente a los herederos, y la distinción muerte natural/presunta frente a terceros | **Parcial** (3.3) |

**Conclusión del inventario:** este tramo llegó en mejor estado que los
anteriores: mecánicamente perfecto y, para G.1-G.6, fiel a Boetsch. Lo
que falta es puntual y viene todo del mismo anexo: completar el efecto
frente a terceros en tres unidades (G.2, G.7, G.8) y enriquecer G.9 con
tres datos concretos que hoy no están.

## 3. Cambios propuestos

### 3.1 Completar G.2 (La resolución) con el efecto frente a terceros

El anexo agrega, para la resolución, lo que ocurre con los terceros
que adquirieron la cosa antes de que esta operara: distingue muebles
de inmuebles, con arts. 1490 y 1491 (ya verificados). Es contenido
concreto y de examen (la falta de acción reivindicatoria contra el
tercero de buena fe), que hoy no está en el manual.

> Al final del párrafo de G.2, agregar: "Declarada la resolución, no
> procede la acción reivindicatoria contra terceros poseedores de
> buena fe si la cosa era mueble (<span class="art">art. 1490</span>);
> tratándose de inmuebles, la resolución solo afecta al tercero si la
> condición constaba en el título respectivo, inscrito u otorgado por
> escritura pública (<span class="art">art. 1491</span>)."

### 3.2 Completar G.7 (Terminación) y G.8 (Renuncia) con el efecto frente a terceros

El anexo es la única fuente de estas dos unidades. Agrega en ambos
casos, con la misma lógica, el momento desde el cual la causal es
oponible a los terceros.

> Al final del párrafo de G.7, agregar: "Cumplidos los requisitos que
> la ley exige en cada caso, la terminación es plenamente oponible a
> los terceros."

> Al final del párrafo de G.8, agregar: "Frente a terceros, la
> renuncia es oponible desde el mismo momento en que lo es respecto de
> la contraparte."

### 3.3 Enriquecer G.9 (La muerte) con tres datos del anexo

El anexo agrega tres cosas que hoy no están: el matrimonio como
ejemplo adicional de acto <em>intuito personae</em>, la sanción a la
mala fe de quien perjudica a los herederos de la parte fallecida, y la
distinción entre muerte natural y muerte presunta para fijar el
momento en que la causal afecta a los terceros.

> Párrafo actual: "La muerte de una de las partes puede volver
> ineficaces los actos y contratos celebrados en consideración a su
> persona (intuito personae), como el mandato, que expira por la
> muerte del mandante o del mandatario (art. 2163), la sociedad, que
> se disuelve por la muerte de cualquiera de los socios salvo pacto en
> contrario, o el comodato, cuando se prestó en atención a la persona
> del comodatario."

Se reemplaza por:

```html
<p>La muerte de una de las partes puede volver ineficaces los actos y contratos celebrados en consideración a su persona (<em>intuito personae</em>), como el mandato, que expira por la muerte del mandante o del mandatario (<span class="art">art. 2163</span>), la sociedad, que se disuelve por la muerte de cualquiera de los socios salvo pacto en contrario, el comodato, cuando se prestó en atención a la persona del comodatario, o el matrimonio. Sus efectos no son retroactivos, y sancionan siempre la mala fe de quien cause perjuicios a los herederos de la parte fallecida. Frente a terceros, la ineficacia produce sus efectos desde que se cumplen los requisitos que la ley exige según la muerte haya sido natural o presunta.</p>
```

### 3.4 Ejemplos adicionales de revocación del anexo: no se incorporan

El anexo, en la fila REVOCACIÓN, agrega como ejemplos "la donación, el
fraude pauliano, mandato, testamento, emancipación", más que los que
trae Boetsch (testamento, mandato). No propongo agregar "el fraude
pauliano" como ejemplo de revocación: en el tramo 4.4 (El fraude a la
ley), siguiendo a Boetsch, la sanción al fraude a los acreedores
(acción pauliana, art. 2468) se explicó como **inoponibilidad** (o
nulidad, si ya hay concurso abierto), no como revocación. Llamarla acá
"revocación" contradiría lo ya escrito en 4.4. Queda señalada la
inconsistencia entre el anexo y Boetsch/el manual, sin resolverla: si
Laura quiere agregar "la donación" y "la emancipación" como ejemplos
adicionales de revocación (que no generan ese conflicto), se puede
hacer aparte.

## 4. Verificación de artículos y jurisprudencia

Los 9 artículos del Código Civil citados en este tramo se verificaron
íntegros contra `Apuntes/Codigo Civil Chileno.pdf` y **los 9 coinciden
exactamente** (1716, 1489, 1567, 2163, 1212, 1053, 1143, 1490, 1491).
No hay jurisprudencia con rol en este tramo: ni Boetsch ni el anexo
citan fallos en esta sección.

## 5. Pendiente para Laura

1. Aprobar 3.1 (completar G.2 con la reivindicación contra terceros,
   arts. 1490 y 1491).
2. Aprobar 3.2 (completar G.7 y G.8 con el efecto frente a terceros).
3. Aprobar 3.3 (enriquecer G.9 con el matrimonio, la sanción a la mala
   fe y la distinción muerte natural/presunta).
4. Decidir sobre 3.4: no se propone ningún cambio, solo se deja
   registrada la inconsistencia entre el anexo y Boetsch sobre si el
   fraude pauliano es un caso de revocación.

Con la aprobación se reescribe IV.G con `Edit`, se verifica (balance
de etiquetas, cero guiones largos, ningún párrafo sobre 1.200
caracteres, frases clave del inventario presentes, diff línea por
línea de lo eliminado), se muestran capturas de Chrome headless, y se
sigue con el sub-tramo 4.6 (V.1-V.5, La representación: concepto a
influencia de circunstancias personales).
