<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Nombre extends CI_Controller{

  public function __construct()
  {
    parent::__construct();
    $this->load->helper('url');
    $this->load->database();
  }

  function index()
  {
    $correo_usuario = $_POST['correo_usuario'];

    $consulta_nombre = $this->db->query("SELECT nombre, apellido FROM AFILIADOS WHERE correo = '$correo_usuario'");

    $respuesta_nombre = $consulta_nombre->row();

    $html = $respuesta_nombre->nombre.'&nbsp;'.$respuesta_nombre->apellido;

    $response = array( 'nombre' => $html );

    echo json_encode($response);


  }

}
