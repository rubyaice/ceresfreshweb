<?php
    class Orders{
        
        public $Code;
        public $CustomerCode;
        public $Observation;
        
        public $DeliveryMethod;

        public $PickupStoreCode;
        public $PickupPersonName;
        public $PickupPersonLastname;
        public $PickupPersonPhone;
        public $PickupPersonEmail;
        public $PickupPersonCedula;
        public $DateDeliveryIni;
        public $DateDeliveryFin;

        public $PaymentMethod;

        public $PaymentRefNum;////////   Referencia del Pago
        public $TdcPaymentId;/////       ID Transacción(Integración con Instapago)

        public $PaymentCDCPersonName;
        public $PaymentCDCNumber;
        public $PaymentCDCPersonLastname;
        public $PaymentCDCPersonTipoCedula;
        public $PaymentCDCPersonCedula;
        public $PaymentCDCExpirationMonth;
        public $PaymentCDCExpirationYear;

        public $CodigoErrorInstapago;       //ACA SE AGREGO PARA MANEJAR LOS ERRORES QUE DEVUELVE INSTAPAGOS
        public $DescripcionErrorInstapago;  //ACA SE AGREGO PARA MANEJAR LOS ERRORES QUE DEVUELVE INSTAPAGOS

        public $Total;
        public $Subtotal;
        public $Tax;
        public $StoreCode;
        public $ProductCode;
        public $Price;
        public $Quantity;
        public $Paid;

        function __construct(){
            $this->ci =& get_instance();
        }

        function GetOrder(){

            $Query = "SELECT  convert(varchar,convert(decimal(25,2),total)) as Total, num_registro AS CustomerCode,id_afiliacion  FROM PAGO_MA WHERE codeorden='".$this->Code."'";
            $conexion=$this->ci->db->query($Query);
            $Recordset = $conexion->row();    
                $this->Total = $Recordset->Total;               
                $this->CustomerCode = $Recordset->id_afiliacion;
                $Query = "SELECT TOP(1) Type, PersonName, PersonLastname, PersonPhone, PersonEmail, PersonCedula ,DateDeliveryIni,DateDeliveryFin FROM ORDERS_DELIVERYMETHOD WHERE Code='".$this->Code."'";
                $conexion=$this->ci->db->query($Query);
                $Recordset = $conexion->row();    
                if($Recordset != FALSE)
                {
                    $this->DeliveryMethod = $Recordset->Type;
                    $this->PickupPersonName = $Recordset->PersonName;
                    $this->PickupPersonLastname = $Recordset->PersonLastname;
                    $this->PickupPersonPhone = $Recordset->PersonPhone;
                    $this->PickupPersonEmail = $Recordset->PersonEmail;
                    $this->PickupPersonCedula = $Recordset->PersonCedula;
                    $this->DateDeliveryIni = $Recordset->DateDeliveryIni;
                    $this->DateDeliveryFin = $Recordset->DateDeliveryFin;
                }

                $Query = "SELECT Type, PersonName, PersonLastname, PersonCedula, Amount,TransactionReference FROM ORDERS_PAYMENTMETHOD WHERE CodeOrden='".$this->Code."'";
                $conexion=$this->ci->db->query($Query);
                $Recordset = $conexion->row();   
                if($Recordset != FALSE)
                {
                    $this->PaymentMethod = $Recordset->Type;
                    $this->PaymentCDCPersonName = $Recordset->PersonName;
                    $this->PaymentCDCPersonLastname = $Recordset->PersonLastname;
                    $this->PaymentCDCPersonCedula = $Recordset->PersonCedula;
                    $this->PaymentCDCNumber = $Recordset->TransactionReference;
                    $this->Total = $Recordset->Amount;
                }

        }
       
        function ordersListCompleteCanceled($Status)
        {
            $ToReturn = FALSE;
           /* $Query = "SELECT top 1 Code FROM ORDERS_MA WHERE CustomerCode='".$this->CustomerCode."' and Status = $Status";

            $Recordset = GetRecordset($Query);
            if($Recordset != FALSE)
            {
                $ToReturn = $Recordset;
            }
            return $ToReturn;*/
        }
        
        function ordersListPending(){
          /*  $ToReturn = FALSE;
            $Query = "SELECT top 1 Code FROM ORDERS_MA WHERE CustomerCode='".$this->CustomerCode."' and Status IN (1,2)";

            $Recordset = GetRecordset($Query);
            if($Recordset != FALSE){
                $ToReturn = $Recordset;
            }
            return $ToReturn;*/
        }
        
        function ordersList(){
           /* $ToReturn = FALSE;
            $Query = "SELECT top 10 ORDERS_MA.Code, CONVERT(NVARCHAR,ORDERS_MA.Date,103), ORDERS_MA.Total, ORDERS_MA_STATUS.Description
                    FROM ORDERS_MA inner join ORDERS_MA_STATUS on ORDERS_MA_STATUS.Code = ORDERS_MA.Status
                    WHERE CustomerCode='".$this->CustomerCode."' AND BUSINESS_CODE='".$_SESSION['BusinessCode']."'  
                    order by Date desc";
            $Recordset = GetRecordset($Query);
            if($Recordset != FALSE){
                $ToReturn = $Recordset;
            }
            return $ToReturn;*/
        }
        
        function ordersCompleteCanceled($Status,$Deste,$Hasta){
          /*  $ToReturn = FALSE;
            $Query = "SELECT ORDERS_MA.Code,CONVERT(NVARCHAR,ORDERS_MA.Date,103), ORDERS_MA.Total, ORDERS_MA_STATUS.Description
                    FROM ORDERS_MA inner join ORDERS_MA_STATUS on ORDERS_MA_STATUS.Code = ORDERS_MA.Status
                    WHERE CustomerCode='".$this->CustomerCode."' and Status = $Status and cast(Date as Date)
                    between  '".$Deste."' and '".$Hasta."' ORDER BY Date desc";

            $Recordset = GetRecordset($Query);
            if($Recordset != FALSE){
                $ToReturn = $Recordset;
            }
            return $ToReturn;*/
        }
        function ordersPending()
        {
         /*   $ToReturn = FALSE;
            $Query = "SELECT ORD.Code,CUST.Lastname,CUST.Name,ORD.Total,ROUND(SUM(Quantity),0) AS CANTIDAD,
                    CONVERT(NVARCHAR,ORD.Date,103)AS DATE ,CUST.Code as CustomerCode,ORDS.SysName AS Status,MS.c_descripcion,OPT.Description AS F_PAGO
                    FROM ORDERS_MA ORD
                    INNER JOIN CUSTOMERS_MA CUST ON ORD.CustomerCode=CUST.Code 
                    INNER JOIN ORDERS_TR TR ON TR.Code=ORD.Code 
                    INNER JOIN ORDERS_MA_STATUS ORDS ON ORDS.Code=ORD.Status
                    INNER JOIN MA_SUCURSALES MS ON MS.C_codigo=ORD.StoreCode           
                    INNER JOIN ORDERS_PAYMENTMETHOD  OP ON OP.Code=ORD.Code
                    INNER JOIN ORDERS_PAYMENTMETHOD_TYPES OPT ON OPT.Code=OP.Type
                    WHERE  
                    ORD.STATUS IN (1,2)
                    GROUP BY ORD.Code,CUST.Lastname,CUST.Name,ORD.Total,ORD.DATE,CUST.Code,ORDS.SysName,MS.c_descripcion,OPT.Description
                    ORDER BY DATE DESC";
            
                $Recordset = GetRecordset($Query);
                if($Recordset != FALSE){
                    $ToReturn = $Recordset;
                }
            return $ToReturn;*/
        }


        function ordersPendingByDate($Deste,$Hasta){
          /* $ToReturn = FALSE;

            $Query = "SELECT ORD.Code,CUST.Lastname,CUST.Name,ORD.Total,ROUND(SUM(Quantity),0) AS CANTIDAD,CONVERT(NVARCHAR,Date,103) AS DATE,ORDS.SysName AS Status FROM ORDERS_MA ORD
            INNER JOIN CUSTOMERS_MA CUST ON ORD.CustomerCode=CUST.Code 
            INNER JOIN ORDERS_TR TR ON TR.Code=ORD.Code 
            INNER JOIN ORDERS_MA_STATUS ORDS ON ORDS.Code=ORD.Status
            WHERE BUSINESS_CODE='".$_SESSION['BusinessCode']."' AND ORD.Date BETWEEN '.$Deste.' AND '".$Hasta."' 
            AND STATUS IN (1,2) 
            GROUP BY ORD.Code,CUST.Lastname,CUST.Name,ORD.Total,DATE,ORDS.SysName
            ORDER BY DATE DESC";

            $Recordset = GetRecordset($Query);
            if($Recordset != FALSE){
                $ToReturn = $Recordset;
            }
            return $ToReturn;*/
        }
   
        
        function orders($Deste,$Hasta){
           /* $ToReturn = FALSE;
            $Query = "SELECT ORDERS_MA.Code, CONVERT(NVARCHAR,ORDERS_MA.Date,103), ORDERS_MA.Total, ORDERS_MA_STATUS.Description
                    FROM ORDERS_MA inner join ORDERS_MA_STATUS on ORDERS_MA_STATUS.Code = ORDERS_MA.Status
                    WHERE CustomerCode='".$this->CustomerCode."' and cast(Date as Date)
                    between  '".$Deste."' and '".$Hasta."' ORDER BY Date desc";

            $Recordset = GetRecordset($Query);
            if($Recordset != FALSE){
                $ToReturn = $Recordset;
            }
            return $ToReturn;*/
        } 
        function CompleteDetallePago(){
           /* $ToReturn = FALSE;
            $Query = "SELECT TOP 1 ORD.Code ,LI.Fecha,  LI.Monto,LI.Reference
                FROM LOG_INSTAPAGO LI left join ORDERS_MA ORD on LI.OrderNumber = ORD.Code
                WHERE ORD.Code='".$this->Code."'";

            $Recordset = GetRecordset($Query);
            if($Recordset != FALSE){
                $ToReturn = $Recordset;
            }
            return $ToReturn;*/
        } 

   
  
                
   
        
        function GetOrderDetails(){
            $ToReturn = FALSE;
            $Query = "SELECT O.productcode as ProductCode, P.C_DESCRI AS Nombre , O.total AS precio, O.total AS monto, O.Tax as IVA,
            O.cantidad as Cantidad, OC.total as Total,O.descripcion AS Observation 
			from PAGO_TR as O 
			inner join MA_PRODUCTOS as P on O.ProductCode = P.C_CODIGO 
			inner join PAGO_MA OC
            on OC.codeorden = O.codeorden 
			where  O.codeorden ='".$this->Code."'";
            $conexion=$this->ci->db->query($Query);
            $Recordset = $conexion->result();   
            if($Recordset != FALSE){
                $ToReturn = $Recordset;
            }
            return $ToReturn;
        }
     
        
        function GetFechaOrder(){
            /*$Query = "select CONVERT(DATETIME,CONVERT(VARCHAR,ORDERS_MA.Date,103),103) as Fecha from ORDERS_MA where Code = '".$this->Code."'";
            $Recordset = GetRecordset($Query);
            if($Recordset != FALSE){
                return $Recordset->Fields["Fecha"]->value;
            }
            return false;*/
        }
        
        function GetOrderDetailsEmail(){
           /* $ToReturn = FALSE;
            $Query = "select O.ProductCode as ProductCode, P.C_DESCRI AS Nombre, O.Price as Precio,  O.Quantity as Cantidad,
                      O.Total as Total, from ORDERS_TR as O inner join MA_PRODUCTOS as P on O.ProductCode = P.C_CODIGO inner join ORDERS_MA OC
                      on OC.Code = O.Code where  O.Code = '".$this->Code."' and OC.Business_Code = '".$_SESSION['BusinessCode']."'";
            $Recordset = GetRecordset($Query);
            if($Recordset != FALSE){
                $ToReturn = $Recordset;
            }
            return $ToReturn;*/
        }

        function CompleteOrden()
        {
          /*  $ToReturn = FALSE;
            $QueryCARDS = "UPDATE ORDERS_MA SET Status= 5 WHERE CODE='".$this->Code."' AND Business_Code='".$_SESSION['BusinessCode']."'";
            $CARDS = GetRecordset($QueryCARDS);
            if($CARDS){
                $ToReturn = TRUE;
            }
            return $ToReturn;*/
        }
        function CancelarOrden()
        {
            /*$ToReturn = FALSE;
            $QueryCARDS = "UPDATE ORDERS_MA SET Status= 3 WHERE CODE='".$this->Code."'";
            $CARDS = GetRecordset($QueryCARDS);
            if($CARDS){
                $ToReturn = TRUE;
            }
            return $ToReturn;*/
        }
        function GetAutorizar(){
            $ToReturn = FALSE;
            $Query = "SELECT PMA.codeorden, PMA.num_registro, AF.id_afiliacion,AF.nombre, AF.apellido,AF.city,AF.pais,AF.phone,AF.state,CONVERT(NVARCHAR,PTR.date,103)  AS date ,ROUND(SUM(PTR.cantidad),0) AS	cantidad,PTR.total,PTR.precio , semana,estatus, AF.correo FROM PAGO_MA PMA INNER JOIN pago_tr PTR ON PMA.codeorden = PTR.codeorden 
            INNER JOIN AFILIADOS AF ON PTR.id_afiliacion = AF.id_afiliacion WHERE PMA.estatus = 5           
            GROUP BY  PMA.num_registro, AF.nombre, AF.apellido,AF.city,AF.pais,AF.phone,AF.phone,AF.state,cantidad, semana,estatus, AF.correo,PTR.total,PTR.precio,PTR.date ,PMA.codeorden,AF.id_afiliacion
            ORDER BY date DESC";

            $conexion=$this->ci->db->query($Query);
            $Recordset = $conexion->result();    
           
                if($Recordset != FALSE){
                    $ToReturn = $Recordset;
                }
            return $ToReturn;
        }
  
        function GetSales(){
            $ToReturn = FALSE;
            $Query = "SELECT PMA.codeorden, PMA.num_registro, AF.id_afiliacion,AF.nombre, AF.apellido,AF.city,AF.pais,AF.phone,AF.state,CONVERT(NVARCHAR,PTR.date,103)  AS date ,ROUND(SUM(PTR.cantidad),0) AS	cantidad,PTR.total,PTR.precio , semana,estatus, AF.correo FROM PAGO_MA PMA INNER JOIN pago_tr PTR ON PMA.codeorden = PTR.codeorden 
            INNER JOIN AFILIADOS AF ON PTR.id_afiliacion = AF.id_afiliacion WHERE PMA.estatus = 3           
            GROUP BY  PMA.num_registro, AF.nombre, AF.apellido,AF.city,AF.pais,AF.phone,AF.phone,AF.state,cantidad, semana,estatus, AF.correo,PTR.total,PTR.precio,PTR.date ,PMA.codeorden,AF.id_afiliacion
            ORDER BY date DESC";

            $conexion=$this->ci->db->query($Query);
            $Recordset = $conexion->result();    
           
                if($Recordset != FALSE){
                    $ToReturn = $Recordset;
                }
            return $ToReturn;
        }
  
        function GetSalesProcesado(){
            $ToReturn = FALSE;
            $Query = "SELECT PMA.codeorden, PMA.num_registro, AF.id_afiliacion,AF.nombre, AF.apellido,AF.city,AF.pais,AF.phone,AF.state,CONVERT(NVARCHAR,PTR.date,103)  AS date ,ROUND(SUM(PTR.cantidad),0) AS	cantidad,PTR.total,PTR.precio , semana,estatus, AF.correo FROM PAGO_MA PMA INNER JOIN pago_tr PTR ON PMA.codeorden = PTR.codeorden 
            INNER JOIN AFILIADOS AF ON PTR.id_afiliacion = AF.id_afiliacion WHERE PMA.estatus = 4           
            GROUP BY  PMA.num_registro, AF.nombre, AF.apellido,AF.city,AF.pais,AF.phone,AF.phone,AF.state,cantidad, semana,estatus, AF.correo,PTR.total,PTR.precio,PTR.date ,PMA.codeorden,AF.id_afiliacion
            ORDER BY date DESC";

            $conexion=$this->ci->db->query($Query);
            $Recordset = $conexion->result();    
           
                if($Recordset != FALSE){
                    $ToReturn = $Recordset;
                }
            return $ToReturn;
        }


        function GetEnviado(){
            $ToReturn = FALSE;
            $Query = "SELECT PMA.codeorden, PMA.num_registro, AF.id_afiliacion,AF.nombre, AF.apellido,AF.city,AF.pais,AF.phone,AF.state,CONVERT(NVARCHAR,PTR.date,103)  AS date ,ROUND(SUM(PTR.cantidad),0) AS	cantidad,PTR.total,PTR.precio , semana,estatus, AF.correo FROM PAGO_MA PMA INNER JOIN pago_tr PTR ON PMA.codeorden = PTR.codeorden 
            INNER JOIN AFILIADOS AF ON PTR.id_afiliacion = AF.id_afiliacion WHERE PMA.estatus = 7 /*7*/           
            GROUP BY  PMA.num_registro, AF.nombre, AF.apellido,AF.city,AF.pais,AF.phone,AF.phone,AF.state,cantidad, semana,estatus, AF.correo,PTR.total,PTR.precio,PTR.date ,PMA.codeorden,AF.id_afiliacion
            ORDER BY date DESC";

            $conexion=$this->ci->db->query($Query);
            $Recordset = $conexion->result();    
           
                if($Recordset != FALSE){
                    $ToReturn = $Recordset;
                }
            return $ToReturn;
        }

        /*function enviados()
        {
            
            $ToReturn = FALSE;
            $Query = "SELECT count(*) FROM PAGO_MA
            where estatus = 8";

            $conexion=$this->ci->db->query($Query);
            $Recordset = $conexion->result();    
           
                if($Recordset != FALSE){
                    $ToReturn = $Recordset;
                }
            return $ToReturn;

        }*/

          
        function GetEntregado(){
            $ToReturn = FALSE;
            $Query = "SELECT PMA.codeorden, PMA.num_registro, AF.id_afiliacion,AF.nombre, AF.apellido,AF.city,AF.pais,AF.phone,AF.state,CONVERT(NVARCHAR,PTR.date,103)  AS date ,ROUND(SUM(PTR.cantidad),0) AS	cantidad,PTR.total,PTR.precio , semana,estatus, AF.correo FROM PAGO_MA PMA INNER JOIN pago_tr PTR ON PMA.codeorden = PTR.codeorden 
            INNER JOIN AFILIADOS AF ON PTR.id_afiliacion = AF.id_afiliacion WHERE PMA.estatus = 8           
            GROUP BY  PMA.num_registro, AF.nombre, AF.apellido,AF.city,AF.pais,AF.phone,AF.phone,AF.state,cantidad, semana,estatus, AF.correo,PTR.total,PTR.precio,PTR.date ,PMA.codeorden,AF.id_afiliacion
            ORDER BY date DESC";

            $conexion=$this->ci->db->query($Query);
            $Recordset = $conexion->result();    
           
                if($Recordset != FALSE){
                    $ToReturn = $Recordset;
                }
            return $ToReturn;
        }

        function GetDevoluciones(){
            $ToReturn = FALSE;
            $Query = "SELECT PMA.codeorden, PMA.num_registro, AF.id_afiliacion,AF.nombre, AF.apellido,AF.city,AF.pais,AF.phone,AF.state,CONVERT(NVARCHAR,PTR.date,103)  AS date ,ROUND(SUM(PTR.cantidad),0) AS	cantidad,PTR.total,PTR.precio , semana,estatus, AF.correo FROM PAGO_MA PMA INNER JOIN pago_tr PTR ON PMA.codeorden = PTR.codeorden 
            INNER JOIN AFILIADOS AF ON PTR.id_afiliacion = AF.id_afiliacion WHERE PMA.estatus = 6          
            GROUP BY  PMA.num_registro, AF.nombre, AF.apellido,AF.city,AF.pais,AF.phone,AF.phone,AF.state,cantidad, semana,estatus, AF.correo,PTR.total,PTR.precio,PTR.date ,PMA.codeorden,AF.id_afiliacion
            ORDER BY date DESC";

            $conexion=$this->ci->db->query($Query);
            $Recordset = $conexion->result();    
           
                if($Recordset != FALSE){
                    $ToReturn = $Recordset;
                }
            return $ToReturn;
        }
 
        function GetPedidosPendientes()
        {
            $ToReturn = FALSE;
            $Query = "SELECT ISNULL(COUNT(*),0) as Cantidad FROM PAGO_MA
            WHERE estatus IN (3)";

            $conexion=$this->ci->db->query($Query);
            $Recordset = $conexion->row();    

                if($Recordset != FALSE){
                    $ToReturn = $Recordset->Cantidad;
                }
            return $ToReturn;
        }


        function GetVentasMes()
        {
            $ToReturn = FALSE;
            $Query = "SELECT ISNULL(count(total),0) as Monto FROM PAGO_MA
            WHERE (estatus=3 or estatus=4 or estatus=7 or estatus=8) and MONTH(GETDATE())=MONTH(DATE) AND YEAR(GETDATE())=YEAR(DATE)";

            $conexion=$this->ci->db->query($Query);
            $Recordset = $conexion->row();    

                if($Recordset != FALSE){
                    $ToReturn = $Recordset->Monto;
                }
            return $ToReturn;
        }

        function GetVentasPorEnviar()
        {
            $ToReturn = FALSE;
            $Query = "SELECT ISNULL(count(total),0) as Monto FROM PAGO_MA
            WHERE (estatus=4) and MONTH(GETDATE())=MONTH(DATE) AND YEAR(GETDATE())=YEAR(DATE)";

            $conexion=$this->ci->db->query($Query);
            $Recordset = $conexion->row();    

                if($Recordset != FALSE){
                    $ToReturn = $Recordset->Monto;
                }
            return $ToReturn;
        }


        function GetDevolucionesMes()
        {
            $ToReturn = FALSE;
            $Query = "SELECT ISNULL(count(total),0) as Monto FROM PAGO_MA
            WHERE estatus=6 and MONTH(GETDATE())=MONTH(DATE) AND YEAR(GETDATE())=YEAR(DATE)";

            $conexion=$this->ci->db->query($Query);
            $Recordset = $conexion->row();    

                if($Recordset != FALSE){
                    $ToReturn = $Recordset->Monto;
                }
            return $ToReturn;
        }

        function GetPedidosMes()
        {
            $ToReturn = FALSE;
            $Query = "SELECT ISNULL(COUNT(*),0) as Cantidad FROM PAGO_MA
            WHERE estatus IN (3) and MONTH(GETDATE())=MONTH(DATE) AND YEAR(GETDATE())=YEAR(DATE)";

            $conexion=$this->ci->db->query($Query);
            $Recordset = $conexion->row();    

                if($Recordset != FALSE){
                    $ToReturn = $Recordset->Cantidad;
                }
            return $ToReturn;
        }

        //motodo apra enviar los pagos pendientes por aprobar
        function GetPedientesPago()
        {
            $ToReturn = FALSE;
            $Query = "SELECT ISNULL(COUNT(*),0) as Cantidad FROM PAGO_MA
            WHERE estatus IN (5) and MONTH(GETDATE())=MONTH(DATE) AND YEAR(GETDATE())=YEAR(DATE)";

            $conexion=$this->ci->db->query($Query);
            $Recordset = $conexion->row();    

                if($Recordset != FALSE){
                    $ToReturn = $Recordset->Cantidad;
                }
            return $ToReturn;
        }

        //motodo apra enviar los pagos pendientes por aprobar
        function GetPedientesPorProcesar()
        {
            $ToReturn = FALSE;
            $Query = "SELECT ISNULL(COUNT(*),0) as Cantidad FROM PAGO_MA
            WHERE estatus IN (3) and MONTH(GETDATE())=MONTH(DATE) AND YEAR(GETDATE())=YEAR(DATE)";

            $conexion=$this->ci->db->query($Query);
            $Recordset = $conexion->row();    

                if($Recordset != FALSE){
                    $ToReturn = $Recordset->Cantidad;
                }
            return $ToReturn;
        }
  

        function ordersReturnsSearch($Date,$Desc)
        {
            $ToReturn = FALSE;

          /*  if($Desc!="" && $Date=="")
            {
                $Query = "SELECT TOP(30) ORD.Code,CUST.Lastname,CUST.Name,ORD.Total,ROUND(SUM(Quantity),0) AS CANTIDAD,
                    CONVERT(NVARCHAR,Date,103)  AS DATE ,CUST.Code as CustomerCode,MS.c_descripcion
                    FROM ORDERS_MA ORD
                    INNER JOIN CUSTOMERS_MA CUST ON ORD.CustomerCode=CUST.Code 
                    INNER JOIN ORDERS_TR TR ON TR.Code=ORD.Code 
                    INNER JOIN MA_SUCURSALES MS ON MS.C_codigo=ORD.StoreCode
                    WHERE  
                    ORD.STATUS = 3 AND (CUST.Lastname LIKE ? OR ORD.Code=?)
                    GROUP BY ORD.Code,CUST.Lastname,CUST.Name,ORD.Total,DATE,CUST.Code,MS.c_descripcion
                    ORDER BY DATE";

                   /* $cmd=new COM("ADODB.command");
                    $p1=$cmd->createParameter("Descrip",200,1,500,"%".$Desc."%");
                    $cmd->parameters->append($p1);
                    $p2=$cmd->createParameter("Descrip",200,1,500,$Desc);
                    $cmd->parameters->append($p2);*/
           /* }
            

            if($Desc=="" && $Date!="")
            {
                $Query = "SELECT TOP(30) ORD.Code,CUST.Lastname,CUST.Name,ORD.Total,ROUND(SUM(Quantity),0) AS CANTIDAD,
                    CONVERT(NVARCHAR,Date,103)  AS DATE ,CUST.Code as CustomerCode,MS.c_descripcion
                    FROM ORDERS_MA ORD
                    INNER JOIN CUSTOMERS_MA CUST ON ORD.CustomerCode=CUST.Code 
                    INNER JOIN ORDERS_TR TR ON TR.Code=ORD.Code 
                    INNER JOIN MA_SUCURSALES MS ON MS.C_codigo=ORD.StoreCode
                    WHERE  
                    ORD.STATUS = 3  AND CAST(ORD.DATE AS DATE) =  CONVERT(NVARCHAR,?,103) 
                    GROUP BY ORD.Code,CUST.Lastname,CUST.Name,ORD.Total,DATE,CUST.Code,MS.c_descripcion
                    ORDER BY DATE DESC";

                   /* $cmd=new COM("ADODB.command");
                    $p2=$cmd->createParameter("Descrip",200,1,500,$Date);
                    $cmd->parameters->append($p2);*/
           /* }


            if($Desc!="" && $Date!="")
            {
                $Query = "SELECT TOP(30) ORD.Code,CUST.Lastname,CUST.Name,ORD.Total,ROUND(SUM(Quantity),0) AS CANTIDAD,
                     CONVERT(NVARCHAR,Date,103)  AS DATE ,CUST.Code as CustomerCode,MS.c_descripcion
                    FROM ORDERS_MA ORD
                    INNER JOIN CUSTOMERS_MA CUST ON ORD.CustomerCode=CUST.Code 
                    INNER JOIN ORDERS_TR TR ON TR.Code=ORD.Code 
                    INNER JOIN MA_SUCURSALES MS ON MS.C_codigo=ORD.StoreCode
                    WHERE  
                    ORD.STATUS = 3 AND CAST(ORD.DATE AS DATE) =  CONVERT(NVARCHAR,?,103) ) AND (CUST.Lastname LIKE ? OR ORD.Code=?)
                    GROUP BY ORD.Code,CUST.Lastname,CUST.Name,ORD.Total,DATE,CUST.Code,MS.c_descripcion
                    ORDER BY DATE DESC";

                   /* $cmd=new COM("ADODB.command");
                    $p0=$cmd->createParameter("Descrip",200,1,500,$Date);
                    $cmd->parameters->append($p0);
                    $p1=$cmd->createParameter("Descrip",200,1,500,"%".$Desc."%");
                    $cmd->parameters->append($p1);
                    $p2=$cmd->createParameter("Descrip",200,1,500,$Desc);
                    $cmd->parameters->append($p2);*/
            /*}

                

                $Connection = $GLOBALS['conexion'];

                $cmd->ActiveConnection = $Connection;
                $cmd->CommandText= $Query;
                $cmd->Execute();

                $Recordset = GetRecordset($Query,FALSE,$cmd);

                //$Recordset = GetRecordset($Query);
                if($Recordset != FALSE){
                    $ToReturn = $Recordset;
                }
            return $ToReturn;*/
        }
       
        function ordersSalesSearch($Date,$Desc)
        {
            $ToReturn = FALSE;

            if($Desc!="" && $Date=="")
            {

                            
                $Query = "SELECT TOP(30) PMA.codeorden,PMA.num_registro,AF.id_afiliacion,AF.nombre, AF.apellido,AF.city,AF.pais,AF.phone,AF.state,CONVERT(NVARCHAR,PTR.date,103)  AS date ,ROUND(SUM(PTR.cantidad),0) AS	cantidad,PTR.total,PTR.precio , semana,estatus, AF.correo FROM PAGO_MA PMA INNER JOIN pago_tr PTR ON PMA.codeorden = PTR.codeorden 
                INNER JOIN AFILIADOS AF ON PMA.num_registro = AF.num_registro 
                WHERE (PMA.estatus = 3) AND (AF.nombre LIKE %".$Desc."%  OR AF.num_registro='".$Desc."' )
                GROUP BY  PMA.num_registro, AF.nombre, AF.apellido,AF.city,AF.pais,AF.phone,AF.phone,AF.state,cantidad, semana,estatus, AF.correo,PTR.total,PTR.precio,PTR.date ,PMA.codeorden,AF.id_afiliacion
                ORDER BY date DESC";

            }

            if($Desc=="" && $Date!="")
            {

                    $Query = "SELECT TOP(30) PMA.codeorden,PMA.num_registro,AF.id_afiliacion,AF.nombre, AF.apellido,AF.city,AF.pais,AF.phone,AF.state,CONVERT(NVARCHAR,PMA.date,103)  AS date ,ROUND(SUM(PTR.cantidad),0) AS	cantidad,PTR.total,PTR.precio , semana,estatus, AF.correo FROM PAGO_MA PMA INNER JOIN pago_tr PTR ON PMA.codeorden = PTR.codeorden 
                    INNER JOIN AFILIADOS AF ON PMA.num_registro = AF.num_registro 
                    WHERE (PMA.estatus = 3) AND CAST(PMA.date AS date) =   CONVERT(DATETIME,CONVERT(VARCHAR,'".$Date."',103),103) 
                    GROUP BY  PMA.num_registro, AF.nombre, AF.apellido,AF.city,AF.pais,AF.phone,AF.phone,AF.state,cantidad, semana,estatus, AF.correo,PTR.total,PTR.precio,PTR.date, PMA.codeorden,PMA.date,AF.id_afiliacion
                    ORDER BY date DESC";

            }


            if($Desc!="" && $Date!="")
            {
              
                    $Query = "SELECT TOP(30) PMA.codeorden, PMA.num_registro,AF.id_afiliacion,AF.nombre, AF.apellido,AF.city,AF.pais,AF.phone,AF.state,CONVERT(NVARCHAR,PMA.date,103)  AS date ,ROUND(SUM(PTR.cantidad),0) AS	cantidad,PTR.total,PTR.precio , semana,estatus, AF.correo FROM PAGO_MA PMA INNER JOIN pago_tr PTR ON PMA.codeorden = PTR.codeorden 
                    INNER JOIN AFILIADOS AF ON PMA.num_registro = AF.num_registro 
                    WHERE (PMA.estatus = 3 ) AND CAST(PMA.date AS DATE) =  CONVERT(DATETIME,CONVERT(VARCHAR,'".$Date."',103),103)  AND (AF.nombre LIKE %".$Desc."%  OR AF.num_registro='".$Desc."' )
                    GROUP BY  PMA.num_registro, AF.nombre, AF.apellido,AF.city,AF.pais,AF.phone,AF.phone,AF.state,cantidad, semana,estatus, AF.correo,PTR.total,PTR.precio,PTR.date ,PMA.codeorden,AF.id_afiliacion
                    ORDER BY date DESC";
            }

            $conexion=$this->ci->db->query($Query);
            $Recordset = $conexion->result();    
           
                if($Recordset != FALSE){
                    $ToReturn = $Recordset;
                }
            return $ToReturn;
        }
        function ordersSalesSearchProcesado($Date,$Desc)
        {
            $ToReturn = FALSE;

            if($Desc!="" && $Date=="")
            {

                            
                $Query = "SELECT TOP(30) PMA.codeorden,PMA.num_registro,AF.id_afiliacion,AF.nombre, AF.apellido,AF.city,AF.pais,AF.phone,AF.state,CONVERT(NVARCHAR,PTR.date,103)  AS date ,ROUND(SUM(PTR.cantidad),0) AS	cantidad,PTR.total,PTR.precio , semana,estatus, AF.correo FROM PAGO_MA PMA INNER JOIN pago_tr PTR ON PMA.codeorden = PTR.codeorden 
                INNER JOIN AFILIADOS AF ON PMA.num_registro = AF.num_registro 
                WHERE (PMA.estatus = 4) AND (AF.nombre LIKE %".$Desc."%  OR AF.num_registro='".$Desc."' )
                GROUP BY  PMA.num_registro, AF.nombre, AF.apellido,AF.city,AF.pais,AF.phone,AF.phone,AF.state,cantidad, semana,estatus, AF.correo,PTR.total,PTR.precio,PTR.date ,PMA.codeorden,AF.id_afiliacion
                ORDER BY date DESC";

            }

            if($Desc=="" && $Date!="")
            {

                    $Query = "SELECT TOP(30) PMA.codeorden,PMA.num_registro,AF.id_afiliacion,AF.nombre, AF.apellido,AF.city,AF.pais,AF.phone,AF.state,CONVERT(NVARCHAR,PMA.date,103)  AS date ,ROUND(SUM(PTR.cantidad),0) AS	cantidad,PTR.total,PTR.precio , semana,estatus, AF.correo FROM PAGO_MA PMA INNER JOIN pago_tr PTR ON PMA.codeorden = PTR.codeorden 
                    INNER JOIN AFILIADOS AF ON PMA.num_registro = AF.num_registro 
                    WHERE (PMA.estatus = 4) AND CAST(PMA.date AS date) =   CONVERT(DATETIME,CONVERT(VARCHAR,'".$Date."',103),103) 
                    GROUP BY  PMA.num_registro, AF.nombre, AF.apellido,AF.city,AF.pais,AF.phone,AF.phone,AF.state,cantidad, semana,estatus, AF.correo,PTR.total,PTR.precio,PTR.date, PMA.codeorden,PMA.date,AF.id_afiliacion
                    ORDER BY date DESC";

            }


            if($Desc!="" && $Date!="")
            {
              
                    $Query = "SELECT TOP(30) PMA.codeorden, PMA.num_registro,AF.id_afiliacion,AF.nombre, AF.apellido,AF.city,AF.pais,AF.phone,AF.state,CONVERT(NVARCHAR,PMA.date,103)  AS date ,ROUND(SUM(PTR.cantidad),0) AS	cantidad,PTR.total,PTR.precio , semana,estatus, AF.correo FROM PAGO_MA PMA INNER JOIN pago_tr PTR ON PMA.codeorden = PTR.codeorden 
                    INNER JOIN AFILIADOS AF ON PMA.num_registro = AF.num_registro 
                    WHERE (PMA.estatus = 4) AND CAST(PMA.date AS DATE) =  CONVERT(DATETIME,CONVERT(VARCHAR,'".$Date."',103),103)  AND (AF.nombre LIKE %".$Desc."%  OR AF.num_registro='".$Desc."' )
                    GROUP BY  PMA.num_registro, AF.nombre, AF.apellido,AF.city,AF.pais,AF.phone,AF.phone,AF.state,cantidad, semana,estatus, AF.correo,PTR.total,PTR.precio,PTR.date ,PMA.codeorden,AF.id_afiliacion
                    ORDER BY date DESC";
            }

            $conexion=$this->ci->db->query($Query);
            $Recordset = $conexion->result();    
           
                if($Recordset != FALSE){
                    $ToReturn = $Recordset;
                }
            return $ToReturn;
        }



        function ordersSalesSearchAutorizar($Date,$Desc)
        {
            $ToReturn = FALSE;

            if($Desc!="" && $Date=="")
            {

                            
                $Query = "SELECT TOP(30) PMA.codeorden,PMA.num_registro,AF.id_afiliacion,AF.nombre, AF.apellido,AF.city,AF.pais,AF.phone,AF.state,CONVERT(NVARCHAR,PTR.date,103)  AS date ,ROUND(SUM(PTR.cantidad),0) AS	cantidad,PTR.total,PTR.precio , semana,estatus, AF.correo FROM PAGO_MA PMA INNER JOIN pago_tr PTR ON PMA.codeorden = PTR.codeorden 
                INNER JOIN AFILIADOS AF ON PMA.num_registro = AF.num_registro 
                WHERE (PMA.estatus = 5) AND (AF.nombre LIKE %".$Desc."%  OR AF.num_registro='".$Desc."' )
                GROUP BY  PMA.num_registro, AF.nombre, AF.apellido,AF.city,AF.pais,AF.phone,AF.phone,AF.state,cantidad, semana,estatus, AF.correo,PTR.total,PTR.precio,PTR.date ,PMA.codeorden,AF.id_afiliacion
                ORDER BY date DESC";

            }

            if($Desc=="" && $Date!="")
            {

                    $Query = "SELECT TOP(30) PMA.codeorden,PMA.num_registro,AF.id_afiliacion,AF.nombre, AF.apellido,AF.city,AF.pais,AF.phone,AF.state,CONVERT(NVARCHAR,PMA.date,103)  AS date ,ROUND(SUM(PTR.cantidad),0) AS	cantidad,PTR.total,PTR.precio , semana,estatus, AF.correo FROM PAGO_MA PMA INNER JOIN pago_tr PTR ON PMA.codeorden = PTR.codeorden 
                    INNER JOIN AFILIADOS AF ON PMA.num_registro = AF.num_registro 
                    WHERE (PMA.estatus = 5) AND CAST(PMA.date AS date) =   CONVERT(DATETIME,CONVERT(VARCHAR,'".$Date."',103),103) 
                    GROUP BY  PMA.num_registro, AF.nombre, AF.apellido,AF.city,AF.pais,AF.phone,AF.phone,AF.state,cantidad, semana,estatus, AF.correo,PTR.total,PTR.precio,PTR.date, PMA.codeorden,PMA.date,AF.id_afiliacion
                    ORDER BY date DESC";

            }


            if($Desc!="" && $Date!="")
            {
              
                    $Query = "SELECT TOP(30) PMA.codeorden, PMA.num_registro,AF.id_afiliacion,AF.nombre, AF.apellido,AF.city,AF.pais,AF.phone,AF.state,CONVERT(NVARCHAR,PMA.date,103)  AS date ,ROUND(SUM(PTR.cantidad),0) AS	cantidad,PTR.total,PTR.precio , semana,estatus, AF.correo FROM PAGO_MA PMA INNER JOIN pago_tr PTR ON PMA.codeorden = PTR.codeorden 
                    INNER JOIN AFILIADOS AF ON PMA.num_registro = AF.num_registro 
                    WHERE (PMA.estatus = 5) AND CAST(PMA.date AS DATE) =  CONVERT(DATETIME,CONVERT(VARCHAR,'".$Date."',103),103)  AND (AF.nombre LIKE %".$Desc."%  OR AF.num_registro='".$Desc."' )
                    GROUP BY  PMA.num_registro, AF.nombre, AF.apellido,AF.city,AF.pais,AF.phone,AF.phone,AF.state,cantidad, semana,estatus, AF.correo,PTR.total,PTR.precio,PTR.date ,PMA.codeorden,AF.id_afiliacion
                    ORDER BY date DESC";
            }

            $conexion=$this->ci->db->query($Query);
            $Recordset = $conexion->result();    
           
                if($Recordset != FALSE){
                    $ToReturn = $Recordset;
                }
            return $ToReturn;
        }
        function ordersSalesSearchEnviado($Date,$Desc)
        {
            $ToReturn = FALSE;

            if($Desc!="" && $Date=="")
            {

                            
                $Query = "SELECT TOP(30) PMA.codeorden,PMA.num_registro,AF.id_afiliacion,AF.nombre, AF.apellido,AF.city,AF.pais,AF.phone,AF.state,CONVERT(NVARCHAR,PTR.date,103)  AS date ,ROUND(SUM(PTR.cantidad),0) AS	cantidad,PTR.total,PTR.precio , semana,estatus, AF.correo FROM PAGO_MA PMA INNER JOIN pago_tr PTR ON PMA.codeorden = PTR.codeorden 
                INNER JOIN AFILIADOS AF ON PMA.num_registro = AF.num_registro 
                WHERE (PMA.estatus = 7) AND (AF.nombre LIKE %".$Desc."%  OR AF.num_registro='".$Desc."' )
                GROUP BY  PMA.num_registro, AF.nombre, AF.apellido,AF.city,AF.pais,AF.phone,AF.phone,AF.state,cantidad, semana,estatus, AF.correo,PTR.total,PTR.precio,PTR.date ,PMA.codeorden,AF.id_afiliacion
                ORDER BY date DESC";

            }

            if($Desc=="" && $Date!="")
            {

                    $Query = "SELECT TOP(30) PMA.codeorden,PMA.num_registro,AF.id_afiliacion,AF.nombre, AF.apellido,AF.city,AF.pais,AF.phone,AF.state,CONVERT(NVARCHAR,PMA.date,103)  AS date ,ROUND(SUM(PTR.cantidad),0) AS	cantidad,PTR.total,PTR.precio , semana,estatus, AF.correo FROM PAGO_MA PMA INNER JOIN pago_tr PTR ON PMA.codeorden = PTR.codeorden 
                    INNER JOIN AFILIADOS AF ON PMA.num_registro = AF.num_registro 
                    WHERE (PMA.estatus = 7) AND CAST(PMA.date AS date) =   CONVERT(DATETIME,CONVERT(VARCHAR,'".$Date."',103),103) 
                    GROUP BY  PMA.num_registro, AF.nombre, AF.apellido,AF.city,AF.pais,AF.phone,AF.phone,AF.state,cantidad, semana,estatus, AF.correo,PTR.total,PTR.precio,PTR.date, PMA.codeorden,PMA.date,AF.id_afiliacion
                    ORDER BY date DESC";

            }


            if($Desc!="" && $Date!="")
            {
              
                    $Query = "SELECT TOP(30) PMA.codeorden, PMA.num_registro,AF.id_afiliacion,AF.nombre, AF.apellido,AF.city,AF.pais,AF.phone,AF.state,CONVERT(NVARCHAR,PMA.date,103)  AS date ,ROUND(SUM(PTR.cantidad),0) AS	cantidad,PTR.total,PTR.precio , semana,estatus, AF.correo FROM PAGO_MA PMA INNER JOIN pago_tr PTR ON PMA.codeorden = PTR.codeorden 
                    INNER JOIN AFILIADOS AF ON PMA.num_registro = AF.num_registro 
                    WHERE (PMA.estatus = 7) AND CAST(PMA.date AS DATE) =  CONVERT(DATETIME,CONVERT(VARCHAR,'".$Date."',103),103)  AND (AF.nombre LIKE %".$Desc."%  OR AF.num_registro='".$Desc."' )
                    GROUP BY  PMA.num_registro, AF.nombre, AF.apellido,AF.city,AF.pais,AF.phone,AF.phone,AF.state,cantidad, semana,estatus, AF.correo,PTR.total,PTR.precio,PTR.date ,PMA.codeorden,AF.id_afiliacion
                    ORDER BY date DESC";
            }

            $conexion=$this->ci->db->query($Query);
            $Recordset = $conexion->result();    
           
                if($Recordset != FALSE){
                    $ToReturn = $Recordset;
                }
            return $ToReturn;
        }

        function ordersSalesSearchEntregado($Date,$Desc)
        {
            $ToReturn = FALSE;

            if($Desc!="" && $Date=="")
            {

                            
                $Query = "SELECT TOP(30) PMA.codeorden,PMA.num_registro,AF.id_afiliacion,AF.nombre, AF.apellido,AF.city,AF.pais,AF.phone,AF.state,CONVERT(NVARCHAR,PTR.date,103)  AS date ,ROUND(SUM(PTR.cantidad),0) AS	cantidad,PTR.total,PTR.precio , semana,estatus, AF.correo FROM PAGO_MA PMA INNER JOIN pago_tr PTR ON PMA.codeorden = PTR.codeorden 
                INNER JOIN AFILIADOS AF ON PMA.num_registro = AF.num_registro 
                WHERE (PMA.estatus = 8) AND (AF.nombre LIKE %".$Desc."%  OR AF.num_registro='".$Desc."' )
                GROUP BY  PMA.num_registro, AF.nombre, AF.apellido,AF.city,AF.pais,AF.phone,AF.phone,AF.state,cantidad, semana,estatus, AF.correo,PTR.total,PTR.precio,PTR.date ,PMA.codeorden,AF.id_afiliacion
                ORDER BY date DESC";

            }

            if($Desc=="" && $Date!="")
            {

                    $Query = "SELECT TOP(30) PMA.codeorden,PMA.num_registro,AF.id_afiliacion,AF.nombre, AF.apellido,AF.city,AF.pais,AF.phone,AF.state,CONVERT(NVARCHAR,PMA.date,103)  AS date ,ROUND(SUM(PTR.cantidad),0) AS	cantidad,PTR.total,PTR.precio , semana,estatus, AF.correo FROM PAGO_MA PMA INNER JOIN pago_tr PTR ON PMA.codeorden = PTR.codeorden 
                    INNER JOIN AFILIADOS AF ON PMA.num_registro = AF.num_registro 
                    WHERE (PMA.estatus = 8) AND CAST(PMA.date AS date) =   CONVERT(DATETIME,CONVERT(VARCHAR,'".$Date."',103),103) 
                    GROUP BY  PMA.num_registro, AF.nombre, AF.apellido,AF.city,AF.pais,AF.phone,AF.phone,AF.state,cantidad, semana,estatus, AF.correo,PTR.total,PTR.precio,PTR.date, PMA.codeorden,PMA.date,AF.id_afiliacion
                    ORDER BY date DESC";

            }


            if($Desc!="" && $Date!="")
            {
              
                    $Query = "SELECT TOP(30) PMA.codeorden, PMA.num_registro,AF.id_afiliacion,AF.nombre, AF.apellido,AF.city,AF.pais,AF.phone,AF.state,CONVERT(NVARCHAR,PMA.date,103)  AS date ,ROUND(SUM(PTR.cantidad),0) AS	cantidad,PTR.total,PTR.precio , semana,estatus, AF.correo FROM PAGO_MA PMA INNER JOIN pago_tr PTR ON PMA.codeorden = PTR.codeorden 
                    INNER JOIN AFILIADOS AF ON PMA.num_registro = AF.num_registro 
                    WHERE (PMA.estatus = 8) AND CAST(PMA.date AS DATE) =  CONVERT(DATETIME,CONVERT(VARCHAR,'".$Date."',103),103)  AND (AF.nombre LIKE %".$Desc."%  OR AF.num_registro='".$Desc."' )
                    GROUP BY  PMA.num_registro, AF.nombre, AF.apellido,AF.city,AF.pais,AF.phone,AF.phone,AF.state,cantidad, semana,estatus, AF.correo,PTR.total,PTR.precio,PTR.date ,PMA.codeorden,AF.id_afiliacion
                    ORDER BY date DESC";
            }

            $conexion=$this->ci->db->query($Query);
            $Recordset = $conexion->result();    
           
                if($Recordset != FALSE){
                    $ToReturn = $Recordset;
                }
            return $ToReturn;
        }
        function ordersSalesSearchDevoluciones($Date,$Desc)
        {
            $ToReturn = FALSE;

            if($Desc!="" && $Date=="")
            {

                            
                $Query = "SELECT TOP(30) PMA.codeorden,PMA.num_registro,AF.id_afiliacion,AF.nombre, AF.apellido,AF.city,AF.pais,AF.phone,AF.state,CONVERT(NVARCHAR,PTR.date,103)  AS date ,ROUND(SUM(PTR.cantidad),0) AS	cantidad,PTR.total,PTR.precio , semana,estatus, AF.correo FROM PAGO_MA PMA INNER JOIN pago_tr PTR ON PMA.codeorden = PTR.codeorden 
                INNER JOIN AFILIADOS AF ON PMA.num_registro = AF.num_registro 
                WHERE (PMA.estatus = 6) AND (AF.nombre LIKE %".$Desc."%  OR AF.num_registro='".$Desc."' )
                GROUP BY  PMA.num_registro, AF.nombre, AF.apellido,AF.city,AF.pais,AF.phone,AF.phone,AF.state,cantidad, semana,estatus, AF.correo,PTR.total,PTR.precio,PTR.date ,PMA.codeorden,AF.id_afiliacion
                ORDER BY date DESC";

            }

            if($Desc=="" && $Date!="")
            {

                    $Query = "SELECT TOP(30) PMA.codeorden,PMA.num_registro,AF.nombre, AF.apellido,AF.city,AF.pais,AF.phone,AF.state,CONVERT(NVARCHAR,PMA.date,103)  AS date ,ROUND(SUM(PTR.cantidad),0) AS	cantidad,PTR.total,PTR.precio , semana,estatus, AF.correo FROM PAGO_MA PMA INNER JOIN pago_tr PTR ON PMA.codeorden = PTR.codeorden 
                    INNER JOIN AFILIADOS AF ON PMA.num_registro = AF.num_registro 
                    WHERE (PMA.estatus = 6) AND CAST(PMA.date AS date) =   CONVERT(DATETIME,CONVERT(VARCHAR,'".$Date."',103),103) 
                    GROUP BY  PMA.num_registro, AF.nombre, AF.apellido,AF.city,AF.pais,AF.phone,AF.phone,AF.state,cantidad, semana,estatus, AF.correo,PTR.total,PTR.precio,PTR.date, PMA.codeorden,PMA.date,AF.id_afiliacion
                    ORDER BY date DESC";

            }


            if($Desc!="" && $Date!="")
            {
              
                    $Query = "SELECT TOP(30) PMA.codeorden, PMA.num_registro,AF.nombre, AF.apellido,AF.city,AF.pais,AF.phone,AF.state,CONVERT(NVARCHAR,PMA.date,103)  AS date ,ROUND(SUM(PTR.cantidad),0) AS	cantidad,PTR.total,PTR.precio , semana,estatus, AF.correo FROM PAGO_MA PMA INNER JOIN pago_tr PTR ON PMA.codeorden = PTR.codeorden 
                    INNER JOIN AFILIADOS AF ON PMA.num_registro = AF.num_registro 
                    WHERE (PMA.estatus = 6) AND CAST(PMA.date AS DATE) =  CONVERT(DATETIME,CONVERT(VARCHAR,'".$Date."',103),103)  AND (AF.nombre LIKE %".$Desc."%  OR AF.num_registro='".$Desc."' )
                    GROUP BY  PMA.num_registro, AF.nombre, AF.apellido,AF.city,AF.pais,AF.phone,AF.phone,AF.state,cantidad, semana,estatus, AF.correo,PTR.total,PTR.precio,PTR.date ,PMA.codeorden,AF.id_afiliacion
                    ORDER BY date DESC";
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