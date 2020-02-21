<?php
include("../../classes/User.php");
include("../../BD/conexion.php");
include("../../Functions/Functions.php");

$UserClass = new User();
$Code=1;
/*
if (isset($_GET['des'])) {
    $ProductClass->Name = $_GET['des'];
    $estoyendes = true;
}
if (isset($_GET['desSolo'])) {
    $getdesSolo = $_GET['desSolo'];
    $ArraygetdesSolo = explode("-", $getdesSolo);
    if (isset($ArraygetdesSolo[1])) {
        $SelectedPage = $ArraygetdesSolo[1];
    }
    $ProductClass->Name = $ArraygetdesSolo[0];
    $estoyendesSolo = true;
}*/

if (isset($_GET['Code'])) {
    $Code=$_GET['Code'];
}
session_start();
$UserClass->Code=$Code;
$Existe = $UserClass->GetUser();



if($Existe)
{
    $Name=$UserClass->Name;
    $email=$UserClass->Email;
    $Type=$UserClass->Type;
    $Status=$UserClass->Status;
    //$Status=0;
    ?>
    <div class="modal-content" id="modal-Cerrar-Pedido">
        <h4>Datos del usuario</h4>
        <p><p>
        <div class="input-field">
            <input id="Nombre" placeholder="Nombre del usuario" required="" name="Nombre" type="text" class="validate valid" value="<?php echo $Name ?>">
            <label for="Nombre" class="active">Nombre</label>
        </div>
        <div class="input-field">
            <input id="Email" required="" name="Email" type="text" class="validate valid" value="<?php echo $email ?>">
            <label for="Email" class="active">Email</label>
        </div>
        <div class="input-field col s12">
            <select id="Type">
                <option value="1" <?php if($Type==1){echo "selected";} ?>>Administrador</option>
                <option value="2" <?php if($Type==2){echo "selected";} ?>>Normal</option>
            </select>
            <label>Tipo de usuario</label>
        </div>
        <p>
            <label>
                <input id="status" type="checkbox" class="filled-in" <?php if($Status==1){echo 'checked';}?> />
                <span>Activo</span>
            </label>
        </p>
    </div>
    <div class="modal-footer">
        <a href="#!" onclick="ActualizarDatosDelUsuario('<?php echo $Code?>')" class="modal-action waves-effect waves-green btn-flat">Aceptar</a>
        <a href="#!" class="modal-action modal-close waves-effect waves-green btn-flat">Cerrar</a>
    </div>
    </div>
    <?php
}
else
{

}

       



?>