window.init_redactor = function(){
  var csrf_token = $('meta[name=csrf-token]').attr('content');
  var csrf_param = $('meta[name=csrf-param]').attr('content');
  var params;
  if (csrf_param !== undefined && csrf_token !== undefined) {
      params = csrf_param + "=" + encodeURIComponent(csrf_token);
  }
  $('.redactor').redactor({
      "imageUpload":"/redactor_rails/pictures?" + params,
      "imageGetJson":"/redactor_rails/pictures",
      "fileUpload":"/redactor_rails/documents?" + params,
      "fileGetJson":"/redactor_rails/documents",
      "path":"/assets/redactor-rails",
      "css":"style.css",
      "plugins": ['fontsize',
               'fontcolor',
               'fontfamily',
               'fullscreen',
               'textdirection',
               'clips'],
      lang: 'ko',
      cleanSpaces: false,
      cleanup: false,
      removeEmptyTags: false,
      toolbarFixed: true,
      linebreaks: false,
      fixed: false,
      toolbarFixedBox: true,
      focus: true,
      minHeight: 300
    });
}

$(document).on( 'ready page:load', window.init_redactor );
