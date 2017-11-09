$(function(){
  $("#post-input-fadeOut").click(function(){
    $(this).css("display", "none");
    $("#post-textarea").css("display", "");
  });

  $(document).on('click', function(e){
    if (!$(e.target).closest('#post-textarea').length && !$(e.target).closest('#post-input-fadeOut').length){
      $("#post-input-fadeOut").css("display", "");
      $("#post-textarea").css("display", "none");
    };
  });
});
