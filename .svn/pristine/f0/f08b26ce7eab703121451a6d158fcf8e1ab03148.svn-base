<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Checkouts_model extends CI_Model {


  public function __construct(){

    parent::__construct();
    $this->load->database();

  }

  public function newOrderMA($code_orden, $correo, $total, $status, $transaction_invalid, $observation)
  {
    //repecepcion de parametros de metodo de pago "instapago" para swer guardados en tabla ORDERS_MA
    $data_pago = array(

      'CodeOrden' => $code_orden,
      'correo' => $correo,
      'Total' => $total,
      'Status' => $status,
      'TransactionInvalid' => $transaction_invalid,
      'Observation' => $observation

    );

    //metdo para insertar el registro de pago en la tabla ORDERS_MA
    $result = $this->db->insert('ORDERS_MA', $data_pago);
  }

public function newOrderTR($code_orden, $correo, $plan_suscrip, $total, $transaction_invalid, $observation)
{
  //repecepcion de parametros de metodo de pago "instapago" para swer guardados en tabla ORDERS_TR
  $data_pago = array(

    'CodeOrden' => $code_orden,
    'plan_suscrip' => $plan_suscrip,
    'Price' => $precio,
    'Total' => $total,
    'correo' => $correo,
    'Observation' => $observation

  );

  //metdo para insertar el registro de pago en la tabla ORDERS_TR
  $result = $this->db->insert('ORDERS_TR', $data_pago);
}
}
