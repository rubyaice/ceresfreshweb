<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Afiliar_usuario_model extends CI_Model {

  public function __construct(){

    parent::__construct();
    $this->load->database();

  }

  //metodo para susbrbir a un Ususario en la base de datos, esta suscripcion se hace tanto en al tabla de suscripcion como en la tabla de afiliacion de la base de datos
  public function afiliar_usuario($nombre_reg, $sexo_reg, $estatura_reg, $act_fisica_reg, $apellido_reg, $edad_reg, $peso_reg, $condicion_esp_reg, $pais_reg, $ciudad_reg, $codigopostal_reg, $estado_reg, $telefono_reg, $direccion_reg, $correo_reg,$num_registro,$sector_reg)
  {
    $ToReturn=false;
    $this->load->model('functions_model');
    $id_afiliacion=$this->functions_model->GetCorrelative("NUM_AFILIACION",true);


    //data que se obtiene para poder ingresarla en la tabla de afliliados
    $data_afiliar = array(

      'num_registro' => $num_registro,
      'apellido' => $apellido_reg,
      'nombre' => $nombre_reg,
      'edad' => $edad_reg,
      'sexo' => $sexo_reg,
      'peso' => $peso_reg,
      'estatura' => $estatura_reg,
      'act_fisica' => $act_fisica_reg,
      'condicion_esp' => $condicion_esp_reg,
      'correo' => $correo_reg,
      'address' => $direccion_reg,
      'phone'=>$telefono_reg,
      'city'=>$ciudad_reg,
      'state'=>$estado_reg,
      'zipcode'=>$codigopostal_reg,
      'sector'=>$sector_reg,
      'pais'=>$pais_reg,
      'id_afiliacion'=>$id_afiliacion

    );

    //data para guardar en notificaciones
    $data_notificaciones = array(
      'num_registro' => $num_registro,
      'correo' => $_SESSION['correo'],
      'tipo' => '2'

    );


    //insercion en tabla MA_LOGIN
    $afiliar =$this->db->insert('AFILIADOS', $data_afiliar);
    if($afiliar)
      {
        if($this->db->insert('NOTIFICACIONES', $data_notificaciones)){

          $query = $this->db->query("SELECT TOP(1) AF.nombre, AF.apellido, AF.plan_nut, AF.id_afiliacion, AF.correo, CA.codeorder,  AF.num_registro ,CA.productcode 
          FROM  CARRITO CA INNER JOIN AFILIADOS AF ON CA.correo = AF.correo WHERE AF.num_registro ='$num_registro'");
          $recordset = $query->row();
          
          $data_carrito = array();
            if(!$recordset)
            {
            $this->load->model('functions_model');
            $OrderCode=$this->functions_model->GetCorrelative("ORDER_BOX",true);        
        
            //datos que se guardaran en carrito
            $data_carrito = array(
        
              'correo' => $correo_reg,
              'cantidad' => '1',
              'num_registro' => $num_registro,
              'codeorder' => $OrderCode,
              'productcode'=> '0000000001'// Codigo del único producto que existe Nutribox , en caso de añadir otro cambiar 
        
            );
          
            }
            else {
              $data_carrito = array(
        
                'correo' => $correo_reg,
                'cantidad' => '1',
                'num_registro' => $num_registro,
                'codeorder' => $recordset->codeorder,
                'productcode'=>$recordset->productcode
          
              );

             
            } 

           
          if($this->db->insert('CARRITO', $data_carrito))
          {

            if($this->load->model('proceso_registro_model')){
              $existe2 = $this->db->query("SELECT AF.nombre, AF.apellido,AF.city,AF.pais,AF.phone,AF.phone,AF.state,AF.zipcode,AF.sector, AF.plan_nut, AF.id_afiliacion, AF.correo, AF.num_registro  ,ER.id_proceso 
              FROM   AFILIADOS AF INNER JOIN  ESTATUS_REGISTRO_MA ER ON AF.num_registro = ER.num_registro WHERE AF.num_registro  ='$num_registro'");
              $resultado2 = $existe2->row();
              $proceso=$resultado2->id_proceso; 
              if($proceso<3){
                if($this->proceso_registro_model->actualizar_estatus($num_registro,3)){
                    $ToReturn=true;
                }
              }
            }
          }
       }
    }
    return $ToReturn;
  }

}
