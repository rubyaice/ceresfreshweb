$(document ).ready(function() {

});
var PickupPersonName=$('#nombre_delivery').val();
var PickupPersonLastname=$('#apellido_delivery').val();
var PickupPersonPhone=$('#telefono_delivery').val();
var PickupPersonEmail=$('#email_delivery').val();
var PickupPersonCedula=$('#ceduladelivery').val();
var PickupZipCode=$('#codpostal_delivery').val();
var PickupAddress=$('#direccion_delivery').val();
document.getElementById("nombre_delivery").disabled = true;
document.getElementById("apellido_delivery").disabled = true;
document.getElementById("telefono_delivery").disabled = true;
document.getElementById("email_delivery").disabled = true;
document.getElementById("direccion_delivery").disabled = true;
document.getElementById("codpostal_delivery").disabled = true;
document.getElementById("estado_delivery").disabled = true;
document.getElementById("sexodelivery").disabled = true;
document.getElementById("ciudad_delivery").disabled = true;
document.getElementById("sector_delivery").disabled = true;

$("#yomismo").click(function(){

  var checkbox = $("#yomismo").length;

  if(checkbox &&  document.getElementById("yomismo").checked){

      //ACA SE AGREGO ESTA LINEA AL CHECKBOX QUE SE USARA DE RADIO BUTTON
      document.getElementById("paraotro").checked = false;
      //ACA SE DESHABILITAN LOS CAMPOS Y LLENAN LA DATA DE LA PERSONA QUE RECOGE EL PEDIDO
    Deshabilita_y_Llena();

  }else{

      //ACA SE AGREGO ESTA LINEA AL CHECKBOX QUE SE USARA DE RADIO BUTTON
      document.getElementById("paraotro").checked = true;
      //ACA SE HABILITAN LOS CAMPOS Y LIMPIA LA DATA DE LA PERSONA QUE RECOGE EL PEDIDO
     Habilita_y_Vacia();

  }
});

//ACA SE AGREGO EL CODIGO PARA EL CHECKBOX QUE SE USARA DE RADIO BUTTON
$("#paraotro").click(function(){

  var checkbox = $("#paraotro").length;

  if(checkbox && document.getElementById("paraotro").checked){

      //ACA SE AGREGO ESTA LINEA AL CHECKBOX QUE SE USARA DE RADIO BUTTON
      document.getElementById("yomismo").checked = false;
      //ACA SE HABILITAN LOS CAMPOS Y LIMPIA LA DATA DE LA PERSONA QUE RECOGE EL PEDIDO
     Habilita_y_Vacia();

  }else{

      //ACA SE AGREGO ESTA LINEA AL CHECKBOX QUE SE USARA DE RADIO BUTTON
      document.getElementById("yomismo").checked = true;
      //ACA SE DESHABILITAN LOS CAMPOS Y LLENAN LA DATA DE LA PERSONA QUE RECOGE EL PEDIDO
      Deshabilita_y_Llena();

  }

});


 //ACA SE AGREGARON FUNCIONES PARA CAMBIOS EN EL COMPORTAMIENTO DE LOS DATOS DE LA PERSONA QUE RECIBE
 function Deshabilita_y_Llena(){

  $('#nombre_delivery').val(PickupPersonName);
  $('#apellido_delivery').val(PickupPersonLastname);
  $('#telefono_delivery').val(PickupPersonPhone);
  $('#email_delivery').val(PickupPersonEmail);
  $('#ceduladelivery').val(PickupPersonCedula);
  $('#codpostal_delivery').val(PickupZipCode);
  $('#direccion_delivery').val(PickupAddress);

  document.getElementById("nombre_delivery").disabled = true;
  document.getElementById("apellido_delivery").disabled = true;
  document.getElementById("telefono_delivery").disabled = true;
  document.getElementById("email_delivery").disabled = true;
  document.getElementById("direccion_delivery").disabled = true;
  document.getElementById("codpostal_delivery").disabled = true;
  document.getElementById("estado_delivery").disabled = true;
  document.getElementById("sexodelivery").disabled = true;
  document.getElementById("ciudad_delivery").disabled = true;
  document.getElementById("sector_delivery").disabled = true;



}

