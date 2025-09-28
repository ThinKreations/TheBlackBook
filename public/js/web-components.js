//Chavos, aquí estoy manejando "Web components", básicamente son componentes personalizados reutilizables en las demás páginas
// de modo que, en lugar de poner todo el HTML, sólo jalan el script y ponen las etiquetas HTML personalizadas

let isLogged = "true"; 

class IndexHeader extends HTMLElement {
  constructor(){
    super();
    const src = this.getAttribute('src');
    const height=this.getAttribute('height')
    const link = this.getAttribute('link') || '';
    this.innerHTML = `
      <header class="header">
        <a href="${link}"><img src="${src}" height="${height}"></a>
      </header>
    `;
  }
}
customElements.define("index-header", IndexHeader);

class appMenu extends HTMLElement {
  constructor() {
    super();
    const title = this.getAttribute('title');
    this.innerHTML = `
      <div class="menu">
          <div class="menu-btnr">
              <a href="buscador.html">- Inicio -</a>
              <a href="prestamos.html">- Prestamos -</a>
              <a href="multas.html">- Multas -</a>
              <a href="wishlist.html">- Deseos -</a>
          </div>
          <div class="menu-btnr">
              <a>Privacidad</a>
              <a>Contacto</a>
              <a style="color: var(--vino);" href="index.html" id="logoutBtn">Cerrar sesión</a>
          </div>
      </div>
    `;

    const site = window.location.pathname;
    this.querySelectorAll("a[href]").forEach(a => {
      if (a.getAttribute("href") === site) {
        a.classList.add("active");
      }
    });
  }

  connectedCallback() {
    const logoutBtn = this.querySelector("#logoutBtn");
    if (logoutBtn) {
      logoutBtn.addEventListener("click", async (e) => {
        e.preventDefault();
          localStorage.clear()
        try {
          await fetch("http://localhost:8080/logout", {
            method: "POST",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify({})
          });
          window.location.href = "index.html";
        } catch (error) {
          console.error("Error al cerrar sesión:", error);
          alert("Ocurrió un error al cerrar sesión.");
        }
      });
    }
  }
}
customElements.define("app-menu", appMenu);

class appHeader extends HTMLElement{
  constructor(){
    super();
    this.innerHTML=`
    <header class="header" style="background-image: linear-gradient(to top, rgba(135,135,135,0.8) 0%, rgba(105,105,105,0.95) 100%) ,url('./src/bg2.jpg');">
        <a href="public/"><img src="./src/tbb.png" height="100px"></a>
        <button class="menu-toggle">☰</button>
    </header>
    `; 
  }
}
customElements.define("app-header",appHeader)

class BookCard extends HTMLElement {
  constructor() {
    super();
  }

  connectedCallback() {
    const id = this.getAttribute("id") || "libro";
    const titulo = this.getAttribute("titulo") || "Título desconocido";
    const autor = this.getAttribute("autor") || "Autor desconocido";
    const anio = this.getAttribute("anio") || "-";
    const editorial = this.getAttribute("editorial") || "-";
    const categoria = this.getAttribute("categoria") || "-";
    const portada = this.getAttribute("portada") || titulo;

    this.innerHTML = `
      <div class="card" id="${id}">
        <div class="portada-wrapper">
          <img src="${portada}" class="portada" id="portada" alt="${titulo}">
        </div>
        <div class="data" id="libro-data">
          <span style="font-size: 20px;" id="titulo">${titulo}</span>
          <span id="autor"><b>${autor}</b></span>
          <span id="anio">${anio}</span>
          <span id="editorial">${editorial}</span>
          <span id="categoria">${categoria}</span>
        </div>
        <div class="libroBtnContainer">
          <button class="libroBtn"><span class="material-icons">add</span></button>
          <div class="labelOculto">Solicitar Préstamo</div>
          <button class="libroBtn"><span class="material-icons">list</span></button>
          <div class="labelOculto">Agregar a tu lista</div>
        </div>
      </div>
    `;
  }
}

customElements.define("book-card", BookCard);


document.addEventListener("DOMContentLoaded", ()=>{
  const toggleBtn = document.querySelector(".menu-toggle");
  const menu = document.querySelector("app-menu .menu");
  if (toggleBtn && menu){
    toggleBtn.addEventListener("click", (e)=>{
      e.preventDefault();
      menu.classList.toggle("show");
    });
  }
});