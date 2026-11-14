document.addEventListener("DOMContentLoaded", function() {
    const formularioPreparar = document.getElementById("form-preparar");

    if (formularioPreparar) {
        formularioPreparar.addEventListener("submit", function(evento) {
            evento.preventDefault();

            const boton = formularioPreparar.querySelector("button");
            
            boton.innerHTML = '<i data-lucide="loader-2" class="spin" width="18"></i> Procesando...';
            boton.className = "btn btn-secondary";
            boton.disabled = true;
            if(window.lucide) lucide.createIcons();

            fetch(formularioPreparar.action, { method: 'GET' })
            .then(respuesta => {
                if(respuesta.ok) {
                    boton.innerHTML = '<i data-lucide="check" width="18"></i> Ya preparado';
                    boton.style.backgroundColor = "var(--brand-light)";
                    boton.style.color = "var(--brand-dark)";
                    boton.style.border = "none";
                    boton.style.opacity = "1";
                } else {
                    throw new Error("Problema en BD");
                }
            })
            .catch(error => {
                console.error("Error de conexión:", error);
                boton.innerHTML = "Error al preparar";
                boton.style.backgroundColor = "var(--danger)";
                boton.style.color = "white";
            })
            .finally(() => {
                if(window.lucide) lucide.createIcons();
            });
        });
    }
});