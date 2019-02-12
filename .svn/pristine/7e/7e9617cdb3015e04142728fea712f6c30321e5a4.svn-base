<?php $estatus; $plan_suscrip; $admin;?>
  <br>
    <div class="container-fluid">
      <?php if ($estatus==false){ ?>
        <div class="text-center">
          <h2>No esta Suscrito a ningún plan</h2>
        </div>
        <a class="btn btn-primary" href="<?=site_url('suscribir')?>">Suscribirse</a>
      <?php
      }
      else
      {
          if($estatus == '3'){ ?>
            <div class="text-center">
              <h2>Esperando Aprobación</h2>
            </div>
          <?php
          }
          elseif ($estatus == '2')
          { ?>
            <div class="text-center">
              <h2>Pago no Aprobado, desea volver a validar su transferencia?</h2>
            </div>

            <a class="btn btn-success" href="<?=site_url('dashboard/ver_validar_transfeerencia')?>">- Validar Transferencia</a>
          <?php
        } elseif ($estatus == '4')
        { ?>
          <div class="text-center">
            <h2>Suscripción en Espera, desea continuar disfrutando del servicio?</h2>
          </div>

        <?php
      }
         else { ?>
           <div class="text-center">
             <h2>Usted esta suscrito al Plan: <?php echo $plan_suscrip; ?></h2>
           </div>

            <?php if ($plan_suscrip > '1') { ?>
              <a class="btn btn-success" href="<?=site_url('afiliar')?>">+ Afiliar</a><br><br>
              <a class="btn btn-primary" href="<?=site_url('afiliadoscontrol')?>">- Ver Afiliados</a><br><br>
           <?php } ?>

              <a class="btn btn-primary" href="<?=site_url('dashboard/detalles_usuario')?>">- Ver información detallada del Usuario</a><br>
          <?php
          }

      } ?>

      <br>

      <?php if ($_SESSION['correo'] == 'andrex_sila_777@hotmail.es'): ?>
        <a href="#">Administrar Usuarios</a><br>
      <?php endif; ?>

    </div>


    <script src="<?php echo base_url(); ?>js/jquery-3.3.1.min.js" type="text/javascript"></script>
    <script src="<?php echo base_url(); ?>js/bootstrap.min.js" type="text/javascript"></script>
  </body>
</html>
