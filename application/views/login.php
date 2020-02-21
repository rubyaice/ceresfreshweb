<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
  <meta charset="utf-8">
    <title>Cerefresh - Login</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="icon" type="image/png" href="<?php echo base_url(); ?>img/Ceres/CERES_Icon.png" />
    <meta name="theme-color" content="#36434a" />
    <link rel="stylesheet" href="<?php echo base_url(); ?>css/bootstrap.min.css">
    <link rel="stylesheet" href="<?php echo base_url(); ?>css/animate.css">
    <link rel="stylesheet" href="<?php echo base_url(); ?>css/css.css">
    <link rel="stylesheet" href="<?php echo base_url(); ?>css/registrate.css">

    <link href="https://fonts.googleapis.com/icon?family=Material+Icons"
      rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Nunito" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet">
    <script src="<?php echo base_url(); ?>js/jquery-3.3.1.min.js" type="text/javascript"></script>
    <script src="<?php echo base_url(); ?>js/bootstrap.min.js" type="text/javascript"></script>

    <script>var base_url = '<?php echo base_url() ?>';</script>
  </head>
  <body id="bodybackground" style="background-color: #293238">

  <!-- Modal cuenta no activa -->
  <div class="modal fade" id="cuentaNoAcModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalCenterTitle">Cuenta No activa.</h5>
        </div>
        <div class="modal-body">

          <p>Estimado cliente, hemos detectado que su cuenta aún no ha sido activada, desea que enviemos nuevamente un correo de confirmación para <b>Activar su cuenta</b>?</p>

        </div>
        <div class="modal-footer">
          <button style="background: #36434a; color:white" id="btnCuentaNoAct" type="button" class="btn btn-secondary" data-dismiss="modal">Enviar Correo</button>
        </div>
      </div>
    </div>
  </div>

<!-- ///////////////////////////////////////////////////////////////////////// -->

    <div style="padding-top: 8%;" class="container text-center animated flipInX">

      <div class="row">
        <div class="col-md-4 col-sm-12 col-xs-12">

        </div>

        <div class="col-md-4 col-sm-12 col-xs-12">
          <div class="">
            <a href="<?=site_url('welcome')?>">
              <img class="img-flid" src="<?php echo base_url(); ?>img/logo_ceresfresh.png" alt="">
            </a>
          </div>
          <br><br>
          <h5 style="color:white;">Iniciar Sesión</h5>
          <br>
          <form class="form-group" id="form_login">

            <input class="form-control requerir" id="correo" type="email" name="correo" placeholder="Ingrese su correo" required><br>

            <input class="form-control requerir" id="clave" type="password" name="clave" placeholder="Ingrese su contraseña" required>
            <span style="color: red; margin-top: 3%;" id="errorCreenciales"></span>
            <br><br>
            


            <div class="row">
              <div id="divCredenciales" class="col-md-6 col-sm-6 col-xs-6">
                <input id="iniciarSesion" type="submit" class="btn btn-success" value="&nbsp;&nbsp;Ingresar&nbsp;&nbsp;">
              </div>
              <br><br>
              <div class="col-md-6 col-sm-6 col-xs-6">
                  <a id="btnRegistrar" class="btn btn-success" href="<?=site_url('login/vista_registrar_usuario')?>">&nbsp;Regístrate&nbsp;</a>
                  <br>
              </div>

            </div>
          </form>

          <div class="text-right">
          <a style="text-decoration: none; color: #ffffff;" class="link" href="<?php echo base_url(); ?>index.php/email">Olvidé mi contraseña</a>
          </div>
         
        </div>

        <div class="col-md-4 col-sm-12 col-xs-12">

        </div>
      </div>

    </div>

    


    <script src="<?php echo base_url(); ?>js/jquery-3.3.1.min.js" type="text/javascript"></script>
    <script src="<?php echo base_url(); ?>js/bootstrap.min.js" type="text/javascript"></script>

    <script src="<?php echo base_url(); ?>js/login.js" type="text/javascript"></script>
    
  </body>
</html>
