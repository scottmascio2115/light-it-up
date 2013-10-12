$(document).ready(function() {
  var $active = $('#slide .active');
  $('.hidden').hide();
 
  $(document).keyup(function(e) {
    if (e.keyCode == 37) {
      $active = $('.slide').next();
      $active.show();
      $active.addClass('active');
      $active.removeClass('hidden');
      $active.prev().removeClass('active');
      $active.prev().addClass('hidden');
      $active.prev().hide();
    }
  });
 
});