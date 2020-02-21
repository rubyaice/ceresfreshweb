<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Carrito extends CI_Controller{

  public function __construct()
  {
    parent::__construct();

    $this->load->helper('url');
    $this->load->database();
  }

  //ver las notificaiones del usuario si el usuario a iniciado sesion y tiene un correo en sesion
  function index()
  {

    $num_registro = $_SESSION['num_registro'];
    $correo_usuario = $_SESSION['correo'];

    $consulta_carrito = $this->db->query("SELECT AF.nombre, AF.apellido,AF.address,AF.city,AF.sexo,AF.edad,AF.pais,AF.phone,AF.phone,AF.state,AF.zipcode,AF.sector, AF.plan_nut, AF.id_afiliacion, AF.correo, CA.codeorder,CA.cantidad , AF.num_registro ,CA.productcode ,(PN.precio *MP.n_precio_m) AS precio,(PN.precio *MP.n_precio_m*CA.cantidad) AS monto,ER.id_proceso, CA.id, CA.correo AS corre_car 
    FROM  CARRITO CA INNER JOIN AFILIADOS AF ON CA.correo = AF.correo INNER JOIN MA_PRODUCTOS MP ON MP.C_CODIGO=CA.productcode INNER JOIN ESTATUS_REGISTRO_MA ER ON CA.num_registro = ER.num_registro INNER JOIN PLAN_NUTRICIONAL PN ON AF.plan_nut = PN.id_plan WHERE AF.num_registro  = '$num_registro' ORDER BY CA.codeorder  DESC");

    $respuesta_carrito_ciclo = $consulta_carrito->result();

    $html = '';

    $base_url = base_url('img/Ceres/box.png');

    if ($respuesta_carrito_ciclo == null) {

      $html .= '<div class="row"><div class="col-1"> <i style="color:green;" class="material-icons">remove_shopping_cart</i></div> <div class="col-11"> No tienes encargos de Nutri<span style="color:#7DBE41">boxs &nbsp;</div></div>';

      $response = array( 'cajas' => $html );

      echo json_encode($response);

      return true;
    }
    $total=0;
    foreach ($respuesta_carrito_ciclo as $result) {

      $consulta_pago_tr = $this->db->query("SELECT * FROM PAGO_TR WHERE correo = '$correo_usuario'");
      $respuesta_pago_tr = $consulta_pago_tr->result();

      if ($respuesta_pago_tr == null) {
        
        $html .= '
        <div class="row">

          <div class="col-2">
            <img class="img-fluid cajaCarritoM" stye="max-width: 100%; height: auto;" src="'.$base_url.'">
          </div>

          <div class="col-6">
            &nbsp;'.$result->nombre.'&nbsp;'.$result->apellido.'&nbsp;<b><br> Cantidad :'.$result->cantidad.'&nbsp;</b>
          </div>
          <div class="col-2">
             <br><br>Bs. '.number_format($result->monto, 2, '.',',').'
          </div>
        </div>
        <hr>';

      } else {
        
        $html .= '
        <div class="row">

          <div class="col-2">
            <img class="img-fluid cajaCarritoM" stye="max-width: 100%; height: auto;" src="'.$base_url.'">
          </div>

          <div class="col-6">
            &nbsp;'.$result->nombre.'&nbsp;'.$result->apellido.'&nbsp;<b><br> Cantidad :'.$result->cantidad.'&nbsp;</b>
          </div>
          <div class="col-2">
             <br><br>Bs. '.number_format($result->monto, 2, '.',',').'
          </div>
          <div class="col-1">
            <a href="#" onclick="eliminarCaja('.$result->id.')"><i style="color:red;" class="material-icons">cancel</i></a>
          </div>
        </div>
        <hr>';

      }
        
        $total += $result->monto;

    }

    $html .= '
    <br>
    <div class="row">
      <div class="col-8"> &nbsp;<b>TOTAL :</b>&nbsp;</div>
      
    <div class="col-4">
      <b>Bs. '.number_format($total, 2, '.',',').'</b>
    </div>
    <br>
    <hr>';
    
    $response = array( 'cajas' => $html );

    echo json_encode($response);

  }

  //metodo para eliminar del carito segun rspuesta del AJAX
  public function eliminar_del_carrito()
  {

    //respuesa de de lo que esta legado del AJAX segun el usuario desee
    $id_item = $_POST['id'];
    $interaccion = $_POST['interaccion'];

    $this->db->where('id', $id_item);
    $this->db->delete('CARRITO');

    //condicionales segun la respuesta de query
      
      $respuesta = 1;

      $response = array(

        'respuesta' => $respuesta

      );

      echo json_encode($response);

  }

}
