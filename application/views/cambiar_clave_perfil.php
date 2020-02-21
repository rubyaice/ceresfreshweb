<!-- Modal -->
<div class="modal fade" id="errorDeClaves" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Las Contraseñas no son iguales</h5>
        
      </div>
      <div class="modal-body">
        Por favor verifique que ambas contraseñas ingresadas sean iguales.
      </div>
      <div class="modal-footer">
        <button style="background: #36434a" type="button" class="btn btn-secondary" onclick="recargar()" data-dismiss="modal">Aceptar</button>
      </div>
    </div>
  </div>
</div>
<!-- ///////////////////////////////////////////////////////////// -->


<!-- Modal -->
<div class="modal fade" id="errorDeActualizacion" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Error en la Operación</h5>
        
      </div>
      <div class="modal-body">
        En este momento su contraseña no se ha podido modificar, por favor intente nuevamanete.
      </div>
      <div class="modal-footer">
        <button style="background: #36434a" type="button" class="btn btn-secondary" data-dismiss="modal">Aceptar</button>
      </div>
    </div>
  </div>
</div>
<!-- ///////////////////////////////////////////////////////////// -->


<!-- Modal -->
<div class="modal fade" id="actualizacionExitosa" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Contraseña modificada con Exito!!</h5>
        
      </div>
      <div class="modal-body">
        Su contraseña ha sido modificada con Exito.
      </div>
      <div class="modal-footer">
        <button style="background: #36434a" type="button" class="btn btn-secondary" onclick="recargar()" data-dismiss="modal">Aceptar</button>
      </div>
    </div>
  </div>
</div>
<!-- ///////////////////////////////////////////////////////////// -->


<div class="container">
  <br>

  <a style="background: #36434a; color:white" id="btnVolver" class="btn " href="<?=site_url('dashboardnuevo/vista_perfil')?>"><div class="row"><i class="material-icons">arrow_back</i>&nbsp;Volver</div></a>

  <a style="background: #36434a; color:white" id="btnInicio" class="btn " href="<?=site_url('dashboardnuevo')?>"><div class="row"><i class="material-icons">home</i>&nbsp;Ir al Inicio</div></a>

  <br><br><br>

  <div class="text-center">
    <h2>Actualización de Contraseña</h2>
  </div>

  <br><br>

  <form class="form-group" id="form_actualizar_clave" method="post">

    <input type="hidden" name="correo_usuario" id="correo_usuario" value="<?php echo $_SESSION['correo']; ?>">


    <div style="padding-bottom: 20rem;" class="row">
      <div class="col-md-6 col-sm-12 col-xs-12">

        <p>Nueva Contraseña</p>
        <input class="form-control requerir" type="password" name="pass1" id="pass1" required>
        <br>

      </div>

      <div class="col-md-6 col-sm-12 col-xs-12">

        <p>Repita la su nueva Contraseña</p>
        <input class="form-control requerir" type="password" name="pass2" id="pass2" required>
        <br>

      </div>
      
      <div id="spinner">
        <input style="background: #36434a; color:white" id="actualizar_clave" class="btn " type="button" name="enviar" value="Guardar">
      </div>

    </div>

    </div>

    <br><br>
    
  </form>
  <br>
</div>

<script src="<?php echo base_url(); ?>js/cambiar_clave_perfil.js" type="text/javascript"></script>

</body>
</html>
