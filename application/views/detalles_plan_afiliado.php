<?php
//datos recibidos de tipo de alimentos
$almuerzo; $desayuno; $merienda_1; $merienda_2; $cena;

//calorias diarias a quemar segun el plan del usuario
$calorias_diaria; $id_afiliado; $correo_afiliado;

?>

<!-- Modal pago -->


<div id="modalPago" class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myExtraLargeModalLabel" aria-hidden="true">
  
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="text-center">
        <div>
          <h5><h4><b>Información de Pago</b></h4></h5>
          <hr>
        </div>
      </div>
      <div style="padding-top:5%;" class="text-center">
        <!--<h4 class="" id="exampleModalLabel"></h4>!-->
          
      </div>

      <div style="padding-top: 0%;" class="modal-body">
        <div class="row">
          <div class="col-md-12 col-sm-12 col-xs-12">
            <div class="text-center">

              <div id="respuestaHtmlPago">

              </div>
              
              
              <div id="imgModalR">
                <img class="imgmodal" style="width:30%; height: auto; border-radius: 8px;" src="<?php echo base_url(); ?>img/ceres/CERESPLATOSPREPARADOS-58.png" alt="">
              </div>
              <div class="margenMP" id="pasosReactivacion">

              </div>
              <br><br>
              <div>
                <a style="background:#36434a; color:white; display: initial" class="btn " href="<?=site_url('afiliadoscontrol')?>">Volver a Afiliados</a>
                
                <a id="reactivarAfiliacion" style="background:#36434a; color:white; display: none;" class="btn" href="">Activar Afiliación</a>
                
                <a id="direccionarDetPago" style="background:#36434a; color:white; display: none;" class="btn" href="<?=site_url('detallespago')?>">Ver Detalles de Pago</a>
              </div>
            </div>
          </div>
        </div>
      </div>

    </div>
  </div>
</div>


<!-- ////////////////////////////////////////////////////////////////// -->

<!-- Modal pago pago rechazado-->

<div id="modalPagoRechazado" class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myExtraLargeModalLabel" aria-hidden="true">
  
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="text-center">
        <div>
          <h5><h4><b>Información de Pago</b></h4></h5>
          <hr>
        </div>
      </div>
      <div style="padding-top:5%;" class="text-center">
        <!--<h4 class="" id="exampleModalLabel"></h4>!-->
          
      </div>

      <div style="padding-top: 0%;" class="modal-body">
        <div class="row">
          <div class="col-md-12 col-sm-12 col-xs-12">
            <div class="text-center">
              <h4>Lamentamos informarte que tu transacción no pudo ser confirmada, te invitamos a realizar nuevamente el pago correspondiente.</h4>
              <div>
                <img class="imgmodal" style="width:30%; height: auto; border-radius: 8px;" src="<?php echo base_url(); ?>img/ceres/CERESPLATOSPREPARADOS-58.png" alt="">
              </div>
              <br><br>
              <div>
                <a style="background:#36434a; color:white; display: initial" class="btn " href="<?=site_url('afiliadoscontrol')?>">Volver a Afiliados</a>
                
                <a id="btnPagorechazado" style="background:#36434a; color:white;" class="btn" href="">Realizar pago</a>
              </div>
            </div>
          </div>
        </div>
      </div>

    </div>
  </div>
</div>


<!-- ////////////////////////////////////////////////////////////////// -->

<!-- Modal pago pago rechazado ESPERA-->

<div id="modalPagoRechazadoEspera" class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myExtraLargeModalLabel" aria-hidden="true">
  
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="text-center">
        <div>
          <h5><h4><b>Información de Pago</b></h4></h5>
          <hr>
        </div>
      </div>
      <div style="padding-top:5%;" class="text-center">
        <!--<h4 class="" id="exampleModalLabel"></h4>!-->
          
      </div>

      <div style="padding-top: 0%;" class="modal-body">
        <div class="row">
          <div class="col-md-12 col-sm-12 col-xs-12">
            <div class="text-center">
              <h5>Por favor realice las transacciones pendientes para poder disfrutar del servicio de Ceres<span style="color: #7dbe41;">fresh</span>.</h5>
              <div>
                <img class="imgmodal" style="width:30%; height: auto; border-radius: 8px;" src="<?php echo base_url(); ?>img/ceres/CERESPLATOSPREPARADOS-58.png" alt="">
              </div>
              <br><br>
              <div>
                <a style="background:#36434a; color:white; display: initial" class="btn " href="<?=site_url('afiliadoscontrol')?>">Volver a Afiliados</a>
                
                <a style="background:#36434a; color:white; display: initial" class="btn " href="<?=site_url('detallespago')?>">Detalles de Pago</a>
              </div>
            </div>
          </div>
        </div>
      </div>

    </div>
  </div>
