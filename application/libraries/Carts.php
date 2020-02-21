<?php
    class Carts{
        public $Code;
        public $ProductCode;
        public $CustomerCode;
        public $ListCode;
        public $Quantity;
        public $Type; //1= cart ; 2= WishList; 3= event
        public $Order;
        public $ListName;
        public $Cedula;
        public $Location;
        protected $ci;

        function __construct(){ 
            $this->ci =& get_instance();
        }
 
        function AddToCart(){
           /* $ToReturn = FALSE;
            if(!$this->Exist($this->ProductCode)){
                $this->CartOrder();
                $QueryCART = "insert into CARTS_MA (Code, ProductCode, CustomerCode, Quantity, OrderCode) VALUES ('".$this->Code."','".$this->ProductCode."','".$this->CustomerCode."','".$this->Quantity."','".$this->Order."')";
                $CART = GetRecordset($QueryCART);
                if($CART){
                    $ToReturn = TRUE;
                }
            }else{
                if($this->UpdateQuantity()){
                    $ToReturn = TRUE;
                }
            }
            return $ToReturn;*/
        }




      
        function ProductsQuantity(){
            /*$ToReturn = 0;
            $Query = "select SUM(QUANTITY) AS QUANTITY from CARTS_MA where CustomerCode = '".$this->CustomerCode."' AND TYPE='".$this->Type."'";
            $Recordset = GetRecordset($Query);
            if($Recordset != FALSE){
                if(trim($Recordset->Fields["QUANTITY"]->value) != ""){
                    $ToReturn = $Recordset->Fields["QUANTITY"]->value;
                }
            }
            return $ToReturn;*/
        }
       
        function CartOrder(){
            /*$Query = "select ORDERCODE FROM CARTS_MA where CustomerCode = '".$this->CustomerCode."' AND TYPE='".$this->Type."' GROUP BY ORDERCODE";
            $Recordset = GetRecordset($Query);
            if($Recordset != FALSE){
                if(trim($Recordset->Fields["ORDERCODE"]->value) != ""){
                    $this->Order = $Recordset->Fields["ORDERCODE"]->value;
                }else{
                    $this->Order = GetCorrelative("ORDERS",TRUE);
                }
            }else{
                $this->Order = GetCorrelative("ORDERS",TRUE);
            }*/
        }

        function DropProductFromCart($ListCode = ""){
          /*  $ToReturn = FALSE;
            $Where = "";
            if($ListCode != ""){
                $Where = " AND LISTCODE = '".$ListCode."'";
            }
            //$this->CartOrder();
            $QueryCART = "DELETE FROM CARTS_MA WHERE CustomerCode = '".$this->CustomerCode."' AND ProductCode='".$this->ProductCode."' AND TYPE='".$this->Type."' ".$Where;
            $CART = GetRecordset($QueryCART);
            if($CART){
                $ToReturn = TRUE;
            }
            return $ToReturn;*/
        }

        function DropProductCart($ListCode = ""){
          /*  $ToReturn = FALSE;
            $Where = "";
            if($ListCode != ""){
                $Where = " AND LISTCODE = '".$ListCode."'";
            }
            
            $QueryCART = "DELETE FROM CARTS_MA WHERE CustomerCode = '".$this->CustomerCode."' AND ProductCode='".$this->ProductCode."' AND TYPE='".$this->Type."' ".$Where;
            $cmd=new COM("ADODB.command"); 
            $Connection = $GLOBALS['conexion'];
            $cmd->ActiveConnection = $Connection;
            $cmd->CommandText= $Query;
            $cmd->Execute();

           $Recordset = GetRecordset($Query,FALSE,$cmd);
            if($Recordset != FALSE){
                $ToReturn = TRUE;
            }
            return $ToReturn;*/
        }
        function DropCart($num_registro){
            $ToReturn = FALSE;               

            $this->ci->db->where('num_registro', $num_registro);
            
            if($this->ci->db->delete('CARRITO')){
                $ToReturn = TRUE;
            }
            return $ToReturn;
        }


        function InsertStatusToNotification($num_registro,$tipo_notification,$correo){
            $data_notificaciones = array(
                'num_registro'=>$num_registro,
                'correo' => $correo,
                'tipo' => $tipo_notification
          
              );
          
            $ToReturn = FALSE;
            return $this->ci->db->insert('NOTIFICACIONES', $data_notificaciones);
        
        }
        function UpdateQuantity(){
           /* $ToReturn = FALSE;
            $this->CartOrder();
            $QueryCART = "UPDATE CARTS_MA SET Quantity = '".$this->Quantity."' WHERE CustomerCode = '".$this->CustomerCode."' AND ProductCode='".$this->ProductCode."' AND TYPE='".$this->Type."'";
            $CART = GetRecordset($QueryCART);
            if($CART){
                $ToReturn = TRUE;
            }
            return $ToReturn;*/
        }
        function UpdateProductQuantity(){
            /*$ToReturn = FALSE;
            //$this->CartOrder();
            $QueryCART = "UPDATE CARTS_MA SET Quantity = '".$this->Quantity."' WHERE CustomerCode = '".$this->CustomerCode."' AND ProductCode='".$this->ProductCode."' AND TYPE='".$this->Type."'";
            $CART = GetRecordset($QueryCART);
            if($CART){
                $ToReturn = TRUE;
            }
            return $ToReturn;*/
        }
      
       
       


  
     
      
       
        function GetMontoTotalCompra()
        {
           /* // saco el monto total con oferta y todo de lo que esta en el carrito
            $QueryCART = "SELECT 
            sum(case when (GETDATE() BETWEEN f_inicial AND f_final and convert(time,GETDATE()) BETWEEN convert(time,h_inicial) and convert(time,h_final)) 
            then (n_precioO * ((n_impuesto1/100 + 1)))*Quantity
            ELSE 
                CASE WHEN (MA_DEPOPROD.n_precio>0) THEN
                (MA_DEPOPROD.n_precio * ((n_impuesto1/100 + 1)))*Quantity 
                ELSE
                (N_PRECIO1 * ((n_impuesto1/100 + 1)))*Quantity 
                end 
            end 
            ) as Total
            from CARTS_MA 
            INNER JOIN MA_PRODUCTOS ON MA_PRODUCTOS.C_CODIGO = CARTS_MA.PRODUCTCODE   
            INNER JOIN MA_DEPOPROD ON MA_DEPOPROD.c_codarticulo=CARTS_MA.ProductCode   
            WHERE CARTS_MA.CustomerCode = '" . $this->CustomerCode . "' AND CARTS_MA.TYPE=1 AND C_CODDEPOSITO='" .$_SESSION['DefaultBranch']. "'";

            $Recordset = GetRecordset($QueryCART);
            if ($Recordset) {
                return $Recordset->Fields["Total"]->value;
            }
            return false;*/
        }
   
    

     
        function GetCantsCart()
        {
           /* $ToReturn = 0;

            $Query = "SELECT COUNT(*) AS CANTS_CARTEV FROM CARTS_MA CA
                        INNER JOIN EVENTS_MA EV
                        ON CA.PRODUCTCODE=EV.Code
                        left JOIN MA_PRODUCTOS PD
                        ON PD.C_CODIGO=EV.ProductCode
                        WHERE TYPE=3 AND CA.CUSTOMERCODE=?";

            $cmd=new COM("ADODB.command");
            
            $p1=$cmd->createParameter("ProductCode",200,1,50,$this->CustomerCode);
            $cmd->parameters->append($p1);

            $Connection = $GLOBALS['conexion'];

            $cmd->ActiveConnection = $Connection;
            $cmd->CommandText= $Query;
            $cmd->Execute();

            $Recordset = GetRecordset($Query,FALSE,$cmd);
            if($Recordset != FALSE){
                $ToReturn = $Recordset->Fields["CANTS_CARTEV"]->value;
            }
            return $ToReturn;*/
        }


     
    

        
       

}

?>