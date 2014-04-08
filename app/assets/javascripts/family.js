$("document").ready(function() {
  $('body#families form').on('click', '.remove_fields', function (event){
    $(this).prev('input[type=hidden]').val('1');
    $(this).closest('fieldset').hide();
    event.preventDefault();
  });

  $('body#families form').on('click', '.add_fields', function(event){
    time = new Date().getTime();
    regexp = new RegExp($(this).data('id'), 'g');
    $(this).before($(this).data('fields').replace(regexp, time));
    event.preventDefault();
  });
});