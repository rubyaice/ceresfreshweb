<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Suscribir extends CI_Controller {

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


    //optener los planes de suscripcion para el ususario
    $query = $this->db->query('SELECT * FROM PLANES_SUSCRIPCION');
    $results_ps = $query->result();

    //obtener tipo de actitud fisica que tine el suscriptor para grabar en la tabla de afiliacion

    $query = $this->db->query('SELECT * FROM PLAN_NUTRICIONAL_ACT_FISICA');
    $results_af = $query->result();

    //obtener si existe alguna aptitud especial en el usuario
    $query = $this->db->query('SELECT * FROM PLAN_NUTRICIONAL_CONDICION_ESPECIAL');
    $results_ce = $query->result();

    //obtener si el usuario esta suscrito o no para restringir esa vista en caso de que este suscrito ya para evitar que se suscriba de nuevo
    $correo_usuario = $_SESSION['correo'];
    $suscrito = $this->db->query("SELECT * FROM MA_SUSCRIPCION WHERE correo = '$correo_usuario'");
		$resultados = $suscrito->row_array();
    $esta_suscrito = $resultados['num_afiliacion'];

    //definicion de variables que se eniaran a la vista para los select de los planes
    $data['planes_suscripcion'] = $results_ps;
    $data['actitud_fisica'] = $results_af;
    $data['condicion_especial'] = $results_ce;

    if (!$esta_suscrito) {
      $this->load->view('suscribir_usuario', $data);
    }else {
      redirect('dashboard');
    }

	}

  //meodo para recibir los datos suministrados por el usuario en la vista de suscripcion del usuario
  public function recibir_datos_instapago()
  {

    //verificar como se recibira o se generara el numero de la orden
    $data['correo'] = $_POST['correo'];
    $data['plan_suscrip'] = $_POST['plan_suscrip'];
    $data['num_afiliacion'] = $_POST['num_afiliacion'];
    $data['nombre'] = $_POST['nombre'];
    $data['apellido'] = $_POST['apellido'];
    $data['cedula'] = $_POST['cedula'];
    $data['edad'] = $_POST['edad'];
    $data['sexo'] = $_POST['sexo'];
    $data['peso'] = $_POST['peso'];
    $data['estatura'] = $_POST['estatura'];
    $data['act_fisica'] = $_POST['act_fisica'];
    $data['condicion_esp'] = $_POST['condicion_esp'];
    $data['direccion_envio'] = $_POST['direccion_envio'];
    $data['estatus'] = $_POST['estatus'];
    $data['tipo_transaccion'] = $_POST['tipo_transaccion'];
    $data['precio_plan'] = $_POST['precio_plan'];
    $data['code_orden'] = $_POST['code_orden'];
    $data['fecha'] = $_POST['fecha'];

    //enviar estos datos a la vista de metodo de pago por instapago, verificar si este metodo funciona y si esta llegando todo bien a la vista de instapago

    $this->load->view('instapago_metod_suscrip', $data);

  }

  //meodo para recibir los datos suministrados por el usuario en la vista de suscripcion del usuario
  public function recibir_datos_suscripcion()
  {

    //verificar como se recibira o se generara el numero de la orden

    $data['correo'] = $_POST['correo'];
    $data['plan_suscrip'] = $_POST['plan_suscrip'];
    $data['num_afiliacion'] = $_POST['num_afiliacion'];
    $data['nombre'] = $_POST['nombre'];
    $data['apellido'] = $_POST['apellido'];
    $data['cedula'] = $_POST['cedula'];
    $data['edad'] = $_POST['edad'];
    $data['sexo'] = $_POST['sexo'];
    $data['peso'] = $_POST['peso'];
    $data['estatura'] = $_POST['estatura'];
    $data['act_fisica'] = $_POST['act_fisica'];
    $data['condicion_esp'] = $_POST['condicion_esp'];
    $data['direccion_envio'] = $_POST['direccion_envio'];

    //traer el monto del plan que se eligio peviamente basandose en el plan que esta llegando por post aqui..

    $planes_suscripcion = $_POST['plan_suscrip'];

    $query = $this->db->query("SELECT * FROM PLANES_SUSCRIPCION WHERE plan_suscrip = '$planes_suscripcion'");
    $resultado = $query->row();

    $data['precio_plan'] = $resultado->precio;

    //enviar estos dato a tabla temporal para que despues de aprobado el pago se pueda pasar a la tabla como tal de afiliados

    $this->load->view('metodos_pago_suscrip', $data);

  }



  //metodo para enviar datos a al modelo de suscripcion, el cual grabara en base de datos los datos suministrados por el ususario, estos datos van a el metodo de pago de instapago
  public function insertar_en_suscripcion_instapago()
  {
    //recepcion de datos para enviar a tabla suscripcion

    $this->load->model('suscribir_usuario_instapago_model');

    if (!$this->suscribir_usuario_instapago_model->suscribir_usuario_instapago($_POST['correo'], $_POST['plan_suscrip'], $_POST['num_afiliacion'], $_POST['nombre'], $_POST['apellido'], $_POST['cedula'], $_POST['edad'], $_POST['sexo'], $_POST['peso'], $_POST['estatura'], $_POST['act_fisica'], $_POST['condicion_esp'], $_POST['direccion_envio'], $_POST['estatus'], $_POST['tipo_transaccion'], $_POST['precio_plan'], $_POST['code_orden'], $_POST['fecha'], $_POST['tdc'])) {

      $this->load->view('usuario_suscrito_view');

    }else {

      $this->load->view('usuario_no_suscrito_view');

    }
  }


  //metodo para enviar datos a al modelo de suscripcion, el cual grabara en base de datos los datos suministrados por el ususario
  public function insertar_en_suscripcion()
  {
    //recepcion de datos para enviar a tabla suscripcion

    $this->load->model('suscripcion_usuario_model');

    if (!$this->suscripcion_usuario_model->suscribir_usuario($_POST['correo'], $_POST['plan_suscrip'], $_POST['num_afiliacion'], $_POST['nombre'], $_POST['apellido'], $_POST['cedula'], $_POST['edad'], $_POST['sexo'], $_POST['peso'], $_POST['estatura'], $_POST['act_fisica'], $_POST['condicion_esp'], $_POST['direccion_envio'], $_POST['estatus'], $_POST['tipo_transaccion'], $_POST['num_transaccion'], $_POST['precio_plan'], $_POST['banco_emisor'], $_POST['banco_receptor'], $_POST['code_orden'], $_POST['fecha'])) {

      $this->load->view('usuario_suscrito_view');

    }else {

      $this->load->view('usuario_no_suscrito_view');

    }
  }

}
