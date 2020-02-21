<?php $nombre; $apellido; $cedula; $codeorder; $monto_total; $num_afiliacion;?>

  <div style="background: #fff4f4;">

    <div style="padding-top: 2.5rem; padding-bottom: 10.5rem;" class="container animated fadeIn">

      <div class="text-center">
        <h2>Metodos de pago</h2>
      </div>
      <br>
      <form class="form-group" action="<?=site_url('procesarcompra/pago_transferencia')?>" method="post">

        <input type="hidden" name="correo" value="<?php echo $_SESSION['correo']; ?>">
        <input type="hidden" name="estatus" value="3">
        <input type="hidden" name="tipo_transaccion" value="4">
        <input type="hidden" name="code_orden" value="<?php echo $codeorder; ?>">
        <input type="hidden" name="num_afiliacion" value="<?php echo $num_afiliacion; ?>">

        <div class="row">
          <div class="col-md-6 col-sm-12 col-xs-12">
              <p class=" ">Nombre*</p>
              <input class="form-control" type="text" name="nombre" value="<?php echo $nombre; ?>"><br>
              <p class="">Apellido*</p>
              <input class="form-control" type="text" name="apellido" value="<?php echo $apellido; ?>">
          </div>

          <div class="col-md-6 col-sm-12 col-xs-12">
              <p class="">Cédula*</p>
              <input class="form-control" type="text" name="cedula" value="<?php echo $cedula; ?>"><br>
              <p class=" ">Monto*</p>
              <input class="form-control" type="text" name="monto_total" value="<?php echo $monto_total; ?>">
          </div>
        </div>
        <br>
        <hr class=" ">

        <div class="row">
          <div class="col-md-4 col-sm-12 col-xs-12">

          </div>

          <div class="col-md-4 col-sm-12 col-xs-12">
            <p class="text-center">Ingrese el número de transacción bancaria para ser verificado</p>

            <input class="form-control" type="number" name="num_transaccion" placeholder="Número de Transacción" required><br>

            <p>Ingrese el banco Emisor</p>
            <input class="form-control" type="text" name="banco_emisor" placeholder="Ingrese su banco" required><br>
            <p>Ingrese el banco Receptor</p>
            <input class="form-control" type="text" name="banco_receptor" placeholder="Ingrese el banco" required><br>

            <h3>Monto Total a Pagar: <label style="color:#27E04B" for="monto"><span class="Moneda"><?php echo $monto_total; ?>Bs.</span></label></h3>

            <br>

            <div class="row">
              <div class="col-md-6 col-sm-12 col-xs-12">
                <input style="background:#7dbe41" class="btn " type="submit" name="enviar" value="Pagar">
              </div>

              <div class="col-md-6 col-sm-12 col-xs-12">
                  <a style="background:#7dbe41" class="btn " href="<?=site_url('detallespago')?>">Cancelar</a>
              </div>
            </div>
          </div>

          <div class="col-md-4 col-sm-12 col-xs-12">

          </div>
        </div>
      </form>

    </div>


  </div>

    <script src="<?php echo base_url(); ?>js/jquery-3.3.1.min.js" type="text/javascript"></script>
    <script src="<?php echo base_url(); ?>js/bootstrap.min.js" type="text/javascript"></script>
  </body>
</html>
