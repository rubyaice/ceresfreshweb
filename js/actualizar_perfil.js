$(document).on('click','#actualizar_perfil',function (){
  //
 var Cont = 0;
  $("#form_actualizar_perfil").find(".requerir").each(function (index) {

          var inputObject = $(this);
          if (inputObject.val().trim() == "") {
              Cont++;
              inputObject.addClass("requerirerror");
              inputObject.focus();
              inputObject.blur();
          }
          else{
            inputObject.removeClass("requerirerror");
          }
      });

if(Cont==0){

  

    var nombre_perfil = document.getElementById('nombre_perfil').value;
    var apellido_perfil = document.getElementById('apellido_perfil').value;
    var id_afiliado = document.getElementById('id_afiliado').value;
    var estatura=document.getElementById('estatura').value;
    var act_fisica=document.getElementById('act_fisica').value;
    var edad=document.getElementById('edad').value;
    var peso=document.getElementById('peso').value;
    var condicion_esp=document.getElementById('condicion_esp').value;

    //-----------------------------------------------

    var pais_reg=document.getElementById('pais_afiliado').value;
    var ciudad_reg=document.getElementById('ciudad_reg').value;
    var codigopostal_reg=document.getElementById('codigopostal_afiliado').value;
    var estado_reg=document.getElementById('estado_reg').value;
    var direccion_reg=document.getElementById('direccion_afiliado').value;
    var sector_reg=document.getElementById('sector_reg').value;

    var phone=document.getElementById('phone').value;

    //------------------------------------------------------

    var actualizar_perfil = document.getElementById('actualizar_perfil');
    var spinner = document.getElementById('spinner');

    actualizar_perfil.disabled = true;
    spinner.innerHTML += '&nbsp;<span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span>';

    var html_btn_sin_spinner = '<input style="background: #36434a; color:white" type="button" id="actualizar_perfil" class="btn" name="enviar" value="Guardar">';

  $.ajax({
      url: base_url+"index.php/afiliadoscontrol/actualizar_afiliado",
      type: 'POST',
      global: false,
      data: {

        id_afiliado:id_afiliado,
        nombre_perfil: nombre_perfil,
        apellido_perfil: apellido_perfil,
        estatura:estatura,
        act_fisica:act_fisica,
        edad:edad,
        peso:peso,
        condicion_esp:condicion_esp,
        phone:phone,
        pais_reg:pais_reg,
        ciudad_reg:ciudad_reg,
        codigopostal_reg:codigopostal_reg,
        estado_reg:estado_reg,
        direccion_reg:direccion_reg,
        sector_reg:sector_reg


          },
      beforeSend: function (xhr) {
          xhr.overrideMimeType("text/plain; charset=utf-8");
      },
      success: function (data) {

        

        var $Obj=$.parseJSON(data);
        var respuesta = $Obj['respuesta'];

        if (respuesta == true) {

          actualizar_perfil.disabled = false;
          spinner.innerHTML = html_btn_sin_spinner;

          actualizacionExitosa();

        } else {

          actualizar_perfil.disabled = false;
          spinner.innerHTML = html_btn_sin_spinner;

          actualizacionFallida();

        }

      }

    });

  }

});

/* Inicio Select estado ,ciudad y sector */
$('#pais_afiliado').change(function(){

  $Code=$(this).val();
  $.ajax({
      url: base_url+"index.php/login/get_estado",
      type: 'POST',
      global: false,
      data: {Code: $Code},
      beforeSend: function (xhr) {
          xhr.overrideMimeType("text/plain; charset=utf-8");
      },
      success: function (data) {

          var $Obj=$.parseJSON(data);
           var respuesta = $Obj['estado'];
           estado_reg.innerHTML = respuesta;

      }
  });
});

$('#estado_reg').change(function(){

  $Code=$(this).val();
  $.ajax({
      url: base_url+"index.php/login/get_ciudad",
      type: 'POST',
      global: false,
      data: {Code: $Code},
      beforeSend: function (xhr) {
          xhr.overrideMimeType("text/plain; charset=utf-8");
      },
      success: function (data) {

          var $Obj=$.parseJSON(data);
           var respuesta = $Code=$Obj['ciudad'];
           ciudad_reg.innerHTML = respuesta;

      }
    });

});

$('#ciudad_reg').change(function(){

    $Code=$(this).val();
    $.ajax({
        url: base_url+"index.php/login/get_sector",
        type: 'POST',
        global: false,
        data: {Code: $Code},
        beforeSend: function (xhr) {
            xhr.overrideMimeType("text/plain; charset=utf-8");
        },
        success: function (data) {

            var $Obj=$.parseJSON(data);
             var respuesta = $Code=$Obj['sectores'];
             sector_reg.innerHTML = respuesta;

        }
    });
});
/* fin Select estado ,ciudad y sector */

//datos de direccion del usuario

var btnDireccion = document.getElementById('btnDireccion');
var btnCerrar = document.getElementById('btnCerrar');
var btnCerrarx = document.getElementById('btnCerrarx');

btnDireccion.addEventListener("click", function(){

  document.getElementById("camposDireccion").style.display = 'inherit';
  btnDireccion.style.display = 'none';
  btnCerrar.style.display = 'inherit';
  btnCerrarx.style.display = 'inherit';

});

btnCerrar.addEventListener("click", function(){

  document.getElementById("camposDireccion").style.display = 'none';
  btnDireccion.style.display = 'inherit';
  btnCerrar.style.display = 'none';
  btnCerrarx.style.display = 'none';

});

btnCerrarx.addEventListener("click", function(){

  document.getElementById("camposDireccion").style.display = 'none';
  btnDireccion.style.display = 'inherit';
  btnCerrar.style.display = 'none';
  btnCerrarx.style.display = 'none';

});

//recargar pagina
function recargarPagina() {

  location.reload();
  
}

//metodo para llamar a modal de actualizacion exitosa
function actualizacionExitosa() {

  $('#actualizacionExitosa').modal(
    {
      keyboard: false,
      backdrop: 'static'
    });

  $('#actualizacionExitosa').modal('show');
    
}

//metodo para llamar a modal de actualizacion fallida
function actualizacionFallida() {

  $('#actualizacionFallida').modal(
    {
      keyboard: false,
      backdrop: 'static'
    });

  $('#actualizacionFallida').modal('show');
    
}