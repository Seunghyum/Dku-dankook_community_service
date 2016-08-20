//= require jquery-ui-timepicker-addon
//= require tether
//= require bootstrap-sprockets
//= require moment
//= require bootstrap-datetimepicker
//= require jquery-bar-rating
//= require rails-timeago
//= require locales/jquery.timeago.ko.js
//= require tag-it
//= require Chart
//= require comment_edit
//= require_tree ./js
//= require_tree ./plugins
//= require image-picker
//= require redactor1
//= require redactor/fontcolor
//= require redactor/fontsize
//= require redactor/fontfamily
//= require redactor/textdirection
//= require config1
//= require redactor/langs/ko
//= require pagination_n_filter
//= require custom

$(document).ready(function(){
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
