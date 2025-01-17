<?php 
$actitud_fisica; 
$condicion_especial;
$pais;
$correo;

$precio_dolares;
$precio_bs;
$prod_descripcion;
?>

<!-- Modal Casi estamos listos -->
<div class="modal fade bd-example-modal-xl" id="casiEstamosListosModal" tabindex="-1" role="dialog" aria-labelledby="proteinasModalTitle" aria-hidden="true">
  <div class="modal-dialog modal-xl" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="proteinasModalTitle"><h4><b>Ya estás casi listo (a):</b></h4></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">

        <div class="row">
          <div class="col-md-6 col-lg-6 col-sm-12 col-xs-12">
           <p><b>Disfruta al recibir lo necesario para preparar todas tus comidas de acuerdo al plan nutricional que te corresponde. Cada semana, recibe en la comodidad de tu casa u oficina una #NutriBox con el siguiente contenido:</b></p>

            <i style="float:left" class="material-icons">done</i>&nbsp;Un plan nutricional personalizado, especialmente preparado por nuestros nutricionistas.<br><br>

            <i style="float:left" class="material-icons">done</i>&nbsp;Selección de productos frescos y de calidad, escogidos cuidadosamente pensando en tu alimentación y salud.<br><br>

            <i style="float:left" class="material-icons">done</i>&nbsp;Recetas para que aproveches al máximo los productos y disfrutes con las mejores preparaciones.<br><br>

          </div>

          <div class="col-md-6 col-lg-6 col-sm-12 col-xs-12">
            <div class="text-center">
              <p id="comidasPlan"></p>
            </div>

            <div class="row">
              <div class="col-md-6 col-lg-5 col-xs-12 col-sm-12">
                <br><br>
                <div class="text-center">
                  <h4>Información de tu Plan:</h4>
                  <p id="KcalPlan">
                    
                  </p>
                </div>
              </div>

              <div class="col-md-6 col-lg-5 col-xs-12 col-sm-12">
                <div class="text-center">
                  <img class="img-fluid " style="width: 100% !important;max-width: 100% !important;" src="<?php echo base_url(); ?>img/Ceres/box.png" alt="">
                  <p>(Imagen referencial)</p>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="modal-footer">
        <button style="background: #36434a; color:white" type="button" class="btn " data-dismiss="modal">Continuar</button>
      </div>
    </div>
  </div>
</div>

<!-- ////////////////////////////////////////////////////////////////// -->

<!-- Modal Pago por Zelle datos-->
<div class="modal fade" id="cuentasModalZelle" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalCenterTitle">Cuentas Zelle disponibles</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p>Estimado cliente, haz seleccionado el método de Transferencia Zelle; le sugerimos anota cuidadosamente los datos de la cuenta. Una vez realizada la transferencia, por favor envie el soporte al correo "informacion@ceresfresh.com"</p>

        <p>Datos:</p>

        <p><b>Inversiones Ceresfresh</b></p>

        <p><b>ariannarivasc@bigwise.com</b></p>

        <hr>
      </div>
      <div class="modal-footer">
        <button style="background: #36434a; color:white" type="button" class="btn" data-dismiss="modal">Aceptar</button>
      </div>
    </div>
  </div>
</div>

<!-- ////////////////////////////////////////////////////////////// -->

<!-- Modal -->
<div class="modal fade" id="cuentasModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalCenterTitle">Cuentas Bancarias Disponibles</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p>Estimado cliente, has seleccionado el método de pago por transferencia bancaria; por favor toma nota de los datos de la cuenta destino:</p>

        <p><b>Inversiones Ceresfresh 18 C.A., RIF J-41284732-5</b></p>

        <p><b>0134-0367-82-367-1032557 - Banesco Banco Universal C.A.</b></p>

        <hr>
      </div>
      <div class="modal-footer">
        <button style="background: #36434a; color:white" type="button" class="btn" data-dismiss="modal">Aceptar</button>
      </div>
    </div>
  </div>
</div>

<!-- ///////////////////////////////////////////////////////////////////////// -->

