$(document).ready(function(){
    Kakao.init('7e3aa98e684187d276527a58c44f3e36');

    var msg;
    var output;
    var urlName =  $(location).attr('hostname');
    var page_url = window.location.href;
    var shareImage = $('#share_image').data("img");
    function kakaoToggle(){
      Kakao.Link.sendTalkLink({
        label: "단국대 커뮤니티 - (디쿠)",
        image: {
          src: page_url + shareImage,
          width: '100',
          height: '100'
        },
        webButton: {
          text: '디쿠',
          url: urlName
        }
      });
    }

    $(".kakao-link-btn").click(function(e){
      e.preventDefault();
      kakaoToggle();
    });

    // 페이스북
    (function(d, s, id) {
      var js, fjs = d.getElementsByTagName(s)[0];
      if (d.getElementById(id)) return;
      js = d.createElement(s); js.id = id;
      js.src = "//connect.facebook.net/ko_KR/sdk.js#xfbml=1&version=v2.6&appId=1286444708049122";
      fjs.parentNode.insertBefore(js, fjs);
    }(document, 'script', 'facebook-jssdk'));


    $('.fshare').click(function(){
      var msg = "#" + $(this).data("facebook");
      var output = $("#mttitle").attr("content");
      FB.ui({
          method: 'feed',
          name: '단국대 커뮤니티 - 디쿠',
          link: page_url,
          picture: shareImage,
          caption: '디쿠',
          description: output
      });
    });
// 트위터
   $('.btn-tw').on('click', function(e) {
      e.preventDefault();
      var message_id  = $(this).data("id");
      var message = $("#" + message_id).text();
      var url = "https://twitter.com/intent/tweet?text=" + message + "&url="+ page_url;
      window.open(url);
    });
});
