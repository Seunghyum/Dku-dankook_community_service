$ ->  
#댓글 시 
  $('[data-provider="summernote"]').each ->
    $(this).summernote
      lang: 'ko-KR'

#새글 작성 시
  # to set summernote object
  # You should change '#summernote-input' to your textarea input id
  summer_note = $('#summernote-post')

  # to call summernote editor
  summer_note.summernote
    # to set options
    height:500
    lang: 'ko-KR'
    
  # to set code for summernote
  # summer_note.code summer_note.val()

  # to get code for summernote
  summer_note.closest('form').submit ->
    # alert $('#summernote-input').code()
    summer_note.val summer_note.code()
    true