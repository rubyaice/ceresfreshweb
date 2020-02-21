<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class CargaDetalleOrden extends CI_Controller {

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


	public function index()
	{

        $html='';
        $ClassOrders = new Orders();
        $ClassCustomers = new Customers();


        $ClassOrders->Code=$_GET['Code'];

        $RecordsetOrden = $ClassOrders->GetOrder();
        $ClassCustomers->Code=$ClassOrders->CustomerCode;
        $ClassCustomers->CodeAfiliado=$ClassOrders->CustomerCode;
        $RecordsetCustomer = $ClassCustomers->GetCustomer();
        if ($RecordsetCustomer != FALSE)
            {
            $Name = $ClassCustomers->Name;
            $Apellido = $ClassCustomers->Lastname;
            $Email= $ClassCustomers->Email;
            $Phone = $ClassCustomers->Phone;
            $Cedula= $ClassCustomers->Cedula;
            $Address=$ClassCustomers->Address;
            $City =$ClassCustomers->City;
            $State=$ClassCustomers->State;
            $Sector=$ClassCustomers->Sector;
            $ZipCode=$ClassCustomers->ZipCode;
            

       $html.=' <div class="row">
            <div class="col m11 s10">
                <h4>Detalle de la orden</h4>
            </div>
            <div class="col m1 s2">
            <a class="btn-floating btn-large waves-effect waves-light red pointer"><i onclick="RegresarLista()" class="material-icons">arrow_back</i></a>
            </div>
        </div>
        <div class="row">
            <div class="col m6 s12">
                <h5>Datos del Comprador</h5>
                <!--<p><strong>ID: </strong><?php echo $Cedula ?></p>!-->
                <p><strong>Nombre: </strong>'.$Name.'</p>
                <p><strong>Apellido: </strong>'.$Apellido.'</p>
                <p><strong>Email: </strong>'.$Email.'</p>
                <p><strong>Teléfono: </strong>'.$Phone.'</p>
            </div>
            <div class="col m6 s12">
                <h5>Dirección del comprador</h5>
                <p><strong>Ciudad: </strong>'.$City.'</p>
                <p><strong>Estado: </strong>'.$State.'</p>
                <p><strong>Sector: </strong>'.$Sector.'</p>
                <p><strong>Dirección: </strong>'.$Address.'</p>
                <p><strong>Código Postal: </strong>'.$ZipCode.'</p>
            </div>

            <div class="col m12 s12">
                <p><b>IMPORTANTE:</b> El monto reflejado en esta transacción puede variar al precio actual de la #Nutribox debido al cambio constante en la <b>Tasa de cambio</b>.</p>
            </div>
        </div>

        <table class="table-responsive highlight">
            <thead class="">
                <tr>
                  
                    <th class="center-align">Código Producto</th>
                    <th class="center-align">Producto</th>
                    <th class="center-align">Cantidad</th>
                    <th class="center-align">Monto</th>
                    
                </tr>
            </thead>
            <tbody>';


            }
        $RecordsetDetails = $ClassOrders->GetOrderDetails();



        if ($RecordsetDetails != FALSE)
        {
         foreach ($RecordsetDetails as $results) 
            {
                $Codigo=$results->ProductCode;
               
                $Nombre=$results->Nombre;
                $Cantidad=$results->Cantidad;
                $Precio=number_format(floatval($results->precio),2,'.',',');
                $Amount=number_format(floatval($results->monto),2,'.',',');

               $html.=' <tr>
                     <td class="center-align">'.$Codigo.'</td>
                    <td class="center-align">'.$Nombre.'</td>
                    <td class="center-align">'.$Cantidad.'</td>
                    <td class="right-align">'.$Amount.'</td>
                    
                </tr>';

        //$RecordsetDetails->MoveNext();
            }

        }//Fin loop

         $html.='</tbody>
        </table>
        <div class="row footertable">
            <div class="col12">
                <h5 class="right-align">'.number_format(floatval($ClassOrders->Total),2,'.',',') .'</h5>
            </div>
        </div>';

        echo $html;
     }
}
