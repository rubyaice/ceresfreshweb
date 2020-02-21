$(document).ready(function(){

    document.getElementById('register').style.display='none';

    document.getElementById('data_personal1').style.display='none';
    document.getElementById('data_personal2').style.display='none';
    document.getElementById('formas_pago').style.display='block';


    document.getElementById('afiliate').style.color = '#7dbe41';
    document.getElementById('registrate').style.color = '#7dbe41';
    document.getElementById('direccion').style.color = '#7dbe41';
    document.getElementById('pago').style.color = '#7dbe41';

});

var estado='';
var ciudad='';
var sector='';
/* Inicio Botones con y proximo paso  */




    $("#continuar_datospersonal").click(function(){
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
            document.getElementById('data_personal1').style.display='none';
            document.getElementById('data_personal2').style.display='block';
            document.getElementById('registrate').style.color = '#7dbe41';
            document.getElementById('afiliate').style.color = '#7dbe41';
             document.getElementById('direccion').style.color = '#7dbe41';
        }

    });


/*Botones de pago*/


$("#btninstapago").click(function(){


    var PayCheckBox = $("#Terms2").is(":checked");
    console.log(PayCheckBox);
    if(!PayCheckBox){

        alert("Acepte los términos y condiciones.");
        $('#select').focus();
        $('#select').addClass("requerirerror");

        return;
    }
  var PaymentCDCExpirationMonth = $("#PaymentCDCExpirationMonth").val();
  var PaymentCDCExpirationYear = $("#PaymentCDCExpirationYear").val();
  var PaymentCDCNumber = $("#PaymentCDCNumber").val().length;
  var d = new Date();
  // var month = d.getMonth()+1;
  var ano = d.getFullYear()


  // Validación del Numero de la tarjeta

  if ($("#PaymentCDCNumber").val().length < 15){
      alert("La longitud del número de la tarjeta de crédito es inválida");
      return;
  }
  else
  {

      var str = '';

      for (var i = $("#PaymentCDCNumber").val().length - 1; i >= 0; -- i) {
          str += i & 1 ? $("#PaymentCDCNumber").val().charAt(i) : (parseInt($("#PaymentCDCNumber").val().charAt(i)) * 2).toString();        }

      var sum = str.split('').reduce(function(prev, current) {
          return prev + parseInt(current);
      }, 0);

      if(!(sum % 10 === 0))
      {
          alert("El número de la tarjeta de crédito es inválido");
          return ;
      }

  }

  if (PaymentCDCExpirationYear < ano ){
      alert("La fecha de vencimiento debe ser mayor o igual a la fecha atual");
      return;
  }
  if (PaymentCDCExpirationMonth > 12){
      alert("El mes de vencimiento tiene que ser menor o igual que 12");
      return;
  }


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
document.getElementById('formas_pago').style.display='none';
document.getElementById('resumen_compra').style.display='block';
document.getElementById('btn_pagarinstapago').style.display='block';



var html="<div class='row'>"+
"<div class='col-md-4 col-sm-12 col-xs-12 col-lg-4'>"+
    "<span> PRODUCTO </span>"+
  "</div>"+
"<div class='col-md-4 col-sm-12 col-xs-12 col-lg-4'>"+
    "<span> CANTIDAD </span>"+
"</div>"+
"<div class='col-md-4 col-sm-12 col-xs-12 col-lg-4'>"+
    "<span> PRECIO </span>"+
"</div>"+
"</div>"+
"<br>"+
"<div class='row'>"+
"<div class='col-md-4 col-sm-12 col-xs-12 col-lg-4'>"+
   "<span> NutriBox </span>"+
  "</div>"+
"<div class='col-md-4 col-sm-12 col-xs-12 col-lg-4'>"+
  "<span> 1 </span>"+
 "</div>"+
 "<div class='col-md-4 col-sm-12 col-xs-12 col-lg-4'>"+
 "<span> Bs "+ document.getElementById('MontoP').value +"</span>"+
"</div>"+
"</div>"+
"<br>";

$('#tabla_resumen').html(html);
}
});


$("#btntransferencia").click(function(){
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
        document.getElementById('formas_pago').style.display='none';
        document.getElementById('resumen_compra').style.display='block';
        document.getElementById('btn_pagartransferencia').style.display='block';
        var apellido_login=document.getElementById('apellido_reg').value;
        var nombre_login=document.getElementById('nombre_reg').value;
        var direccion_reg=document.getElementById('direccion_reg').value;

        document.getElementById('Address').value=direccion_reg;
        document.getElementById('datos_comprador').value=nombre_login + " " +apellido_login;
        var html="<div class='row'>"+
        "<div class='col-md-4 col-sm-12 col-xs-12 col-lg-4'>"+
            "<span> PRODUCTO </span>"+
        "</div>"+
        "<div class='col-md-4 col-sm-12 col-xs-12 col-lg-4'>"+
            "<span> CANTIDAD </span>"+
        "</div>"+
        "<div class='col-md-4 col-sm-12 col-xs-12 col-lg-4'>"+
            "<span> PRECIO </span>"+
        "</div>"+
    "</div>"+
    "<br>"+
    "<div class='row'>"+
        "<div class='col-md-4 col-sm-12 col-xs-12 col-lg-4'>"+
        "<span> NutriBox </span>"+
        "</div>"+
        "<div class='col-md-4 col-sm-12 col-xs-12 col-lg-4'>"+
        "<span> 1 </span>"+
        "</div>"+
        "<div class='col-md-4 col-sm-12 col-xs-12 col-lg-4'>"+
        "<span> Bs "+ document.getElementById('PaymentMontoT').value +"</span>"+
        "</div>"+
    "</div>"+
    "<br>";
    $('#tabla_resumen').html(html);
 }
});


