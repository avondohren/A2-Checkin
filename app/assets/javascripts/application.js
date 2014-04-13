// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require jquery.ui.accordion
//= require jquery.ui.datepicker
//= require jquery.maskedinput.js
//= require jquery.sparkline.js
//= require_tree .

$("document").ready(function() {
  jQuery(function($){
    $(".phone").mask("999-999-9999");
    $(".date").mask("9999/99/99");
  });
  
  setTimeout(function(){
      $("#flash").fadeTo("slow",0);
  },3000);
  
  $( ".accordion" ).accordion({ heightStyle: "content" });
  $( ".datepicker" ).datepicker({ dateFormat: "yy-mm-dd"});
  
  $('#submit').on('click', function(event){
    $(this).closest('form').submit();
    event.preventDefault();
  });
  
  $('#hidden_home').click(function(){
     window.location.href='/admin';
  })
});

