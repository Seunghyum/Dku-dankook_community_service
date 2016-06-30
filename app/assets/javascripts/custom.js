$(document).ready(function(){
    //태그 입력
	$("#tag-input").tagit({
		placeholderText: '태그를 입력해주세요'
	});

	//Star Rating
    $(function() {
    	$('.star-rating').barrating({
          theme: 'fontawesome-stars'
        });
    });

    //comment toggle
    $('.edit-toggle').click(function(){
        var toggle = "#" + $(this).data('edit');
        if( $(toggle).is(':hidden') ){
            $(toggle).slideDown();
        } else {
            $(toggle).slideUp();
        }
    });
});
