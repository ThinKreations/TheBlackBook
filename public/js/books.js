export async function getAllBooks(){
    try{
        const login = localStorage.getItem('login');
        if (!login) {
            console.log("xd, no hay login");
            document.writeln("<h1>Debes iniciar sesión</h1><br/><a href='/'>  < Ir a inicio</a>")
            return [];
        }
        const response = await fetch("http://localhost:8080/books");
        if (!response.ok) 
            throw new Error("Error en la respuesta del servidor");
        const data = await response.json();
        return data;
    }catch (err){
        console.error("Error al obtener libros:", err);
        return [];
    }
}

export function renderBooks(libros){
    const catalogo = document.querySelector(".catalog");
    if (!catalogo) return;
    catalogo.innerHTML = "";
    libros.forEach(libro => {
        const card = document.createElement("book-card");
        card.setAttribute("id", libro.id);
        card.setAttribute("titulo", libro.titulo);
        card.setAttribute("autor", libro.autor);
        card.setAttribute("anio", libro.anio);
        card.setAttribute("editorial", libro.editorial);
        card.setAttribute("categoria", libro.categoria);
        card.setAttribute("portada", libro.portada);
        catalogo.appendChild(card);
    });
}

export function filterBooks(libros,query){
    query=query.toLowerCase();
    return libros.filter(libro=>
        libro.titulo.toLowerCase().includes(query)||
        libro.autor.toLowerCase().includes(query)||
        libro.editorial.toLowerCase().includes(query)||
        libro.categoria.toLowerCase().includes(query)
    );
}