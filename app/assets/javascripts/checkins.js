$("document").ready(function() {
  if( $("body#checkins").length > 0 ){
    $('#hidden_home').click(function(){
       window.location.href='/admin';
    });
  };
});