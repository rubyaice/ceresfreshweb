$(document).ready(function(){


var correo_session=$('#correo_session').val();
if(correo_session!=''){


location.href=base_url+'index.php/detallespago';
        /*  document.getElementById('correo').value =correo_session;
          document.getElementById('register1').style.display='none';
          document.getElementById('register2').style.display='block';
          document.getElementById('texto_comenzar').style.display='block';
          document.getElementById('registrate').style.color = '#7dbe41';*/
        }


});

var estado='';
var ciudad='';
var sector='';
var sexo='';
/* Inicio Botones con y proximo paso  */



    $("#continuar").click(function(){



    let reglas = /^[-\w.%+]{1,64}@(?:[A-Z0-9-]{1,63}\.){1,125}[A-Z]{2,63}$/i;

    var Cont=0;
    if($('#correo_inicio').val()==''){

        Cont=1;
        $('#correo_inicio').addClass("requerirerror");
    }
    else {
        $('#correo_inicio').removeClass("requerirerror");
    }
 if(Cont==0)   {
        if (!reglas.test(document.getElementById('correo_inicio').value)) {



        $('#correo_inicio').addClass("requerirerror");

        }
        else {

            document.getElementById('correo').value =document.getElementById('correo_inicio').value;
            document.getElementById('register1').style.display='none';
            document.getElementById('register2').style.display='block';
            document.getElementById('texto_comenzar').style.display='block';
            document.getElementById('registrate').style.color = '#7dbe41';
            $('#correo_inicio').removeClass("requerirerror");
        }
 }
});

var Contador = 0;

