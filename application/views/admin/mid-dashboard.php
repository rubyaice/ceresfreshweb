<main>
    <div class="container">
        <div class="row">
                

                <div  id="clickeable" onclick="location.href='<?php echo site_url(); ?>/admin/ventas/Autorizar';" style="cursor:pointer"  class="col s12 m6">
                    <div class="card">
                        <div class="card-action Marron-modulo white-text">
                        <div class="row">
                                <div class="col s6">
                                    <h5>Pagos por Aprobar</h5>
                                    
                                </div>
                                <div class="col s6 right-align">
                                    <h6>PASO 1</h6>
                                </div>
                            </div>
                        </div>
                        <div class="card-content Marron-modulo white-text">
                        <strong><h4 class="" id="PedientesPago"></h4></strong> <!--Pedidos !-->
                        <p><?php  
                            $idioma = substr($_SERVER['HTTP_ACCEPT_LANGUAGE'], 0, 2);
                            if($idioma=='es')
                            {                        
                                $meses = array("Enero","Febrero","Marzo","Abril","Mayo","Junio","Julio","Agosto","Septiembre","Octubre","Noviembre","Diciembre");
                                echo $meses[date('n')-1]. ", ".date('Y') ;
                            }
                           
                            ?></p>
                        </div>
                    </div>
                </div>
               
                
                <!--<div  id="clickeable" onclick="location.href='<?php echo base_url(); ?>inventario.php';" style="cursor:pointer" class="col s12 m6">
                
                    <div class="card">
                        <div class="card-action Morado-modulo white-text">
                            <h6>Productos</h6>
                            <a href="<?php echo base_url(); ?>inventario.php" class="btn-floating halfway-fab waves-effect waves-light transparent iconos-dashboar">
                                <img src="<?php echo base_url(); ?>/img/icono_inventario.svg" alt="">
                            </a>
                        </div>
                        <div class="card-content Morado-modulo white-text">
                        <strong><h4 class="" id="CantidadInventario"></h4></strong><!--Unidades !-->
                       <!-- <p><?php  
                            $idioma = substr($_SERVER['HTTP_ACCEPT_LANGUAGE'], 0, 2);
                            if($idioma=='es')
                            {                        
                                $meses = array("Enero","Febrero","Marzo","Abril","Mayo","Junio","Julio","Agosto","Septiembre","Octubre","Noviembre","Diciembre");
                                echo $meses[date('n')-1]. ", ".date('Y') ;
                            }
                          
                            ?></p>
                        </div>
                    </div>
                </div>
               
        </div>!-->

        <!--////////////////////////////////////////////////////// -->
        

                <div  id="clickeable" onclick="location.href='<?php echo site_url(); ?>/admin/ventas';" style="cursor:pointer"  class="col s12 m6">
                    <div class="card">
                        <div class="card-action Azul-modulo white-text">
                        <div class="row">
                                <div class="col s7">
                                    <h5>Pendientes por Preparar</h5>
                                    
                                </div>
                                <div class="col s5 right-align">
                                    <h6>PASO 2</h6>
                                </div>
                            </div>
                        </div>
                        <div class="card-content Azul-modulo white-text">
                        <strong><h4 class="" id="CantidadPedidos"></h4></strong> <!--Pedidos !-->
                        <p><?php  
                            $idioma = substr($_SERVER['HTTP_ACCEPT_LANGUAGE'], 0, 2);
                            if($idioma=='es')
                            {                        
                                $meses = array("Enero","Febrero","Marzo","Abril","Mayo","Junio","Julio","Agosto","Septiembre","Octubre","Noviembre","Diciembre");
                                echo $meses[date('n')-1]. ", ".date('Y') ;
                            }
                           
                            ?></p>
                        </div>
                    </div>
                </div>
        
                
        </div>

        <!--////////////////////////////////////////////////////// -->
       
        <div class="row">

        <div  id="clickeable" onclick="location.href='<?php echo site_url(); ?>/admin/ventas/Procesada';" style="cursor:pointer" class="col s12 m6">
                    <div class="card">
                        <div class="card-action Verde-modulo white-text">
                            <div class="row">
                                <div class="col s6">
                                    <h5>Pendientes por Enviar</h5>
                                    
                                </div>
                                <div class="col s6 right-align">
                                    <h6>PASO 3</h6>
                                </div>
                            </div>
                        </div>
                        <div class="card-content Verde-modulo white-text">
                        <strong><h4 class="" id="MontoVentas"></h4></strong><!--$ !-->
                        <p><?php  
                            $idioma = substr($_SERVER['HTTP_ACCEPT_LANGUAGE'], 0, 2);
                            if($idioma=='es')
                            {                        
                                $meses = array("Enero","Febrero","Marzo","Abril","Mayo","Junio","Julio","Agosto","Septiembre","Octubre","Noviembre","Diciembre");
                                echo $meses[date('n')-1]. ", ".date('Y') ;
                            }
                           
                            ?>
                        </p>
                                                                            
                        </div>
                    </div>
                </div>


                <!-- //////////////////////////////////////////////////////////// -->
                  
                

                <div  id="clickeable" onclick="location.href='<?php echo site_url(); ?>/admin/ventas/Enviada';" style="cursor:pointer"  class="col s12 m6">
                    <div class="card">
                        <div class="card-action Morado-modulo white-text">
                            <div class="row">
                                <div class="col s6">
                                    <h5>Enviados</h5>
                                    
                                </div>
                                <div class="col s6 right-align">
                                    <h6>PASO 4</h6>
                                </div>
                            </div>
                        </div>
                        <div class="card-content Morado-modulo white-text">
                        <strong><h4 class="" id="Enviados"></h4></strong> <!--Pedidos !-->
                        <p><?php  
                            $idioma = substr($_SERVER['HTTP_ACCEPT_LANGUAGE'], 0, 2);
                            if($idioma=='es')
                            {                        
                                $meses = array("Enero","Febrero","Marzo","Abril","Mayo","Junio","Julio","Agosto","Septiembre","Octubre","Noviembre","Diciembre");
                                echo $meses[date('n')-1]. ", ".date('Y') ;
                            }
                           
                            ?></p>
                        </div>
                    </div>
                </div>

                

                <div  id="clickeable" onclick="location.href='<?php echo site_url(); ?>/admin/ventas/Entregado';" style="cursor:pointer"  class="col s12 m6">
                    <div class="card">
                        <div class="card-action Verde-modulo white-text">
                            <div class="row">
                                <div class="col s6">
                                    <h5>Entregados</h5>
                                    
                                </div>
                                <div class="col s6 right-align">
                                    <h6>PASO 5</h6>
                                </div>
                            </div>
                        </div>
                        <div class="card-content Verde-modulo white-text">
                        <strong><h4 class="" id="Entregados"></h4></strong> <!--Pedidos !-->
                        <p><?php  
                            $idioma = substr($_SERVER['HTTP_ACCEPT_LANGUAGE'], 0, 2);
                            if($idioma=='es')
                            {                        
                                $meses = array("Enero","Febrero","Marzo","Abril","Mayo","Junio","Julio","Agosto","Septiembre","Octubre","Noviembre","Diciembre");
                                echo $meses[date('n')-1]. ", ".date('Y') ;
                            }
                           
                            ?></p>
                        </div>
                    </div>
                </div>
                
                <!-- //////////////////////////////////////////////////////////// -->

                <div id="clickeable" onclick="location.href='<?php echo site_url(); ?>/admin/ventas/devoluciones';" style="cursor:pointer" class="col s12 m6">
                    <div class="card">
                        <div class="card-action Rojo-modulo white-text">
                        <div class="row">
                                <div class="col s6">
                                    <h5>Pagos Rechazados</h5>
                                    
                                </div>
                                <div class="col s6 right-align">
                                    <p>transacciones fallidas del usuario.</p>
                                </div>
                            </div>
                        </div>
                        <div class="card-content Rojo-modulo white-text">
                        <strong><h4 class="" id="MontoDevoluciones"></h4></strong><!--$ !-->
                        <p><?php  
                            $idioma = substr($_SERVER['HTTP_ACCEPT_LANGUAGE'], 0, 2);
                            if($idioma=='es')
                            {                        
                                $meses = array("Enero","Febrero","Marzo","Abril","Mayo","Junio","Julio","Agosto","Septiembre","Octubre","Noviembre","Diciembre");
                                echo $meses[date('n')-1]. ", ".date('Y') ;
                            }
                         
                            ?></p>
                        </div>
                    </div>
                </div>

                
                
        </div>
                
        </div>
                
        </div>
                            
        <!-- ////////////////////////////////////////////////////// -->

        
        
        <!--<div class="row">
                <div id="clickeable" onclick="location.href='<?php echo base_url(); ?>content.php';" style="cursor:pointer" class="col s12 m6">
                    <div class="card">
                        <div class="card-action Marron-modulo white-text">
                            <h6>Contenido</h6>
                            <a href="<?php echo base_url(); ?>content.php" class="btn-floating halfway-fab waves-effect waves-light transparent iconos-dashboar">
                                <img src="<?php echo base_url(); ?>img/content.svg" alt="">
                            </a>
                        </div>
                        <div class="card-content Marron-modulo white-text">
                        <strong><h4 class="" id="MbContenido"></h4></strong><!--$ !-->
                        <!--<p>Mb usados.</p>
                        </div>
                    </div>
                </div>
                  
           
        </div>
    </div>!-->
    <script src="<?php echo base_url(); ?>js/admin/dashboard.js"></script>
</main>