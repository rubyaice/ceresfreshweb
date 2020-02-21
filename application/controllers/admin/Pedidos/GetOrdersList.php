<?php
session_start();
include("../../classes/Orders.php");
include("../../BD/conexion.php");
include("../../Functions/Functions.php");

$ClassOrdes = new Orders();
$Pag=0;
$Text="";
$Date="";

if (isset($_GET['Pag'])) {
    $Pag=$_GET['Pag'];
}
if (isset($_GET['Text'])) {
    $Text=$_GET['Text'];
}
if (isset($_GET['Date'])) {
    $Date=$_GET['Date'];
}


if($Text=="" && $Date=="")
{
    $Recordset = $ClassOrdes->ordersPending();
}
else
{
    $Recordset = $ClassOrdes->ordersPendingSearch($Date,$Text);
}
       
?>




<table class="tablesorter">
    <thead>
        <tr>
            <th>Orden</th>
            <th>Sucursal</th>
            <th>Cliente</th>
            <th>Método de Pago</th>
            <th>Monto</th>
            <th>Fecha</th>
            <th>Status</th>
            <th> </th>
        </tr>
    </thead>

    <tbody>
    <?php
//inicio del loop
    if ($Recordset != FALSE)
    {
        while (!$Recordset->EOF)
        {
            //-------DATOS DE LA CONSULTA RETORNO-----------------------------------------
            //"SELECT ORDERS_MA.Code, ORDERS_MA.Date, ORDERS_MA.Total, ORDERS_MA_STATUS.Description
            //FROM ORDERS_MA inner join ORDERS_MA_STATUS on ORDERS_MA_STATUS.Code = ORDERS_MA.Status
            $Code = trim($Recordset->Fields["Code"]->value);
            $Name = $Recordset->Fields["Name"]->value;
            $Apellido = $Recordset->Fields["Lastname"]->value;
            $Total = $Recordset->Fields["Total"]->value;
            $Sucursal=$Recordset->Fields["c_descripcion"]->value;            
            $Total=number_format(floatval($Total) , 2 , "." , ",");
            $Cantidad = $Recordset->Fields["F_PAGO"]->value;
            $newDate = $Recordset->Fields["Date"]->value;
            //$newDate = date("d-m-Y", strtotime($Date));
            $CustomerCode = trim($Recordset->Fields["CustomerCode"]->value);
            $NombreCompleto=$Apellido." ".$Name;
            $Status= $Recordset->Fields["Status"]->value;
            //Cid= Customerid
            //Oid=Orderid
        ?>       
        <tr>
            <td><?php echo $Code ?></td>
            <td><?php echo $Sucursal ?></td>
            <td><?php echo $NombreCompleto ?></td>
            <td><?php echo $Cantidad ?></td>
            <td><?php echo $Total ?></td>
            <td><?php echo $newDate ?></td>
            <td><?php echo $Status ?></td>
            <td>
                <i class="material-icons pointer" Cid="<?php echo $CustomerCode ?>" onclick="CargarCustomer('<?php echo $CustomerCode ?>')">perm_contact_calendar</i>
                <i class="material-icons pointer" Oid="<?php echo $Code ?>" onclick="CargarDatosOrden('<?php echo $Code ?>')">visibility</i>      
                <!--<i class="material-icons pointer" Oid="<?php echo $Code ?>" onclick="CompletarOrden('<?php echo $Code ?>')">local_shipping</i>      -->
                <i class="material-icons pointer" Oid="<?php echo $Code ?>" onclick="CancelarOrden('<?php echo $Code ?>')">delete</i>                  
                <i class="material-icons pointer" Cid="<?php echo $Code ?>" onclick="CargarDetallePago('<?php echo $Code ?>')">payment</i>   
            </td>
        </tr>
    <?php
        $Recordset->MoveNext();
        }
    }
//fin del loop
    ?>
    </tbody>
</table>

<?php

?>