$(document).ready(function(){
 $("body").addClass("white");
    $.ajax({
        url: base_url+"index.php/admin/ventas/GetValues",
        global: false,
        type: 'GET',
        beforeSend: function (xhr) {
            xhr.overrideMimeType("text/plain; charset=utf-8");
        },
        success: function (data) {
           // ;
            $Obj=$.parseJSON(data);

            //respuesta de consulta para la numeracion que se muestra en el index del dashboard

            $VentasPorEnviar=$Obj['por_enviar'];

            /*$Ventas=$Obj['Ventas'];*/

            $Devoluciones=$Obj['devoluciones'];

            $Pedidos=$Obj['por_preparar'];

            $PendientesPago=$Obj['por_autorizar'];

            //$PendientesPorProcesar=$Obj['PendentesProProcesar'];

            $Enviados=$Obj['enviados'];

            $Entregados=$Obj['entregados'];


            
            //definicion para mostrar en el html la respuesta de la consulta de la numeracion de las opciones
            $("#MontoVentas").html($VentasPorEnviar);
          
            $("#MontoDevoluciones").html($Devoluciones);

            $("#CantidadPedidos").html($Pedidos);

            $("#PedientesPago").html($PendientesPago);

            //$("#PedientesPorProcesar").html($PendientesPorProcesar);

            $("#Enviados").html($Enviados);

            $("#Entregados").html($Entregados);
          
            
        }
    });
});