<!-- Modal -->
<div class="modal fade" id="terminosModalLong" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle"><b>Terminos y condiciones de Compra.</b></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Possimus nemo cupiditate minus molestiae a voluptatum nostrum, esse rerum labore natus dolore autem corrupti praesentium consequatur unde aperiam odit saepe ipsam.</p>

        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Possimus nemo cupiditate minus molestiae a voluptatum nostrum, esse rerum labore natus dolore autem corrupti praesentium consequatur unde aperiam odit saepe ipsam.</p>
      </div>
      <div class="modal-footer">
        <button style="background: #36434a; color:white" type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
      </div>
    </div>
  </div>
</div>

<!-- ///////////////////////////////////////////////////////////////////////// -->

<!-- Modal aceptar termino y condiciones-->
<div class="modal fade" id="aceptarTerminosModalLong" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle"><b>Aceptar Terminos y Condiciones</b></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p>Para proseguir con la compra por favor primero <b>Lea</b> y <b>Acepte</b> nuestros terminos y condiciones. Gracias.</p>
      </div>
      <div class="modal-footer">
        <button style="background: #36434a; color:white" type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
      </div>
    </div>
  </div>
</div>

<!-- ///////////////////////////////////////////////////////////////////////// -->

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
                    <input class="form-control requerir" type="email" name="correo" id='correo' value="<?php echo $correo; ?>" required><br>
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
          <div class="col-md-12 col-lg-12 col-sm-12 col-xs-12">
            <div class="row">
            <div class='col-md-8 col-sm-12 col-lg-8 col-xs-12' id='data_personal1'>

              <form class="form-group" id='form_datospersonal' action="" method="post">

                    <h2 id='texto_comenzar'>Continuar con el Registro y Afiliación </h2>
                    <br>
                  <h3  class="h3 text-center" id='datos'> Datos Personales</h3>
                    <div class="row">

                        <div class="col-md-6 col-sm-12 col-xs-12 labeL_formulario">


                          <p >Nombre
                          <input  class="form-control requerir" type="text" name="nombre_reg" id="nombre_reg" value="" required ></p>
                        </div>
                        <div class="col-md-6 col-sm-12 col-xs-12 labeL_formulario">

                        <p >Apellido(s)
                        <input  class="form-control requerir" type="text" id="apellido_reg" onkeypress="return soloLetras(event)" name="apellido_reg" value="" required>

                        </p>

                          </div>
                    </div>
                    <div class="row">
                    <div class="col-md-6 col-sm-12 col-xs-12 labeL_formulario">
                      <p class=''>Sexo
                      <select class="form-control requerir" id="sexo_reg" name="sexo_reg" required>
                        <option value="Masculino">Masculino</option>
                        <option value="Femenino">Femenino</option>
                      </select>
                      </p>

                    </div>
                    <div class="col-md-6 col-sm-12 col-xs-12 labeL_formulario">
                      <p >Edad
                      <input class="form-control requerir" type="text"  id="edad_reg" name="edad_reg" min="1" max="120" maxlength="3" onkeypress="return soloNumeros(event)" placeholder="Ingrese su edad" required></p>

                    </div>
                    </div>


                    <div class='row'>
                      <div id="span" class="col-md-6 col-sm-12 col-xs-12 labeL_formulario">
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
                      <p >Actividad Física
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

              <div id="resumenCDP" class="col-md-4 col-sm-12 col-lg-4 col-xs-12">
                <div class="card">
                  <div class="card-body">
                    <p><b>Datos del pedido</b></p>
                    <hr>
                    <p class="text-center"><b>Información</b></p>
                    <hr>
                    <div>
                      <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">

                        <img class="img-fluid " style="width: 70%; height: auto;" src="<?php echo base_url(); ?>img/Ceres/box.png" alt="">
                        <div class="text-center">
                          <p>(Imagen referencial)</p>
                        </div>
                        <hr>
                        <div class="col-12 text-left">
                          <p><b>Información de Registro:</b></p>
                          <span id="correoUsuarioInfo"></span>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <!--  fin data_personal!-->
          <!-- direccion_contacto!-->
          <div class="row">
          <div class='col-md-8 col-sm-12 col-lg-8 col-xs-12'  id='data_personal2'>

            <form class="form-group" id='form_direccion' action="" data-toggle="validator" method="post">


                <h3  class="h3 text-center" id='datos'>Dirección y Contacto </h3>
              <div class="row">

                <div class="col-md-6 col-sm-12 col-xs-12 labeL_formulario">


                  <p>País
                    <select class="form-control requerir" name="pais_reg"  id="pais_reg" required>
                      <option value="">Seleccione</option>
                      <?php foreach ($pais as $result){

                        echo "<option value=".$result->id_pais.">".$result->pais."</option>";

                      }?>
                    </select>
                  </div>
                  <div class="col-md-6 col-sm-12 col-xs-12 labeL_formulario">


                    <p >Estado
                      <select class="form-control requerir" name="estado_reg" id="estado_reg" required>
                          <option value="">Seleccione</option>
                      </select>

                    </p>

                </div>

              </div>
                <div class='row'>
                    <div class="col-md-6 col-sm-12 col-xs-12 labeL_formulario">

                      <p>Ciudad
                      <select class="form-control requerir" name="ciudad_reg" id="ciudad_reg" required>
                        <option value="">Seleccione</option>

                      </select></p>

                    </div>
                    <div class="col-md-6 col-sm-12 col-xs-12 labeL_formulario">
                        <p >Sector
                        <select class="form-control requerir" name="sector_reg" id="sector_reg" required>
                        <option value="">Seleccione</option>
                        </select></p>
                    </div>
                </div>
                <div class='row'>
                    <div class="col-md-6 col-sm-12 col-xs-12 labeL_formulario">

                      <p >Código Postal
                      <input  class="form-control requerir" type="text"  id="codigopostal_reg" name="codigopostal_reg" name="email" value="" maxlength="8" onkeypress="return soloNumeros(event)" required>

                    </p>

                  </div>
                  <div class="col-md-6 col-sm-12 col-xs-12 labeL_formulario">
                  <p>Teléfono fijo / móvil
                    <input  class="form-control requerir" type="text "  id="telefono_reg" name="telefono_reg" maxlength='15' onkeypress="return soloNumeros(event)" value="" required></p>

                </div>

              </div>
              <div class='row'>
                <div class='col-12 labeL_formulario'>
                  <p>Dirección</p>
                  <textarea class="form-control requerir" type="text"  id="direccion_reg_av_cl" placehorder="Direccion..." name="direccion_reg" required>  </textarea><br>
                  <p>Colocar: <b>Avenida</b>, <b>Urbanización</b>, <b>Calle</b>, <b>Vereda</b>, <b>(Edificio/Casa)</b>, <b>Apartamento</b> y <b>Punto de referencia</b> de manera clara y precisa.</p>
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

            <div style="display:none;" id="resumenCDD" class="col-md-4 col-sm-12 col-lg-4 col-xs-12">
              <div class="card">
                <div class="card-body">
                  <p><b>Datos del pedido</b></p>
                  <hr>
                  <p class="text-center"><b>Información</b></p>
                  <hr>
                  <div>
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">

                      <img class="img-fluid " style="width: 70%; height: auto;" src="<?php echo base_url(); ?>img/Ceres/box.png" alt="">

                      <div class="text-center">
                          <p>(Imagen referencial)</p>
                      </div>
                      <hr>
                      <div class="col-12 text-left">
                        <p><b>Información de Registro:</b></p>
                        <span id="correoUsuarioInfoD"></span>
                        <br><br>
                        <span id="nombresUsuarioInfoD"></span>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            
          </div>
          <!--  fin direccion_contacto!-->
            <!-- pago!-->
