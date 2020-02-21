$(document).ready(function() {

});

var errorCreenciales = document.getElementById('errorCreenciales');

//variable contador para caso de reenvio de correo de validacion
var Contador = 0;

//boto para iniciar de sesion
$('#iniciarSesion').click(function(){

    
    var Cont = 0;
    Contador = Contador + 1;

    $("#form_login").find(".requerir").each(function (index) {

        var inputObject = $(this);
        if (inputObject.val().trim() == "") {
            Cont++;
            inputObject.addClass("requerirerror");

            errorCreenciales.innerHTML = '<b>Debe completar los campos requeridos.</b>';
        }
        else{
            inputObject.removeClass("requerirerror");
        }

        return;

    });

    if (Cont == 0) {

        var correo = document.getElementById('correo').value;
        var clave = document.getElementById('clave').value;
        
        $('#iniciarSesion').prop('disabled', true);
        $('#correo').prop('disabled', true);
        $('#clave').prop('disabled', true);

        //$('#bodybackground').css("background", "url("+base_url+"img/spinner_login.gif)");
        //$('#bodybackground').css("background-position", "center");

        $.ajax({
            url: base_url+"index.php/login",
            type: 'POST',
            global: false,
            data: {
    
                correo: correo,
                clave: clave
    
            },
            beforeSend: function (xhr) {
                xhr.overrideMimeType("text/plain; charset=utf-8");
            },
            success: function (data) {

                
         
                var $Obj=$.parseJSON(data);
    
                var respuesta = $Obj['respuesta'];
    
                //mensaje en caso de que el correo no haya sido confirmado.
                if (respuesta == 1) {
                    
                    errorCreenciales.innerHTML = '<b>Este cuenta no está Activa.</b>';
                    $('#iniciarSesion').prop('disabled', false);
                    $('#correo').prop('disabled', false);
                    $('#clave').prop('disabled', false);
                    //$('#bodybackground').css("background", "#293238");
                    
                    //definicion de condicional de si se oprime el boton 3 veces
                    if (Contador == 3) {

                        $('#cuentaNoAcModalCenter').modal({
            
                            keyboard: false,
                            backdrop: 'static'
                        });
                        
                        $('#cuentaNoAcModalCenter').modal('show');
                        
                    }

                    return; 

                }
    
                //respuesta en caso de que el usuario o contraseña sean incorrectos
                if (respuesta == 2) {
                    
                    errorCreenciales.innerHTML = '<b>Usuario y/o Contraseña incorrectos.</b>';
                    $('#iniciarSesion').prop('disabled', false);
                    $('#correo').prop('disabled', false);
                    $('#clave').prop('disabled', false);
                    //$('#bodybackground').css("background", "#293238");
                    return;
                }

                if (respuesta == 3) {
                    
                    window.location = base_url+'index.php/dashboardnuevo';
                }
         
            }
         });
        
    }

});

//metodo para al momento de dar click en el boton de aceptar vaya a la pagina de inicio de ceresfresh.
$('#btnCuentaNoAct').click(function(){

    

    var correo = document.getElementById('correo').value;
    var clave = document.getElementById('clave').value;
    
    var errorCreenciales = document.getElementById('errorCreenciales');

    $.ajax({
        url: base_url+"index.php/Registrarusuario/reenviar_activacion_correo",
        type: 'POST',
        global: false,
        data: {

            correo: correo,
            clave: clave

        },
        beforeSend: function (xhr) {
            xhr.overrideMimeType("text/plain; charset=utf-8");
        },
        success: function (data) {

            
  
            var $Obj=$.parseJSON(data);
            var respuesta = $Code=$Obj['respuesta_activacion'];

            if (respuesta == 1) {

                errorCreenciales.innerHTML = '<b style="color: #7dbe41;">Correo de activación reenviado.</b>';

            }

            if (respuesta == 2) {

                errorCreenciales.innerHTML = "<b>Error de envío de correo.</b>";
  
            }

            if (respuesta == 3) {

                errorCreenciales.innerHTML = "<b>Credenciales no validas.</b>";
 
            }

            if (respuesta == 4) {

                errorCreenciales.innerHTML = "<b>Error, verifique su conexión a internet.</b>";
 
            }
            
        }
    });

  });
