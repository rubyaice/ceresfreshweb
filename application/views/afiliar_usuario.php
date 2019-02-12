<h2>Formulario de Afiliar un usuario</h2>
<?php $planes_suscripcion; $actitud_fisica; $condicion_especial; $num_afiliacion_afiliado;?>
<form class="" action="<?=site_url('afiliar/insertar_en_afiliacion')?>" method="post">
  <p>Correo del Afiliado</p>
  <input type="email" name="correo" placeholder="Ingrese su correo">

  <input type="hidden" name="num_afiliacion" value="<?php echo $num_afiliacion_afiliado; ?>">
  <br>

  <p>Nombre</p>
  <input type="text" name="nombre" placeholder="Ingrese su Nombre"><br>
  <p>Apellido</p>
  <input type="text" name="apellido" placeholder="Ingrese su apellido"><br>
  <p>Edad</p>
  <input type="text" name="edad" placeholder="Ingrese su edad"><br>
  <p>Sexo</p>
  <select class="" name="sexo">
    <option value="Masculino">Masculino</option>
    <option value="Femenino">Femenino</option>
  </select>
  <br>
  <p>Peso</p>
  <input type="text" name="peso" placeholder="Ingrese su peso"><br>
  <p>Estatura</p>
  <input type="text" name="estatura" placeholder="Ingrese su estatura"><br>
  <p>Actitud Física del Ususario</p>
  <select class="" name="act_fisica">
    <option value="">Seleccione su Actitud Física</option>

    <?php foreach ($actitud_fisica as $result){

      echo "<option value=".$result->act_fisica.">".$result->descripcion."</option>";

    }?>
  </select>
  <br>
  <p>Condición especial</p>
  <select class="" name="condicion_esp">
    <option value="">Seleccione si tiene alguna condición especial</option>

    <?php foreach ($condicion_especial as $result){

      echo "<option value=".$result->condicion_esp.">".$result->descripcion."</option>";

    }?>
  </select>
  <br>

  <p>Ingrese su Dirección</p>
  <input type="text" name="direccion_envio" placeholder="Ingrese su dirección">

  <br><br>
  <input type="submit" name="enviar" value="Afiliar">
</form>

<a href="<?=site_url('dashboard')?>">Ir a Dashboard</a>
