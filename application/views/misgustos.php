<?php

    $alimentos_usuario_lacteos; 
    $alimentos_usuario_vegetales; 
    $alimentos_usuario_frutas; 
    $alimentos_usuario_carbohidratos; 
    $alimentos_usuario_proteinas; 
    $alimentos_usuario_grasas; 

?>

<!-- Modal Lacteos -->
<div class="modal fade bd-example-modal-lg" id="lacteosModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Selección de Lácteos</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">

        <div class="container">
        <p><b>Por favor desmarca los alimentos que no quieres que incluyamos en tu #Nutribox.</b></p>
        <?php if($alimentos_usuario_lacteos == null): ?>
            <p>Tu plan no admite lácteos.</p>
        <?php endif; ?>

          <div id="recorrerCheckLacteos" class="chtckgus">

            <?php foreach ($alimentos_usuario_lacteos as $result): ?>
              
              <input type="checkbox" value="
              <?php 
              if ($result->estatus == null) {
                  echo 1;
              }else{
                  echo $result->estatus;
              } ?>" class="form-check-input-g checkActivo" id="<?php echo $result->cod_alimento; ?>" data-alimento="<?php echo $result->cod_alimento; ?>" checked>
              <label class="form-check-label" for="<?php echo $result->cod_alimento; ?>"><span><!-- This span is needed to create the "checkbox" element --></span><?php echo $result->descripcion; ?></label><br>
    
            <?php endforeach; ?>

          </div>

        </div>

      </div>
      <div class="modal-footer">
        <button style="background: #36434a; color:white" type="button" class="btn" data-dismiss="modal">Listo</button>
      </div>
    </div>
  </div>
</div>

<!-- Modal -->

<!-- Modal Vegetales -->
<div class="modal fade bd-example-modal-lg" id="vegetalesModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Selección de Vegetales</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">

        <div class="container">
        <p><b>Por favor desmarca los alimentos que no quieres que incluyamos en tu #Nutribox.</b></p>
            <?php if($alimentos_usuario_vegetales == null): ?>
                <p>Su plan no admite Vegetales</p>
            <?php endif; ?>

            <div id="recorrerCheckVegetales" class="chtckgus">

              <?php foreach ($alimentos_usuario_vegetales as $result): ?>
                  
                <input type="checkbox" value="
                <?php 
                if ($result->estatus == null) {
                    echo 1;
                }else{
                    echo $result->estatus;
                } ?>" class="form-check-input-g checkActivo" id="<?php echo $result->cod_alimento; ?>" data-alimento="<?php echo $result->cod_alimento; ?>" checked>
                <label class="form-check-label" for="<?php echo $result->cod_alimento; ?>"><span><!-- This span is needed to create the "checkbox" element --></span><?php echo $result->descripcion; ?></label><br>
                          
              <?php endforeach; ?>

            </div>
        </div>

      </div>
      <div class="modal-footer">
        <button style="background: #36434a; color:white" type="button" class="btn" data-dismiss="modal">Listo</button>
      </div>
    </div>
  </div>
</div>

<!-- Modal -->

<!-- Modal Frutas -->
<div class="modal fade bd-example-modal-lg" id="frutasModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Selección de Frutas</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">

        <div class="container">
        <p><b>Por favor desmarca los alimentos que no quieres que incluyamos en tu #Nutribox.</b></p>
            <?php if($alimentos_usuario_frutas == null): ?>
                <p>Su plan no admite frutas</p>
            <?php endif; ?>

            <div id="recorrerCheckFrutas" class="chtckgus">

              <?php foreach ($alimentos_usuario_frutas as $result): ?>
                  
                <input type="checkbox" value="
                <?php 
                if ($result->estatus == null) {
                    echo 1;
                }else{
                    echo $result->estatus;
                } ?>" class="form-check-input-g checkActivo" id="<?php echo $result->cod_alimento; ?>" data-alimento="<?php echo $result->cod_alimento; ?>" checked>
                <label class="form-check-label" for="<?php echo $result->cod_alimento; ?>"><span><!-- This span is needed to create the "checkbox" element --></span><?php echo $result->descripcion; ?></label><br>
                          
              <?php endforeach; ?>

            </div>

        </div>

      </div>
      <div class="modal-footer">
        <button style="background: #36434a; color:white" type="button" class="btn" data-dismiss="modal">Listo</button>
      </div>
    </div>
  </div>
</div>

<!-- Modal -->

