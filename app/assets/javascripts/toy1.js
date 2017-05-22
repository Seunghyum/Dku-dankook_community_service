
  $(function() {
    var dur = 3;

    // functions
    function getMousePos(event) {
    	return [event.pageX, event.pageY]
    }
    // end:functions

    // events
    $(document).mousemove(function(e) {
  		var mousePos = getMousePos(e)
  		TweenMax.to($('.inner'), dur, {left: mousePos[0], top: mousePos[1]}); //, physics2D:{velocity:300, gravity: 300, xProp:"left", yProp:"top"}});
    })
    // end:events
  })
