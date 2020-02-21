<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Instapago {

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

  public function __construct(){

    

           $this->KeyId= '77D29E23-5F45-4F8F-9B37-CF47B820BB1B';
           $this->PublicKeyId= '7947ca13c4884ceb9cf69da9fa996238'; 



  }


  function ProcesarPago()
  {
      try
      {
          $url="https://api.instapago.com/payment";

          $fields = array("KeyID" => $this->KeyId , "PublicKeyId" => $this->PublicKeyId, "Amount" => $this->Amount,"Description" => $this->Description,
          "CardHolder"=> $this->CardHolder,"CardHolderId"=> $this->CardHolderID, "CardNumber" => $this->CardNumber, "CVC" => $this->CVC,
          "ExpirationDate" => $this->ExpirationDate, "StatusId" =>  $this->StatusID, "IP" => $this->IP, "OrderNumber" => $this->OrderNumber, "Address" => $this->Address,
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



  function VerificarPago()
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
