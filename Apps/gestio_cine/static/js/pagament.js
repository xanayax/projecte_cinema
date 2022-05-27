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

// preus
var preuXuxes = 2.55;
var preuHotDog = 4.75;
var preuCrispGran = 6.95;
var preuCrispPet = 3.95;

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
        var primeraXuxe, primerHotDog, primeresCrispGran, primeresCrispPet;

        // xuxes
        if (producteId == 'Xuxes' && contXuxes >= 1) {
            primeraXuxe = false;
            console.log('ara aquí');
            contXuxes++;
            $('#qntXuxes').val(contXuxes);
            console.log(contXuxes);

            console.log('XUXES');
            total = parseFloat(preuXuxes) + parseFloat(preuTotal);
            total.toFixed(2);
            console.log(parseFloat(total));
            console.log(preuTotal);
            $('#preu-total').val(total + '€');

        } else if (producteId == 'Xuxes' && contXuxes == 0) {
            primeraXuxe = true;
            console.log('aqui');
            $("#form").last().append('<div class="form-group">' +
                '<label for="producte"> ' + producteId + ' </label>' +
                '<div class="inline-form">' +
                '<input id="qntXuxes" class="null card-image form-control col-md-6 preu-producte" type="text" value="1" disabled>' +
                '</div>' +
                '<button class="btn btn-outline-secondary removeXuxe">-</button>' +
                '</div>');
            console.log(contXuxes);
            contXuxes++;
            console.log(contXuxes);

            sumarProducte();

        // hot dog
        } else if (producteId == 'Hot Dog' && contHotDog >= 1) {

            primerHotDog = false;
            console.log('ara aquí');
            contHotDog++;
            $('#qntHotDog').val(contHotDog);
            console.log(contHotDog);

            console.log('Hot Dog');
            total = parseFloat(preuHotDog) + parseFloat(preuTotal);
            total.toFixed(2);
            console.log(total);
            $('#preu-total').val(total + '€');

        } else if (producteId == 'Hot Dog' && contHotDog == 0) {
            primerHotDog = true;
            console.log('aqui');
            $("#form").last().append('<div class="form-group">' +
                '<label for="producte"> ' + producteId + ' </label>' +
                '<div class="inline-form">' +
                '<input id="qntHotDog" class="null card-image form-control col-md-6 preu-producte" type="text" value="1" disabled>' +
                '</div>' +
                '<button class="btn btn-outline-secondary removeHotDog">-</button>' +
                '</div>');
            console.log(contHotDog);
            contHotDog++;
            console.log(contHotDog);
            sumarProducte();

        // crispetes grans
        } else if (producteId == 'Crispetes grans' && contCrispGran >= 1) {

            primeresCrispGran = false;
            console.log('ara aquí');
            contCrispGran++;
            $('#qntCrispGran').val(contCrispGran);
            console.log(contCrispGran);

            console.log('Crispetes grans');
            total = parseFloat(preuCrispGran) + parseFloat(preuTotal);
            total.toFixed(2);
            console.log(total);
            $('#preu-total').val(total + '€');

        } else if (producteId == 'Crispetes grans' && contCrispGran == 0) {
            primeresCrispGran = true;
            console.log('aqui');
            $("#form").last().append('<div class="form-group">' +
                '<label for="producte"> ' + producteId + ' </label>' +
                '<div class="inline-form">' +
                '<input id="qntCrispGran" class="null card-image form-control col-md-6 preu-producte" type="text" value="1" disabled>' +
                '</div>' +
                '<button class="btn btn-outline-secondary removeCrispGran">-</button>' +
                '</div>');
            console.log(contCrispGran);
            contCrispGran++;
            console.log(contCrispGran);
            sumarProducte();

        } else if (producteId == 'Crispetes petites' && contCrispPet >= 1) {
            primeresCrispPet = false;
            console.log('ara aquí');
            contCrispPet++;
            $('#qntCrispPet').val(contCrispPet);
            console.log(contCrispPet);
            console.log('Crispetes petites');
            total = parseFloat(preuCrispPet) + parseFloat(preuTotal);
            total.toFixed(2);
            console.log(total);
            $('#preu-total').val(total + '€');

        } else if (producteId == 'Crispetes petites' && contCrispPet == 0) {
            primeresCrispPet = true;
            console.log('aqui');
            $("#form").last().append('<div class="form-group">' +
                '<label for="producte"> ' + producteId + ' </label>' +
                '<div class="inline-form">' +
                '<input id="qntCrispPet" class="null card-image form-control col-md-6 preu-producte" type="text" value="1" disabled>' +
                '</div>' +
                '<button class="btn btn-outline-secondary removeCrispPet">-</button>' +
                '</div>');
            console.log(contCrispPet);
            contCrispPet++;
            console.log(contCrispPet);
            sumarProducte();
        }

        //var preuXuxes, preuHotDog, preuCrispPet, preuCrispGran;

        // botó per esborrar 1 element
        var removeXuxe = $(".removeXuxe");
        var removeHotDog = $(".removeHotDog");
        var removeCrispGran = $(".removeCrispGran");
        var removeCrispPet = $(".removeCrispPet");

        if (primeraXuxe == true) {

            removeXuxe.click(function (e) {
                preuTotal = $('#preu-total').val();
                console.log('contXuxes ' + contXuxes);
                e.preventDefault();
                //restarProducte();
                contXuxes--;
                $('#qntXuxes').val(contXuxes);
                console.log(contXuxes);
                console.log('XUXES');
                console.log(preuTotal);
                total = parseFloat(preuTotal) - preuXuxes;
                console.log('preu total ' + preuTotal);
                console.log('preu xuxes ' + preuXuxes);
                console.log('total ' + total);
                total.toFixed(2);

                $('#preu-total').val(total + '€');

                if (contXuxes < 1) {
                    $(this).parent('div').remove();
                }
            });
        }

        if (primerHotDog == true) {
            removeHotDog.click(function (e) {
                preuTotal = $('#preu-total').val();
                console.log('contHotDog ' + contHotDog);
                e.preventDefault();
                //restarProducte();
                contHotDog--;
                $('#qntHotDog').val(contHotDog);
                console.log(contHotDog);
                console.log('HOT DOG');
                console.log(preuTotal);
                total = parseFloat(preuTotal) - preuHotDog;
                console.log('preu total ' + preuTotal);
                console.log('preu hot dog ' + preuHotDog);
                console.log('total ' + total);
                total.toFixed(2);

                $('#preu-total').val(total + '€');

                if (contHotDog < 1) {
                    $(this).parent('div').remove();
                }
            });
        }

        if (primeresCrispGran == true) {
            removeCrispGran.click(function (e) {
                preuTotal = $('#preu-total').val();
                console.log('contCrispGran ' + contCrispGran);
                e.preventDefault();
                //restarProducte();
                contCrispGran--;
                $('#qntCrispGran').val(contCrispGran);
                console.log(contCrispGran);
                console.log('CRISPETES GRANS');
                console.log(preuTotal);
                total = parseFloat(preuTotal) - preuCrispGran;
                console.log('preu total ' + preuTotal);
                console.log('preu crispetes petites ' + preuCrispGran);
                console.log('total ' + total);
                total.toFixed(2);

                $('#preu-total').val(total + '€');

                if (contCrispGran < 1) {
                    $(this).parent('div').remove();
                }
            });
        }

        if (primeresCrispPet == true) {
            removeCrispPet.click(function (e) {
                preuTotal = $('#preu-total').val();
                console.log('contHotDog ' + contCrispPet);
                e.preventDefault();
                //restarProducte();
                contCrispPet--;
                $('#qntHotDog').val(contCrispPet);
                console.log(contCrispPet);
                console.log('CRISPETES PETITES');
                console.log(preuTotal);
                total = parseFloat(preuTotal) - preuCrispPet;
                console.log('preu total ' + preuTotal);
                console.log('preu crispetes petites ' + preuCrispPet);
                console.log('total ' + total);
                total.toFixed(2);

                $('#preu-total').val(total + '€');

                if (contCrispPet < 1) {
                    $(this).parent('div').remove();
                }
            });
        }

        // Aquí mirem quin producte és per assignar-li el preu i després calcular-lo i posar-lo al formulari
        function sumarProducte() {

            if (producteId == 'Xuxes') {
                console.log('XUXES');
                total = parseFloat(preuXuxes) * parseFloat(contXuxes) + parseFloat(preuTotal);
                total.toFixed(2);
                console.log('total ' + parseFloat(total));
                $('#preu-total').val(total + '€');

            } else if (producteId == 'Hot Dog') {
                console.log('Hot Dog');
                total = parseFloat(preuHotDog) * parseFloat(contHotDog) + parseFloat(preuTotal);
                total.toFixed(2);
                console.log(total);
                $('#preu-total').val(total + '€');

            } else if (producteId == 'Crispetes grans') {
                console.log('Crispetes grans');
                total = parseFloat(preuCrispGran) * parseFloat(contCrispGran) + parseFloat(preuTotal);
                total.toFixed(2);
                console.log(total);
                $('#preu-total').val(total + '€');

            } else if (producteId == 'Crispetes petites') {
                console.log('Crispetes petites');
                total = parseFloat(preuCrispPet) * parseFloat(contCrispPet) + parseFloat(preuTotal);
                total.toFixed(2);
                console.log(total);
                $('#preu-total').val(total + '€');
            }
        }

        function restarProducte() {

            if (producteId == 'Xuxes') {
                console.log('XUXES');
                console.log(preuTotal)
                preuXuxes = 2.55;
                total = parseFloat(preuTotal) - parseFloat(preuXuxes);
                console.log('preu total ' + preuTotal);
                console.log('preu xuxes ' + preuXuxes);
                console.log('total ' + total);
                total.toFixed(2);

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