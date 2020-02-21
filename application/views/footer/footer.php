
    <footer style="background: #293238; padding-top: 6%; padding-bottom: 6%;" class="row text-center">

      <div class="">

        <div class="row">
          <div style="margin-top: 3%" class="col-md-4 col-sm-12 col-xs-12 footerprimeraparte">

            <div class="row">

              <div class="col-6 text-right">
              <img style="max-width: 40%; height: auto;" src="<?php echo base_url(); ?>img/footer/IsoTipo.png" alt="">
              </div>

              <div class="col-6">
              <img style="max-width: 100%; height: auto; margin-top: 9%" src="<?php echo base_url(); ?>img/footer/Logotipo.png" alt="">
              </div>

            </div>
          </div>

          <div style="margin-top: -1%; margin-left: 5%" class="col-md-4 col-sm-12 col-xs-12 text-left margenmovilfooter">
          
            <p style="font-size: 10pt; color:white; padding-right: 20%" class="lato footersegundaparte">En Ceres estamos comprometidos con proveerte de todos los nutrientes que necesitas de acuerdo a tus necesidades particulares, de una manera fácil y expedita. Te entregaremos los mejores productos de la forma más conveniente para ti y tu familia.</p>

            <br>

            <p style="font-size: 13pt; color:white;" class="nunita footersegundados">
              <b>¡Síguenos!</b>
            </p>

            <div style="margin-top: -10%"></div>

            <div class="footerredes">

            <a href="https://twitter.com/CeresFresh" target="_blank"><img style="max-width: 5%; height: auto; margin-top: 9%" src="<?php echo base_url(); ?>img/footer/TWITTER.png" alt=""></a>
            &nbsp;
            <a href="https://www.instagram.com/ceresfresh/" target="_blank"><img style="max-width: 5%; height: auto; margin-top: 9%" src="<?php echo base_url(); ?>img/footer/Instagram.png" alt=""></a>
            &nbsp;
            <a href="https://www.facebook.com/ceresfresh" target="_blank"><img style="max-width: 5%; height: auto; margin-top: 9%" src="<?php echo base_url(); ?>img/footer/Facebook.png" alt=""></a>
            &nbsp;  
            
            </div>
          

          </div>

          <div class="col-md-3 col-sm-12 col-xs-12 footerregistro">

            <div class="text-left footerregistroalig">

              <?php if(!isset($_SESSION['correo'])): ?>
              <div>
                <a style="color:white; font-size:13pt;" class="link nunita" href="<?=site_url('login/vista_registrar_usuario')?>">Regístrate</a>
              </div>
              <br>
              <div>
                <a style="color:white; font-size:13pt;" class="link nunita" href="<?=site_url('login/login_view')?>">Iniciar Sesión</a>
              </div>
              
              <br><br>
              <?php endif; ?>
              <div>
                <p style="color:white; font-size:13pt;" class="nunita">Contacto:</p>
                <br>
                <div class="contac-movile">
                  <div class="footernumeros row" style="font-size: 10pt; color:white; padding-right: 20%; margin-top:-5%" class="lato"><i class="material-icons">phone</i>&nbsp;<span id="num_contacto"></span></div><br>
                  <div class="footernumeros row" style="font-size: 10pt; color:white; padding-right: 20%; margin-top:-5%" class="lato"><i class="material-icons">mail</i>&nbsp;<span id="correo_contacto"></span></div>
                </div>
              </div>
            
            </div>

          </div>

        </div>

      </div>
    </footer>

    <script src="<?php echo base_url(); ?>js/js.js" type="text/javascript"></script>

  </body>
</html>
