//= require active_admin/base
//= require jquery-ui
//= require jquery-ui-timepicker-addon

$(document).ready(function(){
  $( function() {
    $( ".datepicker" ).datepicker();
  } );
  $('input.hasDatetimePicker').datetimepicker({
    dateFormat: "dd/mm/yy",
    beforeShow: function () {
      setTimeout(
        function () {
          $('#ui-datepicker-div').css("z-index", "3000");
        }, 100
      );
    }
  });
});
