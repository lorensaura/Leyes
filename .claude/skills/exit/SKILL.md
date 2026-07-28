---
name: exit
description: Cuando la conversación ya se puso muy larga y Laura quiere seguir trabajando sin cerrar la terminal. Se usa siempre después de /handoff. Confirma que el handoff quedó guardado y al día, y le indica a Laura que escriba /clear para vaciar la conversación visible y seguir en la misma sesión. Úsalo cuando Laura diga "/exit", "quiero limpiar esto", "vaciar la terminal", "seguir pero limpio" o algo similar.
---

# Exit

Vacía la conversación visible en la terminal para que Laura pueda seguir
trabajando en la misma sesión, sin cerrarla, una vez que ya quedó todo
guardado con `/handoff`.

**Importante:** vos (Claude) no podés ejecutar `/clear` directamente — es un
comando de la terminal que solo Laura puede escribir. Tu trabajo acá es
verificar que no se pierda nada y después decirle a Laura que lo escriba.

## Pasos

1. **Verificá que el handoff esté guardado y al día.** Leé
   `.claude/handoff/ESTADO_ACTUAL.md`. Si no existe, o si claramente no
   refleja lo último que se conversó en esta sesión (falta el hilo de
   trabajo actual, o el archivo es de una sesión anterior), corré el skill
   `handoff` primero — no sigas sin eso.
2. **No inventes que ya está guardado si no lo verificaste.** Leer el
   archivo es obligatorio, no asumas que el `/handoff` anterior en la
   conversación se escribió bien.
3. Una vez confirmado, decile a Laura en una o dos frases, sin repetir el
   contenido del handoff:
   - Que ya quedó todo guardado en `.claude/handoff/ESTADO_ACTUAL.md`.
   - Que ahora puede escribir `/clear` para vaciar la terminal y seguir
     trabajando en esta misma sesión, sin cerrarla.
4. Si después del `/clear` la sesión nueva no arranca sola desde el
   handoff, basta con que Laura diga algo como "seguí con el handoff" y
   ahí se retoma leyendo ese archivo.

## Qué NO hacer

- No corras `/clear` vos mismo ni intentes simularlo — no es una acción
  disponible como herramienta, es un comando que Laura tipea.
- No le pegues el contenido del handoff en el chat antes de limpiar; ya
  está guardado en el archivo, para eso existe.
