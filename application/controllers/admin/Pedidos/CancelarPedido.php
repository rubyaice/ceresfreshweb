<?php
include("../../classes/Orders.php");
include("../../BD/conexion.php");
include("../../Functions/Functions.php");

session_start();
$ClassOrders = new Orders();
if (isset($_GET['Code']))
{
    $ClassOrders->Code=$_GET['Code'];
    /*-----------------------------------------------------------------------------------------------
    Completa la orden cambiando el estatus en order_ma
    cambiando el valor a 3.
    ______________________
    |__ORDERS_MA_STATUS___|
    |   1 pendiente       |
    |   2 en proceso      |
    |   3 cancelada       |
    |   4 confirmada      |
    |   5 completadas     |
    --------------------------------------------------------------------------------------------------
    }*/
    if($ClassOrders->CancelarOrden())
    {
        echo "1";
    }
    else
    {
        echo "0";
    }
}
?>