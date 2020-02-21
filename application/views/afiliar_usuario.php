<?php $actitud_fisica; $condicion_especial; $num_afiliacion_afiliado; $plan_suscrip; $nombre; $apellido; $cedula; $estados; $ciudad; $sector; $precio_plan;
?>

  <br>
  <div class="container animated fadeIn">

    <a style="background: #7dbe41" class="btn btn-primary" href="<?=site_url('dashboard')?>"><div class="row"><i class="material-icons">home</i>&nbsp;Ir al Inicio</div></a><br><br>

    <div class="text-center">
      <h2 class="h2" >Formulario de Afiliación de Usuario</h2>
      <br><br>
    </div>


    <form class="form-group" action="<?=site_url('afiliar/insertar_en_afiliacion')?>" method="post">

      <input type="hidden" name="plan_suscrip" value="<?php echo $plan_suscrip; ?>">
      <input type="hidden" name="cedula" value="<?php echo $cedula; ?>">

      <input type="hidden" name="precio_plan" value="<?php echo $precio_plan; ?>">
      <input type="hidden" name="code_orden" value="1">
      <input type="hidden" name="estatus" value="1">



      <div class="row">
        <div class="col-md-6 col-sm-12 col-xs-12">
          <h3  class="h3 text-center">Datos del Afiliado</h3>
          <br>
          <p >Correo del Afiliado</p>
          <input readonly="readonly" class="form-control" type="email" name="correo" value="<?php echo $_SESSION['correo']; ?>" required><br>

          <input type="hidden" name="num_afiliacion" value="<?php echo $num_afiliacion_afiliado; ?>">

          <p >Nombre</p>
          <input readonly="readonly" class="form-control" type="text" name="nombre" value="<?php echo $nombre; ?>" required ><br>
          <p >Apellido</p>
          <input readonly="readonly" class="form-control" type="text" name="apellido" value="<?php echo $apellido; ?>" required><br>
          <p >Edad</p>
          <input class="form-control" type="text" name="edad" placeholder="Ingrese su edad" required><br>
        </div>

        <div class="col-md-6 col-sm-12 col-xs-12">
          <h3  class="h3 text-center">Datos para el Plan Nutricional</h3>
          <br>
          <p >Sexo</p>
          <select class="form-control" name="sexo" required>
            <option value="Masculino">Masculino</option>
            <option value="Femenino">Femenino</option>
          </select>
          <br>
          <p >Peso</p>
          <input class="form-control" type="text" name="peso" placeholder="Ingrese su peso" required><br>
          <p >Estatura</p>
          <input class="form-control" type="text" name="estatura" placeholder="Ingrese su estatura" required><br>
          <p >Actitud Física del Ususario</p>
          <select class="form-control" name="act_fisica" required>
            <option value="">Seleccione su Actitud Física</option>

            <?php foreach ($actitud_fisica as $result){

              echo "<option value=".$result->act_fisica.">".$result->descripcion."</option>";

            }?>
          </select>
          <br>
        </div>
      </div>

      <p >Condición especial</p>
      <select class="form-control" name="condicion_esp" required>
        <option value="">Seleccione si tiene alguna condición especial</option>

        <?php foreach ($condicion_especial as $result){

          echo "<option value=".$result->condicion_esp.">".$result->descripcion."</option>";

        }?>
      </select>
      <br>

      <p >Ingrese su Dirección</p>
      <input class="form-control" type="text" name="direccion_envio" placeholder="Ingrese su dirección" required>

      <br><br>
      <input style="background: #7dbe41; color:white" class="btn " type="submit" name="enviar" value="Afiliarse">
    </form>

  </div>


<script src="<?php echo base_url(); ?>js/jquery-3.3.1.min.js" type="text/javascript"></script>
<script src="<?php echo base_url(); ?>js/bootstrap.min.js" type="text/javascript"></script>
</body>
</html>
