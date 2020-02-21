<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Checkout extends CI_Controller {

	public function __construct()
	{
		parent::__construct();

		//validacion si el usuario esa registrado
		if (!$this->session->userdata('correo')) {
			redirect('login/login_view');
		}

		$this->load->helper('url');
		$this->load->database();
		$this->load->model('functions_model');
		$Semana=$this->functions_model->GetSemana();
		$Dia=$this->functions_model->GetDataSemana();
		$this->session->set_userdata('SemanaActual', $Semana);
		$this->session->set_userdata('DiaSemanaActual', $Dia->ND);
		$this->session->set_userdata('DiaSemanaPago', $Dia->SEMANA_PAGO);

	}


	public function index()
	{
		//$data_ntf='';

		$cantidad_total=0;
		$monto_total=0;
		$sub_total=0;
		$orderCode='-1';
		//$data_usuario_pago='';

    
		
		if(isset($_SESSION['correo']))
		{
			$correo=$_SESSION['correo'];
			$existe = $this->db->query("SELECT ML.num_registro , correo,id_proveedor,nombre_proveedor,id_proceso FROM MA_LOGIN ML  INNER JOIN ESTATUS_REGISTRO_MA ER ON ML.num_registro = ER.num_registro WHERE ML.correo = '$correo'");
			$resultado = $existe->row();
			

			
			$conexion = $this->db->query("SELECT AF.nombre, AF.apellido,AF.address,AF.city,AF.sexo,AF.pais,AF.phone,AF.phone,AF.state,AF.zipcode,AF.sector, AF.plan_nut, AF.id_afiliacion, AF.correo, CA.codeorder,CA.cantidad , AF.num_registro ,MP.C_DESCRI as producto ,CA.productcode ,(PN.precio *MP.n_precio_m) AS precio,(PN.precio *MP.n_precio_m*CA.cantidad) AS monto,(PN.precio*CA.cantidad) AS montoUSD,ER.id_proceso 
			FROM  CARRITO CA INNER JOIN AFILIADOS AF ON CA.correo = AF.correo INNER JOIN MA_PRODUCTOS MP ON MP.C_CODIGO=CA.productcode INNER JOIN ESTATUS_REGISTRO_MA ER ON CA.num_registro = ER.num_registro INNER JOIN PLAN_NUTRICIONAL PN ON AF.plan_nut = PN.id_plan WHERE AF.num_registro  = '$resultado->num_registro'");
			$respuesta_usuario_pago = $conexion->result();

				
			//en caso de que no haya nada en el carrito no debe permitir ver la vista de detalles de pago
			if ($respuesta_usuario_pago == null)
			{
					
				$data_usuario_pago['por_pagar'] = 0;
				$data_usuario_pago['carrito_usuario'] = null;
			}else {
				
				foreach ($respuesta_usuario_pago as $result) {

					$cantidad_total+=$result->cantidad;               
					$sub_total+=$result->precio*$result->cantidad;
					$monto_total+=$result->precio*$result->cantidad;
					$orderCode=$result->codeorder;
					$monto_usd = $result->montoUSD;
						
				}
				$data_usuario_pago['carrito_usuario']=  $respuesta_usuario_pago;
				$data_usuario_pago['por_pagar'] = 1;
			}

		}
		else 
		{

			$data_usuario_pago['carrito_usuario'] = null;
			$data_usuario_pago['por_pagar'] = 0;

		}      
	


				if ($respuesta_usuario_pago != null)
				{
				$datos = $this->db->query("SELECT AF.nombre,AF.address,AF.apellido,AF.sexo,AF.address,AF.city,AF.pais,AF.phone,AF.phone,AF.state,AF.zipcode,AF.sector, AF.apellido, AF.plan_nut, AF.id_afiliacion, AF.correo,  AF.num_registro 
				FROM  AFILIADOS AF  WHERE AF.correo =  '$correo'");
				$resultado_data = $datos->row();

				
			//  $monto=$resultado_data->Precio*$resultado_data->cantidad;
			$data_usuario_pago['datapersonal'] = $resultado_data;
			$data_usuario_pago['monto'] = $monto_total;
			$data_usuario_pago['monto_usd'] = $monto_usd;
			$data_usuario_pago['cantidad'] = $cantidad_total;
			$data_usuario_pago['codeorder'] = $orderCode;
			$data_usuario_pago['subtotal'] = $sub_total;
			
	

				//obtener los estados
				$query = $this->db->query("SELECT * FROM ESTADOS WHERE id_pais='$resultado_data->pais'");
        		$results_estado= $query->result();
				$data_usuario_pago['estados']=$results_estado;

				$query = $this->db->query("SELECT * FROM CIUDADES WHERE id_estado='$resultado_data->state'");
				$results_ciudades= $query->result();
				$data_usuario_pago['ciudades']=$results_ciudades;

				$query = $this->db->query("SELECT * FROM SECTORES WHERE id_ciudad='$resultado_data->city'");
				$results_sectores= $query->result();
				$data_usuario_pago['sectores']=$results_sectores;


			$this->load->view('headers/header_loged');
		
			$this->load->view('mid-checkout',$data_usuario_pago);
			$this->load->view('footer/footer');
		}
		else
		{


		}
  }
}
