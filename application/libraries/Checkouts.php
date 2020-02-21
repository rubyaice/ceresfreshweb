<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Checkouts {


  public $Code;
  public $CustomerCode;
  public $PersonEmail;

  //Datos de facturacion
  public $FacPersonName;
  public $FacPersonPhone;
  public $FacPersonEmail;
  public $FacPersonSexo;
  public $FacPersonCedula;
  public $CustomerCodeAfilia;

  
  public $DeliveryMethod;

  public $PickupStoreCode;
  public $PickupPersonName;
  public $PickupPersonLastname;
  public $PickupPersonPhone;
  public $PickupPersonEmail;
  public $PickupPersonCedula;
  public $PickupInidate;
  public $PickupFindate;

  public $SemanaActual;

  public $AdditionalPhone;
  public $PersonAddress;
  public $PersonCity;
  public $PersonState;
  public $PersonPais;
  public $PersonMunicipality;
  public $PersonBenchmark;

  public $DelivetyMethodType;

  public $PaymentMethod;

  public $PaymentRefNum;////////   Referencia del Pago
  public $TdcPaymentId;/////       ID Transacción(Integración con Instapago)

  public $PaymentCDCPersonName;
  public $PaymentCDCNumber;
  public $PaymentCDCPersonLastname;
  public $PaymentCDCPersonTipoCedula;
  public $PaymentCDCPersonCedula;
  public $PaymentCDCExpirationMonth;
  public $PaymentCDCExpirationYear;


  public $PagoPhone;
  public $MetodoEntrega;
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
  protected $ci;

  // variables para pago por zelle
  public $pagoZelle;

  public function __construct(){
      $this->ci =& get_instance();
       
      $this->ci->load->model('functions_model');
        $DatosSemana=$this->ci->functions_model->GetDataSemana();
        $this->PickupInidate=$DatosSemana->FECHA_INI;
        $this->PickupFindate=$DatosSemana->FECHA_FIN;
        $this->SemanaActual=$DatosSemana->SEMANA;

    }

  public function newOrderMA()
  {
    $correo=$_SESSION['correo'];
    //repecepcion de parametros de metodo de pago "instapago" para swer guardados en tabla ORDERS_MA
    $ToReturn = FALSE;
    try
      { 
        $num_registro=$this->CustomerCode;
        $conexion = $this->ci->db->query("SELECT AF.nombre, AF.apellido,AF.city,AF.pais,AF.phone,AF.phone,AF.state,AF.zipcode,AF.sector, AF.plan_nut, AF.id_afiliacion, AF.correo, CA.codeorder,CA.cantidad , AF.num_registro ,CA.productcode ,(PN.precio *MP.n_precio_m) AS precio,(PN.precio *MP.n_precio_m*CA.cantidad) AS monto,ER.id_proceso 
        FROM  CARRITO CA INNER JOIN AFILIADOS AF ON CA.correo = AF.correo INNER JOIN MA_PRODUCTOS MP ON MP.C_CODIGO=CA.productcode INNER JOIN ESTATUS_REGISTRO_MA ER ON CA.num_registro = ER.num_registro INNER JOIN PLAN_NUTRICIONAL PN ON AF.plan_nut = PN.id_plan WHERE AF.num_registro =  '$num_registro'");
        $resultado_query = $conexion->row();
      if ($this->PaymentMethod == 4 or $this->PaymentMethod == 5)
      {
          $this->Paid = 0;

      }  
      if($this->PaymentMethod == 2) 
      {
        $this->Paid = $this->Total;
      }
      $data_pago = array(

      'num_registro' => $this->CustomerCode,
      'codeorden' => $this->Code,
      'total' =>  $this->Total,
      'subtotal' =>  $this->Total,
      'tax' => $this->Tax,
      'estatus' => 1,
      'paid'=>$this->Paid,
      'id_afiliacion'=>$this->CustomerCodeAfilia
      

    );

    //metdo para insertar el registro de pago en la tabla ORDERS_MA
    if($this->ci->db->insert('PAGO_MA', $data_pago))
    $ToReturn =true;

    return  $ToReturn;
    }
    catch(Exception $ex)
    {
        return $ToReturn;
    }
  }

public function newOrderTR()
{
  $ToReturn = FALSE;
 
  $num_registro=$this->CustomerCode;
  $conexion = $this->ci->db->query("SELECT AF.nombre, AF.apellido,AF.city,AF.pais,AF.phone,AF.phone,AF.state,AF.zipcode,AF.sector, AF.plan_nut, AF.id_afiliacion, AF.correo, CA.codeorder,CA.cantidad , AF.num_registro ,CA.productcode ,(PN.precio *MP.n_precio_m) AS precio,(PN.precio *MP.n_precio_m*CA.cantidad) AS monto,ER.id_proceso 
  FROM  CARRITO CA INNER JOIN AFILIADOS AF ON CA.correo = AF.correo INNER JOIN MA_PRODUCTOS MP ON MP.C_CODIGO=CA.productcode INNER JOIN ESTATUS_REGISTRO_MA ER ON CA.num_registro = ER.num_registro INNER JOIN PLAN_NUTRICIONAL PN ON AF.plan_nut = PN.id_plan WHERE AF.num_registro =  '$num_registro'");
  $resultado_query = $conexion->result();
    try
      {    
      

      $semana=$_SESSION['DiaSemanaPago'];


      foreach ($resultado_query  as $result) {

    
        $data_pago = array(

          'num_registro' => $result->num_registro,
          'codeorden' => $result->codeorder,
          'id_afiliacion'=>$result->id_afiliacion,
          'total' => $result->monto,
          'subtotal' => $result->precio,
          'tax' => 0,
          'semana'=>$semana,
          'cantidad'=>$result->cantidad,//Hacer otro ciclo para insertar una cantidad por semana 
          'precio'=>$result->precio,
          'descripcion' => '',  
          'productcode' => $result->productcode,         
          'correo' => $result->correo
        );
      
        $this->ci->db->insert('PAGO_TR', $data_pago);
        $ToReturn =true;

      }
     

      //metdo para insertar el registro de pago en la tabla ORDERS_TR    
      
      
      return  $ToReturn;
      }
      catch(Exception $ex)
      {
          return $ToReturn;
      }
    
}


      public function SaveOrden()
      {
          $ma=$this->newOrderMA();
          $tr=$this->newOrderTR();
          if ($ma && $tr)
          {
              return true;
          }
          else
          {
              return false;
          }
      }

      public function newOrderDeliveryMethod(){
        try
        {
          
            $ToReturn = FALSE;
            switch($this->DeliveryMethod){
                case 1: //PickUp
                  

                break;
                case 2:
                  



                      $data_pago = array(

                        'PersonName' => $this->PickupPersonName,
                        'Code' => $this->Code,
                        'Type' => 2,
                        'PersonPhone' => $this->PickupPersonPhone,
                        'PersonLastname' => $this->PickupPersonLastname,
                        'PersonAddress' =>  $this->PersonAddress,
                        'PersonCity' =>  $this->PersonCity,
                        'PersonState'=>$this->PersonState,
                        'PersonEmail'=>$this->PersonEmail,
                        'PersonCedula'=>$this->PickupPersonCedula,
                        'PersonMunicipality'=>$this->PersonMunicipality,
                        'PersonBenchmark'=>$this->PersonBenchmark,
                        'DateDeliveryIni'=>$this->PickupInidate,
                        'DateDeliveryFin'=>$this->PickupFindate,
                        'PersonPais'=>$this->PersonPais
                      
                  
                      );
                  
                      //metodo para insertar el registro de delivery en la tabla ORDERS_DELIVERYMETHOD
                      if($this->ci->db->insert('ORDERS_DELIVERYMETHOD', $data_pago))
                      $ToReturn =true;           
                    
                break;
            }
            return $ToReturn;
        }
        catch(Exception $e)
        {
            return false;
        }
    }


    function newOrderPaymentMethod(){
      $ToReturn = FALSE;
      switch($this->PaymentMethod){
          case "1": //pago en tienda

             
          break;
         
          case "2"://Tarjeta

                $data_pago = array(

                'CodeOrden' => $this->Code,
                'Type' => $this->PaymentMethod,
                'Amount' => $this->Total,
                'TransactionReference' => $this->PaymentRefNum,
                'PersonName' => $this->PaymentCDCPersonName,
                'PersonLastname' =>  $this->PaymentCDCPersonLastname,
                'PersonCedula' => $this->PaymentCDCPersonCedula,
                'CDCNumber'=>$this->PaymentCDCNumber,
                'TransactionID'=>$this->TdcPaymentId              
              
          
              );
          
              //metodo para insertar el registro de metodo de pago  en la tabla ORDERS_PAYMENTMETHOD
              if($this->ci->db->insert('ORDERS_PAYMENTMETHOD', $data_pago))
              $ToReturn =true;           
            
          break;

        case "4" :
                //Transferencias bancaria
                 
                  $data_pago = array(

                    'CodeOrden' => $this->Code,
                    'Type' => $this->PaymentMethod,
                    'Amount' => $this->Total,
                    'TransactionReference' => $this->PaymentRefNum,
                    'PersonName' => $this->PaymentCDCPersonName,
                    'PersonLastname' =>  $this->PaymentCDCPersonLastname,
                    'PersonCedula' => $this->PaymentCDCPersonCedula,
                    'BancoReceptor' => $this->BancoReceptor,
                    'BancoEmisor' =>  $this->BancoEmisor
              
                  );
            
                //metodo para insertar el registro de metodo de pago  en la tabla ORDERS_PAYMENTMETHOD
                if($this->ci->db->insert('ORDERS_PAYMENTMETHOD', $data_pago))
                $ToReturn =true;           
              
            
           break;
        case "5" :
        //Deposito bancaria
                $data_pago = array(

                  'CodeOrden' => $this->Code,
                  'Type' => $this->PaymentMethod,
                  'Amount' => $this->Total,
                  'TransactionReference' => $this->PaymentRefNum,
                  'PersonName' => $this->PaymentCDCPersonName,
                  'PersonLastname' =>  $this->PaymentCDCPersonLastname,
                  'PersonCedula' => $this->PaymentCDCPersonCedula,
                  'BancoReceptor' => $this->BancoReceptor,
                  'BancoEmisor' =>  $this->BancoEmisor,
                  'PagoZelle' => $this->pagoZelle
                );
            
                //metodo para insertar el registro de metodo de pago  en la tabla ORDERS_PAYMENTMETHOD
                if($this->ci->db->insert('ORDERS_PAYMENTMETHOD', $data_pago))
                $ToReturn =true;           
              
          break;
      }
      return $ToReturn;
  }

        function SetTransactionAsInvalid()
        {
           $data = array(

              'TransactionInvalid' => 1,

            );
      
            $this->ci->db->where('codeorden', $this->Code);
            $this->ci->db->where('num_registro', $this->CustomerCode);
            $this->ci->db->update('PAGO_MA', $data);
      
        }
        function SetTransactionAsValid()
        {
          $data = array(

            'TransactionInvalid' => 0,

          );
    
          $this->ci->db->where('codeorden', $this->Code);
          $this->ci->db->where('num_registro', $this->CustomerCode);
          $this->ci->db->update('PAGO_MA', $data);
        }



        function UpdateStatus($Status)
            {
                        
                $data = array(

                  'estatus' => $Status,
    
                );
          
                $this->ci->db->where('codeorden', $this->Code);
                $this->ci->db->where('num_registro', $this->CustomerCode);
                $this->ci->db->update('PAGO_MA', $data);
            }
  

}
