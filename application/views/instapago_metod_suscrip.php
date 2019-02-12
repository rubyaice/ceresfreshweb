<?php $correo; $num_afiliacion; $plan_suscrip; $nombre; $apellido; $cedula; $edad; $sexo; $peso; $estatura; $act_fisica; $condicion_esp; $direccion_envio; $estatus; $tipo_transaccion; $code_orden; $precio_plan; $fecha; ?>

<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>Instapago - cerefresh</title>
    <link rel="stylesheet" href="<?php echo base_url(); ?>css/bootstrap.min.css">
    <link rel="stylesheet" href="<?php echo base_url(); ?>css/animate.css">
  </head>
  <body>

    <div style="margin-top:3%;" class="container-fluid animated fadeIn">
      <div class="text-center">
        <h2>Usar Instapago</h2>
        <br>
      </div>
      <h3>Datos del Usuario suscriptor (Titular)</h3>
      <br>
      <form class="form-group" action="<?=site_url('suscribir/insertar_en_suscripcion_instapago')?>" method="post">
        <input type="hidden" name="correo" value="<?php echo $correo; ?>">
        <input type="hidden" name="num_afiliacion" value="<?php echo $num_afiliacion; ?>">
        <input type="hidden" name="plan_suscrip" value="<?php echo $plan_suscrip; ?>">
        <p>Nombre del titular*</p>
        <input class="form-control" type="text" name="nombre" value="<?php echo $nombre; ?>" required><br>
        <p>Apellido del titular*</p>
        <input class="form-control" type="text" name="apellido" value="<?php echo $apellido; ?>" required><br>
        <p>Cedula del titular*</p>
        <input class="form-control" type="number" name="cedula" value="<?php echo $cedula; ?>" required><br>
        <input type="hidden" name="edad" value="<?php echo $edad; ?>">
        <input type="hidden" name="sexo" value="<?php echo $sexo; ?>">
        <input type="hidden" name="peso" value="<?php echo $peso; ?>">
        <input type="hidden" name="estatura" value="<?php echo $estatura; ?>">
        <input type="hidden" name="act_fisica" value="<?php echo $act_fisica; ?>">
        <input type="hidden" name="condicion_esp" value="<?php echo $condicion_esp; ?>">
        <input type="hidden" name="direccion_envio" value="<?php echo $direccion_envio; ?>">


        <input type="hidden" name="estatus" value="1">
        <input type="hidden" name="tipo_transaccion" value="2">
        <input type="hidden" name="precio_plan" value="<?php echo $precio_plan; ?>">
        <input type="hidden" name="code_orden" value="1">
        <input type="hidden" name="fecha" value="<?php echo date("d/m/Y"); ?>">
        <hr class="hr">
        <h3 class="h3">Datos de la Tarjeta (Titular)</h3>
        <br>
        <p>Ingrese el numero de su tarjeta de credito</p>
        <input class="form-control" type="number" name="tdc" placeholder="TDC" required><br>
        <p>Ingrese el codigo de seguridad de la tarjeta</p>
        <input class="form-control" type="number" name="codigotdc" placeholder="codigo de seguridad" required><br>
        <p>Ingrese fechas de expiracion de la tarjeta</p>
        <input class="form-control" type="number" name="mes" placeholder="MES (MM)" required><br>
        <input class="form-control" type="number" name="ano" placeholder="AÑO (AAAA)" required><br>

        <h3 class="h3">Monto Total a Pagar: <label style="color:#27E04B" for="precio_plan"><?php echo $precio_plan; ?></label> BsS</h3>
        <br>
        <input class="btn btn-primary" type="submit" name="pagar" value="Suscribir +">
      </form>

      <hr>

      <form class="" action="<?=site_url('suscribir/recibir_datos_suscripcion')?>" method="post">
        <input type="hidden" name="correo" value="<?php echo $correo; ?>">
        <input type="hidden" name="num_afiliacion" value="<?php echo $num_afiliacion; ?>">
        <input type="hidden" name="plan_suscrip" value="<?php echo $plan_suscrip; ?>">
        <input type="hidden" name="nombre" value="<?php echo $nombre; ?>">
        <input type="hidden" name="apellido" value="<?php echo $apellido; ?>">
        <input type="hidden" name="cedula" value="<?php echo $cedula; ?>">
        <input type="hidden" name="edad" value="<?php echo $edad; ?>">
        <input type="hidden" name="sexo" value="<?php echo $sexo; ?>">
        <input type="hidden" name="peso" value="<?php echo $peso; ?>">
        <input type="hidden" name="estatura" value="<?php echo $estatura; ?>">
        <input type="hidden" name="act_fisica" value="<?php echo $act_fisica; ?>">
        <input type="hidden" name="condicion_esp" value="<?php echo $condicion_esp; ?>">
        <input type="hidden" name="direccion_envio" value="<?php echo $direccion_envio; ?>">

        <input style="color:white;" class="btn btn-danger" type="submit" name="atras" value="< Transacción Bancaria">
      </form>

    </div>

    <div style="margin-bottom: 2%"></div>

    <script src="<?php echo base_url(); ?>js/jquery-3.3.1.min.js" type="text/javascript"></script>
    <script src="<?php echo base_url(); ?>js/bootstrap.min.js" type="text/javascript"></script>
  </body>
</html>
