<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Login extends CI_Controller {

  public function __construct()
  {
    parent::__construct();
    $this->load->helper('url');
    $this->load->database();

  }


	//primera funcion que se ejecuta en al llamar el controlador, funcion para recepcion de datos de incio de sesion
	public function index()
	{
    if ($this->session->userdata('correo')) {
      redirect('dashboard');
    }

    if (isset($_POST['correo']) OR isset($_POST['clave'])) {

      $this->load->model('usuario_model');


      if($this->usuario_model->login($_POST['correo'],$_POST['clave'])) {

        $this->session->set_userdata('correo', $_POST['correo']);
        redirect('dashboard');

      } else {
        redirect('login');
      }
    }
		$this->load->view('login');
	}

  //funcion para cerrar sesion solo se aplica un sess_destroy
  public function logout()
  {
    $this->session->sess_destroy();
    redirect('login');
  }

  public function vista_registrar_usuario()
  {
    $this->load->view('registrar_usuario');
  }
}
