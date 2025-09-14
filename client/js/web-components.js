//Chavos, aquí estoy manejando "Web components", básicamente son componentes personalizados reutilizables en las demás páginas
// de modo que, en lugar de poner todo el HTML, sólo jalan el script y ponen las etiquetas HTML personalizadas

let isLogged = true; //este luego lo hacemos dinamico

class AppHeader extends HTMLElement {
  constructor(){
    super();
    const imgSrc = this.getAttribute('img-src');
    this.innerHTML = `
      <header class="header">
        <img src="${imgSrc}" height="75px">
      </header>
    `;
  }
}
customElements.define("app-header", AppHeader);

class AppMenuUser extends HTMLElement {
  constructor(){
    super();
    this.innerHTML = `
      <nav class="menu">
        <a href="index.html">Inicio</a>
        <a href="prestamos.html">Préstamos</a>
        <a href="multas.html">Multas</a>
        <a href="contacto.html">Contacto</a>
      </nav>
    `;
  }
}
customElements.define("app-menu-user", AppMenuUser);

class AppLogin extends HTMLElement {
  constructor(){
    super();
    this.innerHTML = `
      <form class="formLogin">
        <center>
          <h2 style="margin:0">Únete a Black Book</h2>
          <input class="inputLogin" placeholder="Correo">
          <input class="inputLogin" placeholder="Contraseña">
          <button type="button" class="logButton">Acceder</button>
          <a href="signin.html"><p><b>Regístrate aquí</b></p></a>
        </center>
      </form>
    `;
  }
}
customElements.define("app-login", AppLogin);

class MainApp extends HTMLElement {
  constructor(){
    super();
    this.render();
  }

  render(){
    this.innerHTML = `
      <div class="mainContainer">
        ${isLogged ? "<app-menu-user></app-menu-user>" : ""}
        <div class="app">
          <div class="asideL">
            ${isLogged 
              ? "<div></div><div></div><div><button id='logout'>Cerrar Sesión</button></div>" 
              : "<div></div><app-login></app-login><div></div>"
            }
          </div>
        </div>
      </div>
    `;

    if (!isLogged) {
      const btn = this.querySelector(".logButton");
      btn?.addEventListener("click", () => {
        isLogged = true;
        this.render();
      });
    } else {
      const logoutBtn = this.querySelector("#logout");
      logoutBtn?.addEventListener("click", () => {
        isLogged = false;
        this.render();
      });
    }
  }
}
customElements.define("main-app", MainApp);
