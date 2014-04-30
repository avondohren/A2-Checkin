$("document").ready(function() {
  if( $("body#families").length > 0 ){
    $('form').keypress(function(e){
      if(e.which == 13){
         $(this).submit();
      }
    })
  }
});