$(document).ready(function() {

  comprobarPagoAfiliado();

});

var correo_afiliado = document.getElementById('correo_afiliado').value;

//metodo para mostrar el modal en caso de que el usuario que esta iniciando sesion no haya pago la semana
function comprobarPagoAfiliado() {

  

  var respuestaHtmlPago = document.getElementById('respuestaHtmlPago');
  var imgModalR = document.getElementById('imgModalR');
  var pasosReactivacion = document.getElementById('pasosReactivacion');

  $.ajax({

      url: base_url+"index.php/afiliadoscontrol/comprobar_pago_afiliado",
      type: 'POST',
      global: false,
      async : false,
      data: {correo_afiliado: correo_afiliado},
      beforeSend: function (xhr) {
          xhr.overrideMimeType("text/plain; charset=utf-8");
      },
      success: function (data) {

        

        var $Obj=$.parseJSON(data);
        //$Obj=$.parseJSON(data);

        var respuesta_pago = $Code=$Obj['pago'];
        var respuesta_html = $Code=$Obj['respuesta_html'];
        var respuesta_reactivar = $Code=$Obj['respuesta_reactivar'];
        

        //-----------------------------------------------------------

        var contenedor = document.getElementById('contenedor');
        var reactivarAfiliacion = document.getElementById('reactivarAfiliacion');
        var direccionarDetPago = document.getElementById('direccionarDetPago');

        //validacion de si el cliente no tiene activa una nutribox por el momento y muestra el boton en caso de querer reativar su afiliacion al plan
        if (respuesta_reactivar == 1) {

          reactivarAfiliacion.style.display = 'initial';

        }

        if (respuesta_reactivar == 2) {

          direccionarDetPago.style.display = 'initial';

        }

        //llamado y respuesta dada desde el servidor
        if (respuesta_pago == 0) {

          $('#modalPago').modal(
          {
            keyboard: false,
            backdrop: 'static'
          });

          $('#modalPago').modal('show')
          respuestaHtmlPago.innerHTML = respuesta_html;

          //condicional de si el resultdo de la respuesta es igal a que el susuario deba reactivar su afiliacion
          if (respuesta_reactivar == 1) {

            imgModalR.innerHTML = '<img class="imgmodalP" style="width:20%; height: auto; border-radius: 8px;" src="'+base_url+'img/ceres/box.png" alt="">';

            pasosReactivacion.innerHTML = '<div class="col-md-12 col-lg-12 col-sm-12 col-xs-12">'+
            '<div class="row">'+

              '<div class="col-md-4 col-lg-4 col-sm-12 col-xs-12">'+
                
                '<i class="material-icons">add_circle_outline</i>'+
                '<p style="font-size: 80%;">Pulsa en el boton <b>Activar Afiliación</b>.</p>'+
              '</div>'+
              '<div class="col-md-4 col-lg-4 col-sm-12 col-xs-12">'+
                
                '<i class="material-icons">call_to_action</i>'+
                '<p style="font-size: 80%;">Luego pulsa el boton de <b>Detalles de pago</b>, esto te llevará a la sección para cancelar tu reactivación.</p>'+
              '</div>'+
              '<div class="col-md-4 col-lg-4 col-sm-12 col-xs-12">'+
                
                '<i class="material-icons">attach_money</i>'+
                '<p style="font-size: 80%;">Completa el proceso de cancelación de tu pedido segun el metodo de pago de tu preferencia.</p>'+
              '</div>'+
      
            '</div>'+
          '</div>';
          }

          contenedor.innerHTML = '';
          contenedor.style.background = "#ffffff";
          contenedor.style.marginBottom = "70rem";

        }

        //levantar modal en caso de que el pago sea rechazado
        if(respuesta_pago == 2){

          $('#modalPagoRechazado').modal(
            {
              keyboard: false,
              backdrop: 'static'
            });
  
          $('#modalPagoRechazado').modal('show');

        }

        if (respuesta_pago == 3) {

          $('#modalPagoRechazadoEspera').modal(
            {
              keyboard: false,
              backdrop: 'static'
            });
  
          $('#modalPagoRechazadoEspera').modal('show');
          
        }

      }
  });
}

//funcion click que se ve solamente si el usuario esta pasado de la semana y el carrito esta vacio.
$('#reactivarAfiliacion').click(function(){

  

  var activacion = 1;

  $.ajax({

    url: base_url+"index.php/activarafiliacion/reactivar_afiliado",
    type: 'POST',
    global: false,
    async : false,
    data: {
      activacion: activacion,
      correo_afiliado: correo_afiliado
    },
    beforeSend: function (xhr) {
        xhr.overrideMimeType("text/plain; charset=utf-8");
    },
    success: function (data) {

      

      var $Obj=$.parseJSON(data);
      //$Obj=$.parseJSON(data);

      var respuesta_activacion = $Code=$Obj['respuesta_activacion'];

      if (respuesta_activacion == 1) {
        
        window.location = base_url+"index.php/Detallespago";

        return;

      }

      if (respuesta_activacion == 2) {

        alert('No se pudo completar el proceso, Error!!');

        return;
      }

      if (respuesta_activacion == 0) {

        window.location = base_url+"index.php/Detallespago";

        return;
      }

    }
});

});

//funcion click para en caso de que l pago del usuario haya sido rechazado pueda volver a realizar a compra
$('#btnPagorechazado').click(function(){

  

  var activacion = 1;

  $.ajax({

    url: base_url+"index.php/activarafiliacion/reactivar_afiliado",
    type: 'POST',
    global: false,
    async : false,
    data: {
      activacion: activacion,
      correo_afiliado: correo_afiliado
    },
    beforeSend: function (xhr) {
        xhr.overrideMimeType("text/plain; charset=utf-8");
    },
    success: function (data) {

      

      var Obj=$.parseJSON(data);

      var respuesta_activacion = Obj['respuesta_activacion'];

      if (respuesta_activacion == 1) {
        
        location.href = base_url+"index.php/detallespago";

        return;

      }

      if (respuesta_activacion == 2) {

        alert('No se pudo completar el proceso, Error!!');

        return;
      }

      if (respuesta_activacion == 0) {

        location.href = base_url+"index.php/detallespago";

        return;
      }

    }
});


});
