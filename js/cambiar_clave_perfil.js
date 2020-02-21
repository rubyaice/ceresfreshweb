$('#actualizar_clave').click('#recuperar_clave',function (){
    
   var Cont = 0;
    $("#form_actualizar_clave").find(".requerir").each(function (index) {
  
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
    var pass1 = document.getElementById('pass1').value;
    var pass2 = document.getElementById('pass2').value;
      
  
    //-----------------------------------------------

    var actualizar_clave = document.getElementById('actualizar_clave');
    var spinner = document.getElementById('spinner');
    var btnVolver = document.getElementById('btnVolver');
    var btnInicio = document.getElementById('btnInicio');

    btnVolver.style.pointerEvents = 'none';
    btnVolver.style.color = '#bbb';

    btnInicio.style.pointerEvents = 'none';
    btnInicio.style.color = '#bbb';

    actualizar_clave.disabled = true;
    spinner.innerHTML += '&nbsp;<span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span>';

    var html_btn_sin_spinner = '<input style="background: #36434a; color:white" id="actualizar_clave" class="btn " type="button" name="enviar" value="Guardar">';
  
    if (pass1 != pass2) {

        

        actualizar_clave.disabled = false;
        spinner.innerHTML = html_btn_sin_spinner;

        $('#errorDeClaves').modal(
          {
            keyboard: false,
            backdrop: 'static'
          });

        $('#errorDeClaves').modal('show');
        return false;
        
    }
    
    $.ajax({
        url: base_url+"index.php/dashboardnuevo/cambiar_clave",
        type: 'POST',
        global: false,
        data: {
  
            correo_usuario:correo_usuario,
            pass1:pass1
  
            },
        beforeSend: function (xhr) {
            xhr.overrideMimeType("text/plain; charset=utf-8");
        },
        success: function (data) {

  
          var $Obj=$.parseJSON(data);
          var respuesta = $Obj['respuesta'];

          if (respuesta == true) {

            

            btnVolver.style.pointerEvents = 'auto';
            btnVolver.style.color = '#ffffff';

            btnInicio.style.pointerEvents = 'auto';
            btnInicio.style.color = '#ffffff';

            actualizar_clave.disabled = false;
            spinner.innerHTML = html_btn_sin_spinner;
            
            actualizacionExitosa();
            return false;
        
          }

          btnVolver.style.pointerEvents = 'auto';
          btnVolver.style.color = '#ffffff';

          btnInicio.style.pointerEvents = 'auto';
          btnInicio.style.color = '#ffffff';

          actualizar_clave.disabled = false;
          spinner.innerHTML = html_btn_sin_spinner;

          actualizacionFallida();
      
        }
  
      });
  
    }
  
  });


  //metodo para recargar la pagina al completarse la actualizacion de la contraseña
  function recargar() {

    location.reload();

  }

  function actualizacionExitosa() {

    $('#actualizacionExitosa').modal(
      {
        keyboard: false,
        backdrop: 'static'
      });

    $('#actualizacionExitosa').modal('show');
      
  }

  function actualizacionFallida() {

    $('#errorDeActualizacion').modal(
      {
        keyboard: false,
        backdrop: 'static'
      });

      $('#errorDeActualizacion').modal('show');
    
  }