$("#continuar_reg").click(function(){

        

        
        Contador = Contador + 1;

        let reglas = /^[-\w.%+]{1,64}@(?:[A-Z0-9-]{1,63}\.){1,125}[A-Z]{2,63}$/i;
        var correo = document.getElementById('correo').value;
        var clave = document.getElementById('clave').value;
        var nombre_proveedor = document.getElementById('nombre_proveedor').value;

        var Cont=0;
        if($('#correo').val()=='' ){

            Cont=1;
            $('#correo').addClass("requerirerror");
        }
        else {

            $('#correo').removeClass("requerirerror");
        }
        if($('#clave').val()=='' ){
                Cont=1;
                $('#clave').addClass("requerirerror");
        }
        else {

            $('#clave').removeClass("clave");
        }



        if(Cont==0)   {
            if (!reglas.test(document.getElementById('correo').value)) {



            $('#correo').addClass("requerirerror");

            }
            else {

        $('#correo').removeClass("requerirerror");
        $('#clave').removeClass("clave");
        
        //deshabilitar input hasta que llegue la respuesta por AJAX
        $("#continuar_reg").attr('disabled','disabled');


            $.ajax({
                url: base_url+"index.php/registrarusuario",
                type: 'POST',
                global: false,
                data: {
                    correo: correo,
                    nombre_proveedor:nombre_proveedor,
                    clave:clave
                },
                beforeSend: function (xhr) {
                    xhr.overrideMimeType("text/plain; charset=utf-8");
                },
                success: function (data) {

                    

                    var $Obj=$.parseJSON(data);
                    //$Obj=$.parseJSON(data);
                    $Code=$Obj['respuesta'];

                    //vover a habilitar a penas llegue la respuesta
                    $("#continuar_reg").removeAttr('disabled');

                    if ($Code == '5') {
                        
                        $('#clave').addClass("requerirerror");
                        var errorClave = document.getElementById('errorClave');
                        errorClave.innerHTML = "El cliente ya existe. Contraseña incorrecta.";
                        return; 

                    }

                    if ($Code == '7') {
                        
                        $('#clave').addClass("requerirerror");
                        var errorClave = document.getElementById('errorClave');
                        errorClave.innerHTML = "El cliente está afiliado a un usuario.";
                        return; 

                    }

                    if ($Code == '6') {
                        
                        $('#clave').addClass("requerirerror");
                        var errorClave = document.getElementById('errorClave');
                        errorClave.innerHTML = "Esta cuenta No esta Activa.";

                        //definicion de condicional de si se oprime el boton 3 veces
                        if (Contador == 3) {

                            $('#cuentaNoAcModalCenter').modal({
                
                                keyboard: false,
                                backdrop: 'static'
                            });
                            
                            $('#cuentaNoAcModalCenter').modal('show');
                            
                        }

                        return; 

                    }

                    //levantamiento d modal seun la condicion que venga en la respuesta del registro.
                    if ($Code == '10') {
                        
                        $('#correoConfModalCenter').modal({

                            keyboard: false,
                            backdrop: 'static'
                        });
                        
                        $('#correoConfModalCenter').modal('show');
                        return; 

                    }

                    switch ($Obj['estatus']) {
                        case '1':

                        break;
                        case '2':
                            if($Code=='-1'){

                                alert('Estimado usuario su constraseña es incorrecta ...')

                            }else {

                                /*aparicion de primer resumen de pedido
                                var resumenCDP = document.getElementById('resumenCDP');
                                resumenCDP.style.display = 'block';
                                //mostrar correo de la persona que se acada de comnar a registrar
                                var correoUsuarioInfo = document.getElementById('correoUsuarioInfo');
                                correoUsuarioInfo.innerHTML += $('#correo_inicio').val(); 

                                document.getElementById('register').style.display='none';
                                document.getElementById('texto_comenzar').style.display='none';
                                document.getElementById('data_personal').style.display='block';
                                document.getElementById('data_personal1').style.display='block';
                                document.getElementById('afiliate').style.color = '#7dbe41';

                                document.getElementById('registrate').style.color = '#7dbe41';*/

                                location.href=base_url+'index.php/detallespago';
                            }


                            break;
                        case '3':
                        if($Code=='-1'){

                            alert('Estimado usuario su contraseña es incorrecta ...');


                        }else {

                            /*document.getElementById('register').style.display='none';
                            document.getElementById('texto_comenzar').style.display='none';
                            document.getElementById('data_personal2').style.display='none';
                            document.getElementById('formas_pago').style.display='block';

                            document.getElementById('correo').value=$Obj['datapersonal']['correo'];
                            document.getElementById('nombre_reg').value=$Obj['datapersonal']['nombre'];
                            document.getElementById('PaymentCDCPersonNameT').value=$Obj['datapersonal']['nombre'];
                            document.getElementById('PaymentCDCPersonNameD').value=$Obj['datapersonal']['nombre'];
                            document.getElementById('sexo_reg').value=$Obj['datapersonal']['sexo'];
                            document.getElementById('apellido_reg').value=$Obj['datapersonal']['apellido'];
                            document.getElementById('PaymentCDCPersonLastnameT').value=$Obj['datapersonal']['apellido'];
                            document.getElementById('PaymentCDCPersonLastnameD').value=$Obj['datapersonal']['apellido'];
                            document.getElementById('pais_reg').value=$Obj['datapersonal']['pais'];
                            sexo=document.getElementById('sexo_reg').value;
                            ciudad=$Obj['datapersonal']['city'];
                            document.getElementById('codigopostal_reg').value=$Obj['datapersonal']['zipcode'];
                            estado=$Obj['datapersonal']['state'];
                            document.getElementById('telefono_reg').value=$Obj['datapersonal']['phone'];
                            document.getElementById('PaymentCDCPersonPhoneT').value=$Obj['datapersonal']['phone'];
                            document.getElementById('PaymentCDCPersonPhoneD').value=$Obj['datapersonal']['phone'];
                            document.getElementById('direccion_reg').value=$Obj['datapersonal']['address'];
                            sector=value=$Obj['datapersonal']['sector'];
                            document.getElementById('PaymentCDCPersonName').value=$Obj['datapersonal']['nombre'];
                            document.getElementById('PaymentCDCPersonLastname').value=$Obj['datapersonal']['apellido'];


                            $('#Address').html(document.getElementById('direccion_reg').value);
                            $('#datos_comprador').html(document.getElementById('nombre_reg').value+ " " +document.getElementById('apellido_reg').value);

                            document.getElementById('MontoP').value=$Obj['datapersonal']['monto'];

                            document.getElementById('PaymentMontoT').value=$Obj['datapersonal']['monto'];
                             document.getElementById('PaymentMontoD').value=$Obj['datapersonal']['monto'];
                            document.getElementById('afiliate').style.color = '#7dbe41';
                            document.getElementById('registrate').style.color = '#7dbe41';
                            document.getElementById('direccion').style.color = '#7dbe41';
                            document.getElementById('pago').style.color = '#7dbe41';

                            $('body,html').animate({scrollTop : 0}, 500);*/

                            location.href=base_url+'index.php/detallespago';
                        }

                            break;
                        case '4':
                                location.href=base_url+'index.php/welcome';
                                break;


                        default:

                    }


                }

                    });
    }
}

});

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
       
       //validacion de estatura solo con punto ej : 1.7
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
    
    //metodo para esconder modal anterior
    document.getElementById('resumenCDP').style.display='none';

    //datos que se mostrarn en el resumen de pago en la parte de direccion
    var resumenCDD = document.getElementById('resumenCDD');
    resumenCDD.style.display = 'block';

    //datos que se asignaran a la seccion de resumen de la parte de direccion
    var correoUsuarioInfoD = document.getElementById('correoUsuarioInfoD');
    correoUsuarioInfoD.innerHTML += $('#correo_inicio').val();

    var nombresUsuarioInfoD = document.getElementById('nombresUsuarioInfoD');
    nombresUsuarioInfoD.innerHTML += $('#nombre_reg').val()+" "+$('#apellido_reg').val();


    document.getElementById('data_personal1').style.display='none';
    document.getElementById('data_personal2').style.display='block';
    document.getElementById('afiliate').style.color = '#7dbe41';
    document.getElementById('registrate').style.color = '#7dbe41';
    document.getElementById('direccion').style.color = '#7dbe41';

    //funcion para arraastrar toda la pagina hacia arriba para cuando se le de a este boton
    $('body,html').animate({scrollTop : 0}, 500);

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
    sexo=document.getElementById('sexo_reg').value;
    ciudad=document.getElementById('ciudad_reg').value;
    sector=document.getElementById('sector_reg').value;
    estado=document.getElementById('estado_reg').value;
    var codigopostal_reg=document.getElementById('codigopostal_reg').value;
    var estado_reg=document.getElementById('estado_reg').value;
    var telefono_reg=document.getElementById('telefono_reg').value;
    var direccion_reg=document.getElementById('direccion_reg').value;
    var sector_reg=document.getElementById('sector_reg').value;
    document.getElementById('PaymentCDCPersonName').value=document.getElementById('nombre_reg').value;
    document.getElementById('PaymentCDCPersonLastname').value=document.getElementById('apellido_reg').value;
    document.getElementById('PaymentCDCPersonNameT').value=document.getElementById('nombre_reg').value;
    document.getElementById('PaymentCDCPersonLastnameT').value=document.getElementById('apellido_reg').value;
    document.getElementById('PaymentCDCPersonNameD').value=document.getElementById('nombre_reg').value;
    document.getElementById('PaymentCDCPersonLastnameD').value=document.getElementById('apellido_reg').value;
    document.getElementById('PaymentCDCPersonPhoneT').value=document.getElementById('telefono_reg').value;
    document.getElementById('PaymentCDCPersonPhoneD').value=document.getElementById('telefono_reg').value;

    $('#Address').html(document.getElementById('direccion_reg').value);
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

                var precio_bsT = document.getElementById('precio_bsT');
                precio_bsT.innerHTML = '<b>Bs '+$Obj['monto']+'</b>';

                //para el area de esumen de pago del final
                var precio_dolaresF = document.getElementById('precio_dolaresF');
                precio_dolaresF.innerHTML = '<b>$ '+$Obj['montoDolares']+'</b>';

                var precio_bsF = document.getElementById('precio_bsF');
                precio_bsF.innerHTML = '<b>Bs '+$Obj['monto']+'</b>';

                //datos que se asignaran a la seccion de resumen de la parte de pago como tal
                var correoUsuarioInfoT = document.getElementById('correoUsuarioInfoT');
                correoUsuarioInfoT.innerHTML += $('#correo_inicio').val();

                var nombresUsuarioInfoT = document.getElementById('nombresUsuarioInfoT');
                nombresUsuarioInfoT.innerHTML += $('#nombre_reg').val()+" "+$('#apellido_reg').val();

                //-------------------------------------------------------------
                //datos de contacto y direccion del usuario para mostrar en el modal
                var direccionUsuarioInfoT = document.getElementById('direccionUsuarioInfoT');
                direccionUsuarioInfoT.innerHTML += $('#direccion_reg').val();

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
                planNutUser();
                

            break;

            case '-1':

                alert('Registro no exitoso');

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
/* Fin Botones con y proximo paso  */
/*Botones de pago*/


            $("#btninstapago").click(function(){



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

            //ocultar resumen de pago que esta en la forma de pago com tal
            document.getElementById('resumenCDT').style.display='none';

            //datos que se asignaran a la seccion de resumen de la parte de pago como tal
            var correoUsuarioInfoF = document.getElementById('correoUsuarioInfoF');
            correoUsuarioInfoF.innerHTML += $('#correo_inicio').val();

            var nombresUsuarioInfoF = document.getElementById('nombresUsuarioInfoF');
            nombresUsuarioInfoF.innerHTML += $('#nombre_reg').val()+" "+$('#apellido_reg').val();

            //-------------------------------------------------------------
            //datos de contacto y direccion del usuario para mostrar en el modal
            var direccionUsuarioInfoF = document.getElementById('direccionUsuarioInfoF');
            direccionUsuarioInfoF.innerHTML += $('#direccion_reg').val();

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
                    "<span> Bs "+ document.getElementById('MontoP').value +"</span>"+
                    "</div>"+
                "</div>"+
                "<br>";
                $('#tabla_resumen').html(html);

                //ocultar resumen de pago que esta en la forma de pago com tal
                document.getElementById('resumenCDT').style.display='none';

                //datos que se asignaran a la seccion de resumen de la parte de pago como tal
                var correoUsuarioInfoF = document.getElementById('correoUsuarioInfoF');
                correoUsuarioInfoF.innerHTML += $('#correo_inicio').val();

                var nombresUsuarioInfoF = document.getElementById('nombresUsuarioInfoF');
                nombresUsuarioInfoF.innerHTML += $('#nombre_reg').val()+" "+$('#apellido_reg').val();

                //-------------------------------------------------------------
                //datos de contacto y direccion del usuario para mostrar en el modal
                var direccionUsuarioInfoF = document.getElementById('direccionUsuarioInfoF');
                direccionUsuarioInfoF.innerHTML += $('#direccion_reg').val();

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
                "<span> Bs "+ document.getElementById('MontoP').value +"</span>"+
                "</div>"+
            "</div>"+
            "<br>";
            $('#tabla_resumen').html(html);
            
            //ocultar resumen de pago que esta en la forma de pago com tal
            document.getElementById('resumenCDT').style.display='none';

            //datos que se asignaran a la seccion de resumen de la parte de pago como tal
            var correoUsuarioInfoF = document.getElementById('correoUsuarioInfoF');
            correoUsuarioInfoF.innerHTML += $('#correo_inicio').val();

            var nombresUsuarioInfoF = document.getElementById('nombresUsuarioInfoF');
            nombresUsuarioInfoF.innerHTML += $('#nombre_reg').val()+" "+$('#apellido_reg').val();

            //-------------------------------------------------------------
            //datos de contacto y direccion del usuario para mostrar en el modal
            var direccionUsuarioInfoF = document.getElementById('direccionUsuarioInfoF');
            direccionUsuarioInfoF.innerHTML += $('#direccion_reg').val();

            var codigoPUsuarioInfoF = document.getElementById('codigoPUsuarioInfoF');
            codigoPUsuarioInfoF.innerHTML += $('#codigopostal_reg').val();

            var telefonoPUsuarioInfoF = document.getElementById('telefonoPUsuarioInfoF');
            telefonoPUsuarioInfoF.innerHTML += $('#telefono_reg').val();

            document.getElementById('resumenCDF').style.display='block';

            $('body,html').animate({scrollTop : 0}, 500);
            }
        });



            $("#btn_pagarinstapago").click(function(){
               // 
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
             var direccion_reg=document.getElementById('direccion_reg').value;

             var PaymentCDCNumber=document.getElementById('PaymentCDCNumber').value;
             var Tipocedula=document.getElementById('PaymentCDCPersonTipoCedula').value;
             var cedula=document.getElementById('PaymentCDCPersonCedula').value;
             var ExpirationYear=document.getElementById('PaymentCDCExpirationYear').value;
             var ExpirationMonth=document.getElementById('PaymentCDCExpirationMonth').value;
             var codigoseguridad=document.getElementById('PaymentCDCCvc').value;
             var MontoP=document.getElementById('MontoP').value;
             var PaymentMethod=2;
             
            //------------------------------------------------------------------

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
                    
                   // CloseModalWait();

                     var $Obj=$.parseJSON(data);
                     if($Obj['cod']=='1'){

                        location.href=base_url+'index.php/confirmation';
                     }
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

         //-------------------------------------------------------------

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
         
        //------------------------------------------------------------------

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

  //modal para mostrar cuentas bancarias en caso de deposito o transferencia
  $('#modalCuentasT').click(function(){

    $('#cuentasModalCenter').modal('show');

  });

  $('#modalCuentasD').click(function(){

    $('#cuentasModalCenter').modal('show');

  });

  //metodo para redireccioonar al usuario al inicio en caso e que no quiera pagar n el momento
  $('#pagar_luego').click(function(){

    window.location = base_url+'/index.php/welcome';

  });

  //metodo que activa el modal de termino y condiciones de la empresa para realizar un pago.
  $('#termycond').click(function(){

    $('#terminosModalLong').modal('show');

  });

  //metodo para al momento de dar click en el boton de aceptar vaya a la pagina de inicio de ceresfresh.
  $('#btnAceptarInicio').click(function(){

    window.location = base_url;

  });

  //metodo para al momento de dar click en el boton de aceptar vaya a la pagina de inicio de ceresfresh.
  $('#btnCuentaNoAct').click(function(){

    

    var correo = document.getElementById('correo').value;
    var clave = document.getElementById('clave').value;
    var errorClave = document.getElementById('errorClave');

    $.ajax({
        url: base_url+"index.php/Registrarusuario/reenviar_activacion_correo",
        type: 'POST',
        global: false,
        data: {

            correo: correo,
            clave: clave

        },
        beforeSend: function (xhr) {
            xhr.overrideMimeType("text/plain; charset=utf-8");
        },
        success: function (data) {

            
  
            var $Obj=$.parseJSON(data);
            var respuesta = $Code=$Obj['respuesta_activacion'];

            if (respuesta == 1) {

                errorClave.innerHTML = '<b style="color: #7dbe41;">Correo de activación reenviado.</b>';

            }

            if (respuesta == 2) {

                errorClave.innerHTML = "<b>Error de envío de correo.</b>";
  
            }

            if (respuesta == 3) {

                errorClave.innerHTML = "<b>Credenciales no validas.</b>";
 
            }

            if (respuesta == 4) {

                errorClave.innerHTML = "<b>Error, verifique su conexión a internet.</b>";
 
            }
            
        }
    });

  });
