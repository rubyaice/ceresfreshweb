<?php
    class Cards{

        public $Code;
        public $CustomerCode;
        public $Name;
        public $Lastname;
        public $CardNumber;
        public $Cedula;
        public $Month;
        public $Year;
        protected $ci;

        function __construct(){ 
            
            $this->ci =& get_instance();

        }

        function GetCard(){
            $ToReturn = "";
           /* $Query = "SELECT * FROM CARDS_MA WHERE CODE='".$this->Code."' AND CUSTOMERCODE='".$this->CustomerCode."'";
            $Recordset = GetRecordset($Query);
            if($Recordset != FALSE){
                while(!$Recordset->EOF){
                    $this->Code = $Recordset->Fields["Code"]->value;
                    $this->CustomerCode = $Recordset->Fields["CustomerCode"]->value;
                    $this->Name = $Recordset->Fields["Name"]->value;
                    $this->Lastname = $Recordset->Fields["Lastname"]->value;
                    $this->CardNumber = $Recordset->Fields["CardNumber"]->value;
                    $this->Cedula = $Recordset->Fields["Cedula"]->value;
                    $this->Month = $Recordset->Fields["Month"]->value;
                    $this->Year = $Recordset->Fields["Year"]->value;
                    $Recordset->MoveNext();
                }
            }
            return $ToReturn;*/
        }
        function CardsList(){
            $ToReturn = FALSE;
            
            return $ToReturn;
        }
        function NewCard(){
                       
            $ToReturn = FALSE;
            try
              { 
        
              $data_pago = array(
        
              'num_registro' => $this->CustomerCode,
              'Code' => $this->Code,
              'Name' => $this->Name,
              'Lastname' =>$this->Lastname,
              'CardNumber' => $this->CardNumber,
              'Cedula' => $this->Cedula,
              'Month' => $this->Month,
              'Year'=>$this->Year
        
            );
        
            //metdo para insertar el registro de pago en la tabla ORDERS_MA
            if($this->ci->db->insert('CARDS_MA', $data_pago))
            $ToReturn =true;
        
            return  $ToReturn;
            }
            catch(Exception $ex)
            {
                return $ToReturn;
            }
        }
        function UpdateCard(){
            $ToReturn = FALSE;
          
            return $ToReturn;
        }
        function DeleteCard(){
            $ToReturn = FALSE;          
            return $ToReturn;
        }
        function CardsExist(){
            $ToReturn = FALSE;
            $Query = "SELECT Month FROM CARDS_MA WHERE CardNumber='".$this->CardNumber."'";
            $Recordset = GetRecordset($Query);
            if($Recordset != FALSE){
                $ToReturn = $Recordset;
            }
            return $ToReturn;
        }

    }
?>