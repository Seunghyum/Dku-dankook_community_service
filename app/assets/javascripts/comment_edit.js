$(document).ready(function(){
  function commentEdit(){
    $('.edit-toggle').click(function(e){
      e.preventDefault();
      var toggle = "#" + $(this).data('edit');
      if( $(toggle).is(':hidden') ){
          $(toggle).slideDown();
      } else {
          $(toggle).slideUp();
      }
    });
  }
});
