$(document).ready(function() {
  
  diasParaPagar();
  comprobarPagoMA();

});

//modal por si en algun momento se pude comprobar la conexion a internet
function NoConexion() {
  
    $('#errorConexionModal').modal(
    {
      keyboard: false,
      backdrop: 'static'
    });

    $('#errorConexionModal').modal('show');

}


//metodo para ver le tipo de alimento del usuario
function tipo_funt_alimento (id){

    var tipo_alimento = id;
    var alimento = document.getElementById('alimento');
    var respuesta_aliento = "";
    
    //var medida_practica = document.getElementById('medida_practica');
    //var medida_practica_cant = document.getElementById('medida_practica_cant');

    $.ajax({

        url: base_url+"index.php/dashboardnuevo/alimentos",
        type: 'POST',
        global: false,
        data: {tipo_alimento: tipo_alimento},
        beforeSend: function (xhr) {
            xhr.overrideMimeType("text/plain; charset=utf-8");

            //definicion de spinner de carga el cual sera sustituido por los alimentos a penas llegue la respuesta del ajax
            alimento.innerHTML = '<div class="text-center"><div class="spinner-border text-success" role="status"><span class="sr-only">Loading...</span></div></div>';
        },
        success: function (data) {

          var $Obj=$.parseJSON(data);
          //$Obj=$.parseJSON(data);

          respuesta_aliento = $Code=$Obj['alimentos'];

          if (respuesta_aliento == "") {

            alimento.innerHTML = '<div class="text-center">Error al Cargar, Verifique su Conexión a Internet.</div>';

          }else{

            alimento.innerHTML = respuesta_aliento;
            
          }

        }
    });
}

//metodo para mostrar el modal en caso de que el usuario que esta iniciando sesion no haya pago la semana
function comprobarPagoMA() {

  //

  var num_registro = document.getElementById('num_registro').value;
  var respuestaHtmlPago = document.getElementById('respuestaHtmlPago');
  var imgModalR = document.getElementById('imgModalR');
  var pasosReactivacion = document.getElementById('pasosReactivacion');

  

  $.ajax({

      url: base_url+"index.php/dashboardnuevo/comprobar_pago",
      type: 'POST',
      global: false,
      data: {num_registro: num_registro},
      beforeSend: function (xhr) {
          xhr.overrideMimeType("text/plain; charset=utf-8");
      },
      success: function (data) {

        //

        var $Obj=$.parseJSON(data);
        //$Obj=$.parseJSON(data);

        var respuesta_pago = $Code=$Obj['pago'];
        var respuesta_html = $Code=$Obj['respuesta_html'];
        var respuesta_reactivar = $Code=$Obj['respuesta_reactivar'];
        var respuesta_info = $Code=$Obj['respuesta_info'];
        

        //-----------------------------------------------------------

        var contenedor = document.getElementById('contenedor');
        var reactivarAfiliacionDiv = document.getElementById('reactivarAfiliacionDiv');
        var direccionarDetPago = document.getElementById('direccionarDetPago');

        //validacion de si el cliente no tiene activa una nutribox por el momento y muestra el boton en caso de querer reativar su afiliacion al plan
        if (respuesta_reactivar == 1) {

          reactivarAfiliacionDiv.style.display = 'initial';

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

          //condicional de si el resultdo de la respuesta es igual a que el susuario deba reactivar su afiliacion
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
          return;
        }

        //levantar modal en caso de que el pago sea rechazado
        if(respuesta_pago == 2){

          $('#modalPagoRechazado').modal(
            {
              keyboard: false,
              backdrop: 'static'
            });
  
          $('#modalPagoRechazado').modal('show');
          return;
        }

        if (respuesta_pago == 3) {

          $('#modalPagoRechazadoEspera').modal(
            {
              keyboard: false,
              backdrop: 'static'
            });
  
          $('#modalPagoRechazadoEspera').modal('show');
          
        }

        if (respuesta_info == 0) {

          $('#informacionModal').modal(
            {
              keyboard: false,
              backdrop: 'static'
            });
  
          $('#informacionModal').modal('show');
          
        }

      }
  });

}

