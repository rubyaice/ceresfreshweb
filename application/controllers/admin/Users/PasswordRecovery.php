<?php
session_start();
include("../../Functions/Functions.php");
include("../../classes/User.php");
include("../../BD/conexion.php");
include_once("../../../includes/correo/correo.php");

$UserClass = new User();
$UserClass->Email = $_POST['Email'];
if(!$UserClass->EmailEnUso()) //si el correo no esta en uso
{
    echo "3";
    exit;//sale de la ejecucion
}
$UserClass->getUserByEmail();
$Password = rand(100000,90000000);
$UserClass->Password = md5($Password);
$asunto = 'Seguridad - Plazas';
$mens = '<!DOCTYPE html>
            <html lang="es">
                    <head style="width: calc(100%); font-size:40px;">
                        <meta charset="UTF-8">
                        <title>
                            Recuperar contrase&ntilde;a.
                        </title>
                        <div style="width: 100%; background-color: #00a15f;  overflow: hidden;">
                            <h1 style="font-weight: bold; text-align: center; color: #FFFFFF;">
                                Su contrase&ntilde;a ha sido reestablecida al valor: '.$Password.' recuerde que usted puede cambiarla accediendo a la secci&oacute;n Mi Perfil
                            </h1>
                        </div>
                    </head>
                    <body>
                    <footer style="width: 100%; background-color: #52ca29; color: #FFFFFF; font-size: 20px;">
                        <div style="width: calc(100% - 2% - 2%); padding: 40px 2% 20px 2%; overflow: hidden;">
                            <div style="float: right;">
                                <div style="text-align: right; margin-bottom: 20px;">
                                    <div></div>
                                </div>
                                <div style="text-align: right; margin-bottom: 20px;">
                                    <div></div>
                                    <div></div>
                                </div>
                    
                            </div>
                        </div>
                    </footer>
                    </body>
                   </html>';

$conexion->BeginTrans();
if($UserClass->UpdatePassword()){
    if(enviarcorreophp($UserClass->Email,$mens,$asunto))
    {
        $conexion->CommitTrans();
        echo "1";
    }
    else
    {
        $conexion->RollbackTrans();
        //$conexion->CommitTrans();
        echo "2";  
    }
}else{
    $conexion->RollbackTrans();
    echo "2";
}
?>