<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Email extends CI_Controller{

  public function __construct()
  {
    parent::__construct();

    $this->load->database();
    $this->load->helper('url');
    $this->load->library('email');

    }

  //carga de vista de recuperacion de contraseña
  public function index()
  {
      
    $this->load->view('headers/header_loged');
    $this->load->view('recuperar_clave_usuario');
    $this->load->view('footer/footer');
    
  }  

  //metodo para recuperacion de contraseña via correo el cual recibe del AJAX el correo del usuario para enviar el correo de recuperacion con la nueva contraseña
  public function enviar_email()
  {
    
    $proceso = $_REQUEST['proceso'];
    $correo_usuario = $_REQUEST['correo_usuario'];

    //consulta de i existe l correo registrado en el sistema
    $consulta_correo_usuario = $this->db->query("SELECT * FROM MA_LOGIN WHERE correo = '$correo_usuario'");
    $respuesta_correo_usuario = $consulta_correo_usuario->row();

    $respuesta = "0";

    //validacion de si existe el correo en la tabla de MA_LOGIN
    if ($respuesta_correo_usuario == null) {

        $respuesta = "1";

        echo $respuesta;
        
        return;

    }

    //consulta para saber el usuario smtp del cliente segun sea elegido
    $consulta_reglas_correo = $this->db->query("SELECT * FROM REGLASDENEGOCIO WHERE Campo = 'Correo_Direccion'");
    $repuesta_reglas_correo = $consulta_reglas_correo->row();

    //consulta para saber la clave smtp del cliente segun sea elegido
    $consulta_reglas_pass = $this->db->query("SELECT * FROM REGLASDENEGOCIO WHERE Campo = 'Correo_Password'");
    $repuesta_reglas_pass = $consulta_reglas_pass->row();

    //variables para inicio de sesion en SMTP
    $host_user = $repuesta_reglas_correo->Valor;
    $host_pass = $repuesta_reglas_pass->Valor;
      
    
    $config = Array(

        'protocol' => 'smtp',
        'smtp_host' => 'ssl://smtp.gmail.com',
        'smtp_port' => '465',
        'smtp_user' => $host_user,
        'smtp_pass' => $host_pass,
        'mailtype'  => 'html', 
        'charset'   => 'utf-8'
    );

    //varaibles vacias que sera rellenadas segun el caso de su uso

    $html = '';
    $asunto = '';


    //-------------------------------------
    

    //rellenado de variables segun caso de recuperacion de contraseña del usuario
    if ($proceso == "0") {
        
    //variables con nueva contraseña aleatoria
    $nueva_clave_aleatoria = rand(1000,10000000000);

    //encriptacion de la clave para la base de datos
    $token = bin2hex( openssl_random_pseudo_bytes(20) );
    $token_clave= hash('ripemd160', $nueva_clave_aleatoria);

    //rellenado de email para recuperacion de contraseña
    $asunto = 'Recuperación de Contraseña Ceresfresh';
    $base_url = base_url('img/Ceres/CERES_Icon.png');

    $html .= '<!DOCTYPE html>
    <html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Ceesfresh Web</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
    </head>
    <body>
        <div class="container">
            <div style="text-align:center;">
                <br><br>
                <img style="max-width:50%; height: auto;" aria-readonly="true" src="'.$base_url.'" alt="ceres">
                <h2>Recuperación de contraseña Ceres<span style="color:#7cbd41">fresh</span></h2>
                
                <p>La contrasea suministrada a continuación es de uso <b>Temporal</b> y deberá ser <b>Modificada</b> a la brevedad posible</p>
                
                <p>Su nueva contraseña es: <b>'.$nueva_clave_aleatoria.'</b></p>
            </div>
        </div>
    </body>
    </html>';

    $this->email->initialize($config);
    $this->email->set_newline("\r\n");

    $this->email->from('ceresfreshweb@gmail.com', 'Ceresfresh');
    $this->email->to($correo_usuario); 
    $this->email->subject($asunto);
    $this->email->message($html);
    // Set to, from, message, etc.
     

    if ($this->email->send()) {


        //defnicion de los datos que se enviaran a la base de datos para actualizar, lo que se enviara sera una encrptacion de la clave y lo que se envar por correo es la clave sin encriptar
        $data_actualizar_clave = array(

            'clave' => $token_clave

        );

        //envio de clave a la base de datos
        $this->db->where('correo', $correo_usuario);
        $this->db->update('MA_LOGIN', $data_actualizar_clave);

        //respuesta para el usuario
        $respuesta = "2";   
        
        echo $respuesta;

    }else{

        //respuesta para el usuario
        $respuesta = "3";   
        
        echo $respuesta;
        
        }

    }

    //-------------------------------------------

  }
}