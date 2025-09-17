//Chavos, aquí estoy manejando "Web components", básicamente son componentes personalizados reutilizables en las demás páginas
// de modo que, en lugar de poner todo el HTML, sólo jalan el script y ponen las etiquetas HTML personalizadas

let isLogged = "true"; 

class IndexHeader extends HTMLElement {
  constructor(){
    super();
    const src = this.getAttribute('src');
    const height=this.getAttribute('height')
    this.innerHTML = `
      <header class="header">
        <a href="/app/"><img src="${src}" height="${height}"></a>
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
              <a href="/app/index.html">- Inicio -</a>
              <a href="/app/prestamos.html">- Prestamos -</a>
              <a href="/app/multas.html">- Multas -</a>
              <a href="/app/wishlist.html">- Lista -</a>
          </div>
          <div class="menu-btnr">
              <a>Contacto</a>
              <a style="color: var(--vino);" href="/">Cerrar sesión</a>
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


