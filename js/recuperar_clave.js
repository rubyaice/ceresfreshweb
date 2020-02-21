
$('#recuperar_clave').click(function (){
  
   var Cont = 0;
    $("#form_recuperar_clave").find(".requerir").each(function (index) {
  
            var inputObject = $(this);
            if (inputObject.val().trim() == "") {
                Cont++;
                inputObject.addClass("requerirerror");
            }
            else{
              inputObject.removeClass("requerirerror");
            }
        });
  
  if(Cont==0){
    
    var correo_usuario = document.getElementById('correo_usuario').value;  
  
      //-----------------------------------------------

      var spinner = document.getElementById('spinner');
      var recuperar_clave = document.getElementById('recuperar_clave');
      var btnVolver = document.getElementById('btnVolver');
      var proceso = '0';
      
      var html_btn_sin_spinner = '<input style="background: #36434a; color:white" type="button" id="recuperar_clave" class="btn" name="siguiente" value="Recuperar">';

      btnVolver.style.pointerEvents = 'none';
      btnVolver.style.color = '#bbb';

      recuperar_clave.disabled = true;
      spinner.innerHTML += '&nbsp;<span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span>';
    
    $.ajax({
        url: base_url+"index.php/email/enviar_email",
        type: 'POST',
        global: false,
        data: {

            proceso:proceso,
            correo_usuario:correo_usuario
  
        },

        beforeSend: function (xhr) {
            xhr.overrideMimeType("text/plain; charset=utf-8");
        },

        success: function (data) {
           
            
  
          var $Obj=data;
          var respuesta = $Obj;

          //cuando no existe el correo en la base de datos
          if (respuesta == "1") {

            

            recuperar_clave.disabled = false;
            spinner.innerHTML = html_btn_sin_spinner;

            btnVolver.style.pointerEvents = 'auto';
            btnVolver.style.color = '#ffffff';
        
            correoNoExiste();
            return false;
        
          }

          //cuando el correo no pudo ser enviado o hubo un fallo de conexion
          if (respuesta == "3") {

            
            
            recuperar_clave.disabled = false;
            spinner.innerHTML = html_btn_sin_spinner;

            btnVolver.style.pointerEvents = 'auto';
            btnVolver.style.color = '#ffffff';

            correoNoEnviado();
            return false;
        
          }

          if (respuesta == "2") {

            
            
            recuperar_clave.disabled = false;
            spinner.innerHTML = html_btn_sin_spinner;

            btnVolver.style.pointerEvents = 'auto';
            btnVolver.style.color = '#ffffff';

            $('#envioExitoso').modal(
              {
                keyboard: false,
                backdrop: 'static'
              });

            $('#envioExitoso').modal('show');
            return false;
        
          }


            recuperar_clave.disabled = false;
            spinner.innerHTML = html_btn_sin_spinner;

            btnVolver.style.pointerEvents = 'auto';
            btnVolver.style.color = '#ffffff';

            correoNoEnviado();
            return false;
      
        }
  
      });
  
    }
  
  });

  //metodo para cuando el correo no se encuentra registrado ene el sistema
  function correoNoExiste() {

    $('#errorDeCorreo').modal(
      {
        keyboard: false,
        backdrop: 'static'
      });

    $('#errorDeCorreo').modal('show');
      
  }

  //metodo para cuando el correo no se encuentra registrado ene el sistema
  function correoNoEnviado() {

    $('#errorDeEnvio').modal(
      {
        keyboard: false,
        backdrop: 'static'
      });

    $('#errorDeEnvio').modal('show');
      
  }

  //metodo par cuando el el usuari le de "aceptar" y la recuperacion se haya efectuado de manera correcta

  $('#enviarALogin').click(function (){

    location.href = base_url+"index.php/login";

  });

  //funcion para recargar la pagina en caso de que exista un error
  function recargarPagina() {

    location.reload();
    
  }