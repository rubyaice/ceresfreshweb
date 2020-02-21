var delayTimer;
$(document).ready(function(){
    
    $('.modal').modal();
    $('.detalle').hide(); 
    $('.datepicker').datepicker({onSelect: function(date){}});
    CargarVentas();
})
function CargarVentas()
{
    $.ajax({
        url: base_url+"index.php/admin/ventas/GetSalesListEntregado",
        global: false,
        type: 'GET',
        data: {Pag: 1},
        beforeSend: function (xhr) {
            xhr.overrideMimeType("text/plain; charset=utf-8");
        },
        success: function (data) {
            $("#ventas-container").html(data);
        }
    });
}

function CargarDatosOrden(Code)
{
    $.ajax({
        url: base_url+"index.php/admin/Pedidos/CargaDetalleOrden",
        global: false,
        type: 'GET',
        data: {Code: Code},
        beforeSend: function (xhr) {
            xhr.overrideMimeType("text/plain; charset=utf-8");
        },
        success: function (data) {
            $(".detalle").html(data);
            $(".detalle").show();
            $(".lista").hide();
        }
    });
}
function RegresarLista()
{
    $(".detalle").hide();
    $(".lista").show();
}
function CargarCustomer($Code) 
{   
    $.ajax({
        url:base_url+"index.php/admin/Pedidos/cargarDatosCliente",
        global: false,
        type: 'GET',
        data: {Code: $Code},
        beforeSend: function (xhr) {
            xhr.overrideMimeType("text/plain; charset=utf-8");
        },
        success: function (data) {
            $("#modal-clientes-datos").html(data);
            $('#modal-cliente').modal('open');
        }
    });
}

$("html").on("change","#OrderDate",function(){
    clearTimeout(delayTimer);
    //GetSalesList
    delayTimer = setTimeout(function() {
        // Timer para no consultar por cada tecla            
        $Texto=$('#searchOrders').val();
        $Date=$('#OrderDate').val();
        $.ajax({
            url: base_url+"index.php/admin/ventas/GetSalesListEntregado",
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
            url: base_url+"index.php/admin/ventas/GetSalesListEntregado",
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

//metodo para traer los gustos de los usurios segun su codigo
function verGustos(id_afiiacion) {

    var modalGustosCliente = document.getElementById('modal-gustos-cliente');

    $.ajax({
        url:base_url+"index.php/admin/Ventas/ver_gustos_usuario",
        global: false,
        type: 'POST',
        data: {

            id_afiiacion: id_afiiacion
        },
        beforeSend: function (xhr) {
            xhr.overrideMimeType("text/plain; charset=utf-8");
        },
        success: function (data) {

            $Obj=$.parseJSON(data);

            //respuesta de consulta para obtener los gustos del usuario
            var respuesta_gustos = $Obj['respuesta_gustos'];
                
                modalGustosCliente.innerHTML = respuesta_gustos;
                $('#modal-gustos').modal('open');

            /*$("#modal-clientes-datos").html(data);
            $('#modal-cliente').modal('open');*/
        }
    });
    
}