<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Welcome extends CI_Controller {

	public function __construct()
	{
		parent::__construct();

		$this->load->helper('url');
		$this->load->database();
		$this->load->library('instagram');

	}

	//primera cara de la pagina
	public function index()
	{

		$this->load->view('headers/header_loged');
		$this->load->view('welcome_message');
		$this->load->view('footer/footer');

	}

	//metodo para traer imagenes de instagram segun el ususario que inicia sesion de la libreria definida
	public function instagram_service()
	{

		$limit = 8;

		$items = $this->instagram->getImages($limit);
		$total_items = count($items);

		if ( $total_items <= 0 ) {

			$output = '<div class="text-center"><p>No existen publicaciones que mostrar.</p></div>';

		} else {

			$output = '<div class="row">';

			for ($i=0; $i < $limit; $i++) {
				// break if total items less than count
				if($i == $total_items){
					break;
				}

				$output .= '<div class="col-6 col-md-3 pb-3">';
				$output .= (!empty($items[$i]->images->standard_resolution->url)) ? '<a class="sppb-instagram-gallery-btn" href="' . $items[$i]->link . '" target="_blank">' : '';
				$output .= '<div class="addon-instagram-item-wrap">';

				$output .= '<div class="addon-instagram-image-wrap">';
				$output .= '<img class="instagram-image img-fluid" src="' . $items[$i]->images->standard_resolution->url . '" alt="">';
				$output .= '</div>';
				
				$output .= '</div>';
				
				$output .= (!empty($items[$i]->images->standard_resolution->url)) ? '</a>' : '';
				$output .= '</div>';

				}
			$output .= '</div>';
		}

		//respuesta que se mostrara en el HTML mediante AJAX
		$response = array(

			'respuesta_instagram' => $output

		);

		echo json_encode($response);

	}

	//metodo para acargar vista de la seccion quienes somos
	public function quienes_somos_view()
	{
		$this->load->view('headers/header_loged');
		$this->load->view('quienes_somos');
		$this->load->view('footer/footer');
	}

	//metodo para cargar informacion de contacto
	public function cargar_info_contacto()
	{
		
		//consula ara traer datos de contacto de la base detos
		$consulta_contactos = $this->db->query("SELECT * FROM INFO_CONTACTO");
		$respuesta_contacto = $consulta_contactos->row();

		$numero_contacto = $respuesta_contacto->numero_contacto;

		$correo_contacto = $respuesta_contacto->correo_contacto;

		$response = array(

			'numero_contacto' => $numero_contacto,
			'correo_contacto' => $correo_contacto

		);

		echo json_encode($response);

	}

	// metodo en caso que el usuario no tenga un plan nutricional
	public function comprobar_plan_user()
	{
		if (isset($_SESSION['correo'])) {
			
			$correo_usuario = $_SESSION['correo'];

      		$query = $this->db->query("SELECT ML.num_registro , correo,id_proveedor,nombre_proveedor,id_proceso FROM MA_LOGIN ML  INNER JOIN ESTATUS_REGISTRO_MA ER ON ML.num_registro = ER.num_registro WHERE ML.correo = '$correo_usuario'");
			$resultado = $query->row();

			if ($resultado->id_proceso == '2') {

				$respuesta_comprobar_plan_html = "Estimado cliente, no se le ha asignado un plan nutricional, por favor pulse <b>Aceptar</b> para culminar su registro.";

    			$resp_comprobar_plan = 1;

    			$response = array(

      				'respuesta_comprobar_plan_html' => $respuesta_comprobar_plan_html,
      				'resp_comprobar_plan' => $resp_comprobar_plan

    			);

				echo json_encode($response);
				
			}else {

				$respuesta_comprobar_plan_html = "";

    			$resp_comprobar_plan = 2;

    			$response = array(

      				'respuesta_comprobar_plan_html' => $respuesta_comprobar_plan_html,
      				'resp_comprobar_plan' => $resp_comprobar_plan

    			);

    			echo json_encode($response);
			}
			  
		}else {

			$respuesta_comprobar_plan_html = "";

    			$resp_comprobar_plan = 2;

    			$response = array(

      				'respuesta_comprobar_plan_html' => $respuesta_comprobar_plan_html,
      				'resp_comprobar_plan' => $resp_comprobar_plan

    			);

				echo json_encode($response);
				
		}

	}
}
