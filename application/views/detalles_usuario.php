<?php $correo; $plan_suscrip; $num_afiliacion; $estatus; $fecha_pago; $nombre; $apellido; $edad; $sexo; $peso; $estatura; $act_fisica; $condicion_esp; $plan_nut; $direccion_envio; $resultados_plan; ?>

<style>
table, th, td {
  border: 1px solid black;
  border-collapse: collapse;
}
</style>

<?php if ($correo == $_SESSION['correo']): ?>
  <h2>Detalles de Suscripción</h2>
  <p>Ususario: <label><?php echo $correo; ?></label></p>
  <p>Plan de Suscripción: <label><?php echo $plan_suscrip; ?></label></p>
  <p>Número de afiliación: <label><?php echo $num_afiliacion; ?></label></p>
  <p>Estatud del plan del Suscriptor: <label><?php echo $estatus; ?></label></p>
  <p>Fecha de último pago: <label><?php echo $fecha_pago; ?></label></p>
<?php endif; ?>

<h2>Detalles Generales</h2>

<p>Nombre: <label><?php echo $nombre; ?></label></p>
<p>Apellido: <label><?php echo $apellido; ?></label></p>
<p>Edad: <label><?php echo $edad; ?></label></p>
<p>Sexo: <label><?php echo $sexo; ?></label></p>
<p>Peso: <label><?php echo $peso; ?></label></p>
<p>Estatura: <label><?php echo $estatura; ?></label></p>
<p>Actitud Física: <label><?php echo $act_fisica; ?></label></p>
<p>Condición Especial: <label><?php echo $condicion_esp; ?></label></p>
<p>Plan Nutricional: <label><?php echo $plan_nut; ?></label></p>
<p>Dirección de Envío: <label><?php echo $direccion_envio; ?></label></p>

<br>

<h2>Detalles del Plan Nutricional</h2>

<table style="width:100%;">
  <tr>
    <th>Comida</th>
    <th>Tipo de Alimento</th>
    <th>Porción</th>
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

<a href="<?=site_url('dashboard')?>">Ir al Inicio</a>
