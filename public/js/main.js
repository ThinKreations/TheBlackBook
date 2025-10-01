import { getAllBooks, renderBooks, filterBooks } from "./books.js";

function checkLogin() {
    if (!localStorage.getItem("login")) {
        document.body.innerHTML = `
            <h1>Debes iniciar sesión</h1>
            <a href="/"> &lt; Ir a inicio</a>
        `;
        return false;
    }
    return true;
}

document.addEventListener("DOMContentLoaded", async () => {
    if (!checkLogin()) return;

    let libros = await getAllBooks();

    const searchInput = document.getElementById("searchInput");
    const orderSelect = document.getElementById("orderBy");

    function eliminarDuplicados(lista) {
        return Array.from(new Set(lista.map(l => l.id))).map(id => lista.find(l => l.id === id));
    }

    function ordenarLibros(lista, order) {
        const sorted = [...lista];
        if (order === "A - Z") sorted.sort((a, b) => a.titulo.localeCompare(b.titulo));
        else if (order === "Z - A") sorted.sort((a, b) => b.titulo.localeCompare(a.titulo));
        return sorted;
    }

    function actualizarCatalogo() {
        let filtrados = filterBooks(libros, searchInput.value);
        filtrados = eliminarDuplicados(filtrados);
        filtrados = ordenarLibros(filtrados, orderSelect.value);
        renderBooks(filtrados);
    }

    searchInput.addEventListener("input", actualizarCatalogo);
    orderSelect.addEventListener("change", actualizarCatalogo);

    renderBooks(eliminarDuplicados(libros));
});