<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class EstatusPago extends CI_Controller {

	public function __construct()
	{
		parent::__construct();

		$this->load->helper('url');
		$this->load->database();
		if (!$this->session->userdata('correo_admin')) {
			redirect('admin/login');
		}
		$this->load->library('admin/Orders');
    
        if (!class_exists('Orders')) { require_once(APPPATH.'libraries/admin/Orders'.EXT); } 
        $this->load->library('admin/Customers');
    
		if (!class_exists('Customers')) { require_once(APPPATH.'libraries/admin/Customers'.EXT); } 
	}


    //metodo para aprovar o rechazar el pago de traferencia o deposito bancario
	public function aprobar_rechazar_pago()
	{
        //coreeo del usuario que esta en sesion
        $num_registro = $_REQUEST['num_registro'];

        $code = $_REQUEST['code'];
        $estatus = $_REQUEST['estatus'];

        $data_pago = array(

            'estatus' => $estatus

        );

        $respuesta = false;

        //actualizacion de estatus segun la opcion que se selecciono
        $this->db->where('codeorden', $code);

        if ($this->db->update('PAGO_MA', $data_pago)){

            $consulta_correo_usuario = $this->db->query("SELECT correo FROM MA_LOGIN WHERE num_registro = '$num_registro'");
            $respuesta_correo_usuario = $consulta_correo_usuario->row();
            
            $correo_usuario = $respuesta_correo_usuario->correo;


            //data que se enviara a la taba de notificaciones para actualizar la notificacion del usuario
            $data_notificacion = array(

                'correo' => $correo_usuario,
                'tipo' => $estatus,
                'num_registro' => $num_registro
            );

            //insercion de la notificaicion en la tabla de notificaicones para e usuario  
            $this->db->insert('NOTIFICACIONES', $data_notificacion);

            //definicion de datos para llamar al servico de envio de correos electronicos de notificacion
            $this->load->model('admin/Correoservice_model');

            $respuesta_correo = $this->Correoservice_model->enviar_correo($correo_usuario, $estatus);

            if ($respuesta_correo == true) {
                //----------------------------

                $respuesta = true;

                $response = array(

                    'respuesta' => $respuesta

                );

                echo json_encode($response);   
            }else{

                 //----------------------------

                 $respuesta = false;

                 $response = array(
 
                     'respuesta' => $respuesta
 
                 );
 
                 echo json_encode($response);

            }
     
        }else {
    
            //-----------------------------

            $respuesta = false;
            $response = array(
                'respuesta' => $respuesta
            );
            echo json_encode($response);   
    
        }
        
    }

     //metodo para cambiar estatus de pedidos a pendientes por enviar
	public function pasar_a_pendientes_enviar()
	{

        $num_registro = $_REQUEST['num_registro'];
        $code = $_REQUEST['code'];
        $estatus = $_REQUEST['estatus'];

        $data_pago = array(

            'estatus' => $estatus

        );

        $respuesta = false;

        //actualizacion de estatus segun la opcion que se selecciono
        $this->db->where('codeorden', $code);

        if ($this->db->update('PAGO_MA', $data_pago)){

            $consulta_correo_usuario = $this->db->query("SELECT correo FROM MA_LOGIN WHERE num_registro = '$num_registro'");
            $respuesta_correo_usuario = $consulta_correo_usuario->row();
            
            $correo_usuario = $respuesta_correo_usuario->correo;

            //data que se enviara a la taba de notificaciones para actualizar la notificacion del usuario
            $data_notificacion = array(

                'correo' => $correo_usuario,
                'tipo' => $estatus,
                'num_registro' => $num_registro
            );

            //insercion de la notificaicion en la tabla de notificaicones para e usuario  
            $this->db->insert('NOTIFICACIONES', $data_notificacion);

            //definicion de datos para llamar al servico de envio de correos electronicos de notificacion
            $this->load->model('admin/Correoservice_model');

            $respuesta_correo = $this->Correoservice_model->enviar_correo($correo_usuario, $estatus);

            //----------------------------

            $respuesta = true;

            $response = array(

                'respuesta' => $respuesta

            );

            echo json_encode($response);
 
        }else{

            $respuesta = false;

            $response = array(

                'respuesta' => $respuesta

            );

            echo json_encode($response);

        }
        
    }

    //metodo para cambiar estatus de pedidos a eviados a destinos
	public function pasar_a_enviados()
	{

        $num_registro = $_REQUEST['num_registro'];
        $code = $_REQUEST['code'];
        $estatus = $_REQUEST['estatus'];

        $data_pago = array(

            'estatus' => $estatus

        );

        $respuesta = false;

        //actualizacion de estatus segun la opcion que se selecciono
        $this->db->where('codeorden', $code);

        if ($this->db->update('PAGO_MA', $data_pago)){


            $consulta_correo_usuario = $this->db->query("SELECT correo FROM MA_LOGIN WHERE num_registro = '$num_registro'");
            $respuesta_correo_usuario = $consulta_correo_usuario->row();
            
            $correo_usuario = $respuesta_correo_usuario->correo;

            //data que se enviara a la taba de notificaciones para actualizar la notificacion del usuario
            $data_notificacion = array(

                'correo' => $correo_usuario,
                'tipo' => $estatus,
                'num_registro' => $num_registro
            );

           //insercion de la notificaicion en la tabla de notificaicones para e usuario  
           $this->db->insert('NOTIFICACIONES', $data_notificacion);

           //definicion de datos para llamar al servico de envio de correos electronicos de notificacion
           $this->load->model('admin/Correoservice_model');

           $respuesta_correo = $this->Correoservice_model->enviar_correo($correo_usuario, $estatus);

           //----------------------------

           $respuesta = true;

           $response = array(

               'respuesta' => $respuesta

           );

           echo json_encode($response);
 
        }else{

            $respuesta = false;

            $response = array(

                'respuesta' => $respuesta

            );

            echo json_encode($response);

        }
        
    }

    //metodo para cambiar estatus de pedidos a entregados en destinos
	public function entregados()
	{

        $num_registro = $_REQUEST['num_registro']; 
        $code = $_REQUEST['code'];
        $estatus = $_REQUEST['estatus'];

        $data_pago = array(

            'estatus' => $estatus

        );

        $respuesta = false;

        //actualizacion de estatus segun la opcion que se selecciono
        $this->db->where('codeorden', $code);

        if ($this->db->update('PAGO_MA', $data_pago)){


            $consulta_correo_usuario = $this->db->query("SELECT correo FROM MA_LOGIN WHERE num_registro = '$num_registro'");
            $respuesta_correo_usuario = $consulta_correo_usuario->row();
            
            $correo_usuario = $respuesta_correo_usuario->correo;

            //data que se enviara a la taba de notificaciones para actualizar la notificacion del usuario
            $data_notificacion = array(

                'correo' => $correo_usuario,
                'tipo' => $estatus,
                'num_registro' => $num_registro
            );

           //insercion de la notificaicion en la tabla de notificaicones para e usuario  
           $this->db->insert('NOTIFICACIONES', $data_notificacion);

           //definicion de datos para llamar al servico de envio de correos electronicos de notificacion
           $this->load->model('admin/Correoservice_model');

           $respuesta_correo = $this->Correoservice_model->enviar_correo($correo_usuario, $estatus);

           //----------------------------

           $respuesta = true;

           $response = array(

               'respuesta' => $respuesta

           );

           echo json_encode($response);
           
        }else{

            $respuesta = false;

            $response = array(

                'respuesta' => $respuesta

            );

            echo json_encode($response);

        }
        
    }
}
