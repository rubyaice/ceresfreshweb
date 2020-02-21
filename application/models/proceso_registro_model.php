<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Proceso_registro_model extends CI_Model{

  public function __construct()
  {
    parent::__construct();
    $this->load->database();
  }

  public function insertar_estatus($num_registro, $estatus)
  {
      $estatus_proceso = array(

        'num_registro' => $num_registro,
        'id_proceso' => $estatus

      );

      //insercion en tabla ESTATUS_REGISTRO_MA

      if($this->db->insert('ESTATUS_REGISTRO_MA', $estatus_proceso))
      {
        return true;
      }
      else {
        return false;
      }
  }

  public function actualizar_estatus($num_registro, $estatus)
  {


    $estatus_proceso = array(


      'id_proceso' => $estatus

    );

    //insercion en tabla ESTATUS_REGISTRO_MA
    $this->db->where('num_registro', $num_registro);
    if($this->db->update('ESTATUS_REGISTRO_MA', $estatus_proceso))
    {
      return true;
    }
    else
    {
      return false;
    }

  }



}
