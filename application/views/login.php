<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>Cerefresh Web App</title>
    <link rel="stylesheet" href="<?php echo base_url(); ?>css/bootstrap.min.css">
    <link rel="stylesheet" href="<?php echo base_url(); ?>css/animate.css">
  </head>
  <body>

    <div style="margin-top:5%;" class="container-fluid text-center animated flipInX">

          <h2>Ingreso a Sesión de Cerefresh</h2>
          <br>
          <form class="form-group" action="<?=site_url('login')?>" method="post">
            <input class="form-control" type="email" name="correo" placeholder="Ingrese su correo" required><br>
            <input class="form-control" type="password" name="clave" placeholder="Ingrese su contraseña" required><br>
            <input class="btn btn-success" type="submit" name="enviar" value="Ingresar">
          </form>
          <br>
          <a href="<?=site_url('login/vista_registrar_usuario')?>">Registrate</a>

    </div>


    <script src="<?php echo base_url(); ?>js/jquery-3.3.1.min.js" type="text/javascript"></script>
    <script src="<?php echo base_url(); ?>js/bootstrap.min.js" type="text/javascript"></script>
  </body>
</html>
