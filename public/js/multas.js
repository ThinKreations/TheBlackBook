async function getMultasUsuario(correo) {
    if (!correo) return [];
    try {
        const response = await fetch("http://localhost:8080/multas", {
            method: "POST",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify({ correo })
        });

        if (!response.ok) throw new Error("Error en la respuesta del servidor");
        const data = await response.json();
        return data.multas ?? [];
    } catch (err) {
        console.error("Error al obtener multas:", err);
        return [];
    }
}

function renderMultas(multas) {
    const tabla = document.getElementById("multasTable");
    if (!tabla) return;

    tabla.innerHTML = `
        <tr>
            <th>ID</th>
            <th>Monto</th>
            <th>Fecha de emisión</th>
            <th>Fecha de pago</th>
            <th>Estado</th>
        </tr>
    `;
    if (!multas.length) {
        const row = document.createElement("tr");
        row.innerHTML = `<td colspan="5" style="text-align:center;">No hay multas</td>`;
        tabla.appendChild(row);
        return;
    }

    multas.forEach(m => {
        const row = document.createElement("tr");
        console.log(m)

        let estado = "";
        let fechaPagoHTML = "";

        if (m.Estatus === 0) {
            estado = "SIN PAGAR";
            fechaPagoHTML = `<td style="text-align: center;"></td>`;
        } else if (m.Estatus === 1) {
            estado = "PAGADO";
            fechaPagoHTML = `<td style="text-align: center;">${m.fecha_pago ?? "-"}</td>`;
        }

        row.innerHTML = `
            <td style="text-align: center; color:gray;">${m.Multa}</td>
            <td style="text-align: center; font-weight:bold">$${m.Monto_actual_multa ?? m.Valor_base_multa}</td>
            <td style="text-align: center;">${m.Fecha_emision_multa}</td>
            ${fechaPagoHTML}
            <td style="text-align: center;">${estado}</td>
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

    let multas = await getMultasUsuario(correo);
    console.log(multas)
    renderMultas(multas);
});