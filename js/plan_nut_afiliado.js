
function tipo_funt_alimento (id){

      var tipo_alimento = id;
      var alimento = document.getElementById('alimento');
      //var medida_practica = document.getElementById('medida_practica');
      //var medida_practica_cant = document.getElementById('medida_practica_cant');

      var id_afiliado = document.getElementById('id_afiliado').value;

      $.ajax({

           url: base_url+"index.php/Afiliadoscontrol/alimentos_detalles_afiliado",
           type: 'POST',
           global: false,
           data: {tipo_alimento: tipo_alimento, id_afiliado: id_afiliado},
           beforeSend: function (xhr) {
               xhr.overrideMimeType("text/plain; charset=utf-8");

               //mientras carga es sustituido por el spinner
               alimento.innerHTML = '<div class="text-center"><div class="spinner-border text-success" role="status"><span class="sr-only">Loading...</span></div></div>';
           },
           success: function (data) {

             var $Obj=$.parseJSON(data);
              //$Obj=$.parseJSON(data);

              var respuesta_aliento = $Code=$Obj['alimentos'];
              //var respuesta_medida_practica = $Code=$Obj['respuesta_medida_practica']+"<br>";
              //var respuesta_medida_practica_cant = $Code=$Obj['respuesta_medida_practica_cant']+"<br>";

              alimento.innerHTML = respuesta_aliento;
              //medida_practica.innerHTML = respuesta_medida_practica;
              //medida_practica_cant.innerHTML = respuesta_medida_practica_cant;
           }
       });


    }
