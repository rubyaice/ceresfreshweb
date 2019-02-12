<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Afiliados_usuario_model extends CI_Model {

  public function __construct(){

    parent::__construct();
    $this->load->database();

  }

  //metodo para eliminar a un Afiliado en la base de datos, esta eliminacion se hara en la tabla de afiliados de la base de datos
  public function eliminar_afiliado_consulta($id_afiliacion)
  {

    //funcion para eliminacion del usuario de la base de datos en la tabla AFILIADOS
    $this->db->where('id_afiliacion', $id_afiliacion);
    $this->db->delete('AFILIADOS');
  }

  //metodo para actualiar los datos del afiliado en caso de cambiar al afiliado o de modificar un dato erroneo que se haya ingresado
  public function actualizar_afiliado_consulta($id_afiliacion, $correo, $nombre, $apellido, $edad, $sexo, $peso, $estatura, $act_fisica, $condicion_esp)
  {

    $data_actualizar = array(

      'correo' => $correo,
      'apellido' => $apellido,
      'nombre' => $nombre,
      'edad' => $edad,
      'sexo' => $sexo,
      'peso' => $peso,
      'estatura' => $estatura,
      'act_fisica' => $act_fisica,
      'condicion_esp' => $condicion_esp

    );

    $this->db->set($data_actualizar);
    $this->db->where('id_afiliacion', $id_afiliacion);
    $this->db->update('AFILIADOS');

  }

}
