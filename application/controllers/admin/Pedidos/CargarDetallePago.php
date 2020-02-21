<?php
include("../../BD/conexion.php");
include("../../Functions/Functions.php");
include("../../classes/Orders.php");
session_start();
$ClassOrders = new Orders();
$ClassOrders->Code=$_GET['Code'];
$RecordsetOrden = $ClassOrders->CompleteDetallePago();

/*-----------------------------------------------------------------------------------------------
 ESTRUCTURA BASICA DE LOS DATOS DE LA MODAL
-------------------------------------------------------------------------------------------------
    <div class="modal-content" id="modal-detalle-pago">
        <h4>Modal Header</h4>
        <p>Contenido</p>
    </div>
--------------------------------------------------------------------------------------------------
}*/


    if ($RecordsetOrden != FALSE)
    {
      
            //Datos de la consulta que retorna
            //select 
            //Code,Fecha,Monto,Reference
            //from ORDER_MA JOIN LOG_INSTAPAGO

            $Code = $RecordsetOrden->Fields["Code"]->value;
            $Fecha =$RecordsetOrden->Fields["Fecha"]->value;
            $Monto= $RecordsetOrden->Fields["Monto"]->value;
            $Reference = $RecordsetOrden->Fields["Reference"]->value;
          
        ?>       
        <div class="modal-content" id="modal-detalle-pago">
            <div class="row">
                <div class="col m12 s12">
                    <h4>Detalle del Pago</h4>
                    <p><strong>Orden : </strong><?php echo $Code ?></p>
                    <p><strong>Fecha: </strong><?php echo $Fecha ?></p>
                    <p><strong>Monto: </strong><?php echo $Monto ?></p>
                    <p><strong>Referencia: </strong><?php echo $Reference ?></p>
                   
                </div>
               
            </div>
        </div>
    <?php
 
        
    }
//fin del loop
    ?>

<?php

?>