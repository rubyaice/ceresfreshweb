<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Pago_transferencia_model extends CI_Model{

  public function __construct()
  {
    parent::__construct();
    $this->load->database();
  }

  public function pagar_transferencia($correo, $estatus, $tipo_transaccion, $code_orden, $nombre, $apellido, $cedula, $monto_total, $num_transaccion, $banco_emisor, $banco_receptor, $num_afiliacion)
  {
    //estatus que se envia a la tabla de MA_SUSCRIPCION para hacer referencia que el usuario esta en espera de aprovacion
    $data_suscripcion = array(

      'estatus' => '3'

    );

    //data que se enviara a la tabla de de PAGO_MA, esta tabla s llenara con la informacion de pago dependiendo de la transaccion que se elija, esto a la vez permitira que la tabla de suscripccion tenga un estatus el cual cambiar solamete si el estatus de esta tabla cambiar a aprovado
    $data_pago = array(
      'CodeOrden' => $code_orden,
      'correo' => $correo,
      'total_pago' => $monto_total,
      'estatus' => $estatus
    );

    //datos que se insertaran en la tabla de ORDERS_PAYMENTMETHOD para llevar a cabo el analisis de Pago
    $data_orders_paymentmethod = array(

      'CodeOrden' => $code_orden,
      'Type' => $tipo_transaccion,
      'Amount' => $monto_total,
      'TransactionReference' => $num_transaccion,
      'PersonName' => $nombre,
      'PersonLastname' => $apellido,
      'PersonCedula' => $cedula,
      'BancoEmisor' => $banco_emisor,
      'BancoReceptor' => $banco_receptor
    );

    //data que se actualiza en carrito para cambiar el estado cosa de que e estado de ese afiliado pase a espera de aprovacion
    $data_carrito = array(

      'estatus' => '2'

    );

    //data para notificaiones
    $data_notificaciones = array(

      'notifiacion' => 'Pago en Proceso, Transacción N°:  '.$num_transaccion,
      'correo' => $correo,
      'tipo' => '1'

    );

    //cambio de estatus en la suscripcion cosa de informar al susuario que su pago esta siendo procesado
    $this->db->where('correo', $correo);
    $this->db->update('MA_SUSCRIPCION', $data_suscripcion);

    //insercion en la tabla de PAGO_MA del usuario que se registro e ingreso
    $this->db->insert('PAGO_MA', $data_pago);

    //insercion en tabla de ORDERS_PAYMENTMETHOD para ordenes de control del usuario, esta tabla sirve para las solicitudes de suscripcion que debas ser procesadas por los metodos de pago.
    $this->db->insert('ORDERS_PAYMENTMETHOD', $data_orders_paymentmethod);

    $this->db->where('num_afiliacion', $num_afiliacion);
    $this->db->update('CARRITO', $data_carrito);

    //mostrar notidficacion de espera de aprovacion de pago
    $this->db->insert('NOTIFICACIONES', $data_notificaciones);
  }

}
