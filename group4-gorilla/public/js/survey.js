// Creating a Survey's Answer Options
$(document).ready( function(){

  $('#create-survey-form').on('submit', function(event) {
    var surveyTitle = $('#create-survey-form input[name="survey[title]"]').val();
    var surveyDescription = $('#create-survey-form input[name="survey[description]"]').val();
    if (surveyTitle == false) {
      $('#create-survey-validations').text("The Survey Title cannot be blank.").show().fadeOut( 2500 );
    } else if (surveyDescription == false) {
      $('#create-survey-validations').text("The Survey Description cannot be blank.").show().fadeOut( 2500 );
    } else {
      $('#create-question-form').show().fadeIn( 500 );
      $('#create-survey-button, #create-survey-validations').fadeOut( 750 );
    }
    event.preventDefault();
  });

  $('#create-question-form').on('submit', function(event) {
    var surveyQuestion = $('#create-question-form input[name="question[text]"]').val();
    if (surveyQuestion == false) {
      $('#create-question-validation').text("The question cannot be blank.").show().fadeOut( 2500 );
    } else {
      $('#create-question-form').show();
    }
    event.preventDefault();
  });


  $('.add-option').on('click', function(event) {
    event.preventDefault();
    var i = $("#inputs .option-field").length + 1;
    var holder = $("<input class='option-field removable' type='text' name" + "='answer" + i +"'>");
    holder.removeClass('template');
    holder.addClass("removable");
    holder.appendTo("#inputs");
  });

  $('.remove-last-option').on('click', function(event) {
    event.preventDefault();
    // $('.option-field.template').clone().show().toggleClass('template').appendTo('.option-field');
    $(".removable:last").remove();
    // console.log("hello");
  });
});
