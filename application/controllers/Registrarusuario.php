<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Registrarusuario extends CI_Controller {

  public function __construct()
  {
      parent::__construct();
      $this->load->helper('url');
      $this->load->database();

      $this->load->model('functions_model');
      $Semana=$this->functions_model->GetSemana();
      $Dia=$this->functions_model->GetDataSemana();
      $this->session->set_userdata('SemanaActual', $Semana);
      $this->session->set_userdata('DiaSemanaActual', $Dia->ND);
      $this->session->set_userdata('DiaSemanaPago', $Dia->SEMANA_PAGO);
      $this->load->library('email');

  }

  //primera ejecucion de esta secccion
	public function index()
	{

    //datos que estan lleganod del AJAX
    $correo = $_POST['correo'];
    $clave_usuario = $_POST['clave'];
    $clave = hash('ripemd160', $clave_usuario);

    //validacion de si el usuario esta registrado con su usuario y contraseña 
    if(isset($correo) && isset($clave) != ""){

      // consulta para saber si el usuario que se esta tratando de registrar ya se encuentra en afiliacion
      $consulta_existe_afiliacion = $this->db->query("SELECT correo FROM AFILIADOS WHERE correo = '$correo'");
      $respuesta_existe_afiliacion = $consulta_existe_afiliacion->row();

        if ($respuesta_existe_afiliacion != null) {

          $consulta_credenciales_usuario = $this->db->query("SELECT * FROM MA_LOGIN WHERE correo = '$correo'");
          $respuesta_credenciales_usuario = $consulta_credenciales_usuario->row();

          if ($respuesta_credenciales_usuario != null) {
        
            $consulta_clave_usuario = $this->db->query("SELECT * FROM MA_LOGIN WHERE correo = '$correo' AND clave = '$clave'");
            $respuesta_clave_usuario = $consulta_clave_usuario->row();

            if ($respuesta_clave_usuario != null) {
          
              $consulta_act_usuario = $this->db->query("SELECT * FROM MA_LOGIN WHERE correo = '$correo' AND clave = '$clave' AND estatus = '1'");
              $respuesta_act_usuario = $consulta_act_usuario->row();

              if($respuesta_act_usuario == null){

                $respuesta_clave = 6;
                $response = array(

                  'respuesta' => $respuesta_clave 

                );

                echo json_encode($response);
                return;

              }
         

            }else{

              $respuesta_clave = 5;
              $response = array(

                'respuesta' => $respuesta_clave 

              );

              echo json_encode($response);
              return;

            }
          
          // esto es en caso de que el usuario este ya afiliado a algun otro usuario, no se podra registrar
          }else{

            $respuesta_clave = 7;
            $response = array(

              'respuesta' => $respuesta_clave 

            );

            echo json_encode($response);
            return;

          }
        }else {

          $consulta_credenciales_usuario = $this->db->query("SELECT * FROM MA_LOGIN WHERE correo = '$correo'");
          $respuesta_credenciales_usuario = $consulta_credenciales_usuario->row();

          if ($respuesta_credenciales_usuario != null) {
          
          $consulta_clave_usuario = $this->db->query("SELECT * FROM MA_LOGIN WHERE correo = '$correo' AND clave = '$clave'");
          $respuesta_clave_usuario = $consulta_clave_usuario->row();

          if ($respuesta_clave_usuario != null) {
        
            $consulta_act_usuario = $this->db->query("SELECT * FROM MA_LOGIN WHERE correo = '$correo' AND clave = '$clave' AND estatus = '1'");
            $respuesta_act_usuario = $consulta_act_usuario->row();

            if($respuesta_act_usuario == null){

              $respuesta_clave = 6;
              $response = array(

                'respuesta' => $respuesta_clave 

              );

              echo json_encode($response);
              return;

            }
       

          }else{

            $respuesta_clave = 5;
            $response = array(

              'respuesta' => $respuesta_clave 

            );

            echo json_encode($response);
            return;

          }

        }
      }

    }

    //---------------------------------------------

		$respuesta='';

    $proceso='-1';
    $existe = $this->db->query("SELECT ML.num_registro , correo,id_proveedor,nombre_proveedor,id_proceso FROM MA_LOGIN ML  INNER JOIN ESTATUS_REGISTRO_MA ER ON ML.num_registro = ER.num_registro WHERE ML.correo = '$correo'");
    $resultado = $existe->row();
    $datapersonal=array();
 
  
    if ($resultado) {
      $proceso=$resultado->id_proceso;
          switch ($proceso) {
            case '1':
              # code...
              break;
            case '2':
              # code...

              $this->load->model('usuario_model');
              if($this->usuario_model->login($_POST['correo'],$_POST['clave'])) {
                $this->session->set_userdata('num_registro', $resultado->num_registro);
                $this->session->set_userdata('correo', $_POST['correo']);
                     
            
              }
              else {
                $this->session->set_userdata('num_registro', $resultado->num_registro);
                $respuesta='-1';    
              }
              break;
            case '3':
              # code...

              $this->load->model('usuario_model');
              if($this->usuario_model->login($_POST['correo'],$_POST['clave'])) {
                $this->session->set_userdata('num_registro', $resultado->num_registro);
                $respuesta='3';
                $datos = $this->db->query("SELECT AF.nombre, AF.apellido,AF.city,AF.pais,AF.phone,AF.phone,AF.address,AF.state,AF.zipcode,AF.sector, AF.plan_nut, AF.id_afiliacion, AF.correo, CA.codeorder,CA.cantidad , AF.num_registro ,CA.productcode ,(PN.precio *MP.n_precio_m) AS precio,(PN.precio *MP.n_precio_m*CA.cantidad) AS monto,ER.id_proceso 
                FROM  CARRITO CA INNER JOIN AFILIADOS AF ON CA.correo = AF.correo INNER JOIN MA_PRODUCTOS MP ON MP.C_CODIGO=CA.productcode INNER JOIN ESTATUS_REGISTRO_MA ER ON CA.num_registro = ER.num_registro INNER JOIN PLAN_NUTRICIONAL PN ON AF.plan_nut = PN.id_plan WHERE AF.num_registro =  '$resultado->num_registro'");
                $resultado_data = $datos->row();               
                $this->session->set_userdata('correo', $_POST['correo']);
                $datapersonal = array(
                  'phone' =>  $resultado_data->phone,
                  'address'=> $resultado_data->address,
                  'state'=> $resultado_data->state,
                  'zipcode'=>$resultado_data->zipcode,
                  'sector'=>$resultado_data->sector,
                  'pais'=> $resultado_data->pais,
                  'city'=>$resultado_data->city,
                  'nombre' =>  $resultado_data->nombre,
                  'apellido'=> $resultado_data->apellido,                  
                  'correo'=>$resultado_data->correo,
                  'id_afiliacion'=> $resultado_data->id_afiliacion,
                  'num_registro'=>$resultado_data->num_registro,
                  'monto' => number_format($resultado_data->monto, 2, '.',',')
                );
                $proceso=$resultado_data->id_proceso;
                $respuesta=1;
              }
              else {
                $this->session->set_userdata('num_registro', $resultado->num_registro);
                $proceso=$resultado_data->id_proceso;
                $respuesta='-1';
                
              }
              
              break;
            case '4':
              # code...

              $this->load->model('usuario_model');
              if($this->usuario_model->login($_POST['correo'],$_POST['clave'])) {
                $this->session->set_userdata('num_registro', $resultado->num_registro);
                $this->session->set_userdata('correo', $_POST['correo']);
                $respuesta='4';          
            
              }
              else {

                $this->session->set_userdata('num_registro', $resultado->num_registro);
                $respuesta='-1';
              }
              break;
            
            default:
              # code...
              break;
            }           

              
            // habilitar luego $this->session->set_userdata('correo', $_POST['correo']);              
         

    }
    else {

        $this->load->model('registrar_usuarios_model');

        if ($this->registrar_usuarios_model->registrar_usuarios($_POST['correo'], $_POST['nombre_proveedor'],$_POST['clave'])){

           
            $existe_reg = $this->db->query("SELECT ML.num_registro , correo,id_proveedor,nombre_proveedor,id_proceso FROM MA_LOGIN ML  INNER JOIN ESTATUS_REGISTRO_MA ER ON ML.num_registro = ER.num_registro WHERE ML.correo = '$correo'");
            $resultado_reg = $existe_reg->row();

            $proceso=$resultado_reg->id_proceso;
            //$monto=$resultado_reg->Precio*$resultado_reg->cantidad;
     



            switch ($proceso) {
                    case '1':
                      # code...
                      break;
                    case '2':
                      # code...
        
                      $respuesta= "Registro completado";
                      $envio_correo = 10;
                      $response = array(
            
                        'respuesta' => $envio_correo 
            
                      );
            
                      echo json_encode($response);
                      return;

                      break;
                    case '3':
                        
                          
                      break;
                      case '4':
                        # code...

                        break;
                      
                      default:
                        # code...
                        break;
                  }    

        } else {

            $respuesta= "Registro no completado, Error!!";

        }

      }




    $response = array(
     'respuesta' =>   $respuesta,
     'correo'=> $_POST['correo'],
     'estatus'=>$proceso,
     'datapersonal'=>$datapersonal
   );
     echo json_encode($response);
  
  }

  //insertar datos en tablas de pago y afiliacion
  public function insertar_en_afiliacion()
  {

    //recepcion de datos para enviar a tabla suscripcion



    $this->load->model('afiliar_usuario_model');
    $proceso='-1';
    $respuesta= "-1";
    $resultado=false;
    $monto=0;
    $correo=$_SESSION['correo'];
    $numero_registro='';
    if(isset($_POST['correo_reg'])){
        $correo=$_POST['correo_reg'];
        $correo_loguead=$_SESSION['correo'];

        $existe = $this->db->query("SELECT *  FROM AFILIADOS where correo = '$correo'");
        $resultado = $existe->row();
        $query = $this->db->query("SELECT *  FROM MA_LOGIN where correo = '$correo_loguead'");
        $resultado_query = $query->row();
        $numero_registro=$resultado_query->num_registro;
      if(!$resultado){
            if ($this->afiliar_usuario_model->afiliar_usuario($_POST['nombre_reg'], $_POST['sexo_reg'], $_POST['estatura_reg'], $_POST['act_fisica_reg'], $_POST['apellido_reg'], $_POST['edad_reg'], $_POST['peso_reg'], $_POST['condicion_esp_reg'], $_POST['pais_reg'], $_POST['ciudad_reg'], $_POST['codigopostal_reg'], $_POST['estado_reg'], $_POST['telefono_reg'], $_POST['direccion_reg'], $_POST['correo_reg'],$numero_registro,$_POST['sector_reg']))
            {
              
              //nvio de correo al completar el proceso de afilición del usuario

              /*$proceso_email = "2";

              $this->load->library('enviaremail');
              $respuesta_correo = $this->enviaremail->enviar_correo($correo, $proceso_email);*/

              $existe2 = $this->db->query("SELECT AF.nombre, AF.apellido,AF.address,AF.city,AF.pais,AF.phone,AF.phone,AF.state,AF.zipcode,AF.sector, AF.plan_nut, AF.id_afiliacion, AF.correo, CA.codeorder,CA.cantidad , AF.num_registro ,CA.productcode ,(PN.precio *MP.n_precio_m) AS precio,(PN.precio *MP.n_precio_m*CA.cantidad) AS monto,ER.id_proceso, PN.precio AS preciodolar 
              FROM  CARRITO CA INNER JOIN AFILIADOS AF ON CA.correo = AF.correo INNER JOIN MA_PRODUCTOS MP ON MP.C_CODIGO=CA.productcode INNER JOIN ESTATUS_REGISTRO_MA ER ON CA.num_registro = ER.num_registro INNER JOIN MA_LOGIN ML ON  ML.num_registro=AF.num_registro INNER JOIN PLAN_NUTRICIONAL PN ON AF.plan_nut = PN.id_plan WHERE AF.correo = '$correo'");
              $resultado_data = $existe2->row();
              $proceso=$resultado_data->id_proceso;            
              $respuesta= $proceso;       
              $monto=number_format($resultado_data->monto, 2, '.',',');
              $this->session->set_userdata('num_registro', $resultado_data->num_registro);
               
          
            }
            else{
              
                $proceso='-1';
                $respuesta= "-1";
              
            }
          
      }  
      else {
            $datos = $this->db->query("SELECT AF.nombre, AF.apellido,AF.address,AF.city,AF.pais,AF.phone,AF.phone,AF.state,AF.zipcode,AF.sector, AF.plan_nut, AF.id_afiliacion, AF.correo, CA.codeorder,CA.cantidad , AF.num_registro ,CA.productcode ,(PN.precio *MP.n_precio_m) AS precio,(PN.precio *MP.n_precio_m*CA.cantidad) AS monto,ER.id_proceso, PN.precio AS preciodolar 
            FROM  CARRITO CA INNER JOIN AFILIADOS AF ON CA.correo = AF.correo INNER JOIN MA_PRODUCTOS MP ON MP.C_CODIGO=CA.productcode INNER JOIN ESTATUS_REGISTRO_MA ER ON CA.num_registro = ER.num_registro INNER JOIN MA_LOGIN ML ON  ML.num_registro=AF.num_registro INNER JOIN PLAN_NUTRICIONAL PN ON AF.plan_nut = PN.id_plan WHERE AF.correo = '$correo'");
            $resultado_data = $datos->row();
            $proceso=$resultado_data->id_proceso;
            $respuesta= "-1";
            $monto=number_format($resultado_data->monto, 2, '.',',');
            $this->session->set_userdata('num_registro', $resultado_data->num_registro); 
            
            

        }   
    }
    
          $response = array(
          'respuesta' =>   $respuesta,
          'correo'=> $correo,
          'estatus'=>$proceso,
          'monto'=>$monto,
          'montoDolares' => $resultado_data->preciodolar
          
        );
     
          echo json_encode($response);
  }

    public function ProcesarInstaPago()
    {

    $this->load->library('Instapago');
    $this->load->library('Checkouts');
    $this->load->library('Cards');
    $this->load->library('Carts');
    
    if (!class_exists('Instapago')) { require_once(APPPATH.'libraries/Instapago'.EXT); } 
    if (!class_exists('Checkouts')) { require_once(APPPATH.'libraries/Checkouts'.EXT); } 
    if (!class_exists('Cards')) { require_once(APPPATH.'libraries/Cards'.EXT); }
    if (!class_exists('Carts')) { require_once(APPPATH.'libraries/Carts'.EXT); }

    $respuesta='';
    $cod='-1';
    if(isset($_SESSION['correo']))
    {
    $correo=$_SESSION['correo'];
    }
    else {
      $correo=$_POST['correo_reg'];
    }
    $Description= "Compra Online CeresFresh";
    $CardHolder=$_POST['nombre_reg'].' '.$_POST['apellido_reg'];
    $CardHolderID= $_POST['cedula'];
    $CardNumber=  $_POST['PaymentCDCNumber'];
    $CVC= $_POST['codigoseguridad'];
    $ExpirationDate= $_POST['ExpirationMonth'].'/'.$_POST['ExpirationYear'];
    $IP= $this->get_client_ip();
    $PaymentMethod = $_POST['PaymentMethod'];
    $StatusID= '1'; // 2 -> A partir de hoy 2017/11/06 Pago Preautorizado en vez de pago instant�neo.
    $conexion = $this->db->query("SELECT AF.nombre, AF.apellido, AF.plan_nut, AF.id_afiliacion, AF.correo, CA.codeorder,  AF.num_registro FROM CARRITO CA INNER JOIN AFILIADOS AF ON CA.num_registro = AF.num_registro WHERE CA.correo = '$correo'");
    $resultado_query = $conexion->row();
    $OrderNumber='';
    $PaymentCDCCondicion = true;
    if(!$resultado_query){

      $respuesta="Intente más tarde";
      $cod='-1';
       
    }
    else
    {      
    $OrderNumber=$resultado_query->codeorder;
    $Address= $_POST['direccion_reg'];
    $City= $_POST['ciudad_reg'];
    $ZipCode= $_POST['codigopostal_reg'];
    $State= $_POST['estado_reg'];

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
    $Amount=$monto_total;//buscar en bd

    
    $CheckoutClass  = new Checkouts();
    
    $CheckoutClass->CustomerCode=$resultado_query->num_registro;
    $CheckoutClass->CustomerCodeAfilia=$resultado_query->id_afiliacion;
    $CheckoutClass->Code=$OrderNumber;
    $CheckoutClass->PersonEmail = $_POST['correo_reg'];

    //Delivery
    $CheckoutClass->PickupPersonName = $_POST['nombre_login'];
    $CheckoutClass->PickupPersonLastname = $_POST['apellido_login'];
    $CheckoutClass->PickupPersonPhone = $_POST['telefono_reg'];
    $CheckoutClass->PickupPersonEmail = $_POST['correo_reg'];
    $CheckoutClass->PickupPersonCedula = $_POST['Tipocedula']."-".$_POST['cedula'];
    $CheckoutClass->DelivetyMethodType=2;
    $CheckoutClass->DeliveryMethod = 2; //delivery
    $CheckoutClass->AdditionalPhone=$_POST['telefono_reg'];
    $CheckoutClass->PersonAddress=$_POST['direccion_reg'];
    $CheckoutClass->PersonCity=$_POST['ciudad_reg'];
    $CheckoutClass->PersonState=$_POST['estado_reg'];
    $CheckoutClass->PersonMunicipality=$_POST['sector_reg'];
    $CheckoutClass->PersonPais=$_POST['pais_reg'];
    $CheckoutClass->Total=$monto_total;
    $CheckoutClass->Subtotal=$sub_total;
    $CheckoutClass->Tax=0;
    $CheckoutClass->PersonBenchmark='';


    //Pago con tarjeta
    $CheckoutClass->PaymentCDCPersonName = $_POST['nombre_reg'];
    $CheckoutClass->PaymentCDCNumber = $_POST['cedula'];
    $CheckoutClass->PaymentCDCPersonLastname = $_POST['apellido_reg'];
    $CheckoutClass->PaymentCDCPersonTipoCedula = $_POST['Tipocedula'];
    $CheckoutClass->PaymentCDCPersonCedula = $CheckoutClass->PaymentCDCPersonTipoCedula."-".$_POST['cedula'];
    $CheckoutClass->PaymentMethod = $_POST['PaymentMethod'];
    $CheckoutClass->PaymentCDCExpirationMonth = $_POST['ExpirationMonth'];
    $CheckoutClass->PaymentCDCExpirationYear = $_POST['ExpirationYear'];
    //Estos datos ahora los sacare de aqui mismo
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


     
          /*$CheckoutClass->SetTransactionAsInvalid();
          $CheckoutClass->UpdateStatus(2);*/
        
          //************************************************************ */
          //********************INSTAPAGO******************************* */
          //************************************************************ */    
          $InstapagoClass = new Instapago();

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
          $InstapagoClass->Address=$Address;
          $InstapagoClass->City=$City;
          $InstapagoClass->ZipCode=$ZipCode;
          $InstapagoClass->State=$State;
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
            if($GraboOrden) // SI PASO EL PAGO
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
            $respuesta='Error en el registro del pedido , por favor intente más tarde..';
            $cod='-1';
              
          }
        }
        else
        {
          $CartClass->InsertStatusToNotification($CheckoutClass->CustomerCode,6,$correo);
            //$conexion->RollbackTrans();
            $this->functions_model->WriteInstaPagoLog($InstapagoClass->mensaje,null,$OrderNumber);
            $this->functions_model->WriteLog(null,$CardHolder,$CardHolderID,$CheckoutClass->Total,$CheckoutClass->Subtotal,$CheckoutClass->Tax,$OrderNumber);
            $RespuestaInstapago = json_decode($InstapagoClass->mensaje);
           
            $respuesta=$RespuestaInstapago;
            $cod='-1';
            
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

  //metodo para ratar de restornar el plan nutricional del cliente luego de haber completado el registro en la seccion de direccion y seguido a la parete de pago
  public function plan_nut_modal_reg()
  {

    $llamado = $_POST['llamdo'];
    
    $correo_usuario = $_SESSION['correo'];

    $consulta_plan_nut_usuario = $this->db->query("SELECT plan_nut FROM AFILIADOS WHERE correo = '$correo_usuario'");
    $respuesta_plan_nut_usuario = $consulta_plan_nut_usuario->row();

    $plan_nut = $respuesta_plan_nut_usuario->plan_nut;

    $consulta_Kcal_usuario = $this->db->query("SELECT calorias_diaria FROM PLAN_NUTRICIONAL WHERE id_plan = '$plan_nut'");
    $respuesta_Kcal_usuario = $consulta_Kcal_usuario->row();

    $Kcal_usuario = $respuesta_Kcal_usuario->calorias_diaria;

    $html = '';
    $calorias_usuario = '';
    
    if (isset($plan_nut) != null) {
       
      $html = "$plan_nut";
      $calorias_usuario = "Tu dieta esta basada en un aporte diario de <b>".$Kcal_usuario."</b> KCal.";

      $response = array(

        'html' => $html,
        'calorias_usuario' => $calorias_usuario

      );

      echo json_encode($response);

    }else{

      $html = 'Procesando...';

      $response = array(

        'html' => $html

      );

      echo json_encode($response);

    }

  }

  //metodo para devolver las comidas (desayuno almuerzo cena etc.) segun el plan nutricional
  public function cargar_comidas_plan()
  {
    
    $recibido = $_POST['recibido'];
    
    $correo_usuario = $_SESSION['correo'];

    $consulta_plan_nut_usuario = $this->db->query("SELECT plan_nut FROM AFILIADOS WHERE correo = '$correo_usuario'");
    $respuesta_plan_nut_usuario = $consulta_plan_nut_usuario->row();

    $plan_nut = $respuesta_plan_nut_usuario->plan_nut;

    //consulta para traerme las comidas del dia segun el plan nutrcional
    $consulta_comidas = $this->db->query("SELECT DISTINCT PNT.descripcion, PNT.indice FROM PLAN_NUTRICIONAL_PORCION PNP INNER JOIN PLAN_NUTRICIONAL_TIPO_COMIDA PNT ON PNP.comida = PNT.tipo_comida WHERE id_plan = '$plan_nut' ORDER BY indice ASC");
    $respuesta_comidas = $consulta_comidas->result();

    //en la respuesta se envia el contador de igual manera para decir cuantas comidas tiene el dia segun el plan
    $html_respuesta = '';
    $html_cont = 0;

    foreach ($respuesta_comidas as $result) {
      
      $html_respuesta .= $result->descripcion.', ';
      $html_cont++;
    }

    $response = array(

      'html_respuesta' => $html_respuesta,
      'html_cont' => $html_cont

    );

    echo json_encode($response);

  }

  //meodo para enviar nuevamente el correo de reactivacion de cuenta en caso de que nunca fue activada
  public function reenviar_activacion_correo()
  {
    
    $correo_usuario = $_POST['correo'];
    $clave_usuario = $_POST['clave'];

    $token_clave = hash('ripemd160', $clave_usuario);

    $consulta_correo_usuario = $this->db->query("SELECT correo FROM MA_LOGIN WHERE correo = '$correo_usuario' AND clave = '$token_clave'");
    $respuesta_consulta_usuario = $consulta_correo_usuario->row();

    //si existe el coreeo del usuario
    if ($respuesta_consulta_usuario != null) {

      $id_activacion_user = uniqid();

      $data_id_activacion = array(

        'id_activacion' => $id_activacion_user

      );

      //actualizo el campo con un nuevo codigo unico
      $this->db->where('correo', $correo_usuario);
      
      if ($this->db->update('MA_LOGIN', $data_id_activacion)) {
        
        //consulta para saber el usuario smtp del cliente segun sea elegido
        $consulta_reglas_correo = $this->db->query("SELECT * FROM REGLASDENEGOCIO WHERE Campo = 'Correo_Direccion'");
        $repuesta_reglas_correo = $consulta_reglas_correo->row();

        //consulta para saber la clave smtp del cliente segun sea elegido
        $consulta_reglas_pass = $this->db->query("SELECT * FROM REGLASDENEGOCIO WHERE Campo = 'Correo_Password'");
        $repuesta_reglas_pass = $consulta_reglas_pass->row();

        //variables para inicio de sesion en SMTP
        $host_user = $repuesta_reglas_correo->Valor;
        $host_pass = $repuesta_reglas_pass->Valor;
        
        $config = Array(

          'protocol' => 'smtp',
          'smtp_host' => 'ssl://smtp.gmail.com',
          'smtp_port' => '465',
          'smtp_user' => $host_user,
          'smtp_pass' => $host_pass,
          'mailtype'  => 'html', 
          'charset'   => 'utf-8'
        );

        //varaibles vacias que sera rellenadas segun el caso de su uso
        $html = '';
        $asunto = '';

        $asunto = 'Activar cuenta Ceresfresh';
        $base_url = base_url('img/Ceres/CERES_Icon.png');
        $url = site_url('activarcuenta/?CodeUniqActive_Oop='.$id_activacion_user);

        $enlace = '<a href="'.$url.'">'.$url.'</a>';

        $html .= '<!DOCTYPE html>
        <html>
        <head>
            <meta charset="utf-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <title>Ceesfresh</title>
            <meta name="viewport" content="width=device-width, initial-scale=1">
        </head>
        <body>
            <div class="container">
                <div style="text-align:center;">
                    <br><br>
                    <img style="max-width:50%; height: auto;" aria-readonly="true" src="'.$base_url.'" alt="ceres">
                    <h2>Activación de correo electrónico Ceres<span style="color:#7cbd41">fresh</span></h2>
                    
                    <p>Por favor has Click en el siguiente enlace para Activar tu cuenta.</p>
                    
                    '.$enlace.'
                    
                </div>
            </div>
        </body>
        </html>';

        $this->email->initialize($config);
        $this->email->set_newline("\r\n");

        $this->email->from('ceresfreshweb@gmail.com', 'Ceresfresh');
        $this->email->to($correo_usuario); 
        $this->email->subject($asunto);
        $this->email->message($html);
        // Set to, from, message, etc.

        if ($this->email->send()) {
          
          $this->session->set_userdata('id_activacion', $id_activacion_user);

        }

        //respuesta en caso de que todo salga bien
        $respuesta_activacion = 1;

        $response = array(

          'respuesta_activacion' => $respuesta_activacion

        );

        echo json_encode($response);

        return;

      }else{

        //respuesta en caso de que la actualizacion falle
        $respuesta_activacion = 2;

        $response = array(

          'respuesta_activacion' => $respuesta_activacion

        );

        echo json_encode($response);

        return;

      }

    }else{

      //respuesta en caso de que la actualizacion falle
      $respuesta_activacion = 3;

      $response = array(

        'respuesta_activacion' => $respuesta_activacion

      );

      echo json_encode($response);

      return;
    }

    //respuesta en caso de que no haya conexion a internet
    $respuesta_activacion = 4;

    $response = array(

      'respuesta_activacion' => $respuesta_activacion

    );

    echo json_encode($response);

    return;

  }


}
