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
    
    if (isset($_POST['correo']) && isset($_POST['clave'])) {

      $correo_usuario=$_POST['correo'];
      $this->load->model('usuario_model');


      if($this->usuario_model->login($_POST['correo'],$_POST['clave'])) {
 
        $token = bin2hex( openssl_random_pseudo_bytes(20) );
        $clave= hash('ripemd160', $_POST['clave']);

        $consulta_act_usuario = $this->db->query("SELECT * FROM MA_LOGIN WHERE correo = '$correo_usuario' AND clave = '$clave' AND estatus = '1'");
        $respuesta_act_usuario = $consulta_act_usuario->row();

          if($respuesta_act_usuario == null){

            //respuesta en cad de que el correo no haya sido validado por el usuario.
            $respuesta_html = 1;
            $response = array(

              'respuesta' => $respuesta_html

            );

            echo json_encode($response);

          }else{

            $this->session->set_userdata('correo', $_POST['correo']);

            $consulta = $this->db->query("SELECT * FROM MA_LOGIN  WHERE correo = '$correo_usuario'");
            $respuesta = $consulta->row();

            $this->session->set_userdata('num_registro', $respuesta->num_registro);
            
            $respuesta_html = 3;
            $response = array(

              'respuesta' => $respuesta_html

            );

            echo json_encode($response);

          }  

      } else {

        //respuesta de si el alguno de los datos del usaurio no existe
        $respuesta_html = 2;
        $response = array(

          'respuesta' => $respuesta_html

        );

        echo json_encode($response);
      }

    }

  }
  
  //metodo para cargar vista de login
  public function login_view()
  {

    if ($this->session->userdata('correo')) {
      
      redirect('dashboardnuevo', 'refresh');
    }
    
    $this->load->view('login');

  }

  //funcion para cerrar sesion solo se aplica un sess_destroy
  public function logout()
  {
    $this->session->sess_destroy();
    redirect('welcome');
  }

  //metodo paara ingresar a la vista de registro de usuario
  public function vista_registrar_usuario()
  {

    if ($this->session->userdata('correo')) {
      
      redirect('dashboardnuevo', 'refresh');
    }

    $data['correo_session'] = '';
    //envio de datos del carrito al header para visualizacion del usuario
		if (isset($_SESSION['correo'])) {

			$correo_usuario = $_SESSION['correo'];
      $consulta = $this->db->query("SELECT * FROM MA_LOGIN  WHERE correo = '$correo_usuario'");
      $respuesta = $consulta->row();
      if($respuesta!=null)
      $this->session->set_userdata('num_registro', $respuesta->num_registro);

      $data['correo_session'] = $correo_usuario;


		}

    //obtener tipo de actitud fisica que tine el suscriptor para grabar en la tabla de afiliacion

    $query = $this->db->query('SELECT * FROM PLAN_NUTRICIONAL_ACT_FISICA');
    $results_af = $query->result();

    //obtener si existe alguna aptitud especial en el usuario
    $query = $this->db->query('SELECT * FROM PLAN_NUTRICIONAL_CONDICION_ESPECIAL');
    $results_ce = $query->result();

    
    //obtener los paises
    $query = $this->db->query('SELECT * FROM PAIS');
    $results_pais= $query->result();

    //obtener los datos para resumen de compra del cliente

    //codigo del unico producto que existe por el momento en la base de datos
    $codigo_producto = "0000000001";
    $cosulta_resumen = $this->db->query("SELECT * FROM MA_PRODUCTOS WHERE C_CODIGO = '$codigo_producto'");
    $resultado_resumen = $cosulta_resumen->row();

    $consulta_precio_bs = $this->db->query("SELECT (e_precio*n_precio_m) AS precio FROM MA_PRODUCTOS WHERE C_CODIGO = '$codigo_producto'");
    $resultado_precio_bs = $consulta_precio_bs->row();

    //varibles de productos que se enviaran a la vista de registrar ususario para la parte informativa
    $data['precio_dolares'] = number_format($resultado_resumen->e_precio, 2, '.',',');
    $data['precio_bs'] = number_format($resultado_precio_bs->precio, 2, '.',',');
    $data['prod_descripcion'] = $resultado_resumen->C_DESCRI;


    //definicion de variables que se eniaran a la vista para los select de los planes
    $data['actitud_fisica'] = $results_af;
    $data['condicion_especial'] = $results_ce;
    $data['pais'] = $results_pais;


    //datos para mostrar la barra de estado del registro
    $data_ntf['mostrar'] = "1";

    $this->load->view('headers/header_loged', $data_ntf);
    $this->load->view('registrar_usuario',$data);
    $this->load->view('footer/footer');
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
