<main>

<div class="container main">


     <div class="row"> 
       
        <div class="row">
        <div class="col m2 s2 chip  StellarBlue FontWhite z-depth-1"  id="clickeable" onclick="location.href='./inventario.php';" style="cursor:pointer">
                    <img  src="./img/icono_inventario.svg" alt="Contact Person">
                    Productos
                </div>
               
                <div class="col  m3 s3 chip FontBlack z-depth-1"  id="clickeable" onclick="location.href='productos-temporada.php';"  style="cursor:pointer">
                    <img  src="./img/icono_inventario.svg" alt="Contact Person">
                   Productos de Temporada
                </div>
                <div class="col m5 s5"> </div>
                <div class="col m1 s1">
                    <a href="./index.php" class="btn-floating btn-large waves-effect waves-light red pointer"><i onclick="" class="material-icons">home</i></a>
                </div>
        </div>    
    <div class="row">

        <div class="col s12 m5">
            <div class="input-field">
                <input id="searchProduct" type="search" required>
                <label class="label-icon" for="search"><i class="material-icons">search</i></label>
                <i class="material-icons">close</i>
            </div>
        </div>
        <div class="col s12 m6">
            
        </div>
     
    </div>
    <div class="row">
        <div class="col-12" id="producto-container">
            

        </div>
    </div>
</div>
</main>
<script src="./js/invetory.js"></script>
<style>
    .Pager{
    display: inline-block;
    padding-left: 0;
    margin: 20px 0;
    border-radius: 4px;
    }
    .Pager .Siguiente{
    border-top-right-radius: 4px;
    border-bottom-right-radius: 4px;
    }
    .Pager .Anterior{
    margin-left: 0;
    border-top-left-radius: 4px;
    border-bottom-left-radius: 4px;
    }
    .Pager .Page{
    position: relative;
    display: inline-block;
    padding: 2px 8px;
    margin-left: -1px;
    line-height: 1.42857143;
    color: #52ca29;
    text-decoration: none;
    background-color: #ffffff;
    border: 1px solid #cfcfcf;
    }
    .Pager .Page:hover{
    z-index: 2;
    color: #52ca29;
    background-color: #cfcfcf;
    }
    .Pager .Page.Selected{
    background-color: #30aad7;
    Color: #535353;
    color: white;
    }
    </style>