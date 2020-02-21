<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Ventas extends CI_Controller {

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
	}


	public function index()
	{

		$this->load->view('admin/header/header');
		$this->load->view('admin/mid-ventas-procesar');
		$this->load->view('admin/footer/footer');

	}
	public function Procesada()
	{

		$this->load->view('admin/header/header');
		$this->load->view('admin/mid-ventas-procesada');
		$this->load->view('admin/footer/footer');

	}
	public function Autorizar()
	{

		$this->load->view('admin/header/header');
		$this->load->view('admin/mid-ventas-autorizar');
		$this->load->view('admin/footer/footer');

	}
	public function Procesar()
	{

		$this->load->view('admin/header/header');
		$this->load->view('admin/mid-ventas-procesar');
		$this->load->view('admin/footer/footer');

	}
	public function Enviada()
	{

		$this->load->view('admin/header/header');
		$this->load->view('admin/mid-ventas-enviada');
		$this->load->view('admin/footer/footer');

	}
	public function Entregado()
	{

		$this->load->view('admin/header/header');
		$this->load->view('admin/mid-ventas-entregada');
		$this->load->view('admin/footer/footer');

	}
	public function devoluciones()
	{

		$this->load->view('admin/header/header');
		$this->load->view('admin/mid-devoluciones');
		$this->load->view('admin/footer/footer');

	}

	//cargar vista de reglas de negocio admin
	public function reglas_de_negocio_view()
	{

		$this->load->view('admin/header/header');
		$this->load->view('admin/mid-reglas');
		$this->load->view('admin/footer/footer');

	}

	//metoodas para mostrar las listas de cada una de las secciones

	//
	public function GetSalesList()
	{
		$html='';
		$ClassOrdes = new Orders();//Crear libreria
		$Text="";
		$Date="";

		if (isset($_GET['Pag'])) 
		{
			$Pag=$_GET['Pag'];
		}
		if (isset($_GET['Text'])) 
		{
			$Text=$_GET['Text'];
		}
		if (isset($_GET['Date'])) 
		{
			$Date=$_GET['Date'];
		}

		

		//$Recordset = $ClassOrdes->GetSales();


		if($Text=="" && $Date=="")
		{
			//$Recordset = $ClassOrdes->ordersPending();
			$Recordset = $ClassOrdes->GetSales();
		}
		else
		{
			$Recordset = $ClassOrdes->ordersSalesSearch($Date,$Text);
		}
			

		$html .='<table class="responsive-table">
			<thead>
				<tr>
					<th>Orden</th>					
					<th>Cliente</th>
					<th>Items</th>
					<th>Monto</th>
					<th>Fecha</th>
					<th>Plan</th>
					<th> </th>
				</tr>
			</thead>

			<tbody>';
		
		//inicio del loop
			if ($Recordset != FALSE)
			{
					foreach ($Recordset as $results) {
						
					//-------DATOS DE LA CONSULTA RETORNO------------------------------------------------------
					
					$Code = $results->codeorden;
					$Name =$results->nombre;
					$Apellido =$results->apellido;
					$Total =$results->total;
					$Total=number_format(floatval($Total) , 2 , "." , ",");
					
					$Cantidad = $results->cantidad;
					$Date = $results->date;
				
					$CustomerCodeRegistro = trim($results->num_registro);
					$CustomerCodeAfiliacion = trim($results->id_afiliacion);
					$NombreCompleto=$Apellido." ".$Name;
					//Cid= Customerid
					//Oid=Orderid

					$consulta_plan = $this->db->query("SELECT plan_nut FROM AFILIADOS WHERE id_afiliacion = '$CustomerCodeAfiliacion'");
					$respuesta_plan = $consulta_plan->row();

					$plan_nutricional = $respuesta_plan->plan_nut;
				
				$html.="<tr>
					<td>$Code</td>
			
					<td> $NombreCompleto </td>
					<td> $Cantidad </td>
					<td> $Total </td>
					<td> $Date </td>
					<td> $plan_nutricional </td>
					<td>
						<i class='material-icons pointer' Cid='$CustomerCodeAfiliacion ' onclick='CargarCustomer(\"".$CustomerCodeAfiliacion."\")'>perm_contact_calendar</i>

						<i class='material-icons pointer' Oid='$Code' onclick='CargarDatosOrden(\"".$Code."\")'>visibility</i>

						<i class='material-icons pointer' Oid='$Code' onclick='verGustos(\"".$CustomerCodeAfiliacion."\")'>local_dining</i>

						<i class='material-icons pointer' Oid='$Code' onclick='PreguntaEstatus(\"".$Code."\", \"".$CustomerCodeRegistro."\")'>border_color</i>
						
					</td>
				</tr>";

			
				}
			}
	
			$html.='</tbody>
		</table>';
		echo $html;
	}

	public function GetSalesListProcesado()
	{
		$html='';
		$ClassOrdes = new Orders();//Crear libreria
		$Text="";
		$Date="";

		if (isset($_GET['Pag'])) 
		{
			$Pag=$_GET['Pag'];
		}
		if (isset($_GET['Text'])) 
		{
			$Text=$_GET['Text'];
		}
		if (isset($_GET['Date'])) 
		{
			$Date=$_GET['Date'];
		}

		

		//$Recordset = $ClassOrdes->GetSales();


		if($Text=="" && $Date=="")
		{
			//$Recordset = $ClassOrdes->ordersPending();
			$Recordset = $ClassOrdes->GetSalesProcesado();
		}
		else
		{
			$Recordset = $ClassOrdes->ordersSalesSearchProcesado($Date,$Text);
		}
			

		$html .='<table class="responsive-table">
			<thead>
				<tr>
					<th>Orden</th>					
					<th>Cliente</th>
					<th>Items</th>
					<th>Monto</th>
					<th>Fecha</th>
					<th>Plan</th>
					<th> </th>
				</tr>
			</thead>

			<tbody>';
		
		//inicio del loop
			if ($Recordset != FALSE)
			{
					foreach ($Recordset as $results) {
						
					//-------DATOS DE LA CONSULTA RETORNO------------------------------------------------------
					
					$Code = $results->codeorden;
					$Name =$results->nombre;
					$Apellido =$results->apellido;
					$Total =$results->total;
					$Total=number_format(floatval($Total) , 2 , "." , ",");
					
					$Cantidad = $results->cantidad;
					$Date = $results->date;
				
					$CustomerCodeRegistro = trim($results->num_registro);
					$CustomerCodeAfiliacion = trim($results->id_afiliacion);
					$NombreCompleto=$Apellido." ".$Name;
					//Cid= Customerid
					//Oid=Orderid

					$consulta_plan = $this->db->query("SELECT plan_nut FROM AFILIADOS WHERE id_afiliacion = '$CustomerCodeAfiliacion'");
					$respuesta_plan = $consulta_plan->row();

					$plan_nutricional = $respuesta_plan->plan_nut;
				
				$html.="<tr>
					<td>$Code</td>
			
					<td> $NombreCompleto </td>
					<td> $Cantidad </td>
					<td> $Total </td>
					<td> $Date </td>
					<td> $plan_nutricional </td>
					<td>
						<i class='material-icons pointer' Cid='$CustomerCodeAfiliacion ' onclick='CargarCustomer(\"".$CustomerCodeAfiliacion."\")'>perm_contact_calendar</i>

						<i class='material-icons pointer' Oid='$Code' onclick='CargarDatosOrden(\"".$Code."\")'>visibility</i>

						<i class='material-icons pointer' Oid='$Code' onclick='verGustos(\"".$CustomerCodeAfiliacion."\")'>local_dining</i>
						
						<i class='material-icons pointer' Oid='$Code' onclick='PreguntaEstatus(\"".$Code."\", \"".$CustomerCodeRegistro."\")'>border_color</i>
					</td>
				</tr>";

				}
			}
	
			$html.='</tbody>
		</table>';
		echo $html;
	}
	public function GetSalesListAutorizar()
	{
		$html='';
		$ClassOrdes = new Orders();//Crear libreria
		$Text="";
		$Date="";

		if (isset($_GET['Pag'])) 
		{
			$Pag=$_GET['Pag'];
		}
		if (isset($_GET['Text'])) 
		{
			$Text=$_GET['Text'];
		}
		if (isset($_GET['Date'])) 
		{
			$Date=$_GET['Date'];
		}

		

		//$Recordset = $ClassOrdes->GetSales();


		if($Text=="" && $Date=="")
		{
			//$Recordset = $ClassOrdes->ordersPending();
			$Recordset = $ClassOrdes->GetAutorizar();
		}
		else
		{
			$Recordset = $ClassOrdes->ordersSalesSearchAutorizar($Date,$Text);
		}
			

		$html .='<table class="responsive-table">
			<thead>
				<tr>
					<th>Orden</th>					
					<th>Cliente</th>
					<th>Items</th>
					<th>Monto</th>
					<th>Fecha</th>
					<th>Nro. Referencia</th>
					<th>Banco Receptor</th>
					<th>Banco Emisor</th>
					<th>Plan</th>
					<th>Zelle</th>
					<th> </th>
					
				</tr>
			</thead>

			<tbody>';
		
		//inicio del loop
			if ($Recordset != FALSE)
			{
					foreach ($Recordset as $results) {
						
					//-------DATOS DE LA CONSULTA RETORNO------------------------------------------------------
					
					$Code = $results->codeorden;
					$Name =$results->nombre;
					$Apellido =$results->apellido;
					$Total =$results->total;
					$Total=number_format(floatval($Total) , 2 , "." , ",");
					
					$Cantidad = $results->cantidad;
					$Date = $results->date;
				
					$CustomerCodeRegistro = trim($results->num_registro);
					$CustomerCodeAfiliacion = trim($results->id_afiliacion);
					$NombreCompleto=$Apellido." ".$Name;
					//Cid= Customerid
					//Oid=Orderid

					//numero de registro del usuario
					$num_registro_usuario = trim($results->num_registro);
					

					//datos de numero de referencia bacaria para verificacion de pago y bancos donde se realizaron los  pagos
					$consulta_num_referencia = $this->db->query("SELECT TransactionReference, BancoEmisor, BancoReceptor FROM ORDERS_PAYMENTMETHOD WHERE CodeOrden = '$Code'");
					$respuesta_num_referencia = $consulta_num_referencia->row();

					$num_refencia = $respuesta_num_referencia->TransactionReference;

					// vaidar la respuesta que esta llegando de los bancos en base al pago por zelle
					if ($respuesta_num_referencia->BancoEmisor == "" && $respuesta_num_referencia->BancoReceptor == "") {
						
						$bancoEmisor = "-------";

						$bancoReceptor = "-------";

					}else {
						
						$bancoEmisor = $respuesta_num_referencia->BancoEmisor;

						$bancoReceptor = $respuesta_num_referencia->BancoReceptor;	

					}

					//--------------------------

					// cargar si el cliente pago por zelle o hizo una tranerencia normal
					$consula_pago_zelle = $this->db->query("SELECT * FROM ORDERS_PAYMENTMETHOD WHERE CodeOrden = '$Code' AND PagoZelle = '1'");
					$resultado_pago_zelle = $consula_pago_zelle->row();

					if ($resultado_pago_zelle != null) {
						
						$zelle = "Pago Zelle";

					}else {
						
						$zelle = "-------";
					}

					// cargar el plan nutrucional de los afiliados que estan en la tabla para pendientes por autorizar
					$consulta_plan = $this->db->query("SELECT plan_nut FROM AFILIADOS WHERE id_afiliacion = '$CustomerCodeAfiliacion'");
					$respuesta_plan = $consulta_plan->row();

					$plan_nutricional = $respuesta_plan->plan_nut;
				
				$html.="<tr>
					<td>$Code</td>
			
					<td> $NombreCompleto </td>
					<td> $Cantidad </td>
					<td> $Total </td>
					<td> $Date </td>
					<td> $num_refencia </td>
					<td class='center-align'> $bancoEmisor </td>
					<td class='center-align'> $bancoReceptor </td>
					<td> $plan_nutricional </td>
					<td class='center-align'> $zelle </td>
					<td>
						<i class='material-icons pointer' Cid='$CustomerCodeAfiliacion ' onclick='CargarCustomer(\"".$CustomerCodeAfiliacion."\")'>perm_contact_calendar</i>

						<i class='material-icons pointer' Oid='$Code' onclick='CargarDatosOrden(\"".$Code."\")'>visibility</i>

						<i class='material-icons pointer' Oid='$Code' onclick='PreguntaEstatus(\"".$Code."\", \"".$num_registro_usuario."\")'>border_color</i>
						
					</td>
				</tr>";

			
				}
			}
	
			$html.='</tbody>
		</table>';
		echo $html;
	}
	public function GetSalesListEnviado()
	{
		$html='';
		$ClassOrdes = new Orders();//Crear libreria
		$Text="";
		$Date="";

		if (isset($_GET['Pag'])) 
		{
			$Pag=$_GET['Pag'];
		}
		if (isset($_GET['Text'])) 
		{
			$Text=$_GET['Text'];
		}
		if (isset($_GET['Date'])) 
		{
			$Date=$_GET['Date'];
		}

		

		//$Recordset = $ClassOrdes->GetSales();


		if($Text=="" && $Date=="")
		{
			//$Recordset = $ClassOrdes->ordersPending();
			$Recordset = $ClassOrdes->GetEnviado();
		}
		else
		{
			$Recordset = $ClassOrdes->ordersSalesSearchEnviado($Date,$Text);
		}
			

		$html .='<table class="responsive-table">
			<thead>
				<tr>
					<th>Orden</th>					
					<th>Cliente</th>
					<th>Items</th>
					<th>Monto</th>
					<th>Fecha</th>
					<th>Plan</th>
					<th> </th>
				</tr>
			</thead>

			<tbody>';
		
		//inicio del loop
			if ($Recordset != FALSE)
			{
					foreach ($Recordset as $results) {
						
					//-------DATOS DE LA CONSULTA RETORNO------------------------------------------------------
					
					$Code = $results->codeorden;
					$Name =$results->nombre;
					$Apellido =$results->apellido;
					$Total =$results->total;
					$Total=number_format(floatval($Total) , 2 , "." , ",");
					
					$Cantidad = $results->cantidad;
					$Date = $results->date;
				
					$CustomerCodeRegistro = trim($results->num_registro);
					$CustomerCodeAfiliacion = trim($results->id_afiliacion);
					$NombreCompleto=$Apellido." ".$Name;
					//Cid= Customerid
					//Oid=Orderid

					$consulta_plan = $this->db->query("SELECT plan_nut FROM AFILIADOS WHERE id_afiliacion = '$CustomerCodeAfiliacion'");
					$respuesta_plan = $consulta_plan->row();

					$plan_nutricional = $respuesta_plan->plan_nut;
				
				$html.="<tr>
					<td>$Code</td>
			
					<td> $NombreCompleto </td>
					<td> $Cantidad </td>
					<td> $Total </td>
					<td> $Date </td>
					<td> $plan_nutricional </td>
					<td>
						<i class='material-icons pointer' Cid='$CustomerCodeAfiliacion ' onclick='CargarCustomer(\"".$CustomerCodeAfiliacion."\")'>perm_contact_calendar</i>

						<i class='material-icons pointer' Oid='$Code' onclick='CargarDatosOrden(\"".$Code."\")'>visibility</i>

						<i class='material-icons pointer' Oid='$Code' onclick='verGustos(\"".$CustomerCodeAfiliacion."\")'>local_dining</i>
						
						<i class='material-icons pointer' Oid='$Code' onclick='PreguntaEstatus(\"".$Code."\", \"".$CustomerCodeRegistro."\")'>border_color</i>
					</td>
				</tr>";

			
				}
			}
	
			$html.='</tbody>
		</table>';
		echo $html;
	}

	public function GetSalesListEntregado()
	{
		$html='';
		$ClassOrdes = new Orders();//Crear libreria
		$Text="";
		$Date="";

		if (isset($_GET['Pag'])) 
		{
			$Pag=$_GET['Pag'];
		}
		if (isset($_GET['Text'])) 
		{
			$Text=$_GET['Text'];
		}
		if (isset($_GET['Date'])) 
		{
			$Date=$_GET['Date'];
		}

		

		//$Recordset = $ClassOrdes->GetSales();


		if($Text=="" && $Date=="")
		{
			//$Recordset = $ClassOrdes->ordersPending();
			$Recordset = $ClassOrdes->GetEntregado();
		}
		else
		{
			$Recordset = $ClassOrdes->ordersSalesSearchEntregado($Date,$Text);
		}
			

		$html .='<table class="responsive-table">
			<thead>
				<tr>
					<th>Orden</th>					
					<th>Cliente</th>
					<th>Items</th>
					<th>Monto</th>
					<th>Fecha</th>
					<th>Plan</th>
					<th> </th>
				</tr>
			</thead>

			<tbody>';
		
		//inicio del loop
			if ($Recordset != FALSE)
			{
					foreach ($Recordset as $results) {
						
					//-------DATOS DE LA CONSULTA RETORNO------------------------------------------------------
					
					$Code = $results->codeorden;
					$Name =$results->nombre;
					$Apellido =$results->apellido;
					$Total =$results->total;
					$Total=number_format(floatval($Total) , 2 , "." , ",");
					
					$Cantidad = $results->cantidad;
					$Date = $results->date;
				
					$CustomerCodeRegistro = trim($results->num_registro);
					$CustomerCodeAfiliacion = trim($results->id_afiliacion);
					$NombreCompleto=$Apellido." ".$Name;
					//Cid= Customerid
					//Oid=Orderid

					$consulta_plan = $this->db->query("SELECT plan_nut FROM AFILIADOS WHERE id_afiliacion = '$CustomerCodeAfiliacion'");
					$respuesta_plan = $consulta_plan->row();

					$plan_nutricional = $respuesta_plan->plan_nut;
				
				$html.="<tr>
					<td>$Code</td>
			
					<td> $NombreCompleto </td>
					<td> $Cantidad </td>
					<td> $Total </td>
					<td> $Date </td>
					<td> $plan_nutricional </td>
					<td>
						<i class='material-icons pointer' Cid='$CustomerCodeAfiliacion ' onclick='CargarCustomer(\"".$CustomerCodeAfiliacion."\")'>perm_contact_calendar</i>

						<i class='material-icons pointer' Oid='$Code' onclick='verGustos(\"".$CustomerCodeAfiliacion."\")'>local_dining</i>

						<i class='material-icons pointer' Oid='$Code' onclick='CargarDatosOrden(\"".$Code."\")'>visibility</i>      
					</td>
				</tr>";

			
				}
			}
	
			$html.='</tbody>
		</table>';
		echo $html;
	}

	public function GetSalesListDevoluciones()
	{
		$html='';
		$ClassOrdes = new Orders();//Crear libreria
		$Text="";
		$Date="";

		if (isset($_GET['Pag'])) 
		{
			$Pag=$_GET['Pag'];
		}
		if (isset($_GET['Text'])) 
		{
			$Text=$_GET['Text'];
		}
		if (isset($_GET['Date'])) 
		{
			$Date=$_GET['Date'];
		}

		

		//$Recordset = $ClassOrdes->GetSales();


		if($Text=="" && $Date=="")
		{
			//$Recordset = $ClassOrdes->ordersPending();
			$Recordset = $ClassOrdes->GetDevoluciones();
		}
		else
		{
			$Recordset = $ClassOrdes->ordersSalesSearchDevoluciones($Date,$Text);
		}
			

		$html .='<table class="responsive-table">
			<thead>
				<tr>
					<th>Orden</th>					
					<th>Cliente</th>
					<th>Items</th>
					<th>Monto</th>
					<th>Fecha</th>
					<th>Plan</th>
					<th> </th>
				</tr>
			</thead>

			<tbody>';
		
		//inicio del loop
			if ($Recordset != FALSE)
			{
					foreach ($Recordset as $results) {
						
					//-------DATOS DE LA CONSULTA RETORNO------------------------------------------------------
					
					$Code = $results->codeorden;
					$Name =$results->nombre;
					$Apellido =$results->apellido;
					$Total =$results->total;
					$Total=number_format(floatval($Total) , 2 , "." , ",");
					
					$Cantidad = $results->cantidad;
					$Date = $results->date;
				
					$CustomerCodeRegistro = trim($results->num_registro);
					$CustomerCodeAfiliacion = trim($results->id_afiliacion);
					$NombreCompleto=$Apellido." ".$Name;
					//Cid= Customerid
					//Oid=Orderid

					$consulta_plan = $this->db->query("SELECT plan_nut FROM AFILIADOS WHERE id_afiliacion = '$CustomerCodeAfiliacion'");
					$respuesta_plan = $consulta_plan->row();

					$plan_nutricional = $respuesta_plan->plan_nut;
				
				$html.="<tr>
					<td>$Code</td>
			
					<td> $NombreCompleto </td>
					<td> $Cantidad </td>
					<td> $Total </td>
					<td> $Date </td>
					<td> $plan_nutricional </td>
					<td>
						<i class='material-icons pointer' Cid='$CustomerCodeAfiliacion ' onclick='CargarCustomer(\"".$CustomerCodeAfiliacion."\")'>perm_contact_calendar</i>

						<i class='material-icons pointer' Oid='$Code' onclick='verGustos(\"".$CustomerCodeAfiliacion."\")'>local_dining</i>

						<i class='material-icons pointer' Oid='$Code' onclick='CargarDatosOrden(\"".$Code."\")'>visibility</i>      
					</td>
				</tr>";

			
				}
			}
	
			$html.='</tbody>
		</table>';
		echo $html;
	}


	//metodo para enviar valores a los cuadros que estan en el dashboaard
	public function GetValues()
	{
		$html='';
		
		//Crear libreria

		//consulta apra traer los dats e los pedidos que han dido enviados
		$consulta_pedidos_enviados = $this->db->query("SELECT COUNT(*) AS cont FROM PAGO_MA WHERE estatus = '7'");
		$respuesta_pedidos_enviados = $consulta_pedidos_enviados->row();

		//consulta apra traer los dats e los pedidos pendientes por enviar
		$consulta_pedidos_porenviar = $this->db->query("SELECT COUNT(*) AS cont FROM PAGO_MA WHERE estatus = '4'");
		$respuesta_pedidos_porenviar = $consulta_pedidos_porenviar->row();

		//consulta apra traer los dats e los pedidos pendientes por preparar
		$consulta_pedidos_porpreparar = $this->db->query("SELECT COUNT(*) AS cont FROM PAGO_MA WHERE estatus = '3'");
		$respuesta_pedidos_porpreparar = $consulta_pedidos_porpreparar->row();

		//consulta apra traer los dats e los pedidos pendientes devoluciones
		$consulta_pedidos_devoluciones = $this->db->query("SELECT COUNT(*) AS cont FROM PAGO_MA WHERE estatus = '6'");
		$respuesta_pedidos_devoluciones = $consulta_pedidos_devoluciones->row();

		//consulta apra traer los dats e los pedidos pendientes por autorizar
		$consulta_pedidos_autorizar = $this->db->query("SELECT COUNT(*) AS cont FROM PAGO_MA WHERE estatus = '5'");
		$respuesta_pedidos_autorizar = $consulta_pedidos_autorizar->row();

		//consulta apra traer los dats e los pedidos pendientes por autorizar
		$consulta_pedidos_entregado = $this->db->query("SELECT COUNT(*) AS cont FROM PAGO_MA WHERE estatus = '8'");
		$respuesta_pedidos_entregado = $consulta_pedidos_entregado->row();


		//----------------------------------------------------
		$pedidos_enviados = $respuesta_pedidos_enviados->cont;
		$pedidos_porenviar = $respuesta_pedidos_porenviar->cont;
		$pedidos_porpreparar = $respuesta_pedidos_porpreparar->cont;
		$pedidos_devoluciones = $respuesta_pedidos_devoluciones->cont;
		$pedidos_autorizar = $respuesta_pedidos_autorizar->cont;
		$pedidos_entragado = $respuesta_pedidos_entregado->cont;

		$ClassOrdes = new Orders();
		try
		{
			$por_autorizar=number_format(/*floatval($ClassOrdes->GetPedidosPendientes()),0,'.',','*/$pedidos_autorizar);

			$por_preparar=number_format(/*floatval($ClassOrdes->GetVentasMes()),0,'.',','*/$pedidos_porpreparar);

			$por_enviar=number_format(/*floatval($ClassOrdes->GetVentasPorEnviar()),0,'.',','*/$pedidos_porenviar);

			$enviados=number_format($pedidos_enviados);

			$entregados=number_format(/*floatval($ClassOrdes->GetEntregado()),0,'.',','*/$pedidos_entragado);
			
			$devoluciones=number_format(/*floatval($ClassOrdes->GetDevolucionesMes()),0,'.',','*/$pedidos_devoluciones);

			//$PendientesPago=number_format(floatval($ClassOrdes->GetPedientesPago()),0,'.',',');
						
		
			$arr = array(
				'por_autorizar' => $por_autorizar,
				/*'Ventas' => $Ventas,*/
				'por_preparar' => $por_preparar,
				'por_enviar' => $por_enviar,
				'enviados' => $enviados,
				'entregados' => $entregados,
				'devoluciones' => $devoluciones
			);
			echo json_encode($arr);

		}
		catch(Exception $Exception)
		{
			
		}
	}
	
	//metood para traer el valor de la taza de cambio actual en la pagina
	public function traer_taza_cambio()
	{

		$enviar = $_POST['enviar'];
		
		//consulta para obtener el monto de a modificar de la taa en boliares
		$consulta_taza_cambio = $this->db->query("SELECT n_precio_m FROM MA_PRODUCTOS");
		$resultado_taza_cambio = $consulta_taza_cambio->row();

		$n_precio_m = $resultado_taza_cambio->n_precio_m;

		//consula para enviar monto de USD para modificacion de plan DHM07
		$consulta_usd_plan_DHM07 = $this->db->query("SELECT id_plan, descripcion, precio FROM PLAN_NUTRICIONAL WHERE id_plan = 'DHM07'");
		$respuesta_usd_plan_DHM07 = $consulta_usd_plan_DHM07->row();
		
		$usd_DHM07_descripcion = $respuesta_usd_plan_DHM07->descripcion;
		$usd_DHM07_id_plan = $respuesta_usd_plan_DHM07->id_plan;
		$usd_DHM07_precio = $respuesta_usd_plan_DHM07->precio;

		//consula para enviar monto de USD para modificacion de plan HMI03
		$consulta_usd_plan_HMI03 = $this->db->query("SELECT id_plan, descripcion, precio FROM PLAN_NUTRICIONAL WHERE id_plan = 'HMI03'");
		$respuesta_usd_plan_HMI03 = $consulta_usd_plan_HMI03->row();
		
		$usd_HMI03_descripcion = $respuesta_usd_plan_HMI03->descripcion;
		$usd_HMI03_id_plan = $respuesta_usd_plan_HMI03->id_plan;
		$usd_HMI03_precio = $respuesta_usd_plan_HMI03->precio;

		//consula para enviar monto de USD para modificacion de plan HMJ04
		$consulta_usd_plan_HMJ04 = $this->db->query("SELECT id_plan, descripcion, precio FROM PLAN_NUTRICIONAL WHERE id_plan = 'HMJ04'");
		$respuesta_usd_plan_HMJ04 = $consulta_usd_plan_HMJ04->row();
		
		$usd_HMJ04_descripcion = $respuesta_usd_plan_HMJ04->descripcion;
		$usd_HMJ04_id_plan = $respuesta_usd_plan_HMJ04->id_plan;
		$usd_HMJ04_precio = $respuesta_usd_plan_HMJ04->precio;

		//consula para enviar monto de USD para modificacion de plan HSE05
		$consulta_usd_plan_HSE05 = $this->db->query("SELECT id_plan, descripcion, precio FROM PLAN_NUTRICIONAL WHERE id_plan = 'HSE05'");
		$respuesta_usd_plan_HSE05 = $consulta_usd_plan_HSE05->row();
		
		$usd_HSE05_descripcion = $respuesta_usd_plan_HSE05->descripcion;
		$usd_HSE05_id_plan = $respuesta_usd_plan_HSE05->id_plan;
		$usd_HSE05_precio = $respuesta_usd_plan_HSE05->precio;

		//consula para enviar monto de USD para modificacion de plan MLE02
		$consulta_usd_plan_MLE02 = $this->db->query("SELECT id_plan, descripcion, precio FROM PLAN_NUTRICIONAL WHERE id_plan = 'MLE02'");
		$respuesta_usd_plan_MLE02 = $consulta_usd_plan_MLE02->row();
		
		$usd_MLE02_descripcion = $respuesta_usd_plan_MLE02->descripcion;
		$usd_MLE02_id_plan = $respuesta_usd_plan_MLE02->id_plan;
		$usd_MLE02_precio = $respuesta_usd_plan_MLE02->precio;

		//consula para enviar monto de USD para modificacion de plan PPM01
		$consulta_usd_plan_PPM01 = $this->db->query("SELECT id_plan, descripcion, precio FROM PLAN_NUTRICIONAL WHERE id_plan = 'PPM01'");
		$respuesta_usd_plan_PPM01 = $consulta_usd_plan_PPM01->row();
		
		$usd_PPM01_descripcion = $respuesta_usd_plan_PPM01->descripcion;
		$usd_PPM01_id_plan = $respuesta_usd_plan_PPM01->id_plan;
		$usd_PPM01_precio = $respuesta_usd_plan_PPM01->precio;

		$response = array(

			'respuesta' => $n_precio_m,
			/**----------------------------- */
			'usd_DHM07_descripcion' => $usd_DHM07_descripcion,
			'usd_DHM07_id_plan' => $usd_DHM07_id_plan,
			'usd_DHM07_precio' => $usd_DHM07_precio,
			/**-------------------------------- */
			'usd_HMI03_descripcion' => $usd_HMI03_descripcion,
			'usd_HMI03_id_plan' => $usd_HMI03_id_plan,
			'usd_HMI03_precio' => $usd_HMI03_precio,
			/**--------------------------------- */
			'usd_HMJ04_descripcion' => $usd_HMJ04_descripcion,
			'usd_HMJ04_id_plan' => $usd_HMJ04_id_plan,
			'usd_HMJ04_precio' => $usd_HMJ04_precio,
			/**--------------------------------- */
			'usd_HSE05_descripcion' => $usd_HSE05_descripcion,
			'usd_HSE05_id_plan' => $usd_HSE05_id_plan,
			'usd_HSE05_precio' => $usd_HSE05_precio,
			/**--------------------------------- */
			'usd_MLE02_descripcion' => $usd_MLE02_descripcion,
			'usd_MLE02_id_plan' => $usd_MLE02_id_plan,
			'usd_MLE02_precio' => $usd_MLE02_precio,
			/**--------------------------------- */
			'usd_PPM01_descripcion' => $usd_PPM01_descripcion,
			'usd_PPM01_id_plan' => $usd_PPM01_id_plan,
			'usd_PPM01_precio' => $usd_PPM01_precio

		);

		echo json_encode($response);

	}

	//metodo para actualizar la taza segun lo que el administrador dga en mid-reglas
	public function modificar_taza_cambio()
	{
		
		$enviar = $_POST['enviar'];
		$monto_cambio = $_POST['inputMontoTaza'];

		//datos que se reciben segun el plan nutricional para la actualizacion en base de datos
		$inputUSDDHM07_input = $_POST['inputUSDDHM07'];
		$inputUSDHMI03_input = $_POST['inputUSDHMI03'];
		$inputUSDHMJ04_input = $_POST['inputUSDHMJ04'];
		$inputUSDHSE05_input = $_POST['inputUSDHSE05'];
		$inputUSDMLE02_input = $_POST['inputUSDMLE02'];
		$inputUSDPPM01_input = $_POST['inputUSDPPM01'];

		//actualizacion de datos directa (mejorar despues)

		//actualizacion de plan DHM07
		$data_DHM07 = array(
			'precio' => $inputUSDDHM07_input
		);
		$this->db->where('id_plan', 'DHM07');
		$this->db->update('PLAN_NUTRICIONAL', $data_DHM07);

		//actualizacion de plan HMI03
		$data_HMI03 = array(
			'precio' => $inputUSDHMI03_input
		);
		$this->db->where('id_plan', 'HMI03');
		$this->db->update('PLAN_NUTRICIONAL', $data_HMI03);

		//actualizacion de plan HMJ04
		$data_HMJ04 = array(
			'precio' => $inputUSDHMJ04_input
		);
		$this->db->where('id_plan', 'HMJ04');
		$this->db->update('PLAN_NUTRICIONAL', $data_HMJ04);


		//actualizacion de plan HSE05
		$data_HSE05 = array(
			'precio' => $inputUSDHSE05_input
		);
		$this->db->where('id_plan', 'HSE05');
		$this->db->update('PLAN_NUTRICIONAL', $data_HSE05);

		//actualizacion de plan MLE02
		$data_MLE02 = array(
			'precio' => $inputUSDMLE02_input
		);
		$this->db->where('id_plan', 'MLE02');
		$this->db->update('PLAN_NUTRICIONAL', $data_MLE02);

		//actualizacion de plan PPM01
		$data_PPM01 = array(
			'precio' => $inputUSDPPM01_input
		);
		$this->db->where('id_plan', 'PPM01');
		$this->db->update('PLAN_NUTRICIONAL', $data_PPM01);
		//---------------------------------------------

		$c_codigo = '0000000001';
		$data_taza = array(

			'n_precio_m' => $monto_cambio

		);

		$this->db->where('C_CODIGO', $c_codigo);

		if ($this->db->update('MA_PRODUCTOS', $data_taza)) {

			$respuesta_mod = 1;
			
			$response = array(

				'respuesta' => $respuesta_mod

			);

			echo json_encode($response);

		}else{

			$respuesta_mod = 2;
			
			$response = array(

				'respuesta' => $respuesta_mod

			);

			echo json_encode($response);

		}

	}

	//metodo para traer los gustos del usuario registrado
	public function ver_gustos_usuario()
	{
		
		$id_afiliacion = $_POST['id_afiiacion'];

		$consulta_gustos_usuario = $this->db->query("SELECT GM.cod_alimento, MA.descripcion FROM MA_GUSTOS GM INNER JOIN MA_ALIMENTOS MA ON GM.cod_alimento = MA.cod_alimento WHERE id_afiliacion = '$id_afiliacion'");
		$respuesta_gustos_usuario = $consulta_gustos_usuario->result();

		$html_response_gustos = "";
		$html_response_gustos .="<table class='responsive-table'>
			<thead>
				<tr>					
					<th>Codigo de Alimento</th>
					<th>Descripcion Alimento</th>
				</tr>
			</thead>

			<tbody>";

		if ($respuesta_gustos_usuario != null) {
			
			foreach ($respuesta_gustos_usuario as $result) {
				
				$html_response_gustos.="<tr>
				
					<td>".$result->cod_alimento."</td>
					<td>".$result->descripcion."</td>
				</tr>";

			}

			$response = array(

				'respuesta_gustos' => $html_response_gustos

			);

			echo json_encode($response);

		}else{

			$html_response_gustos = "<div><p>Este usuario no ha señalado ningun gusto.</p></div>";

			$response = array(

				'respuesta_gustos' => $html_response_gustos

			);

			echo json_encode($response);

		}

	}

	//metodo para cargar vista de configuracion de datos de contacto
	public function configurar_contactos_view()
	{
		$this->load->view('admin/header/header');
		$this->load->view('admin/mid-config-contact');
		$this->load->view('admin/footer/footer');
	}

	//metodo para traer numero de contacto
	public function datos_contactos()
	{

		$consulta_datos_contact = $this->db->query("SELECT * FROM INFO_CONTACTO");
		$resultado_datos_contact = $consulta_datos_contact->row();

		$num_contacto = $resultado_datos_contact->numero_contacto;

		$correo_de_contacto = $resultado_datos_contact->correo_contacto;

		$response = array(

			'num_contaco' => $num_contacto,
			'correo_de_contacto' => $correo_de_contacto

		);

		echo json_encode($response);

	}

	//meotod para modificacion de contectos
	public function modificar_contactos()
	{
		$num_contacto = $_POST['numContacto'];
		$correo_contacto = $_POST['correoContacto'];

		$data_contactos = array(

			'numero_contacto' => $num_contacto,
			'correo_contacto' => $correo_contacto

		);

		if ($this->db->update('INFO_CONTACTO', $data_contactos)) {
			
			$respuesta_modif_contact = 1;

			$response = array(

				'respuesta_modif_contact' => $respuesta_modif_contact

			);

			echo json_encode($response);
			return;
		}

		$respuesta_modif_contact = 2;

			$response = array(

				'respuesta_modif_contact' => $respuesta_modif_contact

			);

		echo json_encode($response);
	}
}
