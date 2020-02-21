$(document).ready(function() {

    guardarGustoUs();
    verificarEstatusLacteos();

    //validaciones de lacteos al momento de cargar la pagina
    validarChecksLacteos();

    //validaciones de vegetales al momento de cargar la pagina
    validarChecksVegetales();

    //validar checck de frutas
    validarChecksFrutas();

    //validar check de carbohidradtos
    validarChecksCarbohid();

    //validar check de protehinas
    validarChecksProtei();

    //validar check de grasas
    validarChecksGrasas();

});

//metodo para ver le tipo de alimento del usuario
function guardarGustoUs(){

  

    var activacion = 1;

    $.ajax({

        url: base_url+"index.php/Misgustos/guardar_gusto_usuario",
        type: 'POST',
        global: false,
        data: {
            activacion: activacion
        },
        beforeSend: function (xhr) {
            xhr.overrideMimeType("text/plain; charset=utf-8");
        },
        success: function (data) {

          

          var $Obj=$.parseJSON(data);
          //$Obj=$.parseJSON(data);

          var respuesta_reg_gustos_us = $Obj['respuesta'];

          if (respuesta_reg_gustos_us == 1) {

            console.log('usuario registrado con exito en gustos');
            return; 
              
          }

          if (respuesta_reg_gustos_us == 2) {

            console.log('error al ingregsar al usuario en mis gustos');
            return; 
              
          }

          if (respuesta_reg_gustos_us == 0) {

            console.log('el usuario ya esta en mis gustos');
            return; 
              
          }

        }
    });
}

$('html').on('click','.checkActivo',function(event){
  
  
      var seleccionado = 1;
      var idactivo = $(this).val();
      var cod_alimento = $(this).attr('data-alimento');

  
       if(idactivo == 0) 
       {
          $(this).val('1');
          seleccionado = 1;
          $(this).attr('checked');
       }

       if(idactivo == 1) 
       {
          $(this).val('0');
          seleccionado = 0;
          $(this).removeAttr('checked');
       }

       

       $.ajax({
           url: base_url+"index.php/Misgustos/agregar_gusto_usuario",
           global: false,
           type: 'POST',
           data: {

                seleccionado:seleccionado,
                cod_alimento:cod_alimento
           },
           beforeSend: function (xhr) {
               xhr.overrideMimeType("text/plain; charset=utf-8");
           },
           success: function (data) 
           {

               

               var $Obj=$.parseJSON(data);           
               
               var respuesta = $Obj['respuesta'];

               console.log(respuesta);
               
           }
       });
 
});

function verificarEstatusLacteos() {
    
    $(".form-check-input").each(function() {
        var activo = $(this).val();   
        
        if (activo == 1) {
            
            $(this).attr('checked')

        }

        if (activo == 0) {

            $(this).removeAttr('checked');
            
        }

    });

}

//intento de validar los check de la pagina con estilos 
function validarChecksLacteos() {
    
    $("#recorrerCheckLacteos > input").each(function(){

        if($(this).val() == 1) {

            $(this).attr('checked');

        }else{

            if ($(this).val() == 0) {

                $(this).removeAttr('checked');
                
            }
        }
    });

}

//intento de validar los check de la pagina con estilos 
function validarChecksFrutas() {
    
    $("#recorrerCheckFrutas > input").each(function(){

        if($(this).val() == 1) {

            $(this).attr('checked');

        }else{

            if ($(this).val() == 0) {

                $(this).removeAttr('checked');
                
            }
        }
    });

}

//intento de validar los check de la pagina con estilos 
function validarChecksVegetales() {
    
    $("#recorrerCheckVegetales > input").each(function(){

        if($(this).val() == 1) {

            $(this).attr('checked');

        }else{

            if ($(this).val() == 0) {

                $(this).removeAttr('checked');
                
            }
        }
    });

}

//intento de validar los check de la pagina con estilos 
function validarChecksCarbohid() {
    
    $("#recorrerCheckCarbohid > input").each(function(){

        if($(this).val() == 1) {

            $(this).attr('checked');

        }else{

            if ($(this).val() == 0) {

                $(this).removeAttr('checked');
                
            }
        }
    });

}

//intento de validar los check de la pagina con estilos 
function validarChecksProtei() {
    
    $("#recorrerCheckProtei > input").each(function(){

        if($(this).val() == 1) {

            $(this).attr('checked');

        }else{

            if ($(this).val() == 0) {

                $(this).removeAttr('checked');
                
            }
        }
    });

}

//intento de validar los check de la pagina con estilos 
function validarChecksGrasas() {
    
    $("#recorrerCheckGrasas > input").each(function(){

        if($(this).val() == 1) {

            $(this).attr('checked');

        }else{

            if ($(this).val() == 0) {

                $(this).removeAttr('checked');
                
            }
        }
    });

}

//accion de boton para sacar el modal de vista d seleccion d los lacteos
$('#modalLacteos').click(function(){

    $('#lacteosModalCenter').modal('show');

});

//accion de boton para sacar el modal de vista d seleccion d los vegetales
$('#modalVegetales').click(function(){

    $('#vegetalesModalCenter').modal('show');

});

//accion de boton para sacar el modal de vista d seleccion d los frutas
$('#modalFrutas').click(function(){

    $('#frutasModalCenter').modal('show');

});

//accion de boton para sacar el modal de vista d seleccion d los carbohidratos
$('#modalCarbohidratos').click(function(){

    $('#carbohidratosModalCenter').modal('show');

});

//accion de boton para sacar el modal de vista d seleccion d los carnicos y proteinas
$('#modalCarnicos').click(function(){

    $('#carnicosModalCenter').modal('show');

});

//accion de boton para sacar el modal de vista d seleccion d los grasas
$('#modalGrasas').click(function(){

    $('#grasasModalCenter').modal('show');

});