<?php
$afiliados_usuario;
?>

<!-- Modal de ayuda en la parte de afiliados del usuario-->
<div class="modal fade" id="ayudaModalScrollable" tabindex="-1" role="dialog" aria-labelledby="exampleModalScrollableTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-scrollable" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalScrollableTitle"><b>Ayuda</b></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="text-center">
          <p><b>Referencia y leyenda para utilizar correctamente las funciones que corresponden a tus Afiliados.</b></p>
        </div>
        <div>
          <p><div class="row"><i class="material-icons" title="Ver plan nutricional del Afiliado">visibility</i>:&nbsp;<span>Ver plan nutricional del Afiliado.</span></div></p>
          <p><div class="row"><i class="material-icons" title="Ver plan nutricional del Afiliado">border_color</i>:&nbsp;<span>Editar los datos de tu Afliado.</span></div></p>
          <p><div class="row"><i class="material-icons" title="Ver plan nutricional del Afiliado">queue</i>:&nbsp;<span>Elegir y Admnistrar los gustos de tu Afiliado.</span></div></p>
          <p><div class="row"><i class="material-icons" title="Ver plan nutricional del Afiliado">delete</i>:&nbsp;<span>Eliminar a este Afiliado de tu lista.</span></div></p>
        </div>
      </div>
      <div class="modal-footer">
        <button style="background: #36434a; color:white" type="button" class="btn" data-dismiss="modal">Cerrar</button>
      </div>
    </div>
  </div>
</div>

<!-- Modal de ayuda en la parte de afiliados del usuario-->

<!-- Modal -->
<div id="modal">

</div>

<div style="padding-bottom: 30rem;" class="container animated fadeIn">
  <br>
  <div class="row">

    <div class="btnAfDesk">

      <div class="row">
        <div class="text-left">
          <a style="background: #36434a; color:white" class="btn " href="<?=site_url('dashboardnuevo')?>"><div class="row"><i class="material-icons">home</i>&nbsp;Ir al Inicio</div></a>
        </div>
        &nbsp;&nbsp;
        <div class="text-right">
          <a style="background: #36434a; color:white" class="btn " href="<?=site_url('afiliar/vista_afiliar_terceros')?>"><div class="row"><i class="material-icons">add_circle</i>&nbsp;Afiliar</div></a>
        </div>
        &nbsp;&nbsp;
        <div class="text-right">
          <a style="background: #36434a; color:white" id="btnAyuda" class="btn" href="#"><div class="row"><i class="material-icons">help</i>&nbsp;Ayuda</div></a>
        </div>
      </div>

    </div>


    <div style="display: none;" class="btnAfMov">

    <div class="text-left">
      <a style="background: #36434a; color:white" class="btn " href="<?=site_url('dashboardnuevo')?>"><div class="row"><i class="material-icons">home</i></div></a>
    </div>
    &nbsp;&nbsp;
    <div class="text-right">
      <a style="background: #36434a; color:white" class="btn " href="<?=site_url('afiliar/vista_afiliar_terceros')?>"><div class="row"><i class="material-icons">add_circle</i></div></a>
    </div>
    &nbsp;&nbsp;
    <div class="text-right">
      <a style="background: #36434a; color:white" id="btnAyudaM" class="btn" href="#"><div class="row"><i class="material-icons">help</i></div></a>
    </div>

  </div>

  </div>

  
  <br><br>
  <div class="text-center">
    <h2>Lista de Afiliados</h2>
  </div>
  <br>

  <div class="table-responsive">
    <table class="table table-striped">
      <tr>
        <th>Nombre</th>
        <th>Apellido</th>

        <th>Condición Especial</th>
        <th>Correo</th>
        <th class="text-center">Acciones</th>
      </tr>

      <?php foreach ($afiliados_usuario as $result): ?>
        <tr>
          <td><?php echo $result->nombre; ?></td>
          <td><?php echo $result->apellido; ?></td>

          <td><?php echo $result->condicion_esp; ?></td>
          <td><?php echo $result->correo; ?></td>

          <td>
            <div class="row">

              <div class="col-md-3 col-lg-3 col-ms-12">
                <a style="color:#36434a" href="<?=site_url('afiliadoscontrol/detalle_plan_afiliado/'.base64_encode($result->id_afiliacion))?>"><i class="material-icons" title="Ver plan nutricional del Afiliado">visibility</i></a>
              </div>
              
              <div class="col-md-3 col-lg-3 col-ms-12">
                <a style="color:#36434a" href="<?=site_url('afiliadoscontrol/vista_actualiar/'.base64_encode($result->id_afiliacion))?>"><i class="material-icons" title="Editar datos de tu Afiliado">border_color</i></a>
              </div>

              <div class="col-md-3 col-lg-3 col-ms-12">
                <a style="color:#36434a" href="<?=site_url('misgustos/mis_gustos_afiliado/'.base64_encode($result->id_afiliacion))?>"><i class="material-icons" title="Administrar gustos de Afiliado">favorite</i></a>
              </div>
              
              <div class="col-md-3 col-lg-3 col-ms-12">
                <a style="color:#36434a" href="#" onclick="abrirModal('<?php echo $result->id_afiliacion; ?>', '<?php echo $result->correo; ?>');" data-toggle="modal" data-target="#modalEliminar"><i class="material-icons" title="Eliminar Afiliado de tu lista">delete</i></a>
              </div>

            </div>

          </td>
        </tr>
      <?php endforeach; ?>

    </table>
  </div>

  <?php if ($afiliados_usuario == null): ?>
    <div class="text-center">
      <h5 class="h5">No tiene Afiliados</h5>
    </div>
  <?php endif; ?>

</div>

  <script src="<?php echo base_url(); ?>js/eliminar_tercero.js" type="text/javascript"></script>
</body>
</html>
