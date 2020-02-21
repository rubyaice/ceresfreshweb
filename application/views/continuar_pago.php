<?php $actitud_fisica; $condicion_especial;$pais;$correo;
?>

  <div id="alerta">

  </div>
<br>
    <div style="margin-bottom:15%;" class="container text-center animated fadeIn">

      <br>
    <form id="form-email" action="" class="form-group" method="post">
      <div class="row" id='register'>

  <!-- Inicio RegisterRegister!-->
        <div class="col-md-6 col-sm-12 col-xs-12 col-lg-6">
	           <img  class="img-fluid " src="<?php echo base_url(); ?>img/bowl.png" class="d-block w-100" alt="...">
        </div>

            <!-- Inicio RegistrerCorreoContraseña!-->

            <div class="col-md-4 col-sm-12 col-xs-12" id='register2'>
                  <br>  <br>  <br>
                <div class="row">
                    <div class="col-12">           <br>
                    </div>
                  </div>
                  <br>
                      <div class="row" style="">
                  <div class="col-12">
                    <span class='nunita'> CeresFresh</span> <br><br>
                    <input class="form-control requerir" type="email" name="correo" id='correo' value='<?php echo $correo;?>'  required><br>
                  </div>
                </div>
                  <hr>
                  <div class='row'>
                  <div class="col-md-12 col-sm-12 col-xs-12">
                      <!--<p style="text-align:left">Correo </p>!-->
                      <input class="form-control requerir" type="password" name="clave" id='clave' placeholder="Elije una contraseña" required><br>
                    </div>
                  </div>

                <div class="row">
                  <div class="col-md-12 col-sm-12 col-xs-12">
                    <input style="background:#7dbe41" class="continuar_reg"  id='continuar_reg'  name="registrar" value="&nbsp;Continuar&nbsp;"  type="button">
                  </div>
                  <br><br>
                </div>
            </div>
              <!-- FinRegistrerCorreoContraseña!-->

        <div class='col-md-2 col-sm-12 col-lg-12'>        </div>

      </div>
    </form>
