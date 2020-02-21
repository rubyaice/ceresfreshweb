<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Afiliar extends CI_Controller {

  public function __construct()
  {
    parent::__construct();

    $this->load->helper('url');
    $this->load->database();

    //validacion si hay algun usuario registrado
    if (!$this->session->userdata('correo')) {
      redirect('login/login_view');

    }
  }
  
  //--------------------------------------------

  //vista para llamar a afiliar terceros del usuario

  public function vista_afiliar_terceros()
  {


    $query = $this->db->query('SELECT * FROM PLAN_NUTRICIONAL_ACT_FISICA');
    $results_af = $query->result();

    //obtener si existe alguna aptitud especial en el usuario
    $query = $this->db->query('SELECT * FROM PLAN_NUTRICIONAL_CONDICION_ESPECIAL');
    $results_ce = $query->result();
    //obtener los paises
    $query = $this->db->query('SELECT * FROM PAIS');
    $results_pais= $query->result();


    //definicion de variables que se eniaran a la vista para los select de los planes
    $data['actitud_fisica'] = $results_af;
    $data['condicion_especial'] = $results_ce;
    $data['pais'] = $results_pais;



    //obtener momentanamente el numero de registro del usuario para afiliarlo a ese numero de registro
    $correo_usuario = $_SESSION['correo'];

    $consulta_num_registro_usuario = $this->db->query("SELECT num_registro FROM AFILIADOS WHERE correo = '$correo_usuario'");
    $respuesta = $consulta_num_registro_usuario->row();


    $this->session->set_userdata('num_registro', $respuesta->num_registro);


    $this->load->view('headers/header_loged');
		$this->load->view('afiliar_tercero', $data);
    $this->load->view('footer/footer');
  }

  //metodo para poder utilizar la misma direccion del usuario registrado en la parte de afiliacion
  public function usar_direccion_usuario()
  {

    $actividad = $_POST['actividad'];
    
    $correo_usuario = $_SESSION['correo'];
    $num_registro = $_SESSION['num_registro'];

    //consulta para traer los datos de direccion del usuaro registrado
    $consulta_direccion_usuario = $this->db->query("SELECT CI.ciudad, CI.id_ciudad, AF.address, ES.estado, ES.id_estado, AF.zipcode, SE.sector, SE.id, PA.pais, PA.id_pais FROM AFILIADOS AF INNER JOIN PAIS PA ON AF.pais = PA.id_pais INNER JOIN CIUDADES CI ON AF.city = CI.id_ciudad INNER JOIN ESTADOS ES ON AF.state = ES.id_estado INNER JOIN SECTORES SE ON AF.sector = SE.id WHERE correo = '$correo_usuario'");
    $respuesa_direccion_usuario = $consulta_direccion_usuario->row();

    //descripcion de datos de direccion del usuario
    $cuidad = $respuesa_direccion_usuario->ciudad;
    $direccion = $respuesa_direccion_usuario->address;
    $estado = $respuesa_direccion_usuario->estado;
    $zipcode = $respuesa_direccion_usuario->zipcode;
    $sector = $respuesa_direccion_usuario->sector;
    $pais = $respuesa_direccion_usuario->pais;

    //ids de cada uno de los campos a rellenar
    $id_cuidad = $respuesa_direccion_usuario->id_ciudad;
    $id_estado = $respuesa_direccion_usuario->id_estado;
    $id_sector = $respuesa_direccion_usuario->id;
    $id_pais = $respuesa_direccion_usuario->id_pais;

    //validacion de si esta llegando algo de direccion
    if ($respuesa_direccion_usuario == null) {
      
      $respuesta = 1;
      $response = array(

        'cuidad' => $cuidad,
        'direccion' => $direccion,
        'estado' => $estado,
        'zipcode' => $zipcode,
        'sector' => $sector,
        'pais' => $pais,
        'id_cuidad' => $id_cuidad,
        'id_estado' => $id_estado,
        'id_sector' => $id_sector,
        'id_pais' => $id_pais,
        'respuesta' => $respuesta

      );

      echo json_encode($response);
      return;

    } else {
     
      //respuesta que se envia al AJAX
      $respuesta = 2;
      $response = array(

        'cuidad' => $cuidad,
        'direccion' => $direccion,
        'estado' => $estado,
        'zipcode' => $zipcode,
        'sector' => $sector,
        'pais' => $pais,
        'id_cuidad' => $id_cuidad,
        'id_estado' => $id_estado,
        'id_sector' => $id_sector,
        'id_pais' => $id_pais,
        'respuesta' => $respuesta

      );

      echo json_encode($response);

    }

  }
}
