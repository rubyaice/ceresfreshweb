<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Afiliados_usuario_model extends CI_Model {

  public function __construct(){

    parent::__construct();
    $this->load->database();

  }

  //metodo para eliminar a un Afiliado en la base de datos, esta eliminacion se hara en la tabla de afiliados de la base de datos
  public function eliminar_afiliado_consulta($id_afiliacion, $correo_del_afiliado)
  {

    //funcion para eliminacion del usuario de la base de datos en la tabla AFILIADOS
    $this->db->where('id_afiliacion', $id_afiliacion);
    $this->db->delete('AFILIADOS');

    //Metodo para eliminar del carrito de compras al afiliado eliminado cosa de evitar erroes de coincidencia de identidades en el carrido de compras
    $this->db->where('correo', $correo_del_afiliado);
    $this->db->delete('CARRITO');


  }

  //metodo modelo que permite la actualizacion de los usuarios afiliados del suscritor
  public function actualizar_afiliado_consulta($id_afiliado, $nombre_perfil, $apellido_perfil, $edad, $peso, $estatura, $act_fisica, $condicion_esp, $phone, $pais_reg, $ciudad_reg, $codigopostal_reg, $estado_reg, $direccion_reg, $sector_reg)
  {

    //datos que se enviaran para ser actualizados
    $data_actualizacion_afiliado = array(

      'apellido' => $apellido_perfil,
      'nombre' => $nombre_perfil,
      'edad' => $edad,
      'peso' => $peso,
      'estatura' => $estatura,
      'act_fisica' => $act_fisica,
      'condicion_esp' => $condicion_esp,
      'phone' => $phone, 
      'pais' => $pais_reg,
      'city' => $ciudad_reg,
      'state' => $estado_reg,
      'sector' => $sector_reg,
      'address' => $direccion_reg,
      'zipcode' => $codigopostal_reg

    );

    $this->db->where('id_afiliacion', $id_afiliado);
    $this->db->update('AFILIADOS', $data_actualizacion_afiliado);

  }

}
