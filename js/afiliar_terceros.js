$(document).on('click','#afiliar_tercero',function (){
  //
 var Cont = 0;
  $("#form_terceros").find(".requerir").each(function (index) {

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

  //
    var correo_reg=document.getElementById('correo_afiliado').value;
    var nombre_reg=document.getElementById('nombre_afiliado').value;
    var sexo_reg=document.getElementById('sexo_afiliado').value;
    var estatura_reg=document.getElementById('estatura_afiliado').value;
    var act_fisica_reg=document.getElementById('act_fisica_afiliado').value;
    var apellido_reg=document.getElementById('apellido_afiliado').value;
    var edad_reg=document.getElementById('edad_afiliado').value;
    var peso_reg=document.getElementById('peso_afiliado').value;
    var condicion_esp_reg=document.getElementById('condicion_esp_afiliado').value;
    var pais_reg=document.getElementById('pais_afiliado').value;
    var ciudad_reg=document.getElementById('ciudad_reg').value;
    var codigopostal_reg=document.getElementById('codigopostal_afiliado').value;
    var estado_reg=document.getElementById('estado_reg').value;
    var telefono_reg=document.getElementById('telefono_afiliado').value;
    var direccion_reg=document.getElementById('direccion_afiliado').value;
    var sector_reg=document.getElementById('sector_reg').value;

    //------------------------------------------------------------------


    var afiliar_tercero = document.getElementById('afiliar_tercero');
    var spinner = document.getElementById('spinner');

    afiliar_tercero.disabled = true;
    spinner.innerHTML += '&nbsp;<span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span>';

    var html_btn_sin_spinner = '<input style="background: #36434a; color:white" type="button" id="afiliar_tercero" class="btn" name="enviar" value="Afiliar">';


  $.ajax({
      url: base_url+"index.php/registrarusuario/insertar_en_afiliacion",
      type: 'POST',
      global: false,
      data: {nombre_reg: nombre_reg,sexo_reg:sexo_reg,estatura_reg:estatura_reg,act_fisica_reg:act_fisica_reg,apellido_reg:apellido_reg,edad_reg:edad_reg,peso_reg:peso_reg,condicion_esp_reg:condicion_esp_reg,pais_reg:pais_reg,ciudad_reg:ciudad_reg,codigopostal_reg:codigopostal_reg,estado_reg:estado_reg,telefono_reg:telefono_reg,direccion_reg:direccion_reg,correo_reg:correo_reg,sector_reg:sector_reg},
      beforeSend: function (xhr) {
          xhr.overrideMimeType("text/plain; charset=utf-8");
      },
      success: function (data) {

        //
        window.location = base_url+"index.php/afiliadoscontrol";
        var $Obj=$.parseJSON(data);
         //var respuesta = $Obj['estado'];

         if (respuesta == true) {

          afiliar_tercero.disabled = false;
          spinner.innerHTML = html_btn_sin_spinner;

          actualizacionExitosa();

        } else {

          actualizar_tercero.disabled = false;
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

//recargar pagina
function recargarPagina() {

  location.reload();
  
}

//metodo para llamar a modal de actualizacion exitosa
function actualizacionExitosa() {

  $('#afiliacionExitosa').modal(
    {
      keyboard: false,
      backdrop: 'static'
    });

  $('#afiliacionExitosa').modal('show');
    
}

//metodo para llamar a modal de actualizacion fallida
function actualizacionFallida() {

  $('#afiliacionFallida').modal(
    {
      keyboard: false,
      backdrop: 'static'
    });

  $('#afiliacionFallida').modal('show');
    
}

//meotodo para usar la misma direccion del usuario registrado en  la afiliacion
$('#btnusarDirecUsusario').click(function(){

  var actividad = 1;

  $.ajax({
    url: base_url+"index.php/Afiliar/usar_direccion_usuario",
    type: 'POST',
    global: false,
    data: {

      actividad: actividad

    },
    beforeSend: function (xhr) {
        xhr.overrideMimeType("text/plain; charset=utf-8");
    },
    success: function (data) {

      var $Obj=$.parseJSON(data);
      var respuesta = $Obj['respuesta'];
      
      //en caso de que la consulta falle
      if (respuesta == 1) {
        
        $('#direccionFallo').modal(
          {
            keyboard: false,
            backdrop: 'static'
          });
      
        $('#direccionFallo').modal('show');

      }

      //en caso de que todo vaya bien
      if (respuesta == 2) {
        
        //descripcion
        var cuidad = $Obj['cuidad'];
        var direccion = $Obj['direccion'];
        var estado = $Obj['estado'];
        var zipcode = $Obj['zipcode'];
        var sector = $Obj['sector'];
        var pais = $Obj['pais'];

        //ideas
        var id_cuidad = $Obj['id_cuidad'];
        var id_estado = $Obj['id_estado'];
        var id_sector = $Obj['id_sector'];
        var id_pais = $Obj['id_pais'];

        //rellenado de datos segun llegue del usuario
        var pais_reg = document.getElementById('pais_afiliado').innerHTML = '<option selected="true" readonly value="'+id_pais+'">'+pais+'</option>';
        $('#pais_afiliado').attr('readonly', true);

        var ciudad_reg = document.getElementById('ciudad_reg').innerHTML = '<option selected="true" value="'+id_cuidad+'">'+cuidad+'</option>';
        $('#ciudad_reg').attr('readonly', true);

        var codigopostal_reg = document.getElementById('codigopostal_afiliado').value = zipcode;
        $('#codigopostal_afiliado').attr('readonly', true);

        var estado_reg = document.getElementById('estado_reg').innerHTML = '<option selected="true" value="'+id_estado+'">'+estado+'</option>';
        $('#estado_reg').attr('readonly', true);

        var direccion_reg = document.getElementById('direccion_afiliado').value = direccion;
        $('#direccion_afiliado').attr('readonly', true);

        var sector_reg = document.getElementById('sector_reg').innerHTML = '<option selected="true" value="'+id_sector+'">'+sector+'</option>';
        $('#sector_reg').attr('readonly', true);

        $('.btnDirUs').css('display', 'none');
        $('.btnNoDirUs').css('display', 'initial');
        
      }

    }
});

});

//accion por si el usuario no quiere usar su direccion 
$('#btnNoUsarDirecUs').click(function(){

  location.reload();

});