$("#btndeposito").click(function(){
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
    document.getElementById('formas_pago').style.display='none';
    document.getElementById('resumen_compra').style.display='block';
    document.getElementById('btn_pagardeposito').style.display='block';
    var apellido_login=document.getElementById('apellido_reg').value;
    var nombre_login=document.getElementById('nombre_reg').value;
    var direccion_reg=document.getElementById('direccion_reg').value;

    document.getElementById('Address').value=direccion_reg;
    document.getElementById('datos_comprador').value=nombre_login + " " +apellido_login;
    var html="<div class='row'>"+
    "<div class='col-md-4 col-sm-12 col-xs-12 col-lg-4'>"+
        "<span> PRODUCTO </span>"+
    "</div>"+
    "<div class='col-md-4 col-sm-12 col-xs-12 col-lg-4'>"+
        "<span> CANTIDAD </span>"+
    "</div>"+
    "<div class='col-md-4 col-sm-12 col-xs-12 col-lg-4'>"+
        "<span> PRECIO </span>"+
    "</div>"+
"</div>"+
"<br>"+
"<div class='row'>"+
    "<div class='col-md-4 col-sm-12 col-xs-12 col-lg-4'>"+
    "<span> NutriBox </span>"+
    "</div>"+
    "<div class='col-md-4 col-sm-12 col-xs-12 col-lg-4'>"+
    "<span> 1 </span>"+
    "</div>"+
    "<div class='col-md-4 col-sm-12 col-xs-12 col-lg-4'>"+
    "<span> Bs "+ document.getElementById('PaymentMontoD').value +"</span>"+
    "</div>"+
"</div>"+
"<br>";
$('#tabla_resumen').html(html);
 }
});



$("#btn_pagarinstapago").click(function(){
    

 var ciudad_reg=ciudad;
 var estado_reg=estado;
 var sector_reg=sector;
 var correo_reg=document.getElementById('correo').value;
 var nombre_reg=document.getElementById('PaymentCDCPersonName').value;
 var apellido_reg=document.getElementById('PaymentCDCPersonLastname').value;
 var apellido_login=document.getElementById('apellido_reg').value;
 var nombre_login=document.getElementById('nombre_reg').value;
 var pais_reg=document.getElementById('pais_reg').value;

 var codigopostal_reg=document.getElementById('codigopostal_reg').value;

 var telefono_reg=document.getElementById('telefono_reg').value;
 var direccion_reg=document.getElementById('direccion_reg').value;

 var PaymentCDCNumber=document.getElementById('PaymentCDCNumber').value;
 var Tipocedula=document.getElementById('PaymentCDCPersonTipoCedula').value;
 var cedula=document.getElementById('PaymentCDCPersonCedula').value;
 var ExpirationYear=document.getElementById('PaymentCDCExpirationYear').value;
 var ExpirationMonth=document.getElementById('PaymentCDCExpirationMonth').value;
 var codigoseguridad=document.getElementById('PaymentCDCCvc').value;
 var MontoP=document.getElementById('MontoP').value;
 var PaymentMethod=2;
 
//------------------------------------------------------------------------

var spinner = document.getElementById('spinner');

btn_pagarinstapago.disabled = true;
spinner.innerHTML += '<span style="margin-top: 24%;margin-left: -280%;" class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span>';

 $.ajax({
     url: base_url+"index.php/registrarusuario/ProcesarInstaPago",
     type: 'POST',
     global: false,
     data: {nombre_reg: nombre_reg,PaymentCDCNumber:PaymentCDCNumber,
        Tipocedula:Tipocedula,apellido_reg:apellido_reg,apellido_login:apellido_login,nombre_login:nombre_login,
        cedula:cedula,ExpirationYear:ExpirationYear,ExpirationMonth:ExpirationMonth,
        pais_reg:pais_reg,ciudad_reg:ciudad_reg,codigopostal_reg:codigopostal_reg,
        estado_reg:estado_reg,telefono_reg:telefono_reg,direccion_reg:direccion_reg,
        correo_reg:correo_reg,sector_reg:sector_reg,codigoseguridad:codigoseguridad,
        MontoP:MontoP,PaymentMethod:PaymentMethod},
     beforeSend: function (xhr) {
         xhr.overrideMimeType("text/plain; charset=utf-8");
     },
     success: function (data) {
        
        //CloseModalWait();

         var $Obj=$.parseJSON(data);
         if($Obj['cod']=='1')
         {location.href=base_url+'index.php/confirmation';}
         else {

            btn_pagarinstapago.disabled = false;
            spinner.innerHTML = '';

            $('#errorDepago').modal('show');

        }


     }
 });


});
$("#btn_pagartransferencia").click(function(){
    

    var PayCheckBox = $("#Terms2").is(":checked");
    console.log(PayCheckBox);
    if(!PayCheckBox){

        alert("Acepte los términos y condiciones.");
        $('#select').focus();
        $('#select').addClass("requerirerror");

        return;
    }

// Datos facturacion
 var nombre_fact=document.getElementById('nombre_reg').value;
 var apellido_fact=document.getElementById('apellido_reg').value;
 var email_fact=document.getElementById('correo').value;
 var sexofact=sexo;
 var tipoCedulafact='';//document.getElementById('tipoCedulafact').value;
 var cedulafact='';//document.getElementById('cedulafact').value;
 var telefono_fact=document.getElementById('telefono_reg').value;
 var pais=document.getElementById('pais_reg').value;


 //Datos de Envio

 var nombre_delivery=document.getElementById('nombre_reg').value;
 var apellido_delivery=document.getElementById('apellido_reg').value;
 var tipoCeduladelivery='';
 var sexodelivery=document.getElementById('sexo_reg').value;
 var ceduladelivery='';
 var email_delivery=document.getElementById('correo').value;
 var telefono_delivery=document.getElementById('telefono_reg').value;
 var codpostal_delivery=document.getElementById('codigopostal_reg').value;
 var ciudad_delivery=ciudad;
 var estado_delivery=estado;
 var sector_delivery=sector;
 var direccion_delivery=document.getElementById('direccion_reg').value;


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

 //---------------------------------------------------------------------------

var spinner = document.getElementById('spinner');

btn_pagartransferencia.disabled = true;
spinner.innerHTML += '<span style="margin-top: 24%;margin-left: -280%;" class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span>';

 $.ajax({
     url: base_url+"index.php/procesarcompra/pago_transferencia",
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
           location.href=base_url+'index.php/confirmation';
          }
         else {
         
            
            btn_pagartransferencia.disabled = false;
            spinner.innerHTML = '';

            $('#errorDepago').modal('show');


        }


     }
 });


});




