<?php
defined('BASEPATH') OR exit('No direct script access allowed');
?>

<!-- Modal de comprobacion de plan nutricional del usaurio-->
<div class="modal fade" id="comprbarPlanModalScrollable" tabindex="-1" role="dialog" aria-labelledby="exampleModalScrollableTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-scrollable" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalScrollableTitle"><b>No tienes un plan nutricional</b></h5>
      </div>
      <div class="modal-body">
        <div class="text-center">
          <div id="responseHtml"></div>
        </div>
      </div>
      <div class="modal-footer">
        <button id="irDetalles" style="background: #36434a; color:white" type="button" class="btn">Aceptar</button>

		<button id="salirDeSesion" style="background: #36434a; color:white" type="button" class="btn">Salir</button>
      </div>
    </div>
  </div>
</div>

<!-- Modal de comprobacion de plan nutricional del usaurio -->

<div style="background: #36434a; margin-top: -2%;">
	<div class="container">
		<div class="row">
			<div class="col-sm-12 col-md-12 col-xs-12" style="margin-top: 2%;" >
		</div>
	</div>

	<div class="row" >
		<div class="container col-sm-12 col-md-12 col-xs-12 " >
			<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
				<!--<ol class="carousel-indicators">
					<li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
					<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
					<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
					<li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
				</ol>!-->
			<div class="carousel-inner">
				<div class="carousel-item active">
					<div style="margin-top: -3%;padding-bottom: 22px;" class="margintitulo">
						<div class="row ">
							<div class="col-sm-12 col-md-6 col-xs-12 ">
								<div style='margin-top: 20%;'>
									<div class="animated fadeIn restraso-titulo-wm">
										<h2 class='titulo1 nunita colorwhite' style="line-height: 57px;font-size: 266%;"> Tu servicio de delivery saludable, rápido y personalizado.	</h2>
									</div>
									<br>
									<div class="animated fadeIn restraso-texto1-wm">
										<span style="font-size: 135%;" class="colorwhite lato somos1">SOMOS <span class="colorgreen">CERES</span>,</span>
										<span style="font-size: 135%;" class="colorwhite lato somos1">SOMOS <span class="colorgreen">FRESH</span></span>
									</div>
								</div>
							</div>
							<div class="col-sm-12 col-md-6 col-xs-12">
								<img  class="img-fluid animated fadeIn restraso-img1-wm" src="<?php echo base_url(); ?>img/bowl.png" class="d-block w-100" alt="...">
							</div>

						</div>
					</div>
				</div>

			</div>

		</div>
	</div>
					</div>
					</div>

					<div style="background: #ffffff;">
						<div class="container">
							<div style="padding-top: 4%;" class="col-md-12 col-lg-12 col-sm-12 col-xs-12">
								<h1 class="text-center nunita"><b>Cómo Funciona</b></h1>
							</div>

							<div style="margin-top: 4%"></div>

							<div class="row">

								<div style="padding-bottom: 2%;" class="col-md-5 col-lg-5 col-sm-12 col-xs-12">
									<div>
										<img style="max-width: 100%; height:auto;" class="img-fluid" src="<?=base_url(); ?>/img/Ceres/Registro-Telefono.png" alt="">
									</div>
								</div>

								<div class="col-md-2 col-lg-2 col-sm-12 col-xs-12">
									<div style="padding-top: 50%" class="text-center margen-paso-1">
										<p>Paso</p>
										<h1>1</h1>
									</div>
								</div>

								<div class="col-md-5 col-sm-12 col-xs-12">
									<div style="padding-top: 7%" class="text-center padding-texto-1">
										<h2 class="nunita">Regístrate</h2>
										<br>
										<p>Al registrarte e ingresar tu información, prepararemos para ti un plan nutricional saludable, personalizado y cónsono a tus condiciones físicas. ¡Nos adaptamos a tu estilo de vida!</p>

										<?php if (!isset($_SESSION['correo'])): ?>
										<a style="background: #7dbe41;" class="nav-item btn btn-success" href="<?=site_url('login/vista_registrar_usuario')?>">Regístrate</a>
										<?php else: ?>
										<a style="background: #7dbe41;" class="nav-item btn btn-success" href="<?=site_url('dashboardnuevo')?>">Ver plan nutricional</a>
										<?php endif; ?>
									</div>
								</div>

							</div>

							<hr style="border: #364249">

							<div style="margin-top: 4%; display:none;" class="siimagen"></div>
							<div style="display:none;" class="row siimagen">

								<div style="padding-bottom: 2%;" class="col-md-5 col-lg-5 col-sm-12 col-xs-12">
									<div>
										<img class="img-fluid " style="width: 105% !important;max-width: 105% !important;" src="<?php echo base_url(); ?>img/Ceres/box.png" alt="">
										<div class="text-center">
											<p>(Imágen referencial)</p>
										</div>
									</div>
								</div>

								<div class="col-md-2 col-lg-2 col-sm-12 col-xs-12">
									<div style="padding-top: 50%" class="text-center margen-paso-2">
										<p>Paso</p>
										<h1>2</h1>
									</div>
								</div>

								<div class="col-md-5 col-lg-5 col-sm-12 col-xs-12">
									<div style="padding-top: 7%" class="text-center padding-texto-2">
										<h2 class="nunita">Recibe tu <span class="nunita span" style="color:#36424A"> #Nutri</span><span class="nunita span"  style="color:#7DBE41">Box</span></b></h2>
										<br>

										<h4 class='lato colorwhite' style='line-height: 26px;font-size: 100%;color:#36424A'>Disfruta al recibir lo necesario para preparar todas tus comidas de acuerdo al plan nutricional que te corresponde. Cada semana, recibe en la comodidad de tu casa u oficina una #NutriBox con el siguiente contenido:</h4><br>

										<i style="float:left" class="material-icons">done</i>&nbsp;Un plan nutricional personalizado, especialmente preparado por nuestros nutricionistas.<br><br>

										<i style="float:left" class="material-icons">done</i>&nbsp;Selección de productos frescos y de calidad, escogidos cuidadosamente pensando en tu alimentación y salud.<br><br>

										<i style="float:left" class="material-icons">done</i>&nbsp;Recetas para que aproveches al máximo los productos y disfrutes con las mejores preparaciones.<br><br>

									<br>

									<?php if (!isset($_SESSION['correo'])): ?>
										<a style="background: #7dbe41;" class="nav-item btn btn-success" href="<?=site_url('login/vista_registrar_usuario')?>">Regístrate</a>
									<?php else: ?>
										<a style="background: #7dbe41;" class="nav-item btn btn-success" href="<?=site_url('dashboardnuevo')?>">Ver plan nutricional</a>
									<?php endif; ?>
									</div>
								</div>

							</div>


							<div style="margin-top: 4%"></div>
							<div class="row noimagen">

								<div class="col-md-5 col-lg-5 col-sm-12 col-xs-12">
									<div style="padding-top: 7%" class="">

										<h2 class="nunita">Recibe tu <span class="nunita span" style="color:#36424A"> #Nutri</span><span class="nunita span"  style="color:#7DBE41">Box</span></b></h2>
										<br>
													

													<h4 class='lato colorwhite' style='line-height: 26px;font-size: 100%;color:#36424A'>Disfruta al recibir lo necesario para preparar todas tus comidas de acuerdo al plan nutricional que te corresponde. Cada semana, recibe en la comodidad de tu casa u oficina una #NutriBox con el siguiente contenido:</h4><br>

													<i style="float:left" class="material-icons">done</i>&nbsp;Un plan nutricional personalizado, especialmente preparado por nuestros nutricionistas.<br><br>

													<i style="float:left" class="material-icons">done</i>&nbsp;Selección de productos frescos y de calidad, escogidos cuidadosamente pensando en tu alimentación y salud.<br><br>

													<i style="float:left" class="material-icons">done</i>&nbsp;Recetas para que aproveches al máximo los productos y disfrutes con las mejores preparaciones.<br><br>

													<br>

												<?php if (!isset($_SESSION['correo'])): ?>
													<a style="background: #7dbe41;" class="nav-item btn btn-success" href="<?=site_url('login/vista_registrar_usuario')?>">Regístrate</a>
												<?php else: ?>
													<a style="background: #7dbe41;" class="nav-item btn btn-success" href="<?=site_url('dashboardnuevo')?>">Ver plan nutricional</a>
												<?php endif; ?>
									</div>
								</div>

								<div class="col-md-2 col-lg-2 col-sm-12 col-xs-12">
									<div style="padding-top: 50%" class="text-center">
										<p>Paso</p>
										<h1>2</h1>
									</div>
								</div>

								<div style="padding-bottom: 2%;" class="col-md-5 col-lg-5 col-sm-12 col-xs-12">
									<div class="noimagen">
										<img class="img-fluid " style="width: 100% !important;max-width: 100% !important;" src="<?php echo base_url(); ?>img/Ceres/box.png" alt="">
										<div class="text-center">
											<p>(Imágen referencial)</p>
										</div>
									</div>
								</div>

							</div>

							<hr style="border:#364249">

							<div style="margin-top: 4%"></div>
							<!-- AQUI ESTA EL ERROR CORREGIR -->
							<div class="row">

								<div style="padding-bottom: 2%;" class="col-md-5 col-sm-12 col-xs-12">
									<div>
										<img style="width: 100%; height:auto;" class="img-fluid" src="<?=base_url(); ?>/img/Ceres/CERESPLATOSPREPARADOS-35.png" alt="">
									</div>
								</div>

								<div class="col-md-2 col-sm-12 col-xs-12">
									<div style="padding-top: 50%" class="text-center margen-paso-2">
										<p>Paso</p>
										<h1>3</h1>
									</div>
								</div>

								<div class="col-md-5 col-sm-12 col-xs-12">
									<div style="padding-top: 7%" class="text-center padding-texto-3">
										<h2 class="nunita">Disfruta</h2>
										<br>
										<p>Disfruta saludablemente de tus comidas siguiendo las recomendaciones nutricionales del plan. <b>#Somos<span style="color:#7dbe41">Ceres</span></b>  <b>#Somos<span style="color:#7dbe41">Fresh</span>.</b></p>
                    
                    <?php if (!isset($_SESSION['correo'])): ?>
                      <a style="background: #7dbe41;" class="nav-item btn btn-success" href="<?=site_url('login/vista_registrar_usuario')?>">Regístrate</a>
                    <?php else: ?>
                      <a style="background: #7dbe41;" class="nav-item btn btn-success" href="<?=site_url('dashboardnuevo')?>">Ver plan nutricional</a>
                    <?php endif; ?>
									</div>
								</div>
						</div>

						<hr style="border: solid 2px #364249">

						<div style="margin-top: 4%" class="text-center">
							<h2 class="nunita">Beneficios</h2>
						</div>

						<br><br>

						<div class="row text-center">
							
							<div class="col-md-3 col-lg-3 col-sm-12 col-xs-12">
								<img style="width: 30%; height: auto" src="<?=base_url(); ?>/img/iconos/Personalizado 193x159.png" alt="">
								<br><br>
								<p class="lato"><b>Personalizado</b></p>
								<p>Planes adaptados a tus características y condiciones físicas.</p>
							</div>

							<div class="col-md-3 col-lg-3 col-sm-12 col-xs-12">
								<img style="width: 30%; height: auto" src="<?=base_url(); ?>/img/iconos/Ahorrador 193x139.png" alt="">
								<br><br>
								<p class="lato"><b>Ahorrador</b></p>
								<p> Recibes lo necesario para preparar las comidas ajustadas a tu plan nutricional.</p>
							</div>

							<div class="col-md-3 col-lg-3 col-sm-12 col-xs-12">
								<img style="width: 30%; height: auto" src="<?=base_url(); ?>/img/iconos/Flexible 193x141.png" alt="">
								<br><br>
								<p class="lato"><b>Flexible</b></p>
								<p>Los planes incluyen una amplia y variada selección de alimentos de todos los grupos.</p>
							</div>

							<div class="col-md-3 col-lg-3 col-sm-12 col-xs-12">
								<img style="width: 30%; height: auto" src="<?=base_url(); ?>/img/iconos/Sencillo 193x119.png" alt="">
								<br><br>
								<p class="lato"><b>Sencillo</b></p>
								<p>Al registrarte y completar unos sencillos datos, comienzas a disfrutar de los beneficios de una sana alimentación.</p>
							</div>

						</div>
					
					</div>




					<div style="background:#ffffff">
						<div class="container">
							<div class="row" style="margin-top: 1%; background:#ffffff">

					<div style="padding-bottom: 5%; padding-top: 5%;" class="col-lg-7 col-md-7">
						<div style="padding-top: 10%; padding-bottom: 40%; padding: 10%" class="">
								<img class="img-moviles" style="max-width: 100%;" src="<?=base_url(); ?>/img/Ceres/CERESPLATOSPREPARADOS-28.png" alt="">
						</div>
					</div>

					<div class="col-lg-5 text-white col-md-5 col-sm-12 col-xs-12">

					<div class="card text-white" style="height: 89%;background: #2a6d1f;margin-top: 9%;margin-right: 16%;margin-left: 3%;">
					<div class="text-center nunita"  style='text-align: center;font-size: 171%;line-height: 30px; margin-left: 5%; margin-right: 5%; margin-top: 16%!important;text-align: center;'> <span> Conoce tu índice de </span ><span class='colorgreen'> Masa Corporal</span></div>
							<div class="card-body">
							<div class="row" style="margin-top: 0%;">
								<div class="col-md-12 col-sm-12 col-xs-12"  style="margin-top: 0%;">


								<div id="sec1" style="display:inherit;">
																	<div class="row" style="text-align: center;">

																	</div>

																	<div class="row">

																		<div style="margin-top: 8%;" class="pesod row">
																			<div class="col-6">
																				<label class="lato" for="customRange1" style='font-size: 140%;'>Peso (kg): </label>
																			</div>
																			<div class="col-6">
																				<div class="" style="background: #dee2e6; color: black;     width: 86%;height: 102%;text-align: center; border-radius: 6px; border: solid 0px #9390ab; margin-left:-16%;">

																				<input class="lato form-control is-valid" type="number" value='1'  min="1" max="200"  id="valBox"   style="font-size: 87%;width: 100%;height: 100%;" required>

																				</div>
																			</div>

																			<div class="col-md-12 col-sm-12 col-xs-12" style='margin-top: 4%;'>
																				<input type="range" value='1'  min="1" max="200" step="1" class="custom-range" id="inVal" onchange="showVal()" >
																			</div>

																		</div>
																	</div>
																	<div class="row" style='margin-top: 4%;'>

																		<div class=" row">
																			<div class="col-6">
																				<label class="lato" for="customRange1" style='font-size: 140%;'>Altura (m): </label>
																			</div>
																			<div class="col-6">
																				<div class="" style="background: #dee2e6; color: black;   width: 86%;height: 102%;text-align: center; border-radius: 6px; border: solid 0px #9390ab; margin-left:-16%;">

																				<input class="lato form-control is-valid" type="number" value="0.1" min="0.1" max="3.0" step="0.1" required  id="valBoxAl" style="font-size: 87%;width: 100%;height: 100%;">

																				</div>
																			</div>

																			<div class="col-md-12 col-sm-12 col-xs-12" style='margin-top: 4%;'>

																				<input type="range" value='0.1'  min="0.1" max="3.0" step="0.1" class="custom-range" id="inValAl" onchange="showValAlt()" >
																			</div>

																		</div>
																	</div>
																	<div class="row">
																	<div class="col-md-12 col-sm-12 col-xs-12" style="     margin-top: 15%;">
																		<button id="btn1" style="background: #7dbe41; color:white" class="btn lato" type="button" name="button">&nbsp;Calcular&nbsp;</button>
																	</div>
																	</div>
																</div>




																<div id="sec2" style="display: none;"  style="margin-top: 0%;">
																	<div class="row"  style='font-size: 90%;'>

																	<div  class="col-3 col-sm-3 col-xs-3"  >
																	<div id="bajopesodiv" style="display:none; background: #dee2e6; color: black; width: 91%; height: 100%; text-align: center; border-radius: 4px; border: solid 1.5px #007bff">
																			<span  id="bajopeso"></span>
																		</div>
																	</div>
																	<div class="col-3 col-sm-3 col-xs-3" >
																	<div id="saludablediv" style="display:none; background: #dee2e6; color: black; width: 91%; height: 100%; text-align: center; border-radius: 4px; border: solid 1.5px #28a745"><span  id="saludable"></span></div>
																	</div>
																	<div class="col-3 col-sm-3 col-xs-3" >
																	<div id="sobrepesodiv" style="display:none; background: #dee2e6; color: black; width: 91%; height: 100%; text-align: center; border-radius: 4px; border: solid 1.5px #ffc107"><span  id="sobrepeso"></span></div>
																	</div>
																	<div class="col-3 col-sm-3 col-xs-3" >
																		<div id="obesodiv" style="display:none; background: #dee2e6; color: black; width: 91%; height: 100%; text-align: center; border-radius: 4px; border: solid 1.5px #dc3545">
																			<span  id="obeso"></span>
																		</div>
																	</div>
																	</div>

																	<div class="row">
																	<div class="col-md-12 col-sm-12 col-xs-12"  style="margin-top: 0%;">
																		<div class="progress bg-info">
																		<div class="progress-bar" role="progressbar" style="width: 25%" aria-valuenow="15" aria-valuemin="0" aria-valuemax="100"></div>

																		<div class="progress-bar bg-success"  role="progressbar" style="width: 25%" aria-valuenow="30" aria-valuemin="0" aria-valuemax="100"></div>

																		<div class="progress-bar bg-warning" role="progressbar" style="width: 25%" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100"></div>
																		<div class="progress-bar bg-danger" role="progressbar" style="width: 25%" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100"></div>
																		</div>
																	</div>
																	</div>

																	<div class="row" style='font-size: 65%;'>
																	<div class="col-3 col-sm-3 col-xs-3">
																		<label for="">Bajo Peso</label>
																	</div>
																	<div class="col-3 col-sm-3 col-xs-3">
																		<label for="">Saludable</label>
																	</div>
																	<div class="col-3 col-sm-3 col-xs-3">
																		<label for="">Sobre peso</label>
																	</div>
																	<div class="col-3 col-sm-3 col-xs-3">
																		<label for="">Obesidad</label>
																	</div>
																	</div>
																	<hr>
																	<div class="row" id="bajopesomsg" style="display:none; ">
																	<div class="col-md-12 col-sm-12 col-xs-12 lato">

																		<h4 class="card-text" style='font-size: 128%;'>Tu IMC está por debajo de 18,5 .</h4>
																		<p class="card-text" style='font-size: 100%;'>Alarga tu vida con una dieta balanceada y ejercicios . Recuerda que de tu bienestar depende tu salud.</p>

																	</div></div>
																	<div class="row" id="saludablemsg" style="display:none; ">
																	<div class="col-md-12 col-sm-12 col-xs-12 lato" style='font-size: 100%;' >

																		<h4 class="card-title" style='font-size: 120%;'>Tu IMC está entre 18.5 y 24.9.</h4>
																		<p class="card-text">Alarga tu vida con una dieta balanceada y ejercicios . Recuerda que de tu bienestar depende tu salud.</p>

																		</div>
																		</div>
																	<div class="row" id="sobrepesomsg" style="display:none; ">
																	<div class="col-md-12 col-sm-12 col-xs-12 lato" style='font-size: 100%;' >

																		<h4 class="card-title" style='font-size: 120%;'>Tu IMC está entre 25,0 y 29,9.</h4>
																		<p class="card-text">Alarga tu vida con una dieta balanceada y ejercicios . Recuerda que de tu bienestar depende tu salud.</p>

																		</div>
																		</div>
																	<div class="row" id="obesomsg" style="display:none; ">
																		<div class="col-md-12 col-sm-12 col-xs-12 lato" style='font-size: 100%;' >

																			<h4 class="card-title" style='font-size: 128%;'>Tu IMC sobrepasa los 30.</h4>
																			<p class="card-text">Alarga tu vida con una dieta balanceada y ejercicios . Recuerda que de tu bienestar depende tu salud .</p>

																		</div>
																	</div>
																	<br>
																	<div class="row">
																		<div class="col-md-12 col-sm-12 col-xs-12 lato" style=" margin-top: 3%;">
																			<button id="btn2" style="background: #7dbe41; color:white"  class="btn lato " type="button" name="button">Regresar</button>
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
					</div>

					<div class="">
						<div class="container">
							<div class="row">
								<div class="col-lg-7 col-md-7 col-sm-12 col-xs-12">

								</div>

							</div>
						</div>
					</div>

					<!-- DISPONIBLE EN APPLE Y GOOGLE  -->
					<div style="background: #e4e6e8; display: none;">
						<div class="container" >
							<div class="row" >
								<div style="padding-top: 3%;" class="col-sm-12 col-md-6 col-lg-6 col-xs-12 text-center" style="background: #e4e6e8">

									<img class="img-fluid" style="width: 80%; height: auto;" src="<?php echo base_url(); ?>img/Ceres/ceres_tel.png" class="d-block w-100" alt="...">

								</div>
								<div class="col-sm-12 col-md-6 col-lg-6   col-xs-12 texto" style="background: #e4e6e8">

								<div style='margin-top: 20%;'>
									<h2 class='nunita' style='line-height: 75px;  font-size: 215%;text-align: center;color:#2e2a3e'><b>Disponible para su descarga en</b></h2>
									<div class='row'>
										<div class='col-sm-6 col-md-6 col-xs-6 col-lg-6'>
											<img class="img-fluid" style="width: 100%; height: auto;" src="<?php echo base_url(); ?>img/appstore.png" alt="...">
										</div>

										<div class='col-sm-6 col-md-6 col-xs-6 col-lg-6'>
											<img class="img-fluid" style='width: 100%; height: auto;' src="<?php echo base_url(); ?>img/googleplay.png" alt="...">
										</div>
									</div>

								</div>

							</div>
						</div>
					</div>

				</div>


			</div>
			<div class="" style="background: #ffffff">
				<div class="container" style="padding-bottom: 4%;">
					<div class="row"style="margin-bottom:5%" >
						<div class="col-sm-12 col-md-12  col-xs-12 texto" style="text-align:center;margin-top: 7%;">

							<span class="" style="font-size: 156%;color: #36424A;" >Síguenos en Instagram  <a style="text-decoration: none;" href="https://www.instagram.com/ceresfresh/" target="_blank">@CeresFresh</a></span><br>
							<span class="" style=' font-size: 135%;color: #36424A;'>#SOMOSCERES #SOMOSFRESH  </span>

						</div>
					</div>

					<div class="row" id="instagramArea">
						
					</div>
				</div>


				</div>


				<div style="padding-top:2%" class="">

				</div>
				</div>

		</div>

		<script src="<?php echo base_url(); ?>js/js.js" type="text/javascript"></script>

		<script type="text/javascript">
			var sec1 = document.getElementById('sec1');
			var btn1 = document.getElementById('btn1');


			var sec2 = document.getElementById('sec2');
			var btn2 = document.getElementById('btn2');
			var valboxAl= false;
			var valbox=false;
			$(document).on('input', '#valBox', function(){

				var element = document.getElementById("valBox");
				if(document.getElementById("valBox").value!='')
				{
					document.getElementById("inVal").value=document.getElementById("valBox").value;

					element.className =' lato form-control is-valid';
					valbox = true;
				}
				else
				{
					element.className =' lato form-control is-invalid';
					valbox=false;
			    }

			});

			$(document).on('input', '#valBoxAl', function(){

				var element = document.getElementById("valBoxAl");
				if(document.getElementById("valBoxAl").value!='')
				{
					document.getElementById("inValAl").value=document.getElementById("valBoxAl").value;

					element.className =' lato form-control is-valid';
					valboxAl=true;
				}
				else
				{
					element.className =' lato form-control is-invalid';
					valboxAl= false;
			    }

			});


			//primra seccion

			btn1.addEventListener("click", function(){
				//;
				if( !valboxAl || !valbox) {

				}
				else
				{
						sec1.style.display = 'none';
						sec2.style.display = 'inherit';
						var Rangeweight = document.getElementById("valBox").value;
						var Rangeheight = document.getElementById("valBoxAl").value;


						var imc=Rangeweight/(Rangeheight*Rangeheight);
						imc=parseFloat(imc).toFixed(1);
						if(imc <18 )
						{

							document.getElementById("bajopesodiv").style.display = 'inherit';
							document.getElementById("obesodiv").style.display = 'none';
							document.getElementById("saludablediv").style.display = 'none';
							document.getElementById("sobrepesodiv").style.display = 'none';
							document.getElementById("bajopeso").innerHTML = imc;
							//Mensaje
							document.getElementById("bajopesomsg").style.display = 'inherit';
							document.getElementById("saludablemsg").style.display = 'none';
							document.getElementById("sobrepesomsg").style.display = 'none';
							document.getElementById("obesomsg").style.display = 'none';

						}
						else if(imc>=18 && imc<=24.9 ){
							document.getElementById("saludablediv").style.display = 'inherit';
							document.getElementById("bajopesodiv").style.display = 'none';
							document.getElementById("obesodiv").style.display = 'none';
							document.getElementById("sobrepesodiv").style.display = 'none';
							document.getElementById("saludable").innerHTML = imc;

							//Mensaje
							document.getElementById("bajopesomsg").style.display = 'none';
							document.getElementById("saludablemsg").style.display = 'inherit';
							document.getElementById("sobrepesomsg").style.display = 'none';
							document.getElementById("obesomsg").style.display = 'none';
						}
						else if(imc>=25 && imc<=29.9 ){
							document.getElementById("bajopesodiv").style.display = 'none';
							document.getElementById("saludablediv").style.display = 'none';
							document.getElementById("obesodiv").style.display = 'none';
							document.getElementById("sobrepesodiv").style.display = 'inherit';
							document.getElementById("sobrepeso").innerHTML = imc;

							//Mensaje
							document.getElementById("bajopesomsg").style.display = 'none';
							document.getElementById("saludablemsg").style.display = 'none';
							document.getElementById("sobrepesomsg").style.display = 'inherit';
							document.getElementById("obesomsg").style.display = 'none';
						}else {
							document.getElementById("bajopesodiv").style.display = 'none';
							document.getElementById("saludablediv").style.display = 'none';
							document.getElementById("sobrepesodiv").style.display = 'none';
							document.getElementById("obesodiv").style.display = 'inherit';
							document.getElementById("obeso").innerHTML = imc;

							//Mensaje
							document.getElementById("bajopesomsg").style.display = 'none';
							document.getElementById("saludablemsg").style.display = 'none';
							document.getElementById("sobrepesomsg").style.display = 'none';
							document.getElementById("obesomsg").style.display = 'inherit';
						}

					}

			});

			btn2.addEventListener("click", function(){

				sec1.style.display = 'inherit';
				sec2.style.display = 'none';


			});
			function showVal()
			{

			document.getElementById("valBox").value=document.getElementById("inVal").value;

			}
			function showValAlt()
			{

	 		document.getElementById("valBoxAl").value=document.getElementById("inValAl").value;

			}

			</script>
<script src="<?php echo base_url(); ?>js/instagram.js" type="text/javascript"></script>
