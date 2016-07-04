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

    App.init();
    App.initScrollBar();


    // lecture_infos index 페이지 순위 배너
    $(function(){
        $('#vertical_banner').vTicker({
            // 스크롤 속도(default: 700)
            speed: 500,
            // 스크롤 사이의 대기시간(default: 4000)
            pause: 1000,
            // 스크롤 애니메이션
            animation: 'fade',
            // 마우스 over 일때 멈출 설정
            mousePause: false,
            // 한번에 보일 리스트수(default: 2)
            showItems: 4,
            // 스크롤 컨테이너 높이(default: 0)
            height: 0,
            // 아이템이 움직이는 방향, up/down (default: up)
            direction: 'up'
        });
    });
});
