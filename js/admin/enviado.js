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
        url: base_url+"index.php/admin/ventas/GetSalesListEnviado",
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
            url: base_url+"index.php/admin/ventas/GetSalesListEnviado",
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
            url: base_url+"index.php/admin/ventas/GetSalesListEnviado",
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

//metodo para actualizar el estade del pago en la base de datos en case de que sea tranferecia o deposito bancario
function PreguntaEstatus($Code, $CustomerCodeRegistro)
{
    var code = document.getElementById('code').value = $Code;
    var num_registro = document.getElementById('num_registro').value = $CustomerCodeRegistro;

    $('#modalEstatusPago').modal('open');
}

//metodo para actualizar el estatus de pago en "PAGO_MA"
function EstausPago()
{   

    var code = document.getElementById('code').value;
    var num_registro = document.getElementById('num_registro').value;

    var estatus = document.getElementById('estatus').value;

    var btnAceptar = document.getElementById('btnAceptar');
    var btnCancelar = document.getElementById('btnCancelar');

    btnCancelar.style.pointerEvents = 'none';
    btnCancelar.style.color = '#bbb';

    btnAceptar.style.pointerEvents = 'none';
    btnAceptar.style.color = '#bbb';

    $.ajax({
        url:base_url+"index.php/admin/Pedidos/EstatusPago/entregados",
        global: false,
        type: 'GET',
        data: {

            num_registro: num_registro,
            code: code,
            estatus: estatus
        },
        beforeSend: function (xhr) {
            xhr.overrideMimeType("text/plain; charset=utf-8");
        },
        success: function (data) {

            $Obj=$.parseJSON(data);

            //respuesta de consulta para cambiar el estutus de pago del usuario
            var respuesta = $Obj['respuesta'];

            if (respuesta == true) {
                
                btnAceptar.style.pointerEvents = 'auto';
                btnAceptar.style.color = '#00000';

                btnCancelar.style.pointerEvents = 'auto';
                btnCancelar.style.color = '#00000';

                location.reload();

            }else{

                $('#modalEstatusPago').modal('close');
                $('#modalEstatusFallo').modal('open');

            }

            /*$("#modal-clientes-datos").html(data);
            $('#modal-cliente').modal('open');*/
        }
    });
}

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
