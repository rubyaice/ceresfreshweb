<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Misgustos extends CI_Controller {

  public function __construct()
  {
    parent::__construct();

    $this->load->helper('url');
    $this->load->database();

    //validacion si el usuario esa registrado
    if (!$this->session->userdata('correo')) {
      redirect('login/login_view');
    }
  }

  //primera ejecucion de esta secccion, en este caso deja elegir los gustos de los usuario que esten registrados en el sistema
	public function index()
	{

    $correo_usuario = $_SESSION['correo'];

    //CONSULTA PARA TRAER EL PLAN NUTRICINAL DEL USUARIO SEGUN SU SESSION INICIADA.
    $consulta_plan_nutricional_usuario = $this->db->query("SELECT plan_nut, id_afiliacion, correo FROM AFILIADOS WHERE correo = '$correo_usuario'");

    $respuesta_plan_nutricional_usuario = $consulta_plan_nutricional_usuario->row();

    $plan_nut_usuario = $respuesta_plan_nutricional_usuario->plan_nut;


    //CONSULTA PARA TRAER LOS ALIMENTO DEL USUARIO SEGUN SU PLAN NUTRICIONAL Y SEGUN EL TPO DE ALIMENTO (Lácteos).
    $consulta_alimentos_usuario_lacteos = $this->db->query("SELECT a.cod_alimento, a.tipo_alimento,  
		(select g.estatus from MA_GUSTOS as G where g.cod_alimento = a.cod_alimento and g.correo='$correo_usuario'
		) as estatus,

		(select g.correo from MA_GUSTOS as G where g.cod_alimento = a.cod_alimento and g.correo='$correo_usuario'
		) as correo,

		(select g.descripcion from MA_ALIMENTOS as G where g.cod_alimento = a.cod_alimento
		) as descripcion

		from MA_ALIMENTOS as a inner join PLAN_NUTRICIONAL_ALIMENTOS pn on pn.cod_alimento = a.cod_alimento
  where a.tipo_alimento='1' and pn.id_plan = '$plan_nut_usuario'");

    $respuesta_alimentos_usuario_lacteos = $consulta_alimentos_usuario_lacteos->result();

    //CONSULTA PARA TRAER LOS ALIMENTO DEL USUARIO SEGUN SU PLAN NUTRICIONAL Y SEGUN EL TPO DE ALIMENTO (Vegetales).
    $consulta_alimentos_usuario_vegetales = $this->db->query("SELECT a.cod_alimento, a.tipo_alimento,  
		(select g.estatus from MA_GUSTOS as G where g.cod_alimento = a.cod_alimento and g.correo='$correo_usuario'
		) as estatus,

		(select g.correo from MA_GUSTOS as G where g.cod_alimento = a.cod_alimento and g.correo='$correo_usuario'
		) as correo,

		(select g.descripcion from MA_ALIMENTOS as G where g.cod_alimento = a.cod_alimento
		) as descripcion

		from MA_ALIMENTOS as a inner join PLAN_NUTRICIONAL_ALIMENTOS pn on pn.cod_alimento = a.cod_alimento
  where a.tipo_alimento='2' and pn.id_plan = '$plan_nut_usuario'");

    $respuesta_alimentos_usuario_vegetales = $consulta_alimentos_usuario_vegetales->result();

    //CONSULTA PARA TRAER LOS ALIMENTO DEL USUARIO SEGUN SU PLAN NUTRICIONAL Y SEGUN EL TPO DE ALIMENTO (Frutas).
    $consulta_alimentos_usuario_frutas = $this->db->query("SELECT a.cod_alimento, a.tipo_alimento,  
		(select g.estatus from MA_GUSTOS as G where g.cod_alimento = a.cod_alimento and g.correo='$correo_usuario'
		) as estatus,

		(select g.correo from MA_GUSTOS as G where g.cod_alimento = a.cod_alimento and g.correo='$correo_usuario'
		) as correo,

		(select g.descripcion from MA_ALIMENTOS as G where g.cod_alimento = a.cod_alimento
		) as descripcion

		from MA_ALIMENTOS as a inner join PLAN_NUTRICIONAL_ALIMENTOS pn on pn.cod_alimento = a.cod_alimento
  where a.tipo_alimento='3' and pn.id_plan = '$plan_nut_usuario'");

    $respuesta_alimentos_usuario_frutas = $consulta_alimentos_usuario_frutas->result();

    //CONSULTA PARA TRAER LOS ALIMENTO DEL USUARIO SEGUN SU PLAN NUTRICIONAL Y SEGUN EL TPO DE ALIMENTO (Almidones o Carbohidratos).
    $consulta_alimentos_usuario_carbohidratos = $this->db->query("SELECT a.cod_alimento, a.tipo_alimento,  
		(select g.estatus from MA_GUSTOS as G where g.cod_alimento = a.cod_alimento and g.correo='$correo_usuario'
		) as estatus,

		(select g.correo from MA_GUSTOS as G where g.cod_alimento = a.cod_alimento and g.correo='$correo_usuario'
		) as correo,

		(select g.descripcion from MA_ALIMENTOS as G where g.cod_alimento = a.cod_alimento
		) as descripcion

		from MA_ALIMENTOS as a inner join PLAN_NUTRICIONAL_ALIMENTOS pn on pn.cod_alimento = a.cod_alimento
  where a.tipo_alimento='4' and pn.id_plan = '$plan_nut_usuario'");

    $respuesta_alimentos_usuario_carbohidratos = $consulta_alimentos_usuario_carbohidratos->result();

    //CONSULTA PARA TRAER LOS ALIMENTO DEL USUARIO SEGUN SU PLAN NUTRICIONAL Y SEGUN EL TPO DE ALIMENTO (Carnícos o Proteínas).
    $consulta_alimentos_usuario_proteinas = $this->db->query("SELECT a.cod_alimento, a.tipo_alimento,  
		(select g.estatus from MA_GUSTOS as G where g.cod_alimento = a.cod_alimento and g.correo='$correo_usuario'
		) as estatus,

		(select g.correo from MA_GUSTOS as G where g.cod_alimento = a.cod_alimento and g.correo='$correo_usuario'
		) as correo,

		(select g.descripcion from MA_ALIMENTOS as G where g.cod_alimento = a.cod_alimento
		) as descripcion

		from MA_ALIMENTOS as a inner join PLAN_NUTRICIONAL_ALIMENTOS pn on pn.cod_alimento = a.cod_alimento
  where a.tipo_alimento='5' and pn.id_plan = '$plan_nut_usuario'");

    $respuesta_alimentos_usuario_proteinas = $consulta_alimentos_usuario_proteinas->result();

    //CONSULTA PARA TRAER LOS ALIMENTO DEL USUARIO SEGUN SU PLAN NUTRICIONAL Y SEGUN EL TPO DE ALIMENTO (Grasas).
    $consulta_alimentos_usuario_grasas = $this->db->query("SELECT a.cod_alimento, a.tipo_alimento,  
		(select g.estatus from MA_GUSTOS as G where g.cod_alimento = a.cod_alimento and g.correo='$correo_usuario'
		) as estatus,

		(select g.correo from MA_GUSTOS as G where g.cod_alimento = a.cod_alimento and g.correo='$correo_usuario'
		) as correo,

		(select g.descripcion from MA_ALIMENTOS as G where g.cod_alimento = a.cod_alimento
		) as descripcion

		from MA_ALIMENTOS as a inner join PLAN_NUTRICIONAL_ALIMENTOS pn on pn.cod_alimento = a.cod_alimento
  where a.tipo_alimento='6' and pn.id_plan = '$plan_nut_usuario'");

    $respuesta_alimentos_usuario_grasas = $consulta_alimentos_usuario_grasas->result();


    //DATOS A ENVIAR A LA VISTA DE LA PLICACION
    $data['alimentos_usuario_lacteos'] = $respuesta_alimentos_usuario_lacteos;

    $data['alimentos_usuario_vegetales'] = $respuesta_alimentos_usuario_vegetales;

    $data['alimentos_usuario_frutas'] = $respuesta_alimentos_usuario_frutas;

    $data['alimentos_usuario_carbohidratos'] = $respuesta_alimentos_usuario_carbohidratos;

    $data['alimentos_usuario_proteinas'] = $respuesta_alimentos_usuario_proteinas;

    $data['alimentos_usuario_grasas'] = $respuesta_alimentos_usuario_grasas;


    //CARGA DE VISTA EN APLICACION
    $this->load->view('headers/header_loged');
    $this->load->view('misgustos', $data);
    $this->load->view('footer/footer');

  }

  //metodo para guardar en mis gustos para el usuario registado
  public function guardar_gusto_usuario()
  {

    $activacion = $_POST['activacion'];
    
    //correo de usuario en session
    $correo_usuario = $_SESSION['correo'];

    //consulta para obtener el id_afiliacion del usuario registrado
    $consulta_id_afiliacion_usuario = $this->db->query("SELECT id_afiliacion, num_registro FROM AFILIADOS WHERE correo = '$correo_usuario'");
    $resuesta_id_afiliacion_usuario = $consulta_id_afiliacion_usuario->row_array();

    //id del usuario registrado
    $id_afiliacion = $resuesta_id_afiliacion_usuario['id_afiliacion'];
    $num_registro =  $resuesta_id_afiliacion_usuario['num_registro'];
    //----------------------------------------------

    //consulta de validacion de si exite el registro en a base de datos

    $consulta_existe_gusto = $this->db->query("SELECT * FROM MA_GUSTOS WHERE correo = '$correo_usuario'");
    $respuesta_existe_gusto = $consulta_existe_gusto->result();

    if ($respuesta_existe_gusto == null) {
      
      //datos que se van a insertar en primera instancia cosa de solo hacer un update con los checks de la lista de alimentos

      $data_gusto_usuario = array(

        'correo' => $correo_usuario,
        'id_afiliacion' => $id_afiliacion,
        'num_registro' => $num_registro

      );

      //condicional para guardar en base de datos en la tabla de mis gustos para el usuario registrado
      if ($this->db->insert("MA_GUSTOS", $data_gusto_usuario)) {
        
        //respuesta en caso de que todo haya salido bien y no haya errores
        $respesta = 1;
        $response = array(

          'respuesta' => $respesta

        );

        echo json_encode($response);

      }else{

        //respuesta en caso de que el proceso no se haya completado y haya un error
        $respesta = 2;
        $response = array(

          'respuesta' => $respesta

        );

        echo json_encode($response);

      }

    }else{

      //respuesta en caso de que el usuario ya se encuentre en el area de mis gustos
      $respesta = 0;
      $response = array(

        'respuesta' => $respesta

      );

      echo json_encode($response);

    }

  }

  //guardar gusto el usuario, aqui se guarda el alimento que el usauro no quiere que este activo en sus comidas.
  public function agregar_gusto_usuario()
  {
    
    //selecion del usuario que en este caso puede ser 0 o 1, el 1 es que esta activo y visible el usuario quiere que este alimento aparezca y sea parte de su comida, 0 significa que el usuario no quiere este alimento en su comida.
    $seleccionado = $_POST['seleccionado'];
    $cod_alimento = $_POST['cod_alimento'];

    //datos del usuario que esta en sesion
    $correo_usuario = $_SESSION['correo'];

    //CONSULTA PARA TRAER EL PLAN NUTRICINAL DEL USUARIO SEGUN SU SESSION INICIADA.
    $consulta_datos_usuario = $this->db->query("SELECT plan_nut, id_afiliacion, correo, num_registro FROM AFILIADOS WHERE correo = '$correo_usuario'");

    $respuesta_datos_usuario = $consulta_datos_usuario->row();

    $id_afiliacion = $respuesta_datos_usuario->id_afiliacion;
    $num_registro = $respuesta_datos_usuario->num_registro;

    //------------------------------------------------

    //consulta para validar que el usaurio existe en mis gustos.
    $consulta_existe_en_misgustos = $this->db->query("SELECT * FROM MA_GUSTOS WHERE id_afiliacion = '$id_afiliacion'");
    $respuesta_existe_en_misgustos = $consulta_existe_en_misgustos->row();

    //esto en cas de que el usuario no exita
    if ($respuesta_existe_en_misgustos == null) {
      
      $data_guarar_usaurio = array(

        'correo' => $correo_usuario,
        'id_afiliacion' => $id_afiliacion,
        'cod_alimento' => $cod_alimento,
        'estatus' => $seleccionado,
        'num_registro' => $num_registro

      );

      if ($this->db->insert("MA_GUSTOS", $data_guarar_usaurio)) {
        
        //respuesta en caso de que el usuario no exista en misgustos y se guarde el usuario y el gusto que esa llegando, esto es en forma de precaucion por si acaso ¬¬
        $respesta = 0;
        $response = array(

          'respuesta' => $respesta

        );

        echo json_encode($response);
      }

    }else{

      //esto en caso e que el usuario exista, validamos si esta el alimnto ya entre sus gustos
      $consulta_exite_cod_alimento = $this->db->query("SELECT * FROM MA_GUSTOS WHERE cod_alimento = '$cod_alimento' AND correo = '$correo_usuario'");
      $respuesta_existe_cod_alimento = $consulta_exite_cod_alimento->row();

      //en caso de que el alimento no xista entre sus gustos
      if ($respuesta_existe_cod_alimento == null) {
        
        $data_guardar_alimento = array(

          'correo' => $correo_usuario,
          'id_afiliacion' => $id_afiliacion,
          'cod_alimento' => $cod_alimento,
          'estatus' => $seleccionado,
          'num_registro' => $num_registro

        );

        if ($this->db->insert("MA_GUSTOS", $data_guardar_alimento)) {
        
          //respuesta en caso de que el alimento no exista entre los gustos del usuario, este se agregara justo con la seleccion que haya hecho el usuario de el .
          $respesta = 1;
          $response = array(
  
            'respuesta' => $respesta
  
          );
  
          echo json_encode($response);
        }

      }else{

        //en caso de que el alimento existe en sus gustos, esto es para modificar el estatus de si va a ser visible o no al usuario este alimento.
        
        $query_estatus_alimento = $this->db->simple_query("UPDATE MA_GUSTOS SET estatus = '$seleccionado' WHERE correo = '$correo_usuario' AND id_afiliacion = '$id_afiliacion' AND cod_alimento = '$cod_alimento'");

        if ($query_estatus_alimento) {
          
          //respuesta en caso de que el alimento haya sido modificado exitosamente y ya retorna la respuesta positiva al usuario
          $respesta = 2;
          $response = array(
  
            'respuesta' => $respesta
  
          );
  
          echo json_encode($response);

        }

      }

    }

  }

  //metodo que permit elegir los gustos de los usuarios afiliados del usuario
  public function mis_gustos_afiliado($id_afiliacion)
  {

    //validacion momentanea de si existe un parametro entrante o no
    if (!isset($id_afiliacion)) {

      redirect('afiliadoscontrol', 'refresh');

    }

    $id_afiliacion = base64_decode($id_afiliacion);

    //consulta para obtener el orreo del usuario afiliado
    $consulta_correo_afiliado_usuario = $this->db->query("SELECT correo FROM AFILIADOS WHERE id_afiliacion = '$id_afiliacion'");
    $resuesta_correo_afiliado_usuario = $consulta_correo_afiliado_usuario->row_array();

    //correo del usuario afiliado
    $correo_afiliacion = $resuesta_correo_afiliado_usuario['correo'];

    //CONSULTA PARA TRAER EL PLAN NUTRICINAL DEL USUARIO SEGUN SU SESSION INICIADA.
    $consulta_plan_nutricional_usuario = $this->db->query("SELECT plan_nut, id_afiliacion, correo FROM AFILIADOS WHERE id_afiliacion = '$id_afiliacion'");

    $respuesta_plan_nutricional_usuario = $consulta_plan_nutricional_usuario->row();

    $plan_nut_usuario = $respuesta_plan_nutricional_usuario->plan_nut;


    //CONSULTA PARA TRAER LOS ALIMENTO DEL USUARIO SEGUN SU PLAN NUTRICIONAL Y SEGUN EL TPO DE ALIMENTO (Lácteos).
    $consulta_alimentos_usuario_lacteos = $this->db->query("SELECT a.cod_alimento, a.tipo_alimento,  
		(select g.estatus from MA_GUSTOS as G where g.cod_alimento = a.cod_alimento and g.correo='$correo_afiliacion'
		) as estatus,

		(select g.correo from MA_GUSTOS as G where g.cod_alimento = a.cod_alimento and g.correo='$correo_afiliacion'
		) as correo,

		(select g.descripcion from MA_ALIMENTOS as G where g.cod_alimento = a.cod_alimento
		) as descripcion

		from MA_ALIMENTOS as a inner join PLAN_NUTRICIONAL_ALIMENTOS pn on pn.cod_alimento = a.cod_alimento
  where a.tipo_alimento='1' and pn.id_plan = '$plan_nut_usuario'");

    $respuesta_alimentos_usuario_lacteos = $consulta_alimentos_usuario_lacteos->result();

    //CONSULTA PARA TRAER LOS ALIMENTO DEL USUARIO SEGUN SU PLAN NUTRICIONAL Y SEGUN EL TPO DE ALIMENTO (Vegetales).
    $consulta_alimentos_usuario_vegetales = $this->db->query("SELECT a.cod_alimento, a.tipo_alimento,  
		(select g.estatus from MA_GUSTOS as G where g.cod_alimento = a.cod_alimento and g.correo='$correo_afiliacion'
		) as estatus,

		(select g.correo from MA_GUSTOS as G where g.cod_alimento = a.cod_alimento and g.correo='$correo_afiliacion'
		) as correo,

		(select g.descripcion from MA_ALIMENTOS as G where g.cod_alimento = a.cod_alimento
		) as descripcion

		from MA_ALIMENTOS as a inner join PLAN_NUTRICIONAL_ALIMENTOS pn on pn.cod_alimento = a.cod_alimento
  where a.tipo_alimento='2' and pn.id_plan = '$plan_nut_usuario'");

    $respuesta_alimentos_usuario_vegetales = $consulta_alimentos_usuario_vegetales->result();

    //CONSULTA PARA TRAER LOS ALIMENTO DEL USUARIO SEGUN SU PLAN NUTRICIONAL Y SEGUN EL TPO DE ALIMENTO (Frutas).
    $consulta_alimentos_usuario_frutas = $this->db->query("SELECT a.cod_alimento, a.tipo_alimento,  
		(select g.estatus from MA_GUSTOS as G where g.cod_alimento = a.cod_alimento and g.correo='$correo_afiliacion'
		) as estatus,

		(select g.correo from MA_GUSTOS as G where g.cod_alimento = a.cod_alimento and g.correo='$correo_afiliacion'
		) as correo,

		(select g.descripcion from MA_ALIMENTOS as G where g.cod_alimento = a.cod_alimento
		) as descripcion

		from MA_ALIMENTOS as a inner join PLAN_NUTRICIONAL_ALIMENTOS pn on pn.cod_alimento = a.cod_alimento
  where a.tipo_alimento='3' and pn.id_plan = '$plan_nut_usuario'");

    $respuesta_alimentos_usuario_frutas = $consulta_alimentos_usuario_frutas->result();

    //CONSULTA PARA TRAER LOS ALIMENTO DEL USUARIO SEGUN SU PLAN NUTRICIONAL Y SEGUN EL TPO DE ALIMENTO (Almidones o Carbohidratos).
    $consulta_alimentos_usuario_carbohidratos = $this->db->query("SELECT a.cod_alimento, a.tipo_alimento,  
		(select g.estatus from MA_GUSTOS as G where g.cod_alimento = a.cod_alimento and g.correo='$correo_afiliacion'
		) as estatus,

		(select g.correo from MA_GUSTOS as G where g.cod_alimento = a.cod_alimento and g.correo='$correo_afiliacion'
		) as correo,

		(select g.descripcion from MA_ALIMENTOS as G where g.cod_alimento = a.cod_alimento
		) as descripcion

		from MA_ALIMENTOS as a inner join PLAN_NUTRICIONAL_ALIMENTOS pn on pn.cod_alimento = a.cod_alimento
  where a.tipo_alimento='4' and pn.id_plan = '$plan_nut_usuario'");

    $respuesta_alimentos_usuario_carbohidratos = $consulta_alimentos_usuario_carbohidratos->result();

    //CONSULTA PARA TRAER LOS ALIMENTO DEL USUARIO SEGUN SU PLAN NUTRICIONAL Y SEGUN EL TPO DE ALIMENTO (Carnícos o Proteínas).
    $consulta_alimentos_usuario_proteinas = $this->db->query("SELECT a.cod_alimento, a.tipo_alimento,  
		(select g.estatus from MA_GUSTOS as G where g.cod_alimento = a.cod_alimento and g.correo='$correo_afiliacion'
		) as estatus,

		(select g.correo from MA_GUSTOS as G where g.cod_alimento = a.cod_alimento and g.correo='$correo_afiliacion'
		) as correo,

		(select g.descripcion from MA_ALIMENTOS as G where g.cod_alimento = a.cod_alimento
		) as descripcion

		from MA_ALIMENTOS as a inner join PLAN_NUTRICIONAL_ALIMENTOS pn on pn.cod_alimento = a.cod_alimento
  where a.tipo_alimento='5' and pn.id_plan = '$plan_nut_usuario'");

    $respuesta_alimentos_usuario_proteinas = $consulta_alimentos_usuario_proteinas->result();

    //CONSULTA PARA TRAER LOS ALIMENTO DEL USUARIO SEGUN SU PLAN NUTRICIONAL Y SEGUN EL TPO DE ALIMENTO (Grasas).
    $consulta_alimentos_usuario_grasas = $this->db->query("SELECT a.cod_alimento, a.tipo_alimento,  
		(select g.estatus from MA_GUSTOS as G where g.cod_alimento = a.cod_alimento and g.correo='$correo_afiliacion'
		) as estatus,

		(select g.correo from MA_GUSTOS as G where g.cod_alimento = a.cod_alimento and g.correo='$correo_afiliacion'
		) as correo,

		(select g.descripcion from MA_ALIMENTOS as G where g.cod_alimento = a.cod_alimento
		) as descripcion

		from MA_ALIMENTOS as a inner join PLAN_NUTRICIONAL_ALIMENTOS pn on pn.cod_alimento = a.cod_alimento
  where a.tipo_alimento='6' and pn.id_plan = '$plan_nut_usuario'");

    $respuesta_alimentos_usuario_grasas = $consulta_alimentos_usuario_grasas->result();


    //DATOS A ENVIAR A LA VISTA DE LA PLICACION
    $data['alimentos_usuario_lacteos'] = $respuesta_alimentos_usuario_lacteos;

    $data['alimentos_usuario_vegetales'] = $respuesta_alimentos_usuario_vegetales;

    $data['alimentos_usuario_frutas'] = $respuesta_alimentos_usuario_frutas;

    $data['alimentos_usuario_carbohidratos'] = $respuesta_alimentos_usuario_carbohidratos;

    $data['alimentos_usuario_proteinas'] = $respuesta_alimentos_usuario_proteinas;

    $data['alimentos_usuario_grasas'] = $respuesta_alimentos_usuario_grasas;

    //envio de id del afiliado a la vista de mis gustos
    $data['id_afiliacion'] = $id_afiliacion;
    
    //CARGA DE VISTA EN APLICACION
    $this->load->view('headers/header_loged');
    $this->load->view('misgustos_afiliado', $data);
    $this->load->view('footer/footer');

  }

  //metodo para guardar en mis gustos para el usuario afiliado del usuario registrado
  public function guardar_gusto_afiliado()
  {

    //respuesta que llega desde el AJAXs
    $activacion = $_POST['activacion'];
    
    //correo de usuario en session
    $id_afiliacion = $_POST['id_afiliacion'];

    //consulta para obtener el orreo del usuario afiliado
    $consulta_correo_afiliado_usuario = $this->db->query("SELECT correo FROM AFILIADOS WHERE id_afiliacion = '$id_afiliacion'");
    $resuesta_correo_afiliado_usuario = $consulta_correo_afiliado_usuario->row_array();

    //correo del usuario afiliado
    $correo_afiliacion = $resuesta_correo_afiliado_usuario['correo'];

    //----------------------------------------------

    //consulta de validacion de si exite el registro en a base de datos

    $consulta_existe_gusto = $this->db->query("SELECT * FROM MA_GUSTOS WHERE correo = '$correo_afiliacion'");
    $respuesta_existe_gusto = $consulta_existe_gusto->result();

    if ($respuesta_existe_gusto == null) {
      
      //datos que se van a insertar en primera instancia cosa de solo hacer un update con los checks de la lista de alimentos

      $data_gusto_usuario = array(

        'correo' => $correo_afiliacion,
        'id_afiliacion' => $id_afiliacion

      );

      //condicional para guardar en base de datos en la tabla de mis gustos para el usuario registrado
      if ($this->db->insert("MA_GUSTOS", $data_gusto_usuario)) {
        
        //respuesta en caso de que todo haya salido bien y no haya errores
        $respesta = 1;
        $response = array(

          'respuesta' => $respesta

        );

        echo json_encode($response);

      }else{

        //respuesta en caso de que el proceso no se haya completado y haya un error
        $respesta = 2;
        $response = array(

          'respuesta' => $respesta

        );

        echo json_encode($response);

      }

    }else{

      //respuesta en caso de que el usuario ya se encuentre en el area de mis gustos
      $respesta = 0;
      $response = array(

        'respuesta' => $respesta

      );

      echo json_encode($response);

    }

  }

  //guardar gusto el usuario, aqui se guarda el alimento que el usauro no quiere que este activo en sus comidas.
  public function agregar_gusto_afiliado()
  {
    
    //selecion del usuario que en este caso puede ser 0 o 1, el 1 es que esta activo y visible el usuario quiere que este alimento aparezca y sea parte de su comida, 0 significa que el usuario no quiere este alimento en su comida.
    $id_afiliacion = $_POST['id_afiliacion'];
    $seleccionado = $_POST['seleccionado'];
    $cod_alimento = $_POST['cod_alimento'];

    //CONSULTA PARA TRAER EL PLAN NUTRICINAL DEL USUARIO SEGUN SU SESSION INICIADA.
    $consulta_datos_usuario = $this->db->query("SELECT plan_nut, id_afiliacion, correo, num_registro FROM AFILIADOS WHERE id_afiliacion = '$id_afiliacion'");

    $respuesta_datos_usuario = $consulta_datos_usuario->row();

    $correo_afiliado = $respuesta_datos_usuario->correo;
    $num_registro = $respuesta_datos_usuario->num_registro;

    //------------------------------------------------

    //consulta para validar que el usaurio existe en mis gustos.
    $consulta_existe_en_misgustos = $this->db->query("SELECT * FROM MA_GUSTOS WHERE id_afiliacion = '$id_afiliacion'");
    $respuesta_existe_en_misgustos = $consulta_existe_en_misgustos->row();

    //esto en cas de que el usuario no exita
    if ($respuesta_existe_en_misgustos == null) {
      
      $data_guarar_usaurio = array(

        'correo' => $correo_afiliado,
        'id_afiliacion' => $id_afiliacion,
        'cod_alimento' => $cod_alimento,
        'estatus' => $seleccionado,
        'num_registro' => $num_registro

      );

      if ($this->db->insert("MA_GUSTOS", $data_guarar_usaurio)) {
        
        //respuesta en caso de que el usuario no exista en misgustos y se guarde el usuario y el gusto que esa llegando, esto es en forma de precaucion por si acaso ¬¬
        $respesta = 0;
        $response = array(

          'respuesta' => $respesta

        );

        echo json_encode($response);
      }

    }else{

      //esto en caso e que el usuario exista, validamos si esta el alimnto ya entre sus gustos
      $consulta_exite_cod_alimento = $this->db->query("SELECT * FROM MA_GUSTOS WHERE cod_alimento = '$cod_alimento' AND correo = '$correo_afiliado'");
      $respuesta_existe_cod_alimento = $consulta_exite_cod_alimento->row();

      //en caso de que el alimento no xista entre sus gustos
      if ($respuesta_existe_cod_alimento == null) {
        
        $data_guardar_alimento = array(

          'correo' => $correo_afiliado,
          'id_afiliacion' => $id_afiliacion,
          'cod_alimento' => $cod_alimento,
          'estatus' => $seleccionado,
          'num_registro' => $num_registro

        );

        if ($this->db->insert("MA_GUSTOS", $data_guardar_alimento)) {
        
          //respuesta en caso de que el alimento no exista entre los gustos del usuario, este se agregara justo con la seleccion que haya hecho el usuario de el .
          $respesta = 1;
          $response = array(
  
            'respuesta' => $respesta
  
          );
  
          echo json_encode($response);
        }

      }else{

        //en caso de que el alimento existe en sus gustos, esto es para modificar el estatus de si va a ser visible o no al usuario este alimento.
        
        $query_estatus_alimento = $this->db->simple_query("UPDATE MA_GUSTOS SET estatus = '$seleccionado' WHERE correo = '$correo_afiliado' AND id_afiliacion = '$id_afiliacion' AND cod_alimento = '$cod_alimento'");

        if ($query_estatus_alimento) {
          
          //respuesta en caso de que el alimento haya sido modificado exitosamente y ya retorna la respuesta positiva al usuario
          $respesta = 2;
          $response = array(
  
            'respuesta' => $respesta
  
          );
  
          echo json_encode($response);

        }

      }

    }

  }


}