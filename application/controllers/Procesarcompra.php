<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Procesarcompra extends CI_Controller{

  public function __construct()
  {
    parent::__construct();
    $this->load->database();
		$this->load->helper('url');

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


  //metodo paa enviar a tablas de pago por transferencia
  public function pago_TD()
  {
    $respuesta='-1';
    $cod='-1';
    if(isset($_POST['nombre_fact']) && isset($_POST['apellido_fact']) && isset($_POST['email_fact']) && isset($_POST['sexofact']) && /* isset($_POST['tipoCedulafact']) && isset(['cedulafact']) &&*/ isset($_POST['telefono_fact']) && isset($_POST['pais']) && isset($_POST['nombre_delivery']) && isset($_POST['apellido_delivery']) && isset($_POST['tipoCeduladelivery']) && isset($_POST['sexodelivery']) && isset($_POST['ceduladelivery']) && isset($_POST['email_delivery']) && isset($_POST['telefono_delivery']) && isset($_POST['codpostal_delivery']) && isset($_POST['ciudad_delivery']) && isset($_POST['estado_delivery']) && isset($_POST['sector_delivery']) && isset($_POST['direccion_delivery']) && isset($_POST['nombre_pago']) && isset($_POST['apellido_pago']) && isset($_POST['referencia_pago']) && isset($_POST['Tipocedula_pago']) && isset($_POST['cedula_pago']) && isset($_POST['telefono_pago']) && isset($_POST['banco_emisor']) && isset($_POST['banco_receptor']) && isset($_POST['MontoP']) && isset($_POST['PaymentMethod']) && isset($_SESSION['correo']))
    {


      // validacion dsi viene el pago por zelle o es un pago normal, si viene por zelle el pagozelle sera igual a 1 que viene por ajax, sino el pago sera igual a 0 y seguara de manera estandar
      if (isset($_POST['pagoZelle'])) {
        
        $pagoZelle = $_POST['pagoZelle'];

      }else {
        
        $pagoZelle = 0;

      }

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


    //Pago con Transferencia
    $CheckoutClass->PaymentCDCPersonName = $_POST['nombre_pago'];
    $CheckoutClass->PaymentCDCPersonLastname = $_POST['apellido_pago'];
    $CheckoutClass->PagoPhone = $_POST['telefono_pago'];
    $CheckoutClass->PaymentCDCPersonTipoCedula = $_POST['Tipocedula_pago'];
    $CheckoutClass->PaymentCDCPersonCedula = $CheckoutClass->PaymentCDCPersonTipoCedula."-".$_POST['cedula_pago'];
    $CheckoutClass->PaymentMethod = $_POST['PaymentMethod'];

    // validacion en caso de que venga un pago por zelle ya uqe el resultado desde el JS sera 0 en caso del zelle asi no se guardara el banco emisor y receptor
    if ($_POST['banco_receptor'] == 0 && $_POST['banco_emisor'] == 0) {
     
      $CheckoutClass->BancoReceptor = "";
      $CheckoutClass->BancoEmisor = "";

    }else {
      
      $CheckoutClass->BancoReceptor = $_POST['banco_receptor'];
      $CheckoutClass->BancoEmisor = $_POST['banco_emisor'];

    }
    //----------------------------------------------------

    $CheckoutClass->PaymentCDCPersonName = $_POST['nombre_pago'];
    $CheckoutClass->PaymentRefNum = $_POST['referencia_pago'];

    // variable de validacion de pago por zelle
    $CheckoutClass->pagoZelle = $pagoZelle;

    $this->session->set_userdata('ReciboPago', '');

      //inicio guardar pago
    $GraboOrden=false;
    $GraboDatosEntrega=true;
          $CartClass = new Carts();


            $GraboOrden=$CheckoutClass->SaveOrden();
            $CheckoutClass->SetTransactionAsInvalid();

            if($GraboOrden) //si se grabaron los datos de la orden y la entrega procedo a hacer el pago
            {
              $CheckoutClass->newOrderDeliveryMethod();


             $GrabarPago=$CheckoutClass->newOrderPaymentMethod();


              if($GrabarPago)
              {
                  //Si no se grabo el pago actualiso el campo TransactionInvalid=1 del ORDER_MA
                  //esto disparara un correo a soporte reportantos que hay un error con el pago
                  //colocando el detalle del usuario y numero de orden con el error
                  $CheckoutClass->SetTransactionAsValid();
              }
              $CartClass->Type=1;
              $CartClass->DropCart($CheckoutClass->CustomerCode);
              $CartClass->InsertStatusToNotification($CheckoutClass->CustomerCode,5,$correo);
              $CheckoutClass->UpdateStatus(5);

              if($this->load->model('proceso_registro_model')){

                if(!$this->proceso_registro_model->actualizar_estatus($CheckoutClass->CustomerCode,4)){

                }
              }


              $this->functions_model->WriteLog(null,$CheckoutClass->PaymentCDCPersonName ,$CheckoutClass->PaymentCDCPersonCedula,$CheckoutClass->Total,$CheckoutClass->Subtotal,$CheckoutClass->Tax,$OrderNumber);

              $respuesta="Pago exitoso";
              $cod='1';


          }
          else
          {
            $CartClass->DropCart($CheckoutClass->CustomerCode);
            $CartClass->InsertStatusToNotification($CheckoutClass->CustomerCode,6,$correo);
            $CheckoutClass->UpdateStatus(0);
            $this->functions_model->WriteLog(null,$CheckoutClass->PaymentCDCPersonName ,$CheckoutClass->PaymentCDCPersonCedula,$CheckoutClass->Total,$CheckoutClass->Subtotal,$CheckoutClass->Tax,$OrderNumber);
            $respuesta='Error en el pago del pedido , por favor intente más tarde..';
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

}
