<main>
    <div class="container main">
        
        <h5>Configuración de contactos.</h5>
        <br><br>
        
        <div class="row">

        <div class="col m12 s12">
          <h6>Los contactos aquí configurados son los que se reflejan en el área de contactos de la página principal.</h6>
          <br>
        </div>

        <div class="input-field col m6 s12">
            
            <input id="correoContacto" type="text" class="">
            <label id="correoContactoLabel" for="correoContacto" class="">Correo de Contacto</label>
        </div>

        <div class="input-field col m6 s12">
            
            <input id="numContacto" type="text" class="">
            <label id="numContactoLabel" for="numContacto" class="">Número de Contacto</label>
        </div>
        
        <div class="col m12 s12">
        <br>
        <button id="btnModificar" class="btn waves-effect waves-light" type="submit" name="action">Guardar
        <i class="material-icons right">save</i>
        </button>
        </div>

        </div>

    </div>
</main>

<div id="modal-fallo" class="modal container-fluid">
    <div class="modal-content">
        <p>Error al tratar de modificar, por favor intente más tarde.</p>
    </div>
    <div class="modal-footer">
        <a href="#!" class="modal-action modal-close waves-effect waves-green btn-flat">Cerrar</a>
    </div>
</div>

<script src="<?php echo base_url(); ?>js/admin/config_contacto.js"></script>