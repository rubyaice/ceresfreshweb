<?php $num_afiliacion; $apellido; $nombre; $edad; $sexo; $peso; $estatura; $act_fisica; $condicion_esp; $plan_nut; $correo; $direccion_envio; $resultado_plan_afiliado; ?>

<style>

  table, th, td {
  border: 1px solid black;
  border-collapse: collapse;
}
</style>

<h2>Detalles del Afiliado y su Plan Nutricional</h2>

<p>Nombre: <label for="nombre"><?php echo $nombre; ?></label></p>
<p>Apellido: <label for="nombre"><?php echo $apellido; ?></label></p>
<p>Número de afiliación: <label for="nombre"><?php echo $num_afiliacion; ?></label></p>
<p>Edad: <label for="nombre"><?php echo $edad; ?></label></p>
<p>Sexo: <label for="nombre"><?php echo $sexo; ?></label></p>
<p>Peso: <label for="nombre"><?php echo $peso; ?></label></p>
<p>Estatura: <label for="nombre"><?php echo $estatura; ?></label></p>
<p>Actitud Física: <label for="nombre"><?php echo $act_fisica; ?></label></p>
<p>Condición Especial: <label for="nombre"><?php echo $condicion_esp; ?></label></p>
<p>Plan Nutricional: <label for="nombre"><?php echo $plan_nut; ?></label></p>
<p>Correo Afiliado: <label for="nombre"><?php echo $correo; ?></label></p>
<p>Dirección: <label for="nombre"><?php echo $direccion_envio; ?></label></p>

<br>

<h2>Detalles del Plan Nutricional</h2>

<table style="width:100%;">
  <tr>
    <th>Comida</th>
    <th>Tipo de Alimento</th>
    <th>Porción</th>
  </tr>

  <?php foreach ($resultado_plan_afiliado as $resultado): ?>
    <tr>
      <td><?php echo $resultado->comida; ?></td>
      <td><?php echo $resultado->tipo_alimento; ?></td>
      <td><?php echo $resultado->porcion; ?></td>
    </tr>
  <?php endforeach; ?>
</table>

<br>

<a href="<?=site_url('dashboard')?>">Ir al inicio</a>
