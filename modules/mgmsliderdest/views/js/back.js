$(document).ready(function(){
$('.mgmd_delete').on('click',function(){
    if(!confirm('¿seguro desea eliminar este registro?')){
      return false;
    }
    $('#id_delete').val($(this).data('id'));
    $('#form_delete').submit();
  });
});