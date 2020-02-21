<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Updateuserdata extends CI_Controller {

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
    public function actualizar_usuario_admin()
    {
        
        $nombre = $_REQUEST['Name'];
        $password = $_REQUEST['Password'];
        $type = $_REQUEST['Type'];
        $code = $_REQUEST['Code'];

        if (isset($nombre) && isset($password) && isset($type) && isset($code)) {

            //creacion de token de contraseña
            $token = bin2hex( openssl_random_pseudo_bytes(20) );

            $token_clave= hash('ripemd160', $password);

            //data que se enviar a la tabla MA_LOGIN_ADMIN
            $data_updt_admin = array(

                'clave' => $token_clave,
                'tipo' => $type,
                'description' => $nombre

            );

            //query para actualizar datos en base de datos segun el usuario que este llegano
            $this->db->where('num_registro', $code);

            if ($this->db->update('MA_LOGIN_ADMIN', $data_updt_admin)) {
                
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
