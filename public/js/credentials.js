document.addEventListener("DOMContentLoaded", () => {
    const form = document.querySelector(".formLogin");

    const inputCorreo = document.getElementById("fEmail");

    const inputPass = document.getElementById("pass");   // contraseña actual
    const inputNPass = document.getElementById("nPass"); // nueva contraseña
    const inputCPass = document.getElementById("cPass"); // confirmación

    if (inputCorreo) {
        form.addEventListener("submit", async (e) => {
        e.preventDefault();

        const correo = inputCorreo.value.trim();
        if (!correo) {
            alert("Por favor, ingresa tu correo electrónico.");
            return;
        }

        const regexCorreo = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        if (!regexCorreo.test(correo)) {
            alert("Formato de correo no válido.");
            return;
        }

        try {
            const response = await fetch("http://localhost:8080/forgotPass", {
            method: "POST",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify({ correo }),
            });

            const result = await response.json();
            if (result.status === "ok") {
            alert("Se ha enviado una contraseña temporal a tu correo.");
            inputCorreo.value = "";
            } else {
            alert(`Error: ${result.msg}`);
            }
        } catch (error) {
            console.error(error);
            alert("Ocurrió un error al enviar la solicitud. Intenta más tarde.");
        }
        });
    }

    if (inputPass && inputNPass && inputCPass) {
        form.addEventListener("submit", async (e) => {
        e.preventDefault();

        const correo = localStorage.getItem("correo");
        const storedPass = localStorage.getItem("password");
        const pass = inputPass.value.trim();
        const nPass = inputNPass.value.trim();
        const cPass = inputCPass.value.trim();

        if (!correo) {
            alert("No se encontró sesión activa. Inicia sesión nuevamente.");
            return;
        }

        if (!pass || !nPass || !cPass) {
            alert("Por favor, completa todos los campos.");
            return;
        }

        if (pass !== storedPass) {
            alert("La contraseña actual no coincide con tu contraseña guardada.");
            return;
        }

        if (nPass !== cPass) {
            alert("Las contraseñas nuevas no coinciden.");
            return;
        }

        try {
            const response = await fetch("http://localhost:8080/changePass", {
            method: "POST",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify({
                correo,
                pass_actual: pass,
                pass_nueva: nPass,
            }),
            });

            const result = await response.json();

            if (result.status === "ok") {
            alert("Contraseña actualizada correctamente.");
            localStorage.setItem("password", nPass);
            inputPass.value = "";
            inputNPass.value = "";
            inputCPass.value = "";
            } else {
            alert(`Error: ${result.msg}`);
            }
        } catch (error) {
            console.error(error);
            alert("Ocurrió un error al cambiar la contraseña.");
        }
        });
    }
});