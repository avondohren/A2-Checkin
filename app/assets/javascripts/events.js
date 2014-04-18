$("document").ready(function() {
  if( $("body#events").length > 0 ){
    $('.inlinebar').sparkline('html', {type: 'bar', barColor: '#8B0000', barWidth: '30', height: '50'} );
  };
});