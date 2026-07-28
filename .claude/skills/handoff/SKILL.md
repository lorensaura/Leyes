---
name: handoff
description: Compacta la conversación actual en un documento de traspaso corto para que una sesión nueva de Claude Code (en esta misma carpeta del proyecto) pueda seguir sin releer todo el historial. Úsalo cuando la conversación se está poniendo muy larga, cuando Laura vaya a cambiar de computador o cerrar por hoy, cuando haya que dejarle el trabajo a otra sesión, o cuando Laura diga "handoff", "resume dónde quedamos" o algo parecido.
---

# Handoff

Compacta la conversación actual en un documento de traspaso corto, para que
una sesión nueva de Claude Code — abierta después, en esta misma carpeta del
proyecto (Digesto / Derecho Libre) — pueda retomar el trabajo sin releer toda
la conversación de hoy.

## Cuándo usarlo

- La conversación se está poniendo larga y hay riesgo de perder contexto.
- Laura va a cerrar por hoy y seguir en otro momento, o cambiar de computador.
- Hay que dejarle el trabajo a otra sesión o a otro agente.
- Laura dice "handoff", "resume dónde quedamos" o algo similar.

## Dónde escribirlo

Escribe siempre en el mismo archivo: `.claude/handoff/ESTADO_ACTUAL.md`.
**Sobrescríbelo entero cada vez** — no crees un archivo nuevo por fecha ni
dejes versiones anteriores dando vueltas. Es un snapshot del momento
presente, no un historial: la sesión anterior no importa una vez que este
archivo se actualiza. Esa carpeta está en `.gitignore` a propósito.

Si por algún motivo tenés que consultar un handoff viejo (de antes de este
cambio, con fecha en el nombre), está en `.claude/handoff/archivo/` — pero
no escribas ahí, es solo lectura histórica.

**Antes de sobrescribir, leé el archivo tal como está.** Si ya describe un
hilo de trabajo distinto al tuyo (otra sesión, otra tarea, que no terminó
— ej. dice "esperando aviso de Laura" o algo que vos no tocaste), **no lo
borres**: dejalo como una sección `## Hilo N — <tema>` separada y agregá
la tuya al lado, con su propio Dónde estamos/Qué se hizo/Qué sigue. Recién
fusioná o eliminá un hilo cuando quede claro que ya se cerró (ej. Laura lo
confirma, o el propio hilo dice que terminó). Esto pasó de verdad una vez
(2026-07-28, dos sesiones en paralelo se pisaron el archivo) — no asumas
que sos la única sesión activa en este repo.

## Qué incluir

1. **Dónde estamos** — en qué se estaba trabajando y el estado actual (ej.
   "Interrogador IA v1 lista y en producción; Flashcards con repetición
   espaciada recién armada, falta que Laura suba el último cambio").
2. **Qué se hizo en esta sesión** — acciones clave y decisiones tomadas.
   Enlaza a archivos por ruta en vez de reproducir su contenido (ej. "ver
   `api/_interrogador-prompt.js`, sección ESTILO" en vez de copiar el texto).
3. **Qué sigue** — próximos pasos inmediatos, en orden. Ajusta esta sección
   a lo último que Laura haya dicho que quiere priorizar en esta sesión; si
   no lo dijo explícitamente, revisa el Roadmap de `CLAUDE.md` para inferirlo
   — no pongas una lista genérica de todo el roadmap.
4. **Pendientes sueltos** — cosas mencionadas pero no accionadas todavía
   (ej. "falta que Laura pruebe una interrogación real de punta a punta",
   "falta subir con GitHub Desktop", "falta agregar tal variable en Vercel").
5. **Contexto clave** — lo que la próxima sesión va a necesitar sin tener
   que volver a preguntarlo: IDs de bases de Airtable, nombres de tablas de
   Supabase, rutas de archivos relevantes, nombres (no valores) de variables
   de entorno.
6. **Skills sugeridos** — qué skills conviene tener a mano en la próxima
   sesión según lo que quede pendiente (ej. `verify` si hay que confirmar un
   cambio, `run` si hay que probarlo en el navegador, `code-review` si hay
   código nuevo sin revisar).

## Reglas

- Enlaza a archivos o registros existentes por ruta o ID en vez de
  reproducir su contenido — el objetivo es que la sesión nueva vaya y lea
  el archivo si lo necesita, no que este documento sea una copia de todo.
- **Redacta cualquier dato sensible.** Nunca escribas el valor de
  `AIRTABLE_TOKEN`, `SUPABASE_SECRET_KEY`, `ANTHROPIC_API_KEY` ni ninguna
  otra credencial — solo el nombre de la variable, jamás su valor, ni
  siquiera parcial.
- Máximo 400 líneas. Si se pasa de eso, estás duplicando en vez de
  resumiendo — recorta, no repitas.
- Todo en español, como el resto del proyecto (código, contenido y
  respuestas a Laura van siempre en español).

## Al terminar

Dile a Laura la ruta del archivo generado y dale un resumen verbal de 3
frases de en qué quedamos — no le pegues el documento completo en el chat,
para eso está el archivo.
