
export async function getWishlist(correo) {
    try {
        const response = await fetch(`http://localhost:8080/wishlist?correo=${encodeURIComponent(correo)}`);
        if (!response.ok) throw new Error("Error en la respuesta del servidor");
        const data = await response.json();
        return data.wishlist || [];
    } catch (err) {
        console.error("Error al obtener wishlist:", err);
        return [];
    }
}

export async function toggleWishlist(correo, id_libro) {
    try {
        const response = await fetch("http://localhost:8080/wishlist/toggle", {
            method: "POST",
            headers: {
                "Content-Type": "application/json"
            },
            body: JSON.stringify({ correo, id_libro })
        });

        if (!response.ok) throw new Error("Error en la respuesta del servidor");
        const data = await response.json();
        return data;
    } catch (err) {
        console.error("Error al modificar wishlist:", err);
        return { status: "error", msg: err.message };
    }
}

export function renderWishlist(libros){
    const container = document.getElementById('wishlist');
    if (!container) return;
    container.innerHTML = "";
    if (libros.length === 0) {
        container.innerHTML = `<p style="padding:20px; font-size:18px;">No tienes libros en tu lista</p>`;
        return;
    }
    libros.forEach(libro => {
        console.log(libro.autor)
        const card = document.createElement("book-card");
        card.setAttribute("id_libro", libro.id_libro);
        card.setAttribute("titulo", libro.titulo);
        card.setAttribute("autor", libro.autor || "Autor desconocido");
        card.setAttribute("anio", libro.anio_publicacion);
        card.setAttribute("editorial", libro.nombre_editorial);
        card.setAttribute("categoria", libro.nom_categoria);
        card.setAttribute("portada", libro.portada);
        container.appendChild(card);
    });
}

document.addEventListener("DOMContentLoaded", async () => {
    const correo = localStorage.getItem("correo");
    if (!correo) {
        document.getElementById("wishlist").innerHTML = "<p>Inicia sesión para ver tu lista</p>";
        return;
    }

    const libros = await getWishlist(correo);
    renderWishlist(libros);
});