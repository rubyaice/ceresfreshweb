<?php
    class User{
        public $Code;
        public $Email;
        public $Password;
        public $Name; 
        public $Type;
        public $Status;

        function __construct(){ 
            $this->ci =& get_instance();
        }
        

        function GetUser()
        {
            $ToReturn = FALSE;
            $Query = "SELECT * from MA_LOGIN_ADMIN WHERE num_registro = '".$this->Code."'";

            $conexion=$this->ci->db->query($Query);
            $Recordset = $conexion->row();    
            if($Recordset != FALSE){
               
                    $this->Code = $Recordset->num_registro;
                    $this->Name = $Recordset->description;
                    $this->Email = $Recordset->correo;
                    $this->Password = $Recordset->clave;
                    $this->Type=$Recordset->tipo;
                    
                    $ToReturn = TRUE;
                  
                    
            }               
            
            return $ToReturn;
        }

        function NewUser(){
           $ToReturn = FALSE;          
         
           try
             { 
       
             $data = array(
       
             'num_registro' => $this->num_registro,
             'correo' => $this->Email,
             'clave' => $this->Password,
             'nombre_proveedor' =>'Ceresfresh Admin App',
             'tipo' => 1,
             'description' => $this->Name
            
       
           );
       
           //metdo para insertar el registro de pago en la tabla ORDERS_MA
           if($this->ci->db->insert('MA_LOGIN_ADMIN', $data))
           $ToReturn =true;
       
           return  $ToReturn;
           }
           catch(Exception $ex)
           {
               return $ToReturn;
           }

        }
        function UpdateUserData()
        {
            $ToReturn = FALSE;

            $data = array(
       
                'num_registro' => $this->num_registro,
                'correo' => $this->Email,
                'clave' => $this->Password,
                'nombre_proveedor' =>'Ceresfresh Admin App',
                'tipo' => 1,
                'description' => $this->Name
               
          
              );
        
              $this->ci->db->where('num_registro', $this->num_registro);             

            if($this->ci->db->update('MA_LOGIN_ADMIN', $data))
            {
                $ToReturn = TRUE;
            }
            return $ToReturn;
        }
        function DeleteUser(){
            $ToReturn = FALSE;
         //funcion para eliminacion del usuario de la base de datos en la tabla AFILIADOS
            $this->db->where('num_registro', $this->num_registro);
            
            if($this->db->delete('MA_LOGIN_ADMIN')){
                $ToReturn = TRUE;   
            }
            return $ToReturn;
        }
     
        function EmailEnUso(){
           /* $ToReturn = FALSE;
            $Query = "SELECT Code FROM USERS_MA WHERE EMAIL = ?";
            
            $cmd=new COM("ADODB.command");
            $p1=$cmd->createParameter("EMAIL",200,1,200,$this->Email);
            $cmd->parameters->append($p1);

            $Connection = $GLOBALS['conexion'];

            $cmd->ActiveConnection = $Connection;
            $cmd->CommandText= $Query;
            $cmd->Execute();
            $Recordset = GetRecordset($Query,false,$cmd);
            if($Recordset != FALSE){
                $ToReturn = TRUE;
            }
            return $ToReturn;*/
        }        

        function UpdatePassword(){
            /*$ToReturn = FALSE;
            $Query = "UPDATE USERS_MA SET Password = ? WHERE Code = ?";

            $cmd=new COM("ADODB.command");
            $p1=$cmd->createParameter("password",200,1,200,$this->Password);
            $cmd->parameters->append($p1);
            $p2=$cmd->createParameter("Code",200,1,200,$this->Code);
            $cmd->parameters->append($p2);

            $Connection = $GLOBALS['conexion'];

            $cmd->ActiveConnection = $Connection;
            $cmd->CommandText= $Query;
            $cmd->Execute();

            $Recordset = GetRecordset($Query,FALSE,$cmd);
            if($Recordset != false)
            {
                $ToReturn = TRUE;
            }
            return $ToReturn;*/
        }

        function getUserByEmail(){
            /*$ToReturn = FALSE;
            $Query = "SELECT * FROM USERS_MA WHERE EMAIL = ?";

            $ToReturn=false;

            $cmd=new COM("ADODB.command");
            $p1=$cmd->createParameter("EMAIL",200,1,200,$this->Email);
            $cmd->parameters->append($p1);

            $Connection = $GLOBALS['conexion'];

            $cmd->ActiveConnection = $Connection;
            $cmd->CommandText= $Query;
            $cmd->Execute();
            try
            {
            $Recordset = GetRecordset($Query,false,$cmd);
                if($Recordset != FALSE)
                {
                    $this->Code = $Recordset->Fields["Code"]->value;
                    $this->Name = $Recordset->Fields["Description"]->value;
                    $this->Email = $Recordset->Fields["Email"]->value;
                    $this->Password = $Recordset->Fields["Password"]->value;
                    $this->Status=$Recordset->Fields["Status"]->value;
                    $this->Type=$Recordset->Fields["Type"]->value;
                    $ToReturn = true;
                }
            }
            catch(exception $ex)
            {

            }

            return $ToReturn;*/
        }
        function UpdatePasswordLogin(){
           /* $ToReturn = FALSE;
            $QueryCUSTOMERS = "update VENDORS_MA set Password = '".$this->Password."' where Email = '".$this->Email."'";
            $CUSTOMERS = GetRecordset($QueryCUSTOMERS);
            if($CUSTOMERS){
                $ToReturn = TRUE;
            }
            return $ToReturn;*/
        }
        function IsPassword(){
           /* $QueryCUSTOMERS = "select Password from VENDORS_MA where Code = '".$_SESSION['CustomerCode']."'";
            $CUSTOMERS = GetRecordset($QueryCUSTOMERS);
            $this->Password = $CUSTOMERS->Fields["Password"]->value;
            if($CUSTOMERS){
                return true;
            }
            return false;*/
        }

        function GetUsers($pa,$Texto){
            $ToReturn = FALSE;
            $Query = "";
           if($Texto==null)
            {
                $Query="SELECT top(50) * FROM MA_LOGIN_ADMIN";
            }
            else
            {
                $Query="SELECT top(50) * FROM MA_LOGIN_ADMIN WHERE DESCRIPTION LIKE %'".$Texto."'%";
            }
           
            $conexion=$this->ci->db->query($Query);
            $Recordset = $conexion->result();  
        
            if($Recordset != FALSE){
                $ToReturn = $Recordset;
            }

            return $ToReturn;
        }

    }
?>