function Habilita_y_Vacia(){

  $('#nombre_delivery').val('');
  $('#apellido_delivery').val('');
  $('#telefono_delivery').val('');
  $('#email_delivery').val('');
  $('#ceduladelivery').val('');
  $('#codpostal_delivery').val('');
  $('#direccion_delivery').val('');

  document.getElementById("nombre_delivery").disabled = false;
  document.getElementById("apellido_delivery").disabled = false;
  document.getElementById("telefono_delivery").disabled = false;
  document.getElementById("email_delivery").disabled = false;

  document.getElementById("direccion_delivery").disabled = false;
  document.getElementById("codpostal_delivery").disabled = false;
  document.getElementById("estado_delivery").disabled = false;
  document.getElementById("sexodelivery").disabled = false;
  document.getElementById("ciudad_delivery").disabled = false;
  document.getElementById("sector_delivery").disabled = false;


}


var paymethod=document.getElementById('facturacion');

paymethod.addEventListener("click", function(){


  var Cont = 0;
   $("#form_datospersonal").find(".requerir").each(function (index) {
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
   var collapseOne=document.getElementById('collapseOne');
   collapseOne.className ='collapse';
   var iconsCollapseOne=document.getElementById('iconsCollapseOne');
   iconsCollapseOne.className='material-icons collapsed';
   iconsCollapseOne.setAttribute("aria-expanded", "true");


   var collapseTwo=document.getElementById('collapseTwo');
   collapseTwo.className ='collapse show';
   var iconsCollapseTwo=document.getElementById('iconsCollapseTwo');
   iconsCollapseTwo.className='material-icons';
   iconsCollapseTwo.setAttribute("aria-expanded", "true");
   document.getElementById('entrega').style.display='block';
  }

  $('body,html').animate({scrollTop : 0}, 500);


});


var formapago=document.getElementById('formapago');

formapago.addEventListener("click", function(){

  var Cont = 0;
  $("#delivery_data").find(".requerir").each(function (index) {
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

  var collapseTwo=document.getElementById('collapseTwo');
  collapseTwo.className ='collapse';
  var iconsCollapseTwo=document.getElementById('iconsCollapseTwo');
  iconsCollapseTwo.className='material-icons collapsed';
  iconsCollapseTwo.setAttribute("aria-expanded", "false");


  var collapseThere=document.getElementById('collapseThere');
  collapseThere.className ='collapse show';
  var iconsCollapseThere=document.getElementById('iconsCollapseThere');
  iconsCollapseThere.className='material-icons';
  iconsCollapseThere.setAttribute("aria-expanded", "true");
  document.getElementById('div_formas_pago').style.display='block';
}

$('body,html').animate({scrollTop : 0}, 500);

});

var btntransferencia=document.getElementById('btntransferencia');

btntransferencia.addEventListener("click", function(){


  var Cont = 0;
   $("#form_transferencia").find(".requerir").each(function (index) {
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
  var collapseThere=document.getElementById('collapseThere');
  collapseThere.className ='collapse';
  var iconsCollapseThere=document.getElementById('iconsCollapseThere');
  iconsCollapseThere.className='material-icons collapsed';
  iconsCollapseThere.setAttribute("aria-expanded", "false");


  var collapseFour=document.getElementById('collapseFour');
  collapseFour.className ='collapse show';
  var iconsCollapseFour=document.getElementById('iconsCollapseFour');
  iconsCollapseFour.className='material-icons';
  iconsCollapseFour.setAttribute("aria-expanded", "true");
  document.getElementById('resumen_compra').style.display='block';
  document.getElementById('btn_pagartransferencia').style.display='block';
  document.getElementById('btn_pagarinstapago').style.display='none';
  document.getElementById('btn_pagardeposito').style.display='none';

  $('body,html').animate({scrollTop : 0}, 500);

}

});

var btninstapago=document.getElementById('btninstapago');

btninstapago.addEventListener("click", function(){
  var Cont = 0;
   $("#form_instapago").find(".requerir").each(function (index) {
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
  var collapseThere=document.getElementById('collapseThere');
  collapseThere.className ='collapse';
  var iconsCollapseThere=document.getElementById('iconsCollapseThere');
  iconsCollapseThere.className='material-icons collapsed';
  iconsCollapseThere.setAttribute("aria-expanded", "false");


  var collapseFour=document.getElementById('collapseFour');
  collapseFour.className ='collapse show';
  var iconsCollapseFour=document.getElementById('iconsCollapseFour');
  iconsCollapseFour.className='material-icons';
  iconsCollapseFour.setAttribute("aria-expanded", "true");
  document.getElementById('resumen_compra').style.display='block';
  document.getElementById('btn_pagarinstapago').style.display='block';
  document.getElementById('btn_pagartransferencia').style.display='none';
  document.getElementById('btn_pagardeposito').style.display='none';

  $('body,html').animate({scrollTop : 0}, 500);
}

});

var btninstapago=document.getElementById('btndeposito');

btninstapago.addEventListener("click", function(){
  var Cont = 0;
  $("#form_deposito").find(".requerir").each(function (index) {
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
  var collapseThere=document.getElementById('collapseThere');
  collapseThere.className ='collapse';
  var iconsCollapseThere=document.getElementById('iconsCollapseThere');
  iconsCollapseThere.className='material-icons collapsed';
  iconsCollapseThere.setAttribute("aria-expanded", "false");


  var collapseFour=document.getElementById('collapseFour');
  collapseFour.className ='collapse show';
  var iconsCollapseFour=document.getElementById('iconsCollapseFour');
  iconsCollapseFour.className='material-icons';
  iconsCollapseFour.setAttribute("aria-expanded", "true");
  document.getElementById('resumen_compra').style.display='block';
  document.getElementById('btn_pagardeposito').style.display='block';
  document.getElementById('btn_pagarinstapago').style.display='none';
  document.getElementById('btn_pagartransferencia').style.display='none';

  $('body,html').animate({scrollTop : 0}, 500);

}

});


/* Inicio Select estado ,ciudad y sector */


$('#estado_delivery').change(function(){

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
           ciudad_delivery.innerHTML = respuesta;

      }
  });
  });

  $('#ciudad_delivery').change(function(){

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
             sector_delivery.innerHTML = respuesta;

        }
    });
  });
