<?php 

$productos_nutribox;

?>

<!-- Modal de agregado con exito al carrito-->
<div class="modal fade" id="agregadoModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalScrollableTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-scrollable" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalScrollableTitle"><b>Item agregado</b></h5>
      </div>
      <div class="modal-body">
        <p>Su pedido fue agregado al carrito de manera exitosa.</p>
      </div>
      <div class="modal-footer">
        <button id="btnAgregarAceptar" style="background: #36434a; color:white" type="button" class="btn" data-dismiss="modal">Aceptar</button>
      </div>
    </div>
  </div>
</div>

<!-- //////////////////////////////////////////////////// -->

<!-- Modal de agregado fallido al carrito-->
<div class="modal fade" id="agregadoFalloModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalScrollableTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-scrollable" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalScrollableTitle"><b>Error al cargar item</b></h5>
      </div>
      <div class="modal-body">
        <p>Ocurrio un error inesperado, por favor intente más tarde.</p>
      </div>
      <div class="modal-footer">
        <button id="btnAgregarFalloAceptar" style="background: #36434a; color:white" type="button" class="btn" data-dismiss="modal">Aceptar</button>
      </div>
    </div>
  </div>
</div>

<!-- //////////////////////////////////////////////////// -->

<!-- Modal de agregado para afiliados pendientes-->
<div class="modal fade" id="agregadoPendienteModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalScrollableTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-scrollable" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalScrollableTitle"><b>Advertencia</b></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p>Este usuario ya tiene items en el carrito, por favor completa las transacciones correspondientes.</p>
      </div>
      <div class="modal-footer">
        <button style="background: #36434a; color:white" type="button" class="btn" data-dismiss="modal">Aceptar</button>
      </div>
    </div>
  </div>
</div>

<!-- //////////////////////////////////////////////////// -->

<div class="container" style="margin-bottom: 20rem">

  <br>

  <div class="movilVerDesk">

      <a style="background: #36434a; color:white" class="btn " href="<?=site_url('dashboardnuevo')?>"><div class="row"><i class="material-icons">home</i>&nbsp;Inicio</div></a>

      <a style="background: #36434a; color:white" class="btn " href="<?=site_url('afiliar/vista_afiliar_terceros')?>"><div class="row"><i class="material-icons">add_circle</i>&nbsp;Afiliar</div></a>

      <a style="background: #36434a; color:white" class="btn " href="<?=site_url('afiliadoscontrol')?>"><div class="row"><i class="material-icons">group</i>&nbsp;Ver Afiliados</div></a>

    </div>

    <div style="display:none;" class="movilVerMovil">

      <a style="background: #36434a; color:white" class="btn " href="<?=site_url('dashboardnuevo')?>"><div class="row"><i class="material-icons">home</i></div></a>

      <a style="background: #36434a; color:white" class="btn " href="<?=site_url('afiliar/vista_afiliar_terceros')?>"><div class="row"><i class="material-icons">add_circle</i></div></a>

      <a style="background: #36434a; color:white" class="btn " href="<?=site_url('afiliadoscontrol')?>"><div class="row"><i class="material-icons">group</i></div></a>

    </div>

    <br><br>

    <div class="row">

      <div class="col-md-4 col-lg-4 col-sm-12 col-xs-12">
        <div class="text-center">
          <h4>Categorias de productos</h4>
        </div>
        <hr>
        <div id="categoriasProducto">
          
        </div>
      </div>
      <br>
      <div class="col-md-8 col-lg-8 col-sm-12 col-xs-12">
        <div class="text-center">
          <h4>Productos disponibles</h4>
        </div>
        <hr>
       <div id="listaProductosNut">

       </div>
      </div>  
    </div>
</div>

<script src="<?php echo base_url(); ?>js/agrgar_nutribox.js" type="text/javascript"></script>
