<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
 
    <link rel="stylesheet" href="<?php echo base_url(); ?>css/admin/materialize.min.css">
    <script src="<?php echo base_url(); ?>js/admin/jquery.min.js"></script>
    <script src="<?php echo base_url(); ?>/js/admin/materialize.min.js"></script>
    <script src="<?php echo base_url(); ?>js/admin/js.js"></script>
    <link rel="stylesheet" href="<?php echo base_url(); ?>css/admin/admin.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <script>var base_url = '<?php echo base_url() ?>';</script>
    <title>Admin Console</title>
</head>
<body>
    <header>
        
    <ul id="Menu-Usuario" class="dropdown-content">
        <li><a href="<?php echo site_url(); ?>/admin">Inicio</a></li>
        <li><a href="<?php echo site_url(); ?>/admin/Users/getuserslist">Usuarios</a></li>
        <li class="divider"></li>   
        <li><a href="<?php echo site_url(); ?>/admin/login/logout">Logout</a></li>
    </ul>

    <ul id="Menu-Tienda" class="dropdown-content">
        <li><a href="<?php echo site_url(); ?>/admin/Ventas/reglas_de_negocio_view">Reglas de Negocio</a></li>
        <li><a href="<?php echo site_url(); ?>/admin/Ventas/configurar_contactos_view">Configurar contactos</a></li>
    </ul>

    <ul id="Menu-Productos" class="dropdown-content">
        <li><a href="inventario.php">Ficha</a></li>        
    </ul>

    <ul id="Menu-Administracion" class="dropdown-content">
        <li><a href="Content.php">Contenidos</a></li>
        <li><a href="tiendas.php">Tiendas</a></li>
        <!-- <li><a href="correos.php">Correos</a></li>!-->
        <!--<li><a href="Reglas.php">Reglas de Negocio</a></li>!-->       
         
    </ul>
    <nav>
        <div class="nav-wrapper">
            <div class="container">
                <a href="<?php echo site_url(); ?>/admin" class="brand-logo">
                    <img src="<?php echo base_url(); ?>img/stellar_webstore_positivo.svg" alt="">    
                </a>
                <a href="#" data-target="mobile" class="sidenav-trigger"><i class="material-icons">menu</i></a>
                <ul id="nav-mobile" class="right hide-on-med-and-down">     
                   <!-- <li><a href="Reglas.php">Reglas del Negocio</a></li>            
                    <li><a class="dropdown-trigger" href="#!" data-target="Menu-Administracion">Configuración del Sitio<i class="material-icons right">arrow_drop_down</i></a></li>
                 <!--   <li><a class="dropdown-trigger" href="#!" data-target="Menu-Pedidos">Pedidos<i class="material-icons right">arrow_drop_down</i></a></li>!-->
                 <!--   <li><a class="dropdown-trigger" href="#!" data-target="Menu-Productos">Productos<i class="material-icons right">arrow_drop_down</i></a></li>!-->


                    <!--<li><a class="" href="<?php echo site_url(); ?>/admin/ventas/mis_gustos_usuario_view">Administrar Gustos</a></li>-->

                    <li><a class="dropdown-trigger" href="#!" data-target="Menu-Tienda">Administrar Tienda<i class="material-icons right">arrow_drop_down</i></a></li>

                    <li><a class="dropdown-trigger" href="#!" data-target="Menu-Usuario">Inicio<i class="material-icons right">arrow_drop_down</i></a></li>
                    
                </ul>
                <ul class="sidenav" id="mobile">
                    <li><a href="<?php echo site_url(); ?>/admin">Inicio</a></li>
                    <li><a href="<?php echo site_url(); ?>/admin/Users/getuserslist">Usuarios</a></li>
                    <li><a href="<?php echo site_url(); ?>/admin/Ventas/reglas_de_negocio_view">Reglas de Negocio</a></li>
                    <li><a href="<?php echo site_url(); ?>/admin/Ventas/configurar_contactos_view">Configurar contactos</a></li>
                    <!--<li><a href="<?php echo site_url(); ?>/admin/ventas/mis_gustos_usuario_view">Administrar Gustos</a></li>-->
                    <li><a href="<?php echo site_url(); ?>/admin/login/logout">Logout</a></li>
                </ul>
           <!-- <a href="index.php"><i class="material-icons">border_all</i></a> !-->
           </div>
        </div>
    </nav>
    </header>