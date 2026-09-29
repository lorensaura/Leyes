# Bienes: reestructuración a capítulos romanos

> Estado y plan específico del manual de Bienes (`05_Bienes_Manual.html`).
> No es plantilla: la regla general de capítulos romanos está en
> `formato.md`, sección 1.2. Detalle tramo por tramo de la reparación en
> `docs/incidente_compresion_manuales.md`.

## Estado (al 2026-09-29)

- **Estructura en capítulos romanos I a VII:** ejecutada. El antiguo Eje
  A se convirtió en **I. Aspectos generales** y **II. Clasificación de los
  bienes**; B (El dominio) pasó a ser **III**; C (La copropiedad), **IV**;
  los antiguos D a U, **V**; V, **VI**; Y, **VII** (numeración e ids en el
  commit `8331ff2`).
- **Revisión de contenido contra la fuente**, tramo por tramo:

  | Tramo | Estado |
  |---|---|
  | I a IV | Revisados |
  | V.1 Aspectos generales y V.2 La ocupación | Revisados el 2026-09-18 (commit `b642214`) |
  | V.3 La accesión | Revisado el 2026-09-18 (commit `e61a233`) |
  | V.4.A Descripción general | Revisado el 2026-09-28 (commit `4af761d`) |
  | V.4.B Requisitos | Revisado el 2026-09-28 (commit `49cb4bb`) |
  | V.4.C Efectos | Pendiente |
  | V.4.D Formas de efectuar la tradición | Pendiente |
  | V.5 La prescripción (A. La posesión, B. La prescripción adquisitiva) | Pendiente |
  | V.6 La sucesión por causa de muerte | Pendiente |
  | VI Los derechos reales limitados | Pendiente |
  | VII Las acciones protectoras | Pendiente |

- La reparación continúa tramo por tramo con el proceso vigente, sin el
  paso de voz propia (`proceso.md`, sección 2). La puesta al día con las
  reglas nuevas viene después, con `actualizar-manuales-existentes.md`.

## Cómo quedó V. Los modos de adquirir (antiguos D a U)

Laura pidió seguir la estructura real de Boetsch en vez de inventar una
propia (verificado el 2026-09-16 leyendo `BIENES_principal_5` a `_17`).
Así está hoy en el manual:

- **V.1 Aspectos generales** y **V.2 La ocupación:** ya separados (antes
  estaban fusionados en el título del Eje D).
- **V.3 La accesión:** antiguo Eje E.
- **V.4 La tradición:** antiguos Ejes F a I. Quedó distinto del plan
  original (que ponía muebles, inmuebles y herencia como letras B, C y
  D): las letras siguen el orden de Boetsch y las formas de tradición
  van juntas dentro de D.
  - **A. Descripción general** (Eje F, parte 1)
  - **B. Requisitos** (Eje F, parte 2)
  - **C. Efectos**
  - **D. Formas de efectuar la tradición**, con D.1 muebles, D.2
    inmuebles (el sistema registral), D.3 derecho real de herencia y D.4
    derechos personales.
- **V.5 La prescripción:** antiguos Ejes J a T, porque Boetsch incluye
  toda la Posesión como preámbulo de la Prescripción.
  - **A. La posesión** (Ejes J a P), con A.1 a A.7.
  - **B. La prescripción adquisitiva** (Ejes Q a T), con B.1 a B.4.
  - Decisión de Laura (2026-09-16): seguir a Boetsch tal cual, sin darle
    a la Posesión su propio número romano.
- **V.6 La sucesión por causa de muerte:** antiguo Eje U, con A. Ideas
  generales, B. Apertura de la sucesión y delación de las asignaciones, y
  C. El derecho de herencia.

## VI y VII

- **VI. Los derechos reales limitados** (antiguo Eje V): VI.1 propiedad
  fiduciaria, VI.2 usufructo, VI.3 uso y habitación, VI.4 servidumbres, y
  un excurso sobre el derecho real de conservación.
- **VII. Las acciones protectoras** (antiguo Eje Y): VII.1 formas de
  protección, VII.2 acción reivindicatoria, VII.3 acciones posesorias.
- Solo cambió la numeración: la revisión de contenido contra la fuente
  sigue pendiente.

## Diferencias con la escalera de `formato.md`

Listadas para que Laura decida. **No se renumera nada** sin su
aprobación; Bienes sigue su propia numeración mientras dure la
reparación.

1. **Nivel intermedio que la escalera no tiene.** Bienes usa `V.1.`,
   `II.1.`, `VI.2.` (romano con número) debajo del capítulo, como `h2`.
   En la escalera, lo que cuelga directo del capítulo es la letra
   (`A.`, tema). Por eso, dentro de V.4, V.5, V.6 y VII.3 las letras
   `A.`, `B.` quedan un nivel más abajo (`h3`) y sus subdivisiones
   `D.1`, `A.1` más abajo todavía (`h4`).
2. **Etiquetas distintas para el mismo nivel.** El punto `1.` es `h3` en
   I a IV y `h4` dentro de V.4; el subpunto `4.1.` es `h4`. En la
   escalera, el punto es `h2` y el subpunto `h3`.
3. **Encabezados sin número** (la escalera exige número en todo
   encabezado): por ejemplo "Títulos constitutivos de dominio" y
   "Teoría de la posesión inscrita" en V.5.A, y "Excurso: el derecho real
   de conservación" en VI.
4. **Títulos escritos en mayúscula en el HTML** (por ejemplo "II.1.
   BIENES CORPORALES E INCORPORALES"). La escalera pide escribirlos
   normal y dejar la mayúscula a la hoja de estilos.
5. **Niveles profundos como encabezados** (`h5`, `h6`, `div.h7`,
   `div.h8`) en vez de las enumeraciones `(i)`, `a)`, `a.1)`.
6. **`(i)` en cursiva** (desde el 2026-09-16). En la escalera es negrita
   si abre una clasificación, o subrayado si enumera requisitos o
   circunstancias.

Consecuencia práctica: la extensión CSS de `formato.md` (sección 8) no se
puede copiar a Bienes sin adaptar, porque le daría a cada etiqueta el
aspecto de otro nivel.
