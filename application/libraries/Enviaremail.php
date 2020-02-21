<?php 
class Enviaremail{

    protected $ci;
    
    public function __construct()
    {
        $this->ci =& get_instance();
        /*$ci->load->helper('url');
        $ci->load->library('email');
        $ci->load->database();*/
        $this->ci->load->library('email');

        

    }

    public function enviar_correo($correo_usuario, $proceso)
    {

    //consulta de i existe l correo registrado en el sistema
    $consulta_correo_usuario = $this->ci->db->query("SELECT * FROM MA_LOGIN WHERE correo = '$correo_usuario'");
    $respuesta_correo_usuario = $consulta_correo_usuario->row();

    //respuesa inicializada en false
    $respuesta = false;

    //varaibles vacias que sera rellenadas segun el caso de su uso
    $html = '';
    $asunto = '';


    //validacion de si existe el correo en la tabla de MA_LOGIN
    if ($respuesta_correo_usuario == null) {

        $respuesta = false;
        
        return $respuesta;

    }

    //consulta para saber el usuario smtp del cliente segun sea elegido
    $consulta_reglas_correo = $this->ci->db->query("SELECT * FROM REGLASDENEGOCIO WHERE Campo = 'Correo_Direccion'");
    $repuesta_reglas_correo = $consulta_reglas_correo->row();

    //consulta para saber la clave smtp del cliente segun sea elegido
    $consulta_reglas_pass = $this->ci->db->query("SELECT * FROM REGLASDENEGOCIO WHERE Campo = 'Correo_Password'");
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

    //-------------------------------------


    //en caso de recuperacion de contraseña desde el perfil del usaurio
    if ($proceso == "1") {

        $asunto = 'Modificación de Contraseña, Ceresfresh Web';

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
                    
                    <h2>Modificación de contraseña Ceres<span style="color:#7cbd41">Fresh</span></h2>
                    
                    <p>Se ha detectado que hubo una modificación de su <b>Contraseña</b>, en caso de que sea una modificación no autorizada por favor comuníquese con nuestro personal de Soporte.</p>
                    
                </div>
            </div>
        </body>
        </html>';
        
        $this->ci->email->initialize($config);
        $this->ci->email->set_newline("\r\n");

        $this->ci->email->from('ceresfreshweb@gmail.com', 'Ceresfresh Web');
        $this->ci->email->to($correo_usuario); 
        $this->ci->email->subject($asunto);
        $this->ci->email->message($html);
        // Set to, from, message, etc.
     

        if ($this->ci->email->send()) {


            //respuesta para el usuario en caso de que el correo se envie satisfactoriamente
            $respuesta = true;    
        
            return $respuesta;

        }else{

            //respuesta para el usuario en caso de que el correo no se envie de manera satisfactoria
            $respuesta = false;   
        
            return $respuesta;
        
        }

    }

    //-------------------------------------------


    //en caso de recuperacion de contraseña desde el perfil del usaurio
    if ($proceso == "2") {

        $asunto = 'Afiliación Exitosa, Ceresfresh Web';

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
                    
                    <h2>Afiliación Exitosa, Ceres<span style="color:#7cbd41">Fresh</span></h2>
                    
                    <p>El proceso de <b>Afiliación</b> se ha completado de manera Satisfactoria.</p>
                    
                </div>
            </div>
        </body>
        </html>';
        
        $this->ci->email->initialize($config);
        $this->ci->email->set_newline("\r\n");

        $this->ci->email->from('ceresfreshweb@gmail.com', 'Ceresfresh Web');
        $this->ci->email->to($correo_usuario); 
        $this->ci->email->subject($asunto);
        $this->ci->email->message($html);
        // Set to, from, message, etc.
     

        if ($this->ci->email->send()) {


            //respuesta para el usuario en caso de que el correo se envie satisfactoriamente
            $respuesta = true;    
        
            return $respuesta;

        }else{

            //respuesta para el usuario en caso de que el correo no se envie de manera satisfactoria
            $respuesta = false;   
        
            return $respuesta;
        
        }

    }
  }

}
?>