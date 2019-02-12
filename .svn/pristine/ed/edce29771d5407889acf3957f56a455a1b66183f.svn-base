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
      redirect('login');
    }
  }

  //primera ejecucion de esta secccion
	public function index()
	{
    //variable de sesion para hacer tanto la consulta de si existe el usuario suscrit como para traer el numero de afiliacion en la consulta de los afiliados
    $correo_usuario = $_SESSION['correo'];

    //aca se optiene el numero de suscripcion del usuario para traer sus afiliados en la consulta de abajo
    $optener_num_suscripcion = $this->db->query("SELECT * FROM MA_SUSCRIPCION WHERE correo = '$correo_usuario'");
		$resultado = $optener_num_suscripcion->row_array();
    $num_suscrito = $resultado['num_afiliacion'];

    //consulta directa para optener los afiliados del usuario suscrito partiendo del numero optenido de la consulta de arriba
    $query = $this->db->query("SELECT AF.id_afiliacion,  AF.nombre, AF.apellido, AF.edad, AF.sexo, AF.peso, AF.estatura, ACT.descripcion as act_fisica, COE.descripcion as condicion_esp, AF.plan_nut, AF.correo, AF.direccion_envio FROM AFILIADOS AF INNER JOIN PLAN_NUTRICIONAL_ACT_FISICA ACT ON AF.act_fisica = ACT.act_fisica INNER JOIN PLAN_NUTRICIONAL_CONDICION_ESPECIAL COE ON AF.condicion_esp = COE.condicion_esp  WHERE num_afiliacion = '$num_suscrito' AND correo <> '$correo_usuario'");
    $results_af = $query->result();

    //definicion de variables que se enviaran a la vista para la lista de usuarios afiliados
    $data['afiliados_usuario'] = $results_af;

    //obtener si el usuario esta suscrito o no para restringir esa vista en caso de que este suscrito ya para evitar que se suscriba de nuevo
    $suscrito = $this->db->query("SELECT * FROM MA_SUSCRIPCION WHERE correo = '$correo_usuario'");
		$resultados = $suscrito->row_array();
    $esta_suscrito = $resultados['num_afiliacion'];


    //valiacion de si existe la suscripcion permitir ver esta lista de afiliados si no no permitir la entrada y redireccionar a dashboard

    if ($esta_suscrito) {

      $this->load->view('afiliados_usuario', $data);

    }else {

      redirect('dashboard');
    }

	}

  //metodo de controlador para llevar a cabo la eliminacion de un afiliado del usuario suscriptor, este recibe como parametro un id de afiliado que ien de la lista de afiliados  la envia al modelo para que haga la gestion con la base de datos.

  public function eliminar_afiliado($id_afiliado)
  {

    //valisdacion de si existe un id entrante del afiliado
    if (isset($id_afiliado)) {

      //llamado del modelo en caso verdadero
      $this->load->model('afiliados_usuario_model');

      //paso de parametro recibido desde la vista para ser procesado por el modelo
      if (!$this->afiliados_usuario_model->eliminar_afiliado_consulta($id_afiliado)) {

        echo "Afiliado eliminado";

      }else {

        echo "Afiliado no eliminado";
      }

    }else {

      echo "No Existe este ID de afiliación";

    }

  }

  //funcion que llama la vista de acualizacion de afiliado pero a su vez recibe un parametro de la tabla de afiliados el cual enviara a la vista de actualizacion para definirlo en un campo hidden
  public function vista_actualiar($id_afiliado)
  {

    //variable de sesion para hacer tanto la consulta de si existe el usuario suscrit como para traer el numero de afiliacion en la consulta de los afiliados
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
    $correo_usuario = $_SESSION['correo'];
		$suscrito = $this->db->query("SELECT * FROM MA_SUSCRIPCION WHERE correo = '$correo_usuario'");
		$results_na = $suscrito->row();

    //definicion de variables que se eniaran a la vista para los select de los planes
    $data['actitud_fisica'] = $results_af;
    $data['condicion_especial'] = $results_ce;
    $data['num_afiliacion_afiliado'] = $results_na->num_afiliacion;



    //obtener si el usuario esta suscrito o no para restringir esa vista en caso de que este suscrito ya para evitar que se suscriba de nuevo
    $suscrito = $this->db->query("SELECT * FROM MA_SUSCRIPCION WHERE correo = '$correo_usuario'");
		$resultados = $suscrito->row_array();
    $esta_suscrito = $resultados['num_afiliacion'];


    //envio del id_afiliado a la vista de actualizacion de afiliado
    $data['id_afiliado'] = $id_afiliado;

    //llamado de la vista de actualizacion y envio de id_afiliado para el campo hidden
    if ($esta_suscrito) {

      $this->load->view('actualizar_afiliado', $data);

    }else {

      redirect('dashboard');

    }
  }

  //metodo para actualizar afiliado, este recibira los post qu se enviaran al modelo para la accion en la base de datos
  public function actualizar_afiliado()
  {

    //validacion de si esta viniendo por post todos lo campos solicitados

    if ($_POST['id_afiliado'] || $_POST['correo'] || $_POST['nombre'] || $_POST['apellido'] || $_POST['edad'] || $_POST['sexo'] || $_POST['peso'] || $_POST['estatura'] || $_POST['act_fisica'] || $_POST['condicion_esp']) {

      //llamada del modelo que hara la consulta a la base de datos para actualizar al afiliado
      $this->load->model('afiliados_usuario_model');

      //metodo dentro del modelo que realiza la funion de actualizar al afiliado
      if (!$this->afiliados_usuario_model->actualizar_afiliado_consulta($_POST['id_afiliado'], $_POST['correo'], $_POST['nombre'], $_POST['apellido'], $_POST['edad'], $_POST['sexo'], $_POST['peso'], $_POST['estatura'], $_POST['act_fisica'], $_POST['condicion_esp'])) {

        echo "Afiliado Actualizado con Exito!!";

      }else {

        echo "Afiliado No Actualizado";

      }

    }

  }

  //metodo para ver los detalles del plan nutricional del afilido este recibe como parametro el id_afiliado con el id del afiliado enviando desde la tabla que muestra todos los afiliados con base a ese id se hae la consulta para traer de vuelta los detalles del plan y del afiliado
  public function detalle_plan_afiliado($id_afiliado)
  {

    //consuta a la base de datos para ver lo datos del afiliado y mostrarlos en la vista
    $consulta_datos_afiliado = $this->db->query("SELECT A.id_afiliacion, A.num_afiliacion, A.apellido, A.nombre, A.edad, A.sexo, A.peso, A.estatura, AF.descripcion AS act_fisica, CE.descripcion AS condicion_esp, A.plan_nut, A.correo, A.direccion_envio FROM AFILIADOS A
INNER JOIN PLAN_NUTRICIONAL_ACT_FISICA AF ON A.act_fisica = AF.act_fisica
INNER JOIN PLAN_NUTRICIONAL_CONDICION_ESPECIAL CE ON A.condicion_esp = CE.condicion_esp WHERE id_afiliacion = '$id_afiliado'");
    $respuesta_datos_afiliados = $consulta_datos_afiliado->row();

    //declaracion de varables de datos afiliados que se enviaran a la vista
    $data['num_afiliacion'] = $respuesta_datos_afiliados->num_afiliacion;
    $data['apellido'] = $respuesta_datos_afiliados->apellido;
    $data['nombre'] = $respuesta_datos_afiliados->nombre;
    $data['edad'] = $respuesta_datos_afiliados->edad;
    $data['sexo'] = $respuesta_datos_afiliados->sexo;
    $data['peso'] = $respuesta_datos_afiliados->peso;
    $data['estatura'] = $respuesta_datos_afiliados->estatura;
    $data['act_fisica'] = $respuesta_datos_afiliados->act_fisica;
    $data['condicion_esp'] = $respuesta_datos_afiliados->condicion_esp;
    $data['plan_nut'] = $respuesta_datos_afiliados->plan_nut;
    $data['correo'] = $respuesta_datos_afiliados->correo;
    $data['direccion_envio'] = $respuesta_datos_afiliados->direccion_envio;

    //------------------------------------------------------

    $plan_afiliado = $data['plan_nut'];

    $consulta_plan_afiliado = $this->db->query("SELECT TC.descripcion AS comida,T.descripcion AS tipo_alimento,P.porcion FROM PLAN_NUTRICIONAL_PORCION P
  INNER JOIN TIPO_ALIMENTO T ON P.tipo_alimento=T.tipo_alimento
  INNER JOIN PLAN_NUTRICIONAL_TIPO_COMIDA TC ON P.comida = TC.tipo_comida
WHERE id_plan='$plan_afiliado'");

    $resultado_plan_afiliado = $consulta_plan_afiliado->result();

    $data['resultado_plan_afiliado'] = $resultado_plan_afiliado;

    //envio de datos a la vista de detalles de plan del afiliado
    $this->load->view('detalles_plan_afiliado', $data);

  }
}
