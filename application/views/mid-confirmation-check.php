<?php
defined('BASEPATH') OR exit('No direct script access allowed');
$orden;$nombre;$direccion
?>

<div class='container'>
<div class="Middle Confirmation MaxWidth ">
    <br><br>
        <a href="#">
        <p> Por favor espere recibir un correo de nuestra parte para  tener más información relacionada con su pedido  .</p>
        <div class="OrderNumber">
            ORDEN DE CONFIRMACIÓN # <span id='orden_pedido'><?php echo $orden; ?></span>
        </div>
        </a>

        <div class="Hello" id='nombre_comprador'><strong>Hola, <?php echo $nombre; ?>!</strong></div>
        <p>Gracias por su compra, en las próximas 48 hrs será contactado por uno de nuestros operadores.  </p>

        
        <div class="ConfirmationDelivery">
            <div class="Left">
                <?php
                    
                            ?>
                            <div class="HeaderGroup">Direccion de envío</div>
                                
                                <div class="Address">
                                    <span>
                                
                                    <?php echo $direccion; ?>
                                    </span>
                                </div>
                                <hr>
                                <div>
                                    
                                    <a style="background: #36434a; color:white" class="btn " href="<?=site_url('dashboardnuevo')?>"><div class="row"><i class="material-icons">view_compact</i>&nbsp;Ver Plan</div></a>

                                    <a style="background: #36434a; color:white" class="btn " href="<?=site_url('welcome')?>"><div class="row"><i class="material-icons">home</i>&nbsp;Ir al Inicio</div></a>
                                </div>

                      

                            <div class="Container_Recibo">
                                <div id="Recibo" class="tdcrecibo">   <?php echo html_entity_decode($_SESSION["ReciboPago"]); ?></div>
                            </div>


            </div>
            <div class="Right">

            <img class="img-fluid " style="width: 105% !important;max-width: 105% !important;" src="<?php echo base_url(); ?>img/Ceres/box.png" alt="">

            </div>
        </div>
    </div>
    </div>
    </body>


<style>
    .Middle.Confirmation{
        box-sizing: border-box;
        padding: 0 25px;
    }
        .Middle.Confirmation .OrderNumber{
            margin: 10px 0px;
            background-color:  #2d7122;
            color: #ffffff;
            display: inline-block;
            padding: 5px 40px;
        }

        .Middle.Confirmation .ConfirmationDelivery{
            overflow: hidden;
            margin-top: 50px;
        }
        .Middle.Confirmation .ConfirmationDelivery .Left .HeaderGroup{
            border-bottom: 1px solid #cfcfcf;
            font-weight: bold;
            margin-bottom: 50px;
        }
        .Middle.Confirmation .ConfirmationDelivery .Left .Name{
            font-size: 20px;
            font-weight: bold;
            margin-bottom: 30px;
        }
        .Middle.Confirmation .ConfirmationDelivery .Left .Address span{
            font-style: italic;
        }
    .Middle.Confirmation .ConfirmationDelivery .Left {
        float: left;
        width: 50%;
        box-sizing: border-box;
        padding: 0 25px;
    }

    .Middle.Confirmation .ConfirmationDelivery .Right{
        float: left;
        color: #FFF;
        width: 50%;
        box-sizing: border-box;
        display: table-cell;
        padding: 0 25px;
        text-align: center;
        vertical-align: middle;
    }

    .Container_Recibo{
        box-sizing: border-box;
        display: table-cell;
        text-align: center;
        vertical-align: middle;
        width: 100%;
        height: auto;
        padding: 25px;

    }


    .Container_Recibo table{

        width: 100%;
        margin: 0 auto;
        text-align: center;
        max-width: 350px !important;
        background-color: #acb8cb;

        padding: 25px;

    }

    .Container_Recibo table > table{

        width: 350px !important;
        max-width: 350px !important;
        margin: 0 auto;
        text-align: center;

    }

    #Recibo table {

        background-color: #FFFFFF;

    }


    /*_______________________ Responsive_______________________________________*/

    @media (max-width: 767px) {
        .Middle.Confirmation .ConfirmationDelivery .Left, .Middle.Confirmation .ConfirmationDelivery .Right {
            padding: 0 10px;
        }
        .Middle.Confirmation .ConfirmationDelivery .Left{
            width: 100%;
        }
        .Middle.Confirmation .ConfirmationDelivery .Right{
            width: 100%;
            padding: 0;
        }
        .Middle.Confirmation .ConfirmationDelivery .Right img{
            max-width: 100vw;
            height: 100vw;
        }
    }

    @media (max-width: 480px) {
        .Middle.Confirmation .OrderNumber {
            margin: 0;
            padding: 5px 10px;
        }
        .Middle.Confirmation .Hello{
            padding: 10px 0;
        }
        .Middle.Confirmation .ConfirmationDelivery .Left .HeaderGroup {
            margin-bottom: 10px;
        }
        .Middle.Confirmation .ConfirmationDelivery .Left .Name {
            margin-bottom: 10px;
        }
    }
    @media (max-width: 360px) {
        .Middle.Confirmation .ConfirmationDelivery {
            margin-top: 25px;
        }
    }
</style>