<?php
    class Customers{
        public $CodeRegistro;
        public $CodeAfiliado;
        public $Name;
        public $Lastname;
        public $Email;
        public $Password;
        public $Phone;
        public $Cedula;
        public $Sexo;
        public $Address;
        public $City;
        public $State;
        public $Sector;
        public $ZipCode;
        public $ReceivePromos;
        public $DefaultBranch;
        public $Hash;
        
        function __construct(){ 
            $this->ci =& get_instance();
        }
        function GetCustomer(){
            $ToReturn = FALSE;
        
            //consulta de datos del afiliado para referencia del usuario al momento de actualizar sus datos
            $Query="SELECT af.num_registro,af.correo, af.phone, af.id_afiliacion, af.apellido, af.nombre, af.edad, af.sexo, af.peso, af.estatura,pna.descripcion as act_fisica, pnc.descripcion as condicion_esp, pa.pais, es.estado, ciu.ciudad, sec.Sector, af.address, af.zipcode FROM AFILIADOS af INNER JOIN PAIS pa ON af.pais = pa.id_pais INNER JOIN ESTADOS es ON af.state = es.id_estado INNER JOIN CIUDADES ciu ON af.city = id_ciudad INNER JOIN SECTORES sec ON af.sector = sec.id INNER JOIN PLAN_NUTRICIONAL_ACT_FISICA pna ON af.act_fisica = pna.act_fisica INNER JOIN PLAN_NUTRICIONAL_CONDICION_ESPECIAL pnc ON af.condicion_esp = pnc.condicion_esp WHERE af.id_afiliacion ='".$this->CodeAfiliado."'";
            $consulta_datos_afiliado = $this->ci->db->query($Query);
            $respuesta_datos_afiliado = $consulta_datos_afiliado->row();
           
            if($respuesta_datos_afiliado != FALSE){




                //datos enviados a la vista para referencia del usuario
                
                    $this->CodeRegistro = $respuesta_datos_afiliado->num_registro;
                   
                    $this->Name =  $respuesta_datos_afiliado->nombre;
                    $this->Lastname =  $respuesta_datos_afiliado->apellido;
                    $this->Email =  $respuesta_datos_afiliado->correo;
                    $this->Sexo =  $respuesta_datos_afiliado->sexo;
                    //$this->Password = $Recordset->Fields["Password"]->value;
                    $this->Phone =  $respuesta_datos_afiliado->phone;
                   // $this->Cedula = $Recordset->Fields["Cedula"]->value;
                    $this->Address =  $respuesta_datos_afiliado->address;
                    $this->City = $respuesta_datos_afiliado->ciudad;
                    $this->State =$respuesta_datos_afiliado->estado;
                    $this->Sector =$respuesta_datos_afiliado->Sector;
                    $this->ZipCode = $respuesta_datos_afiliado->zipcode;
               
                
                $ToReturn = TRUE;
            }
            return $ToReturn;
        }
       
       
        
      
      
      
    }
?>