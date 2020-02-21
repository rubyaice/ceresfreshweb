<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class DeleteUser extends CI_Controller {

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
    public function eliminar_usuario_admin()
    {
        
        $Code = $_REQUEST['Code'];
        
        if (isset($Code)) {


            $consulta_num_registro_admin = $this->db->query("SELECT * FROM MA_LOGIN_ADMIN WHERE num_registro = '$Code'");
            $respuesta_num_registro_admin = $consulta_num_registro_admin->row();


            //comprobacion de si el correo del  usuario existe
            if ($respuesta_num_registro_admin != null) {

                $this->db->where('num_registro', $Code);

                if ($this->db->delete('MA_LOGIN_ADMIN')) {
                    
                    $respuesta = '1';

                    $response = array(

                        'respuesta' => $respuesta

                    );

                    echo json_encode($response);

                }
                
                return;
            }

            //comprobacion de si el correo del  usuario existe
            if ($respuesta_num_registro_admin == null) {
                
                $respuesta = '2';

                $response = array(

                    'respuesta' => $respuesta

                );

                echo json_encode($response);

                return;
            }
            

        }

    }
    
}
