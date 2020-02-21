//ready de la pagina que representa la primera ejecucion de la pagina como tal
$(document).ready(function(){

    $('#misGustosModalCenter').modal('show')
    
});

//metodo que ejecuta el boton aceptar del modal de confirmation
$('#btnMisGustos').click(function(){

    window.location = base_url+"index.php/misgustos";

});