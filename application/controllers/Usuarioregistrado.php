<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Usuarioregistrado extends CI_Controller {

  public function __construct()
  {
    parent::__construct();
    $this->load->helper('url');

  }

  //primera ejecucion de esta secccion
	public function index()
	{

    //envio de datos del carrito al header para visualizacion del usuario
		if (isset($_SESSION['correo'])) {

			$correo_usuario = $_SESSION['correo'];

			$consulta_carrito = $this->db->query("SELECT AF.nombre, AF.apellido, AF.plan_nut, AF.id_afiliacion, AF.correo, CA.estatus FROM CARRITO CA INNER JOIN AFILIADOS AF ON CA.num_afiliacion = AF.num_afiliacion WHERE CA.correo = '$correo_usuario'");
			$respuesta_crto = $consulta_carrito->result();

			$data_ntf['carrito_usuario'] = $respuesta_crto;


		}else {

			$data_ntf['carrito_usuario'] = null;

		}

    //envio de nombre y apellido al header para visualizacion del usuario
		if (isset($_SESSION['correo'])) {

			$correo_usuario = $_SESSION['correo'];

			$consulta_usuario = $this->db->query("SELECT * FROM MA_SUSCRIPCION WHERE correo = '$correo_usuario'");
			$respuesta = $consulta_usuario->row();

			$data_ntf['nombre'] = $respuesta->nombre;
			$data_ntf['apellido'] = $respuesta->apellido;

		}else {

			$data_ntf['usuario'] = null;
			$data_ntf['apellido'] = null;

		}

    if (isset($_SESSION['correo'])) {

			$correo_usuario = $_SESSION['correo'];

			$notificaciones_usuario = $this->db->query("SELECT TOP 3 * FROM NOTIFICACIONES WHERE correo LIKE '$correo_usuario' ORDER BY fecha_notificacion DESC");
			$resultado_ntf = $notificaciones_usuario->result();

			$data_ntf['notificacion'] = $resultado_ntf;

		}else {
			$data_ntf['notificacion'] = null;
		}

    $this->load->view('headers/header_loged', $data_ntf);
    $this->load->view('usuario_registrado');
	}
}
