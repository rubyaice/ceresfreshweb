<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Registrarusuario extends CI_Controller {

  public function __construct()
  {
    parent::__construct();
    $this->load->helper('url');

  }

  //primera ejecucion de esta secccion
	public function index()
	{
    $this->load->model('registrar_usuarios_model');

    if (!$this->registrar_usuarios_model->registrar_usuarios($_REQUEST['nombre_proveedor'], $_REQUEST['correo'], $_REQUEST['clave'])) {

      redirect('login');

    } else {

      echo "<script>alert('Registro no completado, Error!!')</script>";

    }

		$this->load->view('registrar_usuario');
	}
}