<div class="row">
<div class='col-md-8 col-sm-12 col-lg-8 col-xs-12'  id='formas_pago'>

<div class="card1" >
    <div class="card-header1" id="headingThere">

      <div class="row">

          <div class="col-md-10 col-sm-10 col-xs-10 col-lg-10 ">
            <span class="nunita-title" >
            Selecciona la forma de pago disponible.
            </span>
          </div>

          <div class="col-1">

          </div>
      </div>
    </div>
      <div class="accordion" id="accordionExample1" style="margin-top: 1%;">
    <div id="collapseThere" class="collapse show" aria-labelledby="headingThere" data-parent="#accordionExample">

      <div class="card1">
          <div class="card-header1" id="headingThereOne">
            <!--Instapgo!-->
            <div class="row">


                <div class="col-md-11 col-sm-11 col-xs-11 col-lg-11">
                  <div style="visibility: hidden;" class="fela-1pzq4bv">
                  <span   style="cursor:pointer;    margin-top: 4.5%;  ;margin-left: 5%;" data-toggle="collapse" data-target="#collapseThereOne" aria-expanded="false" aria-controls="collapseThereOne">
                     Añadir tarjeta de crédito
                    </span>
                    </div>
                    <br>
                    <br>
                    <div id="collapseThereOne" class="collapse" aria-labelledby="headingThereOne" data-parent="#accordionExample1">
                      <form class="form-group" id="form_instapago" action="" method="post">

                            <input type="hidden" name="correo" value="">
                            <input type="hidden" name="estatus" value="">
                            <input type="hidden" name="tipo_transaccion" value="">
                            <input type="hidden" name="code_orden" value="">
                            <div class="row">
                              <div class="col-12 lato" style="font-size: 16px;text-align: left;padding: 5px 10px;border-bottom: 1px solid #7dbe41;">		Datos Personales		</div>
                            </div>
                            <div class="row" style="margin-top:2%;text-align:left" >
                              <div class="col-md-6 col-sm-12 col-xs-12 col-lg-6">
                                  <p class="lato">Nombre del Titular:</p>
                                  <input class="form-control requerir" onkeypress="return soloLetras(event)" type="text" id="PaymentCDCPersonName" tabindex="210" name="Name" class="WithBorder"><br>
                                  <p class="lato">Número de Tarjeta:</p>
                                  <input class="form-control requerir" autocomplete="off" onkeypress="return soloNumeros(event)" type="text" id="PaymentCDCNumber" maxlength="16" tabindex="212" name="CardNumber" class="WithBorder">
                              </div>

                              <div class="col-md-6 col-sm-12 col-xs-12">

                                  <p class="lato">Apellidos del Titular:</p>
                                  <input class="form-control requerir" onkeypress="return soloLetras(event)" type="text" id="PaymentCDCPersonLastname" tabindex="211" name="Lastname" class="WithBorder">	<br>
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
                                    <br>
                                    <span style="margin-top: 5%;">Monto a pagar:</span>
                                    <div class="col-12">
                                    <br>
                                    <input class="form-control requerir" type="text" readonly  autocomplete="off" onkeypress="return soloNumeros(event)"  maxlength="3" tabindex="217" name="Monto a pagar" class="Half WithBorder" id="MontoP" placeholder="Monto a pagar" style=" width: 113%; margin-left: -8%;">
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

            <div class="row">


                <div class="col-11 ">
                    <div class="fela-1pzq4bv">
                  <span class="" id="modalCuentasT" style="cursor:pointer;margin-top: 4.5%;  ;margin-left: 5%;" data-toggle="collapse" data-target="#collapseThereTwo" aria-expanded="false" aria-controls="collapseThereTwo">
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
                                  <input class="form-control requerir" onkeypress="return soloLetras(event)" type="text" id="PaymentCDCPersonNameT" placeholder="Nombre"  name="Name" class="WithBorder">

                              </div>
                                <div class="col-md-6 col-sm-12 col-xs-12 col-lg-6">
                                  <p class="lato">Apellido(s):</p>
                                  <input class="form-control requerir" autocomplete="off" onkeypress="return soloLetras(event)" type="text"   placeholder="Apellido(s)" id="PaymentCDCPersonLastnameT" maxlength="16"  name="CardNumber" class="WithBorder">
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


                                  <p class="lato">Teléfono fijo / móvil:</p>
                                  <input class="form-control requerir" onkeypress="return soloNumeros(event)" type="text" id="PaymentCDCPersonPhoneT"  placeholder="Teléfono" name="phone" class="WithBorder">
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
                                    <option value="BANESCO BANCO UNIVERSAL">BANESCO BANCO UNIVERSAL</option>

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
                                  <input class="form-control requerir" autocomplete="off" readonly type="text" id="PaymentMontoT" maxlength="16"  name="PaymentMontoT" class="WithBorder">
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


                <div class="col-11">
                    <div class="fela-1pzq4bv">
                  <span class="" id="modalCuentasD" style="cursor:pointer;margin-top: 4.5%;  ;margin-left: 5%;" data-toggle="collapse" data-target="#collapseThereThere" aria-expanded="false" aria-controls="collapseThereThere">
                    Transferencia Zelle
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
                                  <input class="form-control requerir" onkeypress="return soloLetras(event)" type="text" id="PaymentCDCPersonNameD" placeholder="Nombre"  name="NameD" class="WithBorder">

                              </div>
                                <div class="col-md-6 col-sm-12 col-xs-12 col-lg-6">
                                  <p class="lato">Apellido(s):</p>
                                  <input class="form-control requerir" autocomplete="off" onkeypress="return soloLetras(event)" type="text"   placeholder="Apellido(s)" id="PaymentCDCPersonLastnameD" maxlength="16"  name="CardNumber" class="WithBorder">
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
                                  <input class="form-control requerir" onkeypress="return soloNumeros(event)" type="text" id="PaymentCDCPersonPhoneD"  placeholder="Teléfono" name="phoneD" class="WithBorder">
                              </div>

                            </div>

                            <div class="row" style="margin-top:2%;text-align:left" >
                              <div class="col-md-6 col-sm-12 col-xs-12 col-lg-6">
                              <p class="lato">Correo del titular:</p>
                              <input class="form-control requerir" type="email" id="correoZelleD"  placeholder="Correo" readonly name="correoZelleD" class="WithBorder">

                            </div>

                            <div class="col-md-6 col-sm-12 col-xs-12 col-lg-6">
                              <p class="lato">Monto en USD:</p>
                              <input class="form-control requerir" id="montoDZelle" readonly type="text" name="precioUsdZelleD">
                                  
                            </div>


                            </div>

                            <div class="row" style="margin-top:2%;text-align:left" >
                              <div class="col-md-6 col-sm-12 col-xs-12 col-lg-6">
                                  <p class="lato">Referencia de pago:</p>
                                  <input class="form-control requerir" onkeypress="return soloNumeros(event)" type="text" id="PaymentRefD" placeholder="Referencia" name="PaymentRefD" class="WithBorder">

                              </div>
                                <div class="col-md-6 col-sm-12 col-xs-12 col-lg-6">
                                  <p class="lato">Monto en Bs:</p>
                                  <input class="form-control requerir" autocomplete="off" readonly type="text" id="PaymentMontoD" maxlength="16"  name="PaymentMontoD" class="WithBorder">
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

