# Handoff: reparación de compresión del manual de Acto Jurídico

> Con solo leer este archivo se puede retomar el trabajo sin releer el resto
> de la conversación. Está pensado para abrirse al inicio de una sesión
> nueva.

## Qué es este trabajo y por qué existe

`04_Acto_Juridico_Manual.html` se generó originalmente comprimido a ~49%
de fidelidad respecto de su fuente (el libro de Cristián Boetsch Gillet,
"Teoría del Acto Jurídico", 221 páginas, fragmentado en 17 PDF por tema en
`Apuntes/CIVIL/Acto Jurídico/`). Ver el incidente documentado en
`docs/incidente_compresion_manuales.md` (vive en el worktree
`apunte-bienes`, no en este; si hace falta, se puede leer desde ahí).

Laura decidió que **este manual sea el principal recurso de estudio de las
alumnas** y pidió que quede **lo más cerca posible de una transcripción
completa** del libro (no un resumen), trabajando **tanda por tanda (eje
por eje)** para no perder precisión. Instrucción textual suya:

> "Sigamos así, avanza con el resto de los ejes. Lo que me interesa es que
> sea lo más similar al principal posible, y luego a eso le agregas los
> argumentos extra de los apuntes secundarios y anexos."

Esto define **dos fases**:

- **Fase A (COMPLETA):** recorrer los 21 ejes (A-U) y reescribir cada uno
  lo más cerca posible de la fuente primaria (el libro de Boetsch),
  recuperando argumentos, ejemplos, excepciones y citas de jurisprudencia
  completos que se habían perdido en la compresión original.
- **Fase B (sin empezar):** una segunda pasada agregando los argumentos
  extra de las fuentes secundarias y anexos (ver más abajo). Recién ahora
  puede empezar, porque la Fase A ya terminó.

## Método de trabajo (ritmo ya validado por Laura, para la Fase B)