/* fin Select estado ,ciudad y sector */



$("#btn_pagarinstapago").click(function(){
    

    var PayCheckBox = $("#Terms2").is(":checked");
    console.log(PayCheckBox);
    if(!PayCheckBox){

        $('#aceptarTerminosModalLong').modal('show');
        $('#select').focus();
        $('#select').addClass("requerirerror");

        return;
    }


// Datos facturacion
 var nombre_fact=document.getElementById('nombre_fact').value;
 var apellido_fact=document.getElementById('apellido_fact').value;
 var email_fact=document.getElementById('email_fact').value;
 var sexofact=document.getElementById('sexofact').value;
 var tipoCedulafact='';//document.getElementById('tipoCedulafact').value;
 var cedulafact='';//document.getElementById('cedulafact').value;
 var telefono_fact=document.getElementById('telefono_fact').value;
 var pais=document.getElementById('pais').value;


 //Datos de Envio

 var nombre_delivery=document.getElementById('nombre_delivery').value;
 var apellido_delivery=document.getElementById('apellido_delivery').value;
 var tipoCeduladelivery=document.getElementById('tipoCeduladelivery').value;
 var sexodelivery=document.getElementById('sexodelivery').value;
 var ceduladelivery=document.getElementById('ceduladelivery').value;
 var email_delivery=document.getElementById('email_delivery').value;
 var telefono_delivery=document.getElementById('telefono_delivery').value;
 var codpostal_delivery=document.getElementById('codpostal_delivery').value;
 var ciudad_delivery=document.getElementById('ciudad_delivery').value;
 var estado_delivery=document.getElementById('estado_delivery').value;
 var sector_delivery=document.getElementById('sector_delivery').value;
 var direccion_delivery=document.getElementById('direccion_delivery').value;


 //Tarjeta  datos TDC
 var nombre_tdc=document.getElementById('PaymentCDCPersonName').value;
 var apellido_tdc=document.getElementById('PaymentCDCPersonLastname').value;
 var PaymentCDCNumber=document.getElementById('PaymentCDCNumber').value;
 var Tipocedula_tdc=document.getElementById('PaymentCDCPersonTipoCedula').value;
 var cedula_tdc=document.getElementById('PaymentCDCPersonCedula').value;
 var ExpirationYear=document.getElementById('PaymentCDCExpirationYear').value;
 var ExpirationMonth=document.getElementById('PaymentCDCExpirationMonth').value;
 var codigoseguridad=document.getElementById('PaymentCDCCvc').value;
 var MontoP=document.getElementById('MontoP').value;
 var PaymentMethod=2;
 //ModalWait();

 //------------------------------------------------------------

 var spinner = document.getElementById('spinner');

 btn_pagarinstapago.disabled = true;
 spinner.innerHTML += '<span style="margin-top: 24%;margin-left: -110%;" class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span>';

 

 $.ajax({
     url: base_url+"index.php/procesarcomprainst",
     type: 'POST',
     global: false,
     data: {nombre_fact:nombre_fact,apellido_fact:apellido_fact,email_fact:email_fact,sexofact:sexofact,tipoCedulafact:tipoCedulafact,cedulafact:cedulafact,telefono_fact:telefono_fact,pais:pais,nombre_delivery:nombre_delivery,apellido_delivery:apellido_delivery,tipoCeduladelivery:tipoCeduladelivery,ceduladelivery:ceduladelivery,sexodelivery:sexodelivery,email_delivery:email_delivery,telefono_delivery:telefono_delivery,codpostal_delivery:codpostal_delivery,ciudad_delivery:ciudad_delivery,estado_delivery:estado_delivery,sector_delivery:sector_delivery,direccion_delivery:direccion_delivery,nombre_tdc:nombre_tdc,apellido_tdc:apellido_tdc,PaymentCDCNumber:PaymentCDCNumber,Tipocedula_tdc:Tipocedula_tdc,cedula_tdc:cedula_tdc,ExpirationYear:ExpirationYear,ExpirationMonth:ExpirationMonth,codigoseguridad:codigoseguridad,MontoP:MontoP,PaymentMethod:PaymentMethod},
     beforeSend: function (xhr) {
         xhr.overrideMimeType("text/plain; charset=utf-8");
     },
     success: function (data) {
        
        //CloseModalWait();

         var $Obj=$.parseJSON(data);
         if($Obj['cod']=='1')
         {
           carrito();
           notificaciones();
           location.href=base_url+'index.php/confirmationcheck';
          }
         else {

          btn_pagarinstapago.disabled = false;
          spinner.innerHTML = '';

          instapagoFallo();


        }


     }
 });


});


