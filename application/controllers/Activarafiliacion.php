<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Activarafiliacion extends CI_Controller {

	public function __construct()
	{
		parent::__construct();

		$this->load->helper('url');
		$this->load->database();
		//$this->load->model('activarafiliacion_model');

	}


	public function index()
	{
		//respuesta de AJAX segun sea el caso
		$activacion = $_POST['activacion'];

		$correo_usuario = $_SESSION['correo'];

		$consulta_num_registro_usuario = $this->db->query("SELECT num_registro FROM AFILIADOS WHERE correo = '$correo_usuario'");
		$respuesta_num_registro_usuario = $consulta_num_registro_usuario->row();

		//numero de registro del usuario en sesion.
		$num_registro = $respuesta_num_registro_usuario->num_registro;

		//---------------------------------------------

		//consulta al carrito apra saber si el usuario ya esta ocn una caja por pagar y redireccionarlo a detalles pago para que haga los pagos correspondientes y no ser insertado nuevamente en el carrito por accidente

		$consulta_carrito_usuario = $this->db->query("SELECT * FROM CARRITO WHERE num_registro = '$num_registro'");
		
		$respuesta_carrito_usuario = $consulta_carrito_usuario->row();

		//definicion de variables que cambiara al validar la respuesta que llega desde el query de carrito
		$html_response = 0;

		if ($respuesta_carrito_usuario == null) {
			
			
			//respuesta de reactivacion de afiliacion de usuario
			//$respuesta_reactivacion_usuario = $this->activarafiliacion_model->activar_afiliacion_usuario($correo_usuario, $num_registro);

			$this->load->model('functions_model');
			$OrderCode = $this->functions_model->GetCorrelative("ORDER_BOX",true);        
				
			//datos que se guardaran en carrito
			$data_carrito = array(

				'correo' => $correo_usuario,
				'cantidad' => '1',
				'num_registro' => $num_registro,
				'codeorder' => $OrderCode,
				'productcode'=> '0000000001'// Codigo del único producto que existe Nutribox , en caso de añadir otro cambiar 

			);

			//datos que se enviaran al area de notificaciones para informar al usuario de su reactivacion de afilizcion
			$data_notificacion = array(

				'correo' => $correo_usuario,
				'tipo' => '9',
				'num_registro' => $num_registro

			);

			//generado de resuesta para enviar como resultado de validacion
			$respuesta_activacion_usuario = false;

			if ($this->db->insert('CARRITO', $data_carrito)) {
				
				$respuesta_activacion_usuario = true;

				//insercion en la base de datos para le area de notificaiones segun el usuario registrado y en sesion
				$this->db->insert('NOTIFICACIONES', $data_notificacion);
				

			}else{

				$respuesta_activacion_usuario = false;
			}


			if ($respuesta_activacion_usuario == true) {
				
				//cambio en la variable de activacion de afiliacion
				$html_response = 1;

				//resta que se da a la activacion
				$response = array(

					'respuesta_activacion' => $html_response
				);

				echo json_encode($response);

			} else {
				
				//cambio en la variable de activacion de afiliacion
				$html_response = 2;

				//resta que se da a la activacion
				$response = array(

					'respuesta_activacion' => $html_response
				);

				echo json_encode($response);

			}

		} else {

			//primero borramos todo lo que haya de carito para evitar errores y luego insertamos la nueva orden del carrito
			$this->db->where('num_registro', $num_registro);
			$this->db->delete('CARRITO');


			//respuesta de reactivacion de afiliacion de usuario
			//$respuesta_reactivacion_usuario = $this->activarafiliacion_model->activar_afiliacion_usuario($correo_usuario, $num_registro);

			$this->load->model('functions_model');
			$OrderCode = $this->functions_model->GetCorrelative("ORDER_BOX",true);        
				
			//datos que se guardaran en carrito
			$data_carrito = array(

				'correo' => $correo_usuario,
				'cantidad' => '1',
				'num_registro' => $num_registro,
				'codeorder' => $OrderCode,
				'productcode'=> '0000000001'// Codigo del único producto que existe Nutribox , en caso de añadir otro cambiar 

			);

			//datos que se enviaran al area de notificaciones para informar al usuario de su reactivacion de afilizcion
			$data_notificacion = array(

				'correo' => $correo_usuario,
				'tipo' => '9',
				'num_registro' => $num_registro

			);

			//generado de resuesta para enviar como resultado de validacion
			$respuesta_activacion_usuario = false;

			if ($this->db->insert('CARRITO', $data_carrito)) {
				
				$respuesta_activacion_usuario = true;

				//insercion en la base de datos para le area de notificaiones segun el usuario registrado y en sesion
				$this->db->insert('NOTIFICACIONES', $data_notificacion);
				

			}else{

				$respuesta_activacion_usuario = false;
			}


			if ($respuesta_activacion_usuario == true) {
				
				//cambio en la variable de activacion de afiliacion
				$html_response = 1;

				//resta que se da a la activacion
				$response = array(

					'respuesta_activacion' => $html_response
				);

				echo json_encode($response);

			} else {
				
				//cambio en la variable de activacion de afiliacion
				$html_response = 2;

				//resta que se da a la activacion
				$response = array(

					'respuesta_activacion' => $html_response
				);

				echo json_encode($response);

			}

		}

	}

	//metodo para reactivar al afiliado de un usuario registrado
	public function reactivar_afiliado()
	{
		
		//respuesta de AJAX segun sea el caso
		$activacion = $_POST['activacion'];
		
		$correo_afiliado = $_POST['correo_afiliado'];

		$consulta_num_registro_usuario = $this->db->query("SELECT num_registro FROM AFILIADOS WHERE correo = '$correo_afiliado'");
		$respuesta_num_registro_usuario = $consulta_num_registro_usuario->row();

		//numero de registro del usuario en sesion.
		$num_registro = $respuesta_num_registro_usuario->num_registro;

		//---------------------------------------------

		//consulta para saber is hay un producto ya viejo del cliente en su carrito cosa de colocar el mismo numero de orden a la eractivacion y pagar todo cn la misma orden

		

		//---------------------------------------------

		$consulta_algo_en_carrito = $this->db->query("SELECT * FROM CARRITO WHERE num_registro = '$num_registro'");
		$respuesta_algo_carrito = $consulta_algo_en_carrito->result();

		//validacion de si hay algo en carrito, si hay algo en carrito entonces validare al usuario

		if ($respuesta_algo_carrito != null) {
			
			//consulta al carrito apra saber si el usuario ya esta ocn una caja por pagar y redireccionarlo a detalles pago para que haga los pagos correspondientes y no ser insertado nuevamente en el carrito por accidente

			$consulta_carrito_usuario = $this->db->query("SELECT * FROM CARRITO WHERE correo = '$correo_afiliado' AND num_registro = '$num_registro'");
			
			$respuesta_carrito_usuario = $consulta_carrito_usuario->row();

			//definicion de variables que cambiara al validar la respuesta que llega desde el query de carrito
			$html_response = 0;

			$consulta_carrito_codeorden = $this->db->query("SELECT codeorder FROM CARRITO WHERE num_registro = '$num_registro'");
			$respuesta_carrito_codeorden = $consulta_carrito_codeorden->row();

			$codeorden_ult = $respuesta_carrito_codeorden->codeorder;

			if ($respuesta_carrito_usuario == null) {
			
			

			//respuesta de reactivacion de afiliacion de usuario
			//$respuesta_reactivacion_usuario = $this->activarafiliacion_model->activar_afiliacion_usuario($correo_usuario, $num_registro);

			$this->load->model('functions_model');
			$OrderCode = $this->functions_model->GetCorrelative("ORDER_BOX",true);        
				
			//datos que se guardaran en carrito
			$data_carrito = array(

				'correo' => $correo_afiliado,
				'cantidad' => '1',
				'num_registro' => $num_registro,
				'codeorder' => $codeorden_ult,
				'productcode'=> '0000000001'// Codigo del único producto que existe Nutribox , en caso de añadir otro cambiar 

			);

			//datos que se enviaran al area de notificaciones para informar al usuario de su reactivacion de afilizcion
			$data_notificacion = array(

				'correo' => $correo_afiliado,
				'tipo' => '9',
				'num_registro' => $num_registro

			);

			//generado de resuesta para enviar como resultado de validacion
			$respuesta_activacion_usuario = false;

			if ($this->db->insert('CARRITO', $data_carrito)) {
				
				$respuesta_activacion_usuario = true;

				//insercion en la base de datos para le area de notificaiones segun el usuario registrado y en sesion
				$this->db->insert('NOTIFICACIONES', $data_notificacion);
				

			}else{

				$respuesta_activacion_usuario = false;
			}


			if ($respuesta_activacion_usuario == true) {
				
				//cambio en la variable de activacion de afiliacion
				$html_response = 1;

				//resta que se da a la activacion
				$response = array(

					'respuesta_activacion' => $html_response
				);

				echo json_encode($response);

			} else {
				
				//cambio en la variable de activacion de afiliacion
				$html_response = 2;

				//resta que se da a la activacion
				$response = array(

					'respuesta_activacion' => $html_response
				);

				echo json_encode($response);

			}

		} else {

			//primero borramos todo lo que haya de carito para evitar errores y luego insertamos la nueva orden del carrito
			$this->db->where('correo', $correo_afiliado);
			$this->db->delete('CARRITO');

			//respuesta de reactivacion de afiliacion de usuario
			//$respuesta_reactivacion_usuario = $this->activarafiliacion_model->activar_afiliacion_usuario($correo_usuario, $num_registro);

			$this->load->model('functions_model');
			$OrderCode = $this->functions_model->GetCorrelative("ORDER_BOX",true);        
				
			//datos que se guardaran en carrito
			$data_carrito = array(

				'correo' => $correo_afiliado,
				'cantidad' => '1',
				'num_registro' => $num_registro,
				'codeorder' => $codeorden_ult,
				'productcode'=> '0000000001'// Codigo del único producto que existe Nutribox , en caso de añadir otro cambiar 

			);

			//datos que se enviaran al area de notificaciones para informar al usuario de su reactivacion de afilizcion
			$data_notificacion = array(

				'correo' => $correo_afiliado,
				'tipo' => '9',
				'num_registro' => $num_registro

			);

			//generado de resuesta para enviar como resultado de validacion
			$respuesta_activacion_usuario = false;

			if ($this->db->insert('CARRITO', $data_carrito)) {

				//en caso de que hayan mas productos en el carrito y tengan un codigo de orden distinto hago esto..
				$this->load->model('functions_model');
				$OrderCode = $this->functions_model->GetCorrelative("ORDER_BOX",true);

				$data_update_car = array(

					'codeorder' => $codeorden_ult

				);

				$this->db->where('num_registro', $num_registro);
				$this->db->update('CARRITO', $data_update_car);
				
				$respuesta_activacion_usuario = true;

				//insercion en la base de datos para le area de notificaiones segun el usuario registrado y en sesion
				$this->db->insert('NOTIFICACIONES', $data_notificacion);
				

			}else{

				$respuesta_activacion_usuario = false;
			}


			if ($respuesta_activacion_usuario == true) {
				
				//cambio en la variable de activacion de afiliacion
				$html_response = 1;

				//resta que se da a la activacion
				$response = array(

					'respuesta_activacion' => $html_response
				);

				echo json_encode($response);

			} else {
				
				//cambio en la variable de activacion de afiliacion
				$html_response = 2;

				//resta que se da a la activacion
				$response = array(

					'respuesta_activacion' => $html_response
				);

				echo json_encode($response);

			}

		}

		} else {

				//consulta al carrito apra saber si el usuario ya esta ocn una caja por pagar y redireccionarlo a detalles pago para que haga los pagos correspondientes y no ser insertado nuevamente en el carrito por accidente

				$consulta_carrito_usuario = $this->db->query("SELECT * FROM CARRITO WHERE correo = '$correo_afiliado' AND num_registro = '$num_registro'");
			
				$respuesta_carrito_usuario = $consulta_carrito_usuario->row();
	
				//definicion de variables que cambiara al validar la respuesta que llega desde el query de carrito
				$html_response = 0;
	
	
				if ($respuesta_carrito_usuario == null) {
				
				
	
				//respuesta de reactivacion de afiliacion de usuario
				//$respuesta_reactivacion_usuario = $this->activarafiliacion_model->activar_afiliacion_usuario($correo_usuario, $num_registro);
	
				$this->load->model('functions_model');
				$OrderCode = $this->functions_model->GetCorrelative("ORDER_BOX",true);        
					
				//datos que se guardaran en carrito
				$data_carrito = array(
	
					'correo' => $correo_afiliado,
					'cantidad' => '1',
					'num_registro' => $num_registro,
					'codeorder' => $OrderCode,
					'productcode'=> '0000000001'// Codigo del único producto que existe Nutribox , en caso de añadir otro cambiar 
	
				);
	
				//datos que se enviaran al area de notificaciones para informar al usuario de su reactivacion de afilizcion
				$data_notificacion = array(
	
					'correo' => $correo_afiliado,
					'tipo' => '9',
					'num_registro' => $num_registro
	
				);
	
				//generado de resuesta para enviar como resultado de validacion
				$respuesta_activacion_usuario = false;
	
				if ($this->db->insert('CARRITO', $data_carrito)) {
					
					$respuesta_activacion_usuario = true;
	
					//insercion en la base de datos para le area de notificaiones segun el usuario registrado y en sesion
					$this->db->insert('NOTIFICACIONES', $data_notificacion);
					
	
				}else{
	
					$respuesta_activacion_usuario = false;
				}
	
	
				if ($respuesta_activacion_usuario == true) {
					
					//cambio en la variable de activacion de afiliacion
					$html_response = 1;
	
					//resta que se da a la activacion
					$response = array(
	
						'respuesta_activacion' => $html_response
					);
	
					echo json_encode($response);
	
				} else {
					
					//cambio en la variable de activacion de afiliacion
					$html_response = 2;
	
					//resta que se da a la activacion
					$response = array(
	
						'respuesta_activacion' => $html_response
					);
	
					echo json_encode($response);
	
				}
	
			} else {
	
				//primero borramos todo lo que haya de carito para evitar errores y luego insertamos la nueva orden del carrito
				$this->db->where('correo', $correo_afiliado);
				$this->db->delete('CARRITO');
	
				//respuesta de reactivacion de afiliacion de usuario
				//$respuesta_reactivacion_usuario = $this->activarafiliacion_model->activar_afiliacion_usuario($correo_usuario, $num_registro);
	
				$this->load->model('functions_model');
				$OrderCode = $this->functions_model->GetCorrelative("ORDER_BOX",true);        
					
				//datos que se guardaran en carrito
				$data_carrito = array(
	
					'correo' => $correo_afiliado,
					'cantidad' => '1',
					'num_registro' => $num_registro,
					'codeorder' => $OrderCode,
					'productcode'=> '0000000001'// Codigo del único producto que existe Nutribox , en caso de añadir otro cambiar 
	
				);
	
				//datos que se enviaran al area de notificaciones para informar al usuario de su reactivacion de afilizcion
				$data_notificacion = array(
	
					'correo' => $correo_afiliado,
					'tipo' => '9',
					'num_registro' => $num_registro
	
				);
	
				//generado de resuesta para enviar como resultado de validacion
				$respuesta_activacion_usuario = false;
	
				if ($this->db->insert('CARRITO', $data_carrito)) {
	
					//en caso de que hayan mas productos en el carrito y tengan un codigo de orden distinto hago esto..
					$this->load->model('functions_model');
					$OrderCode = $this->functions_model->GetCorrelative("ORDER_BOX",true);
	
					$data_update_car = array(
	
						'codeorder' => $OrderCode
	
					);
	
					$this->db->where('num_registro', $num_registro);
					$this->db->update('CARRITO', $data_update_car);
					
					$respuesta_activacion_usuario = true;
	
					//insercion en la base de datos para le area de notificaiones segun el usuario registrado y en sesion
					$this->db->insert('NOTIFICACIONES', $data_notificacion);
					
	
				}else{
	
					$respuesta_activacion_usuario = false;
				}
	
	
				if ($respuesta_activacion_usuario == true) {
					
					//cambio en la variable de activacion de afiliacion
					$html_response = 1;
	
					//resta que se da a la activacion
					$response = array(
	
						'respuesta_activacion' => $html_response
					);
	
					echo json_encode($response);
	
				} else {
					
					//cambio en la variable de activacion de afiliacion
					$html_response = 2;
	
					//resta que se da a la activacion
					$response = array(
	
						'respuesta_activacion' => $html_response
					);
	
					echo json_encode($response);
	
				}
	
			}

		}

	}
}
