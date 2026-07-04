document.addEventListener("DOMContentLoaded", function() {
    const formularioPreparar = document.getElementById("form-preparar");

    if (formularioPreparar) {
        formularioPreparar.addEventListener("submit", function(evento) {
            evento.preventDefault();

            const boton = formularioPreparar.querySelector("button");
            
            boton.textContent = "Ya preparé este jugo";
            boton.className = "btn-secondary";
            boton.disabled = true;

            fetch(formularioPreparar.action, {
                method: 'GET',
            })
            .then(respuesta => {
                if(!respuesta.ok) {
                    console.error("Hubo un problema al guardar en la base de datos.");
                }
            })
            .catch(error => {
                console.error("Error de conexión:", error);
            });
        });
    }
});