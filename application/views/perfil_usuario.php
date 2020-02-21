<?php $planes_suscripcion; $actitud_fisica; $condicion_especial; $id_afiliado; $pais_afiliado; $estado_afliado; $ciudad_afiliado; $sector_afiliado; 

//datos de referencia del ususario para actualizar
$correo; $nombre; $apellido; $edad; $estatura; $sexo; $act_fisica; $condicion_esp; $peso; $zipcode_afiliado; $phone_afiliado; $address_afiliado;

$estado; $pais; $ciudades; $sectores;
?>

<!-- Modal Actualizacion Fallida -->
<div class="modal fade" id="actualizacionFallida" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Actualización Fallida</h5>
        
      </div>
      <div class="modal-body">
        El Proceso de Actulización se ha interrupido, por favor intentelo nuevamente.  
      </div>
      <div class="modal-footer">
        <button style="background: #36434a" type="button" class="btn btn-secondary" data-dismiss="modal" onclick="recargarPagina()">Aceptar</button>
      </div>
    </div>
  </div>
</div>
<!-- ///////////////////////////////////////////////////////////// -->

<!-- Modal Actualizacion exitosa -->
<div class="modal fade" id="actualizacionExitosa" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Actualización Exitosa</h5>
        
      </div>
      <div class="modal-body">
        El Proceso de Actualización se ha completado de manera Satisfactoria!!  
      </div>
      <div class="modal-footer">
        <button style="background: #36434a" type="button" class="btn btn-secondary" data-dismiss="modal" onclick="recargarPagina()">Aceptar</button>
      </div>
    </div>
  </div>
</div>
<!-- ///////////////////////////////////////////////////////////// -->

