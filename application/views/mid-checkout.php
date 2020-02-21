<?php
defined('BASEPATH') OR exit('No direct script access allowed');

//detales de compra para el carrito
$carrito_usuario;

//detalles del usuario que se enviaran a los metodos de pago
$nombre; $apellido; $cedula; $codeorder; $monto_total; $id_afiliacion; $monto_usd;
?>

<!-- Modal Pago por Zelle datos-->
<div class="modal fade" id="cuentasModalZelle" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalCenterTitle">Transferencia Zelle disponibles</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p>Estimado cliente, haz seleccionado el método de Transferencia Zelle; le sugerimos anota cuidadosamente los datos de la cuenta. Una vez realizada la transferencia, por favor envie el soporte al correo "informacion@ceresfresh.com"</p>

        <p>Datos:</p>

        <p><b>XXX-XXXX-XXXX-XXXX</b></p>

        <p><b>XXX-XXXX-XXXX-XXXX</b></p>

        <hr>
      </div>
      <div class="modal-footer">
        <button style="background: #36434a; color:white" type="button" class="btn" data-dismiss="modal">Aceptar</button>
      </div>
    </div>
  </div>
</div>


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
        <p>Estimado cliente, ha seleccionado el método trasferencia o depósito le sugerimos anotar bien la información con respecto a los datos de la cuenta a transferir o depositar.</p>

        <p>Realizar pago a nombre de:</p>

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

<!-- Modal instapago Fallido -->
<div class="modal fade" id="instapagoFallida" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Transacción Fallida</h5>
        
      </div>
      <div class="modal-body">
			Estimado cliente no se pudo procesar su compra, intente más tarde... Gracias y disculpe las molestias!  
      </div>
      <div class="modal-footer">
        <button style="background: #36434a" type="button" class="btn btn-secondary" data-dismiss="modal" onclick="recargarPagina()">Aceptar</button>
      </div>
    </div>
  </div>
</div>
<!-- ///////////////////////////////////////////////////////////// -->


<!-- Modal deposito Fallido -->
<div class="modal fade" id="depositoFallida" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Transacción Fallida</h5>
        
      </div>
      <div class="modal-body">
			Estimado cliente no se pudo procesar su compra, intente más tarde... Gracias y disculpe las molestias!  
      </div>
      <div class="modal-footer">
        <button style="background: #36434a" type="button" class="btn btn-secondary" data-dismiss="modal" onclick="recargarPagina()">Aceptar</button>
      </div>
    </div>
  </div>
</div>
<!-- ///////////////////////////////////////////////////////////// -->


<!-- Modal deposito Fallido -->
<div class="modal fade" id="transferenciaFallida" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Transacción Fallida</h5>
        
      </div>
      <div class="modal-body">
			Estimado cliente no se pudo procesar su compra, intente más tarde... Gracias y disculpe las molestias!  
      </div>
      <div class="modal-footer">
        <button style="background: #36434a" type="button" class="btn btn-secondary" data-dismiss="modal" onclick="recargarPagina()">Aceptar</button>
      </div>
    </div>
  </div>
</div>
<!-- ///////////////////////////////////////////////////////////// -->

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


