<main>
<div class="container main">
    <div class="row">
        <div class="col s12 m3">
            <a href="#" class="waves-effect waves-light btn StellarBlue radius" id="nuevo">Nuevos</a>
        </div>
        <div class="col s0 m4"></div>
        <div class="col s12 m5">
            <div class="input-field">
                <input id="searchUsuarios" type="search" required>
                <label class="label-icon" for="search"><i class="material-icons">search</i></label>
                <i class="material-icons">close</i>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-12" id="users-container">
            

        </div>
    </div>
</div>
</main>
<div id="modal-Usuario" class="modal container-fluid modal-fixed-footer">
    <div class="modal-content" id="modal-clientes-datos">
    </div>
    <div class="modal-footer">
        <a href="#!" class="modal-action modal-close waves-effect waves-green btn-flat">Cerrar</a>
    </div>
</div>



<div id="modal-Actualizar" class="modal container-fluid modal-fixed-footer">
    <div class="modal-content" id="modal-clientes-datos">
    </div>
    <div class="modal-footer">
        <a href="#!" class="modal-action modal-close waves-effect waves-green btn-flat">Cerrar</a>
    </div>
</div>



<div id="modal-EliminarUsuario" class="modal container-fluid">
 
 </div>
<script src="<?php echo base_url(); ?>js/admin/users.js"></script>