<!-- data_personal!-->
      <div class='row'  id='data_personal' >
          <div class='col-md-8 col-sm-12 col-lg-8 col-xs-12' id='data_personal1'>

            <form class="form-group" id='form_datospersonal' action="" method="post">

                  <h2 id='texto_comenzar'>Continuar con el Registro y Afiliación </h2>
                  <br>
                <h3  class="h3 text-center" id='datos'> Datos Personales</h3>
                   <div class="row">

                      <div class="col-md-6 col-sm-12 col-xs-12 labeL_formulario">


                        <p >Nombre
                        <input  class="form-control requerir" type="text" name="nombre_reg" id="nombre_reg" value="<?php echo $nombre; ?>" required ></p>
                      </div>
                      <div class="col-md-6 col-sm-12 col-xs-12 labeL_formulario">

                      <p >Apellido(s)
                      <input  class="form-control requerir" type="text" id="apellido_reg" onkeypress="return soloLetras(event)" name="apellido_reg" value="<?php echo $apellido; ?>" required>

                      </p>

                        </div>
                  </div>
                  <div class="row">
                  <div class="col-md-6 col-sm-12 col-xs-12 labeL_formulario">
                    <p class=''>Sexo
                    <select class="form-control requerir" id="sexo_reg" name="sexo_reg"  value='<?php echo $sexo; ?>'required>
                      <option value="Masculino">Masculino</option>
                      <option value="Femenino">Femenino</option>
                    </select>
                    </p>

                   </div>
                   <div class="col-md-6 col-sm-12 col-xs-12 labeL_formulario">
                     <p >Edad
                     <input class="form-control requerir" value='<?php echo $edad; ?>' type="text"  id="edad_reg" name="edad_reg" min="1" max="120" maxlength="3" onkeypress="return soloNumeros(event)" placeholder="Ingrese su edad" required></p>

                   </div>
                   </div>


                  <div class='row'>
                    <div class="col-md-6 col-sm-12 col-xs-12 labeL_formulario">
                      <p >Estatura(m)
                      <input class="form-control requerir" type="text" id="estatura_reg" name="estatura_reg"placeholder="Ingrese su estatura" required></p>


                      </div>
                    <div class="col-md-6 col-sm-12 col-xs-12 labeL_formulario">
                      <p>Peso(kg)
                      <input class="form-control requerir" type="text"  id="peso_reg" name="peso_reg" min=1 max="300" maxlength="3" onkeypress="return soloNumeros(event)" placeholder="Ingrese su peso" required></p>


                    </div>
                  </div>
                   <div class='row'>
                   <div class="col-md-6 col-sm-12 col-xs-12 labeL_formulario">
                     <p >Actitud Física
                     <select class="form-control requerir" id="act_fisica_reg" name="act_fisica_reg" required>
                       <option value="">Seleccione</option>
                       <?php foreach ($actitud_fisica as $result){

                         echo "<option value=".$result->act_fisica.">".$result->descripcion."</option>";

                       }?>
                     </select></p>
                   </div>
                   <div class="col-md-6 col-sm-12 col-xs-12 labeL_formulario">
                      <p >Condición especial
                    <select class="form-control requerir"  id="condicion_esp_reg" name="condicion_esp_reg" required>
                      <option value="">Seleccione</option>

                      <?php foreach ($condicion_especial as $result){

                        echo "<option value=".$result->condicion_esp.">".$result->descripcion."</option>";

                      }?>
                    </select></p>


                 </div>


               </div>
               <br>
                <div class='row'>
                  <div class='col-12'>
                    <input style="background: #7dbe41"  id='continuar_datospersonal' class="continuar_reg"  name="datospersonal" value="Próximo Paso" type='button'>
                  </div>
               </div>


             </form>


          </div>
          <!--  fin data_personal!-->
          <!-- direccion_contacto!-->
          <div class='col-md-8 col-sm-12 col-lg-8 col-xs-12'  id='data_personal2'>

            <form class="form-group" id='form_direccion' action="" data-toggle="validator" method="post">


                <h3  class="h3 text-center" id='datos'>Dirección y Contacto </h3>
               <div class="row">

                 <div class="col-md-6 col-sm-12 col-xs-12 labeL_formulario">


                   <p>País
                     <select class="form-control requerir" value="<?php echo $pais;?>" name="pais_reg"  id="pais_reg" required>
                       <option value="">Seleccione</option>


                        <option value="<?php echo $pais;?>"></option>;

                     </select>
                   </div>
                   <div class="col-md-6 col-sm-12 col-xs-12 labeL_formulario">


                     <p >Estado
                       <select class="form-control requerir"  value="<?php echo $state;?>"name="estado_reg" id="estado_reg" required>
                          <option value="">Seleccione</option>

                       </select>

                    </p>

                 </div>

               </div>
                 <div class='row'>
                    <div class="col-md-6 col-sm-12 col-xs-12 labeL_formulario">

                      <p>Ciudad
                      <select class="form-control requerir" value="<?php echo $city;?>" name="ciudad_reg" id="ciudad_reg" required>
                        <option value="">Seleccione</option>

                      </select></p>

                     </div>
                     <div class="col-md-6 col-sm-12 col-xs-12 labeL_formulario">
                         <p >Sector
                         <select class="form-control requerir" value="<?php echo $sector;?>" name="sector_reg" id="sector_reg" required>
                         <option value="">Seleccione</option>
                         </select></p>
                    </div>
                 </div>
                 <div class='row'>
                    <div class="col-md-6 col-sm-12 col-xs-12 labeL_formulario">

                      <p >Código Postal
                      <input  class="form-control requerir"  value="<?php echo $zipcode;?>" type="text"  id="codigopostal_reg" name="codigopostal_reg" name="email" value="" maxlength="8" onkeypress="return soloNumeros(event)" required>

                     </p>

                  </div>
                  <div class="col-md-6 col-sm-12 col-xs-12 labeL_formulario">
                   <p >Teléfono
                    <input  class="form-control requerir"  value="<?php echo $phone;?>" type="text "  id="telefono_reg" name="telefono_reg" maxlength='15' onkeypress="return soloNumeros(event)" value="" required></p>

                 </div>

               </div>
               <div class='row'>
                 <div class='col-12 labeL_formulario' >
                   <p >Dirección</p>
                   <textarea class="form-control requerir" value="<?php echo $address;?>" type="text"  id="direccion_reg" name="direccion_reg" placeholder="Ingrese su dirección" required>  </textarea><br>
                 </div>
                 <br>
               </div>

               <br>
                <div class='row'>
                  <div class='col-12'>
                    <input style="background: #7dbe41" id='continuar_direccion' class="continuar_reg" type="button" name="enviardireccion" value="Próximo Paso">
                  </div>
               </div>


             </form>


          </div>
          <!--  fin direccion_contacto!-->
    <!-- pago!-->

              <div class='col-md-8 col-sm-12 col-lg-8 col-xs-12'  id='formas_pago'>

                <div class="card1" >
                    <div class="card-header1" id="headingThere">

                      <div class="row">


                          <div class="col-md-10 col-sm-10 col-xs-10 col-lg-10 ">
                            <span class="nunita-title" >
                            Indique la forma de pago de su preferencia.
                            </span>
                          </div>

                          <div class="col-1">

                          </div>
                      </div>
                    </div>
                      <div class="accordion" id="accordionExample1" style="margin-top: 1%;">
                    <div id="collapseThere" class="collapse show" aria-labelledby="headingThere" data-parent="#accordionExample">

                      <div class="card1" >
                          <div class="card-header1" id="headingThereOne">
                            <!--Instapgo!-->
                            <div class="row">


                                <div class="col-md-11 col-sm-11 col-xs-11 col-lg-11">
                                  <div class="fela-1pzq4bv">
                                  <span   style="cursor:pointer;    margin-top: 4.5%;  ;margin-left: 5%;" data-toggle="collapse" data-target="#collapseThereOne" aria-expanded="false" aria-controls="collapseThereOne">
                                     Añadir tarjeta de crédito
                                    </span>
                                    </div>
                                    <br>
                                    <br>
                                    <div id="collapseThereOne" class="collapse" aria-labelledby="headingThereOne" data-parent="#accordionExample1">
                                      <form class="form-group" id="form_instapago" action="" method="post">


                                            <div class="row">
                                              <div class="col-12 lato" style="font-size: 16px;text-align: left;padding: 5px 10px;border-bottom: 1px solid #7dbe41;">		Datos Personales		</div>
                                            </div>
                                            <div class="row" style="margin-top:2%;text-align:left" >
                                              <div class="col-md-6 col-sm-12 col-xs-12 col-lg-6">
                                                  <p class="lato">Nombre del Titular:</p>
                                                  <input class="form-control requerir" value='<?php echo $nombre?>' onkeypress="return soloLetras(event)" type="text" id="PaymentCDCPersonName" tabindex="210" name="Name" class="WithBorder"><br>
                                                  <p class="lato">Número de Tarjeta:</p>
                                                  <input class="form-control requerir" autocomplete="off" onkeypress="return soloNumeros(event)" type="text" id="PaymentCDCNumber" maxlength="16" tabindex="212" name="CardNumber" class="WithBorder">
                                              </div>

                                              <div class="col-md-6 col-sm-12 col-xs-12">

                                                  <p class="lato">Apellidos del Titular:</p>
                                                  <input class="form-control requerir"  value="<?php echo $apellido;?>" onkeypress="return soloLetras(event)" type="text" id="PaymentCDCPersonLastname" tabindex="211" name="Lastname" class="WithBorder">	<br>
                                                  <p class="lato">Cédula:</p>
                                                  <select class="WithBorder form-control" class="WithBorder" id="PaymentCDCPersonTipoCedula"tabindex="213" style="width: 60px; float: left;" name="TipoCedula" style="width: 24%;margin-right: 3%;float: left;border-radius: .25rem;" >
                                                            <option value="V" selected="">V</option>
                                                            <option value="E">E</option>
                                                  </select>
                                                  <input class="form-control requerir" t maxlength="8" onkeypress="return soloNumeros(event)" id="PaymentCDCPersonCedula" tabindex="214" style="width: calc(100% - 50px - 10px); margin-left: 10px;" class="WithBorder" type="text" name="Cedula">

                                              </div>

                                            </div>
                                            <br>
                                            <div class="row">
                                              <div class="col-md-6 col-sm-12 col-xs-12" style="text-align:left">

                                                  <p class="lato">Expiración:</p>
                                                  <div class="row">
                                                    <div class="col-6">
                                                  <input class="form-control requerir" autocomplete="off" onkeypress="return soloNumeros(event)" type="text" id="PaymentCDCExpirationMonth" maxlength="2" tabindex="215" name="Month" class="Half WithBorder" placeholder="Mes (MM)" style=" margin-left: -15%;height: 100%; width: 112%;">
                                                  </div>
                                                  <div class="col-6">
                                                    <input class="form-control requerir"  autocomplete="off" onkeypress="return soloNumeros(event)" type="text" id="PaymentCDCExpirationYear" maxlength="4" tabindex="216" name="Year" class="Half WithBorder" placeholder="Año (YYYY)" style=" width: 113%;margin-left: -14%;">
                                                    </div>
                                                  </div>
                                                <br>

                                              </div>

                                              <div class="col-md-6 col-sm-12 col-xs-12" style="text-align:left">

                                                  <p class="lato">Código de Seguridad:</p>
                                                  <div class="row">
                                                    <div class="col-6">
                                                  <input class="form-control requerir" type="password" autocomplete="off" onkeypress="return soloNumeros(event)" id="PaymentCDCCvc" maxlength="4" tabindex="217" name="Cvc" class="Half WithBorder" placeholder="CVC" value="" style=" margin-left: -10%;height: 100%; width: 107%;">
                                                  </div>
                                                  <div class="col-6">
                                                    <input class="form-control requerir" type="text" value="<?php echo $monto;?>" readonly  autocomplete="off" onkeypress="return soloNumeros(event)"  maxlength="3" tabindex="217" name="Monto a pagar" class="Half WithBorder" id="MontoP" placeholder="Monto a pagar" style=" width: 113%;margin-left: -14%;">
                                                    </div>
                                                  </div>
                                                <br>

                                              </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-12"  style="text-align:center">
                                               <span>Esta transacción será procesada de forma segura gracias a la plataforma de</span>
                                               </br>
                                               </br>
                                               <div>
                                                  <img  class=""width="200px" src="<?php echo base_url(); ?>img/banescoInstapago.png" class="d-block w-100" alt="...">
                                               </div>
                                               </div>

                                            </div>
                                            <div class="row" style="margin-top:3%">
                                              <div class="col-md-6 col-sm-6 col-xs-6" style="">

                                              </div>
                                              <div class="col-md-4 col-sm-4 col-xs-4" style="">
                                                <button id="pagar_luego" style="background: #7dbe41; color:white" class="btn lato" type="button" name="button">&nbsp;Paga luego&nbsp;</button>
                                              </div>
                                              <div class="col-md-2 col-sm-2 col-xs-2" style="">
                                                <button id="btninstapago" style="background: #7dbe41; color:white" class="btn lato" type="button" name="button">&nbsp;Siguiente&nbsp;</button>
                                              </div>
                                            </div>
                                            </form>
                                        </div>
                                </div>

                                <div class="col-1">

                                </div>
                            </div>

                            <!--Transferencia Bancaria!-->
                            <div class="row">


                                <div class="col-11 ">
                                    <div class="fela-1pzq4bv">
                                  <span class=""  style="cursor:pointer;margin-top: 4.5%;  ;margin-left: 5%;" data-toggle="collapse" data-target="#collapseThereTwo" aria-expanded="false" aria-controls="collapseThereTwo">
                                    Transferencia bancaria
                                    </span>
                                  </div>
                                    <br>
                                    <br>
                                    <div id="collapseThereTwo" class="collapse" aria-labelledby="headingThereTwo" data-parent="#accordionExample1">
                                      <form class="form-group" id="form_transferencia" action="" method="post">


                                            <div class="row">
                                              <div class="col-12 lato" style="font-size: 16px;text-align: left;padding: 5px 10px;border-bottom: 1px solid #7dbe41;">		Datos Personales		</div>
                                            </div>
                                            <div class="row" style="margin-top:2%;text-align:left" >
                                              <div class="col-md-6 col-sm-12 col-xs-12 col-lg-6">
                                                  <p class="lato">Nombre del Titular:</p>
                                                  <input class="form-control requerir" onkeypress="return soloLetras(event)"  value="<?php echo $nombre;?>"  type="text" id="PaymentCDCPersonNameT" placeholder="Nombre"  name="Name" class="WithBorder">

                                              </div>
                                                <div class="col-md-6 col-sm-12 col-xs-12 col-lg-6">
                                                  <p class="lato">Apellido(s):</p>
                                                  <input class="form-control requerir" autocomplete="off"  value="<?php echo $apellido;?>"  onkeypress="return soloLetras(event)" type="text"   placeholder="Apellido(s)" id="PaymentCDCPersonLastnameT" maxlength="16"  name="CardNumber" class="WithBorder">
                                              </div>
                                          </div>
                                            <div class="row" style="margin-top:2%;text-align:left" >
                                              <div class="col-md-6 col-sm-12 col-xs-12">
                                                <p class="lato">Cédula:</p>
                                                <select class="WithBorder form-control" class="WithBorder" id="PaymentCDCPersonTipoCedulaT" style="width: 60px; float: left;" name="TipoCedulaT" style="width: 24%;margin-right: 3%;float: left;border-radius: .25rem;" >
                                                          <option value="V" selected="">V</option>
                                                          <option value="E">E</option>
                                                </select>
                                                  <input class="form-control requerir"  maxlength="8" onkeypress="return soloNumeros(event)" id="PaymentCDCPersonCedulaT"  placeholder="Cédula" style="width: calc(100% - 50px - 10px); margin-left: 10px;" class="WithBorder" type="text" name="Cedula">
                                              </div>
                                              <div class="col-md-6 col-sm-12 col-xs-12">


                                                  <p class="lato">Teléfono:</p>
                                                  <input class="form-control requerir"  value="<?php echo $phone;?>"  onkeypress="return soloNumeros(event)" type="text" id="PaymentCDCPersonPhoneT"  placeholder="Teléfono" name="phone" class="WithBorder">
                                              </div>

                                            </div>

                                            <div class="row" style="margin-top:2%;text-align:left" >
                                              <div class="col-md-6 col-sm-12 col-xs-12 col-lg-6">
                                              <p class="lato">Banco Emisor:</p>
                                              <select class="form-control requerir" id="PaymentBancoEmisorT" name="PaymentBancoEmisorT" required="">
                                                                                <option value="BANCO MERCANTIL C.A.">BANCO MERCANTIL C.A.</option>
                                                                                <option value="100%BANCO">100%BANCO</option>
                                                                                <option value="ABN AMRO BANK">ABN AMRO BANK</option>
                                                                                <option value="BANCAMIGA BANCO MICROFINANCIERO, C.A.">BANCAMIGA BANCO MICROFINANCIERO, C.A.</option>
                                                                                <option value="BANCO ACTIVO BANCO COMERCIAL, C.A.">BANCO ACTIVO BANCO COMERCIAL, C.A.</option>
                                                                                <option value="BANCO AGRICOLA">BANCO AGRICOLA</option>
                                                                                <option value="BANCO BICENTENARIO">BANCO BICENTENARIO</option>
                                                                                <option value="BANCO CARONI, C.A. BANCO UNIVERSAL">BANCO CARONI, C.A. BANCO UNIVERSAL</option>
                                                                                <option value="BANCO DE DESARROLLO DEL MICROEMPRESARIO">BANCO DE DESARROLLO DEL MICROEMPRESARIO</option>
                                                                                <option value="BANCO DE VENEZUELA S.A.I.C.A.">BANCO DE VENEZUELA S.A.I.C.A.</option>
                                                                                <option value="BANCO DEL CARIBE C.A.">BANCO DEL CARIBE C.A.</option>
                                                                                <option value="BANCO DEL PUEBLO SOBERANO C.A.">BANCO DEL PUEBLO SOBERANO C.A.</option>
                                                                                <option value="BANCO DEL TESORO">BANCO DEL TESORO</option>
                                                                                <option value="BANCO ESPIRITO SANTO, S.A.">BANCO ESPIRITO SANTO, S.A.</option>
                                                                                <option value="BANCO EXTERIOR C.A.">BANCO EXTERIOR C.A.</option>
                                                                                <option value="BANCO INDUSTRIAL DE VENEZUELA.">BANCO INDUSTRIAL DE VENEZUELA.</option>
                                                                                <option value="BANCO INTERNACIONAL DE DESARROLLO, C.A.">BANCO INTERNACIONAL DE DESARROLLO, C.A.</option>
                                                                                <option value="BANCO NACIONAL DE CRÉDITO">BANCO NACIONAL DE CREDITO</option>
                                                                                <option value="BANCO OCCIDENTAL DE DESCUENTO">BANCO OCCIDENTAL DE DESCUENTO</option>
                                                                                <option value="BANCO PLAZA">BANCO PLAZA</option>
                                                                                <option value="BANCO PROVINCIAL BBVA">BANCO PROVINCIAL BBVA</option>
                                                                                <option value="BANCO VENEZOLANO DE CRÉDITO S.A.">BANCO VENEZOLANO DE CREDITO S.A.</option>
                                                                                <option value="BANCRECER S.A. BANCO DE DESARROLLO">BANCRECER S.A. BANCO DE DESARROLLO</option>
                                                                                <option value="BANESCO BANCO UNIVERSAL">BANESCO BANCO UNIVERSAL</option>
                                                                                <option value="BANFANB">BANFANB</option>
                                                                                <option value="BANGENTE">BANGENTE</option>
                                                                                <option value="BANPLUS BANCO COMERCIAL C.A">BANPLUS BANCO COMERCIAL C.A</option>
                                                                                <option value="CITIBANK">CITIBANK.</option>
                                                                                <option value="CORP BANCA">CORP BANCA.</option>
                                                                                <option value="DELSUR BANCO UNIVERSAL">DELSUR BANCO UNIVERSAL</option>
                                                                                <option value="FONDO COMÚN">FONDO COMÚN</option>
                                                                                <option value="INSTITUTO MUNICIPAL DE CRÉDITO POPULAR">INSTITUTO MUNICIPAL DE CRÉDITO POPULAR</option>
                                                                                <option value="MIBANCO BANCO DE DESARROLLO, C.A.">MIBANCO BANCO DE DESARROLLO, C.A.</option>
                                                                                <option value="SOFITASA">SOFITASA</option>

                                              </select>

                                                </div>

                                                  <div class="col-md-6 col-sm-12 col-xs-12 col-lg-6">
                                                  <p class="lato">Banco Receptor:</p>

                                                  <select class="form-control requerir" id="PaymentBancoReceptorT" name="PaymentBancoReceptorT" required="">
                                                    <option value="BANCO MERCANTIL C.A.">BANCO MERCANTIL C.A.</option>
                                                                                
                                              </select>
                                              </div>


                                            </div>

                                            <div class="row" style="margin-top:2%;text-align:left" >
                                              <div class="col-md-6 col-sm-12 col-xs-12 col-lg-6">
                                                  <p class="lato">Referencia de pago:</p>
                                                  <input class="form-control requerir" onkeypress="return soloNumeros(event)" type="text" id="PaymentRefT" placeholder="Referencia" name="PaymentRefT" class="WithBorder">

                                              </div>
                                                <div class="col-md-6 col-sm-12 col-xs-12 col-lg-6">
                                                  <p class="lato">Monto a pagar:</p>
                                                  <input class="form-control requerir" autocomplete="off"  value="<?php echo $monto;?>"  readonly type="text" id="PaymentMontoT" maxlength="16"  name="PaymentMontoT" class="WithBorder">
                                              </div>
                                          </div>

                                            <div class="row" style="margin-top:3%">
                                              <div class="col-md-10 col-sm-10 col-xs-10" style="">

                                              </div>
                                              <div class="col-md-2 col-sm-2 col-xs-2" style="">
                                                <button id="btntransferencia" style="background: #7dbe41; color:white" class="btn lato" type="button" name="button">&nbsp;Siguiente&nbsp;</button>
                                              </div>
                                            </div>
                                            </form>


                                    </div>


                                </div>
                                <div class="col-1">

                                </div>
                              </div>
                                <div class="row">


                                <div class="col-11 ">
                                    <div class="fela-1pzq4bv">
                                  <span class=""  style="cursor:pointer;margin-top: 4.5%;  ;margin-left: 5%;" data-toggle="collapse" data-target="#collapseThereThere" aria-expanded="false" aria-controls="collapseThereThere">
                                    Depósito
                                    </span>
                                  </div>
                                    <br>
                                    <br>
                                    <div id="collapseThereThere" class="collapse" aria-labelledby="headingThereThere" data-parent="#accordionExample1">
                                      <form class="form-group" id="form_deposito" action="" method="post">


                                            <div class="row">
                                              <div class="col-12 lato" style="font-size: 16px;text-align: left;padding: 5px 10px;border-bottom: 1px solid #7dbe41;">		Datos Personales		</div>
                                            </div>
                                            <div class="row" style="margin-top:2%;text-align:left" >
                                              <div class="col-md-6 col-sm-12 col-xs-12 col-lg-6">
                                                  <p class="lato">Nombre del Titular:</p>
                                                  <input class="form-control requerir"  value="<?php echo $nombre;?>"  onkeypress="return soloLetras(event)" type="text" id="PaymentCDCPersonNameD" placeholder="Nombre"  name="NameD" class="WithBorder">

                                              </div>
                                                <div class="col-md-6 col-sm-12 col-xs-12 col-lg-6">
                                                  <p class="lato">Apellido(s):</p>
                                                  <input class="form-control requerir"  value="<?php echo $apellido;?>"  autocomplete="off" onkeypress="return soloLetras(event)" type="text"   placeholder="Apellido(s)" id="PaymentCDCPersonLastnameD" maxlength="16"  name="CardNumber" class="WithBorder">
                                              </div>
                                          </div>
                                            <div class="row" style="margin-top:2%;text-align:left" >
                                              <div class="col-md-6 col-sm-12 col-xs-12">
                                                <p class="lato">Cédula:</p>
                                                <select class="WithBorder form-control" class="WithBorder" id="PaymentCDCPersonTipoCedulaD" style="width: 60px; float: left;" name="TipoCedulaD" style="width: 24%;margin-right: 3%;float: left;border-radius: .25rem;" >
                                                          <option value="V" selected="">V</option>
                                                          <option value="E">E</option>
                                                </select>
                                                  <input class="form-control requerir"  maxlength="8" onkeypress="return soloNumeros(event)" id="PaymentCDCPersonCedulaD"  placeholder="Cédula" style="width: calc(100% - 50px - 10px); margin-left: 10px;" class="WithBorder" type="text" name="Cedula">
                                              </div>
                                              <div class="col-md-6 col-sm-12 col-xs-12">


                                                  <p class="lato">Teléfono:</p>
                                                  <input class="form-control requerir"  value="<?php echo $phone;?>"   onkeypress="return soloNumeros(event)" type="text" id="PaymentCDCPersonPhoneD"  placeholder="Teléfono" name="phoneD" class="WithBorder">
                                              </div>

                                            </div>

                                            <div class="row" style="margin-top:2%;text-align:left" >
                                              <div class="col-md-6 col-sm-12 col-xs-12 col-lg-6">
                                              <p class="lato">Banco Emisor:</p>
                                              <select class="form-control requerir" id="PaymentBancoEmisorD" name="PaymentBancoEmisorD" required="">
                                                <option value="BANCO MERCANTIL C.A.">BANCO MERCANTIL C.A.</option>
                                                                              <option value="100%BANCO">100%BANCO</option>
                                                                              <option value="ABN AMRO BANK">ABN AMRO BANK</option>
                                                                              <option value="BANCAMIGA BANCO MICROFINANCIERO, C.A.">BANCAMIGA BANCO MICROFINANCIERO, C.A.</option>
                                                                              <option value="BANCO ACTIVO BANCO COMERCIAL, C.A.">BANCO ACTIVO BANCO COMERCIAL, C.A.</option>
                                                                              <option value="BANCO AGRICOLA">BANCO AGRICOLA</option>
                                                                              <option value="BANCO BICENTENARIO">BANCO BICENTENARIO</option>
                                                                              <option value="BANCO CARONI, C.A. BANCO UNIVERSAL">BANCO CARONI, C.A. BANCO UNIVERSAL</option>
                                                                              <option value="BANCO DE DESARROLLO DEL MICROEMPRESARIO">BANCO DE DESARROLLO DEL MICROEMPRESARIO</option>
                                                                              <option value="BANCO DE VENEZUELA S.A.I.C.A.">BANCO DE VENEZUELA S.A.I.C.A.</option>
                                                                              <option value="BANCO DEL CARIBE C.A.">BANCO DEL CARIBE C.A.</option>
                                                                              <option value="BANCO DEL PUEBLO SOBERANO C.A.">BANCO DEL PUEBLO SOBERANO C.A.</option>
                                                                              <option value="BANCO DEL TESORO">BANCO DEL TESORO</option>
                                                                              <option value="BANCO ESPIRITO SANTO, S.A.">BANCO ESPIRITO SANTO, S.A.</option>
                                                                              <option value="BANCO EXTERIOR C.A.">BANCO EXTERIOR C.A.</option>
                                                                              <option value="BANCO INDUSTRIAL DE VENEZUELA.">BANCO INDUSTRIAL DE VENEZUELA.</option>
                                                                              <option value="BANCO INTERNACIONAL DE DESARROLLO, C.A.">BANCO INTERNACIONAL DE DESARROLLO, C.A.</option>
                                                                              <option value="BANCO NACIONAL DE CRÉDITO">BANCO NACIONAL DE CREDITO</option>
                                                                              <option value="BANCO OCCIDENTAL DE DESCUENTO">BANCO OCCIDENTAL DE DESCUENTO</option>
                                                                              <option value="BANCO PLAZA">BANCO PLAZA</option>
                                                                              <option value="BANCO PROVINCIAL BBVA">BANCO PROVINCIAL BBVA</option>
                                                                              <option value="BANCO VENEZOLANO DE CRÉDITO S.A.">BANCO VENEZOLANO DE CREDITO S.A.</option>
                                                                              <option value="BANCRECER S.A. BANCO DE DESARROLLO">BANCRECER S.A. BANCO DE DESARROLLO</option>
                                                                              <option value="BANESCO BANCO UNIVERSAL">BANESCO BANCO UNIVERSAL</option>
                                                                              <option value="BANFANB">BANFANB</option>
                                                                              <option value="BANGENTE">BANGENTE</option>
                                                                              <option value="BANPLUS BANCO COMERCIAL C.A">BANPLUS BANCO COMERCIAL C.A</option>
                                                                              <option value="CITIBANK">CITIBANK.</option>
                                                                              <option value="CORP BANCA">CORP BANCA.</option>
                                                                              <option value="DELSUR BANCO UNIVERSAL">DELSUR BANCO UNIVERSAL</option>
                                                                              <option value="FONDO COMÚN">FONDO COMÚN</option>
                                                                              <option value="INSTITUTO MUNICIPAL DE CRÉDITO POPULAR">INSTITUTO MUNICIPAL DE CRÉDITO POPULAR</option>
                                                                              <option value="MIBANCO BANCO DE DESARROLLO, C.A.">MIBANCO BANCO DE DESARROLLO, C.A.</option>
                                                                              <option value="SOFITASA">SOFITASA</option>

                                              </select>

                                                </div>

                                                  <div class="col-md-6 col-sm-12 col-xs-12 col-lg-6">
                                                  <p class="lato">Banco Receptor:</p>

                                                  <select class="form-control requerir" id="PaymentBancoReceptorD" name="PaymentBancoReceptorD" required="">
                                                  <option value="BANCO MERCANTIL C.A.">BANCO MERCANTIL C.A.</option>

                                              </select>
                                              </div>


                                            </div>

                                            <div class="row" style="margin-top:2%;text-align:left" >
                                              <div class="col-md-6 col-sm-12 col-xs-12 col-lg-6">
                                                  <p class="lato">Referencia de pago:</p>
                                                  <input class="form-control requerir" onkeypress="return soloNumeros(event)" type="text" id="PaymentRefD" placeholder="Referencia" name="PaymentRefD" class="WithBorder">

                                              </div>
                                                <div class="col-md-6 col-sm-12 col-xs-12 col-lg-6">
                                                  <p class="lato">Monto a pagar:</p>
                                                  <input class="form-control requerir"  value="<?php echo $monto;?>"  autocomplete="off" readonly type="text" id="PaymentMontoD" maxlength="16"  name="PaymentMontoD" class="WithBorder">
                                              </div>
                                          </div>

                                            <div class="row" style="margin-top:3%">
                                              <div class="col-md-10 col-sm-10 col-xs-10" style="">

                                              </div>
                                              <div class="col-md-2 col-sm-2 col-xs-2" style="">
                                                <button id="btndeposito" style="background: #7dbe41; color:white" class="btn lato" type="button" name="button">&nbsp;Siguiente&nbsp;</button>
                                              </div>
                                            </div>
                                            </form>


                                    </div>


                                </div>
                                <div class="col-1">

                                </div>

                            </div>

                          </div>
                        </div>
                      </div>
                    </div>
              </div>

              <!--  fin pago!-->
          <div class='col-md-4 col-sm-12 col-lg-4 col-xs-12 '>

          </div>
          </div>
          <div class='col-md-8 col-sm-12 col-lg-8 col-xs-12'  id='resumen_compra'>

             	<!--       Resumen de Compra.. !-->
							<div class="card1" >
									<div class="card-header1" id="headingThere">

										<div class="row">


												<div class="col-md-12 col-sm-12 col-xs-12 col-lg-12 ">
													<span class="nunita-title" >
													Resumen de Compra.
													</span>
												</div>


										</div>
                  </div>
                  <div class="row" style="text-align:left;">
                        <div class="col-12 lato" style="font-size: 16px;text-align:left;padding: 5px 10px;color: #7dbe41;border-bottom: 1px solid #7dbe41;">		Comprador 		</div>
                        <div class='col-12 lato'>
                        <br> <span id='datos_comprador' type="text" value="" disabled="disabled"> </span></div><br>
                        <div class="col-12 lato" style="font-size: 16px;text-align:left;padding: 5px 10px;color: #7dbe41;border-bottom: 1px solid #7dbe41;">		Pedido 		</div>
                        <div class='col-12 ' id='tabla_resumen'>

                      </div><br>
                      <div class="col-12">
                            <span><strong>Dirección:</strong></span>
                            <span class="Address" id='Address'></span>
                      </div><br><br>
                        <div  id="select" style="width: 280px; height: 25px;" class=" col-12 WithBorder requerir">
                        <div class="checkbox" tabindex="28">
                            <input type="checkbox" name="Terms2" value="1" id="Terms2"/>
                            <label for="Terms2"></label>
                            <span>Acepto los <a id="termycond" href="#">términos y condiciones</a></span>
                        </div>


                    </div>


											</div>
                      <div class="row" style="margin-top:3%">
                      <div class="col-md-9 col-sm-9 col-xs-9" style="">

                                              </div>
                        <div class="col-md-2 col-sm-2 col-xs-2">
                          <input id="btn_pagarinstapago" style="background: #7dbe41; color:white;display:none" class="btn lato" type="button"   name="enviar" value="Pagar">

                          <input id="btn_pagartransferencia" style="background: #7dbe41; color:white;display:none" class="btn lato" type="button" value="Pagar">

                          <input id="btn_pagardeposito" style="background: #7dbe41; color:white;display:none" class="btn lato" type="button"  value="Pagar">
                      </div>

                      <div id="spinner" class="col-md-1 col-sm-1 col-xs-1"></div>
                    </div>





          </div>

          <div class='col-md-4 col-sm-12 col-lg-4 col-xs-12 '>

</div>
      </div>
      </div>
        <!-- RegisterFin!-->
    </div>
        <!-- Modal Error de Envio -->
<div class="modal fade" id="errorDepago" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Error al procesar el pago</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
         Estimado cliente no se pudo procesar su compra, por favor intente más tarde... Gracias y disculpe las molestias !
      </div>
      <div class="modal-footer">
        <button style="background: #36434a" type="button" class="btn btn-secondary" data-dismiss="modal">Aceptar</button>
      </div>
    </div>
  </div>
</div>
<!-- ///////////////////////////////////////////////////////////// -->
        <script src="<?php echo base_url(); ?>js/wow-alert.js" type="text/javascript"></script>
        <script src="<?php echo base_url(); ?>js/wow-wait.js" type="text/javascript"></script>
      <script src="<?php echo base_url(); ?>js/continuar_pago.js" type="text/javascript"></script>
