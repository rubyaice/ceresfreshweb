<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Procesarcomprainst extends CI_Controller {

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
    //llamado de la tabla planes
  }

}