</div>
  
  <div style="display:none;" id="resumenCDT" class="col-md-4 col-sm-12 col-lg-4 col-xs-12">
      <div class="card">
        <div class="card-body">
          <p><b>Resumen del pedido</b></p>
          <hr>
          <p class="text-center"><b>Orden</b></p>
          <hr>
          <div>
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
              <div class="row">
                <p>Hemos completado tu plan nutricional, el costo final de tu <b>#Nutri<span style="color: #7dbe41;">Box</span></b> es el siguiente:</p>
                <div class="col-6 text-left">  
                  <p>Producto:</p>
                  <p>Precio (USD):</p>
                  <p>Precio (Bs)</p>
                  <p>Cantidad:</p>
                </div>
                <div class="col-6 text-left">
                  <p><?php echo $prod_descripcion; ?></p>
                  <p id="precio_dolaresT"><b>$ <?php echo $precio_dolares; ?></b></p>
                  <p id="precio_bsT"><b>Bs <?php echo $precio_bs; ?></b></p>
                  <p>1</p>
                </div>
              </div>
              <hr>
              <div class="col-12 text-left">
                <p><b>Información de Compra:</b></p>
                <p>- La <b>#NutriBox</b> está diseñada para sustentar el plan nutricional que hemos preparado para ti, tu plan está elaborado para cubrir los días de <b>Lunes a Domingo</b>.</p>
                <p>- Los despachos de la <b>#NutriBox</b> son los días <b>Viernes</b> de cada semana.</p>
                <p>- El día del corte para validar y considerar los pagos son los miércoles de cada semana.</p>
                <p></p>
              </div>
              <hr>
              <div class="col-12 text-left">
                <p><b>Información de Registro:</b></p>
                <span id="correoUsuarioInfoT"></span>
                <br><br>
                <span id="nombresUsuarioInfoT"></span>
              </div>
              <hr>

                <div class="row">

                  <div class="col-12 text-left">
                    <p><b>Información de Contacto:</b></p>
                  </div>

                  <div class="col-12 text-left">

                    <p>Dirección: <b><span id="direccionUsuarioInfoT"></span></b></p>
                    <p>Código Postal: <b><span id="codigoPUsuarioInfoT"></span></b></p>
                    <p>Teléfono: <b><span id="telefonoPUsuarioInfoT"></span></b></p>
                  </div>
                </div>
            </div>
          </div>
        </div>
      </div>
    </div>

