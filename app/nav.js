/* ── NAV GLOBAL (topbar + drawer) ──────────────────────────────────
   Se monta de forma síncrona en <div id="app-nav" data-active="...">.
   Debe cargarse ANTES del script propio de cada página, así los
   elementos #user-name / #user-avatar / #badge-errores ya existen
   cuando el init() de esa página los busca. handleLogout() lo sigue
   definiendo cada página (no se toca esa lógica). */
(function () {
  var NAV_HTML =
    '<header class="app-topbar">' +
      '<button class="hamburger-btn" onclick="toggleAppMenu()" aria-label="Abrir menu" aria-expanded="false">&#9776;</button>' +
      '<a href="dashboard.html" class="app-topbar-logo">Digesto<span>.</span></a>' +
    '</header>' +
    '<div class="app-menu-scrim" id="app-menu-scrim" onclick="toggleAppMenu()"></div>' +
    '<aside class="app-drawer" id="app-drawer">' +
      '<a href="dashboard.html" class="drawer-logo">Digesto<span>.</span></a>' +

      '<span class="nav-section">Estudio</span>' +
      '<a class="nav-item" data-page="dashboard" href="dashboard.html"><span class="nav-icon">&#127968;</span> Inicio</a>' +
      '<a class="nav-item" data-page="manuales" href="manuales.html"><span class="nav-icon">&#128214;</span> Manuales</a>' +
      '<a class="nav-item" data-page="alternativas" href="alternativas.html"><span class="nav-icon">&#127919;</span> Practica</a>' +
      '<a class="nav-item" data-page="errores" href="alternativas.html?modelo=errores"><span class="nav-icon">&#128257;</span> Repaso de errores <span class="nav-badge-count" id="badge-errores" data-zero="true">0</span></a>' +

      '<span class="nav-section">Con IA</span>' +
      '<a class="nav-item" data-page="interrogador" href="interrogador.html"><span class="nav-icon">&#128172;</span> Chat IA</a>' +
      '<a class="nav-item" data-page="justiniano" href="justiniano.html"><span class="nav-icon">&#127963;&#65039;</span> Justiniano</a>' +
      '<a class="nav-item" href="#"><span class="nav-icon">&#127908;</span> Interrogacion oral <span class="nav-badge">Pronto</span></a>' +

      '<span class="nav-section">Comunidad</span>' +
      '<a class="nav-item" href="#"><span class="nav-icon">&#127942;</span> Liga <span class="nav-badge">Pronto</span></a>' +

      '<div class="sidebar-footer">' +
        '<div class="user-info">' +
          '<div class="user-avatar" id="user-avatar">?</div>' +
          '<div>' +
            '<div class="user-name" id="user-name">Cargando...</div>' +
            '<div class="user-plan">Plan Esencial</div>' +
          '</div>' +
        '</div>' +
        '<button class="btn-logout" onclick="handleLogout()">Cerrar sesion</button>' +
      '</div>' +
    '</aside>';

  var mount = document.getElementById('app-nav');
  if (!mount) return;
  mount.innerHTML = NAV_HTML;

  var active = mount.getAttribute('data-active');
  if (active) {
    var item = mount.querySelector('.nav-item[data-page="' + active + '"]');
    if (item) item.classList.add('active');
  }

  window.toggleAppMenu = function () {
    document.getElementById('app-drawer').classList.toggle('open');
    document.getElementById('app-menu-scrim').classList.toggle('open');
  };

  window.closeAppMenu = function () {
    document.getElementById('app-drawer').classList.remove('open');
    document.getElementById('app-menu-scrim').classList.remove('open');
  };

  // Cuenta del cuaderno de errores: cliente propio, independiente del
  // `sb` que cada página crea después en su propio script.
  (function loadBadgeErrores() {
    if (typeof supabase === 'undefined') return;
    try {
      var navSb = supabase.createClient(
        'https://byyukzhxhtopojgvgglp.supabase.co',
        'sb_publishable_LOJ2usw9g_DuotcjyU3fJw_mQamm4Gq'
      );
      navSb.auth.getUser().then(function (res) {
        var user = res && res.data && res.data.user;
        if (!user) return;
        return navSb.from('practica_errores')
          .select('id', { count: 'exact', head: true })
          .eq('user_id', user.id)
          .then(function (r) {
            var badge = document.getElementById('badge-errores');
            if (!badge) return;
            var count = r && r.count ? r.count : 0;
            badge.textContent = count;
            badge.setAttribute('data-zero', count ? 'false' : 'true');
          });
      }).catch(function () { /* silencioso: badge no crítico */ });
    } catch (e) { /* silencioso */ }
  })();

  // Tiempo en la página durante la beta (ver
  // scripts/supabase_schema_tiempo_en_pagina.sql y docs/camino-a-beta.md):
  // cliente propio, independiente del `sb` de cada página. Manda un
  // "segmento" (segundos desde el último envío) cada vez que la pestaña se
  // oculta o se cierra, y reinicia el reloj -- así una alumna que deja la
  // pestaña abierta en segundo plano por horas no infla el número, y una
  // que va y viene entre pestañas suma bien el tiempo real que estuvo acá.
  (function medirTiempoEnPagina() {
    if (typeof supabase === 'undefined') return;
    var inicioSegmento = Date.now();
    var pagina = (location.pathname.split('/').pop() || 'index').replace(/\.html$/, '');
    var userId = null;
    var accessToken = null;

    var medSb;
    try {
      medSb = supabase.createClient(
        'https://byyukzhxhtopojgvgglp.supabase.co',
        'sb_publishable_LOJ2usw9g_DuotcjyU3fJw_mQamm4Gq'
      );
    } catch (e) {
      return;
    }
    medSb.auth.getSession().then(function (res) {
      var session = res && res.data && res.data.session;
      if (session) {
        userId = session.user.id;
        accessToken = session.access_token;
      }
    }).catch(function () { /* silencioso: sin sesión, no hay nada que medir */ });

    function enviarSegmento() {
      if (!userId || !accessToken) return;
      var ahora = Date.now();
      var segundos = Math.round((ahora - inicioSegmento) / 1000);
      inicioSegmento = ahora;
      if (segundos < 3) return; // rebotes muy cortos no aportan nada
      try {
        fetch('https://byyukzhxhtopojgvgglp.supabase.co/rest/v1/tiempo_en_pagina', {
          method: 'POST',
          keepalive: true,
          headers: {
            apikey: 'sb_publishable_LOJ2usw9g_DuotcjyU3fJw_mQamm4Gq',
            Authorization: 'Bearer ' + accessToken,
            'Content-Type': 'application/json',
          },
          body: JSON.stringify({ user_id: userId, pagina: pagina, segundos: segundos }),
        }).catch(function () { /* silencioso: no crítico */ });
      } catch (e) { /* silencioso */ }
    }

    document.addEventListener('visibilitychange', function () {
      if (document.hidden) enviarSegmento();
    });
    window.addEventListener('pagehide', enviarSegmento);
  })();
})();