<div style="margin-top: 1%;margin-bottom:42rem">
	<div class='container' >
		<div class="row" >
			<div class="col-md-9 col-xl-9 col-lg-9 col-sm-9">
	    	<div class="accordion" id="accordionExample" style="margin-top: 1%;">


				<div class="card1" >
						<div class="card-header1" id="headingOne">

							<div class="row">
								<span class="Number Completed nunita-title">1</span>

									<div class="col-md-10 col-sm-10 col-xs-10 col-lg-10 ">
										<span class="nunita-title" >
											Confirmar datos de facturación.
										</span>
									</div>

									<div class="col-1">
										<i class="material-icons"  id='iconsCollapseOne' data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
											edit
										</i>
									</div>
							</div>
						</div>

						<div id="collapseOne" class="collapse show " aria-labelledby="headingOne" data-parent="#accordionExample">
						<div class="card-body">

						<div style="padding-top: 2.5rem;" class="container animated fadeIn">

								<form class="form-group" id='form_datospersonal' action="" method="post">

											<input type="hidden" id="correo"  name="correo" value="<?php echo $_SESSION['correo']; ?>">
											<input type="hidden" id="pais" name="pais" value="<?php echo $datapersonal->pais ?>">

											<div class="row">
												<div class="col-12 lato" style="font-size: 16px;padding: 5px 10px;color: #7dbe41;border-bottom: 1px solid #7dbe41;">		Datos Personales		</div>
											</div>
											<div class="row" style="margin-top:2%" >
												<div class="col-md-6 col-sm-12 col-xs-12 col-lg-6">
														<p class="lato">Nombre:</p>
														<input class="form-control requerir" readonly type="text" placeholder="Nombre" id="nombre_fact" name="nombre_fact" value="<?php echo $datapersonal->nombre ?>">
												</div>
												<div class="col-md-6 col-sm-12 col-xs-12 col-lg-6">
														<p class="lato">Apellido(s):</p>
														<input class="form-control requerir"  readonly type="text" id="apellido_fact" placeholder="Apellido(s)" name="apellido_fact" value="<?php echo $datapersonal->apellido ?>">
												</div>

											</div>
											<div class="row" style="margin-top:2%" >
												<div class="col-md-6 col-sm-12 col-xs-12">


												<p class="lato">Sexo:</p>

													<select class="form-control requerir" disabled  id="sexofact" name="sexofact">
																		<option value="Masculino" <?php if($datapersonal->sexo=='Masculino'){echo "selected";} ?>>Masculino</option>
																		<option value="Femenino" <?php if($datapersonal->sexo=='Femenino'){echo "selected";} ?>>Femenino</option>
																</select>

													<!--<p class="lato">Cédula:</p>
													<select class="WithBorder form-control" tabindex="13" style="width: 22%;height: 49%;margin-right: 1%;float: left;border-radius: .25rem;" id="tipoCedulafact" name="tipoCedulafact">
																		<option value="V" selected="">V</option>
																		<option value="E">E</option>
																</select>
													<input class="form-control requerir" type="text" id="cedulafact" placeholder="Cédula" name="cedulafact" style="width:77%" value="">
	!-->
												</div>
												<div class="col-md-6 col-sm-12 col-xs-12 col-lg-6">



																<p class="lato">Correo:</p>
													<input class="form-control requerir" readonly type="text" id='email_fact' placeholder="Correo" name="email_fact" value="<?php echo $datapersonal->correo ?>">


												</div>

											</div>

											<div class="row" style="margin-top:2%">
												<div class="col-md-6 col-sm-12 col-xs-12">

												<p class="lato">Teléfono:</p>
													<input class="form-control requerir" readonly type="text" id='telefono_fact'  placeholder="Teléfono"name="telefono_fact" value="<?php echo $datapersonal->phone;?>">

												</div>

												<div class="col-md-6 col-sm-12 col-xs-12">


												</div>

											</div>




												<div class="row" style="margin-top:7%">
													<div class="col-md-10 col-sm-10 col-xs-10" style="">

													</div>
													<div class="col-md-2 col-sm-2 col-xs-2" style="">
														<button id="facturacion" style="background: #7dbe41; color:white" class="btn lato" type="button" name="button">&nbsp;Siguiente&nbsp;</button>
													</div>
												</div>
												</form>
									</div>



										</div>
								</div>
							</div>
