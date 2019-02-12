<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Suscribir_usuario_instapago_model extends CI_Model {

  public function __construct(){

    parent::__construct();
    $this->load->database();

  }

  //metodo para susbrbir a un Ususario en la base de datos, esta suscripcion se hace tanto en al tabla de suscripcion como en la tabla de afiliacion de la base de datos
  public function suscribir_usuario_instapago($correo, $plan_suscrip, $num_afiliacion, $nombre, $apellido, $cedula, $edad, $sexo, $peso, $estatura, $act_fisica, $condicion_esp, $direccion_envio, $estatus, $tipo_transaccion, $num_transaccion, $precio_plan, $banco_emisor, $banco_receptor, $code_orden, $fecha, $tdc)
  {

    //datos que se insertaran en la taba de MA_SUSCRIPCION, EL ESTATUS DE ESTA TABLA CAMBIARA UNICAMENTE CUANDO EL ESTADO DE LA TABL PAGO_MA CAMBIE A APRBADO
    $data_suscripcion = array(

      'correo' => $correo,
      'fecha_pago' => $fecha,
      'plan_suscrip' => $plan_suscrip,
      'num_afiliacion' => $num_afiliacion,
      'estatus' => $estatus

    );

    //datos que se insertaran en al tabla de afiliados los cuales estaran disponibles si el usuario se encuentra en estado 1 que es tasansaccion aprovada
    $data_afiliacion = array(

      'num_afiliacion' => $num_afiliacion,
      'apellido' => $apellido,
      'nombre' => $nombre,
      'edad' => $edad,
      'sexo' => $sexo,
      'peso' => $peso,
      'estatura' => $estatura,
      'act_fisica' => $act_fisica,
      'condicion_esp' => $condicion_esp,
      'direccion_envio' => $direccion_envio,
      'correo' => $correo,
      'direccion_envio' => $direccion_envio

    );

    //data que se enviara a la tabla de de PAGO_MA, esta tabla s llenara con la informacion de pago dependiendo de la transaccion que se elija, esto a la vez permitira que la tabla de suscripccion tenga un estatus el cual cambiar solamete si el estatus de esta tabla cambiar a aprovado
    $data_pago = array(
      'CodeOrden' => $code_orden,
      'correo' => $correo,
      'fecha' => $fecha,
      'total_pago' => $precio_plan,
      'estatus' => $estatus
    );

    //datos que se insertaran en la tabla de ORDERS_PAYMENTMETHOD para llevar a cabo el analisis de Pago, este pago sera de instapago
    $data_orders_paymentmethod = array(

      'CodeOrden' => $code_orden,
      'Type' => $tipo_transaccion,
      'Amount' => $precio_plan,
      'PersonName' => $nombre,
      'PersonLastname' => $apellido,
      'PersonCedula' => $cedula,
      'CDCNumber' => $tdc,
      'Date' => $fecha
    );

    //insercion en la tabla de MA_SUSCRIPCION del usuario que se registro para que este un registro del estado del usuario, como es instapago el estado del usuario sera inmediatamente 1 que es actio
    $this->db->insert('MA_SUSCRIPCION', $data_suscripcion);

    //insercion en la tabla de AFILIADOS del usuario que se registró, estos datos todavia no estaran disponibles hasta q el estado del afiliado ya suscrito cambie a 1 que es pago aprobado en el sistema
    $this->db->insert('AFILIADOS', $data_afiliacion);

    //insercion en la tabla de ORDERS_MA del usuario que se registro e ingreso
    $this->db->insert('PAGO_MA', $data_pago);

    //insercion en tabla de ORDERS_PAYMENTMETHOD para ordenes de control del usuario, esta tabla sirve para las solicitudes de suscripcion que debas ser procesadas por los metodos de pago.
    $this->db->insert('ORDERS_PAYMENTMETHOD', $data_orders_paymentmethod);

  }

}
