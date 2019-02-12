<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Registrar_usuarios_model extends CI_Model {

  public function __construct(){

    parent::__construct();
    $this->load->database();

  }

  //metodo para registrar usuarios en la base de datos
  public function registrar_usuarios($nombre_proveedor,$correo, $clave)
  {

    $token = bin2hex( openssl_random_pseudo_bytes(20) );
    $token = hash( 'ripemd160', $correo );

    $data = array('correo' => $correo,
                  'clave' => $clave,
                  'nombre_proveedor' => $nombre_proveedor,
                  'token' => $token
                );

    $result = $this->db->insert('MA_LOGIN', $data);

  }

}