<!--        Datos adicionales de Método de Entrega. !-->

							<div class="card1" id='entrega'>
									<div class="card-header1" id="headingTwo">

										<div class="row">
											<span class="Number Completed nunita-title">2</span>

												<div class="col-md-10 col-sm-10 col-xs-10 col-lg-10 ">
													<span class="nunita-title" >
														Datos adicionales de Método de Entrega.
													</span>
												</div>

												<div class="col-1">
													<i class="material-icons collapsed"  id='iconsCollapseTwo' data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
														edit
													</i>
												</div>
										</div>
									</div>
									<div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionExample">
										<div class="card-body">
											<div class="row">
			    											<div class="col-1">
																</div>
																<div class="col-1">

																	<div class="checkbox">
															<input type="checkbox" value="Checked"  checked='true' id="yomismo"/>
															<label for="yomismo"></label>
													</div>


																</div>
																<div class="col-10">
																	<span class="nunita-title" style="">	Entrega personal. </span>
																</div>
												</div>

												<div class="row" style='margin-top:2%'>
																	<div class="col-1">
																	</div>
																	<div class="col-1">

																		<div class="checkbox">
				                                <input type="checkbox" value="None" id="paraotro"  />
				                                <label for="paraotro"></label><br>
				                            </div>


																	</div>
																	<div class="col-10">
																		<span class="nunita-title" style="">Asignar otra persona.</span>
																	</div>
													</div>
													<hr>
													<form class="form-group2" id='delivery_data' action="" method="post">

																<div class="row">
												<div class="col-12 lato" style="font-size: 16px;padding: 5px 10px;color: #7dbe41;border-bottom: 1px solid #7dbe41;">		Datos Personales		</div>
											</div>
											<div class="row" style="margin-top:2%" >
												<div class="col-md-6 col-sm-12 col-xs-12 col-lg-6">
														<p class="lato">Nombre:</p>
														<input class="form-control requerir" placeholder="Nombre" type="text" id="nombre_delivery" name="nombre_delivery" value="<?php echo $datapersonal->nombre;?>">
												</div>
												<div class="col-md-6 col-sm-12 col-xs-12 col-lg-6">
														<p class="lato">Apellido(s):</p>
														<input class="form-control requerir" type="text"  placeholder="Apellido(s)" id="apellido_delivery"  name="apellido_delivery" value="<?php echo $datapersonal->apellido;?>">
												</div>

											</div>
											<div class="row" style="margin-top:2%" >
												<div class="col-md-6 col-sm-12 col-xs-12">
													<p class="lato">Cédula:</p>
													<select class="WithBorder form-control" tabindex="13" style="width: 22%;height: 49%;margin-right: 1%;float: left;border-radius: .25rem;" id="tipoCeduladelivery" name="tipoCeduladelivery">
																		<option value="V" selected="">V</option>
																		<option value="E">E</option>
																</select>
													<input class="form-control requerir" placeholder="Cédula" type="text" id="ceduladelivery" name="ceduladelivery" style="width:77%" value="">

												</div>
												<div class="col-md-6 col-sm-12 col-xs-12 col-lg-6">

												<p class="lato">Sexo:</p>

													<select class="form-control requerir"  id="sexodelivery" name="sexodelivery">
																		<option value="Masculino" <?php if($datapersonal->sexo=='Masculino'){echo "selected";} ?>>Masculino</option>
																		<option value="Femenino" <?php if($datapersonal->sexo=='Femenino'){echo "selected";} ?>>Femenino</option>
																</select>


												</div>

											</div>

											<div class="row" style="margin-top:2%">
												<div class="col-md-6 col-sm-12 col-xs-12">
													<p class="lato">Correo:</p>
													<input class="form-control requerir" type="text" id='email_delivery' name="email_delivery" value="<?php echo $datapersonal->correo;?>">

												</div>

												<div class="col-md-6 col-sm-12 col-xs-12">

													<p class="lato">Teléfono:</p>
													<input class="form-control requerir" type="text" id='telefono_delivery' name="telefono_delivery" value="<?php echo $datapersonal->phone;?>">
												</div>

											</div>

											<div class="row">
												<div class="col-12 lato" style="font-size: 16px;padding: 5px 10px;color: #7dbe41;border-bottom: 1px solid #7dbe41;">	Datos de Ubicación		</div>
											</div>
											<div class="row" style="margin-top:3%" >
												<div class="col-md-6 col-sm-12 col-xs-12 col-lg-6">
												<p class="lato">Estado:</p>
												<select class="form-control requerir" id="estado_delivery" name="estado_delivery" required="">
													<?php foreach ($estados as $result){?>

											         <option value="<?php echo $result->id_estado;?>"<?php if($result->id_estado==$datapersonal->state){echo "selected";} ?>> <?php  echo $result->estado ?></option>;

											       <?php }?>

												</select>

													</div>

														<div class="col-md-6 col-sm-12 col-xs-12 col-lg-6">

															<p class="lato">Ciudad:</p>

																	<select class="form-control requerir" id="ciudad_delivery" name="ciudad_delivery" required="">
																		<?php foreach ($ciudades as $result){?>

																				 <option value="<?php echo $result->id_ciudad;?>"<?php if($result->id_ciudad==$datapersonal->city){echo "selected";} ?>> <?php  echo $result->ciudad ?></option>;

																			 <?php }?>

															</select>

												</div>

												</div>
												<div class="row" style="margin-top:2%" >
												<div class="col-md-6 col-sm-12 col-xs-12">

													<p class="lato">Sector:</p>

													<select class="form-control requerir" id="sector_delivery" name="sector_delivery" required="">
														<?php foreach ($sectores as $result){?>

																 <option value="<?php echo $result->id;?>"<?php if($result->id==$datapersonal->sector){echo "selected";} ?>> <?php  echo $result->Sector ?></option>;

															 <?php }?>

											</select>
													</div>
													<div class="col-md-6 col-sm-12 col-xs-12">
														<p class="lato">Código Postal:</p>
														<input class="form-control requerir" type="number" name="codpostal_delivery" id="codpostal_delivery" value="<?php echo $datapersonal->zipcode  ?>">
												</div>

											</div>
											<div class="row" style="margin-top:2%">

													<div class="col-md-12 col-sm-12 col-xs-12">

													<p class="lato">Dirección:</p>
													<textarea id="direccion_delivery" type="text"  name="direccion_delivery"  value="<?php echo $datapersonal->address ?>" style="width: 100%; height: 100%;" class="form-control requerir" ><?php echo $datapersonal->address ?> </textarea>
													</div>
											</div>
																	<div class="row btnsigforpa" style="margin-top:7%">
																		<div class="col-md-10 col-sm-10 col-xs-10" style="">

																		</div>
																		<div class="col-md-2 col-sm-2 col-xs-2" style="">
																			<button id="formapago" style="background: #7dbe41; color:white"  class="btn lato" type="button" name="button">&nbsp;Siguiente&nbsp;</button>
																		</div>
																	</div>


																</form>
													</div>


										</div>
									</div>



							<!--       Forma de pago. !-->
							<div class="card1"  id='div_formas_pago'>
									<div class="card-header1" id="headingThere">

										<div class="row" >
											<span class="Number Completed nunita-title">3</span>

												<div class="col-md-10 col-sm-10 col-xs-10 col-lg-10 " >
													<span class="nunita-title" >
													Indique la forma de pago de su preferencia.
													</span>
												</div>

												<div class="col-1">
												<i class="material-icons collapsed" id="iconsCollapseThere" data-toggle="collapse" data-target="#collapseThere" aria-expanded="false" aria-controls="collapseThere">
														edit
													</i>
												</div>
										</div>
									</div>
										<div class="accordion" id="accordionExample1" style="margin-top: 1%;">
									<div id="collapseThere" class="collapse" aria-labelledby="headingThere" data-parent="#accordionExample">

										<div class="card1" >
											<div class="card-header1" id="headingThereOne">
												<!--Instapgo!-->
												<div class="row">


													<div class="col-md-11 col-sm-11 col-xs-11 col-lg-11">

														<span class=""  style="cursor:pointer; visibility: hidden;" data-toggle="collapse" data-target="#collapseThereOne" aria-expanded="false" aria-controls="collapseThereOne">
													         Tarjeta de crédito
													        </span>
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
																								<input class="form-control requerir" onkeypress="return soloLetras(event)" type="text" id="PaymentCDCPersonName" tabindex="210" name="Name" value="<?php echo $datapersonal->nombre;?>" class="WithBorder"><br>
																								<p class="lato">Número de Tarjeta:</p>
																								<input class="form-control requerir" autocomplete="off" onkeypress="return soloNumeros(event)" type="text" id="PaymentCDCNumber" maxlength="16" tabindex="212" name="CardNumber" class="WithBorder">
																						</div>

																						<div class="col-md-6 col-sm-12 col-xs-12">

																								<p class="lato">Apellidos del Titular:</p>
																								<input class="form-control requerir" onkeypress="return soloLetras(event)" type="text" id="PaymentCDCPersonLastname" tabindex="211" value="<?php echo $datapersonal->apellido;?>"name="Lastname" class="WithBorder">	<br>
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
	<input class="form-control requerir" type="hidden" readonly  autocomplete="off" onkeypress="return soloNumeros(event)" value="<?php echo $monto; ?>" maxlength="3" tabindex="217" name="Monto a pagar" class="Half WithBorder" id="MontoP" placeholder="Monto a pagar" style=" width: 113%; margin-left: -8%;">

	<input class="form-control requerir" type="text" readonly  autocomplete="off" onkeypress="return soloNumeros(event)" value="<?php echo number_format($monto, 2, '.',',')?>" maxlength="3" tabindex="217" name="" class="Half WithBorder" id="" placeholder="Monto a pagar" style=" width: 113%; margin-left: -8%;">
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


