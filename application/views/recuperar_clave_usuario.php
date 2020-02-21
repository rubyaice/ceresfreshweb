<!-- Modal Error de correo -->
<div class="modal fade" id="errorDeCorreo" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Correo no Existe</h5>
        
      </div>
      <div class="modal-body">
        El correo ingresado no se encuentra registrado en el sistema, por favor verifíquelo.
      </div>
      <div class="modal-footer">
        <button style="background: #36434a" type="button" class="btn btn-secondary" data-dismiss="modal" onclick="recargarPagina()">Aceptar</button>
      </div>
    </div>
  </div>
</div>
<!-- ///////////////////////////////////////////////////////////// -->


<!-- Modal Error de Envio -->
<div class="modal fade" id="errorDeEnvio" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Error de Conexión</h5>
        
      </div>
      <div class="modal-body">
        Tuvimos un problama al restaurar su contraseña, por favor verfique su conexión a Internet.  
      </div>
      <div class="modal-footer">
        <button style="background: #36434a" type="button" class="btn btn-secondary" data-dismiss="modal" onclick="recargarPagina()">Aceptar</button>
      </div>
    </div>
  </div>
</div>
<!-- ///////////////////////////////////////////////////////////// -->


<!-- Modal Envio exitoso de contraseña nueva -->
<div class="modal fade" id="envioExitoso" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Recuperación Exitosa</h5>
        
      </div>
      <div class="modal-body">
        Se ha enviado a su correo una nueva contraseña con la cual podrá acceder al sistema, <b>Esta contraseña es temporal y debe ser Modificada a la brevedad posible.</b> 
      </div>
      <div class="modal-footer">
        <button style="background: #36434a" type="button" class="btn btn-secondary" id="enviarALogin" data-dismiss="modal">Aceptar</button>
      </div>
    </div>
  </div>
</div>
<!-- ///////////////////////////////////////////////////////////// -->


<div class="container">
  <br>

  <br><br>

  <div class="text-center">
    
  </div>

  <form class="form-group" id="form_recuperar_clave" method="post">

    <div style="padding-bottom: 20rem;" class="row">

        <div class="col-md-4 col-sm-12 col-xs-12">

        </div>

        <div class="col-md-4 col-sm-12 col-xs-12">
            <br><br>
            <p>Recuperar contraseña</p>
            <input class="form-control requerir" type="email" name="correo_usuario" id="correo_usuario" placeholder="Correo electrónico" required>
            <br>

            <div class="row">


            <div class="col-md-6 col-sm-12 col-xs-12">

            <a style="background: #36434a; color:white" href="<?php echo base_url(); ?>index.php/login" id="btnVolver" class="btn"><div class="row"><i class="material-icons">arrow_back</i>&nbsp;Volver</div></a>

            </div>

            <div class="col-md-6 col-sm-12 col-xs-12">
                <div id="spinner">
                  <input style="background: #36434a; color:white" type="button" id="recuperar_clave" class="btn" name="siguiente" value="Recuperar">
                </div>
            </div>

            </div>
            
            

        </div>

        <div class="col-md-4 col-sm-12 col-xs-12">

        </div>

    </div>

    </div>

    <br><br>
    
  </form>
  <br>
</div>

<script src="<?php echo base_url(); ?>js/recuperar_clave.js" type="text/javascript"></script>

</body>
</html>
