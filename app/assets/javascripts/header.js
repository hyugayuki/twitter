$(function(){
  $("#search-query").click(function(){
    $(this).css("border", "3px solid #66ccff");
  });

  $("#display-post-modal").click(function(){
    $("#post-modal").fadeIn();
  });

  $('.colse-modal-area').click(function(){
    $("#post-modal").fadeOut();
  });

  $('#display-message-modal').click(function(){
    $("#message-modal").fadeIn();
  });

  $('.colse-modal-area').click(function(){
    $("#message-modal").fadeOut();
  });
});

