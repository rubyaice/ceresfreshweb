<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class CargarDatosCliente extends CI_Controller {

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

    $ClassCustomers = new Customers();
    /*-----------------------------------------------------------------------------------------------
    ESTRUCTURA BASICA DE LOS DATOS DE LA MODAL
    -------------------------------------------------------------------------------------------------
        <div class="modal-content" id="modal-clientes-datos">
            <h4>Modal Header</h4>
            <p>Contenido</p>
        </div>
    --------------------------------------------------------------------------------------------------
    }*/
    $html='';

    $ClassCustomers->CodeAfiliado=$_GET['Code'];
    $Recordset = $ClassCustomers->GetCustomer();

        if ($Recordset != FALSE)
        {

                //Datos de la consulta que retorna
                //select 
                //Code, HashActive, Name, Lastname, Email, Sexo, Password, Phone, Cedula, Address, City, State, Sector, ZipCode 
                //from CUSTOMERS_MA

                $Name = $ClassCustomers->Name;
                $Apellido = $ClassCustomers->Lastname;
                $Email= $ClassCustomers->Email;
                $Phone = $ClassCustomers->Phone;
                $Code= $ClassCustomers->CodeAfiliado;
                $Address=$ClassCustomers->Address;
                $City =$ClassCustomers->City;
                $State=$ClassCustomers->State;
                $Sector=$ClassCustomers->Sector;
                $ZipCode=$ClassCustomers->ZipCode;
                
        $html.='<div class="modal-content" id="modal-clientes-datos">
                <div class="row">
                    <div class="col m6 s12">
                        <h4>Datos del Usuario</h4>
                        <p><strong>ID: </strong>'.$Code.'</p>
                        <p><strong>Nombre: </strong>'.$Name.'</p>
                        <p><strong>Apellido: </strong>'.$Apellido.'</p>
                        <p><strong>Email: </strong>'.$Email .'</p>
                        <p><strong>Teléfono: </strong>'.$Phone .'</p>
                    </div>
                    <div class="col m6 s12">
                        <h4>Datos de Envío</h4>
                        <p><strong>Dirección: </strong>'.$Address.'</p>
                        <p><strong>Ciudad: </strong>'.$City.'</p>
                        <p><strong>Estado: </strong>'.$State.'</p>
                        <p><strong>Sector: </strong>'.$Sector.'</p>
                        <p><strong>Código Postal: </strong>'.$ZipCode.'</p>
                    </div>
                </div>
            </div>';
        }
        echo $html;


    }

}