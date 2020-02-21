

<main>
    <div class="container main">
        
        <h5>Área de Modificación para tasa de cambio y precio de USD según planes nutricionales.</h5>
        <br><br>
        
        <div class="row">

        <div class="col m12 s12">
          <h6>Al momento de realizar una modificación en esta área por favor <b>No</b> utilice <b>[ . ]</b> o <b>[ , ]</b> para expresar cantidades.</h6>
        </div>
        
        <div class="input-field col m12 s12">
            <input id="inputMontoTaza" type="number" class="">
            <label id="labelMonto" for="inputMontoTaza" class="">Monto en Bs. (Tasa de cambio)</label>
        </div>  

        <div class="input-field col m6 s12">
            
            <input id="inputUSDDHM07" type="number" class="">
            <label id="labelUSDDHM07" for="inputUSDDHM07" class="">Monto en USD: Plan <span id="descripcionDHM07"></span></label>
        </div>

        <div class="input-field col m6 s12">
            
            <input id="inputUSDHMI03" type="number" class="">
            <label id="labelUSDHMI03" for="inputUSDHMI03" class="">Monto en USD: Plan <span id="descripcionHMI03"></span></label>
        </div>

        <div class="input-field col m6 s12">
            
            <input id="inputUSDHMJ04" type="number" class="">
            <label id="labelUSDHMJ04" for="inputUSDHMJ04" class="">Monto en USD: Plan <span id="descripcionHMJ04"></span></label>
        </div>

        <div class="input-field col m6 s12">
            
            <input id="inputUSDHSE05" type="number" class="">
            <label id="labelUSDHSE05" for="inputUSDHSE05" class="">Monto en USD: Plan <span id="descripcionHSE05"></span></label>
        </div>

        <div class="input-field col m6 s12">
            
            <input id="inputUSDMLE02" type="number" class="">
            <label id="labelUSDMLE02" for="inputUSDMLE02" class="">Monto en USD: Plan <span id="descripcionMLE02"></span></label>
        </div>

        <div class="input-field col m6 s12">
            
            <input id="inputUSDPPM01" type="number" class="">
            <label id="labelUSDPPM01" for="inputUSDPPM01" class="">Monto en USD: Plan <span id="descripcionPPM01"></span></label>
        </div>
        
        <div class="col m12 s12">
        <br>
        <button id="btnModificar" class="btn waves-effect waves-light" type="submit" name="action">Guardar
        <i class="material-icons right">attach_money</i>
        </button>
        </div>

        </div>

    </div>
</main>

<div id="modal-fallo" class="modal container-fluid">
    <div class="modal-content">
        <p>La modificación de la tasa de cambio a fallado por un Error inesperado.</p>
    </div>
    <div class="modal-footer">
        <a href="#!" class="modal-action modal-close waves-effect waves-green btn-flat">Cerrar</a>
    </div>
</div>

<script src="<?php echo base_url(); ?>js/admin/reglas.js"></script>