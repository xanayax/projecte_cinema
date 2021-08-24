// Descarregar el ticket
$('#download').click(function () {
    const resum = document.getElementById("resum");
    console.log(resum);
    html2pdf(resum);
});

var botoAdd = document.getElementsByClassName("update-cart");

var formGroup = document.createElement("div");
formGroup.setAttribute('class', 'form-group');
$("#form").append(formGroup);
//formGroup.setAttribute('id', 'si');

for (i = 0; i < botoAdd.length; i++) {

    botoAdd[i].addEventListener('click', function () {
        var producteId = this.dataset.product;
        var action = this.dataset.action;
        console.log('producteId:', producteId, 'action:', action);

        /*
        var labelComplement = document.createElement("label");
        labelComplement.textContent = producteId;
        formGroup.appendChild(labelComplement);

        var inputComplement = document.createElement("input");
        inputComplement.setAttribute("type", "text");
        inputComplement.setAttribute("value", "1");
        inputComplement.setAttribute('class', 'null card-image form-control col-md-6');
        formGroup.appendChild(inputComplement);

        var plusBtn = document.createElement("button");
        plusBtn.setAttribute("type", "button");
        plusBtn.innerHTML = 'ELPEPE';
        formGroup.append(plusBtn);
        */

        //$(".form-group").last().append('<div class="media"><div class="media-body"><div class="col-sm-11"><i class="fa fa-file-text"></i> ' + producteId + '</div><div class="col-sm-1"><button class="btn btn-default" onclick="">Kaldır</button></div></div></div>');
        $("#form").last().append('<div class="form-group">' +
            '<label for="producte"> ' + producteId + ' </label>' +
            '<div class="inline-form">' +
            '<input id="qnt" class="null card-image form-control col-md-6 preu-producte" type="text" value="1" disabled>' +
            // '<button type="button" class="btn btn-success submit-button" onclick="incrementValue()">+</button>' +
            // '<button type="button" class="btn btn-danger submit-button" onclick="decrementValue()">-</button>' +
            '</div>' +
            '</div>');
        var quantProducte = $('#qnt').val();
        var preuProducte = $('#producte-preu').text();
        var preuTotal = $('#preu-total').val();
        console.log(quantProducte);
        console.log(preuProducte);

        // si es = a nom prod, asignar el seu preu
        var preuXuxes, preuHotDog, preuCrispPet, preuCrispGran;
        var total;

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

        //funcio per calcular el total
        var sum = 0;
        $('.preu-producte').each(function(){
            sum += parseFloat(this.value);
        });
        console.log(sum);
    });
}

function incrementValue() {
    var value = parseInt(document.getElementById('inc').value, 10);
    value = isNaN(value) ? 0 : value;
    value++;
    document.getElementById('inc').value = value;
}

function decrementValue() {
    var value = parseInt(document.getElementById('inc').value, 10);
    value = isNaN(value) ? 0 : value;
    value--;
    document.getElementById('inc').value = value;

    if (value <= 0) {
        document.getElementById('inc').value = 0;
    }
}


/*
var _compt = [];


function _incrementar(c) {
    document.getElementById("comptador" + c).innerHTML = _compt[c].finc();
}


function _decrementar(c) {
    document.getElementById("comptador" + c).innerHTML = _compt[c].fdec();
}

function comptador(ini, inc) {
    var incrementar = function () {
        // miro que el valor per incrementar no sigui menor que 0
        do {
            ini = ini + inc;
            return ini;

        } while (inc > 0);
    }

    // creo la funció per decrementar
    var decrementar = function () {
        // miro que el valor per incrementar no sigui menor que 0
        do {
            ini = ini - inc;
            return ini;

        } while (inc > 0);
    }

    return {finc: incrementar, fdec: decrementar}; // return d'objecte
}
*/


