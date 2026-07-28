"""Genera el PDF de un manual a partir de su HTML, vía Chrome headless + CDP.

Uso:
    python3 scripts/generar_pdf_manual.py <ruta_html> <ruta_pdf_salida> "<Título del manual>"

Ejemplo:
    python3 scripts/generar_pdf_manual.py \
        02_Responsabilidad_Extracontractual_Manual.html \
        app/pdf/Responsabilidad_Extracontractual.pdf \
        "Responsabilidad Extracontractual"

Sigue las reglas de docs/pdf.md: márgenes reales de printToPDF (no padding
del body), encabezado/pie con DIGESTO + título + autora + número de página.
Requiere Google Chrome instalado y el paquete `websocket-client`.
"""
import base64
import json
import os
import subprocess
import sys
import tempfile
import time
import urllib.request
import fitz
import websocket

CHROME_CANDIDATES = [
    "/Applications/Google Chrome.app/Contents/MacOS/Google Chrome",
    "google-chrome",
    "chromium",
]
PORT = 9333


def find_chrome():
    for c in CHROME_CANDIDATES:
        if os.path.sep in c and os.path.exists(c):
            return c
        if os.path.sep not in c:
            from shutil import which
            found = which(c)
            if found:
                return found
    raise RuntimeError("No se encontró Google Chrome / Chromium instalado")


def cdp_get(path, method="GET"):
    req = urllib.request.Request(f"http://127.0.0.1:{PORT}{path}", method=method)
    with urllib.request.urlopen(req) as r:
        return json.loads(r.read())


def main():
    if len(sys.argv) != 4:
        print(__doc__)
        sys.exit(1)

    html_path = os.path.abspath(sys.argv[1])
    pdf_path = os.path.abspath(sys.argv[2])
    title = sys.argv[3]

    chrome = find_chrome()

    with tempfile.TemporaryDirectory() as profile_dir:
        proc = subprocess.Popen([
            chrome,
            f"--remote-debugging-port={PORT}",
            "--remote-allow-origins=*",
            "--headless=new",
            "--disable-gpu",
            "--no-sandbox",
            f"--user-data-dir={profile_dir}",
        ], stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)

        try:
            for _ in range(50):
                try:
                    cdp_get("/json/version")
                    break
                except Exception:
                    time.sleep(0.2)
            else:
                raise RuntimeError("Chrome DevTools no respondió")

            tab = cdp_get("/json/new?about:blank", method="PUT")
            ws = websocket.create_connection(tab["webSocketDebuggerUrl"], timeout=60)
            msg_id = 0

            def send(method, params=None):
                nonlocal msg_id
                msg_id += 1
                ws.send(json.dumps({"id": msg_id, "method": method, "params": params or {}}))
                while True:
                    resp = json.loads(ws.recv())
                    if resp.get("id") == msg_id:
                        return resp

            send("Page.enable")
            send("Page.navigate", {"url": f"file://{html_path}"})

            deadline = time.time() + 30
            loaded = False
            while time.time() < deadline:
                raw = json.loads(ws.recv())
                if raw.get("method") == "Page.loadEventFired":
                    loaded = True
                    break
            if not loaded:
                raise RuntimeError("La página no terminó de cargar")

            time.sleep(3)  # dejar asentar las fuentes web (Bebas Neue/Inter)

            # El encabezado (DIGESTO + título + "Examen de grado") no va en la
            # portada (decidido 2026-07-28, ver nota de Laura sobre el PDF).
            # Chrome sanitiza cualquier <script> dentro de headerTemplate, así
            # que no hay forma de ocultarlo condicionalmente por página dentro
            # de un solo printToPDF: se generan dos versiones completas (una
            # sin encabezado, otra con) y se combinan tomando la página 1 de
            # la primera y el resto de la segunda. Los márgenes son idénticos
            # en ambas, así que la paginación no cambia entre una y otra.
            header_template = f'''
            <div style="width:100%; font-family:Arial,Helvetica,sans-serif;
                        font-size:8px; padding:0 68px 5px 68px; box-sizing:border-box; color:#111;">
              <div style="display:flex; justify-content:space-between; align-items:flex-start;">
                <div style="color:#C41E2E; font-weight:700; letter-spacing:3px;">DIGESTO</div>
                <div style="text-align:right; line-height:1.5;">
                  <div>{title}</div>
                  <div style="color:#555;">Examen de grado</div>
                </div>
              </div>
              <div style="border-bottom:1px solid #ccc; margin-top:3px;"></div>
            </div>
            '''

            blank_header_template = '<div></div>'

            footer_template = '''
            <div style="width:100%; font-family:Arial,Helvetica,sans-serif; font-size:8px;
                        padding:0 68px; box-sizing:border-box; text-align:right; color:#111;">
              Página <span class="pageNumber"></span> de <span class="totalPages"></span>
            </div>
            '''

            def print_pdf(header_tpl):
                result = send("Page.printToPDF", {
                    "printBackground": True,
                    "preferCSSPageSize": False,
                    "paperWidth": 8.5,
                    "paperHeight": 11,
                    "marginTop": 0.95,
                    "marginBottom": 0.95,
                    "marginLeft": 0.95,
                    "marginRight": 0.95,
                    "displayHeaderFooter": True,
                    "headerTemplate": header_tpl,
                    "footerTemplate": footer_template,
                    "transferMode": "ReturnAsBase64",
                })
                return base64.b64decode(result["result"]["data"])

            pdf_sin_encabezado = print_pdf(blank_header_template)
            pdf_con_encabezado = print_pdf(header_template)

            ws.close()

            doc_portada = fitz.open(stream=pdf_sin_encabezado, filetype="pdf")
            doc_resto = fitz.open(stream=pdf_con_encabezado, filetype="pdf")

            final = fitz.open()
            final.insert_pdf(doc_portada, from_page=0, to_page=0)
            if doc_resto.page_count > 1:
                final.insert_pdf(doc_resto, from_page=1, to_page=doc_resto.page_count - 1)
            final.save(pdf_path)
            final.close()
            doc_portada.close()
            doc_resto.close()

            print(f"OK: {pdf_path}")
        finally:
            proc.terminate()
            try:
                proc.wait(timeout=5)
            except Exception:
                proc.kill()


if __name__ == "__main__":
    main()