<div class="col-11">
	<span class="" id="modalCuentasT" style="cursor:pointer" data-toggle="collapse" data-target="#collapseThereTwo" aria-expanded="false" aria-controls="collapseThereTwo">Transferencia bancaria</span>
<br>
<br>
<div id="collapseThereTwo" class="collapse" aria-labelledby="headingThereTwo" data-parent="#accordionExample1">
		<form class="form-group" id="form_transferencia" action="" method="post">


																					<div class="row">
																						<div class="col-12 lato" style="font-size: 16px;text-align: left; padding: 5px 10px;border-bottom: 1px solid #7dbe41;">Datos Personales</div>
																					</div>
																					<div class="row" style="margin-top:2%;text-align:left" >
																						<div class="col-md-6 col-sm-12 col-xs-12 col-lg-6">
																								<p class="lato">Nombre del Titular:</p>
																								<input class="form-control requerir" onkeypress="return soloLetras(event)" type="text" id="PaymentCDCPersonNameT"  value="<?php echo $datapersonal->nombre;?>"placeholder="Nombre"  name="Name" class="WithBorder">

																						</div>
																							<div class="col-md-6 col-sm-12 col-xs-12 col-lg-6">
																								<p class="lato">Apellido(s):</p>
																								<input class="form-control requerir" autocomplete="off" onkeypress="return soloLetras(event)" type="text" value="<?php echo $datapersonal->apellido;?>"   placeholder="Apellido(s)" id="PaymentCDCPersonLastnameT" maxlength="16"  name="CardNumber" class="WithBorder">
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
																								<input class="form-control requerir" onkeypress="return soloNumeros(event)" type="text" id="PaymentCDCPersonPhoneT" value="<?php echo $datapersonal->phone;?>"  placeholder="Teléfono" name="phone" class="WithBorder">
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
																								<input class="form-control requerir" autocomplete="off" readonly type="hidden" id="PaymentMontoT" maxlength="16" value="<?php echo $monto; ?>"  name="PaymentMontoT" class="WithBorder">

																								<input class="form-control requerir" autocomplete="off" readonly type="text" id="" maxlength="16" value="<?php echo number_format($monto, 2, '.',',')?>"  name="" class="WithBorder">
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
		<span class="" id="modalCuentasD" style="cursor:pointer;" data-toggle="collapse" data-target="#collapseThereThere" aria-expanded="false" aria-controls="collapseThereThere">Transferencia Zelle</span>
		<br>
		<br>
		<div id="collapseThereThere" class="collapse" aria-labelledby="headingThereThere" data-parent="#accordionExample1">
		<form class="form-group" id="form_deposito" action="" method="post">

	<div class="row">
		<div class="col-12 lato" style="font-size: 16px;text-align: left;padding: 5px 10px;border-bottom: 1px solid #7dbe41;">Datos Personales</div>
	</div>
	<div class="row" style="margin-top:2%;text-align:left" >
																							<div class="col-md-6 col-sm-12 col-xs-12 col-lg-6">
																								<p class="lato">Nombre del Titular:</p>
																								<input class="form-control requerir" onkeypress="return soloLetras(event)" type="text" id="PaymentCDCPersonNameD" placeholder="Nombre" value="<?php echo $datapersonal->nombre ?>" name="NameD" class="WithBorder">

																						</div>
																							<div class="col-md-6 col-sm-12 col-xs-12 col-lg-6">
																								<p class="lato">Apellido(s):</p>
																								<input class="form-control requerir" autocomplete="off" onkeypress="return soloLetras(event)" type="text"   placeholder="Apellido(s)" value="<?php echo $datapersonal->apellido ?>" id="PaymentCDCPersonLastnameD" maxlength="16"  name="CardNumber" class="WithBorder">
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
																								<input class="form-control requerir" onkeypress="return soloNumeros(event)" type="text" id="PaymentCDCPersonPhoneD"  value="<?php echo $datapersonal->phone ?>" placeholder="Teléfono" name="phoneD" class="WithBorder">
																						</div>

																					</div>

																					<div class="row" style="margin-top:2%;text-align:left" >
																						<div class="col-md-6 col-sm-12 col-xs-12 col-lg-6">
			

			<p class="lato">Correo titular:</p>							<input class="form-control requerir" onkeypress="return soloNumeros(event)" type="email"  value="<?php echo $datapersonal->correo ?>" readonly placeholder="Correo" name="correoD" class="WithBorder">

																					</div>

																					<div class="col-md-6 col-sm-12 col-xs-12 col-lg-6">
																						<p class="lato">Monto en USD:</p>

			<input class="form-control requerir" autocomplete="off" readonly type="text" id="" maxlength="16" value="<?php echo number_format($monto_usd, 2, '.',',')?>" name="" class="WithBorder">																					
																					</div>


																					</div>

																					<div class="row" style="margin-top:2%;text-align:left" >
																						<div class="col-md-6 col-sm-12 col-xs-12 col-lg-6">
																								<p class="lato">Referencia de pago:</p>
																								<input class="form-control requerir" onkeypress="return soloNumeros(event)" type="text" id="PaymentRefD" placeholder="Referencia" name="PaymentRefD" class="WithBorder">

																						</div>
																							<div class="col-md-6 col-sm-12 col-xs-12 col-lg-6">
																								<p class="lato">Monto en Bs:</p>
																								<input class="form-control requerir" autocomplete="off" readonly type="hidden" id="PaymentMontoD" maxlength="16" value="<?php echo $monto; ?>" name="PaymentMontoD" class="WithBorder">

																								<input class="form-control requerir" autocomplete="off" readonly type="text" id="" maxlength="16" value="<?php echo number_format($monto, 2, '.',',')?>" name="" class="WithBorder">
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


