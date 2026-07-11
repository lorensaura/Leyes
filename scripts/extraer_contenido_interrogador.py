#!/usr/bin/env python3
"""
Extrae el texto plano de los manuales de Responsabilidad Contractual y
Extracontractual y genera api/_interrogador-contenido.js (un módulo JS que
exporta el texto), para que el Interrogador IA lo use como contexto de
grounding en el system prompt.

Volver a correr este script cada vez que cambien los manuales fuente:
    python3 scripts/extraer_contenido_interrogador.py
"""

import html
import re
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent

FUENTES = [
    ("Responsabilidad Contractual", ROOT / "01_Responsabilidad_Contractual_Manual.html"),
    ("Responsabilidad Extracontractual", ROOT / "02_Responsabilidad_Extracontractual_Manual.html"),
]

SALIDA = ROOT / "api" / "_interrogador-contenido.js"


def html_a_texto(marcado: str) -> str:
    # Saca <style>...</style> y <script>...</script> completos (con su contenido)
    marcado = re.sub(r"<style[^>]*>.*?</style>", "", marcado, flags=re.DOTALL | re.IGNORECASE)
    marcado = re.sub(r"<script[^>]*>.*?</script>", "", marcado, flags=re.DOTALL | re.IGNORECASE)

    # Solo el <body> si existe
    cuerpo = re.search(r"<body[^>]*>(.*)</body>", marcado, flags=re.DOTALL | re.IGNORECASE)
    if cuerpo:
        marcado = cuerpo.group(1)

    # Saltos de línea antes de bloques para no pegar palabras entre etiquetas
    marcado = re.sub(r"<(h1|h2|h3|h4|p|li|div|tr|blockquote|br)[^>]*>", "\n", marcado, flags=re.IGNORECASE)

    # Saca cualquier otra etiqueta
    marcado = re.sub(r"<[^>]+>", "", marcado)

    # Decodifica entidades HTML (&aacute;, &amp;, etc.)
    texto = html.unescape(marcado)

    # Colapsa espacios y líneas en blanco repetidas
    texto = re.sub(r"[ \t]+", " ", texto)
    texto = re.sub(r"\n[ \t]+", "\n", texto)
    texto = re.sub(r"\n{3,}", "\n\n", texto)

    return texto.strip()


def main():
    partes = []
    for titulo, ruta in FUENTES:
        if not ruta.exists():
            raise SystemExit(f"No encontré el manual: {ruta}")
        crudo = ruta.read_text(encoding="utf-8")
        texto = html_a_texto(crudo)
        partes.append(f"===== MANUAL: {titulo.upper()} =====\n\n{texto}")

    contenido_final = "\n\n\n".join(partes)

    # Backtick, backslash y ${...} deben escaparse dentro de un template
    # literal de JS para no romper la sintaxis del archivo generado.
    escapado = (
        contenido_final
        .replace("\\", "\\\\")
        .replace("`", "\\`")
        .replace("${", "\\${")
    )

    SALIDA.parent.mkdir(parents=True, exist_ok=True)
    SALIDA.write_text(
        "// Generado automáticamente por scripts/extraer_contenido_interrogador.py\n"
        "// No editar a mano — volver a correr el script si cambian los manuales fuente.\n"
        f"module.exports = `{escapado}`;\n",
        encoding="utf-8",
    )

    print(f"OK: {SALIDA.relative_to(ROOT)} ({len(contenido_final):,} caracteres, ~{len(contenido_final)//4:,} tokens aprox.)")


if __name__ == "__main__":
    main()
