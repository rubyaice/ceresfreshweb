<?php
session_start();
include("../../classes/User.php");
include("../../BD/conexion.php");
include("../../Functions/Functions.php");

$UserClass = new User();
$pass1 = $_POST['pass1'];
$pass2 = $_POST['pass2'];

$UserClass->Password = md5($pass1);
$UserClass->Code = $_SESSION['UserCode'];

if($UserClass->UpdatePassword())
{
    echo "1";
}
else
{
    echo "2";
}


?>