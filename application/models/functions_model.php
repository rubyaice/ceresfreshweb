<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Functions_model extends CI_Model {

  public function __construct(){

    parent::__construct();
    $this->load->database();

  }

  //metodo para eliminar a un Afiliado en la base de datos, esta eliminacion se hara en la tabla de afiliados de la base de datos
  public function GetCorrelative($Identifier,$Increase = FALSE)
  {
    $ToReturn = "";
    $Query="SELECT * FROM SYSTEM_CORRELATIVES WHERE Identifier = '".$Identifier."'";
    $Recordset= $this->db->query($Query);
    $resultado_correlativo=$Recordset->row();
    if($Recordset){

      $Format=$resultado_correlativo->Format;
      $Value=sprintf("%'.0".strlen($Format)."d", $resultado_correlativo->Value);
      $ToReturn =$Value;
    }
    if($Increase){
      $Value_actual=$resultado_correlativo->Value+1;
      $data_correlativo = array(

        'Value' => $Value_actual,

      );

      $this->db->where('Identifier', $Identifier);
      $this->db->update('SYSTEM_CORRELATIVES', $data_correlativo);

    }

    return $ToReturn;

  }

  public function GetPrecioNutribox()
  {
    $ToReturn = "";
    $Query="SELECT *  FROM REGLASDENEGOCIO WHERE IDProceso = '0000000001'";
    $Recordset= $this->db->query($Query);
    $resultado_correlativo=$Recordset->row();
    if($Recordset){

      $Precio_dolar=$resultado_correlativo->ValorDefault;
      $Value=$resultado_correlativo->Valor;
      $ToReturn =$Precio_dolar*$Value;
    }

    return $ToReturn;

  }

  public function GetDataSemana()
  {
    $ToReturn = "";
    $Query="SELECT DATEPART(DW, getdate()) AS ND,DATENAME(DW, getdate()) AS DIA_DESCRIPTION , CASE WHEN  DATEPART(DW, getdate()) BETWEEN 1 AND  3 THEN 1 ELSE 0 END AS MSJ,
    CASE WHEN  DATEPART(DW, getdate()) BETWEEN 1 AND  3 THEN GETDATE()+8 ELSE GETDATE()+11 END AS FECHA_INI,CASE WHEN  DATEPART(DW, getdate()) BETWEEN 1 AND  3 THEN GETDATE()+11 ELSE GETDATE()+15 END AS FECHA_FIN ,DATEPART(ISOWK, getdate()) as  SEMANA, CASE WHEN DATEPART(DW, getdate()) BETWEEN 1 AND  3 THEN DATEPART(ISOWK, getdate()+7) ELSE DATEPART(ISOWK, getdate()+14) END AS SEMANA_PAGO";
    $Recordset= $this->db->query($Query);
    $resultado=$Recordset->row();
    
    if($Recordset){      
    
      $ToReturn =$resultado;
    }

    return $ToReturn;
  } 

  public function GetSemana()
  {
    $ToReturn = "";
    $Query="SELECT DATEPART(ISOWK, getdate()) as  SM";
    $Recordset= $this->db->query($Query);
    $resultado=$Recordset->row();
    
    if($Recordset){

      $Semana=$resultado->SM;
    
      $ToReturn =$Semana;
    }

    return $ToReturn;
  } 


  function WriteLog($err_description,$cliente,$cedula,$total,$subtotal,$tax,$OrderNumber)
  {
   
      $CustomerCode=$_SESSION['num_registro'];
      $ToReturn = FALSE;
      $data_pago = array(              
         
        'input_customerCode'=>$CustomerCode,
        'Input_cliente'=>$cliente,
        'Input_cedula'=>$cedula,
        'Total'=>$total,
        'Subtotal'=>$subtotal,
        'Tax'=>$tax,       
        'ErrorDescription'=>$err_description,
        'OrderNumber'=>$OrderNumber
      

  
      );
  
      //metdo para insertar el registro de pago en la tabla LOG_INSTAPAGO
      if($this->db->insert('LOG_ORDER_ERROR', $data_pago))
      $ToReturn =true;

      return $ToReturn;

  }


  function WriteInstaPagoLog($jsonInstapago,$err_description,$OrderNumber)
  {
      //CustomerCode
      $CustomerCode=$_SESSION['num_registro'];
      $jsonObj=json_decode($jsonInstapago,true);
      $ToReturn = FALSE;
      if(is_null($err_description)) //Si no es exception, osea no es error interno. Se guarda la trasa
      {
         
                  $ToReturn = FALSE;
                  try
                    { 
              
                    $data_pago = array(
              
                    'Success' => $jsonObj['success'],
                    'Code' => $jsonObj['code'],
                    'TransID' => $jsonObj['id'],
                    'Message' =>$jsonObj['message'],
                    'ResponseCode' => $jsonObj['responsecode'],
                    'Reference' => $jsonObj['reference'],
                    'Monto' => $jsonObj['amount'],                  
                    'sequence'=>$jsonObj['sequence'],
                    'Approval'=>$jsonObj['approval'],
                    'CustomerCode'=>$CustomerCode,
                    'OrderNumber'=>$OrderNumber

              
                  );
              
                  //metdo para insertar el registro de pago en la tabla LOG_INSTAPAGO
                  if($this->db->insert('LOG_INSTAPAGO', $data_pago))
                  $ToReturn =true;
              
                  return  $ToReturn;
                  }
                  catch(Exception $ex)
                  {
                      return $ToReturn;
                  }
      }
      else//si es error se guardan los campos de la exception
      {
              $data_pago = array(
              
            'InternoWeb_ErrorDescription' => $err_description,
            'Fecha' => $jsonObj['code'],
            'InternoWeb_ErrorNumber' => $err_description->getCode(),          
            'CustomerCode'=>$CustomerCode
          

      
          );
      
          //metdo para insertar el registro de pago en la tabla LOG_INSTAPAGO
          if($this->db->insert('LOG_INSTAPAGO', $data_pago))
          $ToReturn =true;
      
      }
      return  $ToReturn;
  }

  //metodo para conectar con la base de datos para tomar el correo que este en la base de datos y enviar el correo
  function getReglaNegocios($Campo,$DefaultValue)
    {
        $ToReturn = $DefaultValue;
        $Query = "SELECT Valor from MA_REGLASDENEGOCIO where campo = '".$Campo."'";
        
        return $ToReturn;
    }

}
