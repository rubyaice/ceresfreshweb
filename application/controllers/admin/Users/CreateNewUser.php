<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Createnewuser extends CI_Controller {

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

    //metodo para registrar usuarios autorizados como administrador
    public function crear_usuario_admin()
    {
        
        $nombre = $_REQUEST['Name'];
        $correo = $_REQUEST['Email'];
        $password = $_REQUEST['Password'];
        $type = $_REQUEST['Type'];
        $nombre_proveedor = $_REQUEST['nombre_proveedor'];

        if (isset($correo) && isset($password) && isset($type)) {


            $consulta_correo_admin = $this->db->query("SELECT * FROM MA_LOGIN_ADMIN WHERE correo = '$correo'");
            $respuesta_correo_admin = $consulta_correo_admin->row();


            //comprobacion de si el correo del  usuario existe
            if ($respuesta_correo_admin != null) {
                
                $respuesta = '0';

                $response = array(

                    'respuesta' => $respuesta

                );

                echo json_encode($response);

                return;
            }

            //crear correlativo de numero de registro para el usuario
            $this->load->model('functions_model');
            $valor = $this->functions_model->GetCorrelative("REGISTRO_USER",true);

            
            $token = bin2hex( openssl_random_pseudo_bytes(20) );

            $token_correo = hash( 'ripemd160', $correo );

            $token_clave= hash('ripemd160', $password);

            //data que se enviar a la tabla MA_LOGIN_ADMIN
            $data_reg_admin = array(

                'num_registro' => $valor,
                'correo' => $correo,
                'nombre_proveedor' => $nombre_proveedor,
                'clave' => $token_clave,
                'token' => $token_correo,
                'tipo' => $type,
                'description' => $nombre

            );


            //metodo para insertar en la tabla de usuarios admin
            //$consulta_registro = $this->db->query("INSERT INTO MA_LOGIN_ADMIN (correo, nombre_proveedor, )")

            if ($this->db->insert('MA_LOGIN_ADMIN', $data_reg_admin)) {
                
                $respuesta = '1';

                $response = array(

                    'respuesta' => $respuesta

                );

                echo json_encode($response);

            } else {
                
                $respuesta = '2';

                $response = array(

                    'respuesta' => $respuesta

                );

                echo json_encode($response);

            }
            

        }

    }
    
}
