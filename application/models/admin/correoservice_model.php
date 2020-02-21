<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Correoservice_model extends CI_Model {

  public function __construct(){

    parent::__construct();

    $this->load->database();
    $this->load->helper('url');
    $this->load->library('email');

  }

  //metodo para servicio de envio de correos electronico para informacion de los usuarios
  public function enviar_correo($correo, $estatus)
  {

    //definicion de respuesta para validar por AJAX que paso con el servio de envio.
    $respuesta = false;

    //consulta pra obtener el asunto:descripcion y la descripcion:descripcionEmail

    $consulta_descrip_notf = $this->db->query("SELECT * FROM TIPO_NOTIFICACIONES WHERE id_notificacion = '$estatus'");
    $respuesta_descrip_notf = $consulta_descrip_notf->row();

    $asunto = $respuesta_descrip_notf->descripcion;
    $body_html = $respuesta_descrip_notf->descripcionEmail;


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

    //definicion de imagen que estara en el correo
    $base_url = base_url('img/Ceres/CERES_Icon.png');

    //definicion de informacion de pago
    $informacion_pago = '';

    if ($estatus == '3') {
      
      $informacion_pago = '
      <p><b>Información de Compra:</b></p>
      <p>- La <b>#NutriBox</b> está lista para sustentar el plan nutricional que hemos preparado para ti, tu plan esta elaborado para cubrir los días de <b>Lunes a Domingo</b>.</p>
      <p>- Los despachos de la <b>#NutriBox</b> son los días <b>Viernes</b> de cada semana.</p>
      <p>- El día del corte para validar y considerar los pagos son los miércoles de cada semana.</p>
      ';

    } else {
      
      $informacion_pago = '';

    }
    

    //definicion del correo como tal segun lo que llegue
    $html = '<!DOCTYPE html>
                <html>
                <head>
                    <meta charset="utf-8">
                    <meta http-equiv="X-UA-Compatible" content="IE=edge">
                    <title>Ceresfresh Web</title>
                    <meta name="viewport" content="width=device-width, initial-scale=1">
                </head>
                <body>
                    <div class="container">
                        <div style="text-align:center;">
                            <br><br>
                            <img style="max-width:50%; height: auto;" aria-readonly="true" src="'.$base_url.'" alt="ceres">

                            <h2>'.$asunto.'</h2>
                            
                            <p>'.$body_html.'</p><br>
                            
                            '.$informacion_pago.'
                            <br>
                            <p><b>¡Gracias por confiar en Ceresfresh!</b></p>
                            
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
      
      $respuesta = true;

    }else{

      $respuesta = false;

    }

    return $respuesta;

  }

}
