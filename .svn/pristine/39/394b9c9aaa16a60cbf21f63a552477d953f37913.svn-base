<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Instapago extends CI_Controller {

    //variables necesarias para etodo de instapago

    public $KeyId;
    public $PublicKeyId;
    public $Amount;
    public $Description;
    public $CardHolder;
    public $CardHolderID;
    public $CardNumber;
    public $CVC;
    public $ExpirationDate;
    public $StatusID;//1 preautorizar,2 pagar
    public $IP;
    public $OrderNumber;
    public $Address;
    public $City;
    public $ZipCode;
    public $State;
    public $mensaje;

  public function __construct()
  {
    parent::__construct();

    $this->load->helper('url');
    $this->load->database();

    //validacion si el usuario esa registrado
    if (!$this->session->userdata('correo')) {
      redirect('login');
    }

    //declaracion e llaves publicas para el proceso d pago

    $this->KeyId= '3C43473D-38EC-4EE8-BC49-5AECFA957AC1';
    $this->PublicKeyId= '79a521e1de34e5c78c5062c912b352e8';
  }

  //metodo para rocesar pago

  public function procesar_pago()
  {
    try
    {
        $url="https://api.instapago.com/payment";

        $fields = array("KeyID" => $this->KeyId , "PublicKeyId" => $this->PublicKeyId, "Amount" => $this->Amount,"Description" => $this->Description,
        "CardHolder"=> $this->CardHolder,"CardHolderId"=> $this->CardHolderID, "CardNumber" => $this->CardNumber, "CVC" => $this->CVC,
        "ExpirationDate" => $this->ExpirationDate, "StatusId" =>  $this->StatusId, "IP" => $this->IP, "OrderNumber" => $this->OrderNumber, "Address" => $this->Address,
        "City" => $this->City, "ZipCode" => $this->ZipCode, "State" => $this->State );
        $ch = curl_init();

        curl_setopt($ch, CURLOPT_URL, $url );
        curl_setopt($ch, CURLOPT_POST, 1);
        curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($fields));
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);

        $server_output = curl_exec($ch);

        $this->mensaje=$server_output;

        curl_close ($ch);
        $RespuestaInstapago = json_decode($server_output);
        return $RespuestaInstapago;
    }
    catch(Exception $e)
    {
        return false;
    }
  }

  //metodo para verifcar el pago

  public function verificar_pago()
  {

    try
        {
            $url="https://api.instapago.com/query";

            $fields = array("KeyID" => $this->KeyId , "PublicKeyId" => $this->PublicKeyId,"OrderNumber" => $this->OrderNumber);
            $fields ="?KeyID=".$this->KeyId."&PublicKeyId=".$this->PublicKeyId."&OrderNumber=".$this->OrderNumber;
            $ch = curl_init();

            curl_setopt($ch, CURLOPT_URL, $url.$fields);
            curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
            curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);

            $server_output = curl_exec($ch);

            curl_close ($ch);
            $RespuestaInstapago = json_decode($server_output);


            return $RespuestaInstapago;
        }
        catch(Exception $e)
            {
                return false;
            }
 }


}
