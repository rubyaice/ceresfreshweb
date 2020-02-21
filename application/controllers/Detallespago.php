<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Detallespago extends CI_Controller{

  public function __construct()
  {
    parent::__construct();
    $this->load->database();
		$this->load->helper('url');

		if (!$this->session->userdata('correo')) {
      redirect('login/login_view');
    }
  }

  function index()
  {

    //$respuesta_usuario_pago='';
    //envio de datos del carrito al header para visualizacion del usuario
    $cantidad_total=0;
    $monto_total=0;
    $sub_total=0;
    $orderCode='-1';

    //$data_usuario_pago='';
		if (isset($_SESSION['correo'])) {
      $correo_usuario = $_SESSION['correo'];     
 
      $query = $this->db->query("SELECT ML.num_registro , correo,id_proveedor,nombre_proveedor,id_proceso FROM MA_LOGIN ML  INNER JOIN ESTATUS_REGISTRO_MA ER ON ML.num_registro = ER.num_registro WHERE ML.correo = '$correo_usuario'");
      $resultado = $query->row();


       if ($resultado) {
        $proceso=$resultado->id_proceso;
            switch ($proceso) {
              case '1':
                # code...
                break;
              case '2':
                # code... Continuar registro  y afiliacion 

               //obtener tipo de actitud fisica que tine el suscriptor para grabar en la tabla de afiliacion

                  $query = $this->db->query('SELECT * FROM PLAN_NUTRICIONAL_ACT_FISICA');
                  $results_af = $query->result();

                  //obtener si existe alguna aptitud especial en el usuario
                  $query = $this->db->query('SELECT * FROM PLAN_NUTRICIONAL_CONDICION_ESPECIAL');
                  $results_ce = $query->result();
                  //obtener los paises
                  $query = $this->db->query('SELECT * FROM PAIS');
                  $results_pais= $query->result();

                  //obtener los datos para resumen de compra del cliente
                  
                  //codigo del unico producto que existe por el momento en la base de datos
                  $codigo_producto = "0000000001";
                  $cosulta_resumen = $this->db->query("SELECT * FROM MA_PRODUCTOS WHERE C_CODIGO = '$codigo_producto'");
                  $resultado_resumen = $cosulta_resumen->row();

                  $consulta_precio_bs = $this->db->query("SELECT (e_precio*n_precio_m) AS precio FROM MA_PRODUCTOS WHERE C_CODIGO = '$codigo_producto'");
                  $resultado_precio_bs = $consulta_precio_bs->row();

                  //varibles de productos que se enviaran a la vista de registrar ususario para la parte informativa
                  $data['precio_dolares'] = number_format($resultado_resumen->e_precio, 2, '.',',');
                  $data['precio_bs'] = number_format($resultado_precio_bs->precio, 2, '.',',');
                  $data['prod_descripcion'] = $resultado_resumen->C_DESCRI;


                  //definicion de variables que se eniaran a la vista para los select de los planes
                  $data['actitud_fisica'] = $results_af;
                  $data['condicion_especial'] = $results_ce;
                  $data['pais'] = $results_pais;
                  $data['proceso'] = $proceso ;
                  $data['correo']= $correo_usuario;

                  //datos para mostrar la barra de estado del registro
                  $data_ntf['mostrar'] = "1";
                  $this->load->view('headers/header_loged', $data_ntf);
		              $this->load->view('continuar_registro_usuario',$data);
                  $this->load->view('footer/footer');
                
                break;
              case '3':
                # code... Terminar de pagar 

                       
                /*$datos = $this->db->query("SELECT AF.nombre, AF.apellido,AF.address,AF.city,AF.sexo,AF.edad,AF.pais,AF.phone,AF.phone,AF.state,AF.zipcode,AF.sector, AF.plan_nut, AF.id_afiliacion, AF.correo, CA.codeorder,CA.cantidad , AF.num_registro ,CA.productcode ,(MP.e_precio *MP.n_precio_m) AS precio,(MP.e_precio *MP.n_precio_m*CA.cantidad) AS monto,ER.id_proceso 
                FROM  CARRITO CA INNER JOIN AFILIADOS AF ON CA.correo = AF.correo INNER JOIN MA_PRODUCTOS MP ON MP.C_CODIGO=CA.productcode INNER JOIN ESTATUS_REGISTRO_MA ER ON CA.num_registro = ER.num_registro WHERE AF.num_registro  ='$resultado->num_registro'");
                $resultado_data = $datos->row();
                
               
                $datapersonal = array(
                  'phone' =>  $resultado_data->phone,
                  'sexo' =>  $resultado_data->sexo,
                  'edad' =>  $resultado_data->edad,
                  'address'=> $resultado_data->address,
                  'state'=> $resultado_data->state,
                  'zipcode'=>$resultado_data->zipcode,
                  'sector'=>$resultado_data->sector,
                  'pais'=> $resultado_data->pais,
                  'city'=>$resultado_data->city,
                  'nombre' =>  $resultado_data->nombre,
                  'apellido'=> $resultado_data->apellido,                  
                  'correo'=>$resultado_data->correo,
                  'id_afiliacion'=> $resultado_data->id_afiliacion,
                  'num_registro'=>$resultado_data->num_registro,
                  'monto'=>$resultado_data->monto
                );    
  
                $data_ntf['mostrar'] = "1";
                $this->load->view('headers/header_loged', $data_ntf);
                $this->load->view('continuar_pago',$datapersonal);
                $this->load->view('footer/footer');*/

                

               
                // Si termino el proceso de afiliacion y esta pendiente pago 
                if (isset($_SESSION['correo'])) 
                {           

                $conexion = $this->db->query("SELECT AF.nombre, AF.apellido,AF.address,AF.city,AF.sexo,AF.edad,AF.pais,AF.phone,AF.phone,AF.state,AF.zipcode,AF.sector, AF.plan_nut, AF.id_afiliacion, AF.correo, CA.codeorder,CA.cantidad , AF.num_registro ,CA.productcode ,(PN.precio *MP.n_precio_m) AS precio,(PN.precio *MP.n_precio_m*CA.cantidad) AS monto,ER.id_proceso, CA.fecha 
                FROM  CARRITO CA INNER JOIN AFILIADOS AF ON CA.correo = AF.correo INNER JOIN MA_PRODUCTOS MP ON MP.C_CODIGO=CA.productcode INNER JOIN ESTATUS_REGISTRO_MA ER ON CA.num_registro = ER.num_registro INNER JOIN PLAN_NUTRICIONAL PN ON AF.plan_nut = PN.id_plan WHERE AF.num_registro  = '$resultado->num_registro'");
                $respuesta_usuario_pago = $conexion->result();
                
                  //en caso de que no haya nada en el carrito no debe permitir ver la vista de detalles de pago
                  if ($respuesta_usuario_pago == null)
                  {
                    $datapersonal = array(
                      'phone' =>  '',
                      'address'=> '',
                      'sexo'=> '',
                      'state'=> '',
                      'zipcode'=>'',
                      'sector'=>'',
                      'pais'=> '',
                      'city'=>'',
                      'nombre' =>  '',
                      'apellido'=> '',                  
                      'correo'=>'',
                      'id_afiliacion'=>'',
                      'num_registro'=>'',
                      'monto'=>'',
                      'cantidad'=>''
                    );          
    
    
    
    
              
                        //datos que se enviaran a la vista
                        $data_usuario_pago['nombre'] = '';
                        $data_usuario_pago['apellido'] = '';
                        $data_usuario_pago['codeorder'] = '';
                        $data_usuario_pago['subtotal'] ='';
                        $data_usuario_pago['monto_total'] ='';
                        $data_usuario_pago['cantidad_total'] ='';
                        $data_usuario_pago['num_afiliacion'] = '';
                        $data_usuario_pago['datapersonal'] = '';
                        $data_usuario_pago['por_pagar'] = 0;
                        $data_usuario_pago['carrito_usuario'] = null;
                  }else {

                

                
                      foreach ($respuesta_usuario_pago as $result) {
                        $cantidad_total+=$result->cantidad;               
                        $sub_total+=$result->precio*$result->cantidad;
                        $monto_total+=$result->precio*$result->cantidad;
                        $orderCode=$result->codeorder;
                    
                      }
                      $data_usuario_pago['carrito_usuario']=  $respuesta_usuario_pago;
                      $data_usuario_pago['por_pagar'] = 1;
                    }

                }
                else 
                {

                  $data_usuario_pago['carrito_usuario'] = null;
                  $data_usuario_pago['por_pagar'] = 0;

                }      
          
    

                if ($respuesta_usuario_pago != null)
                {
                $datos = $this->db->query("SELECT AF.nombre,AF.address,AF.apellido,AF.sexo,AF.address,AF.city,AF.pais,AF.phone,AF.phone,AF.state,AF.zipcode,AF.sector, AF.apellido, AF.plan_nut, AF.id_afiliacion, AF.correo,  AF.num_registro 
                FROM  AFILIADOS AF  WHERE AF.correo =  '$correo_usuario'");
                $resultado_data = $datos->row();
              //  $monto=$resultado_data->Precio*$resultado_data->cantidad;
               
                $datapersonal = array(
                  'phone' =>  $resultado_data->phone,
                  'address'=> $resultado_data->address,
                  'sexo'=> $resultado_data->sexo,
                  'state'=> $resultado_data->state,
                  'zipcode'=>$resultado_data->zipcode,
                  'sector'=>$resultado_data->sector,
                  'pais'=> $resultado_data->pais,
                  'city'=>$resultado_data->city,
                  'nombre' =>  $resultado_data->nombre,
                  'apellido'=> $resultado_data->apellido,                  
                  'correo'=>$resultado_data->correo,
                  'id_afiliacion'=> $resultado_data->id_afiliacion,
                  'num_registro'=>$resultado_data->num_registro,
                  'monto'=>$monto_total,
                  'cantidad'=>$cantidad_total,
                  'codeorder' => $orderCode,
                  'subtotal' =>$sub_total
                );          

                //datos que se enviaran a la vista
                $data_usuario_pago['nombre'] = $resultado_data->nombre;
                $data_usuario_pago['apellido'] = $resultado_data->apellido;
                $data_usuario_pago['codeorder'] = $orderCode;
                $data_usuario_pago['subtotal'] =$sub_total;
                $data_usuario_pago['monto_total'] =$monto_total;
                $data_usuario_pago['cantidad_total'] =$cantidad_total;
                $data_usuario_pago['num_afiliacion'] = $resultado_data->num_registro;
                $data_usuario_pago['datapersonal'] =  $datapersonal;
         
                 
                }

                //llamado a las vistas de detalles de pago y header
                $this->load->view('headers/header_loged');
                $this->load->view('detalles_pago', $data_usuario_pago);
                $this->load->view('footer/footer');
            
            
                
                break;
              case '4':
                # code...Pagar 



               
                // Si termino el proceso de afiliacion y esta pendiente pago 
                if (isset($_SESSION['correo'])) 
                {           

                $conexion = $this->db->query("SELECT AF.nombre, AF.apellido,AF.address,AF.city,AF.sexo,AF.edad,AF.pais,AF.phone,AF.phone,AF.state,AF.zipcode,AF.sector, AF.plan_nut, AF.id_afiliacion, AF.correo, CA.codeorder,CA.cantidad , AF.num_registro ,CA.productcode ,(PN.precio *MP.n_precio_m) AS precio,(PN.precio *MP.n_precio_m*CA.cantidad) AS monto,ER.id_proceso, CA.fecha 
                FROM  CARRITO CA INNER JOIN AFILIADOS AF ON CA.correo = AF.correo INNER JOIN MA_PRODUCTOS MP ON MP.C_CODIGO=CA.productcode INNER JOIN ESTATUS_REGISTRO_MA ER ON CA.num_registro = ER.num_registro INNER JOIN PLAN_NUTRICIONAL PN ON AF.plan_nut = PN.id_plan WHERE AF.num_registro  = '$resultado->num_registro'");
                $respuesta_usuario_pago = $conexion->result();
                
                  //en caso de que no haya nada en el carrito no debe permitir ver la vista de detalles de pago
                  if ($respuesta_usuario_pago == null)
                  {
                    $datapersonal = array(
                      'phone' =>  '',
                      'address'=> '',
                      'sexo'=> '',
                      'state'=> '',
                      'zipcode'=>'',
                      'sector'=>'',
                      'pais'=> '',
                      'city'=>'',
                      'nombre' =>  '',
                      'apellido'=> '',                  
                      'correo'=>'',
                      'id_afiliacion'=>'',
                      'num_registro'=>'',
                      'monto'=>'',
                      'cantidad'=>''
                    );          
    
    
    
    
              
                        //datos que se enviaran a la vista
                        $data_usuario_pago['nombre'] = '';
                        $data_usuario_pago['apellido'] = '';
                        $data_usuario_pago['codeorder'] = '';
                        $data_usuario_pago['subtotal'] ='';
                        $data_usuario_pago['monto_total'] ='';
                        $data_usuario_pago['cantidad_total'] ='';
                        $data_usuario_pago['num_afiliacion'] = '';
                        $data_usuario_pago['datapersonal'] = '';
                        $data_usuario_pago['por_pagar'] = 0;
                        $data_usuario_pago['carrito_usuario'] = null;
                  }else {

                

                
                      foreach ($respuesta_usuario_pago as $result) {
                        $cantidad_total+=$result->cantidad;               
                        $sub_total+=$result->precio*$result->cantidad;
                        $monto_total+=$result->precio*$result->cantidad;
                        $orderCode=$result->codeorder;
                    
                      }
                      $data_usuario_pago['carrito_usuario']=  $respuesta_usuario_pago;
                      $data_usuario_pago['por_pagar'] = 1;
                    }

                }
                else 
                {

                  $data_usuario_pago['carrito_usuario'] = null;
                  $data_usuario_pago['por_pagar'] = 0;

                }      
          
    

                if ($respuesta_usuario_pago != null)
                {
                $datos = $this->db->query("SELECT AF.nombre,AF.address,AF.apellido,AF.sexo,AF.address,AF.city,AF.pais,AF.phone,AF.phone,AF.state,AF.zipcode,AF.sector, AF.apellido, AF.plan_nut, AF.id_afiliacion, AF.correo,  AF.num_registro 
                FROM  AFILIADOS AF  WHERE AF.correo =  '$correo_usuario'");
                $resultado_data = $datos->row();
              //  $monto=$resultado_data->Precio*$resultado_data->cantidad;
               
                $datapersonal = array(
                  'phone' =>  $resultado_data->phone,
                  'address'=> $resultado_data->address,
                  'sexo'=> $resultado_data->sexo,
                  'state'=> $resultado_data->state,
                  'zipcode'=>$resultado_data->zipcode,
                  'sector'=>$resultado_data->sector,
                  'pais'=> $resultado_data->pais,
                  'city'=>$resultado_data->city,
                  'nombre' =>  $resultado_data->nombre,
                  'apellido'=> $resultado_data->apellido,                  
                  'correo'=>$resultado_data->correo,
                  'id_afiliacion'=> $resultado_data->id_afiliacion,
                  'num_registro'=>$resultado_data->num_registro,
                  'monto'=>$monto_total,
                  'cantidad'=>$cantidad_total,
                  'codeorder' => $orderCode,
                  'subtotal' =>$sub_total
                );          

                //datos que se enviaran a la vista
                $data_usuario_pago['nombre'] = $resultado_data->nombre;
                $data_usuario_pago['apellido'] = $resultado_data->apellido;
                $data_usuario_pago['codeorder'] = $orderCode;
                $data_usuario_pago['subtotal'] =$sub_total;
                $data_usuario_pago['monto_total'] =$monto_total;
                $data_usuario_pago['cantidad_total'] =$cantidad_total;
                $data_usuario_pago['num_afiliacion'] = $resultado_data->num_registro;
                $data_usuario_pago['datapersonal'] =  $datapersonal;
         
                 
                }

                //llamado a las vistas de detalles de pago y header
                $this->load->view('headers/header_loged');
                $this->load->view('detalles_pago', $data_usuario_pago);
                $this->load->view('footer/footer');
              
                break;
              
              default:
                # code...
                break;
             }           
          }
        }
      }
    }
