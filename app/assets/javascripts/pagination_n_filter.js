$(document).ready(function(){
  function pagination_update() {
    $('.pagination a').on("click", function(e){
      e.preventDefault();
      var page_val = $(this).attr("href");
      $.get(page_val, function(result){
        var update_html = $(result).find("#pg_target").html();
        $("#pg_target").html("").append(update_html);
        var update_pagination = $(result).find(".pagination").html();
        $(".pagination").html(update_pagination);
        pagination_update();
      });
    });
  }
  pagination_update();
  
  //필터 ajax
  function checkUrl(){
    if(location.search == ""){
      return location.href + "?filter=";
    } else {
      return location.href + "&filter=";
    }
  }
  $(".admin_filter").click(function(e){
    e.preventDefault();
    var filter_name = $(this).text();
    $.get(checkUrl() + filter_name, function(result){
      var update_html = $(result).find("#pg_target").html();
      $("#pg_target").html("").append(update_html);
      var checkResult = $(result).find(".pagination-wrapper").html().replace(/\s+/, "").length
      if( checkResult != 0){
        var update_pagination = $(result).find(".pagination-wrapper").html();
        $(".pagination-wrapper").html(update_pagination);
        pagination_update();
      }else {
        $(".pagination-wrapper").html("");
      }
    });
  });
});
