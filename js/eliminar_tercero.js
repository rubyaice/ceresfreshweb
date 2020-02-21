var id_afi = 0;
var correo_afiliado = "";

function abrirModal(id_afiliado, correo_afi) {
  

    id_afi = id_afiliado;
    correo_afiliado = correo_afi;

    var html = document.getElementById('modal');
    var modal = '<div class="modal fade" id="modalEliminar" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">'+'<div class="modal-dialog" role="document">'+'<div class="modal-content">'+'<div class="modal-header">'+'<h5 class="modal-title" id="exampleModalLabel">Eliminar Afiliado</h5>'+'<button type="button" class="close" data-dismiss="modal" aria-label="Close">'+'<span aria-hidden="true">&times;</span>'+'</button>'+'</div>'+'<div class="modal-body">'+'¿Está Seguro que desea <b>Eliminar</b> a este Afiliado?'+'</div>'+'<div class="modal-footer">'+'<button style="background: #293238; color:white" type="button" class="btn " data-dismiss="modal">Cancelar</button>'+'<button style="background: #293238; color:white" type="button" onclick="eliminarAfiliadoTercero()" class="btn ">Aceptar</button>'+'</div>'+'</div>'+'</div>';

    html.innerHTML = modal;

}

function eliminarAfiliadoTercero(){
  

  var id_afiliado = id_afi;
  var correo_del_afiliado = correo_afiliado;
  //var alimento = document.getElementById('alimento');
  //var medida_practica = document.getElementById('medida_practica');
  //var medida_practica_cant = document.getElementById('medida_practica_cant');

  $.ajax({

       url: base_url+"index.php/afiliadoscontrol/eliminar_afiliado",
       type: 'POST',
       global: false,
       data: {
         id_afiliado: id_afiliado,
         correo_del_afiliado: correo_del_afiliado
        },
       beforeSend: function (xhr) {
           xhr.overrideMimeType("text/plain; charset=utf-8");
       },
       success: function (data) {

         var $Obj=$.parseJSON(data);
          //$Obj=$.parseJSON(data);
          location.reload();
          //var respuesta_aliento = $Code=$Obj['respuesta'];
          //var respuesta_medida_practica = $Code=$Obj['respuesta_medida_practica']+"<br>";
          //var respuesta_medida_practica_cant = $Code=$Obj['respuesta_medida_practica_cant']+"<br>";

          //alimento.innerHTML = respuesta_aliento;
          //medida_practica.innerHTML = respuesta_medida_practica;
          //medida_practica_cant.innerHTML = respuesta_medida_practica_cant;
       }
   });
}