</div>
              <!--  fin pago!-->
          
          </div>
          
          <div class="row">
          
          <div class="col-md-8 col-sm-12 col-lg-8 col-xs-12" id="resumen_compra">

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
</div>

  <!-- /////////////////////////////////////////////////////////////// -->

  <div style="display:none; margin-top: 3%" id="resumenCDF" class="col-md-4 col-sm-12 col-lg-4 col-xs-12">
            <div class="card">
              <div class="card-body">
                <p><b>Resumen del pedido</b></p>
                <hr>
                <p class="text-center"><b>Orden</b></p>
                <hr>
                <div>
                  <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <p>Hemos completado tu plan nutricional, el costo final de tu <b>#Nutri<span style="color: #7dbe41;">Box</span></b> es el siguiente:</p>
                    <div class="row">
                      <div class="col-6 text-left">  
                        <p>Producto:</p>
                        <p>Precio (USD):</p>
                        <p>Precio (Bs)</p>
                        <p>Cantidad:</p>
                      </div>
                      <div class="col-6 text-left">
                        <p><?php echo $prod_descripcion; ?></p>
                        <p id="precio_dolaresF"><b>$ <?php echo $precio_dolares; ?></b></p>
                        <p id="precio_bsF"><b>Bs <?php echo $precio_bs; ?></b></p>
                        <p>1</p>
                      </div>
                    </div>
                    <hr>
                    <div class="col-12 text-left">
                      <p><b>Información de Compra:</b></p>
                      <p>- La <b>#NutriBox</b> está diseñada para sustentar el plan nutricional que hemos preparado para ti, tu plan está elaborado para cubrir los días de <b>Lunes a Domingo</b>.</p>
                      <p>- Los despachos de la <b>#NutriBox</b> son los días <b>Viernes</b> de cada semana.</p>
                      <p>- El día del corte para validar y considerar los pagos son los miércoles de cada semana.</p>
                      <p></p>
                    </div>
                    <hr>
                    <div class="col-12 text-left">
                      <p><b>Información de Registro:</b></p>
                      <span id="correoUsuarioInfoF"></span>
                      <br><br>
                      <span id="nombresUsuarioInfoF"></span>
                    </div>
                    <hr>

                      <div class="row">

                        <div class="col-12 text-left">
                          <p><b>Información de Contacto:</b></p>
                        </div>

                        <div class="col-12 text-left">

                          <p>Dirección: <b><span id="direccionUsuarioInfoF"></span></b></p>
                          <p>Código Postal: <b><span id="codigoPUsuarioInfoF"></span></b></p>
                          <p>Teléfono: <b><span id="telefonoPUsuarioInfoF"></span></b></p>
                        </div>
                      </div>
                  </div>
                </div>
              </div>
            </div>
          </div>

</div>

          

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
      <script src="<?php echo base_url(); ?>js/continuar_registro.js" type="text/javascript"></script>
