<?php $correo; $plan_suscrip; $num_afiliacion; $estatus; $fecha_pago; $nombre; $apellido; $edad; $sexo; $peso; $estatura; $act_fisica; $condicion_esp; $plan_nut; $direccion_envio; $resultados_plan; ?>

<div class="container animated fadeIn">
  <br>
  <a style="background:#7dbe41" class="btn btn-primary" href="<?=site_url('dashboard')?>"><div class="row"><i class="material-icons">home</i>&nbsp;Ir al Inicio</div></a>
  <br><br>
  <div class="text-center">
    <h2 class="h2 nunita">Detalles del Plan Nutricional</h2>
  </div>
  <br>

  <table style="width:100%;" class="table table-striped">
    <tr>
      <th scope="col">Comida</th>
      <th scope="col">Tipo de Alimento</th>
      <th scope="col">Porción</th>
    </tr>

    <?php foreach ($resultados_plan as $resultado): ?>
      <tr>
        <td><?php echo $resultado->comida; ?></td>
        <td><?php echo $resultado->tipo_alimento; ?></td>
        <td><?php echo $resultado->porcion; ?></td>
      </tr>
    <?php endforeach; ?>
  </table>

  <br>

  <div style="margin-bottom: 2%;"></div>
</div>

<script src="<?php echo base_url(); ?>js/jquery-3.3.1.min.js" type="text/javascript"></script>
<script src="<?php echo base_url(); ?>js/bootstrap.min.js" type="text/javascript"></script>
</body>
</html>
