//= require jquery2
//= require jquery_ujs
//= require jquery-ui
//= require rails-timeago
//= require locales/jquery.timeago.ko.js

$(document).ready(function(){
  $(".clickable").click(function(){
    if($(this).hasClass("on")){
      alert("이미 신청하였습니다");
    } else {
      var lname = $(this).find(".name").text();
      var teacher = $(this).find(".teacher").text();
      var lnum = $(this).find(".lnum").text();
      var ldate = $(this).find(".ldate").text();
      var class_id = $(this).attr("id");
      alert(lname + " 수강신청이 완료되었습니다.");
      $("#sucess-list").prepend('<tr id="click_list' + class_id + '" data-untrid="' + class_id + '"><td scope="rowgroup" rowspan="2" class="bg_striped"><div class="f_r" id="div_btn" style="padding:3px 0px 3px 0px"><button type="button" id="potepolPopBtn" name="potepolPopBtn" class="btn btn_ctr delete_btn" data-userauth="true" data-enabled="true"><span class="btn_txt">삭제</span></button></div></td><td>죽전</td><td>' + lnum + '</td><td>2</td><td>' + lname  +  '</td><td>3</td><td>' + teacher + '</td><td></td></tr><tr id="untr-' + class_id + '"><th colspan="7"><div class="ta_l" style="margin-left: 20px;">' + ldate + '</div></th></tr>');
      $(this).addClass("on");
      deleteClick();
    }
  });

  function deleteClick() {
    $(".delete_btn").on("click", function(){
      var class_name = $(this).parent().parent().parent().attr('id');
      var data_id = $(this).parent().parent().parent().data('untrid');
      if (confirm('수강 신청을 취소하시겠습니까?')) {
        $("*[data-id='" + class_name + "']").removeClass("on");
        $("#" + class_name).remove();
        $("#untr-" + data_id).remove();
      }
    });
  }

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
