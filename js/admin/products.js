    var elem = document.querySelector('.collapsible.expandable');
    var instance = M.Collapsible.init(elem,{accordion: false});
    var DepartamentoCode;
    var UPC_Code;
    var delayTimer;
    
    $("#MainContainer").hide();
    $(".DatosAdicionalesContainer").hide();
    $("#DepartamentoMainContainer").hide();
    $("#EditContainer").hide();
    //CodeContainer

    //CUANDO LA PAGINA TERMINA TODO ENTOCES EJECUTA ESTO
    $(document).ready(function(){
        
        $('.collapsible').collapsible();
        
        var elem = document.querySelector('.collapsible.expandable');
        var instance = M.Collapsible.init(elem, {
        accordion: false
        });
        $DepartamendoEdit=$("#DepartamentoEdit").val();
        $GrupoEdit=$("#GrupoEdit").val();
        $SubGrupoEdit=$("#SubgrupoEdit").val();
    //Al perder el foco en el input valida si existe el productos
        $("#CodigoUPC").blur(function(){
            
            $Codigo=$("#CodigoUPC").val();
            $UPC_Code=$("#CodigoUPC").val();
            
            if ($Codigo!=""){
                $.ajax({
                    url: './Ajax/Products/ValidarCodigo.php',
                    global: false,
                    type: 'GET',
                    data: {Codigo: $Codigo},
                    beforeSend: function (xhr) {
                        xhr.overrideMimeType("text/plain; charset=utf-8");
                    },
                    success: function (data) {
                        $(".SectionAgregar").html(data);
                        $("#UPC").val($Codigo);
                    }
                });
            }
        })
        //Esto es para que en el caso de que 
        //en el get tenga algun datos entonces muestra el form
        //del edit y ademas carga la lista de departamentos
        //grupos y subgrupos
        if($('#UPCEdit').val()!="")
        {
            $("#EditContainer").show();
            $("#CodeContainer").hide();
            
            $.ajax({
                url: './Ajax/Departamentos/GetDepartamentosSelectEdit.php',
                global: false,
                type: 'GET',
                beforeSend: function (xhr) {
                    xhr.overrideMimeType("text/html;charset=utf-8");
                },
                success: function (data) {
                    $(".DepartamentoEditContainer").html(data);
                }
            });
            $.ajax({
                url: './Ajax/Grupos/GetGruposSelectEdit.php',
                global: false,
                type: 'GET',
                data: {Departamento: $DepartamendoEdit },
                beforeSend: function (xhr) {
                    xhr.overrideMimeType("text/html;charset=utf-8");
                },
                success: function (data) {
                    $(".GrupoEditContainer").html(data);
                }
            });
            $.ajax({
                url: './Ajax/SubGrupos/GetSubGruposSelectEdit.php',
                global: false,
                type: 'GET',
                data: {Grupo: $GrupoEdit, Departamento: $DepartamendoEdit },
                beforeSend: function (xhr) {
                    xhr.overrideMimeType("text/html;charset=utf-8");
                },
                success: function (data) {
                    $(".SubGrupoEditContainer").html(data);
                }
            });
        }

        $('#searchDepartamentoEdit').keyup(function(e) {
            clearTimeout(delayTimer);
            delayTimer = setTimeout(function() {
                // Timer para no consultar por cada tecla            
                $Texto=$('#searchDepartamentoEdit').val();
                $.ajax({
                    data:{Texto:$Texto, Pag: 0} ,
                    url: './Ajax/Departamentos/GetDepartamentosSelectEdit.php',
                    global: false,
                    type: 'GET',
                    beforeSend: function (xhr) {
                        xhr.overrideMimeType("text/html;charset=utf-8");
                    },
                    success: function (data) {
                        $(".DepartamentoEditContainer").html(data);
                    }
                });
            }, 500); // Will do the ajax stuff after 1000 ms, or 1 s
        });
        $('#searchGrupoEdit').keyup(function(e) {
            clearTimeout(delayTimer);
            delayTimer = setTimeout(function() {
                // Timer para no consultar por cada tecla            
                $Texto=$('#searchGrupoEdit').val();
                $.ajax({
                    data:{Texto:$Texto, Pag: 0, Departamento: $DepartamendoEdit} ,
                    url: './Ajax/Grupos/GetGruposSelectEdit.php',
                    global: false,
                    type: 'GET',
                    beforeSend: function (xhr) {
                        xhr.overrideMimeType("text/html;charset=utf-8");
                    },
                    success: function (data) {
                        $(".GrupoEditContainer").html(data);
                    }
                });
            }, 500); // Will do the ajax stuff after 1000 ms, or 1 s
        });
        $('#searchSubgrupoEdit').keyup(function(e) {
            clearTimeout(delayTimer);
            delayTimer = setTimeout(function() {
                // Timer para no consultar por cada tecla            
                $Texto=$('#searchSubgrupoEdit').val();
                $.ajax({
                    data:{Texto:$Texto, Pag: 0, Grupo: $GrupoEdit, Departamento: $DepartamendoEdit} ,
                    url: './Ajax/SubGrupos/GetSubGruposSelectEdit.php',
                    global: false,
                    type: 'GET',
                    beforeSend: function (xhr) {
                        xhr.overrideMimeType("text/html;charset=utf-8");
                    },
                    success: function (data) {
                        $(".SubGrupoEditContainer").html(data);
                    }
                });
            }, 500); // Will do the ajax stuff after 1000 ms, or 1 s
        });


    });

    function AgregarProductoNuevo()
    {
        $Existencia=$("#Existencia").val();
        $Nombre=$("#Nombre").val();
        $Precio=$("#Precio").val();
        $Descripcion=$("#textarea1").val();

        //$DepartamentoCode
        if ($Codigo!="" && $Precio!=0 && $Precio!="" && $Existencia!=0 && $Existencia!="")
        {
            $.ajax({
                url: './Ajax/Products/AgregarProductoNuevo.php',
                global: false,
                type: 'POST',
                data: {Quantity:$Existencia,Price:$Precio,Name:$Nombre,Description:$Descripcion,DepartamentoCode:$DepartamentoCode, UPC_Code:$UPC_Code},
                beforeSend: function (xhr) {
                    xhr.overrideMimeType("text/plain; charset=utf-8");
                },
                success: function (data) {
                    window.location = 'Inventario.php';
                }
            });
        }
    }
    //Cunado el producto existe
    //Este lo que hace es que lo agrega a la lista del vendedor
    function AgregarProductoLista()
    {
        $Existencia=$("#ExistenciaNueva").val();
        $Precio=$("#PrecioNuevo").val();
        $Codigo=$("#CodigoUPC").val();
        if ($Codigo!="" && $Precio!=0 && $Precio!="" && $Existencia!=0 && $Existencia!="")
        {
            $.ajax({
                url: './Ajax/Products/AgregarProductoLista.php',
                global: false,
                type: 'POST',
                data: {Code:$Codigo,Quantity:$Existencia,Price:$Precio},
                beforeSend: function (xhr) {
                    xhr.overrideMimeType("text/plain; charset=utf-8");
                },
                success: function (data) {
                    window.location = 'Inventario.php';
                }
            });
        }
    }
    //Codigo cuando es un producto nuevo
    //lo que hace es que carga la listas de departamentos
    //para que se selecciones 1 
    function AgregarProducto()
    {
        $.ajax({
            url: './Ajax/Departamentos/GetDepartamentosSelect.php',
            global: false,
            type: 'GET',
            beforeSend: function (xhr) {
                xhr.overrideMimeType("text/plain; charset=utf-8");
            },
            success: function (data) {
                $("#SelectDepartamento").html(data);
                $("#CodeContainer").hide();
                $("#DepartamentoMainContainer").show();
            }
        });
    }
    //Codigo al hacer click en un departamento
    //cuando el producto es nuevo
    function CargarGrupos(Departamento)
    {
        //$.ajax({
        //    url: './Ajax/Grupos/GetGruposSelect.php',
        //    global: false,
        //    type: 'POST',
        //    data: {Departamento: Departamento },
        //    beforeSend: function (xhr) {
        //        xhr.overrideMimeType("text/plain; charset=utf-8");
        //    },
        //    success: function (data) {
        //        $("#SelecGrupo").html(data);
        //        $("#SelecGrupo").show();
        //        $("#SelectDepartamento").hide();
        //    }
        //});
        $DepartamentoCode=Departamento;
        $("#Departamento").val(Departamento);
        $("#DepartamentoMainContainer").hide();
        $("#MainContainer").show();
        $(".DatosAdicionalesContainer").show();
    }
    //no implementada
    function CargarSubGrupo(Grupo)
    {
        $.ajax({
            url: './Ajax/SubGrupos/GetSubGruposSelect.php',
            global: false,
            type: 'POST',
            data: {Grupo: Grupo },
            beforeSend: function (xhr) {
                xhr.overrideMimeType("text/plain; charset=utf-8");
            },
            success: function (data) {
                $("#SelecGrupo").html(data);
                $("#SelecGrupo").show();
                $("#SelectDepartamento").hide();
            }
        });
    }
    //Para las imagenes
    function readURL(input,imgindex) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                switch(imgindex) {
                    case 0:
                        $('#imgmain').attr('src', e.target.result);
                        break;
                    case 1:
                        $('#img1').attr('src', e.target.result);
                        break;
                    case 2:
                        $('#img2').attr('src', e.target.result);
                        break;
                    case 3:
                        $('#img3').attr('src', e.target.result);
                        break;
                    case 4:
                        $('#img4').attr('src', e.target.result);
                        break;
                    case 5:
                        $('#imgmainEdit').attr('src', e.target.result);
                        break;
                    case 6:
                        $('#img1Edit').attr('src', e.target.result);
                        break;
                    case 7:
                        $('#img2Edit').attr('src', e.target.result);
                        break;
                    case 8:
                        $('#img3Edit').attr('src', e.target.result);
                        break;
                    case 9:
                        $('#img4Edit').attr('src', e.target.result);
                        break;
                    default:
                        $('#imgmain').attr('src', e.target.result);
                }
               
            };
            reader.readAsDataURL(input.files[0]);
        }
    }
    // Los CHECK'S de departamento,grupo y sub-grupo de editar
    //id="UPCEdit" 
    //id="DepartamentoEdit"
    //id="GrupoEdit"
    //id="SubgrupoEdit"
    function CargarGruposEdit(Departamento)
    {
        $("#DepartamentoEdit").val(Departamento);
        $DepartamendoEdit=$("#DepartamentoEdit").val();
        $.ajax({
            url: './Ajax/Grupos/GetGruposSelectEdit.php',
            global: false,
            type: 'GET',
            data: {Departamento: Departamento },
            beforeSend: function (xhr) {
                xhr.overrideMimeType("text/plain; charset=utf-8");
            },
            success: function (data) {
                $(".GrupoEditContainer").html(data);
                $('#DepartamentoEdit').val(Departamento);
                $('#GrupoEdit').val("");
                $('#SubgrupoEdit').val("");
                $('.collapsible').collapsible('open', 2);
                $('.collapsible').collapsible('close', 3);
            }
        });
    }
    function CargarSubGrupoEdit(Grupo)
    {
        $("#GrupoEdit").val(Grupo);
        $GrupoEdit=$("#GrupoEdit").val();
        $.ajax({
            url: './Ajax/SubGrupos/GetSubGruposSelectEdit.php',
            global: false,
            type: 'GET',
            data: {Grupo: Grupo },
            beforeSend: function (xhr) {
                xhr.overrideMimeType("text/plain; charset=utf-8");
            },
            success: function (data) {
                $(".SubGrupoEditContainer").html(data);
                $('#GrupoEdit').val(Grupo);
                $('#SubgrupoEdit').val("");
                $('.collapsible').collapsible('open', 3);
                $('.collapsible').collapsible('close', 4);
            }
        });
    }
    function SubGrupoEdit(Subgrupo)
    {
        $("#SubgrupoEdit").val(Subgrupo);
        $('.collapsible').collapsible('close', 4);
    }
    function MostrarDepartamentos()
    {
        $("#DepartamentoMainContainer").show();
        $("#MainContainer").hide();
        $(".DatosAdicionalesContainer").hide(); 
    }    