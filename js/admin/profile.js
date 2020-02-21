$(document).ready(function(){
    
    $('.modal').modal();
});

$('#Cambiar').click(function()
{
    $pass1=$('#passwordr').val();
    $pass2=$('#passwordr2').val();

    if($pass1!="" && $pass2!="")
    {
        $.ajax({
            url: "./Ajax/Users/UpdatePassword.php",
            data:{pass1:$pass1, pass2: $pass2} ,
            global: false,
            type: 'POST',
            success: function (data) {
                //LoadBanners1();
                //$("#modal-contenido").modal('close');
                switch(data)
                {
                    case "1":
                        M.toast({html:'Datos actulizados'});
                        break;
                    case "2":
                        M.toast({html:'No se pudo realizar la solicitud, intentelo nuevamente'});
                        break;
                    case "3":
                        M.toast({html:'El correo ingresado no esta registrado'});
                        break;
                }
            }
        });
    }

});