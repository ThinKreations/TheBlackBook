document.addEventListener("DOMContentLoaded", ()=>{
    const form = document.querySelector(".formLogin");

    form.addEventListener("submit", async function(e){
        e.preventDefault();
        const correo = document.getElementById("email");
        const password = document.getElementById("pass");
        if (!correo.checkValidity()){
            alert("Ingresa un correo válido.");
            return;
        }
        if (!password.value){
            alert("Ingresa tu contraseña.");
            return;
        }
        const loginData = {
            correo: correo.value,
            password: password.value
        };
        try{
            const response = await fetch("http://localhost:8080/login",{
                method: "POST",
                headers: { "Content-Type": "application/json" },
                body: JSON.stringify(loginData)
            });
            if (!response.ok) throw new Error("Error en el envío");
            const result = await response.json();
            if (result.status === "ok"){
                localStorage.setItem("login", result.login);
                localStorage.setItem("password", result.password);
                form.reset();
                window.location.href = "buscador.html"; 
                
            }else{
                alert(result.msg || "Usuario o contraseña incorrectos.");
            }
        }catch (error){
            console.error(error);
            alert("Ocurrió un error al iniciar sesión. Intenta nuevamente.");
        }
    });
});