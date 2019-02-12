<form class="" action="<?=site_url('dashboard/validar_tranferencia')?>" method="post">
  <input type="hidden" name="correo" value="<?php echo $_SESSION['correo']; ?>">
  <p>Ingrese Nombre (persona que tranfiere)</p>
  <input type="text" name="nombre" placeholder="Ingrese nombre"><br>
  <p>Ingrese Apellido (persona que tranfiere)</p>
  <input type="text" name="apellido" placeholder="Ingrese apellido"><br>
  <p>Ingrese Cédula (persona que tranfiere)</p>
  <input type="number" name="cedula"><br>
  <p>Ingrese el Banco Emisor</p>
  <input type="text" name="banco_emisor" placeholder="Ingrese Banco"><br>
  <p>Ingrese Banco Receptor</p>
  <input type="text" name="banco_receptor" placeholder="Ingrese Banco"><br>
  <p>Ingrese número de Referencia bancaria</p>
  <input type="number" name="referencia"><br><br>
  <input type="hidden" name="estatus" value="3">

  <input type="submit" name="validar" value="Validar Transferencia"><br><br>

</form>

<a href="<?=site_url('dashboard')?>">Ir al Inicio</a>