<!-- Modal Carbohidratos -->
<div class="modal fade bd-example-modal-lg" id="carbohidratosModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Selección de Carbohidratos</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">

        <div class="container">
        <p><b>Por favor desmarca los alimentos que no quieres que incluyamos en tu #Nutribox.</b></p>
            <?php if($alimentos_usuario_carbohidratos == null): ?>
                <p>Su plan no admite Carbohidratos</p>
            <?php endif; ?>

            <div id="recorrerCheckCarbohid" class="chtckgus">

              <?php foreach ($alimentos_usuario_carbohidratos as $result): ?>
                  
                <input type="checkbox" value="
                <?php 
                if ($result->estatus == null) {
                    echo 1;
                }else{
                    echo $result->estatus;
                } ?>" class="form-check-input-g checkActivo" id="<?php echo $result->cod_alimento; ?>" data-alimento="<?php echo $result->cod_alimento; ?>" checked>
                <label class="form-check-label" for="<?php echo $result->cod_alimento; ?>"><span><!-- This span is needed to create the "checkbox" element --></span><?php echo $result->descripcion; ?></label><br>
                          
              <?php endforeach; ?>

            </div>

        </div>

      </div>
      <div class="modal-footer">
        <button style="background: #36434a; color:white" type="button" class="btn" data-dismiss="modal">Listo</button>
      </div>
    </div>
  </div>
</div>

<!-- Modal -->

<!-- Modal Carbohidratos -->
<div class="modal fade bd-example-modal-lg" id="carnicosModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Selección de Cárnicos o Proteínas</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">

        <div class="container">
        <p><b>Por favor desmarca los alimentos que no quieres que incluyamos en tu #Nutribox.</b></p>
            <?php if($alimentos_usuario_proteinas == null): ?>
                <p>Su plan no admite Proteínas</p>
            <?php endif; ?>

            <div id="recorrerCheckProtei" class="chtckgus">

              <?php foreach ($alimentos_usuario_proteinas as $result): ?>
                  
                <input type="checkbox" value="
                <?php 
                if ($result->estatus == null) {
                    echo 1;
                }else{
                    echo $result->estatus;
                } ?>" class="form-check-input-g checkActivo" id="<?php echo $result->cod_alimento; ?>" data-alimento="<?php echo $result->cod_alimento; ?>" checked>
                <label class="form-check-label" for="<?php echo $result->cod_alimento; ?>"><span><!-- This span is needed to create the "checkbox" element --></span><?php echo $result->descripcion; ?></label><br>
                          
              <?php endforeach; ?>

            </div>

        </div>

      </div>
      <div class="modal-footer">
        <button style="background: #36434a; color:white" type="button" class="btn" data-dismiss="modal">Listo</button>
      </div>
    </div>
  </div>
</div>

<!-- Modal -->

<!-- Modal Grasas -->
<div class="modal fade bd-example-modal-lg" id="grasasModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Selección de Grasas</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">

        <div class="container">
        <p><b>Por favor desmarca los alimentos que no quieres que incluyamos en tu #Nutribox.</b></p>
            <?php if($alimentos_usuario_grasas == null): ?>
                <p>Su plan no admite Grasas</p>
            <?php endif; ?>

            <div id="recorrerCheckGrasas" class="chtckgus">

              <?php foreach ($alimentos_usuario_grasas as $result): ?>
                  
                <input type="checkbox" value="
                <?php 
                if ($result->estatus == null) {
                    echo 1;
                }else{
                    echo $result->estatus;
                } ?>" class="form-check-input-g checkActivo" id="<?php echo $result->cod_alimento; ?>" data-alimento="<?php echo $result->cod_alimento; ?>" checked>
                <label class="form-check-label" for="<?php echo $result->cod_alimento; ?>"><span><!-- This span is needed to create the "checkbox" element --></span><?php echo $result->descripcion; ?></label><br>
                          
              <?php endforeach; ?>

            </div>

        </div>

      </div>
      <div class="modal-footer">
        <button style="background: #36434a; color:white" type="button" class="btn" data-dismiss="modal">Listo</button>
      </div>
    </div>
  </div>
</div>

<!-- Modal -->

<div id="contenedor" class="container animated fadeIn">