</div>


<!-- ////////////////////////////////////////////////////////////////// -->


<!-- Modal Proteinas -->
<div class="modal fade bd-example-modal-xl" id="proteinasModal" tabindex="-1" role="dialog" aria-labelledby="proteinasModalTitle" aria-hidden="true">
  <div class="modal-dialog modal-xl" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="proteinasModalTitle">Lista de Alimentos que puede consumir</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div id="alimento" class="modal-body">
        <!--  Modal poveniente de la consulta AJAX  -->
      </div>
      <div class="modal-footer">
        <button style="background: #293238; color:white" type="button" class="btn " data-dismiss="modal">Cerrar</button>
      </div>
    </div>
  </div>
</div>

<!-- ////////////////////////////////////////////////////////////////// -->


<div id="contenedor" class="container animated fadeIn">
  <br>
  <div class="container">
    <a style="background: #36434a; color:white" class="btn " href="<?=site_url('afiliadoscontrol')?>"><div class="row"><i class="material-icons">arrow_back</i>&nbsp;Atras</div></a>

  </div>

  <input type="hidden" name="id_afiliado" id="id_afiliado" value="<?php echo $id_afiliado; ?>">

  <input type="hidden" name="correo_afiliado" id="correo_afiliado" value="<?php echo $correo_afiliado; ?>">
  <br><br><br>

  <div class="text-center">
    <h3 class="h3 nunita">Su dieta esta basada en un aporte diario de "<?php echo $calorias_diaria; ?>" KCal.</h3>
  </div>
  <br><br>

  <div class="row">
    <div class="col-md-1 col-sm-12 col-xs-12">

    </div>

    <div class="col-md-10 col-sm-12 col-xs-12">
      <div class="row">

        <div style="animation-delay: 0.3s;" class="col-md-12 col-sm-12 col-xs-12 animated flipInX">

            <div class="card mb-3 " >
              <div class="row no-gutters">
                <div class="col-md-4">
                  <div style="padding-top: 8%"></div>
                  <img src="<?php echo base_url(); ?>img/Ceres/CERESPLATOSPREPARADOS-14.png" class="card-img" alt="...">
                </div>
                <div class="col-md-8">
                  <div class="card-body">
                    <h5 class="card-title"><b>Desayuno</b></h5>
                    <p class="card-text">
                      Para tener un desayuno acorde a tu plan necesitas Ingerir:
                      <br><br>
                      <form class="" method="post">

                        <?php foreach ($desayuno as $result): ?>
                          <?php echo $result->Cantidad; ?> Porción de <b><a onclick="tipo_funt_alimento(<?php echo $result->cod_tipo_alimento ?>)" style="color:#7dbe41" href="#" data-toggle="modal" data-target="#proteinasModal"><?php echo $result->Tipo; ?></a></b>
                          <br>
                        <?php endforeach; ?>

                      </form>
                    </p>

                    <p class="card-text"><small class="text-muted">Descubre los alimento que puedes ingerir pulsando los textos resaltados!!</small></p>

                  </div>
                </div>
              </div>
            </div>

        </div>

        <?php if ($merienda_1 != null): ?>

          <div style="animation-delay: 0.6s;" class="col-md-12 col-sm-12 col-xs-12 animated flipInX">
            <div class="card mb-3 " >
              <div class="row no-gutters">
                <div class="col-md-4">
                  <div style="padding-top: 8%"></div>
                  <img src="<?php echo base_url(); ?>img/Ceres/CERESPLATOSPREPARADOS-70.png" class="card-img" alt="...">
                  <div style="padding-bottom: 8%;"></div>
                </div>
                <div class="col-md-8">
                  <div class="card-body">
                    <h5 class="card-title"><b>Merienda Mañana</b></h5>
                    <p class="card-text">
                      Para tener un Merienda acorde a tu plan necesitas Ingerir:
                      <br><br>

                      <?php foreach ($merienda_1 as $result): ?>
                        <?php echo $result->Cantidad; ?> Porción de <b><a style="color:#7dbe41" href="#" onclick="tipo_funt_alimento(<?php echo $result->cod_tipo_alimento ?>)" data-toggle="modal" data-target="#proteinasModal"><?php echo $result->Tipo; ?></a></b>
                        <br>
                      <?php endforeach; ?>
                    </p>

                    <p class="card-text"><small class="text-muted">Descubre los alimento que puedes ingerir pulsando los textos resaltados!!</small></p>

                  </div>
                </div>
              </div>
            </div>
          </div>

        <?php endif; ?>


      </div>

      <div style="animation-delay: 0.3s;" class="row animated flipInX">

        <div class="col-md-12 col-sm-12 col-xs-12">
          <div class="card mb-3 ">
            <div class="row no-gutters">
              <div class="col-md-4">
                <div style="padding-top: 8%"></div>
                <img src="<?php echo base_url(); ?>img/Ceres/CERESPLATOSPREPARADOS-18.png" class="card-img" alt="...">
              </div>
              <div class="col-md-8">
                <div class="card-body">
                  <h5 class="card-title"><b>Almuerzo</b></h5>
                  <p class="card-text">
                    Para tener un Almuerzo acorde a tu plan necesitas Ingerir:
                    <br><br>

                    <?php foreach ($almuerzo as $result): ?>
                      <?php echo $result->Cantidad; ?> Porción de <b><a style="color:#7dbe41" href="#" data-toggle="modal" onclick="tipo_funt_alimento(<?php echo $result->cod_tipo_alimento ?>)" data-target="#proteinasModal"><?php echo $result->Tipo; ?></a></b>
                      <br>
                    <?php endforeach; ?>

                  </p>

                  <p class="card-text"><small class="text-muted">Descubre los alimento que puedes ingerir pulsando los textos resaltados!!</small></p>

                </div>
              </div>
            </div>
          </div>
        </div>

        <?php if ($merienda_2 != null): ?>

          <div class="col-md-12 col-sm-12 col-xs-12">
            <div class="card mb-3 " >
              <div class="row no-gutters">
                <div class="col-md-4">
                  <div style="padding-top: 8%;"></div>
                  <img src="<?php echo base_url(); ?>img/Ceres/CERESPLATOSPREPARADOS-67.png" class="card-img" alt="...">
                  <div style="padding-bottom: 8%;"></div>
                </div>
                <div class="col-md-8">
                  <div class="card-body">
                    <h5 class="card-title"><b>Merienda Tarde</b></h5>
                    <p class="card-text">
                      Para tener un Merienda acorde a tu plan necesitas Ingerir:
                      <br><br>

                      <?php foreach ($merienda_2 as $result): ?>
                        <?php echo $result->Cantidad; ?> Porción de <b><a style="color:#7dbe41" href="#" onclick="tipo_funt_alimento(<?php echo $result->cod_tipo_alimento ?>)" data-toggle="modal" data-target="#proteinasModal"><?php echo $result->Tipo; ?></a></b>
                        <br>
                      <?php endforeach; ?>

                    </p>

                    <p class="card-text"><small class="text-muted">Descubre los alimento que puedes ingerir pulsando los textos resaltados!!</small></p>

                  </div>
                </div>
              </div>
            </div>
          </div>

        <?php endif; ?>

        <div class="col-md-12 col-sm-12 col-xs-12">
          <div class="card mb-3 " >
            <div class="row no-gutters">
              <div class="col-md-4">
                <div style="padding-top: 8%"></div>
                <img src="<?php echo base_url(); ?>img/Ceres/CERESPLATOSPREPARADOS-31.png" class="card-img" alt="...">
              </div>
              <div class="col-md-8">
                <div class="card-body">
                  <h5 class="card-title"><b>Cena</b></h5>
                  <p class="card-text">
                    Para tener una Cena acorde a tu plan necesitas Ingerir:
                    <br><br>

                    <?php foreach ($cena as $result): ?>
                      <?php echo $result->Cantidad; ?> Porción de <b><a style="color:#7dbe41" href="#" onclick="tipo_funt_alimento(<?php echo $result->cod_tipo_alimento ?>)" data-toggle="modal" data-target="#proteinasModal"><?php echo $result->Tipo; ?></a></b>
                      <br>
                    <?php endforeach; ?>
                  </p>

                  <p class="card-text"><small class="text-muted">Descubre los alimento que puedes ingerir pulsando los textos resaltados!!</small></p>

                </div>
              </div>
            </div>
          </div>
        </div>

      </div>
    </div>

    <div class="col-md-1 col-sm-12 col-xs-12">

    </div>
  </div>


  <br>
</div>

  <script src="<?php echo base_url(); ?>js/comprobar_pago_afiliado.js" type="text/javascript"></script>

  <script src="<?php echo base_url(); ?>js/plan_nut_afiliado.js" type="text/javascript"></script>
