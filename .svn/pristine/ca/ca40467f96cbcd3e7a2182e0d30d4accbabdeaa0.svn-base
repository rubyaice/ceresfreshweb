<?php $correo; $num_afiliacion; $plan_suscrip; $nombre; $apellido; $cedula; $edad; $sexo; $peso; $estatura; $act_fisica; $condicion_esp; $direccion_envio; $precio_plan?>

<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>Metodos de Pago - Cerefresh</title>
    <link rel="stylesheet" href="<?php echo base_url(); ?>css/bootstrap.min.css">
    <link rel="stylesheet" href="<?php echo base_url(); ?>css/animate.css">
  </head>
  <body>

    <div style="margin-top: 3%" class="container-fluid animated fadeIn">

      <div class="text-center">
        <h2>Metodos de pago para Suscripción</h2>
      </div>
      <br>
      <form class="form-group" action="<?=site_url('suscribir/insertar_en_suscripcion')?>" method="post">
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
        <input type="hidden" name="estatus" value="3">
        <input type="hidden" name="tipo_transaccion" value="4">
        <input type="hidden" name="precio_plan" value="<?php echo $precio_plan; ?>">
        <input type="hidden" name="code_orden" value="1">
        <input type="hidden" name="fecha" value="<?php echo date("d/m/Y"); ?>">


        <p>Ingrese el numero de transaccion bancaria para ser verificado</p>

        <input class="form-control" type="number" name="num_transaccion" placeholder="Número de Transacción" required><br>
        <p>Ingrese el banco Emisor</p>
        <input class="form-control" type="text" name="banco_emisor" placeholder="Ingrese su banco" required><br>
        <p>Ingrese el banco Receptor</p>
        <input class="form-control" type="text" name="banco_receptor" placeholder="Ingrese el banco" required><br>

        <h3>Monto Total a Pagar: <label style="color:#27E04B" for="precio_plan"><?php echo $precio_plan; ?></label> BsS</h3>

        <br>
        <input class="btn btn-primary" type="submit" name="enviar" value="Suscribir +">
      </form>



      <form class="" action="<?=site_url('suscribir/recibir_datos_instapago')?>" method="post">
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


        <input type="hidden" name="estatus" value="1">
        <input type="hidden" name="tipo_transaccion" value="2">
        <input type="hidden" name="precio_plan" value="<?php echo $precio_plan; ?>">
        <input type="hidden" name="code_orden" value="1">
        <input type="hidden" name="fecha" value="<?php echo date("d/m/Y"); ?>">
        <hr>

        <div class="text-left">
          <a class="btn btn-danger" href="<?=site_url('dashboard')?>">Cancelar</a>
          <input style="color:white;" class="btn btn-primary" type="submit" name="instapago" value="Usar Instapago >">
        </div>
      </form>

    </div>

    <script src="<?php echo base_url(); ?>js/jquery-3.3.1.min.js" type="text/javascript"></script>
    <script src="<?php echo base_url(); ?>js/bootstrap.min.js" type="text/javascript"></script>
  </body>
</html>
