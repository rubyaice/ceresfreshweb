var delayTimer;
$(document).ready(function(){
    
    $('.modal').modal();
    $('.detalle').hide(); 
    $('.datepicker').datepicker({onSelect: function(date){}});
    CargarUsuariosGustos();
})

//metodo para mostrar a los usuario que tiene algun registro en gustos
function CargarUsuariosGustos()
{

    $.ajax({
        url: base_url+"index.php/admin/ventas/gustos_usuario",
        global: false,
        type: 'GET',
        data: {Pag: 1},
        beforeSend: function (xhr) {
            xhr.overrideMimeType("text/plain; charset=utf-8");
        },
        success: function (data) {
            $("#usuarios-gustos-container").html(data);
        }
    });
}

//metodo para regrasar la lista de posicionamiento
function RegresarLista()
{
    $(".detalle").hide();
    $(".lista").show();
}

//metodo para llamar al modal donde estaran los alimanetos que el usuario desmarco y no desea que aparezcan en su caja
function cargarModalAlimentosU(id_afiliacion) {

    document.getElementById('id_afiliacion').value = id_afiliacion;

    
    
}


//---------------------------------------------------------------------------------------

$("html").on("change","#OrderDate",function(){
    clearTimeout(delayTimer);
    //GetSalesList
    delayTimer = setTimeout(function() {
        // Timer para no consultar por cada tecla            
        $Texto=$('#searchOrders').val();
        $Date=$('#OrderDate').val();
        $.ajax({
            url: base_url+"index.php/admin/ventas/GetSalesListAutorizar",
            global: false,
            type: 'GET',
            data: {Pag: 1,Text: $Texto, Date: $Date},
            beforeSend: function (xhr) {
                xhr.overrideMimeType("text/html;charset=utf-8");
            },
            success: function (data) {
                $("#ventas-container").html(data);
            }
        });
    }, 1000); // Will do the ajax stuff after 1000 ms, or 1 s
});


$('body').on("keyup","#searchOrders",function(){
    clearTimeout(delayTimer);
    delayTimer = setTimeout(function() {
        // Timer para no consultar por cada tecla            
        $Texto=$('#searchOrders').val();
        $Date=$('#OrderDate').val();
        $.ajax({
            url: base_url+"index.php/admin/ventas/GetSalesListAutorizar",
            global: false,
            type: 'GET',
            data: {Pag: 1,Text: $Texto, Date: $Date},
            beforeSend: function (xhr) {
                xhr.overrideMimeType("text/html;charset=utf-8");
            },
            success: function (data) {
                $("#ventas-container").html(data);
            }
        });
    }, 1000); // Will do the ajax stuff after 1000 ms, or 1 s
});