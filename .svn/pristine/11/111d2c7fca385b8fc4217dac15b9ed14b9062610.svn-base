<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Afiliar_usuario_model extends CI_Model {

  public function __construct(){

    parent::__construct();
    $this->load->database();

  }

  //metodo para susbrbir a un Ususario en la base de datos, esta suscripcion se hace tanto en al tabla de suscripcion como en la tabla de afiliacion de la base de datos
  public function afiliar_usuario($correo, $num_afiliacion, $nombre, $apellido, $edad, $sexo, $peso, $estatura, $act_fisica, $condicion_esp, $direccion_envio)
  {

    //data que se optiene para poder ingresarla en la tabla de afliliados
    $data_afiliar = array(

      'num_afiliacion' => $num_afiliacion,
      'apellido' => $apellido,
      'nombre' => $nombre,
      'edad' => $edad,
      'sexo' => $sexo,
      'peso' => $peso,
      'estatura' => $estatura,
      'act_fisica' => $act_fisica,
      'condicion_esp' => $condicion_esp,
      'correo' => $correo,
      'direccion_envio' => $direccion_envio

    );

    //insercion en la tabla de afiliados del usuario que esta siendo agrgado por un suscriptor

    $this->db->insert('AFILIADOS', $data_afiliar);
  }

}
