$(document).ready(function(){

    document.getElementById('register').style.display='none';
    document.getElementById('data_personal').style.display='block';
    document.getElementById('data_personal1').style.display='block';
    document.getElementById('afiliate').style.color = '#7dbe41';
    document.getElementById('registrate').style.color = '#7dbe41';

    var correoUsuarioInfo = document.getElementById('correoUsuarioInfo');
    correoUsuarioInfo.innerHTML += $('#correo').val();


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

            var regex = new RegExp("^[0-9]{1,}([\\.][0-9]{1,2}){0,1}$", "gm");
            var estatura_reg=$('#estatura_reg').val(); // fill this in
            var match;
            var flag=false;

            var span = document.getElementById('span');

            while ((match = regex.exec(estatura_reg)) != null) {
                flag=true;
                
          
            if (match.index === regex.lastIndex) {
                ++regex.lastIndex;
            }
           
           
            }
            if(!flag){
    
                $('#estatura_reg').addClass('requerirerror');
                Cont++;
                span.innerHTML +='<div style=" margin-top: -4%;"><span style="color:red; font-size: 11pt;">Por favor use " . " en lugar de otro caracter, ej: 1.70</span></div>';

            }
            else{
                $('#estatura_reg').removeClass('requerirerror');

            }
        if(Cont==0){
            document.getElementById('data_personal1').style.display='none';
            document.getElementById('data_personal2').style.display='block';
            document.getElementById('registrate').style.color = '#7dbe41';
            document.getElementById('direccion').style.color = '#7dbe41';

            document.getElementById('resumenCDP').style.display = 'none';

            //datos que se asignaran a la seccion de resumen de la parte de direccion
            var correoUsuarioInfoD = document.getElementById('correoUsuarioInfoD');
            correoUsuarioInfoD.innerHTML += $('#correo').val();

            var nombresUsuarioInfoD = document.getElementById('nombresUsuarioInfoD');
            nombresUsuarioInfoD.innerHTML += $('#nombre_reg').val()+" "+$('#apellido_reg').val();

            document.getElementById('resumenCDD').style.display = 'block';
        }

    });


    $("#continuar_direccion").click(function(){

        
            var Cont = 0;
            $("#form_direccion").find(".requerir").each(function (index) {
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

                var correo_reg=document.getElementById('correo').value;
                var nombre_reg=document.getElementById('nombre_reg').value;
                var sexo_reg=document.getElementById('sexo_reg').value;
                var estatura_reg=document.getElementById('estatura_reg').value;
                var act_fisica_reg=document.getElementById('act_fisica_reg').value;
                var apellido_reg=document.getElementById('apellido_reg').value;
                var edad_reg=document.getElementById('edad_reg').value;
                var peso_reg=document.getElementById('peso_reg').value;
                var condicion_esp_reg=document.getElementById('condicion_esp_reg').value;
                var pais_reg=document.getElementById('pais_reg').value;
                var ciudad_reg=document.getElementById('ciudad_reg').value;
                ciudad=document.getElementById('ciudad_reg').value;
                sector=document.getElementById('sector_reg').value;
                estado=document.getElementById('estado_reg').value;
                var codigopostal_reg=document.getElementById('codigopostal_reg').value;
                var estado_reg=document.getElementById('estado_reg').value;
                var telefono_reg=document.getElementById('telefono_reg').value;

                //mejora en direccion
                var direccion_reg_av_cl = document.getElementById('direccion_reg_av_cl').value;
                //var direccion_reg_ed_cs = document.getElementById('direccion_reg_ed_cs').value;

                var direccion_reg = direccion_reg_av_cl;
                var sector_reg=document.getElementById('sector_reg').value;

                document.getElementById('PaymentCDCPersonName').value=document.getElementById('nombre_reg').value;
                document.getElementById('PaymentCDCPersonLastname').value=document.getElementById('apellido_reg').value;
                document.getElementById('PaymentCDCPersonNameT').value=document.getElementById('nombre_reg').value;
                document.getElementById('PaymentCDCPersonLastnameT').value=document.getElementById('apellido_reg').value;
                document.getElementById('PaymentCDCPersonNameD').value=document.getElementById('nombre_reg').value;
                document.getElementById('PaymentCDCPersonLastnameD').value=document.getElementById('apellido_reg').value;
                document.getElementById('PaymentCDCPersonPhoneT').value=document.getElementById('telefono_reg').value;
                document.getElementById('PaymentCDCPersonPhoneD').value=document.getElementById('telefono_reg').value;

                

                $('#Address').html(direccion_reg);
                $('#datos_comprador').html(document.getElementById('nombre_reg').value+ " " +document.getElementById('apellido_reg').value);
            $.ajax({
                url: base_url+"index.php/registrarusuario/insertar_en_afiliacion",
                type: 'POST',
                global: false,
                data: {nombre_reg: nombre_reg,sexo_reg:sexo_reg,estatura_reg:estatura_reg,act_fisica_reg:act_fisica_reg,apellido_reg:apellido_reg,edad_reg:edad_reg,peso_reg:peso_reg,condicion_esp_reg:condicion_esp_reg,pais_reg:pais_reg,ciudad_reg:ciudad_reg,codigopostal_reg:codigopostal_reg,estado_reg:estado_reg,telefono_reg:telefono_reg,direccion_reg:direccion_reg,correo_reg:correo_reg,sector_reg:sector_reg},
                beforeSend: function (xhr) {
                    xhr.overrideMimeType("text/plain; charset=utf-8");
                },
                success: function (data) {
                    
                    var $Obj=$.parseJSON(data);
                    //var respuesta = $Obj['estado'];

                    switch ($Obj['estatus']) {
                    case '0':
                        alert('Ya existe un persona afiliada con este correo . Si desea desafiliarse y registrarse de forma independiente debe realizar una solicitud de desafialiación de correo ');
                        //location.href=base_url+'index.php/login';
                        Location.reload();
                        break;
                        case '3':
                        document.getElementById('data_personal2').style.display='none';
                        document.getElementById('formas_pago').style.display='block';
                        document.getElementById('MontoP').value=$Obj['monto'];
                        document.getElementById('PaymentMontoT').value=$Obj['monto'];
                        document.getElementById('PaymentMontoD').value=$Obj['monto'];
                        document.getElementById('afiliate').style.color = '#7dbe41';
                        document.getElementById('registrate').style.color = '#7dbe41';
                        document.getElementById('direccion').style.color = '#7dbe41';
                        document.getElementById('pago').style.color = '#7dbe41';

                        //metodo para esconder modal anterior
                        document.getElementById('resumenCDP').style.display='none';

                        //metodo para esconder el resumen de direccion
                        var resumenCDD = document.getElementById('resumenCDD');
                        resumenCDD.style.display = 'none';

                        //datos de resumen de compra segun el plan nutrcional que le toco al usaurio regstrado
                        var precio_dolaresT = document.getElementById('precio_dolaresT');
                        precio_dolaresT.innerHTML = '<b>$ '+$Obj['montoDolares']+'</b>';

                        //sustituir el valor del monto a cancelar por el valor correcto en dolares
                        var valorEnDolares = $Obj['montoDolares'];
                        $('#montoDZelle').val(valorEnDolares);

                        var precio_bsT = document.getElementById('precio_bsT');
                        precio_bsT.innerHTML = '<b>Bs '+$Obj['monto']+'</b>';

                        //para el area de esumen de pago del final
                        var precio_dolaresF = document.getElementById('precio_dolaresF');
                        precio_dolaresF.innerHTML = '<b>$ '+$Obj['montoDolares']+'</b>';

                        var precio_bsF = document.getElementById('precio_bsF');
                        precio_bsF.innerHTML = '<b>Bs '+$Obj['monto']+'</b>';

                        //datos que se asignaran a la seccion de resumen de la parte de pago como tal
                        var correoUsuarioInfoT = document.getElementById('correoUsuarioInfoT');
                        correoUsuarioInfoT.innerHTML += $('#correo').val();

                        var nombresUsuarioInfoT = document.getElementById('nombresUsuarioInfoT');
                        nombresUsuarioInfoT.innerHTML += $('#nombre_reg').val()+" "+$('#apellido_reg').val();

                        //-------------------------------------------------------------
                        //datos de contacto y direccion del usuario para mostrar en el modal
                        var direccionUsuarioInfoT = document.getElementById('direccionUsuarioInfoT');
                        direccionUsuarioInfoT.innerHTML += direccion_reg;

                        var codigoPUsuarioInfoT = document.getElementById('codigoPUsuarioInfoT');
                        codigoPUsuarioInfoT.innerHTML += $('#codigopostal_reg').val();

                        var telefonoPUsuarioInfoT = document.getElementById('telefonoPUsuarioInfoT');
                        telefonoPUsuarioInfoT.innerHTML += $('#telefono_reg').val();

                        //aparicion d eresumen de pago en la seccion de pago como tal
                        //datos que se mostrarn en el resumen de pago en la parte de direccion
                        var resumenCDT = document.getElementById('resumenCDT');
                        resumenCDT.style.display = 'block';

                        //funcion para arraastrar toda la pagina hacia arriba para cuando se le de a este boton
                        $('body,html').animate({scrollTop : 0}, 500);

                        //levantamiento de modal para seccion explicativa de pago final
                        $('#casiEstamosListosModal').modal(
                            {
                              keyboard: false,
                              backdrop: 'static'
                            });
                        $('#casiEstamosListosModal').modal('show');
                        comidasPlanUser();
                        planNutUser();
                        break;
                        
                    case '-1':
                    alert('Registro no exitoso');
                    ///location.href=base_url+'index.php/login';
                    Location.reload();
                        break;
                    default:

                    }
                }
            });

            }

            });

//funcion para hacer un AJAX loco de prueba
function planNutUser() {

    

    var llamdo = 1;
    var planNutric = document.getElementById('planNutric');
    var KcalPlan = document.getElementById('KcalPlan');
    KcalPlan.innerHTML = '<div class="spinner-border text-success" role="status"><span class="sr-only">Loading...</span></div>';
    
    $.ajax({

        url: base_url+"index.php/registrarusuario/plan_nut_modal_reg",
        type: 'POST',
        global: false,
        data: {llamdo: llamdo},
        beforeSend: function (xhr) {
            xhr.overrideMimeType("text/plain; charset=utf-8");
        },
        success: function (data) {

            

            var $Obj=$.parseJSON(data);
            //$Obj=$.parseJSON(data);
            var respuesta = $Obj['html'];
            var respuesta_Kcal = $Obj['calorias_usuario'];
            //planNutric.innerHTML = respuesta;
            KcalPlan.innerHTML = respuesta_Kcal;

        }
    });

}

//metodo para traer las comidas del usuario segun el plan nutricional
function comidasPlanUser() {
    
    var recibido = 1;
    var comidasPlan = document.getElementById('comidasPlan');

    comidasPlan.innerHTML = '<div class="spinner-border text-success" role="status"><span class="sr-only">Loading...</span></div>';
    
    $.ajax({

        url: base_url+"index.php/registrarusuario/cargar_comidas_plan",
        type: 'POST',
        global: false,
        data: {recibido: recibido},
        beforeSend: function (xhr) {
            xhr.overrideMimeType("text/plain; charset=utf-8");
        },
        success: function (data) {

            

            var $Obj=$.parseJSON(data);
            //$Obj=$.parseJSON(data);
            var html_respuesta = $Obj['html_respuesta'];
            var html_cont = $Obj['html_cont'];
            //planNutric.innerHTML = respuesta;

            comidasPlan.innerHTML = '<b>[ Nuestra #Nutri<span style="color: #7dbe41;">Box</span> está preparada para cumplir con tu plan nutricional para una semana con '+html_cont+' comidas diarias: '+html_respuesta+']</b>'

            //comidasPlan.innerHTML = html_respuesta;
            //comidasCont.innerHTML = html_cont;

        }
    });

}

/* Fin Botones con y proximo paso  */
/*Botones de pago*/


$("#btninstapago").click(function(){


    /*var PayCheckBox = $("#Terms2").is(":checked");
    console.log(PayCheckBox);
    if(!PayCheckBox){

        alert("Acepte los términos y condiciones.");
        $('#select').focus();
        $('#select').addClass("requerirerror");

        return;
    }*/
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



var html = "<table class='table'>"+
    "<thead>"+
        "<tr>"+
            "<th scope='col'>Producto</th>"+
            "<th scope='col'>Cantidad</th>"+
            "<th scope='col'>Precio</th>"+
        "</tr>"+
    "</thead>"+
    "<tbody>"+
        "<tr>"+
            "<th scope='row'>NutriBox</th>"+
            "<th scope='row'>1</th>"+
            "<th scope='row'>Bs "+ document.getElementById('MontoP').value +"</th>"+
        "</tr>"+
    "</tbody>"+
"</table>";

$('#tabla_resumen').html(html);

//ocultar resumen de pago que esta en la forma de pago com tal
document.getElementById('resumenCDT').style.display='none';

//datos que se asignaran a la seccion de resumen de la parte de pago como tal
var correoUsuarioInfoF = document.getElementById('correoUsuarioInfoF');
correoUsuarioInfoF.innerHTML += $('#correo').val();

var nombresUsuarioInfoF = document.getElementById('nombresUsuarioInfoF');
nombresUsuarioInfoF.innerHTML += $('#nombre_reg').val()+" "+$('#apellido_reg').val();

//-------------------------------------------------------------
//datos de contacto y direccion del usuario para mostrar en el modal
var direccionUsuarioInfoF = document.getElementById('direccionUsuarioInfoF');
//mejora en direccion
var direccion_reg_av_cl = document.getElementById('direccion_reg_av_cl').value;
//var direccion_reg_ed_cs = document.getElementById('direccion_reg_ed_cs').value;

var direccion_reg = direccion_reg_av_cl;
direccionUsuarioInfoF.innerHTML += direccion_reg;

var codigoPUsuarioInfoF = document.getElementById('codigoPUsuarioInfoF');
codigoPUsuarioInfoF.innerHTML += $('#codigopostal_reg').val();

var telefonoPUsuarioInfoF = document.getElementById('telefonoPUsuarioInfoF');
telefonoPUsuarioInfoF.innerHTML += $('#telefono_reg').val();

document.getElementById('resumenCDF').style.display='block';

$('body,html').animate({scrollTop : 0}, 500);

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
        //mejora en direccion
        var direccion_reg_av_cl = document.getElementById('direccion_reg_av_cl').value;
        //var direccion_reg_ed_cs = document.getElementById('direccion_reg_ed_cs').value;

        var direccion_reg = direccion_reg_av_cl;

        document.getElementById('Address').value=direccion_reg;
        document.getElementById('datos_comprador').value=nombre_login + " " +apellido_login;

       var html = "<table class='table'>"+
    "<thead>"+
        "<tr>"+
            "<th scope='col'>Producto</th>"+
            "<th scope='col'>Cantidad</th>"+
            "<th scope='col'>Precio</th>"+
        "</tr>"+
    "</thead>"+
    "<tbody>"+
        "<tr>"+
            "<th scope='row'>NutriBox</th>"+
            "<th scope='row'>1</th>"+
            "<th scope='row'>Bs "+ document.getElementById('PaymentMontoT').value +"</th>"+
        "</tr>"+
    "</tbody>"+
"</table>";
    $('#tabla_resumen').html(html);

    //ocultar resumen de pago que esta en la forma de pago com tal
    document.getElementById('resumenCDT').style.display='none';

    //datos que se asignaran a la seccion de resumen de la parte de pago como tal
    var correoUsuarioInfoF = document.getElementById('correoUsuarioInfoF');
    correoUsuarioInfoF.innerHTML += $('#correo').val();

    var nombresUsuarioInfoF = document.getElementById('nombresUsuarioInfoF');
    nombresUsuarioInfoF.innerHTML += $('#nombre_reg').val()+" "+$('#apellido_reg').val();

    //-------------------------------------------------------------
    //datos de contacto y direccion del usuario para mostrar en el modal
    var direccionUsuarioInfoF = document.getElementById('direccionUsuarioInfoF');
    direccionUsuarioInfoF.innerHTML += direccion_reg;

    var codigoPUsuarioInfoF = document.getElementById('codigoPUsuarioInfoF');
    codigoPUsuarioInfoF.innerHTML += $('#codigopostal_reg').val();

    var telefonoPUsuarioInfoF = document.getElementById('telefonoPUsuarioInfoF');
    telefonoPUsuarioInfoF.innerHTML += $('#telefono_reg').val();

    document.getElementById('resumenCDF').style.display='block';

    $('body,html').animate({scrollTop : 0}, 500);
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
    //mejora en direccion
    var direccion_reg_av_cl = document.getElementById('direccion_reg_av_cl').value;
    //var direccion_reg_ed_cs = document.getElementById('direccion_reg_ed_cs').value;

    var direccion_reg = direccion_reg_av_cl;

    document.getElementById('Address').value = direccion_reg;
    document.getElementById('datos_comprador').value=nombre_login + " " +apellido_login;

    var html = "<table class='table'>"+
    "<thead>"+
        "<tr>"+
            "<th scope='col'>Producto</th>"+
            "<th scope='col'>Cantidad</th>"+
            "<th scope='col'>Precio</th>"+
        "</tr>"+
    "</thead>"+
    "<tbody>"+
        "<tr>"+
            "<th scope='row'>NutriBox</th>"+
            "<th scope='row'>1</th>"+
            "<th scope='row'>Bs "+ document.getElementById('PaymentMontoD').value +"</th>"+
        "</tr>"+
    "</tbody>"+
"</table>";

$('#tabla_resumen').html(html);

//ocultar resumen de pago que esta en la forma de pago com tal
document.getElementById('resumenCDT').style.display='none';

//datos que se asignaran a la seccion de resumen de la parte de pago como tal
var correoUsuarioInfoF = document.getElementById('correoUsuarioInfoF');
correoUsuarioInfoF.innerHTML += $('#correo').val();

var nombresUsuarioInfoF = document.getElementById('nombresUsuarioInfoF');
nombresUsuarioInfoF.innerHTML += $('#nombre_reg').val()+" "+$('#apellido_reg').val();

//-------------------------------------------------------------
//datos de contacto y direccion del usuario para mostrar en el modal
var direccionUsuarioInfoF = document.getElementById('direccionUsuarioInfoF');
direccionUsuarioInfoF.innerHTML += direccion_reg;

var codigoPUsuarioInfoF = document.getElementById('codigoPUsuarioInfoF');
codigoPUsuarioInfoF.innerHTML += $('#codigopostal_reg').val();

var telefonoPUsuarioInfoF = document.getElementById('telefonoPUsuarioInfoF');
telefonoPUsuarioInfoF.innerHTML += $('#telefono_reg').val();

document.getElementById('resumenCDF').style.display='block';

$('body,html').animate({scrollTop : 0}, 500);
 }
});



