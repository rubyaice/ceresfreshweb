<?php
//detales de compra para el arrito
$carrito_usuario;$por_pagar;

//detalles del usuario que se enviaran a los metodos de pago
$nombre; $apellido; $cedula; $codeorder; $monto_total; $num_afiliacion;
?>

  <div style="padding-bottom: 30rem;" class="container animated fadeIn">
    <br>
    <a style="background: #36434a; color:white" class="btn" href="<?=site_url('dashboardnuevo')?>"><div class="row"><i class="material-icons">home</i>&nbsp;Ir al Inicio</div></a>
    <br><br>

    <?php if (!$carrito_usuario == null): ?>
      <span style="float: left;"><b>Información:</b> Si deseas anular una de las #NutriBox en este momento por favor dirígete al&nbsp;</span> <span class="row" style="float: left;"><i class="material-icons">shopping_cart</i> Carrito</span><span>&nbsp;<span class="row" style="float: left">&nbsp;y presione el botón<i class="material-icons">cancel</i></span>
    <?php endif; ?>

    
    <div class="row">
      <div class="col-md-8 col-lg-8 col-sm-12 col-xs-12">
      <br>
        <h4 class="h4 nunita">Detalles de compra.</h4>
        <input type="hidden" id="pagar_nutribox" value="<?php echo $por_pagar; ?>">
        <br>

        <div class="table-responsive">

          <table style="border-radius: 5px;" class="table table-striped lato">
            <tr>

              <th>Nombre(s)</th>
              <th>Apellido(s)</th>
              <th>Plan</th>
              <th>Precio</th>
              <th>Cantidad</th>
              <th>Total</th>
              <th>Fecha</th>
            
            </tr>


            <?php 
              if ($carrito_usuario != null): 
            foreach ($carrito_usuario as $result): ?>
              <tr>

                <td><?php echo $result->nombre; ?></td>
                <td><?php echo $result->apellido; ?></td>
                <td><?php echo $result->plan_nut; ?></td>
                <td ><?php if(isset($result->precio)){ echo number_format($result->precio, 2, '.',','); } ?></td>
                <td style='text-align:center'><?php echo $result->cantidad; ?></td>
                <td><?php if(isset($result->monto)){ echo number_format($result->monto, 2, '.',','); } ?>&nbsp;<span style="color:green">Bs.</span></td>
                <td><?php echo $result->fecha; ?></td>
                
              </tr>
            <?php endforeach; 
            endif;
            ?>

          </table>

        </div>

        <?php if ($carrito_usuario == null): ?>
          <div class="text-center">
            <h3 class="h3">No tienes Nutri<span style="color:#7DBE41">boxs</span> por pagar</h3>
          </div>
        <?php endif; ?>
      </div>
      
      <div style="margin-top: 3%;" id="resumenCompra" class="col-md-4 col-sm-12 col-lg-4 col-xs-12">
            <div class="card">
              <div class="card-body">
                <p class="text-center"><b>Resumen del pedido</b></p>
                <hr>
                <?php if(empty($codeorder)): ?>
                  <p class="text-center"><b>No tiene Ordenes</b><br></p>
                <?php else: ?>
                  <p class="text-center"><b>Orden #</b><br>
                    <?php echo $codeorder; ?>
                  </p>
                <?php endif; ?>
                <hr>
                <div>
                  <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <p class="text-center">Aquí encontrarás el monto a pagar por tus <b>#Nutri<span style="color: #7dbe41;">Box</span>.</b></p>
                    <div class="row">
                      <div class="col-6 text-left">  
                        <p><span>Subtotal(<?php  echo $cantidad_total?> Items):</span>&nbsp;</p>

                        <p>TOTAL :&nbsp;</p>
                      </div>
                      <div class="col-6 text-left">
                        <p id="precio_dolares"><b><label id="subtotal"><?php if(isset($subtotal) and $subtotal != "" ){ echo number_format($subtotal, 2, '.',','); } ?></label></b></p>
                        <p id="precio_bs"><b><span><?php if(isset($monto_total) and $monto_total != ""){ echo number_format($monto_total, 2, '.',','); } ?><span style="color:green"></span></span></b></p>
                      </div>
                    </div>
                    <hr>
                    <div class="col-12 text-left">
                      <form action="<?=site_url('checkout')?>" method="post">

                        <input type="hidden" name="nombre" value="<?php echo $nombre; ?>">
                        <input type="hidden" name="apellido" value="<?php echo $apellido; ?>">

                        <input type="hidden" name="codeorder" value="<?php echo $codeorder; ?>">
                        <input type="hidden" name="monto_total" value="<?php echo $monto_total; ?>">
                        <input type="hidden" name="num_afiliacion" value="<?php echo $num_afiliacion; ?>">

                        <div class="text-center">

                          <input style="background:#7dbe41; color:white" id="pagar" class="btn " type="submit" name="pagar" value="$&nbsp;Pagar&nbsp;">
                          <a style="background:#7dbe41; color:white" id="afiliar" class="btn " href="<?=site_url('afiliar/vista_afiliar_terceros')?>"><div class="row"><i class="material-icons">add_circle</i>&nbsp;Afiliar</div></a>

                        </div>
                      </form>
                    </div>
                    

                    <div class="row">

                      <div class="col-12 text-left">      
                      </div>
                      <div class="col-12 text-left">     
                      </div>
                    </div>

                  </div>
                </div>
              </div>
            </div>
        </div>

      
    </div>
  </div>


  <script type="text/javascript">

    var proceso = $('#pagar_nutribox').val();
    var pagar = document.querySelector('#pagar');
    var afiliar = document.querySelector('#afiliar');


    if ( proceso== 0 ) {

      pagar.setAttribute("disabled", "disabled");
     // afiliar.classList.add("disabled");

    }

  </script>

</body>
</html>
