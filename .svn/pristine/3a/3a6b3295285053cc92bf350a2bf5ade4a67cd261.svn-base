$(document ).ready(function() {
    $('.modal').modal();
});

function Registrar()
{
    var formData = new FormData($("#forma")[0]);

    $.ajax({
        url: "./Ajax/Datos/RegistrarDatos.php",
        type: 'POST',
        data: formData,
        mimeType: "multipart/form-data",
        contentType: false,
        cache: false,
        processData: false,
        success: function (data, textStatus, jqXHR) {
           switch(data) 
           {
                case "1":
                    //$("#modal-contenido").modal('close');
                    M.toast({html: 'Debe llenar todos los campos'});
                    break;
                case "2":
                    M.toast({html: 'Registro completado'});
                    $("#modal-contenido").modal('close');
                    $("#Nombre").val("");
                    $("#Email").val("");
                    $("#Telefono").val("");
                    break;
                default:
                    M.toast({html: 'En estos momentos no podemos procesar su solicitud, intente de nuevo mas tarde'});
                    break;
              
           }
            
        },
        error: function (jqXHR, textStatus, errorThrown) {


        }
    });
}