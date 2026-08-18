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

- **Fase A (en curso):** recorrer los 21 ejes (A-U) y reescribir cada uno
  lo más cerca posible de la fuente primaria (el libro de Boetsch),
  recuperando argumentos, ejemplos, excepciones y citas de jurisprudencia
  completos que se habían perdido en la compresión original.
- **Fase B (sin empezar):** una segunda pasada, después de terminar los 21
  ejes, agregando los argumentos extra de las fuentes secundarias y anexos
  (ver más abajo). No empezar esta fase hasta que la Fase A esté 100% completa.

## Método de trabajo (ritmo ya validado por Laura)

Al principio se persiguió llegar a un 85% de fidelidad exacto por eje,
iterando frase por frase. Laura interrumpió ese ritmo ("Cómo vamos? siento
que llevamos mucho en lo mismo?") porque era demasiado lento. El método
que ella aprobó y que hay que seguir:

1. Leer el/los PDF fuente completos del eje (texto ya extraído en caché,
   ver abajo).
2. Leer la sección actual del manual (`<h1 id="sX">` hasta el siguiente `<h1>`).
3. Buscar **argumentos, ejemplos o excepciones completos que falten**, no
   perseguir la última frase suelta. Si una lista de citas de jurisprudencia
   está incompleta (fallos reales que aparecen en la fuente pero no en el
   manual), completarla también: es contenido verificable, no interpretación.
4. Aplicar el o los `Edit` necesarios en **pocas pasadas** (no 15-20 rondas
   de microedición).
5. Correr **una sola vez** el script de fidelidad (más abajo) y **una vez**
   el de balance de etiquetas/em-dash/ids duplicados.
6. Si el contenido ya está completo tras leer fuente y manual (pasó varias
   veces: E, F, G ya estaban íntegros), **no editar nada** y marcar el eje
   como revisado igual. No hace falta forzar una edición si no hay nada
   que agregar.
7. Commit en español (ver formato de commits ya hechos con `git log`),
   cerrando con la línea "Fidelidad: X% → Y%." y el trailer de coautoría.
   Push a `origin worktree-auditoria-acto-juridico` (nunca a `main`).

No perseguir el 85% exacto. Aceptar el porcentaje que resulte una vez que
el contenido está completo: el propio script de fidelidad infla el
denominador en varios ejes (repite encabezados de página no siempre bien
filtrados, o incluye texto de la sección siguiente cuando dos ejes
comparten PDF), así que un 45-55% con contenido íntegro es normal y no es
señal de que falte algo.

## Estado actual: qué está hecho

Todo lo de abajo está commiteado y pusheado en la rama
`worktree-auditoria-acto-juridico` (branch de este worktree). Commit más
reciente: `fc3b544`.

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
| H | Inexistencia jurídica | PDF9 | ✅ hecho (commit `fc3b544`): se completaron las listas de jurisprudencia (4→8 fallos que rechazan, 4→10 que acogen la teoría) y dos argumentos que faltaban en 4.2 (art. 464 Nº14 CPC, y que ninguna ley reconoce la inexistencia como sanción autónoma) |

**Nota sobre E, F, G:** no generaron commits porque, tras leer la fuente
completa y la sección del manual completa, no había ningún argumento,
ejemplo o excepción faltante. La fidelidad medida (60.6%, 55.7%, 68.0%)
está deprimida por artefactos del script de medición (ver más arriba), no
por contenido faltante. Si se retoma la revisión de estos tres ejes en el
futuro, no hace falta releerlos salvo que se sospeche algo puntual.

## Qué falta (por dónde seguir)

Quedé revisando el **eje J (nulidad absoluta)** contra su fuente (PDF10)
sin encontrar todavía ninguna brecha (llegué a leer hasta la sección 7 del
manual, "La nulidad absoluta no se produce de pleno derecho", comparado
contra el texto del PDF10 hasta su línea 858 — el PDF10 se corta ahí mismo,
en medio de la sección "B.4 Los efectos de la nulidad"). **No hice ningún
edit ni commit en I, J o K todavía.**

Pendiente, en orden:

1. **Terminar de comparar J (nulidad absoluta)** contra PDF10 — falta
   confirmar si hay brechas en la sección 4 (declaración de nulidad
   absoluta, especialmente el sub-punto sobre representantes/herederos que
   discuten legitimación) y en las secciones 5-7. Por lo leído hasta ahora
   parece bastante completo, pero no se terminó de verificar.
2. **Revisar I (nulidad, aspectos generales)** contra PDF10 — ya se leyó
   completo y **parece ya estar íntegro** (incluye hasta una sección "9. La
   nulidad refleja" que no viene en el fragmento de PDF10 leído, así que
   probablemente ya fue enriquecido en una pasada anterior). Confirmar que
   no falte nada de la sección 1-8 del PDF10 (reglas generales, concepto,
   especies, terminología, regla general, diferencias, principios, nulidad
   total/parcial) — de una lectura rápida ya lo tiene todo.
3. **Revisar K (nulidad relativa)** contra PDF10 (secciones "B.3 La nulidad
   relativa" del PDF, líneas 541-830 aprox: definición, causales,
   características, legitimados para alegarla, situación del incapaz que
   se hizo pasar por capaz, saneamiento por tiempo, ratificación/confirmación
   con sus clases, características y requisitos). Sin revisar todavía.
4. **Eje L (efectos de la nulidad)** — fuente PDF11. El final de PDF10 ya
   empieza a hablar de "B.4 Los efectos de la nulidad" (líneas 832-858);
   confirmar que ese arranque efectivamente se cubre en la fuente PDF11
   (que debería continuar desde ahí) y no se duplique ni se pierda contenido
   en el empalme.
5. **Eje M (lesión)** — fuente PDF12.
6. **Eje N (simulación)** — fuente PDF13.
7. **Eje O (inoponibilidad)** — fuente PDF14.
8. **Eje P (fraude a la ley)** — fuente PDF15.
9. **Ejes Q, R (otras causales, representación)** — fuente PDF16.
10. **Ejes S, T, U (condición, plazo, modo)** — fuente PDF17.

Después de terminar el eje U: **Fase B** (segunda pasada agregando
argumentos de fuentes secundarias — ver abajo), y luego **regenerar el
PDF** (ver "Pendientes fuera de esta lista").

## Tareas (TaskList del sistema)

El estado real de las tareas del sistema (`TaskList`) al momento de este
handoff:

- `#27`-`#34` (ejes A a H): `completed`.
- `#35` (ejes I, J, K): `in_progress` — retomar desde acá.
- `#36` a `#42` (L a U): `pending`.

Si al retomar el `TaskList` no coincide con esto (por ejemplo si otra
sesión avanzó), confiar en el `TaskList` real y en `git log`, no en esta
tabla congelada.

## Dónde está el texto fuente ya extraído (no releer los PDF originales)

Los 17 PDF de Boetsch ya están extraídos a texto plano en:

```
/Users/lorensaura/.claude/jobs/f61b1698/tmp/aj_pdf1.txt   … aj_pdf17.txt
```

Mapeo PDF → eje(s):

| PDF | Tema | Eje(s) |
|---|---|---|
| 1 | Teoría general | A |
| 2 | Voluntad | B (1-3) |
| 3 | Vicios de la voluntad | B (4-8) |
| 4 | Capacidad | C |
| 5 | Objeto | D |
| 6 | Causa | E |
| 7 | Formalidades | F |
| 8 | Efectos de los AJ | G |
| 9 | Inexistencia | H |
| 10 | Nulidad general/absoluta/relativa | I, J, K |
| 11 | Efectos de la nulidad | L |
| 12 | Lesión | M |
| 13 | Simulación | N |
| 14 | Inoponibilidad | O |
| 15 | Fraude a la ley | P |
| 16 | Otras causales + Representación | Q, R |
| 17 | Modalidades del AJ | S, T, U |

**Ojo:** ese directorio de caché (`/Users/lorensaura/.claude/jobs/f61b1698/tmp/`)
pertenece a un job específico y puede no persistir entre sesiones. Si al
retomar esos archivos ya no existen, volver a extraer con PyMuPDF (`fitz`,
confirmado instalado) desde `Apuntes/CIVIL/Acto Jurídico/` (ruta del
checkout original, no de este worktree, que no versiona esa carpeta por
`.gitignore`):

```python
import fitz
doc = fitz.open("ruta.pdf")
text = "".join(p.get_text() for p in doc)
```

Fuentes secundarias, para la **Fase B** (no usar todavía), también ya
extraídas en el mismo directorio: `aj_causa_dyb.txt` (Causa, Domínguez y
Boetsch) y `aj_bozzo_ibarra.txt` (resumen de Bozzo e Ibarra, cubre objeto
ilícito, causa, inexistencia/nulidad con la discusión Claro Solar vs.
Alessandri, lesión y simulación). También pendientes de usar en la Fase B:
`INEFICACIA JURÍDICA_Cuadro comparativo.pdf` y `Memorice_ART y
Definiciones.pdf` (glosario/verificación de citas de artículo).

## Scripts de verificación (reusar tal cual, no hace falta guardarlos en archivo)

**Fidelidad de un tramo** (ajustar `pdf`, `sid`, `eid`):

```python
import re
def clean(text, materia_marker, autor_marker):
    lines = [l for l in text.split("\n")
             if "Facultad de Derecho" not in l
             and materia_marker not in l
             and autor_marker not in l
             and not l.strip().startswith("__")
             and "Página" not in l]
    return " ".join(l.strip() for l in lines if l.strip())

texto_fuente = open('/Users/lorensaura/.claude/jobs/f61b1698/tmp/aj_pdfN.txt', encoding='utf-8').read()
fuente_limpia = clean(texto_fuente, "TEORÍA DEL ACTO JURÍDICO", "Cristián Boetsch Gillet")
html = open('/Users/lorensaura/Desktop/DERECHO LIBRE/Derecho Libre/.claude/worktrees/auditoria-acto-juridico/04_Acto_Juridico_Manual.html', encoding='utf-8').read()
start = html.find('<h1 id="sX">')
end = html.find('<h1 id="sY">')
tramo_html = html[start:end]
manual_texto = re.sub(r"\s+", " ", re.sub(r"<[^>]+>", " ", tramo_html)).strip()
print("fidelidad:", round(len(manual_texto) / len(fuente_limpia) * 100, 1), "%")
```

**Balance de etiquetas / em-dash / ids duplicados** (correr sobre el
archivo completo antes de cada commit):

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

Último resultado conocido (tras el commit `fc3b544`, eje H): p:508/508,
div:47/47, span:664/664, h1:21/21, h2:114/114, h3:137/137, h4:19/19,
em-dash:0, sin ids duplicados.

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
- Un commit por tramo/eje, en español, formato imperativo, con la línea
  final "Fidelidad: X% → Y%." y el trailer `Co-Authored-By: Claude Sonnet 5
  <noreply@anthropic.com>`.
- Nunca hacer push a `main`. Laura mergea desde GitHub Desktop.

## Pendientes fuera de esta lista de ejes (no olvidar)

- **Regenerar el PDF** `app/pdf/Acto_Juridico.pdf` con
  `python3 scripts/generar_pdf_manual.py 04_Acto_Juridico_Manual.html
  app/pdf/Acto_Juridico.pdf "Acto Jurídico"` — no se ha regenerado desde
  que empezó este trabajo de acercamiento a la fuente. Hacerlo recién
  cuando la Fase A (los 21 ejes) esté terminada, no en cada commit
  intermedio.
- Una vez mergeado a `main` por Laura, falta enlazar el manual en
  `app/manuales.html` si es que todavía no está enlazado (verificar el
  estado real de ese archivo al retomar, no asumir).
