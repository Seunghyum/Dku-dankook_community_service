//= require moment
//= require rails-timeago
//= require locales/jquery.timeago.ko.js
//= require jquery-ui-timepicker-addon
//= require tether
//= require bootstrap
//= require bootstrap-datetimepicker
//= require jquery-bar-rating
//= require tag-it
//= require_tree ./js
//= require_tree ./plugins/backstrech
//= require_tree ./plugins/countdown
//= require_tree ./plugins/jquery
//= require_tree ./plugins/ladda_btn
//= require_tree ./plugins/scrollbar
//= require_tree ./plugins/wow-animations
//= require ./plugins/fullscreen
//= require ./plugins/back-to-top
//= require comment_edit
//= require image-picker
//= require redactor
//= require redactor/fontcolor
//= require redactor/fontsize
//= require redactor/fontfamily
//= require redactor/textdirection
//= require config1
//= require redactor/langs/ko
//= require search_origin
//= require custom
//= require 'greensock/TweenLite'
//= require 'greensock/easing/EasePack'
//= require 'greensock/jquery.gsap.js'
//= require TweenMax
//= require toy1

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
