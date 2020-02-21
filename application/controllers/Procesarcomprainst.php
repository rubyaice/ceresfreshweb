<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Procesarcomprainst extends CI_Controller {

  public function __construct()
  {
    parent::__construct();

    $this->load->helper('url');
    $this->load->database();


    //validacion si el usuario esa registrado
    if (!$this->session->userdata('correo')) {
      redirect('login/login_view');
    }
    $this->load->model('functions_model');
    $Semana=$this->functions_model->GetSemana();
    $Dia=$this->functions_model->GetDataSemana();
    $this->session->set_userdata('SemanaActual', $Semana);
    $this->session->set_userdata('DiaSemanaActual', $Dia->ND);
    $this->session->set_userdata('DiaSemanaPago', $Dia->SEMANA_PAGO);

    $this->load->library('Instapago');
    $this->load->library('Checkouts');
    $this->load->library('Cards');
    $this->load->library('Carts');
    if (!class_exists('Instapago')) { require_once(APPPATH.'libraries/Instapago'.EXT); }
    if (!class_exists('Checkouts')) { require_once(APPPATH.'libraries/Checkouts'.EXT); }
    if (!class_exists('Cards')) { require_once(APPPATH.'libraries/Cards'.EXT); }
    if (!class_exists('Carts')) { require_once(APPPATH.'libraries/Carts'.EXT); }

  }

    //primera ejecucion de esta secccion
    public function index()
    {

      $respuesta='-1';
      $cod='-1';
      if(isset($_POST['nombre_fact']) && isset($_POST['apellido_fact']) && isset($_POST['email_fact']) && isset($_POST['sexofact']) && /* isset($_POST['tipoCedulafact']) && isset(['cedulafact']) &&*/ isset($_POST['telefono_fact']) && isset($_POST['pais']) && isset($_POST['nombre_delivery']) && isset($_POST['apellido_delivery']) && isset($_POST['tipoCeduladelivery']) && isset($_POST['sexodelivery']) && isset($_POST['ceduladelivery']) && isset($_POST['email_delivery']) && isset($_POST['telefono_delivery']) && isset($_POST['codpostal_delivery']) && isset($_POST['ciudad_delivery']) && isset($_POST['estado_delivery']) && isset($_POST['sector_delivery']) && isset($_POST['direccion_delivery']) && isset($_POST['nombre_tdc']) && isset($_POST['apellido_tdc']) && isset($_POST['PaymentCDCNumber']) && isset($_POST['Tipocedula_tdc']) && isset($_POST['cedula_tdc']) && isset($_POST['ExpirationYear']) && isset($_POST['ExpirationMonth']) && isset($_POST['codigoseguridad']) && isset($_POST['MontoP']) && isset($_POST['PaymentMethod']) && isset($_SESSION['correo']))
      {

      $respuesta='';
      $cod='-1';

      $correo=$_SESSION['correo'];
      $num_registro=$_SESSION['num_registro'];

      $conexion = $this->db->query("SELECT AF.nombre,AF.address,AF.apellido,AF.sexo,AF.address,AF.city,AF.pais,AF.phone,AF.phone,AF.state,AF.zipcode,AF.sector, AF.apellido, AF.plan_nut, AF.id_afiliacion, AF.correo,  AF.num_registro, CA.codeorder FROM CARRITO CA INNER JOIN AFILIADOS AF ON CA.num_registro = AF.num_registro WHERE AF.num_registro = '$num_registro'");
      $resultado_query = $conexion->row();
      $OrderNumber='';
      $PaymentCDCCondicion = true;
      if(!$resultado_query){

        $respuesta="Intente más tarde";
        $cod='-1';

      }
      else
      {
      //Checkouts class

      $OrderNumber=$resultado_query->codeorder;
      $CheckoutClass  = new Checkouts();

      $CheckoutClass->CustomerCode=$resultado_query->num_registro;
      $CheckoutClass->CustomerCodeAfilia=$resultado_query->id_afiliacion;
      $CheckoutClass->Code=$OrderNumber;
      $CheckoutClass->PersonEmail = $_POST['email_fact'];

      //Delivery
      $CheckoutClass->PickupPersonName = $_POST['nombre_delivery'];
      $CheckoutClass->PickupPersonLastname = $_POST['apellido_delivery'];
      $CheckoutClass->PickupPersonPhone = $_POST['telefono_delivery'];
      $CheckoutClass->PickupPersonEmail = $_POST['email_delivery'];
      $CheckoutClass->PickupPersonCedula = $_POST['tipoCeduladelivery']."-".$_POST['ceduladelivery'];


      $CheckoutClass->DelivetyMethodType=2;
      $CheckoutClass->DeliveryMethod = 2; //delivery
      $CheckoutClass->AdditionalPhone=$_POST['telefono_delivery'];
      $CheckoutClass->PersonAddress=$_POST['direccion_delivery'];
      $CheckoutClass->PersonCity=$_POST['ciudad_delivery'];
      $CheckoutClass->PersonState=$_POST['estado_delivery'];
      $CheckoutClass->PersonMunicipality=$_POST['sector_delivery'];
      $CheckoutClass->PersonPais=$_POST['pais'];
      $monto_total=$_POST['MontoP'];
      $sub_total=$_POST['MontoP'];

 
      $query = $this->db->query("SELECT ML.num_registro , correo,id_proveedor,nombre_proveedor,id_proceso FROM MA_LOGIN ML  INNER JOIN ESTATUS_REGISTRO_MA ER ON ML.num_registro = ER.num_registro WHERE ML.correo = '$correo'");
      $resultado = $query->row();
      
      $conexion = $this->db->query("SELECT AF.nombre, AF.apellido,AF.address,AF.city,AF.sexo,AF.edad,AF.pais,AF.phone,AF.phone,AF.state,AF.zipcode,AF.sector, AF.plan_nut, AF.id_afiliacion, AF.correo, CA.codeorder,CA.cantidad , AF.num_registro ,CA.productcode ,(PN.precio *MP.n_precio_m) AS precio,(PN.precio *MP.n_precio_m*CA.cantidad) AS monto,ER.id_proceso 
      FROM  CARRITO CA INNER JOIN AFILIADOS AF ON CA.correo = AF.correo INNER JOIN MA_PRODUCTOS MP ON MP.C_CODIGO=CA.productcode INNER JOIN ESTATUS_REGISTRO_MA ER ON CA.num_registro = ER.num_registro INNER JOIN PLAN_NUTRICIONAL PN ON AF.plan_nut = PN.id_plan WHERE AF.num_registro  = '$resultado->num_registro'");
      $respuesta_usuario_pago = $conexion->result();
      if ($respuesta_usuario_pago != null)
      {
      $monto_total=0;
      $sub_total=0;
      foreach ($respuesta_usuario_pago as $result) {
        //$cantidad_total+=$result->cantidad;               
        $sub_total+=$result->precio*$result->cantidad;
        $monto_total+=$result->precio*$result->cantidad;
        $orderCode=$result->codeorder;
    
      }
      }
      $CheckoutClass->Total=$monto_total;
      $CheckoutClass->Subtotal=$sub_total;
      $CheckoutClass->Tax=0;
      $CheckoutClass->PersonBenchmark='';


      //Pago con tarjeta
      $CheckoutClass->PaymentCDCPersonName = $_POST['nombre_tdc'];
      $CheckoutClass->PaymentCDCNumber = $_POST['cedula_tdc'];
      $CheckoutClass->PaymentCDCPersonLastname = $_POST['apellido_tdc'];
      $CheckoutClass->PaymentCDCPersonTipoCedula = $_POST['Tipocedula_tdc'];
      $CheckoutClass->PaymentCDCPersonCedula = $CheckoutClass->PaymentCDCPersonTipoCedula."-".$_POST['cedula_tdc'];
      $CheckoutClass->PaymentMethod = 2;
      $CheckoutClass->PaymentCDCExpirationMonth = $_POST['ExpirationMonth'];
      $CheckoutClass->PaymentCDCExpirationYear = $_POST['ExpirationYear'];
      $IP= $this->get_client_ip();
      //Estos datos ahora los sacare de aqui mismo
      /*$CheckoutClass->PaymentRefNum = $_POST['TdcRefNum'];
      $CheckoutClass->TdcPaymentId = $_POST['TdcPaymentId'];*/
      $this->session->set_userdata('ReciboPago', '');
      //Tarjeta

      $CardClass = new Cards();

      $this->load->model('functions_model');
      $CardClass->Code = $this->functions_model->GetCorrelative("CARDS_MA",true);
      $CardClass->CustomerCode = $CheckoutClass->CustomerCode;
      $CardClass->Name = $CheckoutClass->PaymentCDCPersonName;
      $CardClass->CardNumber = $CheckoutClass->PaymentCDCNumber;
      $CardClass->Lastname = $CheckoutClass->PaymentCDCPersonLastname;
      $CardClass->Cedula = $CheckoutClass->PaymentCDCPersonCedula;
      $CardClass->Month = $_POST['ExpirationMonth'];
      $CardClass->Year = $_POST['ExpirationYear'];

        //inicio guardar pago
      $GraboOrden=false;
      $GraboDatosEntrega=true;


  

            $CartClass = new Carts();
     
           /* $CheckoutClass->SetTransactionAsInvalid();
            $CheckoutClass->UpdateStatus(2);*/

            //************************************************************ */
            //********************INSTAPAGO******************************* */
            //************************************************************ */
            $InstapagoClass = new Instapago();
            $Description= "Compra Online CeresFresh";
            $CardHolder=$_POST['nombre_tdc'].' '.$_POST['apellido_tdc'];
            $CardHolderID= $_POST['cedula_tdc'];
            $CardNumber=  $_POST['PaymentCDCNumber'];
            $CVC= $_POST['codigoseguridad'];
            $ExpirationDate= $_POST['ExpirationMonth'].'/'.$_POST['ExpirationYear'];

            $PaymentMethod = $_POST['PaymentMethod'];
            $StatusID= '1'; // 2 -> A partir de hoy 2017/11/06 Pago Preautorizado en vez de pago instanteneo.
            $Amount=$_POST['MontoP'];//buscar en bd

            //$InstapagoClass->KeyId=$KeyId;
            //$InstapagoClass->PublicKeyId=$PublicKeyId;
            $InstapagoClass->Amount=$Amount;
            $InstapagoClass->CardHolder=$CardHolder;
            $InstapagoClass->Description=$Description;
            $InstapagoClass->CardHolderID=$CardHolderID;
            $InstapagoClass->CardNumber=$CardNumber;
            $InstapagoClass->CVC=$CVC;
            $InstapagoClass->ExpirationDate=$ExpirationDate;

            $InstapagoClass->IP=$IP;
            $InstapagoClass->OrderNumber=$OrderNumber;
            $InstapagoClass->Address=$resultado_query->address;
            $InstapagoClass->City=$resultado_query->city;;
            $InstapagoClass->ZipCode=$resultado_query->zipcode;
            $InstapagoClass->State=$resultado_query->state;;
            $InstapagoClass->StatusID=1;


        //**********************************************************************************************
        //****************DATOS DE INSTAPAGO**************************************************************
        //**********************************************************************************************
            $RespuestaInstapago = $InstapagoClass->ProcesarPago();
            if($RespuestaInstapago) // SI PASO EL PAGO
            {
              if($RespuestaInstapago->code=='201') // SI PASO EL PAGO
              {
                $GraboOrden=$CheckoutClass->SaveOrden();
              }
              else
              {
                  //$conexion->RollbackTrans();
                  $this->functions_model->WriteInstaPagoLog($InstapagoClass->mensaje,null,$OrderNumber);
                  $this->functions_model->WriteLog(null,$CardHolder,$CardHolderID,$CheckoutClass->Total,$CheckoutClass->Subtotal,$CheckoutClass->Tax,$OrderNumber);
                  $RespuestaInstapago = json_decode($InstapagoClass->mensaje);
  
                  $respuesta=$RespuestaInstapago;
                  $cod='-1';      
              }
              if($GraboOrden) //si se grabaron los datos de la orden y la entrega procedo a hacer el pago
              {
                $CheckoutClass->newOrderDeliveryMethod();


                $CheckoutClass->PaymentRefNum = $RespuestaInstapago->reference;
                $CheckoutClass->TdcPaymentId = $RespuestaInstapago->id;
                $_SESSION["ReciboPago"]=$RespuestaInstapago->voucher;


                $GrabarPago=$CheckoutClass->newOrderPaymentMethod();
                            //llegado a este punto voy a grabar igual puesto que tengo la orden y el pago
                //El pago de instapago tiene el numero de orden por lo que si se
                //genera un error se puede recontruir teniendo la orden y el pago

                if($PaymentCDCCondicion)
                {
                    $CardClass->NewCard();
                }
                if($GrabarPago)
                {
                    //Si no se grabo el pago actualiso el campo TransactionInvalid=1 del ORDER_MA
                    //esto disparara un correo a soporte reportantos que hay un error con el pago
                    //colocando el detalle del usuario y numero de orden con el error
                    $CheckoutClass->SetTransactionAsValid();
                }
                $CartClass->Type=1;
                $CartClass->DropCart($CheckoutClass->CustomerCode);
                $CartClass->InsertStatusToNotification($CheckoutClass->CustomerCode,3,$correo);
                $CheckoutClass->UpdateStatus(3);

                if($this->load->model('proceso_registro_model')){

                  if(!$this->proceso_registro_model->actualizar_estatus($CheckoutClass->CustomerCode,4)){

                  }
                }

                $this->functions_model->WriteInstaPagoLog($InstapagoClass->mensaje,null,$OrderNumber);
                $this->functions_model->WriteLog(null,$CardHolder,$CardHolderID,$CheckoutClass->Total,$CheckoutClass->Subtotal,$CheckoutClass->Tax,$OrderNumber);

                $respuesta="Pago exitoso";
                $cod='1';
            

            }
            else
            {
              $this->functions_model->WriteLog(null,$CardHolder,$CardHolderID,$CheckoutClass->Total,$CheckoutClass->Subtotal,$CheckoutClass->Tax,$OrderNumber);
              $respuesta='Error en el pago del pedido , por favor intente más tarde..';
              $cod='-1';
            }
          }
          else
          {
              //$conexion->RollbackTrans();
              $this->functions_model->WriteInstaPagoLog($InstapagoClass->mensaje,null,$OrderNumber);
              $this->functions_model->WriteLog(null,$CardHolder,$CardHolderID,$CheckoutClass->Total,$CheckoutClass->Subtotal,$CheckoutClass->Tax,$OrderNumber);
              $RespuestaInstapago = json_decode($InstapagoClass->mensaje);

              $respuesta=$RespuestaInstapago;
              $cod='-1';

          }

     
        }

      }
          $response = array(
            'respuesta' =>   $respuesta,
            'cod'=> $cod


          );
            echo json_encode($response);



    }




    function get_client_ip() {
      $ipaddress = '';
      if (getenv('HTTP_CLIENT_IP'))
          $ipaddress = getenv('HTTP_CLIENT_IP');
      else if(getenv('HTTP_X_FORWARDED_FOR'))
          $ipaddress = getenv('HTTP_X_FORWARDED_FOR');
      else if(getenv('HTTP_X_FORWARDED'))
          $ipaddress = getenv('HTTP_X_FORWARDED');
      else if(getenv('HTTP_FORWARDED_FOR'))
          $ipaddress = getenv('HTTP_FORWARDED_FOR');
      else if(getenv('HTTP_FORWARDED'))
          $ipaddress = getenv('HTTP_FORWARDED');
      else if(getenv('REMOTE_ADDR'))
          $ipaddress = getenv('REMOTE_ADDR');
      else
          $ipaddress = 'UNKNOWN';
      return $ipaddress;
  }





}
