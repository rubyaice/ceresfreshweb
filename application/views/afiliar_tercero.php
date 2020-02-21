<?php $actitud_fisica; $condicion_especial; $num_afiliacion_afiliado; $plan_suscrip; $nombre; $apellido; $cedula; $estados; $ciudad; $sector; $precio_plan;
?>

<!-- Modal Afiliacion Fallida -->
<div class="modal fade" id="afiliacionFallida" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Afiliación Fallida</h5>
        
      </div>
      <div class="modal-body">
        El Proceso de Afiliación se ha interrupido, por favor intentelo nuevamente.  
      </div>
      <div class="modal-footer">
        <button style="background: #36434a" type="button" class="btn btn-secondary" data-dismiss="modal" onclick="recargarPagina()">Aceptar</button>
      </div>
    </div>
  </div>
</div>
<!-- ///////////////////////////////////////////////////////////// -->

<!-- Modal Afiliacion exitosa -->
<div class="modal fade" id="afiliacionExitosa" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Afiliación Exitosa</h5>
        
      </div>
      <div class="modal-body">
        El Proceso de Afiliación se ha completado, por favor verifique el estado y pago correspondiente de su afiliado para disfrutar del servicio de Ceresfresh.  
      </div>
      <div class="modal-footer">
        <button style="background: #36434a" type="button" class="btn btn-secondary" data-dismiss="modal" onclick="recargarPagina()">Aceptar</button>
      </div>
    </div>
  </div>
</div>
<!-- ///////////////////////////////////////////////////////////// -->

<!-- Modal Direccion Fallida -->
<div class="modal fade" id="direccionFallo" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Dirección del usuario no disponible</h5>
        
      </div>
      <div class="modal-body">
        La dirrección del usuario no se encuentra disponible actualmente, por favor consulte más tarde.  
      </div>
      <div class="modal-footer">
        <button style="background: #36434a" type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
      </div>
    </div>
  </div>
</div>
<!-- ///////////////////////////////////////////////////////////// -->