$("#btn_pagardeposito").click(function(){
    

    var PayCheckBox = $("#Terms2").is(":checked");
    console.log(PayCheckBox);
    if(!PayCheckBox){

        alert("Acepte los términos y condiciones.");
        $('#select').focus();
        $('#select').addClass("requerirerror");

        return;
    }

// Datos facturacion
 var nombre_fact=document.getElementById('nombre_reg').value;
 var apellido_fact=document.getElementById('apellido_reg').value;
 var email_fact=document.getElementById('correo').value;
 var sexofact=sexo;
 var tipoCedulafact='';//document.getElementById('tipoCedulafact').value;
 var cedulafact='';//document.getElementById('cedulafact').value;
 var telefono_fact=document.getElementById('telefono_reg').value;
 var pais=document.getElementById('pais_reg').value;


 //Datos de Envio

 var nombre_delivery=document.getElementById('nombre_reg').value;
 var apellido_delivery=document.getElementById('apellido_reg').value;
 var tipoCeduladelivery='';
 var sexodelivery=document.getElementById('sexo_reg').value;
 var ceduladelivery='';
 var email_delivery=document.getElementById('correo').value;
 var telefono_delivery=document.getElementById('telefono_reg').value;
 var codpostal_delivery=document.getElementById('codigopostal_reg').value;
 var ciudad_delivery=ciudad;
 var estado_delivery=estado;
 var sector_delivery=sector;
 var direccion_delivery=document.getElementById('direccion_reg').value;


 //Tarjeta  datos Transferencia
 var nombre_pago=document.getElementById('PaymentCDCPersonNameD').value;
 var apellido_pago=document.getElementById('PaymentCDCPersonLastnameD').value;
 var referencia_pago=document.getElementById('PaymentRefD').value;
 var Tipocedula_pago=document.getElementById('PaymentCDCPersonTipoCedulaD').value;
 var cedula_pago=document.getElementById('PaymentCDCPersonCedulaD').value;
 var telefono_pago=document.getElementById('PaymentCDCPersonPhoneD').value;
 var banco_emisor=document.getElementById('PaymentBancoReceptorD').value;
 var banco_receptor=document.getElementById('PaymentBancoEmisorD').value;
 var MontoP=document.getElementById('PaymentMontoD').value;
 var PaymentMethod=5;
 //ModalWait();

//---------------------------------------------------------------------------

var spinner = document.getElementById('spinner');

btn_pagardeposito.disabled = true;
spinner.innerHTML += '<span style="margin-top: 24%;margin-left: -280%;" class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span>';


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
           location.href=base_url+'index.php/confirmation';
          }
         else {
         
            
            btn_pagardeposito.disabled = false;
            spinner.innerHTML = '';

            $('#errorDepago').modal('show');


        }


     }
 });


});


/*fin Botones de pago */
/* Inicio Select estado ,ciudad y sector */
$('#pais_reg').change(function(){

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