$("#btn_pagarinstapago").click(function(){
    

    var PayCheckBox = $("#Terms2").is(":checked");
    console.log(PayCheckBox);
    if(!PayCheckBox){

        $('#aceptarTerminosModalLong').modal('show');
        $('#select').focus();
        $('#select').addClass("requerirerror");

        return;
    }

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
 //mejora en direccion
 var direccion_reg_av_cl = document.getElementById('direccion_reg_av_cl').value;
 //var direccion_reg_ed_cs = document.getElementById('direccion_reg_ed_cs').value;

 var direccion_reg = direccion_reg_av_cl;

 var PaymentCDCNumber=document.getElementById('PaymentCDCNumber').value;
 var Tipocedula=document.getElementById('PaymentCDCPersonTipoCedula').value;
 var cedula=document.getElementById('PaymentCDCPersonCedula').value;
 var ExpirationYear=document.getElementById('PaymentCDCExpirationYear').value;
 var ExpirationMonth=document.getElementById('PaymentCDCExpirationMonth').value;
 var codigoseguridad=document.getElementById('PaymentCDCCvc').value;
 var MontoP=document.getElementById('MontoP').value;
 var PaymentMethod=2;
 //ModalWait();

 //-------------------------------------------------------------------------

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

        $('#aceptarTerminosModalLong').modal('show');
        $('#select').focus();
        $('#select').addClass("requerirerror");

        return;
    }

// Datos facturacion
 var nombre_fact=document.getElementById('nombre_reg').value;
 var apellido_fact=document.getElementById('apellido_reg').value;
 var email_fact=document.getElementById('correo').value;
 var sexofact=document.getElementById('sexo_reg').value;
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
 //mejora en direccion
 var direccion_reg_av_cl = document.getElementById('direccion_reg_av_cl').value;
 //var direccion_reg_ed_cs = document.getElementById('direccion_reg_ed_cs').value;

 var direccion_reg = direccion_reg_av_cl;
 var direccion_delivery=direccion_reg;


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

 //-----------------------------------------------------------------------

 var spinner = document.getElementById('spinner');

 btn_pagartransferencia.disabled = true;
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

        $('#aceptarTerminosModalLong').modal('show');
        $('#select').focus();
        $('#select').addClass("requerirerror");

        return;
    }

