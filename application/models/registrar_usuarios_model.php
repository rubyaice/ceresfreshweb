<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Registrar_usuarios_model extends CI_Model {

  public function __construct(){

    parent::__construct();
    $this->load->database();
    $this->load->library('email');

  }

  //metodo para registrar usuarios solo correo en la base de datos
  public function registrar_usuarios($correo,$nombre_proveedor,$clave)
  {
    $ToReturn=false;
    //datos que se enviaran a la tabla MA_LOGIN
    $token = bin2hex( openssl_random_pseudo_bytes(20) );
    $token_correo = hash( 'ripemd160', $correo );
    $token_clave= hash('ripemd160', $clave);
    $id_activacion = uniqid();
    
    $this->load->model('functions_model');
    $valor=$this->functions_model->GetCorrelative("REGISTRO_USER",true);

    $data_login = array('num_registro'=>$valor,
                    'correo' => $correo,
                  'nombre_proveedor' => $nombre_proveedor,
                  'clave'=> $token_clave,
                  'token' => $token_correo,
                  'id_activacion' => $id_activacion
                );

    //data para guardar en notificaciones
    $data_notificaciones = array(
      'num_registro'=>$valor,
      'correo' => $correo,
      'tipo' => '1'

    );

    //insercion en tabla MA_LOGIN
    $result = $this->db->insert('MA_LOGIN', $data_login);

    if($result){

        //consulta de si existe el correo registrado en el sistema
        $consulta_correo_usuario = $this->db->query("SELECT * FROM MA_LOGIN WHERE correo = '$correo'");
        $respuesta_correo_usuario = $consulta_correo_usuario->row();

        //validacion de si existe el correo
        if ($respuesta_correo_usuario != null) {

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

          //rellenado de email para recuperacion de contraseña
          $id_activacion_usuario = $respuesta_correo_usuario->id_activacion;
          $asunto = 'Bienvenido a Ceresfresh';
          $base_url = base_url('img/Ceres/CERES_Icon.png');
          $url = site_url('activarcuenta/?CodeUniqActive_Oop='.$id_activacion);

          $enlace = '<a href="'.$url.'">'.$url.'</a>';

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
                      <h2>Confirmación de correo electrónico Ceres<span style="color:#7cbd41">fresh</span></h2>
                      
                      <p>Por favor haz Click en el siguiente enlace para confirmar tu correo electrónico.</p>
                      
                      '.$enlace.'
                      
                  </div>
              </div>
          </body>
          </html>';

          $this->email->initialize($config);
          $this->email->set_newline("\r\n");

          $this->email->from('ceresfreshweb@gmail.com', 'Ceresfresh');
          $this->email->to($correo); 
          $this->email->subject($asunto);
          $this->email->message($html);
          // Set to, from, message, etc.

          if ($this->email->send()) {
            
            $this->session->set_userdata('id_activacion', $id_activacion_usuario);

          }

        }

        if( $this->db->insert('NOTIFICACIONES', $data_notificaciones)){
          if($this->load->model('proceso_registro_model')){

              if($this->proceso_registro_model->insertar_estatus($valor,2)){
                  $ToReturn=true;
              }
          }
       }
    }
    return $ToReturn;
  }

}
