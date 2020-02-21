$(document).ready(function() {

    cargarListaCategorias()
    cargarlista_productos();
    
});

//metodo para cargar lista de productos
function cargarlista_productos() {

    
    
    var listaProductosNut = document.getElementById('listaProductosNut');
    //var peticion = 1;

    $.ajax({
        url: base_url+"index.php/dashboardnuevo/cargar_lista_productos",
        type: 'POST',
        global: false,
        //data: {peticion: peticion},
        beforeSend: function (xhr) {
            xhr.overrideMimeType("text/plain; charset=utf-8");
            //definicion de spinner de carga el cual sera sustituido por los alimentos a penas llegue la respuesta del ajax
            listaProductosNut.innerHTML = '<div class="text-center"><div class="spinner-border text-success" role="status"><span class="sr-only">Loading...</span></div></div>';
        },
        success: function (data) {
            
            
  
            var $Obj=$.parseJSON(data);
            var html_respuesta_producto = $Obj['html_respuesta_producto'];
            listaProductosNut.innerHTML = html_respuesta_producto;

            //metodo para recorrer en primera instacia y deshabilitar los botones de menos
            recorrerInput();
  
        }
    });

}

//metodo para cargar lista de productos
function cargarListaCategorias() {

    
    
    var listaCategorias = document.getElementById('categoriasProducto');
    //var peticion = 1;

    $.ajax({
        url: base_url+"index.php/dashboardnuevo/cargar_categorias",
        type: 'POST',
        global: false,
        //data: {peticion: peticion},
        beforeSend: function (xhr) {
            xhr.overrideMimeType("text/plain; charset=utf-8");
            //definicion de spinner de carga el cual sera sustituido por los alimentos a penas llegue la respuesta del ajax
            listaCategorias.innerHTML = '<div class="text-center"><div class="spinner-border text-success" role="status"><span class="sr-only">Loading...</span></div></div>';
        },
        success: function (data) {
            
            
  
            var $Obj=$.parseJSON(data);
            var html_respuesta_categorias = $Obj['html_respuesta_categorias'];
            listaCategorias.innerHTML = html_respuesta_categorias;
  
        }
    });

}

//metodo para agragar la compra al carrito
function agragarCompraCarrito(id_afiliacion, correo_afiliado, codigo_producto, num_registro) {

    //var btnAgregarCompra = document.getElementById('btnAgregarCompra');
    var cantidadNBox = $('.Valor'+id_afiliacion+'').val();

    $.ajax({
        url: base_url+"index.php/dashboardnuevo/agregar_compra",
        type: 'POST',
        global: false,
        data: {

            id_afiliacion: id_afiliacion,
            correo_afiliado: correo_afiliado,
            codigo_producto: codigo_producto,
            num_registro: num_registro,
            cantidad_nbox: cantidadNBox
        },
        beforeSend: function (xhr) {
            xhr.overrideMimeType("text/plain; charset=utf-8");
            //definicion de spinner de carga el cual sera sustituido por los alimentos a penas llegue la respuesta del ajax
            $('.btnAgregarCompra').css('pointer-events', 'none');
            $('.btnAgregarCompra').css('color', '#bbb');
        },
        success: function (data) {
            
            
  
            var $Obj=$.parseJSON(data);
            var respuesta_agregar = $Obj['respuesta_agregar'];

            if (respuesta_agregar == 0) {

                $('#agregadoPendienteModal').modal(
                    {
                      keyboard: false,
                      backdrop: 'static'
                    });
                
                $('#agregadoPendienteModal').modal('show');
                
            }

            if (respuesta_agregar == 1) {

                $('#agregadoModal').modal(
                    {
                      keyboard: false,
                      backdrop: 'static'
                    });
                
                $('#agregadoModal').modal('show');
                
            }

            if (respuesta_agregar == 2) {

                $('#agregadoFalloModal').modal(
                    {
                      keyboard: false,
                      backdrop: 'static'
                    });
                
                $('#agregadoFalloModal').modal('show');
                
            }

            $('.btnAgregarCompra').css('pointer-events', 'auto');
            $('.btnAgregarCompra').css('color', '#ffffff');
  
        }
    });
        
}

//metodo para recorrer en primera instacia todos los imputus y colocarlos en 1
function recorrerInput() {

    

        if($('.inputV').val() == 1) {

            $(".btnMenos").each(function(index){

                $(this).css('pointer-events', 'none');
                $(this).css('color', '#bbb');
                return;
                
            });
        }

        if($('.inputV').val() > 1) {

            $(".btnMenos").each(function(index){

                $(this).css('pointer-events', 'auto');
                $(this).css('color', '#36434a'); 
                return;
                
            });
        }

}



//metodo para quitar cajas al input a traves de atributo onclick
function quitarCaja(id_class) {

    
    //acceso al id del input para disminuir su cantidad
    var cont = $('#'+id_class+'').val();

    valor = parseInt(cont);
    result = valor - 1;
    document.getElementById(id_class).value = result;
    
    //aplicar un eah con un this para agregar las dehabilitaciones
    if(cont <= 2){

        $('.menos'+id_class+'').css('pointer-events', 'none');
        $('.menos'+id_class+'').css('color', '#bbb');
        
    }

    if (cont >= 0) {

        $('.mas'+id_class+'').css('pointer-events', 'auto');
        $('.mas'+id_class+'').css('color', '#36434a');
        
    }

    return;
    
}


//metodo para agreagar cajas al input a traves de atributo onclick
function agragarCaja(id_class) {

    

    //acceso al input para aumentar su cantidad
    var cont = $('#'+id_class+'').val();
    valor = parseInt(cont);
    result = valor + 1;
    document.getElementById(id_class).value = result;
    

    if(cont >= 3){

        $('.mas'+id_class+'').css('pointer-events', 'none');
        $('.mas'+id_class+'').css('color', '#bbb');
        
    }

    if (cont >= 0) {

        $('.menos'+id_class+'').css('pointer-events', 'auto');
        $('.menos'+id_class+'').css('color', '#36434a');
        
    }
    
}

$('#btnAgregarFalloAceptar').click(function(){

    location.reload();

});

$('#btnAgregarAceptar').click(function(){

    location.reload();

});







