<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Checkouts_model extends CI_Model {


    public $OrderCode;
    public $Num_registro;
    public $DeliveryMethod;

    public $Phone;
    public $PersonAddress;
    public $PersonCity;
    public $PersonState;
    public $PersonSector;

    public $DelivetyMethodType;

    public $PaymentMethod;

    public $PaymentRefNum;////////   Referencia del Pago
    public $TdcPaymentId;/////       ID Transacción(Integración con Instapago)

    public $PaymentCDCPersonName;
    public $PaymentCDCPersonLastname;
    public $PaymentCDCPersonTipoCedula;
    public $PaymentCDCPersonCedula;
    public $PaymentCDCExpirationMonth;
    public $PaymentCDCExpirationYear;

    public $BancoReceptor;
    public $BancoEmisor;
    public $DescripcionProd;


    public $CodigoErrorInstapago;       //ACA SE AGREGO PARA MANEJAR LOS ERRORES QUE DEVUELVE INSTAPAGOS
    public $DescripcionErrorInstapago;  //ACA SE AGREGO PARA MANEJAR LOS ERRORES QUE DEVUELVE INSTAPAGOS

    public $Total;
    public $Subtotal;
    public $Tax;
    public $ProductCode;
    public $Price;
    public $Quantity;
    public $Paid;

    public $TransactionInvalid;

    public function __construct($Total,$Description,$PaymentCDCPersonName,$PaymentCDCPersonLastname,$PaymentCDCPersonCedula,$OrderNumber,$Address,$City,$ZipCode,$Stat){

    parent::__construct();
    $this->load->database();

    $this->OrderCode=$OrderNumber;
    $this->Description=$Description;
    $this->PaymentCDCPersonName=$PaymentCDCPersonName;
    $this->PaymentCDCPersonLastname=$PaymentCDCPersonLastname;
    $this->PaymentCDCPersonCedula=$PaymentCDCPersonCedula;

    $this->Address=$Address;
    $this->City=$City;
    $this->ZipCode=$ZipCode;
    $this->State=$State;

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