// Datos facturacion
 var nombre_fact=document.getElementById('nombre_reg').value;
 var apellido_fact=document.getElementById('apellido_reg').value;
 var email_fact=document.getElementById('correo').value;
 var sexofact=document.getElementById('sexo_reg').value;
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
 var direccion_reg_av_cl = document.getElementById('direccion_reg_av_cl').value;
 //var direccion_reg_ed_cs = document.getElementById('direccion_reg_ed_cs').value;

 var direccion_reg = direccion_reg_av_cl;
 var direccion_delivery=direccion_reg;


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

 //-----------------------------------------------------------------------------

    // variable para confirmacion del pago por zelle
    var pagoZelle = 1;

 var spinner = document.getElementById('spinner');

btn_pagardeposito.disabled = true;
spinner.innerHTML += '<span style="margin-top: 24%;margin-left: -280%;" class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span>';

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
         telefono_fact:telefono_fact,pais:pais,nombre_delivery:nombre_delivery,apellido_delivery:apellido_delivery,tipoCeduladelivery:tipoCeduladelivery,ceduladelivery:ceduladelivery,
         sexodelivery:sexodelivery,
         email_delivery:email_delivery,
         telefono_delivery:telefono_delivery,codpostal_delivery:codpostal_delivery,ciudad_delivery:ciudad_delivery,
         estado_delivery:estado_delivery,
         sector_delivery:sector_delivery,direccion_delivery:direccion_delivery,
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
         pagoZelle
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

//---------------------------------------------------------------------------------

//modal para mostrar cuentas bancarias en caso de deposito o transferencia
$('#modalCuentasT').click(function(){

    $('#cuentasModalCenter').modal('show');

  });

  // modal para mostrar informacion de pago por zelle
  $('#modalCuentasD').click(function(){

    var correoZelleD = $('#correo').val();;

    $('#cuentasModalZelle').modal('show');
    $('#correoZelleD').val(correoZelleD);
  
  });

  //metodo para redireccioonar al usuario al inicio en caso e que no quiera pagar n el momento
  $('#pagar_luego').click(function(){

    window.location = base_url+'/index.php/welcome';

  });

  //metodo que activa el modal de termino y condiciones de la empresa para realizar un pago.
  $('#termycond').click(function(){

    $('#terminosModalLong').modal('show');

  });