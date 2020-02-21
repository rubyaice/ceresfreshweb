$(document).ready(function(){

    //correo de contacto
    var correoContacto = document.getElementById('correoContacto');
    var correoContactoLabel = document.getElementById('correoContactoLabel');

    //numero de contacto
    var numContacto = document.getElementById('numContacto');
    var numContactoLabel = document.getElementById('numContactoLabel');

    $.ajax({

        url: base_url+"index.php/admin/Ventas/datos_contactos",
        global: false,
        type: 'POST',
        beforeSend: function (xhr) {
            xhr.overrideMimeType("text/plain; charset=utf-8");
        },
        success: function (data) {
            
            $Obj=$.parseJSON(data);

            var correo_de_contacto = $Obj['correo_de_contacto'];
            var respuesta_num = $Obj['num_contaco'];

            correoContacto.value = correo_de_contacto;
            numContacto.value = respuesta_num;

            correoContactoLabel.classList.add('active');
            numContactoLabel.classList.add('active');
        }
    });

});

$('#btnModificar').click(function(){

    var correoContacto = document.getElementById('correoContacto').value;
    var numContacto = document.getElementById('numContacto').value;

    $.ajax({
        url: base_url+"index.php/admin/Ventas/modificar_contactos",
        global: false,
        type: 'POST',
        data: {

            correoContacto: correoContacto,
            numContacto: numContacto

        },
        beforeSend: function (xhr) {
            xhr.overrideMimeType("text/plain; charset=utf-8");
            $('#btnModificar').attr("disabled", true);
        },
        success: function (data) {
            
            $Obj=$.parseJSON(data);

            var respuesta = $Obj['respuesta_modif_contact'];

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

