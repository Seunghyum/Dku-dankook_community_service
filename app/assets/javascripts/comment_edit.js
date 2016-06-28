$(document).ready(function(){
  $('.edit-toggle').click(function(){
    var toggle = "#" + $(this).data('edit');
    if( $(toggle).is(':hidden') ){
        $(toggle).slideDown();
    } else {
        $(toggle).slideUp();
    }
  });
});
