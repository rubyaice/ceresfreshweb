$(document).ready(function() {

  if ($('#correo_usuario').val() != null) {

    nombre();
    carrito();
    notificaciones();
    validarNotificaciones();

    

  }

/*mostrar modal de pagina en desarrollo*/

$('#ModalCenter').modal('show')

var scroll_pos = 0;
   $("#left-panel").scroll(function () {
       scroll_pos = $(this).scrollTop();
       if (scroll_pos > 200) {
           $("#left-panel").css('background-color', 'transparent'); //*Transparente
       } else {
           $("#left-panel").css('background-color', 'white'); //*blanco
       }
   });

   contactos();

});

//funcion para leer notificaicones del usuario
function notificaciones (){

  //var correo_usuario = $('#correo_usuario').val();

  $.ajax({

       url: base_url+"index.php/notificaciones",
       type: 'POST',
       global: false,
       beforeSend: function (xhr) {
           xhr.overrideMimeType("text/plain; charset=utf-8");
       },
       success: function (data) {

         var $Obj=$.parseJSON(data);
          //$Obj=$.parseJSON(data);

          var respuesta_notificaicon = $Code=$Obj['notificaciones'];
          var notificacion =document.getElementById('notificaciones');
          notificacion.innerHTML = respuesta_notificaicon;

       }
   });
}

//metodoa para validar la respuesta de la consulta a si el usaurio tien notificaiones pendiente o no 
function validarNotificaciones() {
    
    var notificacionAct = document.getElementById('notificacionAct');

    $.ajax({

        url: base_url+"index.php/notificaciones/ver_notificaciones",
        type: 'POST',
        global: false,
        beforeSend: function (xhr) {
            xhr.overrideMimeType("text/plain; charset=utf-8");
        },
        success: function (data) {
 
          var $Obj=$.parseJSON(data);
           //$Obj=$.parseJSON(data);
 
           var respuesta_notificaicon_val = $Code=$Obj['respuesta'];

           if (respuesta_notificaicon_val == 1) {

            notificacionAct.innerHTML = '<i class="material-icons">notifications_active</i> &nbsp;<span class="red"><b style="color: white;">1</b></span>';
               
           }
           
 
        }
    });
}

$('#btnNotificacion').click(function(){

    

    var notificacionAct = document.getElementById('notificacionAct');

    $.ajax({

        url: base_url+"index.php/notificaciones/act_vista_notficaciones",
        type: 'POST',
        global: false,
        beforeSend: function (xhr) {
            xhr.overrideMimeType("text/plain; charset=utf-8");
        },
        success: function (data) {

            
 
          var $Obj=$.parseJSON(data);
           //$Obj=$.parseJSON(data);
 
           var respuesta_notificaicon_val = $Code=$Obj['respuesta'];

           if (respuesta_notificaicon_val == 1) {

            notificacionAct.innerHTML = '<i class="material-icons">notifications</i>';
               
           }
           
 
        }
    });

});


//funcion para leer notificaicones del usuario
function carrito(){

  //var num_registro = $('#num_registro').val();


  $.ajax({

       url: base_url+"index.php/carrito",
       type: 'POST',
       global: false,
       beforeSend: function (xhr) {
           xhr.overrideMimeType("text/plain; charset=utf-8");
       },
       success: function (data) {

         var $Obj=$.parseJSON(data);
          //$Obj=$.parseJSON(data);

          var respuesta_carrito = $Code=$Obj['cajas'];
          var cajas = document.getElementById('cajas');
          cajas.innerHTML = respuesta_carrito;

       }
   });
}

//funcion para leer notificaicones del usuario
function nombre(){

  var correo_usuario = $('#correo_usuario').val();


  $.ajax({

       url: base_url+"index.php/nombre",
       type: 'POST',
       global: false,
       data: {correo_usuario: correo_usuario},
       beforeSend: function (xhr) {
           xhr.overrideMimeType("text/plain; charset=utf-8");
       },
       success: function (data) {

         var $Obj=$.parseJSON(data);
          //$Obj=$.parseJSON(data);

          var respuesta_nombre = $Code=$Obj['nombre'];
          var nombre = document.getElementById('nombre');
          nombre.innerHTML = respuesta_nombre;

       }
   });
}

