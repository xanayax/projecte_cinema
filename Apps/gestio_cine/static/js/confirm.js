function confirmarDelete(id) {

    Swal.fire({
        title: "Estàs segur d'eliminar la pel·lícula?",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#00cc00',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Acceptar',
        cancelButtonText: 'Cancel·lar'
    }).then((result) => {
        if (result.value) {
            // redirigir
            window.location.href = "/eliminar_pelicula/"+id+"/";
        }
    })
}


function confirmarDeleteProducte(id) {

    Swal.fire({
        title: "Estàs segur d'eliminar el producte?",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#00cc00',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Acceptar',
        cancelButtonText: 'Cancel·lar'
    }).then((result) => {
        if (result.value) {
            // redirigir
            window.location.href = "/eliminar_producte/"+id+"/";
        }
    })
}


function confirmarDeleteSessio(id) {

    Swal.fire({
        title: "Estàs segur d'eliminar la sessió?",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#00cc00',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Acceptar',
        cancelButtonText: 'Cancel·lar'
    }).then((result) => {
        if (result.value) {
            // redirigir
            window.location.href = "/eliminar_sessio/"+id+"/";
        }
    })
}



function confirmarDeleteComment(id) {

    Swal.fire({
        title: "Estàs segur d'eliminar el comentari?",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#00cc00',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Acceptar',
        cancelButtonText: 'Cancel·lar'
    }).then((result) => {
        if (result.value) {
            // redirigir
            window.location.href = "/eliminar_comentari/"+id+"/";
        }
    })
}