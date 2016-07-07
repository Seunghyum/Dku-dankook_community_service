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
//= require bootstrap-sprockets
//= require rails-timeago
//= require locales/jquery.timeago.ko.js
$(document).ready(function(){  
  $("#click_list1").click(function(){
    alert("<멋쟁이 사자처럼> 수강신청이 완료되었습니다.");
    $("#sucess-list").prepend('<tr class="tr-1"><td scope="rowgroup" rowspan="2" class="bg_striped"><div class="f_r" id="div_btn" style="padding:3px 0px 3px 0px"><button type="button" id="potepolPopBtn" name="potepolPopBtn" class="btn btn_ctr" data-userauth="true" data-enabled="true"><span class="btn_txt">삭제</span></button></div></td><td>죽전</td><td>32400</td><td>2</td><td>멋쟁이 사자처럼</td><td>3</td><td>이두희</td><td></td></tr><tr class="tr-1"><th colspan="7"><div class="ta_l" style="margin-left: 20px;">[사이버]</div></th></tr>');
    deleteClick();
  });
  $("#click_list2").click(function(){
    alert("<루비 온 레일즈> 수강신청이 완료되었습니다.");
    $("#sucess-list").prepend('<tr class="tr-2"><td scope="rowgroup" rowspan="2" class="bg_striped"><div class="f_r" id="div_btn" style="padding:3px 0px 3px 0px"><button type="button" id="potepolPopBtn" name="potepolPopBtn" class="btn btn_ctr" data-userauth="true" data-enabled="true"><span class="btn_txt">삭제</span></button></div></td><td>죽전</td><td>123343</td><td>3</td><td>루비 온 레일즈</td><td>3</td><td>문승현</td><td></td></tr><tr class="tr-2"><th colspan="7"><div class="ta_l" style="margin-left: 20px;">월 11,12,13,14</div></th></tr>');
    deleteClick();
  });
  $("#click_list3").click(function(){
    alert("<경영학원론> 수강신청이 완료되었습니다.");
    $("#sucess-list").prepend('<tr class="tr-3"><td scope="rowgroup" rowspan="2" class="bg_striped"><div class="f_r" id="div_btn" style="padding:3px 0px 3px 0px"><button type="button" id="potepolPopBtn" name="potepolPopBtn" class="btn btn_ctr" data-userauth="true" data-enabled="true"><span class="btn_txt">삭제</span></button></div></td><td>죽전</td><td>32400</td><td>2</td><td>경영학원론</td><td>3</td><td>빌게이츠</td><td></td></tr><tr class="tr-3"><th colspan="7"><div class="ta_l" style="margin-left: 20px;">수 11,12,13,14</div></th></tr>');
    deleteClick();
  });
  $("#click_list4").click(function(){
    alert("<마케팅> 수강신청이 완료되었습니다.");
    $("#sucess-list").prepend('<tr class="tr-4"><td scope="rowgroup" rowspan="2" class="bg_striped"><div class="f_r" id="div_btn" style="padding:3px 0px 3px 0px"><button type="button" id="potepolPopBtn" name="potepolPopBtn" class="btn btn_ctr" data-userauth="true" data-enabled="true"><span class="btn_txt">삭제</span></button></div></td><td>죽전</td><td>32400</td><td>2</td><td>마케팅</td><td>3</td><td>강동주</td><td></td></tr><tr class="tr-4"><th colspan="7"><div class="ta_l" style="margin-left: 20px;">수 11,12,13,14</div></th></tr>');
    deleteClick();
  });
  $("#click_list5").click(function(){
    alert("<빅데이터> 수강신청이 완료되었습니다.");
    $("#sucess-list").prepend('<tr class="tr-5"><td scope="rowgroup" rowspan="2" class="bg_striped"><div class="f_r" id="div_btn" style="padding:3px 0px 3px 0px"><button type="button" id="potepolPopBtn" name="potepolPopBtn" class="btn btn_ctr" data-userauth="true" data-enabled="true"><span class="btn_txt">삭제</span></button></div></td><td>죽전</td><td>42340</td><td>1</td><td>빅데이터</td><td>3</td><td>잡스</td><td></td></tr><tr class="tr-5"><th colspan="7"><div class="ta_l" style="margin-left: 20px;">금 11,12,13,14</div></th></tr>');
    deleteClick();
  });
  $("#click_list6").click(function(){
    alert("<아이오닉> 수강신청이 완료되었습니다.");
    $("#sucess-list").prepend('<tr class="tr-6"><td scope="rowgroup" rowspan="2" class="bg_striped"><div class="f_r" id="div_btn" style="padding:3px 0px 3px 0px"><button type="button" id="potepolPopBtn" name="potepolPopBtn" class="btn btn_ctr" data-userauth="true" data-enabled="true"><span class="btn_txt">삭제</span></button></div></td><td>죽전</td><td>642232</td><td>2</td><td>아이오닉</td><td>2</td><td>마크 주커버그</td><td></td></tr><tr class="tr-6"><th colspan="7"><div class="ta_l" style="margin-left: 20px;">화 11,12,13,14</div></th></tr>');
    deleteClick();
  });
  function deleteClick() {
    $(".btn.btn_ctr").click(function(){
      var class_name = $(this).parent().parent().parent().attr('class');
      $("." + class_name).each(function(){
        $(this).remove();
      });
    });
  }
});
