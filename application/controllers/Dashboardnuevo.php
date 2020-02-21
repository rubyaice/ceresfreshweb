<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Dashboardnuevo extends CI_Controller{

  public function __construct()
  {
    parent::__construct();

    $this->load->database();
		$this->load->helper('url');

    if (!$this->session->userdata('correo')) {
      redirect('login/login_view', 'refresh');
    }

  }

  //primera ejecucion de la app
  function index()
  {

    //correo que esta en sesion del ususario
    $correo_usuario = $_SESSION['correo'];


    //consulta para saber si el usuario esta afiliado si no se enviara el login para los metodos de pago o el ultimo paso donde se haya quedado
    if (isset($_SESSION['correo'])) {

      $correo_usuario = $_SESSION['correo'];

      $query = $this->db->query("SELECT ML.num_registro , correo,id_proveedor,nombre_proveedor,id_proceso FROM MA_LOGIN ML  INNER JOIN ESTATUS_REGISTRO_MA ER ON ML.num_registro = ER.num_registro WHERE ML.correo = '$correo_usuario'");
      $resultado = $query->row();
   
      switch ($resultado->id_proceso) {
        case '2':

          $this->load->view('headers/header_loged');
          $this->load->view('error_plan_nut');
          $this->load->view('footer/footer.php');

        break;
       
        default:

          //consulta a a tabla de afilaidos para obtener datos del usuario
          $cosulta_afiliado = $this->db->query("SELECT * FROM AFILIADOS WHERE correo = '$correo_usuario'");
          $respuesta_afiliado = $cosulta_afiliado->row();

          //consulta de segun el plan nutricional del usuario se mida la cantidad calorias diarias a quemar con ese plan
          $consulta_calorias_plan = $this->db->query("SELECT calorias_diaria FROM PLAN_NUTRICIONAL WHERE id_plan = '$respuesta_afiliado->plan_nut'");
          $respues_calorias_plan = $consulta_calorias_plan->row();

          $data['calorias_diaria'] = $respues_calorias_plan->calorias_diaria;

          //consulta para obtener datos de desayuno del plan nutricional del usuario suscrito
          $consulta_desayuno = $this->db->query("SELECT  cod_tipo_alimento , tipo_alimento as Tipo ,porcion as Cantidad  FROM vw_detalles_plan
          WHERE tipo_comida='DESAYUNO' and num_registro='$respuesta_afiliado->num_registro' and id_afiliacion='$respuesta_afiliado->id_afiliacion'");

          $respuesta_desayuno = $consulta_desayuno->result();

          //consulta para obtener datos de almuerzo del plan nutricional del usuario suscrito
          $consulta_almuerzo = $this->db->query("SELECT  cod_tipo_alimento , tipo_alimento as Tipo ,porcion as Cantidad  FROM vw_detalles_plan
          WHERE tipo_comida='ALMUERZO' and num_registro='$respuesta_afiliado->num_registro' and id_afiliacion='$respuesta_afiliado->id_afiliacion'");

          $respuesta_almuerzo = $consulta_almuerzo->result();

          //consulta para obtener datos de merienda de la mañana si es que existe del plan nutricional del usuario suscrito
          $consulta_merienda_1 = $this->db->query("SELECT  cod_tipo_alimento , tipo_alimento as Tipo ,porcion as Cantidad  FROM vw_detalles_plan
          WHERE tipo_comida='MERIENDA_1' and num_registro='$respuesta_afiliado->num_registro' and id_afiliacion='$respuesta_afiliado->id_afiliacion'");

          $respuesta_merienda_1 = $consulta_merienda_1->result();

          //consulta para obtener datos de merienda de la mañana si es que existe del plan nutricional del usuario suscrito
          $consulta_merienda_2 = $this->db->query("SELECT  cod_tipo_alimento , tipo_alimento as Tipo ,porcion as Cantidad  FROM vw_detalles_plan
          WHERE tipo_comida='MERIENDA_2' and num_registro='$respuesta_afiliado->num_registro' and id_afiliacion='$respuesta_afiliado->id_afiliacion'");

          $respuesta_merienda_2 = $consulta_merienda_2->result();

          //consulta para obtener datos de merienda de la mañana si es que existe del plan nutricional del usuario suscrito
          $consulta_cena = $this->db->query("SELECT  cod_tipo_alimento , tipo_alimento as Tipo ,porcion as Cantidad  FROM vw_detalles_plan
          WHERE tipo_comida='CENA' and num_registro='$respuesta_afiliado->num_registro' and id_afiliacion='$respuesta_afiliado->id_afiliacion'");

          $respuesta_cena = $consulta_cena->result();

          //--------------------------------------------------

          //datos que se enviaran a la vista del dashboardnuevo para mostrar el plan nutricional
          $data['desayuno'] = $respuesta_desayuno;
          $data['merienda_1'] = $respuesta_merienda_1;
          $data['almuerzo'] = $respuesta_almuerzo;
          $data['merienda_2'] = $respuesta_merienda_2;
          $data['cena'] = $respuesta_cena;


          $this->load->view('headers/header_loged');
          $this->load->view('dashboardnuevo', $data);
          $this->load->view('footer/footer.php');
          break;
      }

  }
}

  //metodo para recibir el tipo de alimento que eligio el usuario y devolverlo en un modal
  public function alimentos()
  {

    //correo que esta en sesion del ususario
    $correo_usuario = $_SESSION['correo'];

    //consulta a a tabla de afilaidos para obtener datos del usuario
    $cosulta_afiliado = $this->db->query("SELECT * FROM AFILIADOS WHERE correo = '$correo_usuario'");
    $respuesta_afiliado = $cosulta_afiliado->row();

    //consulta para obtener alimentos que se pueden consumir en el esayuno del usuario suscrito
    $tipo_alimento = $_POST['tipo_alimento'];

    $consulta_alimentos_desayuno = $this->db->query("SELECT * FROM PLAN_NUTRICIONAL_ALIMENTOS PA INNER JOIN MA_ALIMENTOS al ON PA.cod_alimento=al.cod_alimento WHERE id_plan='$respuesta_afiliado->plan_nut' AND tipo_alimento='$tipo_alimento'");

    $respuesta_alimentos_desayuno = $consulta_alimentos_desayuno->result();

    $html = '<div class="table-responsive">
    <table class="table table-striped">
      <tr>
        <th>Alimento</th>
        <th>Medida</th>
        <th>Cantidad</th>
        <th>Gramos</th>
      </tr>
      ';

    foreach ($respuesta_alimentos_desayuno as $result) {

      $html .= '
        <tr>
          <td>'.$result->descripcion.'</td>
          <td>'.$result->medida_practica.'</td>
          <td>'.$result->medida_practica_cant.'</td>
          <td>'.$result->unidad_cant.'</td>
        </tr>
      ';

    }

    $html .= ' 
      </table>
    </div>';

    $response = array( 'alimentos' => $html );

    echo json_encode($response);

  }

  //metodo qu permite ver el perfil del usuario, este permite ver los datos de que el usuario ingreso al registrarse
  public function vista_perfil()
  {

    $correo_usuario = $_SESSION['correo'];

    //consulta directa de los planes disponibles para que el suscriptor pueda elegir directamente
    $query = $this->db->query('SELECT * FROM PLAN_NUTRICIONAL');
    $results_pn = $query->result();


    //obtener tipo de actitud fisica que tine el suscriptor para grabar en la tabla de afiliacion

    $query = $this->db->query('SELECT * FROM PLAN_NUTRICIONAL_ACT_FISICA');
    $results_af = $query->result();

    //obtener si existe alguna aptitud especial en el usuario
    $query = $this->db->query('SELECT * FROM PLAN_NUTRICIONAL_CONDICION_ESPECIAL');
    $results_ce = $query->result();

    //consulta para verificar si existe suscripcion para este usuario
    $num_registro = $_SESSION['num_registro'];
		$suscrito = $this->db->query("SELECT * FROM AFILIADOS WHERE num_registro = '$num_registro'");
		$results_na = $suscrito->row();

    //definicion de variables que se eniaran a la vista para los select de los planes
    $data['actitud_fisica'] = $results_af;
    $data['condicion_especial'] = $results_ce;


    //envio del correo a la vista de perfil del uusario
    $data['correo'] = $correo_usuario;

    //consulta de datos del usuario para referencia del usuario al momento de actualizar sus datos
    $consulta_datos_afiliado = $this->db->query("SELECT af.correo, af.phone, af.id_afiliacion, af.apellido, af.nombre, af.edad, af.sexo, af.peso, af.estatura,pna.descripcion as act_fisica, pnc.descripcion as condicion_esp, pa.pais, es.estado, ciu.ciudad, sec.Sector, af.address, af.zipcode FROM AFILIADOS af INNER JOIN PAIS pa ON af.pais = pa.id_pais INNER JOIN ESTADOS es ON af.state = es.id_estado INNER JOIN CIUDADES ciu ON af.city = id_ciudad INNER JOIN SECTORES sec ON af.sector = sec.id INNER JOIN PLAN_NUTRICIONAL_ACT_FISICA pna ON af.act_fisica = pna.act_fisica INNER JOIN PLAN_NUTRICIONAL_CONDICION_ESPECIAL pnc ON af.condicion_esp = pnc.condicion_esp WHERE correo = '$correo_usuario'");

    $respuesta_datos_afiliado = $consulta_datos_afiliado->row();

    //obtener los paises
    $query = $this->db->query("SELECT * FROM PAIS");
    $results_pais= $query->result();

    //obtener los paises
    $query = $this->db->query("SELECT * FROM ESTADOS WHERE id_estado = '24'");
    $results_estados= $query->result();

    //obtener los paises
    $query = $this->db->query("SELECT * FROM CIUDADES WHERE id_ciudad = '149'");
    $results_ciudades= $query->result();

    //obtener los paises
    $query = $this->db->query("SELECT * FROM SECTORES");
    $results_sectores= $query->result();

    $data['pais'] = $results_pais;
    $data['estado'] = $results_estados;
    $data['ciudades'] = $results_ciudades;
    $data['sectores'] = $results_sectores;

    //datos enviados a la vista para referencia del usuario
    $data['id_afiliado'] = $respuesta_datos_afiliado->id_afiliacion;
    $data['nombre'] = $respuesta_datos_afiliado->nombre;
    $data['apellido'] = $respuesta_datos_afiliado->apellido;
    $data['edad'] = $respuesta_datos_afiliado->edad;
    $data['estatura'] = $respuesta_datos_afiliado->estatura;
    $data['sexo'] = $respuesta_datos_afiliado->sexo;
    $data['peso'] = $respuesta_datos_afiliado->peso;
    $data['act_fisica'] = $respuesta_datos_afiliado->act_fisica;
    $data['condicion_esp'] = $respuesta_datos_afiliado->condicion_esp;
    $data['phone_afiliado'] = $respuesta_datos_afiliado->phone;

    //------------------------------------
    $data['address_afiliado'] = $respuesta_datos_afiliado->address;
    $data['pais_afiliado'] = $respuesta_datos_afiliado->pais;
    $data['estado_afliado'] = $respuesta_datos_afiliado->estado;
    $data['ciudad_afiliado'] = $respuesta_datos_afiliado->ciudad;
    $data['sector_afiliado'] = $respuesta_datos_afiliado->Sector;
    $data['zipcode_afiliado'] = $respuesta_datos_afiliado->zipcode;


      $this->load->view('headers/header_loged');
      $this->load->view('perfil_usuario', $data);
      $this->load->view('footer/footer');

  }

  //metodo para comprobar el pago al momento de cargar la pagina dasboradnuevo
  public function comprobar_pago()
  {

    $num_registro = $_SESSION['num_registro'];
    $correo_usuario = $_SESSION['correo'];
    $semana_actual = $_SESSION['SemanaActual'];

    $consulta_pago = $this->db->query("SELECT transactioninvalid, semana, estatus, AF.correo FROM PAGO_MA PMA INNER JOIN pago_tr PTR ON PMA.codeorden = PTR.codeorden INNER JOIN AFILIADOS AF ON PMA.num_registro = AF.num_registro WHERE PMA.num_registro = '$num_registro' AND PTR.correo = '$correo_usuario' AND PTR.semana >= '$semana_actual' AND YEAR(GETDATE()) = DATEPART (YYYY , PTR.date) ORDER BY estatus ASC");

    $respuesta_pago = $consulta_pago->row();

    $html = '';

    //primero validamos que es lo que hay en carrito para en caso de que haya una caja solo redireccionamos al pago, si no hay cajas en carrito pasamos a validar el PAGO_TR para confirmar la ultima fecha en la que pago y reactivar y demas procedimiento 
    //-------------------------------------------
    $consulta_carrito_usuario_af = $this->db->query("SELECT * FROM CARRITO WHERE correo = '$correo_usuario' AND num_registro = '$num_registro'");
		
    $respuesta_carrito_usuario_af = $consulta_carrito_usuario_af->row();
    
    if ($respuesta_carrito_usuario_af != null) {

      if (isset($respuesta_pago->estatus) == "6") {
        
        $pago = 3;
        $html .= '';
        $respuesta_reactivar = 0;
        $respuesta_info = 0;

        //respuesta
        $response = array(

          'pago' => $pago,
          'respuesta_html' => $html,
          'respuesta_reactivar' => $respuesta_reactivar,
          'respuesta_info' => $respuesta_info
        );

        echo json_encode($response);
        return;

    }

      $consulta_pago_compra = $this->db->query("SELECT semana FROM PAGO_TR WHERE num_registro = '$num_registro' AND correo = '$correo_usuario' AND semana >= '$semana_actual' AND YEAR(GETDATE()) = DATEPART (YYYY , date) ORDER BY semana ASC");
      $resultado_pago_compra = $consulta_pago_compra->row();

      if ($resultado_pago_compra != null) {
        
        $semana_ult_pago = $resultado_pago_compra->semana;

        if ($semana_ult_pago >= $semana_actual) {
          
          $pago = 1;
          $html .= '';
          $respuesta_reactivar = 0;
          $respuesta_info = 0;

          //respuesta
          $response = array(

            'pago' => $pago,
            'respuesta_html' => $html,
            'respuesta_reactivar' => $respuesta_reactivar,
            'respuesta_info' => $respuesta_info
          );

          echo json_encode($response);

        }

        return;

      }
      
      $respuesta_reactivar = 2;
      $pago = false;
      $html .= '<h5>Realice los pagos correspondientes para disfrutar del Servicio de <b>Ceres<span style="color:#7dbe41;">fresh</span></b></h5>';

      //respuesta
      $response = array(

        'pago' => $pago,
        'respuesta_html' => $html,
        'respuesta_reactivar' => $respuesta_reactivar,
        
      );

      echo json_encode($response);

      return;

    }

    //---------------------------------------------------

    if ($respuesta_pago == null) {

      $pago = 0;
      $html .= '<h5>Realice los pagos correspondientes para disfrutar del Servicio de <b>Ceres<span style="color:#7dbe41;">fresh</span></b></h5>';
      $respuesta_reactivar = 1;

      //-------------------------------------------
      $consulta_carrito_usuario = $this->db->query("SELECT * FROM CARRITO WHERE correo = '$correo_usuario' AND num_registro = '$num_registro'");
		
      $respuesta_carrito_usuario = $consulta_carrito_usuario->row();
      
      if (!$respuesta_carrito_usuario == null) {
        
        $respuesta_reactivar = 2;

      }

      //respuesta
      $response = array(

        'pago' => $pago,
        'respuesta_html' => $html,
        'respuesta_reactivar' => $respuesta_reactivar,
        
      );

      echo json_encode($response);

      return;

    }

    if ($respuesta_pago->semana >= $semana_actual) {

      //respuesta con 0 es que el pago no esta procesado
      if ($respuesta_pago->transactioninvalid == "0" && $respuesta_pago->estatus == "5") {

        $pago = 0;
        $html .= '<h5>Tu pago se está procesando… por favor espera la aprobación.</h5>';
        $respuesta_reactivar = 0;

        //respuesta
        $response = array(

          'pago' => $pago,
          'respuesta_html' => $html,
          'respuesta_reactivar' => $respuesta_reactivar
        );

        echo json_encode($response);

        return;
      }
      
      //respuesta en caso de que el pago del usaurio haya sido rehazado
      if($respuesta_pago->estatus == "6") {

        $pago = 2;
        $html .= '';
        $respuesta_reactivar = 3;

        //respuesta
        $response = array(

          'pago' => $pago,
          'respuesta_html' => $html,
          'respuesta_reactivar' => $respuesta_reactivar
        );

        echo json_encode($response);

        return;

      }
      
      if($respuesta_pago->transactioninvalid == "0" && $respuesta_pago->estatus == "3") {

        $consulta_info_af_usuario = $this->db->query("SELECT * FROM INFO_AFILIACION WHERE correo = '$correo_usuario'");
        $respuesta_info_af_usaurio = $consulta_info_af_usuario->row();

        if ($respuesta_info_af_usaurio == null) {

          $pago = 1;
          $html .= '';
          $respuesta_reactivar = 0;
          $respuesta_info = 0;

          //respuesta
          $response = array(

            'pago' => $pago,
            'respuesta_html' => $html,
            'respuesta_reactivar' => $respuesta_reactivar,
            'respuesta_info' => $respuesta_info
          );

          echo json_encode($response);

          return;

        }else{

          $pago = 1;
          $html .= '';
          $respuesta_reactivar = 0;
          $respuesta_info = $respuesta_info_af_usaurio->estatus;

          //respuesta
          $response = array(

            'pago' => $pago,
            'respuesta_html' => $html,
            'respuesta_reactivar' => $respuesta_reactivar,
            'respuesta_info' => $respuesta_info
          );

          echo json_encode($response);

          return;

        }

      }

      $consulta_info_af_usuario = $this->db->query("SELECT * FROM INFO_AFILIACION WHERE correo = '$correo_usuario'");
        $respuesta_info_af_usaurio = $consulta_info_af_usuario->row();

        if ($respuesta_info_af_usaurio == null) {

          $pago = 1;
          $html .= '';
          $respuesta_reactivar = 0;
          $respuesta_info = 0;

          //respuesta
          $response = array(

            'pago' => $pago,
            'respuesta_html' => $html,
            'respuesta_reactivar' => $respuesta_reactivar,
            'respuesta_info' => $respuesta_info
          );

          echo json_encode($response);

          return;

        }else{

          $pago = 1;
          $html .= '';
          $respuesta_reactivar = 0;
          $respuesta_info = $respuesta_info_af_usaurio->estatus;

          //respuesta
          $response = array(

            'pago' => $pago,
            'respuesta_html' => $html,
            'respuesta_reactivar' => $respuesta_reactivar,
            'respuesta_info' => $respuesta_info
          );

          echo json_encode($response);

          return;

        }

        
    }

  }

  //metodo para llamar a la vista de cambio de clave desde el perfil por el momento
  public function vista_cambiar_clave()
  {
    
    $this->load->view('headers/header_loged');
    $this->load->view('cambiar_clave_perfil');
    $this->load->view('footer/footer');

  }

  //metodo para el cambio de contraseña por ahora desde el dashboard en la parte de perfil
  public function cambiar_clave()
  {
    
    $correo_usuario = $_POST['correo_usuario'];
    $proceso = "1";

    $pass = $_POST['pass1'];

    $token = bin2hex( openssl_random_pseudo_bytes(20) );
    $token_clave= hash('ripemd160', $pass);

    $data_clave = array(

      'clave' => $token_clave

    );

    $this->db->where('correo', $correo_usuario);
    $cambio_clave = $this->db->update('MA_LOGIN', $data_clave);

    $respuesta;
    
    if ($cambio_clave == false) {
      
      $respuesta = flase;

    }else{

      $this->load->library('enviaremail');
      $respuesta_correo = $this->enviaremail->enviar_correo($correo_usuario, $proceso);

      $respuesta_correo;

      $respuesta = true;      

    }

    //respuesta al ajax
    $response = array(

      'respuesta' => $respuesta
  
    );

    echo json_encode($response);

  }

  //metodo para agregar un nuevo item al carrito: esto en caso de que sea una nutribox
  public function agragar_al_carrito_view()
  {

    //llamado a la vista donde esta los procucotos
    $this->load->view('headers/header_loged');
    $this->load->view('agregar_producto_nutribox');
    $this->load->view('footer/footer');

  }

  public function cargar_categorias()
  {
    //$peticion = $_POST['peticion'];

    //consulta a lista de productos disponibles
    $consulta_categorias_productos = $this->db->query("SELECT * FROM MA_PRODUCTOS");
    $respuesta_categorias_productos = $consulta_categorias_productos->result();

    //recorrido por todos los productos que hay en pasillos

    $html_categorias = "";
    $html_categorias .= "<ul class='list-group'>";

    foreach ($respuesta_categorias_productos as $result) {
     
      $html_categorias .= "<li id=".$result->C_CODIGO." class='list-group-item'><a href='#' onclick='cargarlista_productos()'>".$result->C_DESCRI."</a></li>";

    }

    $html_categorias .= '</ul>';

    $response = array(

      'html_respuesta_categorias' => $html_categorias

    );

    echo json_encode($response);

  }

  //metodo para ver la lsita de productos que hay disponibles e cersfresh
  public function cargar_lista_productos()
  {
    //definicion de datos basicos del usuario
    //$peticion = $_POST['peticion'];
    $correo_usuario = $_SESSION['correo'];
    $num_registro = $_SESSION['num_registro'];

    //-----------------------------------------------------
    //SEGUNDO INTENTO

    //consulta en la para obtener el plan nutricional del usuario que esta en sesion
    $consulta_plan_usuario = $this->db->query("SELECT plan_nut FROM AFILIADOS WHERE correo = '$correo_usuario'");
    $resultado_plan_usuario = $consulta_plan_usuario->row();

    $plan_nut_usuario = $resultado_plan_usuario->plan_nut;

    //consulta para obtener los prductos disponibles
    $consulta_productos = $this->db->query("SELECT AF.num_registro, AF.correo, AF.id_afiliacion, AF.nombre, AF.apellido, AF.plan_nut, (SELECT C_CODIGO FROM MA_PRODUCTOS) AS codigo_prod, PN.precio AS precio_usd, PN.precio*(SELECT n_precio_m FROM MA_PRODUCTOS) AS precio_bs FROM AFILIADOS AF INNER JOIN PLAN_NUTRICIONAL PN ON AF.plan_nut = PN.id_plan WHERE num_registro = '$num_registro'");
    $respuesta_productos = $consulta_productos->result();

    $html_produtos = '';

    if ($respuesta_productos == null) {
      

      $html_produtos .= '<div class="text-center"><p>No hay productos dispononibles</p></div>';

      $response = array(

        'html_respuesta_producto' => $html_produtos

      );

      echo json_encode($response);
      return;

    }else{

      $img_url = base_url('img/Ceres/box.png');
      
      $consulta_precio_uds_plan = $this->db->query("SELECT precio FROM PLAN_NUTRICIONAL WHERE id_plan = '$plan_nut_usuario'");
      $resulta_precio_uds_plan = $consulta_precio_uds_plan->row();

      $precio_usd = $resulta_precio_uds_plan->precio;
      $html_produtos .= "<ul class='list-group'>";

      foreach ($respuesta_productos as $result) {
        
        $html_produtos .= "
        
          <li class='list-group-item'>
            <div class='row'>
              <div class='col-lg-6 col-md-6 col-sm-12 col-xs-12'>
                <div class='text-center'>
                  <img class='img-fluid' style='max-width: 50%; height: auto;' src='".$img_url."'>
                </div>
              </div>

              <div class='col-lg-6 col-md-6 col-sm-12 col-xs-12'>
                <div class='productoList'>
                  <b>".$result->nombre." ".$result->apellido."</b><br>
                  <span>Precio Bs: </span>".number_format($result->precio_bs, 2, '.',',')."<br>
                  <span>Precio USD: </span>".number_format($result->precio_usd, 2, '.',',')."<br><br>
                  <div class='row'>
                      <a style='color: #36434a;' onclick='quitarCaja(\"".$result->id_afiliacion."\")' class='menos".$result->id_afiliacion." btnMenos'><i class='material-icons'>remove_circle</i></a>
                              
                      <input id='".$result->id_afiliacion."' type='text' class='text-center inputV Valor".$result->id_afiliacion."' style='width: 60%; float: left;' value='1' readonly>
                              
                      <a style='color: #36434a;' onclick='agragarCaja(\"".$result->id_afiliacion."\")' class='mas".$result->id_afiliacion."'><i class='material-icons'>add_circle</i></a>
                  <div>
                  <br><br>
                  <div class='productoList'>
                    <a style='background: #7dbe41; color: white' class='btn btnAgregarCompra' onclick='agragarCompraCarrito(\"".$result->id_afiliacion."\", \"".$result->correo."\", \"".$result->codigo_prod."\", \"".$result->num_registro."\")'><div class='row'><i class='material-icons'>shopping_cart</i>&nbsp;Comprar</div></a>
                  </div>
                </div>
              </div>
            </div>
            
          </li>
        
        ";

      }

      $html_produtos .= "</ul>";

      $response = array(

        'html_respuesta_producto' => $html_produtos

      );

      echo json_encode($response);
      return;

    }
    

  }

  //metodo ara agragar una comrpa al carrito 
  public function agregar_compra()
  {

    $correo_afiliado = $_POST['correo_afiliado'];
    $id_afiliacion = $_POST['id_afiliacion'];
    $codigo_prod = $_POST['codigo_producto'];
    $num_registro = $_POST['num_registro'];
    $cantidad_nbox = $_POST['cantidad_nbox'];

    //-----------------------------------------------------
    
    //consulta para saber si hay alguna existencia de ese afiliado en carrito primero, si no hay nada pendiente con ese usuario se procede, sino se informa al usuario que tiene algo pendiente primero con ese afiliado.
    $cosulta_existencia_carrito = $this->db->query("SELECT * FROM CARRITO WHERE num_registro = '$num_registro' AND correo = '$correo_afiliado'");
    $respuesta_exitencia_carrito = $cosulta_existencia_carrito->row();

    //definicion de variables que cambiara al validar la respuesta que llega desde el query de carrito
    $html_response = 0;
    
    if ($respuesta_exitencia_carrito != null) {
      
      //resta que se da a la activacion
			$response = array(

				'respuesta_agregar' => $html_response
			);

      echo json_encode($response);
      return;

    }

    //-----------------------------------------------------

		$consulta_algo_en_carrito = $this->db->query("SELECT * FROM CARRITO WHERE num_registro = '$num_registro'");
		$respuesta_algo_carrito = $consulta_algo_en_carrito->result();

		//validacion de si hay algo en carrito, si hay algo en carrito entonces validare al usuario

		if ($respuesta_algo_carrito != null) {
			
			//consulta al carrito apra saber si el usuario ya esta ocn una caja por pagar y redireccionarlo a detalles pago para que haga los pagos correspondientes y no ser insertado nuevamente en el carrito por accidente

			$consulta_carrito_usuario = $this->db->query("SELECT * FROM CARRITO WHERE correo = '$correo_afiliado' AND num_registro = '$num_registro'");
			
			$respuesta_carrito_usuario = $consulta_carrito_usuario->row();

			$consulta_carrito_codeorden = $this->db->query("SELECT codeorder FROM CARRITO WHERE num_registro = '$num_registro'");
			$respuesta_carrito_codeorden = $consulta_carrito_codeorden->row();

			$codeorden_ult = $respuesta_carrito_codeorden->codeorder;

			if ($respuesta_carrito_usuario == null) {
			

			$this->load->model('functions_model');
			$OrderCode = $this->functions_model->GetCorrelative("ORDER_BOX",true);        
				
			//datos que se guardaran en carrito
			$data_carrito = array(

				'correo' => $correo_afiliado,
				'cantidad' => $cantidad_nbox,
				'num_registro' => $num_registro,
				'codeorder' => $codeorden_ult,
				'productcode'=> $codigo_prod// Codigo del único producto que existe Nutribox , en caso de añadir otro cambiar 

			);


			//generado de resuesta para enviar como resultado de validacion
			$respuesta_agregarbox_usuario = false;

			if ($this->db->insert('CARRITO', $data_carrito)) {
				
				$respuesta_agregarbox_usuario = true;

			}else{

				$respuesta_agregarbox_usuario = false;
			}


			if ($respuesta_agregarbox_usuario == true) {
				
				//cambio en la variable de activacion de afiliacion
				$html_response = 1;

				//resta que se da a la activacion
				$response = array(

					'respuesta_agregar' => $html_response
				);

				echo json_encode($response);

			} else {
				
				//cambio en la variable de activacion de afiliacion
				$html_response = 2;

				//resta que se da a la activacion
				$response = array(

					'respuesta_agregar' => $html_response
				);

				echo json_encode($response);

			}

		} else {

			//primero borramos todo lo que haya de carito para evitar errores y luego insertamos la nueva orden del carrito
			$this->db->where('correo', $correo_afiliado);
			$this->db->delete('CARRITO');


			$this->load->model('functions_model');
			$OrderCode = $this->functions_model->GetCorrelative("ORDER_BOX",true);        
				
			//datos que se guardaran en carrito
			$data_carrito = array(

				'correo' => $correo_afiliado,
				'cantidad' => $cantidad_nbox,
				'num_registro' => $num_registro,
				'codeorder' => $codeorden_ult,
				'productcode'=> $codigo_prod// Codigo del único producto que existe Nutribox , en caso de añadir otro cambiar 

			);


			//generado de resuesta para enviar como resultado de validacion
			$respuesta_agregarbox_usuario = false;

			if ($this->db->insert('CARRITO', $data_carrito)) {

				//en caso de que hayan mas productos en el carrito y tengan un codigo de orden distinto hago esto..
				$this->load->model('functions_model');
				$OrderCode = $this->functions_model->GetCorrelative("ORDER_BOX",true);

				$data_update_car = array(

					'codeorder' => $codeorden_ult

				);

				$this->db->where('num_registro', $num_registro);
				$this->db->update('CARRITO', $data_update_car);
				
				$respuesta_agregarbox_usuario = true;
				

			}else{

				$respuesta_agregarbox_usuario = false;
			}


			if ($respuesta_agregarbox_usuario == true) {
				
				//cambio en la variable de activacion de afiliacion
				$html_response = 1;

				//resta que se da a la activacion
				$response = array(

					'respuesta_agregar' => $html_response
				);

				echo json_encode($response);

			} else {
				
				//cambio en la variable de activacion de afiliacion
				$html_response = 2;

				//resta que se da a la activacion
				$response = array(

					'respuesta_agregar' => $html_response
				);

				echo json_encode($response);

			}

		}

		} else {

				//consulta al carrito apra saber si el usuario ya esta ocn una caja por pagar y redireccionarlo a detalles pago para que haga los pagos correspondientes y no ser insertado nuevamente en el carrito por accidente

				$consulta_carrito_usuario = $this->db->query("SELECT * FROM CARRITO WHERE correo = '$correo_afiliado' AND num_registro = '$num_registro'");
			
				$respuesta_carrito_usuario = $consulta_carrito_usuario->row();
	
				//definicion de variables que cambiara al validar la respuesta que llega desde el query de carrito
				$html_response = 0;
	
	
				if ($respuesta_carrito_usuario == null) {
				
				
	
				//respuesta de reactivacion de afiliacion de usuario
				//$respuesta_reactivacion_usuario = $this->activarafiliacion_model->activar_afiliacion_usuario($correo_usuario, $num_registro);
	
				$this->load->model('functions_model');
				$OrderCode = $this->functions_model->GetCorrelative("ORDER_BOX",true);        
					
				//datos que se guardaran en carrito
				$data_carrito = array(
	
					'correo' => $correo_afiliado,
					'cantidad' => $cantidad_nbox,
					'num_registro' => $num_registro,
					'codeorder' => $OrderCode,
					'productcode'=> $codigo_prod// Codigo del único producto que existe Nutribox , en caso de añadir otro cambiar 
	
				);

	
				//generado de resuesta para enviar como resultado de validacion
				$respuesta_agregarbox_usuario = false;
	
				if ($this->db->insert('CARRITO', $data_carrito)) {
					
					$respuesta_agregarbox_usuario = true;
					
				}else{
	
					$respuesta_agregarbox_usuario = false;
				}
	
	
				if ($respuesta_agregarbox_usuario == true) {
					
					//cambio en la variable de activacion de afiliacion
					$html_response = 1;
	
					//resta que se da a la activacion
					$response = array(
	
						'respuesta_agregar' => $html_response
					);
	
					echo json_encode($response);
	
				} else {
					
					//cambio en la variable de activacion de afiliacion
					$html_response = 2;
	
					//resta que se da a la activacion
					$response = array(
	
						'respuesta_agregar' => $html_response
					);
	
					echo json_encode($response);
	
				}
	
			} else {
	
				//primero borramos todo lo que haya de carito para evitar errores y luego insertamos la nueva orden del carrito
				$this->db->where('correo', $correo_afiliado);
				$this->db->delete('CARRITO');
	
				//respuesta de reactivacion de afiliacion de usuario
				//$respuesta_reactivacion_usuario = $this->activarafiliacion_model->activar_afiliacion_usuario($correo_usuario, $num_registro);
	
				$this->load->model('functions_model');
				$OrderCode = $this->functions_model->GetCorrelative("ORDER_BOX",true);        
					
				//datos que se guardaran en carrito
				$data_carrito = array(
	
					'correo' => $correo_afiliado,
					'cantidad' => $cantidad_nbox,
					'num_registro' => $num_registro,
					'codeorder' => $OrderCode,
					'productcode'=> $codigo_prod// Codigo del único producto que existe Nutribox , en caso de añadir otro cambiar 
	
				);
	
				//generado de resuesta para enviar como resultado de validacion
				$respuesta_agregarbox_usuario = false;
	
				if ($this->db->insert('CARRITO', $data_carrito)) {
	
					//en caso de que hayan mas productos en el carrito y tengan un codigo de orden distinto hago esto..
					$this->load->model('functions_model');
					$OrderCode = $this->functions_model->GetCorrelative("ORDER_BOX",true);
	
					$data_update_car = array(
	
						'codeorder' => $OrderCode
	
					);
	
					$this->db->where('num_registro', $num_registro);
					$this->db->update('CARRITO', $data_update_car);
					
					$respuesta_agregarbox_usuario = true;					
	
				}else{
	
					$respuesta_agregarbox_usuario = false;
				}
	
	
				if ($respuesta_agregarbox_usuario == true) {
					
					//cambio en la variable de activacion de afiliacion
					$html_response = 1;
	
					//resta que se da a la activacion
					$response = array(
	
						'respuesta_agregar' => $html_response
					);
	
					echo json_encode($response);
	
				} else {
					
					//cambio en la variable de activacion de afiliacion
					$html_response = 2;
	
					//resta que se da a la activacion
					$response = array(
	
						'respuesta_agregar' => $html_response
					);
	
					echo json_encode($response);
	
				}
	
			}

		}


    

  }

  //metodo apra guardar estatus de si el usuario quiere ver el modal de informacion de afiliacion o no
  public function actualizar_info_afiliacion()
  {
    
    $seleccionado = $_POST['seleccionado'];
    $correo_usuario = $_SESSION['correo'];

    //comprobar primero si el usuario existe en la tabla
    $consulta_info_usuario = $this->db->query("SELECT * FROM INFO_AFILIACION WHERE correo = '$correo_usuario'");
    $respuesta_info_usaurio = $consulta_info_usuario->row();

    //comprobacion de si el ousuario existe
    if ($respuesta_info_usaurio == null) {
      
        $data_info = array(

          'correo' => $correo_usuario,
          'estatus' => $seleccionado

        );

        //en caso de que no exista se agraga a la tabla
        if ($this->db->insert('INFO_AFILIACION', $data_info)) {
          
          $respuesta = 1;
          $response = array(

            'respuesta' => $respuesta

          );

          echo json_encode($response);

        }

    }else{

      $data_info_update = array(

        'estatus' => $seleccionado

      );

      //en caso de que exista se actualiza en la tabla
      $this->db->where('correo', $correo_usuario);

      if ($this->db->update('INFO_AFILIACION', $data_info_update)) {
        
        $respuesta = 1;
        $response = array(

          'respuesta' => $respuesta

        );

        echo json_encode($response);

      }

    }
  }

  // metodo para verificar cuantos dias le falta al cliente para pagar
  public function dias_para_pagar()
  {
    
    $correo_usuario = $_SESSION['correo'];
    //semana actual
    $semana_actual = date("W");

    // consulta para conseguir fecha de ultomo pago
    $cosultsa_fecha_pago_us = $this->db->query("SELECT semana FROM PAGO_TR WHERE correo = '$correo_usuario' ORDER BY semana DESC");
    $respuesta_fecha_pago_us = $cosultsa_fecha_pago_us->row();

    // comprobar si existe una ultima fecha de pago
    if ($respuesta_fecha_pago_us == null) {
      
      // respuesta en caso de que el usaurio tenga un pago pendiente
      $respuesta_pago_html = 0;
      $html = "<div class='text-center texto-toast'>Semana pendiente por pagar</div>";
      
      $response = array(

        'respuesta_pago_html' => $respuesta_pago_html,
        'html_response' => $html
      );

      echo json_encode($response);
      return;

    }

    // ultima semana de pago
    $semana_ultimo_pago = $respuesta_fecha_pago_us->semana;

    if ($semana_actual > $semana_ultimo_pago) {
      
      // respuesta en caso de que el usaurio tenga un pago pendiente
      $respuesta_pago_html = 0;
      $html = "<div class='text-center texto-toast'>Semana pendiente por pagar</div>";
      
      $response = array(

        'respuesta_pago_html' => $respuesta_pago_html,
        'html_response' => $html
      );

      echo json_encode($response);
      return;

    }

    $dia_actual = date("w");
    $dias_para_pagar = 7 - $dia_actual;

    // respuesta en caso de que todo vaya bastante bien
    $respuesta_pago_html = 1;
    $html = "<div class='text-center texto-toast'>Esperamos que hayas disfrutado tu experiencia con Ceres Fresh! Dentro de ".$dias_para_pagar." días podrás realizar nuevamente tu compra semanal.</div>";
    
    $response = array(

      'respuesta_pago_html' => $respuesta_pago_html,
      'html_response' => $html
    );

    echo json_encode($response);

  }

  // metodo para comprobar si el usuario tiene un plan nutricional .. y asignale uno
  public function comprobar_plan_usuario()
  {

    $respuesta_comprobar_plan_html = "Estimado cliente, no se le ha asignado un plan nutricional, por favor pulse <b>Aceptar</b> para culminar su registro.";

    $resp_comprobar_plan = 1;

    $response = array(

      'respuesta_comprobar_plan_html' => $respuesta_comprobar_plan_html,
      'resp_comprobar_plan' => $resp_comprobar_plan

    );

    echo json_encode($response);

  }

}