<br>

    <a style="background: #36434a; color:white" class="btn " href="<?=site_url('dashboardnuevo')?>"><div class="row"><i class="material-icons">home</i>&nbsp;Ir al Inicio</div></a>

    <!--<button style="background: #36434a; color:white" class="btn "><div class="row"><i class="material-icons">contact_support</i>&nbsp;Ir al Inicio</div></botton>-->

    <br><br>
        
        <div class="text-center">
          <p><b>Tenemos la mejor selección de Alimentos disponibles para tu deleite según tu plan nutricional.</b></p><br>
        </div>

        <div class="row">
            <div class="col-md-4 col-lg-4 col-ms-12 col-xs-12">
                
                <div class="card" style="width: 18rem;">
                    <img src="<?php echo base_url(); ?>img/Ceres/CERESPLATOSPREPARADOS-67.png" class="card-img-top" alt="...">
                    <div class="card-body">
                        <h5 class="card-title"><b>Lácteos</b></h5>
                        <p class="card-text">En esta sección podrás elegir cuáles Lácteos prefieres que incluyamos en tu #NutriBox.</p>
                        <button style="background: #36434a; color:white" id="modalLacteos" type="button" class="btn" data-toggle="modal">Ver Alimentos</button><br>
                    </div>
                </div>
                
            </div>

            <div class="col-md-4 col-lg-4 col-ms-12 col-xs-12">
                
                <div class="card" style="width: 18rem;">
                    <img src="<?php echo base_url(); ?>img/Ceres/CERESPLATOSPREPARADOS-2.png" class="card-img-top" alt="...">
                    <div class="card-body">
                        <h5 class="card-title"><b>Vegetales</b></h5>
                        <p class="card-text">En esta sección podrás elegir cuáles Vegetales prefieres que incluyamos en tu #NutriBox.</p>
                        <button style="background: #36434a; color:white" id="modalVegetales" type="button" class="btn" data-toggle="modal">Ver Alimentos</button><br>
                    </div>
                </div>
                
            </div>

            <div class="col-md-4 col-lg-4 col-ms-12 col-xs-12">
                
                <div class="card" style="width: 18rem;">
                    <img src="<?php echo base_url(); ?>img/Ceres/CERESPLATOSPREPARADOS-34.png" class="card-img-top" alt="...">
                    <div class="card-body">
                        <h5 class="card-title"><b>Frutas</b></h5>
                        <p class="card-text">En esta sección podrás elegir cuáles Frutas prefieres que incluyamos en tu #NutriBox.</p>
                        <button style="background: #36434a; color:white" id="modalFrutas" type="button" class="btn" data-toggle="modal">Ver Alimentos</button><br>
                    </div>
                </div>
                
            </div>
        </div>

        <br><br>

        <div class="row">
            <div class="col-md-4 col-lg-4 col-ms-12 col-xs-12">
                
            <div class="card" style="width: 18rem;">
                <img src="<?php echo base_url(); ?>img/Ceres/CERESPLATOSPREPARADOS-35.png" class="card-img-top" alt="...">
                <div class="card-body">
                    <h5 class="card-title"><b>Carbohidratos</b></h5>
                    <p class="card-text">En esta sección podrás elegir cuáles Carbohidratos prefieres que incluyamos en tu #NutriBox.</p>
                    <button style="background: #36434a; color:white" id="modalCarbohidratos" type="button" class="btn" data-toggle="modal">Ver Alimentos</button><br>
                </div>
            </div>
                
            </div>

            <div class="col-md-4 col-lg-4 col-ms-12 col-xs-12">
                
                <div class="card" style="width: 18rem;">
                    <img src="<?php echo base_url(); ?>img/Ceres/CERESPLATOSPREPARADOS-28.png" class="card-img-top" alt="...">
                    <div class="card-body">
                        <h5 class="card-title"><b>Cárnicos o Proteínas</b></h5>
                        <p class="card-text">En esta sección podrás elegir cuáles Cárnicos o Proteínas prefieres que incluyamos en tu #NutriBox.</p>
                        <button style="background: #36434a; color:white" id="modalCarnicos" type="button" class="btn" data-toggle="modal">Ver Alimentos</button><br>
                    </div>
                </div>
                
                
            </div>

            <div class="col-md-4 col-lg-4 col-ms-12 col-xs-12">
                
                <div class="card" style="width: 18rem;">
                    <img src="<?php echo base_url(); ?>img/Ceres/CERESPLATOSPREPARADOS-20.png" class="card-img-top" alt="...">
                    <div class="card-body">
                        <h5 class="card-title"><b>Grasas</b></h5>
                        <p class="card-text">En esta sección podrás elegir cuáles Grasas prefieres que incluyamos en tu #NutriBox.</p>
                        <button style="background: #36434a; color:white" id="modalGrasas" type="button" class="btn" data-toggle="modal">Ver Alimentos</button><br>
                    </div>
                </div>
                
                
            </div>
        </div>

        <br><br>
        
    </div>

</div>

<script src="<?php echo base_url(); ?>js/mis_gustos.js" type="text/javascript"></script>