/* Validaciones */
function soloLetras(e){
  key = e.keyCode || e.which;
  tecla = String.fromCharCode(key).toLowerCase();
  letras = " áéíóúabcdefghijklmnñopqrstuvwxyz";
  especiales = "8-37-39-46";

  tecla_especial = false
  for(var i in especiales){
      if(key == especiales[i]){
          tecla_especial = true;
          break;
      }
  }

  if(letras.indexOf(tecla)==-1 && !tecla_especial){
      return false;
  }
}

function soloNumeros(e){
  key = e.keyCode || e.which;
  tecla = String.fromCharCode(key).toLowerCase();
  letras = "0123456789";
  especiales = "8-37-39-46";
  tecla_especial = false

  for(var i in especiales){
      if(key == especiales[i]){
          tecla_especial = true;
          break;
      }
  }

  if(letras.indexOf(tecla)==-1 && !tecla_especial){
      return false;
  }
}

function soloEmail(e){
  key = e.keyCode || e.which;
  tecla = String.fromCharCode(key).toLowerCase();
  letras = "áéíóúabcdefghijklmnñopqrstuvwxyz@.-_";
  especiales = "8-37-39-46";

  tecla_especial = false
  for(var i in especiales){
      if(key == especiales[i]){
          tecla_especial = true;
          break;
      }
  }

  if(letras.indexOf(tecla)==-1 && !tecla_especial){
      return false;
  }
}
/* fin Validaciones */

//modal que abre las seccion de ayudda en la pagina "Afiliadoscontrol" - "afiliados_usuario"

$('#btnAyuda').click(function(){

    $('#ayudaModalScrollable').modal('show');

});

$('#btnAyudaM').click(function(){

    $('#ayudaModalScrollable').modal('show');

});

//abrir modal para ver la parte del carrito
$('#btnCarritoModal').click(function(){

    $('#CarritoModal').modal('show');

});

//abrir modal para ver la parte de notificaciones
$('#btnNotificacion').click(function(){

    $('#NotificacionesModal').modal('show');

});

//metodo para enviar id que se recibe de la respuesta de lo que hay en carrito de ese usuario para enviar al AJAX de eliminar del carrito segun desee el usuario
function eliminarCaja(id_item) {

    var interaccion = 1;
    var id = id_item;

    var cajas = document.getElementById('cajas');
    cajas.innerHTML = '<div class="text-center"><div class="spinner-border text-success" role="status"><span class="sr-only">Loading...</span></div></div>';

    $.ajax({

        url: base_url+"index.php/carrito/eliminar_del_carrito",
        type: 'POST',
        global: false,
        data: {

            interaccion: interaccion,
            id: id

        },
        beforeSend: function (xhr) {
            xhr.overrideMimeType("text/plain; charset=utf-8");
        },
        success: function (data) {

            
 
            //rspuesta del query de eliminacion de carrito
            var $Obj=$.parseJSON(data);
            //$Obj=$.parseJSON(data);
                
            var respuesta_elimianr = $Code=$Obj['respuesta'];
            
            //condicional segun la respueat que llegue
            if (respuesta_elimianr == 1) {
                
                //carga de cajas que queden en el carrito o respuesta que venga de la consulta del carrito
                carrito();

            }
 
        }
    });

    
}

//metodo que carga los contactos que vienen de base de datos
function contactos() {

    
    
    var num_contacto = document.getElementById('num_contacto');
    var correo_contacto = document.getElementById('correo_contacto');

    $.ajax({

        url: base_url+"index.php/welcome/cargar_info_contacto",
        type: 'POST',
        global: false,
        beforeSend: function (xhr) {
            xhr.overrideMimeType("text/plain; charset=utf-8");
        },
        success: function (data) {

            
 
            //rspuesta del query de contactos para la pagina
            var Obj=$.parseJSON(data);
            
            var numero_contacto_resp = Obj['numero_contacto'];
            var correo_contacto_resp = Obj['correo_contacto'];

            //definicion de los contactos desde la base de datos
            num_contacto.innerHTML = numero_contacto_resp;
            correo_contacto.innerHTML = correo_contacto_resp;
 
        }
    });

}

  


