import {getAllBooks, renderBooks, filterBooks} from "./books.js";


function checkLogin() {
    const login = localStorage.getItem("login");
    if (!login) {
        console.log("xd, no hay login");
        document.body.innerHTML = `
            <h1>Debes iniciar sesión</h1>
            <br/>
            <a href="/"> &lt; Ir a inicio</a>
        `;
        return false; // corta el flujo
    }
    return true;
}

document.addEventListener("DOMContentLoaded", async () => {
    if (!checkLogin()) return; // si no hay login, ya no sigue

    const libros = await getAllBooks();
    
    function eliminarDuplicados(lista) {
        return Array.from(
            new Set(lista.map(libro => libro.id ||
            (libro.titulo + '|' + libro.autor)))).map(key => lista.find(libro => (libro.id ||
            (libro.titulo + '|' + libro.autor)) === key));
    }
    renderBooks(eliminarDuplicados(libros));
    const searchInput = document.getElementById("searchInput");
    const orderSelect = document.getElementById("orderBy");
    function ordenarLibros(lista, order) {
        const sorted = [...lista];
        if (order === "A - Z") {
            sorted.sort((a, b) => a.titulo.localeCompare(b.titulo));
        } else if (order === "Z - A") {
            sorted.sort((a, b) => b.titulo.localeCompare(a.titulo));
        }
        return sorted;
    }
    function actualizarCatalogo(){
        const query = searchInput.value;
        const order = orderSelect.value;
        let filtrados = filterBooks(libros, query);
        filtrados = eliminarDuplicados(filtrados);
        filtrados = ordenarLibros(filtrados, order);
        renderBooks(filtrados); 
    }
    searchInput.addEventListener("input", actualizarCatalogo);
    orderSelect.addEventListener("change", actualizarCatalogo);
});

