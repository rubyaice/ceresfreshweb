<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Afiliadoscontrol extends CI_Controller {

  public function __construct()
  {
    parent::__construct();

    $this->load->helper('url');
    $this->load->database();

    //validacion si el usuario esa registrado
    if (!$this->session->userdata('correo')) {
      redirect('login/login_view');
    }
  }

  //primera ejecucion de esta secccion
	public function index()
	{


    //obtener momentanamente el numero de registro del usuario para afiliarlo a ese numero de registro
    $correo_usuario = $_SESSION['correo'];

    $consulta_num_registro_usuario = $this->db->query("SELECT num_registro FROM AFILIADOS WHERE correo = '$correo_usuario'");
    $respuesta = $consulta_num_registro_usuario->row();


    $this->session->set_userdata('num_registro', $respuesta->num_registro);

    $num_registro = $_SESSION['num_registro'];

    //consulta para obtener los afiliados del suaurio registrado
    $consulta_afiliados_usuario = $this->db->query("SELECT AF.id_afiliacion,  AF.nombre, AF.apellido, AF.edad, AF.sexo, AF.peso, AF.estatura, ACT.descripcion as act_fisica, COE.descripcion as condicion_esp, AF.plan_nut, AF.correo, AF.phone FROM AFILIADOS AF INNER JOIN PLAN_NUTRICIONAL_ACT_FISICA ACT ON AF.act_fisica = ACT.act_fisica INNER JOIN PLAN_NUTRICIONAL_CONDICION_ESPECIAL COE ON AF.condicion_esp = COE.condicion_esp  WHERE num_registro = '$num_registro' AND correo <> '$correo_usuario'");
    $resultado_afiliados_usuario = $consulta_afiliados_usuario->result();

    $data['afiliados_usuario'] = $resultado_afiliados_usuario;

    $this->load->view('headers/header_loged');
    $this->load->view('afiliados_usuario', $data);
    $this->load->view('footer/footer');


	}

  //metodo de controlador para llevar a cabo la eliminacion de un afiliado del usuario suscriptor, este recibe como parametro un id de afiliado que ien de la lista de afiliados  la envia al modelo para que haga la gestion con la base de datos.

  public function eliminar_afiliado()
  {

    $id_afiliado = $_POST['id_afiliado'];
    $correo_del_afiliado = $_POST['correo_del_afiliado'];

    //valisdacion de si existe un id entrante del afiliado
    if (isset($id_afiliado)) {

      //llamado del modelo en caso verdadero
      $this->load->model('afiliados_usuario_model');

      //paso de parametro recibido desde la vista para ser procesado por el modelo
      if (!$this->afiliados_usuario_model->eliminar_afiliado_consulta($id_afiliado, $correo_del_afiliado)) {


        $html = '';

        $response = array( 'respuesta' => $html );

        echo json_encode($response);

      }
    }
  }


  //funcion que llama la vista de acualizacion de afiliado pero a su vez recibe un parametro de la tabla de afiliados el cual enviara a la vista de actualizacion para definirlo en un campo hidden
  public function vista_actualiar($id_afiliado)
  {

    //validacion momentanea de si existe un parametro entrante o no
    if (!isset($id_afiliado)) {

      redirect('afiliadoscontrol', 'refresh');

    }

    $id_afiliado = base64_decode($id_afiliado);


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

    //definicion de variables que se eniaran a la vista para los select de los planes
    $data['actitud_fisica'] = $results_af;
    $data['condicion_especial'] = $results_ce;
    $data['num_registro_afiliado'] = $results_na->num_registro;


    //envio del id_afiliado a la vista de actualizacion de afiliado
    $data['id_afiliado'] = $id_afiliado;

    //consulta de datos del afiliado para referencia del usuario al momento de actualizar sus datos
    $consulta_datos_afiliado = $this->db->query("SELECT af.correo, af.phone, af.id_afiliacion, af.apellido, af.nombre, af.edad, af.sexo, af.peso, af.estatura,pna.descripcion as act_fisica, pnc.descripcion as condicion_esp, pa.pais, es.estado, ciu.ciudad, sec.Sector, af.address, af.zipcode FROM AFILIADOS af INNER JOIN PAIS pa ON af.pais = pa.id_pais INNER JOIN ESTADOS es ON af.state = es.id_estado INNER JOIN CIUDADES ciu ON af.city = id_ciudad INNER JOIN SECTORES sec ON af.sector = sec.id INNER JOIN PLAN_NUTRICIONAL_ACT_FISICA pna ON af.act_fisica = pna.act_fisica INNER JOIN PLAN_NUTRICIONAL_CONDICION_ESPECIAL pnc ON af.condicion_esp = pnc.condicion_esp WHERE id_afiliacion = '$id_afiliado'");
    $respuesta_datos_afiliado = $consulta_datos_afiliado->row();

    //datos enviados a la vista para referencia del usuario
    $data['correo'] = $respuesta_datos_afiliado->correo;
    $data['nombre'] = $respuesta_datos_afiliado->nombre;
    $data['apellido'] = $respuesta_datos_afiliado->apellido;
    $data['edad'] = $respuesta_datos_afiliado->edad;
    $data['estatura'] = $respuesta_datos_afiliado->estatura;
    $data['sexo'] = $respuesta_datos_afiliado->sexo;
    $data['peso'] = $respuesta_datos_afiliado->peso;
    $data['act_fisica'] = $respuesta_datos_afiliado->act_fisica;
    $data['condicion_esp'] = $respuesta_datos_afiliado->condicion_esp;
    $data['phone'] = $respuesta_datos_afiliado->phone;


    //------------------------------------
    $data['address_afiliado'] = $respuesta_datos_afiliado->address;
    $data['pais_afiliado'] = $respuesta_datos_afiliado->pais;
    $data['estado_afliado'] = $respuesta_datos_afiliado->estado;
    $data['ciudad_afiliado'] = $respuesta_datos_afiliado->ciudad;
    $data['sector_afiliado'] = $respuesta_datos_afiliado->Sector;
    $data['zipcode_afiliado'] = $respuesta_datos_afiliado->zipcode;


      $this->load->view('headers/header_loged');
      $this->load->view('actualizar_afiliado', $data);
      $this->load->view('footer/footer');

  }

  //metodo para actualizar afiliado, este recibira los post qu se enviaran al modelo para la accion en la base de datos
  public function actualizar_afiliado()
  {

    //validacion de si esta viniendo por post todos lo campos solicitados

    //respuesta que se enviara añ ajax para ser procesada
    $respuesta;

    if ($_POST['id_afiliado'] && $_POST['nombre_perfil'] && $_POST['apellido_perfil'] && $_POST['edad'] && $_POST['peso'] && $_POST['estatura'] && $_POST['act_fisica'] && $_POST['condicion_esp'] && $_POST['phone'] && $_POST['pais_reg'] && $_POST['ciudad_reg'] && $_POST['codigopostal_reg'] && $_POST['estado_reg'] && $_POST['direccion_reg'] && $_POST['sector_reg']) {

      //llamada del modelo que hara la consulta a la base de datos para actualizar al afiliado
      $this->load->model('afiliados_usuario_model');

      //metodo dentro del modelo que realiza la funion de actualizar al afiliado
      if (!$this->afiliados_usuario_model->actualizar_afiliado_consulta($_POST['id_afiliado'], $_POST['nombre_perfil'], $_POST['apellido_perfil'], $_POST['edad'], $_POST['peso'], $_POST['estatura'], $_POST['act_fisica'], $_POST['condicion_esp'], $_POST['phone'], $_POST['pais_reg'], $_POST['ciudad_reg'], $_POST['codigopostal_reg'], $_POST['estado_reg'], $_POST['direccion_reg'], $_POST['sector_reg'])) {

        //definicion de la respuesta en caso de que la consulta con la base de datos se positiva
        $respuesta = true;

        //respuesta
        $response = array(

          'respuesta' => $respuesta
        );

        echo json_encode($response);

      }else {

        //definicion de la respuesta en caso de que la consulta con la base de datos falle
        $respuesta = false;

        //respuesta
        $response = array(

          'respuesta' => $respuesta
        );

        echo json_encode($response);

      }

    }

  }

  //metodo para ver los detalles del plan nutricional del afilido este recibe como parametro el id_afiliado con el id del afiliado enviando desde la tabla que muestra todos los afiliados con base a ese id se hae la consulta para traer de vuelta los detalles del plan y del afiliado
  public function detalle_plan_afiliado($id_afiliado)
  {

    //validacion momentanea de si existe un parametro entrante o no
    if (!isset($id_afiliado)) {

      redirect('afiliadoscontrol', 'refresh');

    }

    $id_afiliado = base64_decode($id_afiliado);

    //consulta a a tabla de afilaidos para obtener datos del usuario
    $cosulta_afiliado = $this->db->query("SELECT * FROM AFILIADOS WHERE id_afiliacion = '$id_afiliado'");
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


    //id_afiliado que se enviara a la vista para ser obtenido por el ajax y verificar el tipo de alimento
    $data['id_afiliado'] = $id_afiliado;
    $data['correo_afiliado'] = $respuesta_afiliado->correo;

    //envio de datos a la vista de detalles de plan del afiliado
    $this->load->view('headers/header_loged');
    $this->load->view('detalles_plan_afiliado', $data);
    $this->load->view('footer/footer');

  }



  //metodo para recibir el tipo de alimento que eligio el usuario y devolverlo en un modal
  public function alimentos_detalles_afiliado()
  {

    //correo que esta en sesion del ususario, aca como en el metodo anterios solo se debe sustituir la consula que en vez de que sea por correo sea por id_afiliado, este id debe venir en un post y debe ser enviado desde el metodo anterior a la vita para poder usarse aqui
    $id_afiliado = $_POST['id_afiliado'];


    //consulta a a tabla de afilaidos para obtener datos del usuario
    $cosulta_afiliado = $this->db->query("SELECT * FROM AFILIADOS WHERE id_afiliacion = '$id_afiliado'");
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

    $response = array( 'alimentos' => $html );

     echo json_encode($response);

  }

  //metodo para comprobar el pago al momento de cargar la consulta de el plan del afiliado del usuario
  public function comprobar_pago_afiliado()
  {

    $correo_afiliado = $_POST['correo_afiliado'];
    $semana_actual = $_SESSION['SemanaActual'];
    $num_registro = $_SESSION['num_registro'];

    $consulta_pago = $this->db->query("SELECT transactioninvalid, semana, estatus, AF.correo FROM PAGO_MA PMA INNER JOIN pago_tr PTR ON PMA.codeorden = PTR.codeorden INNER JOIN AFILIADOS AF ON PMA.num_registro = AF.num_registro WHERE PMA.num_registro = '$num_registro' AND PTR.correo = '$correo_afiliado' AND PTR.semana >= '$semana_actual' AND YEAR(GETDATE()) = DATEPART (YYYY , PTR.date) ORDER BY estatus ASC");

    $respuesta_pago = $consulta_pago->row();

    $html = '';

    //primero validamos que es lo que hay en carrito para en caso de que haya una caja solo redireccionamos al pago, si no hay cajas en carrito pasamos a validar el PAGO_TR para confirmar la ultima fecha en la que pago y reactivar y demas procedimiento 
    //-------------------------------------------
    $consulta_carrito_usuario_af = $this->db->query("SELECT * FROM CARRITO WHERE correo = '$correo_afiliado' AND num_registro = '$num_registro'");
		
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

      $consulta_pago_compra = $this->db->query("SELECT semana FROM PAGO_TR WHERE num_registro = '$num_registro' AND correo = '$correo_afiliado' AND semana >= '$semana_actual' AND YEAR(GETDATE()) = DATEPART (YYYY , date) ORDER BY semana ASC");
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
      $pago = 0;
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
      $consulta_carrito_usuario = $this->db->query("SELECT * FROM CARRITO WHERE correo = '$correo_afiliado' AND num_registro = '$num_registro'");
		
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
        $html .= '<h5>Tu pago se está procesando… por favor espera la aprobación</h5>';
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

        $pago = 1;
        $html .= '';
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

    
      $pago = true;
      $html .= '';

      //respuesta
      $response = array(

        'pago' => $pago,
        'respuesta_html' => $html
      );

      echo json_encode($response);

      return;
        
    }

  }
}