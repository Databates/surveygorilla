$(document).ready(function() {

  $('#new-survey').submit(function(evt){
    evt.preventDefault();
    var url = $(this).attr("action");
    var data = $(this).serialize();
    $.post(url, data, function(response) {
      $(".survey .container").html(response);
    });
  });

  $('.survey').on("submit", "#new-question", function(evt){
    evt.preventDefault();
    var url = $(this).attr("action");
    var data = $(this).serialize();
    $.post(url, data, function(response) {
      $(".survey .container").html(response);
    });
  });  

    // $('.add-option').on('click', function(event) {
    //   event.preventDefault();
    //   var i = $("#inputs .option-field").length + 1;
    //   var holder = $("<input class='option-field w100' type='text' name" + "='answer" + i +"'>");
    //   holder.addClass("removable");
    //   holder.appendTo("#inputs");
    // });

    // $('.remove-last-option').on('click', function(event) {
    //   event.preventDefault();
    //   $(".removable:last").remove();
    // });

    // $('#submit-option-button').on("click", function(event) {
    //   var answerChoice = $('#submit-option-form .option-field').val();
    //   if (answerChoice == "") {
    //     event.preventDefault();
    //     $('#empty-warning').text("The Option field cannot be blank.").show().fadeOut( 2500 );
    // }
    // });

}); 