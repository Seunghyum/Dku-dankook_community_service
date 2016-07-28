// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery2
//= require jquery_ujs
//= require jquery-ui
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
//= require redactor1
//= require redactor/fontcolor
//= require redactor/fontsize
//= require redactor/fontfamily
//= require redactor/textdirection
//= require config1
//= require redactor/langs/ko
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
  $("#owl-example").owlCarousel({
    navigation : false, // Show next and prev buttons
    slideSpeed : 300,
    paginationSpeed : 400,
    singleItem:true,
    autoPlay: 4000
    // "singleItem:true" is a shortcut for:
    // items : 1,
    // itemsDesktop : false,
    // itemsDesktopSmall : false,
    // itemsTablet: false,
    // itemsMobile : false
  });
});
