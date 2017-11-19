$(function(){
  $("#search-query").click(function(){
    $(this).css("border", "3px solid #66ccff");
  });

  $(document).on('click', function(e){
    if (!$(e.target).closest('#search-query').length) {
      $("#search-query").css("border", "1px solid #d8d8d8");
    };
  });

  $("#display-post-modal").click(function(){
    $("#post-modal").fadeIn();
  });

  $('.colse-modal-area').click(function(){
    $("#post-modal").fadeOut();
  });

  // $('#display-message-modal').click(function(){
  //   $("#message-modal").fadeIn();
  // });

  // $('.colse-modal-area').click(function(){
  //   $("#message-modal").fadeOut();
  // });
});

