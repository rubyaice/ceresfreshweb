$(document).ready(function(){

    CargarNotificaciones();

});

//metodo para traer las notificaciones del usuario
function CargarNotificaciones() {

    var areaNotific = document.getElementById('areaNotific');
    
    $.ajax({
        url: base_url+"index.php/notificaciones/cargar_notificaciones",
        type: 'POST',
        global: false,
        
        beforeSend: function (xhr) {
            xhr.overrideMimeType("text/plain; charset=utf-8");
            areaNotific.innerHTML = '<div class="text-center"><div class="spinner-border text-success" role="status"><span class="sr-only">Loading...</span></div></div>';
        },
        success: function (data) {

            //rspuesta del query de notificaciones del usaurio
            var Obj=$.parseJSON(data);
            
            var resuesta_html = Obj['respues_notifi_html'];
            areaNotific.innerHTML = resuesta_html;
        }
    });

}

/*funcion para cargar mas notificaciones en caso de llegar al final de la pagina
$(window).scroll(function() {
    if($(window).scrollTop() + $(window).height() == $(document).height()) {
        alert("END!");
    }
 });*/