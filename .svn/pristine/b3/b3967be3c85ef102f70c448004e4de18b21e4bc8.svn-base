<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Dashboard extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
		$this->load->database();

		if (!$this->session->userdata('correo')) {
      redirect('login');
    }
	}

	public function index()
	{

		$correo_usuario = $_SESSION['correo'];


		//consulta para verificar si existe suscripcion para este usuario
		$suscrito = $this->db->query("SELECT * FROM MA_SUSCRIPCION WHERE correo = '$correo_usuario'");
		$resultados = $suscrito->row();

		$data['estatus'] = "";

		//EN CASO DE QUERER HACERLO CON UN FOREACH
		/*foreach ($resultados as $resultado) {

			if ($resultado) {
				$data['num_afiliacion'] = $resultado->num_afiliacion;
			}
		}*/

		//validacion en caso de que exita una suscripcion se mostrara la opcion de afiliar a otro usuario
		if(isset($resultados)){

			$data['estatus'] = $resultados->estatus;
			$data['plan_suscrip'] = $resultados->plan_suscrip;

		}

		$data['admin'] = $correo_usuario;

		$this->load->view('headers/header_loged');
		$this->load->view('dashboard', $data);
	}

	public function detalles_usuario()
	{

			$correo_usuario = $_SESSION['correo'];

			//consulta para verificar si el usuario que accede a esta seccion es usuario suscriptor o usuario afiliado
			$suscrito = $this->db->query("SELECT correo, plan_suscrip, num_afiliacion, estatus, fecha_pago, nombre, apellido, edad, sexo, peso, estatura, act_fisica, condicion_esp, plan_nut, direccion_envio, comida, porcion, tipo_alimento, medida_practica, medida_practica_cant, unidad, unidad_cant FROM vw_suscriptor WHERE correo = '$correo_usuario'");
			$resultados = $suscrito->row();


			$data['correo'] = $resultados->correo;
			$data['plan_suscrip'] = $resultados->plan_suscrip;
			$data['num_afiliacion'] = $resultados->num_afiliacion;
			$data['estatus'] = $resultados->estatus;
			$data['fecha_pago'] = $resultados->fecha_pago;
			$data['nombre'] = $resultados->nombre;
			$data['apellido'] = $resultados->apellido;
			$data['edad'] = $resultados->edad;
			$data['sexo'] = $resultados->sexo;
			$data['peso'] = $resultados->peso;
			$data['estatura'] = $resultados->estatura;
			$data['act_fisica'] = $resultados->act_fisica;
			$data['condicion_esp'] = $resultados->condicion_esp;
			$data['plan_nut'] = $resultados->plan_nut;
			$data['direccion_envio'] = $resultados->direccion_envio;

			//----------------------------------------------------
			$comida_usuario = $data['plan_nut'];

			$consulta_plan = $this->db->query("SELECT TC.descripcion AS comida,T.descripcion AS tipo_alimento,P.porcion FROM PLAN_NUTRICIONAL_PORCION P
	  INNER JOIN TIPO_ALIMENTO T ON P.tipo_alimento=T.tipo_alimento
	  INNER JOIN PLAN_NUTRICIONAL_TIPO_COMIDA TC ON P.comida = TC.tipo_comida
  WHERE id_plan='$comida_usuario'");
			$resultado_plan = $consulta_plan->result();

			$data['resultados_plan'] = $resultado_plan;

			$this->load->view('detalles_usuario', $data);

	}

	//metodo para llevar a la vista de validar la ranerencia que feu devuelta
	public function ver_validar_transfeerencia()
  {
    $this->load->view('validar_tranferencia');
  }


  //metodo para actuaizr el nnumero de referencia bancaria en caso de que la tranferencia sea rechazada
  public function validar_tranferencia()
  {

    $correo_usuario = $_POST['correo'];

		//---------------------------------------------------

		$nombre = $_POST['nombre'];
		$apellido = $_POST['apellido'];
		$cedula = $_POST['cedula'];
		$banco_emisor = $_POST['banco_emisor'];
		$banco_receptor = $_POST['banco_receptor'];
		$referencia = $_POST['referencia'];
		$fecha = date("d/m/Y");

		//----------------------------------------------------

		$estatus = $_POST['estatus'];

    $consulta_codeorder_usuario = $this->db->query("SELECT * FROM PAGO_MA WHERE correo = '$correo_usuario'");

		$resultado_codeorder_usuario = $consulta_codeorder_usuario->row();

		$codeorder_usuario = $resultado_codeorder_usuario->CodeOrden;

		//-------------------------------------------------

		$actualizar_referencia = $this->db->query("UPDATE ORDERS_PAYMENTMETHOD SET TransactionReference = '$referencia', Date = '$fecha', PersonName = '$nombre', PersonLastname = '$apellido', PersonCedula = '$cedula', BancoEmisor = '$banco_emisor', BancoReceptor = '$banco_receptor' WHERE CodeOrden = '$codeorder_usuario'");

		//---------------------------------------------------

		$actualizar_estatus_pago = $this->db->query("UPDATE PAGO_MA SET estatus = '$estatus' WHERE correo = '$correo_usuario'");

		//-------------------------------------------------

		$actualizar_estatus_suscriptor = $this->db->query("UPDATE MA_SUSCRIPCION SET estatus = '$estatus' WHERE correo = '$correo_usuario'");

		if ($actualizar_referencia || $actualizar_estatus_pago || $actualizar_estatus_suscriptor) {

			echo "Por favor espere que validemos su Transacción";

		}else {

			echo "Error al Validar Transacción";

		}

  }


}
