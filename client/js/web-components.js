//Chavos, aquí estoy manejando "Web components", básicamente son componentes personalizados reutilizables en las demás páginas
// de modo que, en lugar de poner todo el HTML, sólo jalan el script y ponen las etiquetas HTML personalizadas

class AppHeader extends HTMLElement {
  constructor() {
    super();
    const imgSrc = this.getAttribute('img-src'); // En cada app-header vamos a tener q definir la ruta del logo xd
    this.innerHTML = `
    <header class="header">
        <img src="${imgSrc}" height="100px">
        <a id="btnLogIn" href="../login.html">Acceder</span></a>
    </header>
    `;
  }
}

customElements.define("app-header", AppHeader);

class AppMenuUser extends HTMLElement {
  constructor() {
    super();
    this.innerHTML = `
    <nav class="menu">
        <a href="index.html">Inicio</a>
        <a href="prestamos.html">Prestamos</a>
        <a href="multas.html">Multas</a>
        <a href="contacto.html">Contacto</a>
    </nav>
    `;
  }
}

customElements.define("app-menu-user", AppMenuUser);