<div style="background: #ffffff">
  <br>
  <div class="container animated fadeIn">

    <div class="movilVerDesk">
      <a style="background: #36434a; color:white" class="btn " href="<?=site_url('dashboardnuevo')?>"><div class="row"><i class="material-icons">home</i>&nbsp;Ir al Inicio</div></a>
      <a style="background: #36434a; color:white" class="btn " href="<?=site_url('afiliadoscontrol')?>"><div class="row"><i class="material-icons">group</i>&nbsp;Ver Afiliados</div></a>
    </div>

    <div style="display:none;" class="movilVerMovil">
      <a style="background: #36434a; color:white" class="btn " href="<?=site_url('dashboardnuevo')?>"><div class="row"><i class="material-icons">home</i></div></a>
      <a style="background: #36434a; color:white" class="btn " href="<?=site_url('afiliadoscontrol')?>"><div class="row"><i class="material-icons">group</i></div></a>
    </div>
    <br><br>

    <div class="text-center">
      <h2 class="h2 nunita">Formulario de Afiliación</h2>

      <br><br>
    </div>


    <form class="form-group" id="form_terceros" method="post">

      <div class="row">

        <div class="col-md-6 col-sm-12 col-xs-12">
          
          <br>

          <p>Nombre</p>
          <input class="form-control requerir" type="text" tabindex="1" name="nombre_reg" placeholder="Ingrese su Nombre" required id="nombre_afiliado"><br>


          <p>Edad</p>
          <input class="form-control requerir" type="text" tabindex="3" name="edad_reg" placeholder="Ingrese su edad" id="edad_afiliado" required><br>

          <p>Peso</p>
          <input class="form-control requerir" type="text" tabindex="5" name="peso_reg" id="peso_afiliado" placeholder="Ingrese su peso" required><br>


          <p>Actividad Física</p>
          <select class="form-control requerir" tabindex="7" name="act_fisica_reg" id="act_fisica_afiliado" required>
            <option value="">Seleccione su Actividad Física</option>

            <?php foreach ($actitud_fisica as $result){

              echo "<option value=".$result->act_fisica.">".$result->descripcion."</option>";

            }?>
          </select>
          <br>

        </div>



        <div class="col-md-6 col-sm-12 col-xs-12">
          
          <br>

          <p>Apellido</p>
          <input class="form-control requerir" type="text" tabindex="2" name="apellido_reg" placeholder="Ingrese su Apellido" id="apellido_afiliado" required><br>

          <p>Sexo</p>
          <select class="form-control requerir" name="sexo_reg" tabindex="4" id="sexo_afiliado" required>
            <option value="">Seleccione su Sexo</option>
            <option value="Masculino">Masculino</option>
            <option value="Femenino">Femenino</option>
          </select>
          <br>


          <p>Estatura</p>
          <input class="form-control requerir" type="text" tabindex="6" name="estatura_reg" id="estatura_afiliado" placeholder="Ingrese su estatura" required><br>

        <p>Condición especial</p>
        <select class="form-control requerir" tabindex="8" name="condicion_esp_reg" id="condicion_esp_afiliado" required>
          <option value="">Seleccione si tiene alguna condición especial</option>

          <?php foreach ($condicion_especial as $result){

            echo "<option value=".$result->condicion_esp.">".$result->descripcion."</option>";

          }?>
        </select>
          
        </div>
        
        <div class="col-md-12 col-sm-12 col-xs-12">
            
        
            
        </div>

      </div>


      <br>

      <!-- direccion_contacto!-->
      <div class='col-md-12 col-sm-12 col-lg-12 col-xs-12'>

      <div class="btnDirUs">
        <a style="background: #36434a; color:white;" id="btnusarDirecUsusario" class="btn"><div class="row"><i class="material-icons">location_on</i>&nbsp;Usar mi Dirección</div></a>
      </div>

      <div class="btnNoDirUs" style="display: none;">
        <a style="background: #36434a; color:white;" id="btnNoUsarDirecUs" class="btn" href="#"><div class="row"><i class="material-icons">location_off</i>&nbsp;No usar mi Dirección</div></a>
      </div>
      <br><br>
      
            <h3  class="h3 text-center" id='datos'>Dirección y Contacto </h3>
           <div class="row">

             <div class="col-md-6 col-sm-12 col-xs-12 labeL_formulario">
               <br>

               <p>País</p>
                 <select class="form-control requerir" tabindex="10" name="pais_reg"  id="pais_afiliado" required>
                   <option value="">Seleccione</option>
                   <?php foreach ($pais as $result){

                     echo "<option value=".$result->id_pais.">".$result->pais."</option>";

                   }?>
                 </select>
                 <br>
               <p>Ciudad</p>
               <select class="form-control requerir" tabindex="12" name="ciudad_reg" id="ciudad_reg" required>
                 <option value="">Seleccione</option>

               </select>
               <br>
               <p>Código Postal</p>
               <input  class="form-control requerir" tabindex="14" type="text"  id="codigopostal_afiliado" name="codigopostal_reg" name="email" value="" maxlength="8" onkeypress="return soloNumeros(event)" required><br>

               <p>Ingrese su Dirección</p>
                <textarea class="form-control requerir" tabindex="16" type="text" name="direccion_reg" id="direccion_afiliado" placeholder="Ingrese su dirección" required></textarea>
                <br>

             </div>


             <div class="col-md-6 col-sm-12 col-xs-12 labeL_formulario">
               <br>

               <p>Estado</p>
                 <select class="form-control requerir" tabindex="11" name="estado_reg" id="estado_reg" required>
                    <option value="">Seleccione</option>
                 </select>
                 <br>
               <p>Sector</p>
               <select class="form-control requerir" tabindex="13" name="sector_reg" id="sector_reg" required>
               <option value="">Seleccione</option>
               </select>
               <br>
               <p>Teléfono</p>
                <input class="form-control requerir" tabindex="15" type="text" id="telefono_afiliado" name="telefono_reg" maxlength='15' onkeypress="return soloNumeros(event)" value="" required><br>

                <p>Correo del Afiliado</p>
                <input class="form-control requerir" type="email" tabindex="16" name="correo_reg" placeholder="Ingrese su Correo" id="correo_afiliado" required><br>

             </div>

             <br>

              <div style="margin-top: 3%" class="col-md-12 col-sm-12 col-xs-12">    
                
                
                <div id="spinner">
                  <input style="background: #36434a; color:white" type="button" id="afiliar_tercero" class="btn" name="enviar" value="Afiliar">
                </div>
          
              </div>

           </div>
           <br>

      </div>
      <!--  fin direccion_contacto!-->

    </form>

  </div>

</div>
    <script src="<?php echo base_url(); ?>js/afiliar_terceros.js" type="text/javascript"></script>
</body>
</html>
