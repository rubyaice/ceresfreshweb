<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Usuario_model extends CI_Model {

  public $variable;

  public function __construct(){

    parent::__construct();
    $this->load->database();

  }

  //meodo para validar la eistencia de usuario en la bae de datos
  public function login($correo, $clave)
  {


    $token = bin2hex( openssl_random_pseudo_bytes(20) );
    $clave= hash('ripemd160', $clave);


    $this->db->where('correo', $correo);
    $this->db->where('clave', $clave);
    $result = $this->db->get('MA_LOGIN_ADMIN');

      if ($result->num_rows() > 0) {
        return true;
      } else {
        return false;
      }

  }

}
