<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Login extends CI_Controller {

  public function __construct()
  {
    parent::__construct();

    $this->load->helper('url');
    $this->load->database();

    $this->load->model('functions_model');
    $Semana=$this->functions_model->GetSemana();
    $Dia=$this->functions_model->GetDataSemana();
    $this->session->set_userdata('SemanaActual', $Semana);
    $this->session->set_userdata('DiaSemanaActual', $Dia->ND);
    $this->session->set_userdata('DiaSemanaPago', $Dia->SEMANA_PAGO);


  }


	//primera funcion que se ejecuta en al llamar el controlador, funcion para recepcion de datos de incio de sesion, este metodo a su vez llama a la vista de login
	public function index()
	{

    if ($this->session->userdata('correo')) {
      redirect('welcome', 'refresh');
    }

    if (isset($_POST['correo']) && isset($_POST['clave'])) {
      $correo_usuario=$_POST['correo'];
      $this->load->model('admin/usuario_model');


      if($this->usuario_model->login($_POST['correo'],$_POST['clave'])) {

        $this->session->set_userdata('correo_admin', $_POST['correo']);

        $consulta = $this->db->query("SELECT * FROM MA_LOGIN_ADMIN  WHERE correo = '$correo_usuario'");
        $respuesta = $consulta->row();

        $this->session->set_userdata('num_registro_admin', $respuesta->num_registro);
        redirect('admin/welcome');

      } else {
        $alert = "<script>alert('Usuario y/o Contraseña incorrectos')</script>";
        echo $alert;
        redirect('admin/login', 'refresh');
      }
    }
		$this->load->view('admin/login');
	}

  //funcion para cerrar sesion solo se aplica un sess_destroy
  public function logout()
  {
    $this->session->sess_destroy();
    redirect('admin/login', 'refresh');
  }

  //metodo paara ingresar a la vista de registro de usuario
  public function vista_registrar_usuario()
  {
    $data['correo_session'] = '';
    //envio de datos del carrito al header para visualizacion del usuario
		if (isset($_SESSION['correo'])) {

			$correo_usuario = $_SESSION['correo'];
      $consulta = $this->db->query("SELECT * FROM MA_LOGIN_ADMIN  WHERE correo = '$correo_usuario'");
      $respuesta = $consulta->row();
      if($respuesta!=null)
      $this->session->set_userdata('num_registro_admin', $respuesta->num_registro);

      $data['correo_session'] = $correo_usuario;


		}

    



    //datos para mostrar la barra de estado del registro
    $data_ntf['mostrar'] = "1";

    $this->load->view('admin/header/header');
    $this->load->view('registrar_usuario');
    $this->load->view('admin/footer/footer');
  }

  public function get_estado()
  {
    $html = '';

    if (isset($_POST['Code'])) {
        //obtener los estados
        $pais=$_POST['Code'];
        $query = $this->db->query("SELECT * FROM ESTADOS WHERE id_pais='$pais'");
        $results_estado= $query->result();
        $html = '<option value="" selected>Seleccione</option>';
      foreach ($results_estado as $result) {

        $Value = $result->id_estado;
        $Estado = $result->estado;
        if($result->id_estado==24){
   
          $html .= '<option value="'.$Value.'" >'.$Estado.'</option>';
        }
      }
    }

    $response = array( 'estado' => $html );

     echo json_encode($response);

  }

  public function get_ciudad()
  {
    $html = '';

    if (isset($_POST['Code'])) {
        //obtener los estados
        $estado=$_POST['Code'];
        //obtener los ciudad
        $query = $this->db->query("SELECT * FROM CIUDADES WHERE id_estado='$estado' ");
        $results_ciudades= $query->result();
        $html .= '<option value="" selected >Seleccione</option>';
      foreach ($results_ciudades as $result) {

        $Value = $result->id_ciudad;
        $Ciudad = $result->ciudad;
        if($result->ciudad=='Caracas'){
          $html .= '<option value="'.$Value.'" >'.$Ciudad.'</option>';
        
        
        }

      }
    }

    $response = array( 'ciudad' => $html );

     echo json_encode($response);

  }

  public function get_sector()
  {
    $html = '';

    if (isset($_POST['Code'])) {
        //obtener los estados
        $ciudad=$_POST['Code'];
        //obtener los ciudad
        $query = $this->db->query("SELECT * FROM SECTORES WHERE id_ciudad='$ciudad' ");
        $results_ciudades= $query->result();
        $html .= '<option value="">Seleccione</option>';
      foreach ($results_ciudades as $result) {

        $Value = $result->id;
        $Sector = $result->Sector;
        $html .= '<option value="'.$Value.'">'.$Sector.'</option>';

      }
    }

    $response = array( 'sectores' => $html );

     echo json_encode($response);

  }
}
