document.addEventListener("DOMContentLoaded", () => {
    const form = document.getElementById("formRegistro");
    form.addEventListener("submit", async function(e) {
        e.preventDefault();
        const correo = document.getElementById("correo");
        const celular = document.getElementById("celular");
        const cp = document.getElementById("cp");
        if (!correo.checkValidity()){
            alert("Ingresa un correo válido.");
            return;
        }
        if(celular.value && !/^[0-9]{10}$/.test(celular.value)){
            alert("El celular debe tener 10 dígitos.");
            return;
        }
        if (cp.value && !/^[0-9]{5}$/.test(cp.value)) {
            alert("El C.P. debe tener 5 dígitos.");
            return;
        }

        const formData = {
            nombre: document.getElementById("nombre").value,
            apellidoP: document.getElementById("apellidoP").value,
            apellidoM: document.getElementById("apellidoM").value,
            correo: correo.value,
            celular: celular.value,
            calle: document.getElementById("calle").value,
            num_ext: document.getElementById("num_ext").value,
            colonia: document.getElementById("colonia").value,
            alcaldia: document.getElementById("alcaldia").value,
            cp: cp.value,
            sexo: document.getElementById("sexo").value
        };

        try {
            const response = await fetch("http://localhost:8080/signup", {
                method: "POST",
                headers: { "Content-Type": "application/json" },
                body: JSON.stringify(formData)
            });
            
            if (!response.ok) throw new Error("Error en el envío");
            
            alert("Correo enviado, no olvides revisar SPAM")
            const result = await response.json();
            console.log(result);
            form.reset();
        } catch (error) {
            console.error(error);
            alert("Ocurrió un error al registrar. Intenta nuevamente.");
        }
    });
});