$("#btn_pagartransferencia").click(function(){
  
  debugger;

  var PayCheckBox = $("#Terms2").is(":checked");
  console.log(PayCheckBox);
  if(!PayCheckBox){

      $('#aceptarTerminosModalLong').modal('show');
      $('#select').focus();
      $('#select').addClass("requerirerror");

      return;
  }

  // Datos facturacion
   var nombre_fact=document.getElementById('nombre_fact').value;
   var apellido_fact=document.getElementById('apellido_fact').value;
   var email_fact=document.getElementById('email_fact').value;
   var sexofact=document.getElementById('sexofact').value;
   var tipoCedulafact='';//document.getElementById('tipoCedulafact').value;
   var cedulafact='';//document.getElementById('cedulafact').value;
   var telefono_fact=document.getElementById('telefono_fact').value;
   var pais=document.getElementById('pais').value;


   //Datos de Envio

   var nombre_delivery=document.getElementById('nombre_delivery').value;
   var apellido_delivery=document.getElementById('apellido_delivery').value;
   var tipoCeduladelivery=document.getElementById('tipoCeduladelivery').value;
   var sexodelivery=document.getElementById('sexodelivery').value;
   var ceduladelivery=document.getElementById('ceduladelivery').value;
   var email_delivery=document.getElementById('email_delivery').value;
   var telefono_delivery=document.getElementById('telefono_delivery').value;
   var codpostal_delivery=document.getElementById('codpostal_delivery').value;
   var ciudad_delivery=document.getElementById('ciudad_delivery').value;
   var estado_delivery=document.getElementById('estado_delivery').value;
   var sector_delivery=document.getElementById('sector_delivery').value;
   var direccion_delivery=document.getElementById('direccion_delivery').value;


//Tarjeta  datos Transferencia
var nombre_pago=document.getElementById('PaymentCDCPersonNameT').value;
var apellido_pago=document.getElementById('PaymentCDCPersonLastnameT').value;
var referencia_pago=document.getElementById('PaymentRefT').value;
var Tipocedula_pago=document.getElementById('PaymentCDCPersonTipoCedulaT').value;
var cedula_pago=document.getElementById('PaymentCDCPersonCedulaT').value;
var telefono_pago=document.getElementById('PaymentCDCPersonPhoneT').value;
var banco_emisor=document.getElementById('PaymentBancoReceptorT').value;
var banco_receptor=document.getElementById('PaymentBancoEmisorT').value;
var MontoP=document.getElementById('PaymentMontoT').value;
var PaymentMethod=4;
//ModalWait();

//----------------------------------------------------------------------------

var spinner = document.getElementById('spinner');

btn_pagartransferencia.disabled = true;
 spinner.innerHTML += '<span style="margin-top: 24%;margin-left: -110%;" class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span>';

$.ajax({
   url: base_url+"index.php/procesarcompra/pago_TD",
   type: 'POST',
   global: false,
   data: {nombre_fact:nombre_fact,apellido_fact:apellido_fact,email_fact:email_fact,sexofact:sexofact,tipoCedulafact:tipoCedulafact,cedulafact:cedulafact,telefono_fact:telefono_fact,pais:pais,nombre_delivery:nombre_delivery,apellido_delivery:apellido_delivery,tipoCeduladelivery:tipoCeduladelivery,ceduladelivery:ceduladelivery,sexodelivery:sexodelivery,email_delivery:email_delivery,telefono_delivery:telefono_delivery,codpostal_delivery:codpostal_delivery,ciudad_delivery:ciudad_delivery,estado_delivery:estado_delivery,sector_delivery:sector_delivery,direccion_delivery:direccion_delivery,nombre_pago:nombre_pago,apellido_pago:apellido_pago,referencia_pago:referencia_pago,Tipocedula_pago:Tipocedula_pago,cedula_pago:cedula_pago,telefono_pago:telefono_pago,banco_emisor:banco_emisor,banco_receptor:banco_receptor,MontoP:MontoP,PaymentMethod:PaymentMethod},
   beforeSend: function (xhr) {
       xhr.overrideMimeType("text/plain; charset=utf-8");
   },
   success: function (data) {
      
      //CloseModalWait();

       var $Obj=$.parseJSON(data);
       if($Obj['cod']=='1')
       {
         carrito();
         notificaciones();
         location.href=base_url+'index.php/confirmationcheck';
        }
       else {

        btn_pagartransferencia.disabled = false;
        spinner.innerHTML = '';

        transferenciaFallo();


      }


   }
});


});



