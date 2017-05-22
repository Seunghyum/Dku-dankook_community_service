
var fullscreenElement;
/* Open when someone clicks on the span element */
function openNav() {
    document.getElementById("myNav").style.width = "100%";
}

/* Close when someone clicks on the "x" symbol inside the overlay */
function closeNav() {
    document.getElementById("myNav").style.width = "0%";
}

$(document).ready(function(){
  $('#fullscreen').on('click', function(){
    if(fullscreenElement == null){
      launchIntoFullscreen(document.getElementById('lk-sublime'));
      $("#fullscreen").removeClass("badge-red").addClass("badge-orange").html("").html("<span aria-hidden='true' class='icon-size-actual'></span>")
    } else {
      exitFullscreen()
      $("#fullscreen").removeClass("badge-orange").addClass("badge-red").html("").html("<span aria-hidden='true' class='icon-size-fullscreen'></span>")
    }
  });
});
