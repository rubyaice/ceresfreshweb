<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Confirmation extends CI_Controller {

	public function __construct()
	{
		parent::__construct();

		$this->load->helper('url');
        $this->load->database();

        if (!$this->session->userdata('correo')) {
            redirect('login/login_view', 'refresh');
        }

	}


	public function index()
	{
    
    $correo=$_SESSION['correo'];
    $Query = $this->db->query("SELECT TOP 1 PM.num_registro,AF.id_afiliacion,AF.apellido,AF.nombre,AF.edad,AF.sexo,AF.peso,AF.estatura,AF.act_fisica,AF.condicion_esp,AF.plan_nut,AF.correo,AF.phone,AF.address,AF.city
    ,AF.state,AF.zipcode,AF.sector,AF.pais,PM.codeorden,PM.total FROM AFILIADOS AF INNER JOIN PAGO_MA PM ON  AF.num_registro=PM.num_registro WHERE AF.correo ='$correo' ORDER BY codeorden DESC");
    $respuesta_datos_afiliado = $Query->row();



    $data['nombre'] = $respuesta_datos_afiliado->nombre . " ".$respuesta_datos_afiliado->apellido ;
    $data['direccion'] = $respuesta_datos_afiliado->address;
    $data['orden'] = $respuesta_datos_afiliado->codeorden;
    $data['total'] = $respuesta_datos_afiliado->total;
    
		$this->load->view('headers/header_loged');
		$this->load->view('mid-confirmation',$data);
		$this->load->view('footer/footer');
  }
}
