<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Ceresfresh Admin Web App</title>
    <link rel="stylesheet" href="<?php echo base_url(); ?>css/admin/bootstrap.min.css">
    <link rel="stylesheet" href="<?php echo base_url(); ?>css/admin/animate.css">
    <link rel="stylesheet" href="<?php echo base_url(); ?>css/admin/css.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons"
      rel="stylesheet">
  </head>
  <body style="background-color: #36424A">

    <div style="padding-top: 8%;" class="container text-center animated flipInX">

      <div class="row">
        <div class="col-md-4 col-sm-12 col-xs-12">

        </div>

        <div class="col-md-4 col-sm-12 col-xs-12">
        

          <div class="row">
                <div class="col-md-3 col-lg-3 col-sm-12 col-xs-12 img-container logo_stellar">
                <a href="">
                    <img class="img-login"  src="<?php echo base_url(); ?>img/icono_web.svg" alt="">
                </a>
                </div>
              
                <div class="col-md-9 col-lg-9 col-sm-12 col-xs-12 img-container" style=" margin-top: 5%;">
                    <img class="responsive-img" src="<?php echo base_url(); ?>img/stellar_webstore_negativo.svg" alt="">
                </div>
            </div>
      
          <br><br>
          <h5 style="color:white;">Iniciar Sesión</h5>
          <br>
          <form class="form-group" action="<?=site_url('admin/login')?>" method="post">
            <input class="form-control" type="email" name="correo" placeholder="Ingrese su correo" required><br>
            <input class="form-control" type="password" name="clave" placeholder="Ingrese su contraseña" required><br>


            <div class="row">
              <div class="col-md-6 col-sm-6 col-xs-6">
                  <input class="btn btn-success" type="submit" name="enviar" value="&nbsp;Ingresar&nbsp;">
              </div>
              <br><br>
              <!--<div class="col-md-6 col-sm-6 col-xs-6">
                  <a class="btn btn-success" href="<?=site_url('login/vista_registrar_usuario')?>">&nbsp;Regístrate&nbsp;</a>
                  <br>

              </div>!-->

            </div>
          </form>

          <div class="text-right">
          <!--<a style="text-decoration: none; color: #ffffff;" class="link" href="<?php echo base_url(); ?>index.php/email">Olvidé mi contraseña</a>!-->
          </div>
         
        </div>

        <div class="col-md-4 col-sm-12 col-xs-12">

        </div>
      </div>

    </div>


    <script src="<?php echo base_url(); ?>js/jquery-3.3.1.min.js" type="text/javascript"></script>
    <script src="<?php echo base_url(); ?>js/bootstrap.min.js" type="text/javascript"></script>
  </body>
</html>
