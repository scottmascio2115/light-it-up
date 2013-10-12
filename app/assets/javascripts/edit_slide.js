$(document).ready(function(){

  $(function() {
      $( ".draggable" ).draggable({ containment: "parent", grid: [ 20,20 ] }).resizable();
    });

  $('.save').on('click', function(e){
    e.preventDefault();
  });

});
