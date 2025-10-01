function checkLogin() {
    const login = localStorage.getItem("login");
    if (!login) {
        console.log("xd, no hay login");
        document.body.innerHTML = `
            <h1>Debes iniciar sesión</h1>
            <br/>
            <a href="/"> &lt; Ir a inicio</a>
        `;
        return false;
    }
    return true;
}

export async function solicitarPrestamo(id_libro) {
    const correo = localStorage.getItem("correo");
    if (!correo) {
        alert("Debes iniciar sesión para solicitar un préstamo");
        return;
    }

    try {
        const response = await fetch("http://localhost:8080/prestamos/add", {
            method: "POST",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify({ correo, id_libro })
        });

        if (!response.ok) throw new Error("Error en la solicitud");

        const data = await response.json();
        if (data.status === "ok") {
            alert(`Préstamo solicitado.`);
        } else {
            alert(`No se pudo solicitar el préstamo: ${data.msg}`);
        }
    } catch (err) {
        console.error("Error al solicitar préstamo:", err);
        alert("Ocurrió un error al solicitar el préstamo");
    }
}

export async function getPrestamosUsuario(correo) {
    if (!correo) return [];
    try {
        const response = await fetch("http://localhost:8080/prestamos", {
            method: "POST",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify({ correo })
        });

        if (!response.ok) throw new Error("Error en la respuesta del servidor");
        
        const data = await response.json();
        return data.prestamos ?? [];
    } catch (err) {
        console.error("Error al obtener préstamos:", err);
        return [];
    }
}

export function renderPrestamos(prestamos) {
    const tabla = document.querySelector(".prestamosTable");
    if (!tabla) return;

    tabla.innerHTML = `
        <tr>
            <th style="width: 40%;">Libro</th>
            <th>F. Préstamo</th>
            <th>F. Límite</th>
            <th>F. Entrega</th>
        </tr>
    `;

    if (!prestamos.length) {
        const row = document.createElement("tr");
        row.innerHTML = `<td colspan="4" style="text-align:center;">No hay préstamos</td>`;
        tabla.appendChild(row);
        return;
    }
    console.log(prestamos)
    prestamos.forEach(p => {
        const row = document.createElement("tr");
        row.innerHTML = `
            <td>${p.titulo}</td>
            <td style="text-align: center;">${p.fecha_prestamo}</td>
            <td style="text-align: center;">${p.fecha_lim_dev}</td>
            <td style="text-align: center;">${p.fecha_devolucion ?? "-"}</td>
        `;
        tabla.appendChild(row);
    });
}

document.addEventListener("DOMContentLoaded", async () => {
    const correo = localStorage.getItem("correo");

    if (!correo) {
        console.log("No hay usuario logueado");
        return;
    }
    let prestamos = await getPrestamosUsuario(correo);
    renderPrestamos(prestamos);
});
