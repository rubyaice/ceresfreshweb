<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Afiliar extends CI_Controller {

  public function __construct()
  {
    parent::__construct();

    $this->load->helper('url');
    $this->load->database();

    //validacion si hay algun usuario registrado
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

    //consulta para verificar si existe suscripcion para este usuario
    $correo_usuario = $_SESSION['correo'];
		$suscrito = $this->db->query("SELECT * FROM MA_SUSCRIPCION WHERE correo = '$correo_usuario'");
		$results_na = $suscrito->row();

    //definicion de variables que se eniaran a la vista para los select de los planes
    $data['planes_suscripcion'] = $results_ps;
    $data['actitud_fisica'] = $results_af;
    $data['condicion_especial'] = $results_ce;
    $data['num_afiliacion_afiliado'] = $results_na->num_afiliacion;

		$this->load->view('afiliar_usuario', $data);
	}

  public function insertar_en_afiliacion()
  {
    //recepcion de datos para enviar a tabla suscripcion

    $this->load->model('afiliar_usuario_model');

    if (!$this->afiliar_usuario_model->afiliar_usuario($_POST['correo'], $_POST['num_afiliacion'], $_POST['nombre'], $_POST['apellido'], $_POST['edad'], $_POST['sexo'], $_POST['peso'], $_POST['estatura'], $_POST['act_fisica'], $_POST['condicion_esp'], $_POST['direccion_envio'])) {

      echo "Usuario Afiliado con Exito!!";

    }else {

      echo "No se pudo afiliar al usuario";

    }
  }
}
