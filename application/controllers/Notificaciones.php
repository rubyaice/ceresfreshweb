<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Notificaciones extends CI_Controller{

  public function __construct()
  {
    parent::__construct();

    $this->load->helper('url');
    $this->load->database();
  }

  //ver las notificaiones del usuario si el usuario a iniciado sesion y tiene un correo en sesion
  function index()
  {

    $correo_usuario = $_SESSION['correo'];

    $consulta_notificaicones = $this->db->query("SELECT TOP 3 TN.descripcion, NOTI.fecha_notificacion FROM NOTIFICACIONES NOTI INNER JOIN TIPO_NOTIFICACIONES TN ON NOTI.tipo = TN.id_notificacion WHERE correo = '$correo_usuario' ORDER BY fecha_notificacion DESC");

    $respuesta_notificaicones_ciclo = $consulta_notificaicones->result();

    $html = '';
    $img_url = base_url('img/Ceres/CERES_Icon.png');

    if ($respuesta_notificaicones_ciclo == null) {

      $html .= '<div class="row"><div class="col-1"><i style="color:green;" class="material-icons">data_usage</i></div> <div class="col-11">No tiene notificaciones&nbsp;</div></div>';

      $response = array( 'notificaciones' => $html );

      echo json_encode($response);

      return;
    }

    foreach ($respuesta_notificaicones_ciclo as $result) {

        $html .= '<div class="row">
                    <div class="col-2">
                      <img class="img-fluid img-notifi" style="max-width: 60%; height: auto;" src="'.$img_url.'">
                    </div> 
                    <div style="line-height: 70%;" class="col-10 noti-movil">
                      <p><b>Notificación Cerefresh</b></p>
                      <p>'.$result->descripcion.'</p>
                    </div>
                  </div>
                  <hr>';

    }


    $response = array( 'notificaciones' => $html );

    echo json_encode($response);

  }

  //metodo para alidar la exitencia de notificaiones segun el usuario registrado y en session
  public function ver_notificaciones()
  {
    
    $correo_usuario = $_SESSION['correo'];

    $consulta_existen_notificaciones = $this->db->query("SELECT * FROM NOTIFICACIONES WHERE correo = '$correo_usuario' AND estatus = '1'");
    $respuesa_existe_notificaciones = $consulta_existen_notificaciones->row();

    $respuesta_html = 0;

    //respuesta enviada al ajax segun la consulta de existencia de notificaciones del usuario
    if ($respuesa_existe_notificaciones == null) {
      
      //la rspuesta se mantiene en 0 ya que no exiten notificaiones pendientes para el usuario 
      $respuesta_html = 0;

      $response = array(

        'respuesta' => $respuesta_html

      );

      echo json_encode($response);
      
    }else{

      //la respuesta pasa a 1 ya que el usuario tiene alguna notificacion pendiente por ver
      $respuesta_html = 1;

      $response = array(

        'respuesta' => $respuesta_html

      );

      echo json_encode($response);

    }

  }

  //metodo para que esaparzca la alerta de las noificaciones al abrirlas
  public function act_vista_notficaciones()
  {
    
    $correo_usuario = $_SESSION['correo'];

    $data_update_notifi = array(

      'estatus' => 0

    );

    $this->db->where('correo', $correo_usuario);
    $update_notifi = $this->db->update('NOTIFICACIONES', $data_update_notifi);

    $respuesta_html = 0;

    //respuesta enviada al ajax segun la consulta de existencia de notificaciones del usuario
    if ($update_notifi) {

      //la respuesta pasa a 1 ya que el usuario tiene alguna notificacion pendiente por ver
      $respuesta_html = 1;

      $response = array(

        'respuesta' => $respuesta_html

      );

      echo json_encode($response);
      
    }else{

      //la rspuesta se mantiene en 0 ya que no exiten notificaiones pendientes para el usuario 
      $respuesta_html = 0;

      $response = array(

        'respuesta' => $respuesta_html

      );

      echo json_encode($response);

    }

  }

  //metodo para cargar vista de area de notificaciones
  public function notificaciones_view()
  {
    
    //carga de vista de notificaciones
    $this->load->view('headers/header_loged');
    $this->load->view('notificaciones_area');
    $this->load->view('footer/footer');

  }

  //metodo para carga las notificaciones del usuario
  public function cargar_notificaciones()
  {
    $correo_usuario = $_SESSION['correo'];
    
    //traer notificaciones (consulta)
    $consulta_notificaciones = $this->db->query("SELECT TN.descripcion, NOTI.fecha_notificacion FROM NOTIFICACIONES NOTI INNER JOIN TIPO_NOTIFICACIONES TN ON NOTI.tipo = TN.id_notificacion WHERE correo = '$correo_usuario' ORDER BY fecha_notificacion DESC");
    $respuesta_notificaciones = $consulta_notificaciones->result();

    //declaracion de variables vacia de notificacions
    $html_notificaciones = '<div>';

    //declaracion de ruta de imagen de notificacines
    $img_url = base_url('img/Ceres/CERES_Icon.png');

    if ($respuesta_notificaciones != null) {
      
      foreach ($respuesta_notificaciones as $result) {
        
        $html_notificaciones .= '<div class="card text-center">
          <div class="card-header">
            <img class="img-fluid img-notifi-area" style="max-width: 6%; height: auto;" src="'.$img_url.'">
          </div>
          <div class="card-body">
              <h5 class="card-title"><b>Ceresfresh</b></h5>
              <p class="card-text">'.$result->descripcion.'.</p>
          </div>
          <div class="card-footer text-muted">
              '.$result->fecha_notificacion.'
          </div>
        </div>
        <br>';

      }

      $html_notificaciones .= '</div>';

      //respuesta en html para el archivo de vista
      $response = array(

        'respues_notifi_html' => $html_notificaciones

      );

      echo json_encode($response);

    } else {
      
      $html_notificaciones = '<div class="text-center">
          <p>No tiene noticicaciones.</p>
      </div>';

      //respuesta en html para el archivo de vista
      $response = array(

        'respues_notifi_html' => $html_notificaciones

      );

      echo json_encode($response);

    }

  } 

}
