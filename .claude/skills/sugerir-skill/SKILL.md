---
name: sugerir-skill
description: Detecta cuando un proceso de varios pasos ya se repitió 2-3 veces de forma manual en este proyecto (ej. el mismo tipo de migración de datos, la misma secuencia de verificación) y redacta una propuesta de skill nuevo para automatizarlo — pero solo la muestra en el chat para que Laura la apruebe, nunca crea el archivo directo. Úsalo también cuando Laura pida explícitamente "revisa si conviene un skill para esto" o "crea un skill para esto".
---

# Sugerir un skill nuevo

Este skill es para **mí mismo**: detectar cuándo vale la pena convertir un
proceso repetido en un skill reusable, y proponérselo a Laura antes de
crear nada.

## Cuándo usarlo
- Un proceso de varios pasos (migración de datos, verificación, generación
  de contenido, etc.) ya se repitió **2-3 veces** de forma manual en este
  proyecto.
- Laura pide explícitamente "revisa si conviene un skill para esto" o
  "crea un skill para esto".

## Qué hacer

1. **Identificar el patrón** — qué se hizo, cuántas veces se repitió, qué
   pasos concretos lo componen (comandos, archivos tocados, decisiones que
   se repitieron igual cada vez).
2. **Evaluar si vale la pena** — ¿de verdad ahorra pasos la próxima vez, o
   fue un caso único que no se va a repetir? No proponer un skill para algo
   que pasó una sola vez o que es tan simple que documentarlo no ahorra
   nada.
3. **Redactar la propuesta** (no crear el archivo todavía): nombre del
   skill, cuándo se activaría (descripción tipo frontmatter), y qué pasos
   automatizaría. Mostrarla en el chat, en el mismo formato breve que se ha
   usado antes (nombre, se activa cuando, qué hace, en pasos).
4. **Esperar aprobación explícita de Laura.**
5. Recién ahí crear `.claude/skills/<nombre>/SKILL.md`, siguiendo el mismo
   estilo que los skills existentes del proyecto (frontmatter `name` +
   `description`, cuerpo en español, claro y sin jerga técnica — ver
   `.claude/skills/handoff/SKILL.md` como referencia de formato).

## Reglas
- **Nunca crear un archivo de skill sin aprobación explícita de Laura** —
  ni siquiera si la propuesta parece obviamente buena.
- Preferir pocos skills bien pensados a muchos triviales — cada skill
  nuevo es algo más que mantener.
- Todo en español, sin tecnicismos, igual que el resto del proyecto.
