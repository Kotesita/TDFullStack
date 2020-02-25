var imagenes = new Array();
var usados = new Array();


function iniciar() {
    for (var i = 1; i <= 16; i++) {
        imagenes[i - 1] = i;
    }
    var largo = imagenes.length

    for (j = 0; j < 16; j++) {
        random = Math.floor(Math.random() * (largo - 1));
        usados[j] = imagenes[random];
        imagenes.splice(random, 1);
        largo = imagenes.length;
    }
    for (var k = 0; k < 16; k++) {
        document.getElementById(k).innerHTML = '<img src="../src/img/memorice/' + usados[k] + '.jpg">';
    }
    return usados;
}