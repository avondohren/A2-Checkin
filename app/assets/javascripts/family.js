$("document").ready(function() {
  $('body#families form').on('click', '.remove_fields', function (event){
    $(this).prev('input[type=hidden]').val('1');
    $(this).parent().parent().hide();
    event.preventDefault();
  });

  $('body#families form').on('click', '.add_fields', function(event){
    time = new Date().getTime();
    regexp = new RegExp($(this).data('id'), 'g');
    $(this).parent().prev().append($(this).data('fields').replace(regexp, time));
    event.preventDefault();
  });
  
  $('a#next_fam').on('click', function(event){
    $("h3#family_info").click();
    event.preventDefault();
  });
  
  $('a#next_par').on('click', function(event){
    $("h3#parent_info").click();
    event.preventDefault();
  });
  
  $('a#next_kid').on('click', function(event){
    $("h3#child_info").click();
    event.preventDefault();
  });
});