// metodo para pagar por zelle por el momento 
$("#btn_pagardeposito").click(function(){
  
  debugger;

  var PayCheckBox = $("#Terms2").is(":checked");
  console.log(PayCheckBox);
  if(!PayCheckBox){

      $('#aceptarTerminosModalLong').modal('show');
      $('#select').focus();
      $('#select').addClass("requerirerror");

      return;
  }

  // Datos facturacion
   var nombre_fact=document.getElementById('nombre_fact').value;
   var apellido_fact=document.getElementById('apellido_fact').value;
   var email_fact=document.getElementById('email_fact').value;
   var sexofact=document.getElementById('sexofact').value;
   var tipoCedulafact='';//document.getElementById('tipoCedulafact').value;
   var cedulafact='';//document.getElementById('cedulafact').value;
   var telefono_fact=document.getElementById('telefono_fact').value;
   var pais=document.getElementById('pais').value;


   //Datos de Envio

   var nombre_delivery=document.getElementById('nombre_delivery').value;
   var apellido_delivery=document.getElementById('apellido_delivery').value;
   var tipoCeduladelivery=document.getElementById('tipoCeduladelivery').value;
   var sexodelivery=document.getElementById('sexodelivery').value;
   var ceduladelivery=document.getElementById('ceduladelivery').value;
   var email_delivery=document.getElementById('email_delivery').value;
   var telefono_delivery=document.getElementById('telefono_delivery').value;
   var codpostal_delivery=document.getElementById('codpostal_delivery').value;
   var ciudad_delivery=document.getElementById('ciudad_delivery').value;
   var estado_delivery=document.getElementById('estado_delivery').value;
   var sector_delivery=document.getElementById('sector_delivery').value;
   var direccion_delivery=document.getElementById('direccion_delivery').value;


//Tarjeta  datos Transferencia
var nombre_pago=document.getElementById('PaymentCDCPersonNameD').value;
var apellido_pago=document.getElementById('PaymentCDCPersonLastnameD').value;
var referencia_pago=document.getElementById('PaymentRefD').value;
var Tipocedula_pago=document.getElementById('PaymentCDCPersonTipoCedulaD').value;
var cedula_pago=document.getElementById('PaymentCDCPersonCedulaD').value;
var telefono_pago=document.getElementById('PaymentCDCPersonPhoneD').value;

//desactivado de los campos de bancos ya que en el pago por zelle no son necesarios
var banco_emisor = 0;
var banco_receptor = 0;
///////////////////////////////////////////////////////////////////////

var MontoP=document.getElementById('PaymentMontoD').value;
var PaymentMethod=5;
//ModalWait();

//-------------------------------------------------------------------

// variable para verificar el pago por zelle
var pagoZelle = 1;

var spinner = document.getElementById('spinner');

btn_pagardeposito.disabled = true;
 spinner.innerHTML += '<span style="margin-top: 24%;margin-left: -110%;" class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span>';

$.ajax({
   url: base_url+"index.php/procesarcompra/pago_TD",
   type: 'POST',
   global: false,
   data: {
     nombre_fact:nombre_fact,
      apellido_fact:apellido_fact,
      email_fact:email_fact,
      sexofact:sexofact,
      tipoCedulafact:tipoCedulafact,
      cedulafact:cedulafact,
      telefono_fact:telefono_fact,
      pais:pais,
      nombre_delivery:nombre_delivery,
      apellido_delivery:apellido_delivery,tipoCeduladelivery:tipoCeduladelivery,
      ceduladelivery:ceduladelivery,
      sexodelivery:sexodelivery,
      email_delivery:email_delivery,
      telefono_delivery:telefono_delivery,codpostal_delivery:codpostal_delivery,
      ciudad_delivery:ciudad_delivery,
      estado_delivery:estado_delivery,
      sector_delivery:sector_delivery,
      direccion_delivery:direccion_delivery,
      nombre_pago:nombre_pago,
      apellido_pago:apellido_pago,
      referencia_pago:referencia_pago,
      Tipocedula_pago:Tipocedula_pago,
      cedula_pago:cedula_pago,
      telefono_pago:telefono_pago,
      banco_emisor:banco_emisor,
      banco_receptor:banco_receptor,
      MontoP:MontoP,
      PaymentMethod:PaymentMethod,
      pagoZelle: pagoZelle
    },
   beforeSend: function (xhr) {
       xhr.overrideMimeType("text/plain; charset=utf-8");
   },
   success: function (data) {
      
      //CloseModalWait();

       var $Obj=$.parseJSON(data);
       if($Obj['cod']=='1')
       {
         carrito();
         notificaciones();
         location.href=base_url+'index.php/confirmationcheck';
        }
       else {

        btn_pagardeposito.disabled = false;
        spinner.innerHTML = '';

        depositoFallo();


      }


   }
});


});


