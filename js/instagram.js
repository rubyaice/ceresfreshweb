$(document).ready(function(){

    comprobarPlanUser();
    intagramService();

});

// inicio de servicio en instagram
function intagramService() {

    

    var instagramArea = document.getElementById('instagramArea');
    
    $.ajax({

        url: base_url+"index.php/welcome/instagram_service",
        type: 'POST',
        global: false,
        /*data: {
          activacion: activacion,
          correo_afiliado: correo_afiliado
        },*/
        beforeSend: function (xhr) {
            xhr.overrideMimeType("text/plain; charset=utf-8");

            //proceso que hace la pagina mientas esta cargando las imaganes de instagram
            instagramArea.innerHTML = '<div class="text-center"><div class="spinner-border text-success" role="status"><span class="sr-only">Loading...</span></div></div>';
        },
        success: function (data) {

            
    
            var $Obj=$.parseJSON(data);
            //$Obj=$.parseJSON(data);
    
            var respuesta_activacion = $Code=$Obj['respuesta_instagram'];

            //insercion en HTML para lmuestra en la web
            instagramArea.innerHTML = respuesta_activacion;
            
        }
    });

}

// metodo para levantar modal de no existe un plan nutriciional y redireccionar al detalles pago para continuar con el registo
function comprobarPlanUser() {

    var responseHtml = document.getElementById('responseHtml');
  
    $.ajax({
  
        url: base_url+"index.php/welcome/comprobar_plan_user",
        type: 'POST',
        global: false,
        beforeSend: function (xhr) {
            xhr.overrideMimeType("text/plain; charset=utf-8");
        },
        success: function (data) {
  
  
            //respuesta del query de dias para pagar
            var Obj=$.parseJSON(data);
  
            var resPlan = Obj['resp_comprobar_plan'];
  
            if (resPlan == 1) {
  
              var respComprobarPlan = Obj['respuesta_comprobar_plan_html'];
              responseHtml.innerHTML = respComprobarPlan;
  
              $('#comprbarPlanModalScrollable').modal(
                {
                  keyboard: false,
                  backdrop: 'static'
                });
  
              $('#comprbarPlanModalScrollable').modal('show');
              
            }
  
        }
    });
    
  }
  
  // metodo para devolver a detalles de pago
  $('#irDetalles').click(function(){
  
    window.location = base_url+"index.php/detallespago";
  
  });

  // metodo para devolver a detalles de pago
  $('#salirDeSesion').click(function(){
  
    window.location = base_url+"index.php/login/logout";
  
  });