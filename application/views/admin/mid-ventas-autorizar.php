<!-- Modal Pregunta para cambiar el estatus del cliente -->
<div id="modalEstatusPago" class="modal">
    <div class="modal-content">
      <h4>Autorizar Pago</h4>
      <p>Por favor seleccione si el pago fue <b>Aprobado</b> ó <b>Rechazado</b>.</p>

      <form id="formularioEstatus">

        <input type="hidden" id="code" name="code">
        <input type="hidden" id="num_registro" name="num_registro">

        <p>
        <label>
        <input name="estatus" type="radio" value="3" checked />
        <span>Aprobar pago</span>
        </label>
        </p>

        <p>
        <label>
        <input name="estatus" type="radio" value="6" checked />
        <span>Pago rechazado</span>
        </label>
        </p>

      </form>
      
    </div>
    <div class="modal-footer">
      <a href="#!" onclick="EstausPago()" id="btnAceptar" class="waves-effect waves-green btn-flat">Aceptar</a>

      <a href="#!" id="btnCancelar" class="modal-close waves-effect waves-green btn-flat">Cancelar</a>
    </div>
  </div>
<!-- ///////////////////////////////////////////////////////////////// -->

<!-- Modal cambii de estatus fallido -->
<div id="modalEstatusFallo" class="modal">
    <div class="modal-content">
      <h4>Error de conexión!!</h4>
      <p>Ocurrió un <b>Error</b> durante el envío de notificación de pago al usuario seleccinado, por favor intente más tarde.</p>
      
    </div>
    <div class="modal-footer">
      <a href="#!" class="modal-close waves-effect waves-green btn-flat">Aceptar</a>
    </div>
  </div>
<!-- ///////////////////////////////////////////////////////////////// -->

<main>
    <div class="container main">
        <h4>Pagos por Aprobar (PASO 1)</h4>
        <div class="row">
            <div class="col-12">
                
            </div>
        </div>
        <div class="lista">
     
            <div class="row">

                <div class="row">
                <!--<div class="col  m2  chip  FontWhite StellarBlue z-depth-1"  id="clickeable" onclick="location.href='<?php echo site_url(); ?>/admin/ventas/Autorizar';" style="cursor:pointer">
                    <img  src="<?php echo base_url(); ?>img/icono_pedidos.svg" alt="Contact Person">
                    Pendientes por Pago
                </div>
                <div class="col  m2  chip FontBlack z-depth-1"  id="clickeable" onclick="location.href='<?php echo site_url(); ?>/admin/ventas';" style="cursor:pointer">
                    <img  src="<?php echo base_url(); ?>img/icono_pedidos.svg" alt="Contact Person">
                    Pendientes por Procesar
                </div>
               
               
             <div class="col  m2 chip  FontBlack z-depth-1"  id="clickeable" onclick="location.href='<?php echo site_url(); ?>/admin/ventas/Procesada';"  style="cursor:pointer">
                    <img  src="<?php echo base_url(); ?>img/ventas.svg" alt="Contact Person">
                  Procesados
                </div>
                
                <div class="col  1 chip FontBlack z-depth-1"  id="clickeable" onclick="location.href='<?php echo site_url(); ?>/admin/ventas/Enviada';" style="cursor:pointer">
                    <img  src="<?php echo base_url(); ?>img/icono_pedidos.svg" alt="Contact Person">
                    Enviado
                </div>
                <div class="col  m2  chip FontBlack z-depth-1"  id="clickeable" onclick="location.href='<?php echo site_url(); ?>/admin/ventas/Entregado';" style="cursor:pointer">
                    <img  src="<?php echo base_url(); ?>img/icono_pedidos.svg" alt="Contact Person">
                    Entregado
                </div>
                <div class="col  m2 chip FontBlack z-depth-1"  id="clickeable" onclick="location.href='<?php echo site_url(); ?>/admin/ventas/devoluciones';"  style="cursor:pointer">
                    <img  src="<?php echo base_url(); ?>img/icono_devoluciones.svg" alt="Contact Person">
                     Devoluciones
                </div>-->
              
                
                <div class="col 1">
                    <a href="<?php echo site_url(); ?>/admin" class="btn-floating btn-large waves-effect waves-light red pointer"><i onclick="" class="material-icons">home</i></a>
                </div>
                </div>

            </div>
            <div class="row">
                <div class="col s3">
                    <div class="input-field">
                        <input id="OrderDate" value="" type="text" name="OrderDate" class="datepicker">
                        <label for="OrderDate">Fecha del pedido</label>
                    </div>
               </div>
               <div class="col s4">

               </div>
               <div class="col s5">
                    <div class="input-field">
                        <input id="searchOrders" type="search" required>
                        <label class="label-icon" for="search"><i class="material-icons">search</i></label>
                        <i class="material-icons">close</i>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-12" id="ventas-container">
                
                </div>
            </div>
        </div>

        <div class="detalle">
            
        </div>

    </div>
</main>
<div id="modal-cliente" class="modal container-fluid">
    <div class="modal-content" id="modal-clientes-datos">
    </div>
    <div class="modal-footer">
        <a href="#!" class="modal-action modal-close waves-effect waves-green btn-flat">Cerrar</a>
    </div>
</div>
<div id="modal-CerrarPedido" class="modal container-fluid">
    <div class="modal-content" id="modal-Cerrar-Pedido">
    </div>
    <div class="modal-footer">
        <a href="#!" onclick="CerrarOrden()" class="modal-action waves-effect waves-green btn-flat">Aceptar</a>
        <a href="#!" class="modal-action modal-close waves-effect waves-green btn-flat">Cerrar</a>
    </div>
</div>
<div id="modal-CancelarPedido" class="modal container-fluid">
    <div class="modal-content" id="modal-Cerrar-Pedido">
    </div>
    <div class="modal-footer">
        <a href="#!" onclick="CancelarOrden()" class="modal-action waves-effect waves-green btn-flat">Aceptar</a>
        <a href="#!" class="modal-action modal-close waves-effect waves-green btn-flat">Cerrar</a>
    </div>
</div>
<script src="<?php echo base_url(); ?>js/admin/autorizar.js"></script>