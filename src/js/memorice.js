var imagenes = new Array();
var usados = new Array();


function iniciar() {
    for (var i = 1; i <= 16; i++) {
        imagenes[i - 1] = i;
    }
    var largo = imagenes.length

    for (j = 0; j < 16; j++) {
        random = Math.floor(Math.random() * (largo));
        usados[j] = imagenes[random];
        imagenes.splice(random, 1);
        largo = imagenes.length;
    }

    for (var k = 0; k < 16; k++) {
        document.getElementById(k).innerHTML = '<img src="../src/img/memorice/' + usados[k] + '.jpg">';
    }
}

$(document).ready(function() {
    var idFoto;
    var arregloFotos;

    $('#iniciar').click(function() {
        $('img').delay(1000).fadeOut();
    });

    $('td').click(function() {
        var idFoto = $(this).attr('id');
        document.getElementById(idFoto).innerHTML = '<img src="../src/img/memorice/' + usados[idFoto] + '.jpg">';
    })

});