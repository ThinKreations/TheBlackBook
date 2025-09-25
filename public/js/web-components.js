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

class appMenu extends HTMLElement{
  constructor(){
    super();
    const title=this.getAttribute('title');
    this.innerHTML=`
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
              <a style="color: var(--vino);" href="index.html">Cerrar sesión</a>
          </div>
      </div>
  `;
  const site = window.location.pathname;
  this.querySelectorAll("a[href]").forEach(a=>{
    if (a.getAttribute("href")===site){
      a.classList.add("active");
    }
  })
  }
}
customElements.define("app-menu", appMenu);


class appHeader extends HTMLElement{
  constructor(){
    super();
    this.innerHTML=`
    <header class="header" style="background-image: linear-gradient(to top, rgba(135,135,135,0.8) 0%, rgba(105,105,105,0.95) 100%) ,url('./src/bg2.jpg');">
        <a href="/app/"><img src="./src/tbb.png" height="100px"></a>
        <button class="menu-toggle">☰</button>
    </header>
    `; 
  }
}
customElements.define("app-header",appHeader)

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