<div class="container">
  <br>

  <a style="background: #36434a; color:white" class="btn " href="<?=site_url('dashboardnuevo')?>"><div class="row"><i class="material-icons">home</i>&nbsp;Ir al Inicio</div></a>

  <a style="background: #36434a; color:white" class="btn " href="<?=site_url('dashboardnuevo/vista_cambiar_clave')?>"><div class="row"><i class="material-icons">lock_open</i>&nbsp;Seguridad</div></a>

  <br><br>

  <div class="text-center">
    <h2>Datos de Usuario</h2>
  </div>

  <form class="form-group" id="form_actualizar_perfil" method="post">

    <input type="hidden" name="id_afiliado" id="id_afiliado" value="<?php echo $id_afiliado; ?>">


    <div class="row">
      <div class="col-md-6 col-sm-12 col-xs-12">

        <p>Nombre(s)</p>
        <input class="form-control requerir" type="text" name="nombre" tabindex="1" value="<?php echo $nombre; ?>" id="nombre_perfil" required><br>


        <p>Peso</p>
        <input class="form-control requerir" type="number" tabindex="3" id="peso" name="peso" value="<?php echo $peso; ?>" required><br>
        
        <p>Edad</p>
        <input class="form-control requerir" type="text" tabindex="5" id="edad" name="edad" value="<?php echo $edad; ?>" required><br>

        <p>Condición especial del Afiliado</p>
        <select class="form-control requerir" tabindex="7" name="condicion_esp" id="condicion_esp" required>
         

          <?php foreach ($condicion_especial as $result){?>

          <option value="<?php echo $result->condicion_esp  ?>" <?php if($result->descripcion == $condicion_esp )
           { echo "selected";}?> > <?php  echo $result->descripcion ?> </option>

          <?php }?>
    </select>
      </div>

      <div class="col-md-6 col-sm-12 col-xs-12">

        <p>Apellido(s)</p>
        <input class="form-control requerir" type="text" id="apellido_perfil" name="apellido" tabindex="2" value="<?php echo $apellido; ?>" required><br>
        

        <p>Sexo</p>
        <input class="form-control" readonly type="text" tabindex="4" name="sexo" value="<?php echo $sexo; ?>" required>
        <br>


        <p>Estatura</p>
        <input class="form-control requerir" type="text" tabindex="6" id="estatura" name="estatura" value="<?php echo $estatura; ?>" required><br>


        <p>Actitud Física del Afiliado</p>

        <select class="form-control requerir" name="act_fisica" tabindex="8" id="act_fisica" required>
        <?php foreach ($actitud_fisica as $result){?>

          <option value="<?php echo $result->act_fisica  ?>" <?php if($result->descripcion == $act_fisica )
          { echo "selected";}?> > <?php  echo $result->descripcion ?> </option>

          <?php }?>
        </select>
        <br>
      </div>

    </div>


    <div class="col-md-12 col-sm-12 col-xs-12">
    
    </div>
    <br>

    <div class="container">
      
    <button style="background: #36434a; display:none; color:white; margin-left: 94%" class="btn btnmovilcerrar" type="button" id="btnCerrarx">X</button>
    
    <button style="background: #36434a; color:white" class="btn" type="button" id="btnDireccion">Dirección y Contacto</button>

    </div>


    <div style="display:none" id="camposDireccion" class="">


    <div class="text-center">
      <h2>Dirección y Contacto</h2>
    </div>

    <div class="row">

      <div class="col-md-6 col-sm-12 col-xs-12">

        <p>País</p>
        <select class="form-control requerir" tabindex="10" name="pais_reg" id="pais_afiliado" required>
        <?php foreach ($pais as $result){?>

          <option value="<?php echo $result->id_pais  ?>" <?php if($result->pais == $pais_afiliado )
            { echo "selected";}?> > <?php  echo $result->pais ?> </option>

            <?php }?>
          </select>
        <br>

        <p>Ciudad</p>
        <select class="form-control requerir" tabindex="12" name="ciudad_reg" id="ciudad_reg" required>
        <?php foreach ($ciudades as $result){?>

          <option value="<?php echo $result->id_ciudad  ?>" <?php if($result->ciudad == $ciudad_afiliado )
            { echo "selected";}?> > <?php  echo $result->ciudad ?> </option>

          <?php }?>

        </select>
        <br>

        <p>Código Postal</p>
        <input class="form-control" type="text" id="codigopostal_afiliado" tabindex="14" name="zipcode" value="<?php echo $zipcode_afiliado; ?>"><br>

        <p>Dirección</p>

        <textarea class="form-control requerir" tabindex="16" type="text" name="direccion_reg" id="direccion_afiliado" required><?php echo $address_afiliado; ?></textarea>

      </div>

      <div class="col-md-6 col-sm-12 col-xs-12">
        <p>Estado</p>
        <select class="form-control requerir" tabindex="11" name="estado_reg" id="estado_reg" required>
        <?php foreach ($estado as $result){?>

        <option value="<?php echo $result->id_estado  ?>" <?php if($result->estado == $estado_afliado )
          { echo "selected";}?> > <?php  echo $result->estado ?> </option>

        <?php }?>
        </select>
        <br>
        <p>Sector</p>
        <select class="form-control requerir" tabindex="13" name="sector_reg" id="sector_reg" required>
        <?php foreach ($sectores as $result){?>

          <option value="<?php echo $result->id  ?>" <?php if($result->Sector == $sector_afiliado )
            { echo "selected";}?> > <?php  echo $result->Sector ?> </option>

          <?php }?>
        </select>
        <br>
        <p>Teléfono</p>
        <input class="form-control" type="text" id="phone" tabindex="15" name="phone" value="<?php echo $phone_afiliado; ?>"><br>

        <p>Correo</p>
        <input class="form-control" type="email" tabindex="16" readonly name="correo" value="<?php echo $correo; ?>" required>
      </div>
    </div>
    <br>
    <div class="col-md-12 col-sm-12 col-xs-12">

      
      <br>
      
        <div class="container">

        <button style="background: #36434a; display:none; color:white; margin-left: 94%" class="btn btnmovilcerrar" type="button" id="btnCerrar">Cerrar</button>

        </div>
    
    </div>
      
    </div>

    <br><br>
    
    <div class="container">

    <div id="spinner">
      <input style="background: #36434a; color:white" type="button" id="actualizar_perfil" class="btn" name="enviar" value="Guardar">
    </div>

    </div>

  </form>
  <br>

  
</div>

<script src="<?php echo base_url(); ?>js/actualizar_perfil.js" type="text/javascript"></script>

</body>
</html>
