$(document).ready(function(){

    comprobarPlanUser();

});


// metodo para levantar modal de no existe un plan nutriciional y redireccionar al detalles pago para continuar con el registo
function comprobarPlanUser() {

    var responseHtml = document.getElementById('responseHtml');
  
    
  
    $.ajax({
  
        url: base_url+"index.php/dashboardnuevo/comprobar_plan_usuario",
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