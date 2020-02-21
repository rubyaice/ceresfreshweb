<?php $planes_nutricionales; $planes_suscripcion; $actitud_fisica; $condicion_especial?>


    <div style="margin-top: 3%;" class="container animated fadeIn">
      <div class="text-center">
          <h2 style="color: white;">Formulario de Suscripción de Usuario</h2>
          <br><br>
      </div>

      <form class="form-group" action="<?=site_url('suscribir/recibir_datos_suscripcion')?>" method="post">

        <div class="row">
          <div class="col-md-6 col-xs-12 col-sm-12">
            <h3 style="color: white;" class="h3 text-center">Datos del Suscriptor</h3>
            <input type="hidden" name="correo" value="<?php echo $_SESSION['correo']; ?>">
            <input type="hidden" name="num_afiliacion" value="123" required><br>

            <p style="color: white;">Nombre(s)</p>
            <input class="form-control" type="text" name="nombre" placeholder="Ingrese su Nombre" required><br>
            <p style="color: white;">Apellido(s)</p>
            <input class="form-control" type="text" name="apellido" placeholder="Ingrese su Apellido" required><br>
            <p style="color: white;">Cédula</p>
            <input class="form-control" type="number" name="cedula" placeholder="Ingrese su cédula" required><br>
            <p style="color: white;">Edad</p>
            <input class="form-control" type="text" name="edad" placeholder="Ingrese su Edad" required><br>
          </div>

          <div class="col-md-6 col-xs-12 col-sm-12">
            <h3 style="color: white;" class="h3 text-center">Plan Nutricional</h3>
            <br>
            <p style="color: white;">Sexo</p>
            <select class="form-control" name="sexo" required>
              <option value="Masculino">Masculino</option>
              <option value="Femenino">Femenino</option>
            </select>
            <br>
            <p style="color: white;">Peso</p>
            <input class="form-control" type="text" name="peso" placeholder="Ingrese su Peso" required><br>
            <p style="color: white;">Estatura</p>
            <input class="form-control" type="text" name="estatura" placeholder="Ingrese su Estatura" required><br>
            <p style="color: white;">Actitud Física del Usuario</p>
            <select class="form-control" name="act_fisica" required>
              <option value="">Seleccione su Actitud Física</option>

              <?php foreach ($actitud_fisica as $result){

                echo "<option value=".$result->act_fisica.">".$result->descripcion."</option>";

              }?>
            </select>
            <br>
          </div>

        </div>
        <br><br>
        <h3 style="color: white;" class="h3 text-center">Otros datos</h3>
        <br>
        <p style="color: white;">Condición especial</p>
        <select class="form-control" name="condicion_esp" required>
          <option value="">Seleccione si tiene alguna condición especial</option>

          <?php foreach ($condicion_especial as $result){

            echo "<option value=".$result->condicion_esp.">".$result->descripcion."</option>";

          }?>
        </select>
        <br>
        <p style="color: white;">Dirección de Envío</p>
        <input class="form-control" type="text" name="direccion_envio" placeholder="Ingrese su dirección" required><br>

        <label style="color: white;" for="plan">Plan suscripción</label>
        <select class="form-control" name="plan_suscrip" required>
          <option value="">Seleccione un Plan de Suscripción</option>

          <?php foreach ($planes_suscripcion as $result){

            echo "<option value=".$result->plan_suscrip.">".$result->descripcion."</option>";

          }?>
        </select>

        <div class="text-center">
          <br><br>
          <a class="btn btn-danger" href="<?=site_url('dashboard')?>">Cancelar</a>
          <input class="btn btn-primary" type="submit" name="enviar" value="Siguiente >">
          <br>
        </div>

      </form>
    </div>

    <script src="<?php echo base_url(); ?>js/jquery-3.3.1.min.js" type="text/javascript"></script>
    <script src="<?php echo base_url(); ?>js/bootstrap.min.js" type="text/javascript"></script>
  </body>
</html>
