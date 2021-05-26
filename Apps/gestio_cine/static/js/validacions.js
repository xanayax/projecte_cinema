
// Validar els camps dels formularis

// pel·ícules
console.log("hola")
function validarPelicules() {
    var preu = document.getElementById('preu');
    console.log(preu)
    if (!isNaN(preu)) {
        alert("El preu ha de ser un numero");
    }
    return false;

}