<!--       Resumen de Compra.. !-->
<div class="row" id='resumen_compra' >
	<div class="card1" >
		<div class="card-header1" id="headingThere">

			<div class="row">
				<span class="Number Completed nunita-title">4</span>

				<div class="col-md-10 col-sm-10 col-xs-10 col-lg-10 ">
					<span class="nunita-title">Resumen de Compra.</span>
				</div>

				<div class="col-1">
					<i class="material-icons collapsed" id="iconsCollapseFour" data-toggle="collapse" data-target="#collapseFour" aria-expanded="false" aria-controls="collapseThereFour">edit
					</i>
				</div>
			</div>
		</div>

		<div id="collapseFour" class="collapse" aria-labelledby="headingFour" data-parent="#accordionExample">
			<div class="card-body">

				<div class="row" style="text-align:left;">
					<div class="col-12 lato" style="font-size: 16px;text-align:left;padding: 5px 10px;color: #7dbe41;border-bottom: 1px solid #7dbe41;">Comprador
				</div>
				<div class='col-12 lato'>
					<br>
					<span id='datos_comprador' type="text" value="" disabled="disabled">
						<?php echo $datapersonal->nombre." ".$datapersonal->apellido?>
					</span>
				</div>
				<br>
				<div class="col-12 lato" style="font-size: 16px;text-align:left;padding: 5px 10px;color: #7dbe41;border-bottom: 1px solid #7dbe41;">
					Pedido
				</div>
				<br><br>
				<div class='col-12'>
					<div class="table-responsive">
						<table class="table table-striped">
							<tr>
								<th>Nombre (s)</th>
								<th>Producto</th>
								<th>Cantidad</th>
								<th>Precio</th>
								<th class="text-center">Dirección</th>
							</tr>

							<?php foreach ($carrito_usuario as $result): ?>
								<tr>
								<td><?php echo $result->nombre; ?></td>
								<td><?php echo $result->producto; ?></td>

								<td><?php echo $result->cantidad; ?></td>
								<td><?php echo number_format($result->monto, 2, '.', ','); ?></td>

								<td>
								<?php echo $result->address ?>
								</td>
								</tr>
							<?php endforeach; ?>

						</table>
					</div>
				</div>
				<br><br>
				<div  id="select" style="width: 280px; height: 25px;" class=" col-12 WithBorder requerir">
					<div class="checkbox" tabindex="28">
						<input type="checkbox" name="Terms2" value="1" id="Terms2"/>
						<label for="Terms2"></label>
						<span>Acepto los <a id="termycond" href="#">términos y condiciones</a></span>
					</div>
				</div>
			</div>
			<div class="row btnpagocheck" style="margin-top:3%">
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
	</div>