//funcion click que se ve solamente si el usuario esta pasado de la semana y el carrito esta vacio.
$('#reactivarAfiliacion').click(function(){

  

  var activacion = 1;

  $.ajax({

    url: base_url+"index.php/activarafiliacion",
    type: 'POST',
    global: false,
    data: {
      activacion: activacion
    },
    beforeSend: function (xhr) {
        xhr.overrideMimeType("text/plain; charset=utf-8");
    },
    success: function (data) {

      

      var $Obj=$.parseJSON(data);
      //$Obj=$.parseJSON(data);

      var respuesta_activacion = $Code=$Obj['respuesta_activacion'];

      if (respuesta_activacion == 1) {
        
        window.location = base_url+"index.php/detallespago";

        return;

      }

      if (respuesta_activacion == 2) {

        alert('No se pudo completar el proceso, Error!!');

        return;
      }

      if (respuesta_activacion == 0) {

        window.location = base_url+"index.php/detallespago";

        return;
      }

    }
});

});

//funcion click para en caso de que l pago del usuario haya sido rechazado pueda volver a realizar a compra
$('#btnPagorechazado').click(function(){

  var activacion = 1;

  $.ajax({

    url: base_url+"index.php/activarafiliacion",
    type: 'POST',
    global: false,
    data: {
      activacion: activacion
    },
    beforeSend: function (xhr) {
        xhr.overrideMimeType("text/plain; charset=utf-8");
    },
    success: function (data) {

      

      var $Obj=$.parseJSON(data);
      //$Obj=$.parseJSON(data);

      var respuesta_activacion = $Code=$Obj['respuesta_activacion'];

      if (respuesta_activacion == 1) {
        
        window.location = base_url+"index.php/detallespago";

        return;

      }

      if (respuesta_activacion == 2) {

        alert('No se pudo completar el proceso, Error!!');

        return;
      }

      if (respuesta_activacion == 0) {

        window.location = base_url+"index.php/detallespago";

        return;
      }

    }
});

});

//meotodo para saber si se muestra e modal de informacion de afiliacion o no 
$('html').on('click','.checkActivo',function(event){
  
  

  var seleccionado = 1;
  var idactivo = $(this).val();

   if(idactivo == 0) 
   {
      $(this).val('1');
      seleccionado = 1;
      $(this).attr('checked');
   }

   if(idactivo == 1) 
   {
      $(this).val('0');
      seleccionado = 0;
      $(this).removeAttr('checked');
   }

    //ajax para actualizar en base de datos la aparicion del modal
   $.ajax({
       url: base_url+"index.php/dashboardnuevo/actualizar_info_afiliacion",
       global: false,
       type: 'POST',
       data: {

            seleccionado:seleccionado
       },
       beforeSend: function (xhr) {
           xhr.overrideMimeType("text/plain; charset=utf-8");
       },
       success: function (data) 
       {   

           var $Obj=$.parseJSON(data);
           var respuesta = $Obj['respuesta'];
           
       }
   });

});

// meotodo para traer los dias que faltan para pagar
function diasParaPagar() {

  var htmResponseProx = document.getElementById('htmResponseProx');

  $.ajax({

      url: base_url+"index.php/dashboardnuevo/dias_para_pagar",
      type: 'POST',
      global: false,
      beforeSend: function (xhr) {
          xhr.overrideMimeType("text/plain; charset=utf-8");
      },
      success: function (data) {

          //respuesta del query de dias para pagar
          var Obj=$.parseJSON(data);
          
          var respAjaxProxComp = Obj['html_response'];
          htmResponseProx.innerHTML = respAjaxProxComp;

          // apertura de toas de informacion de proxima compra
          $('.toast').toast('show');

      }
  });
  
}


