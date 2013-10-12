$(document).ready(function() {
  var $active = $('.active');
  $('.hidden').hide();
 
  $(document).keyup(function(e) {
    if (e.keyCode == 37) {
      console.log('keyup');
      $active = $('.active').next();
      $active.prev().fadeOut();
      $active.fadeIn();
      $active.addClass('active');
      $active.removeClass('hidden');
      $active.prev().removeClass('active');
      $active.prev().addClass('hidden');
      $active.prev().appendTo('#slide_list');
    }
  });
 
});