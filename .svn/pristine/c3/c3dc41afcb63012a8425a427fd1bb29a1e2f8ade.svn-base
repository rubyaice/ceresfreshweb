<?php
$afiliados_usuario;
?>

<style>
table, th, td {
  border: 1px solid black;
  border-collapse: collapse;
}
</style>

<h2>Lista de Afiliados del Suscriptor</h2>

<table style="width:100%">
  <tr>
    <th>ID</th>
    <th>Nombre</th>
    <th>Apellido</th>
    <th>Edad</th>
    <th>Sexo</th>
    <th>Peso</th>
    <th>Estatura</th>
    <th>Actitud Física</th>
    <th>Condición Especial</th>
    <th>Plan Nutricional</th>
    <th>Correo</th>
    <th>Dirección</th>
    <th>Acciones</th>
  </tr>

  <?php foreach ($afiliados_usuario as $result): ?>
    <tr>
      <td><?php echo $result->id_afiliacion; ?></td>
      <td><?php echo $result->nombre; ?></td>
      <td><?php echo $result->apellido; ?></td>
      <td><?php echo $result->edad; ?></td>
      <td><?php echo $result->sexo; ?></td>
      <td><?php echo $result->peso; ?></td>
      <td><?php echo $result->estatura; ?></td>
      <td><?php echo $result->act_fisica; ?></td>
      <td><?php echo $result->condicion_esp; ?></td>
      <td><?php echo $result->plan_nut; ?></td>
      <td><?php echo $result->correo; ?></td>
      <td><?php echo $result->direccion_envio; ?></td>
      <td>
        <a href="<?=site_url('afiliadoscontrol/eliminar_afiliado/'.$result->id_afiliacion)?>">Eliminar Afiliado</a>
        <a href="<?=site_url('afiliadoscontrol/vista_actualiar/'.$result->id_afiliacion)?>">Actualizar Afiliado</a>
        <a href="<?=site_url('afiliadoscontrol/detalle_plan_afiliado/'.$result->id_afiliacion)?>">Detalles Afiliado</a>
      </td>
    </tr>
  <?php endforeach; ?>

</table>

<a href="<?=site_url('dashboard')?>">Ir al inicio</a>
