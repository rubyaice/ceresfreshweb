<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class GetUsersList extends CI_Controller {

	public function __construct()
	{
		parent::__construct();

		$this->load->helper('url');
		$this->load->database();
		if (!$this->session->userdata('correo_admin')) {
			redirect('admin/login');
        }
        $this->load->library('admin/User');
    
		if (!class_exists('User')) { require_once(APPPATH.'libraries/admin/User'.EXT); } 

	}


	public function index()
	{
        $this->load->view('admin/header/header');
		$this->load->view('admin/mid-users');
		$this->load->view('admin/footer/footer');
		

	}

    public function UserList()
    {
    $UserClass = new User();
    $Pag=1;
    $Text=false;
    $html='';


    if (isset($_GET['Pag'])) {
        $Pag=$_GET['Pag'];
    }
    if (isset($_GET['Text'])) {
        $Text=$_GET['Text'];
    }


    $Recordset = $UserClass->GetUsers($Pag,$Text);


    $html.='<table class="table">
        <thead>
            <tr>
                <th>Nombre</th>
                <th>Email</th>
                <th> </th>
            </tr>
        </thead>

        <tbody>';
    
    //inicio del loop
        if ($Recordset != FALSE)
        {
           foreach ($Recordset as $result) {
        
                $Code = trim($result->num_registro);
                $Name = $result->description;
                $EMAIL = $result->correo;
                $TYPE = $result->tipo;
                
        //LLENADO DE LA TABLA
        
        $html.="<tr>
                    <td>$Name</td>
                    <td>$EMAIL</td>

                    <td>
                        <a class='black-text' href='#'><i class='material-icons pointer' Uid='\"".$Code."\"' onclick='EditarUsuario(\"".$Code."\", \"".$Name."\", \"".$EMAIL."\")'>border_color</i></a>
                        
                        <a class='black-text' href='#'><i class='material-icons pointer' Uid='\"".$Code."\"' onclick='EliminarConUsuario(\"".$Code."\")'>delete</i></a>
                    </td>
                </tr>";
         
            }
        }

    //fin del loop
    
    $html.='</tbody>
    </table>';

    echo $html;
        }

}

