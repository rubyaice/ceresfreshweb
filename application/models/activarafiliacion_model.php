<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Activarafiliacion_model extends CI_Model {

  public function __construct(){

    parent::__construct();
    $this->load->database();

  }

  public function activar_afiliacion_usuario($correo_usuario, $num_registro){

    $this->load->model('functions_model');
    $OrderCode = $this->functions_model->GetCorrelative("ORDER_BOX",true);        
        
    //datos que se guardaran en carrito
    $data_carrito = array(

        'correo' => $correo_usuario,
        'cantidad' => '1',
        'num_registro' => $num_registro,
        'codeorder' => $OrderCode,
        'productcode'=> '0000000001'// Codigo del único producto que existe Nutribox , en caso de añadir otro cambiar 

    );

    //generado de resuesta para enviar como resultado de validacion
    $respuesta_activacion_usuario = false;

    if ($this->db->insert('CARRITO', $data_carrito)) {
        
        $respuesta_activacion_usuario = true;

    }else{

        $respuesta_activacion_usuario = false;
    }

    return $respuesta_activacion_usuario;
        
  }
}