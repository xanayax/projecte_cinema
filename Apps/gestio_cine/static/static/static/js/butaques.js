// funció perquè no deixi trair cap butaca
$(document).ready(function () {
    $('#selectBtn').click(function() {
      checked = $("input[type=checkbox]:checked").length;

      if(!checked) {
        alert("Selecciona almenys una butaca.");
        return false;
      }

    });
});