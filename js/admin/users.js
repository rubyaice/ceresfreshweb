var delayTimer;
$(document).ready(function(){
    
    $('.modal').modal();

    CargarUsuarios();
})

function EditarUsuario(Code, Name, Email)
{
    

    var code = Code;
    var nombre = Name;
    var email = Email;

    var html = '<div class="modal-content" id="modal-Cerrar-Pedido">'+
        '<h4>Modificación de usuario</h4>'+
        '<p><p>'+
        '<div class="input-field">'+
            '<input id="Nombre" required="" name="Nombre" type="text" class="validate invalid" value="'+nombre+'">'+
            '<input id="Code" required="" name="Code" type="hidden" class="validate invalid" value="'+code+'">'+
            '<label for="Nombre" class="">Nombre</label>'+
        '</div>'+
        '<div class="input-field">'+
            '<input id="Email" required name="Email" type="text" class="validate" value="'+email+'" readonly>'+
            '<label for="Email" class="">Email - Usuario</label>'+
        '</div>'+
        '<div class="input-field">'+
            '<input id="Password" required="" name="Password" type="password" class="validate invalid">'+
            '<label for="Password" class="">Contraseña</label>'+
        '</div>'+
        '<div class="input-field col s12">'+
            '<select id="Type">'+
                '<option value="" disabled selected>Seleccione una opción</option>'+
                '<option value="1">Administrador</option>'+
                '<option value="2">Normal</option>'+
            '</select>'+
            '<label>Tipo de usuario</label>'+
        '</div>'+
        '<p><p>'+
    '</div>'+
    '<div class="modal-footer">'+
        '<a href="#!" onclick="ActualizarDatosDelUsuario()" class="modal-action waves-effect waves-green btn-flat">Aceptar</a>'+
        '<a href="#!" class="modal-action modal-close waves-effect waves-green btn-flat">Cerrar</a>'+
    '</div>'+
    '</div>';
    $('#modal-Actualizar').html(html);
    $('select').formSelect();
    $('#modal-Actualizar').modal('open');

    /*$.ajax({
        url: './Ajax/Users/GetUserData.php',
        global: false,
        type: 'GET',
        data: {Code: Code},
        beforeSend: function (xhr) {
            xhr.overrideMimeType("text/plain; charset=utf-8");
        },
        success: function (data) 
        {
            $('#modal-Usuario').html(data);
            $('select').formSelect();
            $('#modal-Usuario').modal('open');
        }
    });*/
   
    
}

//metodo para actualizar datos del usuario
function ActualizarDatosDelUsuario()
{
    
    var Code=$("#Code").val();
    var Name=$("#Nombre").val();
    var Password=$("#Password").val();
    var Type=$("#Type").val();
    
    //alert("Nombre: " + Name +", Email: " + Email + ", Type: " + Type + ", Staus:" + Status);

    if (Name.trim()!="" && Password.trim()!="" && Type!=null)
    {
        $.ajax({

            url: base_url+"index.php/admin/Users/updateuserdata/actualizar_usuario_admin",
            global: false,
            type: 'POST',
            data: {
                
                Name: Name,
                Password: Password, 
                Type: Type, 
                Code: Code
            },
            beforeSend: function (xhr) {
                xhr.overrideMimeType("text/plain; charset=utf-8");
            },
            success: function (data) {
               
                
                var $Obj=$.parseJSON(data);
                var respuesta = $Code=$Obj['respuesta'];

                switch (respuesta)
                {                  
                    case '0':
                        M.toast({html:'Correo en uso'});
                        break;
                    case '1':
                        M.toast({html:'Datos actualizados'});
                        CargarUsuarios();
                        $('#modal-Actualizar').modal('close');
                        break;             
                    case '2':
                        M.toast({html:'Los datos no son válidos'});
                        break;
                    default:

                        M.toast({html:'Ocurrió un error intentelo nuevamente'});
                        CargarUsuarios();
                        $('#modal-Actualizar').modal('close');
                }
            }
        });
    }
    else
    {
        M.toast({html:'Los datos no son válidos'});
    }
}

//metodo para eliminar usuario administrador
function EliminarUsuario()
{

    
    
    var ObjectMe = $("#EliminarUser");    
    var Code=ObjectMe.attr("ids");

    $('#modal-EliminarUsuario').modal('close');

    $.ajax({
        url: base_url+"index.php/admin/Users/deleteuser/eliminar_usuario_admin",
        global: false,
        type: 'GET',
        data: {Code: Code},
        beforeSend: function (xhr) {
            xhr.overrideMimeType("text/plain; charset=utf-8");
        },
        success: function (data) 
        {

            
            var $Obj=$.parseJSON(data);
            var respuesta = $Code=$Obj['respuesta'];

            switch (respuesta)
                {                  
                    
                    case '1':
                        M.toast({html:'Usuario Eliminado'});
                        CargarUsuarios();
                        break;             
                    case '2':
                        M.toast({html:'Codigo del Usuario Invalido'});
                        break;

                    default:

                        M.toast({html:'Ocurrió un error intentelo nuevamente'});
                        CargarUsuarios();
                        
                }
        }
    });
   
    
}

