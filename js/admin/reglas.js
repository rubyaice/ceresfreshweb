$(document).ready(function(){
    
    var inputMontoTaza = document.getElementById('inputMontoTaza');
    var labelMonto = document.getElementById('labelMonto');

    //acceso a variables en la parte de los costos en USD para los planes nutricionales

    //plan DHM07
    var inputUSDDHM07 = document.getElementById('inputUSDDHM07');
    var labelUSDDHM07 = document.getElementById('labelUSDDHM07');
    var descripcionDHM07 = document.getElementById('descripcionDHM07');

    //plan HMI03
    var inputUSDHMI03 = document.getElementById('inputUSDHMI03');
    var labelUSDHMI03 = document.getElementById('labelUSDHMI03');
    var descripcionHMI03 = document.getElementById('descripcionHMI03');

    //plan HMJ04
    var inputUSDHMJ04 = document.getElementById('inputUSDHMJ04');
    var labelUSDHMJ04 = document.getElementById('labelUSDHMJ04');
    var descripcionHMJ04 = document.getElementById('descripcionHMJ04');

    //plan HSE05
    var inputUSDHSE05 = document.getElementById('inputUSDHSE05');
    var labelUSDHSE05 = document.getElementById('labelUSDHSE05');
    var descripcionHSE05 = document.getElementById('descripcionHSE05');

    //plan MLE02
    var inputUSDMLE02 = document.getElementById('inputUSDMLE02');
    var labelUSDMLE02 = document.getElementById('labelUSDMLE02');
    var descripcionMLE02 = document.getElementById('descripcionMLE02');

    //plan PPM01
    var inputUSDPPM01 = document.getElementById('inputUSDPPM01');
    var labelUSDPPM01 = document.getElementById('labelUSDPPM01');
    var descripcionPPM01 = document.getElementById('descripcionPPM01');

    //otras variables de envio
    var enviar = 1;

    $.ajax({
        url: base_url+"index.php/admin/Ventas/traer_taza_cambio",
        global: false,
        type: 'POST',
        data: {

            enviar: enviar

        },
        beforeSend: function (xhr) {
            xhr.overrideMimeType("text/plain; charset=utf-8");
        },
        success: function (data) {
            
            $Obj=$.parseJSON(data);

            var respuesta = $Obj['respuesta'];

            labelMonto.classList.add('active');
            inputMontoTaza.value = respuesta;

            //respuesta para la parte de edicion de divisas segun el plan para el precio en USD de las cajas 

            //respuesta para la parte del plan DHM07
            var usd_DHM07_descripcion = $Obj['usd_DHM07_descripcion'];
            var usd_DHM07_id_plan = $Obj['usd_DHM07_id_plan'];
            var usd_DHM07_precio = $Obj['usd_DHM07_precio'];

            inputUSDDHM07.value = usd_DHM07_precio;
            descripcionDHM07.innerHTML = usd_DHM07_descripcion;
            labelUSDDHM07.classList.add('active');

            //respuesta para la parte del plan HMI03
            var usd_HMI03_descripcion = $Obj['usd_HMI03_descripcion'];
            var usd_HMI03_id_plan = $Obj['usd_HMI03_id_plan'];
            var usd_HMI03_precio = $Obj['usd_HMI03_precio'];

            inputUSDHMI03.value = usd_HMI03_precio;
            descripcionHMI03.innerHTML = usd_HMI03_descripcion;
            labelUSDHMI03.classList.add('active');

            //respuesta para la parte del plan HMJ04
            var usd_HMJ04_descripcion = $Obj['usd_HMJ04_descripcion'];
            var usd_HMJ04_id_plan = $Obj['usd_HMJ04_id_plan'];
            var usd_HMJ04_precio = $Obj['usd_HMJ04_precio'];

            inputUSDHMJ04.value = usd_HMJ04_precio;
            descripcionHMJ04.innerHTML = usd_HMJ04_descripcion;
            labelUSDHMJ04.classList.add('active');

            //respuesta para la parte del plan HSE05
            var usd_HSE05_descripcion = $Obj['usd_HSE05_descripcion'];
            var usd_HSE05_id_plan = $Obj['usd_HSE05_id_plan'];
            var usd_HSE05_precio = $Obj['usd_HSE05_precio'];

            inputUSDHSE05.value = usd_HSE05_precio;
            descripcionHSE05.innerHTML = usd_HSE05_descripcion;
            labelUSDHSE05.classList.add('active');

            //respuesta para la parte del plan MLE02
            var usd_MLE02_descripcion = $Obj['usd_MLE02_descripcion'];
            var usd_MLE02_id_plan = $Obj['usd_MLE02_id_plan'];
            var usd_MLE02_precio = $Obj['usd_MLE02_precio'];

            inputUSDMLE02.value = usd_MLE02_precio;
            descripcionMLE02.innerHTML = usd_MLE02_descripcion;
            labelUSDMLE02.classList.add('active');

            //respuesta para la parte del plan MLE02
            var usd_PPM01_descripcion = $Obj['usd_PPM01_descripcion'];
            var usd_PPM01_id_plan = $Obj['usd_PPM01_id_plan'];
            var usd_PPM01_precio = $Obj['usd_PPM01_precio'];

            inputUSDPPM01.value = usd_PPM01_precio;
            descripcionPPM01.innerHTML = usd_PPM01_descripcion;
            labelUSDPPM01.classList.add('active');

        }
    });

});

$('#btnModificar').click(function(){

    var inputUSDDHM07 = document.getElementById('inputUSDDHM07').value;
    var inputUSDHMI03 = document.getElementById('inputUSDHMI03').value;
    var inputUSDHMJ04 = document.getElementById('inputUSDHMJ04').value;
    var inputUSDHSE05 = document.getElementById('inputUSDHSE05').value;
    var inputUSDMLE02 = document.getElementById('inputUSDMLE02').value;
    var inputUSDPPM01 = document.getElementById('inputUSDPPM01').value;


    var inputMontoTaza = document.getElementById('inputMontoTaza').value;
    var enviar = 1;

    $.ajax({
        url: base_url+"index.php/admin/Ventas/modificar_taza_cambio",
        global: false,
        type: 'POST',
        data: {

            enviar: enviar,
            inputMontoTaza: inputMontoTaza,
            inputUSDDHM07: inputUSDDHM07,
            inputUSDHMI03: inputUSDHMI03,
            inputUSDHMJ04: inputUSDHMJ04,
            inputUSDHSE05: inputUSDHSE05,
            inputUSDMLE02: inputUSDMLE02,
            inputUSDPPM01: inputUSDPPM01

        },
        beforeSend: function (xhr) {
            xhr.overrideMimeType("text/plain; charset=utf-8");
            $('#btnModificar').attr("disabled", true);
        },
        success: function (data) {
            
            $Obj=$.parseJSON(data);

            var respuesta = $Obj['respuesta'];

            if (respuesta == 1) {
                
                location.reload();
                
            }

            if (respuesta == 2) {

                $('#modal-fallo').modal('open');
                $('#btnModificar').attr("disabled", false);
            }

        }
    });


});