Al principio se persiguió llegar a un 85% de fidelidad exacto por eje,
iterando frase por frase. Laura interrumpió ese ritmo ("Cómo vamos? siento
que llevamos mucho en lo mismo?") porque era demasiado lento. El método
que ella aprobó y que hay que seguir en la Fase B:

1. Leer el/los PDF fuente completos del eje.
2. Leer la sección actual del manual (`<h1 id="sX">` hasta el siguiente `<h1>`).
3. Buscar **argumentos, ejemplos o excepciones completos que falten**, no
   perseguir la última frase suelta. Si una lista de citas de jurisprudencia
   está incompleta, completarla también: es contenido verificable, no
   interpretación.
4. Aplicar el o los `Edit` necesarios en **pocas pasadas** (no 15-20 rondas
   de microedición).
5. Correr **una sola vez** el script de balance de etiquetas/em-dash/ids
   duplicados (más abajo) antes de cada commit.
6. Si el contenido ya está completo tras leer fuente y manual, **no editar
   nada** y marcar el eje como revisado igual.
7. Commit en español (ver formato de commits ya hechos con `git log`), con
   el trailer de coautoría. Push a `origin worktree-auditoria-acto-juridico`
   (nunca a `main`).

No perseguir un porcentaje de fidelidad exacto. El script de fidelidad por
tramo dejó de ser útil desde el eje I en adelante (varios ejes comparten
PDF fuente y el denominador no se puede aislar limpiamente); desde ahí se
usó lectura y comparación manual completa en su lugar.

## Estado actual: Fase A completa (los 21 ejes A-U)

Todo está commiteado y pusheado en la rama `worktree-auditoria-acto-juridico`
(branch de este worktree). Commit más reciente: `a82099c`.

| Eje | Tema | Fuente | Estado |
|---|---|---|---|
| A | Teoría general | PDF1 | ✅ hecho (commit `a60b7a0`) |
| B (1-3) | La voluntad | PDF2 | ✅ hecho (commits `2acbe59`, `0ced5c6`) |
| B (4-8) | Vicios de la voluntad | PDF3 | ✅ hecho (commit `27b8e65`) |
| C | Capacidad | PDF4 | ✅ hecho (commit `bc15e6c`) |
| D | Objeto | PDF5 | ✅ hecho (commit `9fa8913`) |
| E | Causa | PDF6 | ✅ revisado, ya estaba completo, sin cambios |
| F | Formalidades | PDF7 | ✅ revisado, ya estaba completo, sin cambios |
| G | Efectos de los AJ | PDF8 | ✅ revisado, ya estaba completo, sin cambios |
| H | Inexistencia jurídica | PDF9 | ✅ hecho (commit `fc3b544`): listas de jurisprudencia completadas (4→8 y 4→10 fallos), dos argumentos en 4.2 |
| I | Nulidad, aspectos generales | PDF10 (B.1) | ✅ hecho (commit `b8149ce`) |
| J | Nulidad absoluta | PDF10 (B.2) | ✅ hecho (commit `cbc4f82`) |
| K | Nulidad relativa | PDF10 (B.3) | ✅ revisado, ya estaba completo, sin cambios propios |
| L | Efectos de la nulidad | PDF11 (B.4) | ✅ hecho (commit `827fe6b`) |
| M | Lesión | PDF12 (C) | ✅ hecho (commit `527b651`) |
| N | Simulación | PDF13 (D) | ✅ hecho (commit `3f053a1`) |
| O | Inoponibilidad | PDF14 (E) | ✅ hecho (commit `36b5e1a`) |
| P | Fraude a la ley | PDF15 (F) | ✅ hecho (commit `c77e46a`) |
| Q | Otras causales de ineficacia | PDF16 (G) | ✅ hecho (commit `8734c79`) — **ver flag abajo** |
| R | Representación | PDF16 (V) | ✅ hecho (commit `e1d1c20`) |
| S | La condición | PDF17 (VI/A) | ✅ hecho (commit `629f96a`) |
| T, U | Plazo y modo | PDF17 (B, C) | ✅ hecho (commit `a82099c`) |

**Nota sobre E, F, G, K:** no generaron cambios de contenido porque, tras
leer la fuente completa y la sección del manual completa, no había ningún
argumento, ejemplo o excepción faltante.

**Nota sobre I-L y Q-R:** varios ejes comparten PDF fuente (10 y 11 se
solapan; 16 cubre Q y R). Se verificó que no hay pérdida ni duplicación de
contenido en los empalmes.

## ⚠️ Hallazgo pendiente de decisión de Laura: eje Q

Al revisar el eje Q (otras causales de ineficacia) contra el PDF16, se
confirmó que **el libro de Boetsch solo trata 6 causales en ese capítulo**:
suspensión, resolución, resciliación, revocación, desistimiento unilateral
y caducidad. Después de "caducidad" el libro salta directo a "V. LA
REPRESENTACIÓN".

Pero el manual (desde antes de este trabajo de reparación) tiene **tres
secciones más** en el eje Q que no vienen de Boetsch en este tramo: **7.
Terminación, 8. Renuncia, 9. Muerte**. Son doctrina estándar y correcta
(cualquier manual de acto jurídico las trata), pero no están respaldadas
por la fuente primaria en este punto del libro — probablemente vienen de
una fuente secundaria o de una pasada anterior a este proyecto de
reparación.

**No se borró ese contenido** (no hay indicación de Laura para hacerlo, y
es contenido jurídicamente correcto), pero queda marcado acá para que
Laura decida: dejarlo como está, buscar si viene de alguna fuente
secundaria concreta para citarla, o quitarlo si quiere que este eje sea
estrictamente Boetsch.

## Qué sigue

1. **Fase B**: agregar los argumentos extra de las fuentes secundarias y
   anexos (ver más abajo), eje por eje, con el mismo método de la Fase A
   (leer fuente secundaria + sección actual, buscar solo lo que falte).
2. **Regenerar el PDF** `app/pdf/Acto_Juridico.pdf` (ver "Pendientes fuera
   de esta lista" más abajo) — se puede hacer ahora que la Fase A terminó,
   o esperar a que termine también la Fase B, a decidir con Laura.
3. Resolver el flag del eje Q (arriba).

## Dónde está el texto fuente ya extraído (no releer los PDF originales)

Los 17 PDF de Boetsch ya están extraídos a texto plano en:

```
/Users/lorensaura/.claude/jobs/f61b1698/tmp/aj_pdf1.txt   … aj_pdf17.txt
```

**Ojo:** ese directorio de caché pertenece a un job específico y puede no
persistir entre sesiones. Si al retomar esos archivos ya no existen,
volver a extraer con PyMuPDF (`fitz`, confirmado instalado) desde
`Apuntes/CIVIL/Acto Jurídico/` (ruta del checkout original, no de este
worktree, que no versiona esa carpeta por `.gitignore`):

```python
import fitz
doc = fitz.open("ruta.pdf")
text = "".join(p.get_text() for p in doc)
```

Fuentes secundarias, para la **Fase B**, también ya extraídas en el mismo
directorio: `aj_causa_dyb.txt` (Causa, Domínguez y Boetsch) y
`aj_bozzo_ibarra.txt` (resumen de Bozzo e Ibarra, cubre objeto ilícito,
causa, inexistencia/nulidad con la discusión Claro Solar vs. Alessandri,
lesión y simulación). También pendientes de usar en la Fase B:
`INEFICACIA JURÍDICA_Cuadro comparativo.pdf` y `Memorice_ART y
Definiciones.pdf` (glosario/verificación de citas de artículo).

## Script de verificación (correr antes de cada commit)

**Balance de etiquetas / em-dash / ids duplicados:**

```python
import re, collections
F = '/Users/lorensaura/Desktop/DERECHO LIBRE/Derecho Libre/.claude/worktrees/auditoria-acto-juridico/04_Acto_Juridico_Manual.html'
text = open(F, encoding='utf-8').read()
for tag in ['p','div','span','h1','h2','h3','h4']:
    o = len(re.findall(r'<'+tag+r'(?:\s[^>]*)?>', text))
    c = len(re.findall(r'</'+tag+r'>', text))
    print(tag, o, c, 'OK' if o==c else 'MISMATCH')
print('em-dash:', text.count(chr(8212)))
ids = re.findall(r'id="([^"]+)"', text)
dupes = [i for i,c in collections.Counter(ids).items() if c>1]
print('ids duplicados:', dupes)
```

Último resultado conocido (tras el commit `a82099c`, cierre de Fase A):
p:513/513, div:47/47, span:677/677, h1:21/21, h2:114/114, h3:137/137,
h4:19/19, em-dash:0, sin ids duplicados.

## Reglas fijas del proyecto que aplican a este trabajo

- **Cero guiones largos (—)** en ningún contenido generado. Verificar
  siempre antes de cada commit.
- **Prohibido alucinar**: toda oración agregada debe salir de una lectura
  directa del PDF fuente correspondiente, nunca de conocimiento general.
- Formato de las cajas y jerarquía de encabezados: ver
  `docs/script_apuntes.md` (en este worktree tiene la versión vieja,
  pre-incidente; la versión actualizada con la regla "prohibido resumir"
  está en `.claude/worktrees/apunte-bienes/docs/script_apuntes.md` si hace
  falta consultarla).
- Un commit por eje, en español, formato imperativo, con el trailer
  `Co-Authored-By: Claude Sonnet 5 <noreply@anthropic.com>`.
- Nunca hacer push a `main`. Laura mergea desde GitHub Desktop.

## Pendientes fuera de esta lista de ejes (no olvidar)

- **Regenerar el PDF** `app/pdf/Acto_Juridico.pdf` con
  `python3 scripts/generar_pdf_manual.py 04_Acto_Juridico_Manual.html
  app/pdf/Acto_Juridico.pdf "Acto Jurídico"` — no se ha regenerado desde
  que empezó este trabajo de acercamiento a la fuente.
- Una vez mergeado a `main` por Laura, falta enlazar el manual en
  `app/manuales.html` si es que todavía no está enlazado (verificar el
  estado real de ese archivo al retomar, no asumir).
