<?php
//barra de navegacion
//$notificacion; $nombre; $apellido; $carrito_usuario;

//mostrar o no la barra de esta del primero registro
$mostrar;
?>
<!DOCTYPE html>

  <head>
    <meta charset="utf-8">
    <title>Cerefresh</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="icon" type="image/png" href="<?php echo base_url(); ?>img/Ceres/CERES_Icon.png" />
    <meta name="theme-color" content="#7dbe41" />
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
    <body style="background-color: #ffffff">

    <!-- Modal Carrito -->
    <div class="modal fade" id="CarritoModal" tabindex="-1" role="dialog" aria-labelledby="proteinasModalTitle" aria-hidden="true">
      <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="proteinasModalTitle"><span><b style="font-size: 130%;">Nutri<span style="color:#7DBE41">boxs</span></b></span></h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">

          <div id="linkCajas" class="">
            <div class="row">

              <div id="cajas" class="col-12 col-sm-12 col-xs-12">

              </div>
                              
            </div>
            <hr>
          </div>
                            
          <div class="text-center">
          
            <a  style="color:black;" class="btn btn-success text-center"  href="<?=site_url('detallespago')?>"><div class="row"><i style="color:green;" class="material-icons">shopping_cart</i> &nbsp; Ir a la Cesta &nbsp;</div></a>

          </div>
            
          </div>
          <div class="modal-footer">
            <button style="background: #36434a; color:white" type="button" class="btn " data-dismiss="modal">Cerrar</button>
          </div>
        </div>
      </div>
    </div>

  <!-- ////////////////////////////////////////////////////////////////// -->

  <!-- Modal Notificaciones -->
  <div class="modal fade" id="NotificacionesModal" tabindex="-1" role="dialog" aria-labelledby="proteinasModalTitle" aria-hidden="true">
      <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="proteinasModalTitle"><span><b style="font-size: 130%;">Notificaciones</b></span></h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">

          <div class="">
            <div class="row">

              <div id="notificaciones" class="col-12 col-sm-12 col-xs-12">

              </div>
                              
            </div>
            
          </div>
                            
          <div class="text-center">
          
            <a  style="color:black;" class="btn btn-success text-center"  href="<?=site_url('notificaciones/notificaciones_view')?>"><div class="row"><i style="color:green;" class="material-icons">notifications_active</i> &nbsp; Ver todas &nbsp;</div></a>

          </div>
            
          </div>
          <div class="modal-footer">
            <button style="background: #36434a; color:white" type="button" class="btn " data-dismiss="modal">Cerrar</button>
          </div>
        </div>
      </div>
    </div>

  <!-- ////////////////////////////////////////////////////////////////// -->

      <nav style="background: #36434a;" class="navbar navbar-expand-lg navbar-dark fixed-top">

        <div class="container">
          <a style="margin-top: -1%" class="navbar-brand" href="<?php echo base_url(); ?>">
            <div style="padding-top: 3.5%;">
              <img class="logo1" style="width: 80%;" src="<?php echo base_url(); ?>img/logo_ceresfresh.png" alt="">
            </div>
          </a>
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>

          <div class="collapse navbar-collapse" id="navbarSupportedContent">


                  <ul class="navbar-nav mr-auto">
                  
                    <?php if (isset($mostrar) == "1"): ?>
                      

                      <li id="registrate" style="color:#7dbe41" ><div class="row"><i class="material-icons" >web</i>&nbsp;<a style='color: #7dbe41; text-decoration: none;' href='<?php echo base_url(); ?>index.php/login/vista_registrar_usuario'>Regístrate&nbsp;&nbsp;&nbsp;&nbsp;-------&nbsp;&nbsp;&nbsp;&nbsp;</a></div></li>
                      <li id="afiliate" style="color:#7d868c"><div class="row"><i class="material-icons">how_to_reg</i>&nbsp;Afiliate&nbsp;&nbsp;&nbsp;&nbsp;-------&nbsp;&nbsp;&nbsp;&nbsp;</div></li>
                      <li id="direccion" style="color:#7d868c"><div class="row"><i class="material-icons">pin_drop</i>&nbsp;Dirección&nbsp;&nbsp;&nbsp;&nbsp;-------&nbsp;&nbsp;&nbsp;&nbsp;</div></li>
                      <li id="pago" style="color:#7d868c"><div class="row"><i class="material-icons">call_to_action</i>&nbsp;Pago</div></li>

                      
                    <?php endif; ?>
                  </ul>
				      <?php if (!isset($mostrar) == "1"): ?>
              
                  <ul class="navbar-nav">

                    <?php if (!isset($_SESSION['correo'])): ?>
                      <div class="row headerredes">
                        <li class="nav-item">
                          <a class="nav-link" href="https://twitter.com/CeresFresh" target="_blank"><img class="img-fluid" style="max-width: 50%; height: auto;" src="<?php echo base_url(); ?>img/footer/TWITTER.png" alt=""></a>
                        </li>
                        &nbsp;
                        <li class="nav-item">
                          <a class="nav-link" href="https://www.instagram.com/ceresfresh/" target="_blank"><img class="img-fluid" style="max-width: 50%; height: auto;" src="<?php echo base_url(); ?>img/footer/Instagram.png" alt=""></a>
                        </li>
                        &nbsp;
                        <li class="nav-item">
                          <a class="nav-link" href="https://www.facebook.com/ceresfresh" target="_blank"><img class="img-fluid" style="max-width: 50%; height: auto;" src="<?php echo base_url(); ?>img/footer/Facebook.png" alt=""></a>
                        </li>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                      </div>
                    <?php endif; ?>



                  <?php if(isset($_SESSION['correo'])): ?>

                    <input type="hidden" id="correo_usuario" name="correo_usuario" value="<?php echo $_SESSION['correo']; ?>">

                    <input type="hidden" id="num_registro" name="num_registro" value="<?php echo $_SESSION['num_registro']; ?>">

                    <!-- AGREGAR PRODUCTO NUTRIBOS -->
                    <?php if(isset($_SESSION['correo']) && $_SESSION['correo'] == "andrex.silva.777@gmail.com"): ?>
                    <li class="nav-item">
                      <a class="nav-link " href="<?=site_url('dashboardnuevo/agragar_al_carrito_view')?>" role="button">
                        <div class="row"><i class="material-icons">add_shopping_cart</i><span style="display:none;" class="MovilC">Añadir</span></div>
                      </a>                      
                    </li>
                    <?php endif; ?>
                    
                    <li class="nav-item" id="btnCarritoModal">
                      <a class="nav-link " href="#" id="navbarDropdown" role="button" data-toggle="" aria-haspopup="true" aria-expanded="false">
                        <div class="row"><i class="material-icons">shopping_cart</i><span style="display:none;" class="MovilC">Carrito</span></div>
                      </a>                      
                    </li>

                      <li class="nav-item" id="btnNotificacion">
                        <a class="nav-link " href="#" id="navbarDropdown" role="button" data-toggle="" aria-haspopup="true" aria-expanded="false">
                          <div id="notificacionAct" class="row"><i class="material-icons">notifications</i><span style="display:none;" class="MovilC">Notificaciones</span></div>
                        </a>
                      </li>

                      <li class="nav-item dropdown">
                        <a class="nav-link " href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                          <p class="row">
                            <i class="material-icons">account_circle</i>&nbsp;


                              <span id="nombre"></span>


                          </p>
                        </a>
                        <div class="dropdown-menu dropdown-menu-lg-right" aria-labelledby="navbarDropdown">
                          <a class="dropdown-item" href="<?=site_url('dashboardnuevo')?>">Plan Nutricional</a>

                          <a class="dropdown-item" href="<?=site_url('afiliadoscontrol')?>">Ver Afiliados</a>

                          <a class="dropdown-item" href="<?=site_url('dashboardnuevo/vista_perfil')?>">Perfil</a>


                          <div class="dropdown-divider"></div>
                          <a style="color:red;" class="dropdown-item text-center" href="<?=site_url('login/logout')?>"><b>Cerrar Sesión</b></a>
                        </div>
                      </li>
        
                  <?php endif; ?>

                  <?php if (!isset($_SESSION['correo'])): ?>

                      <a style="background: #7dbe41;" class="nav-item btn btn-success" href="<?=site_url('welcome/quienes_somos_view')?>">Quiénes somos</a>
                      &nbsp;
                      <a style="background: #7dbe41;" class="nav-item btn btn-success" href="<?=site_url('login/vista_registrar_usuario')?>">&nbsp;&nbsp;Regístrate&nbsp;&nbsp;</a>
                      &nbsp;
                      <a class="nav-item btn btn-success" href="<?=site_url('login/login_view')?>">Iniciar Sesión</a>

                  <?php endif; ?>

                </ul>
				 <?php endif; ?>
          </div>
        </div>

      </nav>