//condicion para eliminar un usuario
function EliminarConUsuario(Code)
{
    
    if(Code){
   
    var html = '<div class="modal-content" id="modal-Eliminar-Seccion">'+
        '<h4><i class="material-icons">new_releases</i>Eliminar Usuario</h4>'+
        '<p>¿Está seguro que desea Eliminar este Usuario? Se Eliminará de forma permanente.<p>'+
        '<p><p>'+
        '<p><p>'+
    '</div>'+
    '<div class="modal-footer">'+
        '<a href="#!" onclick="EliminarUsuario()" id="EliminarUser"  ids="'+Code+'"class="modal-action waves-effect waves-green btn-flat">Aceptar</a>'+
        '<a href="#!" class="modal-action modal-close waves-effect waves-green btn-flat">Cancelar</a>'+
    '</div>'+
    '</div>';
    
    $('#modal-EliminarUsuario').html(html);
    $('#modal-EliminarUsuario').modal('open');

    }
    else {
        location.reload(); 
    }

}

//metodo para crear usuario administrador
function CrearNuevoUsuario()
{
    
    //ajax para guardar
    var Name=$("#Nombre").val();
    var Email=$("#Email").val();
    var Type=$("#Type").val();
    var Pass=$("#Password").val();

    //----------------------------------

    var nombre_proveedor = "sistema cerefresh";
    
    //alert("Nombre: " + Name +", Email: " + Email + ", Type: " + Type);
    if (Name.trim()!="" && Email.trim()!="" && Type!=null && Pass.trim()!="")
    {
        $.ajax({
            url: base_url+"index.php/admin/Users/createnewuser/crear_usuario_admin",
            global: false,
            type: 'POST',
            data: { 

                Name: Name,
                Email: Email, 
                Type: Type, 
                Password: Pass,
                nombre_proveedor: nombre_proveedor
            },
            beforeSend: function (xhr) {
                xhr.overrideMimeType("text/plain; charset=utf-8");
            },
            success: function (data) {
                //alert(data);

                var $Obj=$.parseJSON(data);
                var respuesta = $Code=$Obj['respuesta'];

                
                switch (respuesta)
                {  
                    case '0':
                        M.toast({html:'Correo en uso'});
                        break;
                    case '1':
                        M.toast({html:'Usuario Creado'});
                        CargarUsuarios();
                        $('#modal-Usuario').modal('close');
                        break;             
                    case '2':
                        M.toast({html:'Los datos no son válidos'});
                        break;
                    default:
                        M.toast({html:'Ocurrió un error intentelo nuevamente'});
                        CargarUsuarios();
                        $('#modal-Usuario').modal('close');
                }
            }
        });
    }
    else
    {
        M.toast({html:'Los datos no son válidos'});
    }
}


$("#nuevo").click(function(){
    var html = '<div class="modal-content" id="modal-Cerrar-Pedido">'+
        '<h4>Datos del usuario</h4>'+
        '<p><p>'+
        '<div class="input-field">'+
            '<input id="Nombre" required="" name="Nombre" type="text" class="validate invalid">'+
            '<label for="Nombre" class="">Nombre</label>'+
        '</div>'+
        '<div class="input-field">'+
            '<input id="Email" required="" name="Email" type="text" class="validate invalid">'+
            '<label for="Email" class="">Email</label>'+
        '</div>'+
        '<div class="input-field">'+
            '<input id="Password" required="" name="Password" type="password" class="validate invalid">'+
            '<label for="Password" class="">Contraseña</label>'+
        '</div>'+
        '<div class="input-field col s12">'+
            '<select id="Type">'+
                '<option value="" disabled selected>Seleccione una opción</option>'+
                '<option value="1">Administrador</option>'+
                '<option value="2">Normal</option>'+
            '</select>'+
            '<label>Tipo de usuario</label>'+
        '</div>'+
        '<p><p>'+
    '</div>'+
    '<div class="modal-footer">'+
        '<a href="#!" onclick="CrearNuevoUsuario()" class="modal-action waves-effect waves-green btn-flat">Aceptar</a>'+
        '<a href="#!" class="modal-action modal-close waves-effect waves-green btn-flat">Cerrar</a>'+
    '</div>'+
    '</div>';
    $('#modal-Usuario').html(html);
    $('select').formSelect();
    $('#modal-Usuario').modal('open');
});

//metodo para cargar a los usuarios que estan registrados con como usuarios administradosr
function CargarUsuarios()
{
    $.ajax({
        url: base_url+"index.php/admin/Users/getuserslist/UserList",
        global: false,
        type: 'GET',
        data: {Pag: 1},
        beforeSend: function (xhr) {
            xhr.overrideMimeType("text/plain; charset=utf-8");
        },
        success: function (data) {
            $("#users-container").html(data);
        }
    });
}

//---------------------------------------------------------------------

$('#searchUsuarios').keyup(function(e) {
    clearTimeout(delayTimer);
    delayTimer = setTimeout(function() {
        // Timer para no consultar por cada tecla            
        $Texto=$('#searchUsuarios').val();
        $.ajax({
            data:{Texto:$Texto, Pag: 0} ,
            url:  base_url+"index.php/admin/Users/getuserslist/UserList",
            global: false,
            type: 'GET',
            data: {Pag: 1,Text: $Texto},
            beforeSend: function (xhr) {
                xhr.overrideMimeType("text/html;charset=utf-8");
            },
            success: function (data) {
                $("#users-container").html(data);
            }
        });
    }, 500); // Will do the ajax stuff after 1000 ms, or 1 s
});

