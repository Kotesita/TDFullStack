$(document).ready(function() {
    $('form').hide();

    $('#registro').click(function() {
        $('form').toggle();
    });

    $("#btnentrar").click(function() {
        if (validarRut($("#txtrut").val())) {
            console.log("El rut ingresado es válido");
        } else {
            console.log("El rut ingresado no es válido");
        }
    });

    $("#btnentrar").click(function() {
        if (validarEmail($("#txtcorreo").val())) {
            console.log("El email ingresado es válido");
        } else {
            console.log("El email ingresado no es válido");
        }
    });

    $("#btnentrar").click(function() {
        if (validarEdad($("#txtfechanac").val())) {
            console.log("El usuario es mayor de edad. Puede ingresar");
        } else {
            console.log("El usuario no es mayor de edad. No puede ingresar");
        }
    });
});

function entrar() {
    if (document.getElementById("txtrut").value == "") {
        alert("Debe ingresar rut");
        $('#lblrut').addClass("rojo");
    } else {
        $('#lblrut').addClass("verde");
    }
    if (document.getElementById("txtnombre").value == "") {
        alert("Debe ingresar nombre");
        $('#lblnombre').addClass("rojo");
    } else {
        $('#lblnombre').addClass("verde");
    }
    if (document.getElementById("txtapellido").value == "") {
        alert("Debe ingresar apellido");
        $('#lblapellido').addClass("rojo");
    } else {
        $('#lblapellido').addClass("verde");
    }
    if (document.getElementById("txtcorreo").value == "") {
        alert("Debe ingresar correo");
        $('#lblcorreo').addClass("rojo");
    } else {
        $('#lblcorreo').addClass("verde");
    }
    if (document.getElementById("txtfechanac").value == "") {
        alert("Debe ingresar fecha nacimiento");
        $('#lblfechanac').addClass("rojo");
    } else {
        $('#lblfechanac').addClass("verde");
    }
}

var cantdig = 11,
    sum = 0,
    num = 2;

function validarRut(rut) {
    var sindig = rut.toString().slice(0, rut.length - 1);
    var dv = rut.toString().slice(rut.length - 1, rut.length);
    sindig = sindig.split("");
    sindig = sindig.reverse();
    for (var i = 0; i < sindig.length; i++) {
        sum += sindig[i] * num;
        num++;
        if (num == 8) {
            num = 2;
        }
    }
    num = 2;
    var a = Math.trunc(sum / cantdig);
    var b = a * cantdig;
    var c = sum - b;
    var d = cantdig - c;
    sum = 0;
    if (d == dv) {
        return true;
    } else {
        return false;
    }
}

function validarEmail(email) {
    email = document.getElementById("txtcorreo");
    if (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(email.value)) {
        return true;
    } else {
        return false;
    }

}

function validarEdad(fecha) {
    fecha = document.getElementById("txtfechanc");

}