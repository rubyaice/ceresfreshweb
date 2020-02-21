<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Activarcuenta extends CI_Controller{

  public function __construct()
  {
    parent::__construct();

    $this->load->helper('url');
    $this->load->database();
  }

  //validacion de si el usuario tiene o no correo electronico valido
  function index()
  {

    $id_activacion = $_GET['CodeUniqActive_Oop'];

    /*if (!isset($_SESSION['id_activacion'])) {
        
        echo '<title>Ceresfresh</title>';
        echo '<p style="text-align: center;"><b>Su enlace de validacion a caducado.</b></p>';
        return; 

    }*/

    //$id_activacion = $_SESSION['id_activacion'];

    //consulta para saber si el usuario esta en la base de datos o no
    $consulta_usuario = $this->db->query("SELECT * FROM MA_LOGIN WHERE id_activacion = '$id_activacion'");
    $respuesta_usuario = $consulta_usuario->row();

    if ($respuesta_usuario != null) {
        
        $this->session->set_userdata('correo', $respuesta_usuario->correo);

        $this->session->set_userdata('num_registro', $respuesta_usuario->num_registro);

        $data_update_login = array(

            'estatus' => 1

        );

        $this->db->where('id_activacion', $id_activacion);
        $this->db->update('MA_LOGIN', $data_update_login);

        $data['correo_session'] = '';

        //envio de datos del carrito al header para visualizacion del usuario
		if (isset($_SESSION['correo'])) {

			$correo_usuario = $_SESSION['correo'];
            $consulta = $this->db->query("SELECT * FROM MA_LOGIN  WHERE correo = '$correo_usuario'");
            $respuesta = $consulta->row();
            if($respuesta!=null)
            $this->session->set_userdata('num_registro', $respuesta->num_registro);

            $data['correo_session'] = $correo_usuario;


		}

        //obtener tipo de actitud fisica que tine el suscriptor para grabar en la tabla de afiliacion

        $query = $this->db->query('SELECT * FROM PLAN_NUTRICIONAL_ACT_FISICA');
        $results_af = $query->result();

        //obtener si existe alguna aptitud especial en el usuario
        $query = $this->db->query('SELECT * FROM PLAN_NUTRICIONAL_CONDICION_ESPECIAL');
        $results_ce = $query->result();

        
        //obtener los paises
        $query = $this->db->query('SELECT * FROM PAIS');
        $results_pais= $query->result();

        //obtener los datos para resumen de compra del cliente

        //codigo del unico producto que existe por el momento en la base de datos
        $codigo_producto = "0000000001";
        $cosulta_resumen = $this->db->query("SELECT * FROM MA_PRODUCTOS WHERE C_CODIGO = '$codigo_producto'");
        $resultado_resumen = $cosulta_resumen->row();

        $consulta_precio_bs = $this->db->query("SELECT (e_precio*n_precio_m) AS precio FROM MA_PRODUCTOS WHERE C_CODIGO = '$codigo_producto'");
        $resultado_precio_bs = $consulta_precio_bs->row();

        //varibles de productos que se enviaran a la vista de registrar ususario para la parte informativa
        $data['precio_dolares'] = number_format($resultado_resumen->e_precio, 2, '.',',');
        $data['precio_bs'] = number_format($resultado_precio_bs->precio, 2, '.',',');
        $data['prod_descripcion'] = $resultado_resumen->C_DESCRI;


        //definicion de variables que se eniaran a la vista para los select de los planes
        $data['actitud_fisica'] = $results_af;
        $data['condicion_especial'] = $results_ce;
        $data['pais'] = $results_pais;


        //datos para mostrar la barra de estado del registro
        $data_ntf['mostrar'] = "1";

        $this->load->view('headers/header_loged', $data_ntf);
        $this->load->view('registrar_usuario',$data);
        $this->load->view('footer/footer');

    }  

  }

}
