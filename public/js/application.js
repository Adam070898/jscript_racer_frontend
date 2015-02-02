var pCount = 0
var qCount = 0
function reset() {
  pCount = 0
  qCount = 0
}
$( 'document' ).ready(function(){
  $( 'body' ).keyup(function() {
    if (event.which === 80) {
      $('tr:nth-child(2) td:nth-child(' + pCount + ')').removeClass('active');
      pCount++;
      $('tr:nth-child(2) td:nth-child(' + pCount + ')').addClass('active');
    }
    if (event.which === 81) {
      $('tr:nth-child(4) td:nth-child(' + qCount + ')').removeClass('active');
      qCount++;
      $('tr:nth-child(4) td:nth-child(' + qCount + ')').addClass('active');
    }
    if (pCount === 15) {
      window.location = "/p1win";
    }
    if (qCount === 15) {
      window.location = "/p2win";
    }
  });
});