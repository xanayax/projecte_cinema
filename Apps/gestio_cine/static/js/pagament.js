// Descarregar el ticket
$('#download').click(function () {
    const resum = document.getElementById("resum");
    console.log(resum);
    html2pdf(resum);
});

var contXuxes = 0;
var contHotDog = 0;
var contCrispPet = 0;
var contCrispGran = 0;

// Funció per afegir productes a la comanda
var botoAdd = document.getElementsByClassName("update-cart");

for (i = 0; i < botoAdd.length; i++) {

    // Quan cliquem un dels botons per afegir la comanda de cada producte agafem la id per saber quin hem clicat
    botoAdd[i].addEventListener('click', function () {
        var producteId = this.dataset.product;
        console.log('producteId:', producteId);

        // Creem aquestes variables per calcular el preu total i que es vagi sumant

        var preuTotal = $('#preu-total').val();
        var total;

        // xuxes
        if (producteId == 'Xuxes' && contXuxes >= 1) {
            console.log('ara aquí');
            contXuxes++;
            $('#qntXuxes').val(contXuxes);
            console.log(contXuxes);

            console.log('XUXES');
            preuXuxes = 2.55;
            total = parseFloat(preuXuxes) + parseFloat(preuTotal);
            total.toFixed(2);
            console.log(parseFloat(total));
            console.log(preuTotal);
            $('#preu-total').val(total + '€');

        } else if (producteId == 'Xuxes' && contXuxes == 0) {
            console.log('aqui');
            $("#form").last().append('<div class="form-group">' +
                '<label for="producte"> ' + producteId + ' </label>' +
                '<div class="inline-form">' +
                '<input id="qntXuxes" class="null card-image form-control col-md-6 preu-producte" type="text" value="1" disabled>' +
                '</div>' +
                '<button class="btn btn-outline-secondary addXuxe">+</button>' +
                '<button class="btn btn-outline-secondary removeXuxe">-</button>' +
                '</div>');
            console.log(contXuxes);
            contXuxes++;
            console.log(contXuxes);

            sumarProducte();

        // hot dog
        } else if (producteId == 'Hot Dog' && contHotDog >= 1) {
            console.log('ara aquí');
            contHotDog++;
            $('#qntHotDog').val(contHotDog);
            console.log(contHotDog);

            //cridem a la funció sumar producte definida a sota
            //sumarProducte();
            console.log('Hot Dog');
            preuHotDog = 4.75;
            total = parseFloat(preuHotDog) + parseFloat(preuTotal);
            total.toFixed(2);
            console.log(total);
            $('#preu-total').val(total + '€');

        } else if (producteId == 'Hot Dog' && contHotDog == 0) {
            console.log('aqui');
            $("#form").last().append('<div class="form-group">' +
                '<label for="producte"> ' + producteId + ' </label>' +
                '<div class="inline-form">' +
                '<input id="qntHotDog" class="null card-image form-control col-md-6 preu-producte" type="text" value="1" disabled>' +
                '</div>' +
                '<button class="btn btn-outline-secondary addHotDog">+</button>' +
                '<button class="btn btn-outline-secondary removeHotDog">-</button>' +
                '</div>');
            console.log(contHotDog);
            contHotDog++;
            console.log(contHotDog);
            sumarProducte();

        // crispetes grans
        } else if (producteId == 'Crispetes grans' && contCrispGran >= 1) {
            console.log('ara aquí');
            contCrispGran++;
            $('#qntCrispGran').val(contCrispGran);
            console.log(contCrispGran);

            //cridem a la funció sumar producte definida a sota
            //sumarProducte();
            console.log('Crispetes grans');
            preuCrispGran = 5.95;
            total = parseFloat(preuCrispGran) + parseFloat(preuTotal);
            total.toFixed(2);
            console.log(total);
            $('#preu-total').val(total + '€');

        } else if (producteId == 'Crispetes grans' && contCrispGran == 0) {
            console.log('aqui');
            $("#form").last().append('<div class="form-group">' +
                '<label for="producte"> ' + producteId + ' </label>' +
                '<div class="inline-form">' +
                '<input id="qntCrispGran" class="null card-image form-control col-md-6 preu-producte" type="text" value="1" disabled>' +
                '</div>' +
                '<button class="btn btn-outline-secondary addCrispGran">+</button>' +
                '<button class="btn btn-outline-secondary removeCrispGran">-</button>' +
                '</div>');
            console.log(contCrispGran);
            contCrispGran++;
            console.log(contCrispGran);
            sumarProducte();

        } else if (producteId == 'Crispetes petites' && contCrispPet >= 1) {
            console.log('ara aquí');
            contCrispPet++;
            $('#qntCrispPet').val(contCrispPet);
            console.log(contCrispPet);

            //cridem a la funció sumar producte definida a sota
            //sumarProducte();
            console.log('Crispetes petites');
            preuCrispPet = 3.95;
            total = parseFloat(preuCrispPet) + parseFloat(preuTotal);
            total.toFixed(2);
            console.log(total);
            $('#preu-total').val(total + '€');

        } else if (producteId == 'Crispetes petites' && contCrispPet == 0) {
            console.log('aqui');
            $("#form").last().append('<div class="form-group">' +
                '<label for="producte"> ' + producteId + ' </label>' +
                '<div class="inline-form">' +
                '<input id="qntCrispPet" class="null card-image form-control col-md-6 preu-producte" type="text" value="1" disabled>' +
                '</div>' +
                '<button class="btn btn-outline-secondary addCrispPet">+</button>' +
                '<button class="btn btn-outline-secondary removeCrispPet">-</button>' +
                '</div>');
            console.log(contCrispPet);
            contCrispPet++;
            console.log(contCrispPet);
            sumarProducte();
        }

        var preuXuxes, preuHotDog, preuCrispPet, preuCrispGran;

        //botó per afegir 1 element
        /*
        var addXuxe = $(".addXuxe");
        var addHotDog = $(".addHotDog");
        var addCrispGran = $(".addCrispGran");
        var addCrispPet = $(".addCrispPet");

        addXuxe.click(function (e) {
            e.preventDefault();
            contXuxes++;
            $('#qntXuxes').val(contXuxes);
            console.log(contXuxes);

            console.log('XUXES');
            preuXuxes = 2.55;
            total = parseFloat(preuXuxes) * parseFloat(contXuxes) + parseFloat(preuTotal);
            total.toFixed(2);
            console.log(parseFloat(total));
            $('#preu-total').val(total + '€');
        });

        addHotDog.click(function (e) {
            e.preventDefault();
            contHotDog++;
            $('#qntXuxes').val(contHotDog);
            console.log(contHotDog);

            //cridem a la funció sumar producte definida a sota
            sumarProducte();
        });

        addCrispGran.click(function (e) {
            e.preventDefault();
            contCrispGran++;
            $('#qntXuxes').val(contCrispGran);
            console.log(contCrispGran);

            //cridem a la funció sumar producte definida a sota
            sumarProducte();
        });

        addCrispPet.click(function (e) {
            e.preventDefault();
            contCrispPet++;
            $('#qntXuxes').val(contCrispPet);
            console.log(contCrispPet);

            //cridem a la funció sumar producte definida a sota
            sumarProducte();
        });

         */


        // botó per esborrar 1 element
        var removeXuxe = $(".removeXuxe");
        var removeHotDog = $(".removeHotDog");
        var removeCrispGran = $(".removeCrispGran");
        var removeCrispPet = $(".removeCrispPet");

        removeXuxe.click(function (e) {
            console.log('contXuxes' + contXuxes);
            e.preventDefault();
            //contXuxes--;
            $('#qntXuxes').val(contXuxes);
            restarProducte();
            preuXuxes = 2.55;
            total = parseFloat(preuTotal) - parseFloat(preuXuxes);
            total.toFixed(2);
            console.log(total);
            $('#preu-total').val(total + '€');

            if (contXuxes < 1) {
                $(this).parent('div').remove();
            }
        });

        removeHotDog.click(function (e) {
            e.preventDefault();
            contHotDog--;
            restarProducte();
            $('#qntHotDog').val(contHotDog);
            if (contHotDog < 1) {
                $(this).parent('div').remove();
            }
        });

        removeCrispGran.click(function (e) {
            e.preventDefault();
            contCrispGran--;
            restarProducte();
            $('#qntCrispGran').val(contCrispGran);
            if (contCrispGran < 1) {
                $(this).parent('div').remove();
            }
        });

        removeCrispPet.click(function (e) {
            e.preventDefault();
            contCrispPet--;
            restarProducte();
            $('#qntCrispPet').val(contCrispPet);
            if (contCrispPet < 1) {
                $(this).parent('div').remove();
            }
        });

        // Aquí mirem quin producte és per assignar-li el preu i després calcular-lo i posar-lo al formulari
        function sumarProducte() {

            if (producteId == 'Xuxes') {
                console.log('XUXES');
                preuXuxes = 2.55;
                total = parseFloat(preuXuxes) * parseFloat(contXuxes) + parseFloat(preuTotal);
                total.toFixed(2);
                console.log(parseFloat(total));
                $('#preu-total').val(total + '€');

            } else if (producteId == 'Hot Dog') {
                console.log('Hot Dog');
                preuHotDog = 4.75;
                total = parseFloat(preuHotDog) * parseFloat(contHotDog) + parseFloat(preuTotal);
                total.toFixed(2);
                console.log(total);
                $('#preu-total').val(total + '€');

            } else if (producteId == 'Crispetes grans') {
                console.log('Crispetes grans');
                preuCrispGran = 5.95;
                total = parseFloat(preuCrispGran) * parseFloat(contCrispGran) + parseFloat(preuTotal);
                total.toFixed(2);
                console.log(total);
                $('#preu-total').val(total + '€');

            } else if (producteId == 'Crispetes petites') {
                console.log('Crispetes petites');
                preuCrispPet = 3.95;
                total = parseFloat(preuCrispPet) * parseFloat(contCrispPet) + parseFloat(preuTotal);
                total.toFixed(2);
                console.log(total);
                $('#preu-total').val(total + '€');
            }
        }

        function restarProducte() {

            if (producteId == 'Xuxes') {
                console.log('XUXES');
                preuXuxes = 2.55;
                total = parseFloat(preuTotal) - parseFloat(preuXuxes);
                total.toFixed(2);
                console.log(total);
                $('#preu-total').val(total + '€');

            } else if (producteId == 'Hot Dog') {
                console.log('Hot Dog');
                preuHotDog = 4.75;
                total = parseFloat(preuTotal) - parseFloat(preuHotDog);
                total.toFixed(2);
                console.log(total);
                $('#preu-total').val(total + '€');

            } else if (producteId == 'Crispetes grans') {
                console.log('Crispetes grans');
                preuCrispGran = 5.95;
                total = parseFloat(preuTotal) - parseFloat(preuCrispGran);
                total.toFixed(2);
                console.log(total);
                $('#preu-total').val(total - '€');

            } else if (producteId == 'Crispetes petites') {
                console.log('Crispetes petites');
                preuCrispPet = 3.95;
                total = parseFloat(preuTotal) - parseFloat(preuCrispPet) ;
                total.toFixed(2);
                console.log(total);
                $('#preu-total').val(total - '€');
            }
        }

    });
}