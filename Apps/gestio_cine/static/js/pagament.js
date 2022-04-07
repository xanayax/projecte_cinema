// Descarregar el ticket
$('#download').click(function () {
    const resum = document.getElementById("resum");
    console.log(resum);
    html2pdf(resum);
});


// Funció per afegir productes a la comanda
var botoAdd = document.getElementsByClassName("update-cart");

for (i = 0; i < botoAdd.length; i++) {

    // Quan cliquem un dels botons per afegir la comanda de cada producte agafem la id per saber quin hem clicat
    botoAdd[i].addEventListener('click', function () {
        var producteId = this.dataset.product;
        console.log('producteId:', producteId);

        // Després creem un altre element pel formulari amb les dades del producte que hem triat i l'afegim
        $("#form").last().append('<div class="form-group">' +
            '<label for="producte"> ' + producteId + ' </label>' +
            '<div class="inline-form">' +
            '<input id="qnt" class="null card-image form-control col-md-6 preu-producte" type="text" value="1" disabled>' +
            '</div>' +
            '</div>');

        // Creem aquestes variables per calcular el preu total i que es vagi sumant
        var quantProducte = $('#qnt').val();
        var preuProducte = $('#producte-preu').text();
        var preuTotal = $('#preu-total').val();
        console.log(quantProducte);
        console.log(preuProducte);

        var preuXuxes, preuHotDog, preuCrispPet, preuCrispGran;
        var total;

        // Aquí mirem quin producte és per assignar-li el preu i després calcular-lo i posar-lo al formulari
        if (producteId == 'Xuxes') {
            console.log('XUXES');
            preuXuxes = 2.55;
            total = parseFloat(preuXuxes) * parseFloat(quantProducte) + parseFloat(preuTotal);
            total.toFixed(2);
            console.log(total);
            $('#preu-total').val(total + '€');

        } else if (producteId == 'Hot Dog') {
            console.log('Hot Dog');
            preuHotDog = 4.75;
            total = parseFloat(preuHotDog) * parseFloat(quantProducte) + parseFloat(preuTotal);
            total.toFixed(2);
            console.log(total);
            $('#preu-total').val(total + '€');

        } else if (producteId == 'Crispetes grans') {
            console.log('Crispetes grans');
            preuCrispGran = 5.95;
            total = parseFloat(preuCrispGran) * parseFloat(quantProducte) + parseFloat(preuTotal);
            total.toFixed(2);
            console.log(total);
            $('#preu-total').val(total + '€');

        } else if (producteId == 'Crispetes petites') {
            console.log('Crispetes petites');
            preuCrispPet = 3.95;
            total = parseFloat(preuCrispPet) * parseFloat(quantProducte) + parseFloat(preuTotal);
            total.toFixed(2);
            console.log(total);
            $('#preu-total').val(total + '€');
        }
    });
}