<h2>Formulario de Actualización de Afiliado </h2>
<?php $planes_suscripcion; $actitud_fisica; $condicion_especial; $num_afiliacion_afiliado; $id_afiliado;?>

<form class="" action="<?=site_url('afiliadoscontrol/actualizar_afiliado')?>" method="post">
  <input type="hidden" name="id_afiliado" value="<?php echo $id_afiliado; ?>">
  <p>Nuevo Correo</p>
  <input type="email" name="correo" placeholder="Ingrese su correo">
  <br>
  <p>Cambiar Nombre</p>
  <input type="text" name="nombre" placeholder="Ingrese su Nombre"><br>
  <p>Cambiar Apellido</p>
  <input type="text" name="apellido" placeholder="Ingrese su apellido"><br>
  <p>Cambiar Edad</p>
  <input type="text" name="edad" placeholder="Ingrese su edad"><br>
  <p>Sexo</p>
  <select class="" name="sexo">
    <option value="Masculino">Masculino</option>
    <option value="Femenino">Femenino</option>
  </select>
  <br>
  <p>Cambiar Peso</p>
  <input type="number" name="peso" placeholder="Ingrese su peso"><br>
  <p>Cambiar Estatura</p>
  <input type="text" name="estatura" placeholder="Ingrese su estatura"><br>
  <p>Actitud Física del Afiliado</p>
  <select class="" name="act_fisica">
    <option value="">Seleccione su Actitud Física</option>

    <?php foreach ($actitud_fisica as $result){

      echo "<option value=".$result->act_fisica.">".$result->descripcion."</option>";

    }?>
  </select>
  <br>
  <p>Condición especial del Afiliado</p>
  <select class="" name="condicion_esp">
    <option value="">Seleccione si tiene alguna condición especial</option>

    <?php foreach ($condicion_especial as $result){

      echo "<option value=".$result->condicion_esp.">".$result->descripcion."</option>";

    }?>
  </select>
  <br>

  <br><br>
  <input type="submit" name="enviar" value="Actualizar">
</form>

<a href="<?=site_url('afiliadoscontrol')?>">Ir a atrás</a>
