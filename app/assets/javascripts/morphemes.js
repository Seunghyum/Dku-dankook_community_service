//= require d3.v3
//= require d3pie

$(document).ready(function(){
     var graph = [];
     gon.graph.forEach(function(e){
          graph.push({label: e["0"], value: e["1"]})
     });
    var pie = new d3pie("pie", {
	header: {
    	title: {
                text: "Mecab 형태소 분석기 결과"
    	},
    	location: "pie-center"
	},
	size: {
	     pieInnerRadius: "70%"
	},
	data: {
            content: graph
	}
    });

    function pagination_list_update() {
      $('#pgList .pagination a').on("click", function(e){
        e.preventDefault();
        var page_val = $(this).attr("href");
        $.get(page_val, function(result){
          var update_html = $(result).find("#pgListTarget").html();
          $("#pgListTarget").html("").append(update_html);
          var update_pagination = $(result).find("#pgList .pagination").html();
          $("#pgList .pagination").html(update_pagination);
          pagination_list_update();
        });
      });
    }
    pagination_list_update();

    function pagination_table_update() {
      $('#pgTable .pagination a').on("click", function(e){
        e.preventDefault();
        var page_val = $(this).attr("href");
        $.get(page_val, function(result){
          var update_html = $(result).find("#pgTableTarget").html();
          $("#pgTableTarget").html("").append(update_html);
          var update_pagination = $(result).find("#pgTable .pagination").html();
          $("#pgTable .pagination").html(update_pagination);
          pagination_table_update();
        });
      });
    }
    pagination_table_update();
});
