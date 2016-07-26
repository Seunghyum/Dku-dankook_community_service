//= require jquery2
//= require jquery_ujs
//= require jquery-ui
//= require bootstrap-sprockets
//= require rails-timeago
//= require locales/jquery.timeago.ko.js
$(document).ready(function(){
//sns 공유하기
  Kakao.init('7e3aa98e684187d276527a58c44f3e36');

  var msg;
  var output;
  var urlName =  $(location).attr('hostname');

  var kakao_image = $('#kakao_image').attr("content");
  function kakaoToggle(e){
    Kakao.Link.sendTalkLink({
      label: e,
      image: {
        src: kakao_image,
        width: '300',
        height: '200'
      },
      webButton: {
        text: '응원메세지',
        url: urlName
      }
    });
  }

  $(".kakao-link-btn").click(function(){
    var msg = "#" + $(this).data("kakao");
    var output = $(msg).text();
    kakaoToggle(output);
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
    var output = $(msg).text();
    var page_url = window.location.href;
    var fimage
    FB.ui({
        method: 'share',
        href: page_url,
        name: '단국대 수강신청 리허설',
        caption: "Dku(디쿠)",
        description: "단국대 대표 웹서비스 - 멋쟁이사자처럼"
    });
  });

// 트위터
 $('.btn-tw').on('click', function(e) {
    e.preventDefault();
    var page_url = window.location.href;
    var url = "https://twitter.com/intent/tweet?text=" + "단국대 수강신청 리허설 - Dku(디쿠)" + "&url="+ page_url;
    window.open(url);
  });
});