</div>
</div>
</div>



	<div class="col-md-3 col-xl-3 col-lg-3 col-sm-12">

		<div class="card">
              <div class="card-body">
                <p class="text-center"><b>Resumen del pedido</b></p>
                <hr>
                <?php if(empty($codeorder)): ?>
                  <p class="text-center"><b>No tiene Ordenes</b><br></p>
                <?php else: ?>
                  <p class="text-center"><b>Orden #</b><br>
                    <?php echo $codeorder; ?>
                  </p>
                <?php endif; ?>
                <hr>
                <div>
                  <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <p class="text-center">Aquí encontrarás el monto a pagar por tus <b>#Nutri<span style="color: #7dbe41;">Box</span>.</b></p>
                    <div class="row">
                      <div class="col-6 text-left">  
                        <p><span>Cantidad: </span></p>

                        <p><span>TOTAL: </span></p>
                      </div>
                      <div class="col-6 text-left">
                        <p id="precio_dolares"><b><label id="subtotal"><?php  echo $cantidad ?></label></b></p>

                        <p id="precio_bs"><b><span><?php if(isset($monto) and $monto != ""){ echo number_format($monto, 2, '.',','); } ?><span style="color:green"></span></span></b></p>
                      </div>
                    </div>
                    <hr>

                  </div>
                </div>
              </div>
            </div>

	 </div>
</div>
	 <!-- Fin form!-->
 </div>
</div>

		<script src="<?php echo base_url(); ?>js/checkout.js" type="text/javascript"></script>
<style>

#card_text {
    /* height: 80%!important; */
    background: #293238!important;
    margin-top: 14%!important;
     margin-right: 0%!important;
    margin-left: 0%!important;
    border-radius: 4%;
}
</style>
