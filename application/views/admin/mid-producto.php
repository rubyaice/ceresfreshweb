<main>
    <div class="container main">
        <section id="CodeContainer">
            <div class="row">
                <div class="col m1 s2 right">
                    <a href="./inventario.php" class="btn-floating btn-large waves-effect waves-light red pointer"><i onclick="" class="material-icons">home</i></a>
                </div>
            </div>
            <div class="row" >
                <div class="col s12 m6">
                    <div class="input-field">
                        <input id="CodigoUPC" type="text">
                        <label for="CodigoUPC">Codigo UPC</label>
                    </div>
                </div>
                <div class="col s12 m6">
                    <h6>Ingresar el codigo UPC del su producto</h6>
                    <h6>validaremos que este no exista antes de agregarlo</h6>
                </div>
            </div>
            <div class="SectionAgregar">
                
            </div>
        </section>
            
        <div class="row" ID="DepartamentoMainContainer">
            <div class="row">
                <div class="col m1 s2 right">
                    <a href="./producto.php" class="btn-floating btn-large waves-effect waves-light red pointer"><i onclick="" class="material-icons">home</i></a>
                </div>
            </div>
            <div class="col s12 m6">
                <h4>Seleccione un departamento</h4>
            </div>
            <div class="col s12 m6">
                <div class="input-field">
                    <input id="search" type="search" required>
                    <label class="label-icon" for="search"><i class="material-icons">search</i></label>
                    <i class="material-icons">close</i>
                </div>
            </div>
            <div id="SelectDepartamento">

            </div>
        </div>
        <!--<div class="row" id="GruposMainContainer">
            <div id="SelecGrupo">

            </div>
        </div>
        <div class="row" id="SubGrupoMainContainer">
            <div id="SelectSubGrupo">

            </div>
        </div> !-->
        <form action="Ajax/Products/AgregarProductoNuevo.php" method="post" enctype="multipart/form-data">
            <input type="hidden" id="UPC" name="UPC" value=""></input>
            <input type="hidden" id="Departamento" name="Departamento" value=""></input>
            <input type="hidden" id="Grupo" name="Grupo" value=""></input>
            <input type="hidden" id="Subgrupo" name="Subgrupo" value=""></input>
            <!--   INICIO DE LOS DATOS DE LA FICHA DE PRODUCTOS   !-->
            <div class="row" id="MainContainer">
                <div class="row">
                    <div class="col m11 s10">
                        <h4>Datos del producto</h4>
                    </div>
                    <div class="col m1 s2 right">
                        <a class="btn-floating btn-large waves-effect waves-light red pointer"><i onclick="MostrarDepartamentos()" class="material-icons">home</i></a>
                    </div>
                </div>
                
                <div class="datosleft col s12 m6">
                    <div class="input-field">
                        <input id="Nombre" required name="Nombre" type="text" class="validate">
                        <label for="Nombre">Nombre</label>
                    </div>
                    <div class="input-field">
                        <input id="Marca"  type="text" name="Marca" class="">
                        <label for="Marca">Marca</label>
                    </div>
                    <div class="input-field">
                        <input id="Modelo"  type="text" name="Modelo" class="">
                        <label for="Modelo">Modelo</label>
                    </div>
                </div>
                <div class="datosright col s12 m6">
                    
                    <div class="input-field">
                        <textarea id="textarea1" class="materialize-textarea" name="Descripcion"></textarea>
                        <label for="textarea1">Descripción</label>
                    </div>
                </div>
            </div>
            <div class="row DatosAdicionalesContainer">
                <ul class="collapsible expandable">
                    <li>
                        <div class="collapsible-header"><i class="material-icons">image</i>Imagenes</div>
                            <div class="collapsible-body">
                                <div class="row">
                                    <span>Seleccione un conjunto de imágenes para la publicación</span>
                                </div>
                                
                                <div class="row">
                                    <!-- IMG MAIN !-->
                                    <div class="col s12 m6">
                                        <img id="imgmain" class="responsive-img" style="height: 300px;" src="./img/no-image.png"/>
                                        <div class="file-field input-field">
                                            <div class="btn grey darken-3">
                                                <span>Subir</span>
                                                <input id="InputFileMain" name="InputFileMain" type="file" onchange="readURL(this,0);" accept="image/jpg">
                                            </div>
                                            <div class="file-path-wrapper">
                                                <input class="file-path validate" type="text">
                                            </div>
                                        </div>
                                    </div>
                                    <!-- IMG SEGUNDAS !-->
                                    <div class="col s12 m6">
                                        <div class="row">
                                            <div class="col s12 m6">
                                                <img id="img1" class="responsive-img" style="height: 100px;" src="./img/no-image.png"/>
                                                <div class="file-field input-field">
                                                    <div class="btn grey darken-3">
                                                        <span>Subir</span>
                                                        <input "InputFile1" name="InputFile1" type="file" onchange="readURL(this,1);" accept="image/jpg">
                                                    </div>
                                                    <div class="file-path-wrapper">
                                                        <input class="file-path validate" type="text">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col s12 m6">
                                                <img id="img2" class="responsive-img" style="height: 100px;" src="./img/no-image.png"/>
                                                <div class="file-field input-field">
                                                    <div class="btn grey darken-3">
                                                        <span>Subir</span>
                                                        <input "InputFile2" type="file" name="InputFile2" onchange="readURL(this,2);" accept="image/jpg">
                                                    </div>
                                                    <div class="file-path-wrapper">
                                                        <input class="file-path validate" type="text">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col s12 m6">
                                                <img id="img3" class="responsive-img" style="height: 100px;" src="./img/no-image.png"/>
                                                <div class="file-field input-field">
                                                    <div class="btn grey darken-3">
                                                        <span>Subir</span>
                                                        <input "InputFile3" type="file" name="InputFile3" onchange="readURL(this,3);" accept=".jpg">
                                                    </div>
                                                    <div class="file-path-wrapper">
                                                        <input class="file-path validate" type="text">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col s12 m6">
                                                <img id="img4" class="responsive-img" style="height: 100px;" src="./img/no-image.png"/>
                                                <div class="file-field input-field">
                                                    <div class="btn grey darken-3">
                                                        <span>Subir</span>
                                                        <input "InputFile4" name="InputFile4" type="file" onchange="readURL(this,4);" accept="image/jpg">
                                                    </div>
                                                    <div class="file-path-wrapper">
                                                        <input class="file-path validate" type="text">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                    </li>
                    <!--<li>
                        <div class="collapsible-header"><i class="material-icons">zoom_out_map</i>Dimensiones</div>
                        <div class="collapsible-body">
                            <span>Registre las dimensiones y peso del articulo</span>
                            <div class="row">
                                <div class="col s12 m6">
                                    <div class="input-field">
                                        <input id="Peso" name="Peso" type="text">
                                        <label for="Peso">Peso</label>
                                    </div>
                                    <div class="input-field">
                                        <input id="Volumen" name="Volumen" type="text">
                                        <label for="Volumen">Volumen</label>
                                    </div>
                                </div>
                                <div class="col s12 m6">
                                    <div class="input-field">
                                        <input id="Alto" name="Alto" type="text">
                                        <label for="Alto">Alto</label>
                                    </div>
                                    <div class="input-field">
                                        <input id="Ancho" name="Ancho" type="text">
                                        <label for="Ancho">Ancho</label>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </li>-->
                    
                </ul>
                <button class="btn blue" id="Nuevo" type="submit">Agregar</button>         
            </div>
        </form>
    </div>

        <!--public $Code;
        public $Name;
        public $Description;
        public $BarCode;
        public $Precio;
        public $Impuesto1;
        public $Impuesto2;
        public $Impuesto3;
        public $Departamento;
        public $Grupo;
        public $SubGrupo;
        public $CantidadDisponible;
        public $Image;
        public $Stars;
        public $CountStars;
        public $TipoPeso;
        public $CANT_DECIMALES;
        public $BusinessPrice; !-->

    <div class="main container edit" id="EditContainer">
        <div class="row" > 
        
        <div class="col s11"> </div>
        <div class="col s1">
                    <a href="./Inventario.php" id="back" class="btn-floating btn-large waves-effect waves-light red pointer back"><i onclick="" class="material-icons">arrow_back</i></a>
                </div>
        </div>
        <form action="Ajax/Products/ActualizarProducto.php" method="post" enctype="multipart/form-data">
            <input type="hidden" id="UPCEdit" name="Codigo" value="<?php echo $ProductClass->Code ?>">
            <input type="hidden" id="DepartamentoEdit" name="Departamento" value="<?php echo $Departamento ?>">
            <input type="hidden" id="GrupoEdit" name="Grupo" value="<?php echo $Grupo ?>">
            <input type="hidden" id="SubgrupoEdit" name="Subgrupo" value="<?php echo $SubGrupo ?>">
            <!--   INICIO DE LOS DATOS DE LA FICHA DE PRODUCTOS   !-->
            
            <div class="row" id="MainContainer">
               
                <div class="datosleft col s12 m6">
                    <div class="input-field">
                        <input id="Codigo" value="<?php echo $Code ?>" disabled type="text" name="Codigo" class="">
                        <label for="Codigo">Código</label>
                    </div>
                    <div class="input-field">
                        <input id="NombreEdit" value="<?php echo $Name ?>" required name="Nombre" type="text" class="validate">
                        <label for="NombreEdit">Nombre</label>
                    </div>
                 
                    
                </div>
                <div class="datosright col s12 m6">
                <div class="input-field">
                        <input id="CodigoBarra" value="<?php echo $BarCode  ?>" type="text" disabled name="CodigoBarra" class="">
                        <label for="CodigoBarra">Código de Barra</label>
                    </div>
                <div class="input-field">
                        <input id="Precio" value="<?php echo $preConIVA  ?>" type="text" disabled name="Precio" class="">
                        <label for="Precio">Precio del Producto</label>
                    </div>
                </div>
            </div>
            <div class="row DatosAdicionalesContainerEdit">
                <ul class="collapsible expandable">
                    <li>
                        <div class="collapsible-header"><i class="material-icons">image</i>Imágenes</div>
                            <div class="collapsible-body">
                                <div class="row">
                                    <span>Seleccione un conjunto de imágenes para la publicación</span>
                                </div>
                                
                                <div class="row">
            <!-- IMG MAIN !-->
                                    <div class="col s12 m6">
                                        <img class="responsive-img" id="imgmainEdit" style="height: 300px;" src="<?php echo $Imagen ?>"/>
                                        <div class="file-field input-field">
                                            <div class="btn grey darken-3">
                                                <span>Subir</span>
                                                <input id="InputFileMainEdit"  name="InputFileMain" type="file" onchange="readURL(this,5);" accept="image/jpg">
                                            </div>
                                            <div class="file-path-wrapper">
                                                <input class="file-path validate" type="text">
                                            </div>
                                        </div>
                                    </div>
            <!-- IMG SEGUNDAS !-->
                                    <div class="col s12 m6">
                                        <div class="row">
                                            <div class="col s12 m6">
                                                <img class="responsive-img" id="img1Edit" style="height: 100px;" src="<?php echo $Imagen1 ?>"/>
                                                <div class="file-field input-field">
                                                    <div class="btn grey darken-3">
                                                        <span>Subir</span>
                                                        <input "InputFile1Edit" name="InputFile1" type="file" onchange="readURL(this,6);" accept="image/jpg">
                                                    </div>
                                                    <div class="file-path-wrapper">
                                                        <input class="file-path validate" type="text">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col s12 m6">
                                                <img class="responsive-img" id="img2Edit" style="height: 100px;" src="<?php echo $Imagen2 ?>"/>
                                                <div class="file-field input-field">
                                                    <div class="btn grey darken-3">
                                                        <span>Subir</span>
                                                        <input "InputFile2Edit" type="file" name="InputFile2" onchange="readURL(this,7);" accept="image/jpg">
                                                    </div>
                                                    <div class="file-path-wrapper">
                                                        <input class="file-path validate" type="text">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col s12 m6">
                                                <img class="responsive-img" id="img3Edit" style="height: 100px;" src="<?php echo $Imagen3 ?>"/>
                                                <div class="file-field input-field">
                                                    <div class="btn grey darken-3">
                                                        <span>Subir</span>
                                                        <input "InputFile3Edit" type="file" name="InputFile3" onchange="readURL(this,8);" accept=".jpg">
                                                    </div>
                                                    <div class="file-path-wrapper">
                                                        <input class="file-path validate" type="text">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col s12 m6">
                                                <img class="responsive-img" id="img4Edit" style="height: 100px;" src="<?php echo $Imagen4 ?>"/>
                                                <div class="file-field input-field">
                                                    <div class="btn grey darken-3">
                                                        <span>Subir</span>
                                                        <input "InputFile4Edit" name="InputFile4" type="file" onchange="readURL(this,9);" accept="image/jpg">
                                                    </div>
                                                    <div class="file-path-wrapper">
                                                        <input class="file-path validate" type="text">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                    </li>
                    <!--<li>
                        <div class="collapsible-header"><i class="material-icons">zoom_out_map</i>Dimensiones</div>
                        <div class="collapsible-body">
                            <span>Registre las dimensiones y peso del articulo</span>
                            <div class="row">
                                <div class="col s12 m6">
                                    <div class="input-field">
                                        <input id="PesoEdit" name="Peso" type="text">
                                        <label for="PesoEdit">Peso</label>
                                    </div>
                                    <div class="input-field">
                                        <input id="VolumenEdit" name="Volumen" type="text">
                                        <label for="VolumenEdit">Volumen</label>
                                    </div>
                                </div>
                                <div class="col s12 m6">
                                    <div class="input-field">
                                        <input id="AltoEdit" name="Alto" type="text">
                                        <label for="AltoEdit">Alto</label>
                                    </div>
                                    <div class="input-field">
                                        <input id="AnchoEdit" name="Ancho" type="text">
                                        <label for="AnchoEdit">Ancho</label>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </li>-->
                    <li>
                        <div class="collapsible-header"><i class="material-icons">filter_1</i>Departamento</div>
                        <div class="collapsible-body">
                            <div class="row">
                                <h5 class="col s12 m6">Selección de departamento</h5>
                                <div class="input-field col s12 m6">
                                    <input id="searchDepartamentoEdit" type="search">
                                    <label class="label-icon" for="searchDepartamentoEdit"><i class="material-icons">search</i></label>
                                    <i class="material-icons">close</i>
                                </div>
                            </div>
                            <div class="row">
                                <h6>Valor Actual: <strong><?php echo $DepartamentoDescripcion ?></strong></h6>
                            </div>
                            <div class="row DepartamentoEditContainer">
                                <table>
                                    <tr>
                                        <td>Departamento 1</td>
                                        <td class="right"><i class="DepartamentosCheck material-icons pointer" Did="" onclick="CargarGrupos('')">check</i>      </td>
                                    </tr>
                                    <tr>
                                        <td>Departamento 1</td>
                                        <td class="right"><i class="DepartamentosCheck material-icons pointer" Did="" onclick="CargarGrupos('')">check</i>      </td>
                                    </tr>
                                    <tr>
                                        <td>Departamento 1</td>
                                        <td class="right"><i class="DepartamentosCheck material-icons pointer" Did="" onclick="CargarGrupos('')">check</i>      </td>
                                    </tr>
                                    <tr>
                                        <td>Departamento 1</td>
                                        <td class="right"><i class="DepartamentosCheck material-icons pointer" Did="" onclick="CargarGrupos('')">check</i>      </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="collapsible-header"><i class="material-icons">filter_2</i>Grupo</div>
                        <div class="collapsible-body">
                            <div class="row">
                                <h5 class="col s12 m6">Seleccione un grupo</h5>
                                <div class="input-field col s12 m6">
                                    <input id="searchGrupoEdit" type="search">
                                    <label class="label-icon" for="searchGrupoEdit"><i class="material-icons">search</i></label>
                                    <i class="material-icons">close</i>
                                </div>
                            </div>
                            <div class="row">
                                <h6>Valor Actual: <strong><?php echo $GruposDescripcion ?></strong></h6>
                            </div>
                            <div class="row GrupoEditContainer">
                                <table>
                                    <tr>
                                        <td>Grupo 1</td>
                                        <td class="right"><i class="DepartamentosCheck material-icons pointer" Did="" onclick="CargarGrupos('')">check</i>      </td>
                                    </tr>
                                    <tr>
                                        <td>Grupo 1</td>
                                        <td class="right"><i class="DepartamentosCheck material-icons pointer" Did="" onclick="CargarGrupos('')">check</i>      </td>
                                    </tr>
                                    <tr>
                                        <td>Grupo 1</td>
                                        <td class="right"><i class="DepartamentosCheck material-icons pointer" Did="" onclick="CargarGrupos('')">check</i>      </td>
                                    </tr>
                                    <tr>
                                        <td>Grupo 1</td>
                                        <td class="right"><i class="DepartamentosCheck material-icons pointer" Did="" onclick="CargarGrupos('')">check</i>      </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="collapsible-header"><i class="material-icons">filter_3</i>Sub-Grupo</div>
                        <div class="collapsible-body">
                            <div class="row">
                                <h5 class="col s12 m6">Seleccione un Subgrupo</h5>
                                <div class="input-field col s12 m6">
                                    <input id="searchSubgrupoEdit" type="search">
                                    <label class="label-icon" for="searchSubgrupoEdit"><i class="material-icons">search</i></label>
                                    <i class="material-icons">close</i>
                                </div>
                            </div>
                            <div class="row">
                                <h6>Valor Actual: <strong><?php echo $SubGrupoDescripcion ?></strong></h6>
                            </div>
                            <div class="row SubGrupoEditContainer">
                                <table>
                                    <tr>
                                        <td>Sub-Grupo 1</td>
                                        <td class="right"><i class="DepartamentosCheck material-icons pointer" Did="" onclick="CargarGrupos('')">check</i>      </td>
                                    </tr>
                                    <tr>
                                        <td>Sub-Grupo 1</td>
                                        <td class="right"><i class="DepartamentosCheck material-icons pointer" Did="" onclick="CargarGrupos('')">check</i>      </td>
                                    </tr>
                                    <tr>
                                        <td>Sub-Grupo 1</td>
                                        <td class="right"><i class="DepartamentosCheck material-icons pointer" Did="" onclick="CargarGrupos('')">check</i>      </td>
                                    </tr>
                                    <tr>
                                        <td>Sub-Grupo 1</td>
                                        <td class="right"><i class="DepartamentosCheck material-icons pointer" Did="" onclick="CargarGrupos('')">check</i>      </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </li>
                </ul>
                <button class="btn blue right" id="Actualizar" type="submit">Grabar</button>         
            </div>
        </form>
    </div>

</main>
    <script src="./js/products.js"></script>