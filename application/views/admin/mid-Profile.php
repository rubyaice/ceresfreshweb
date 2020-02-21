<main>
<div class="container main">
    <div class="row">
    
        <div class="col s8 m10">
            <h4>Cambiar contraseña</h4>
        </div>
        <div class="col s4 m2">
            <!--<a href="#" id="back" class="btn-floating btn-large waves-effect waves-light red pointer back"><i onclick="" class="material-icons">home</i></a>!-->
        </div>

        <div class="col s12 m6">
            <div class="input-field">
                <input id="passwordr" value="" required name="passwordr" type="password" class="validate">
                <label for="passwordr">Contraseña</label>
            </div>
            <div class="input-field">
                <input id="passwordr2" value="" type="password" name="passwordr2" class="validate">
                <label for="passwordr2">Repita Contraseña</label>
            </div>
        </div>
    </div>
    <div class="row">
    
        <br>
        <div class="col s12 m3">
            <a href="#" class="waves-effect StellarBlue radius waves-light btn" id="Cambiar">Cambiar</a>
        </div>
    </div>
</div>
</main>
<div id="modal-events" class="modal container-fluid modal-fixed-footer">
    <div class="modal-content" id="modal-events-datos">
    </div>
    <div class="modal-footer">
        <a href="#!" class="modal-action modal-close waves-effect waves-green btn-flat">Cerrar</a>
    </div>
</div>
<script src="<?php echo base_url(); ?>js/admin/profile.js"></script>