/*fin Botones de pago */

//recargar pagina
function recargarPagina() {

  location.reload();
  
}

//metodo para llamar a modal de fallo de transaccion de instapago
function instapagoFallo() {

  $('#instapagoFallida').modal(
    {
      keyboard: false,
      backdrop: 'static'
    });

  $('#instapagoFallida').modal('show');
    
}

//metodo para llamar a modal de fallo de transaccion de transferencia
function transferenciaFallo() {

  $('#transferenciaFallida').modal(
    {
      keyboard: false,
      backdrop: 'static'
    });

  $('#transferenciaFallida').modal('show');
    
}

//metodo para llamar a modal de fallo de transaccion de deposito
function depositoFallo() {

  $('#depositoFallida').modal(
    {
      keyboard: false,
      backdrop: 'static'
    });

  $('#depositoFallida').modal('show');
    
}

//modal para mostrar cuentas bancarias en caso de deposito o transferencia
$('#modalCuentasT').click(function(){

  $('#cuentasModalCenter').modal('show');

});

$('#modalCuentasD').click(function(){

  $('#cuentasModalZelle').modal('show');

});

//metodo para redireccioonar al usuario al inicio en caso e que no quiera pagar n el momento
$('#pagar_luego').click(function(){

  window.location = base_url+'/index.php/welcome';

});

//metodo que activa el modal de termino y condiciones de la empresa para realizar un pago.
$('#termycond').click(function(){

  $('#terminosModalLong').modal('show');

});
