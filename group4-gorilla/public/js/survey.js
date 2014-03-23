$(document).ready( function(){

  // Creating a Survey's Title and Description (with blank-field validations included)
  $('#add-question-button').on('click', function(event) {
    var surveyTitle = $('#create-survey-form input[name="survey[title]"]').val();
    var surveyDescription = $('#create-survey-form input[name="survey[description]"]').val();
    if (surveyTitle == "") {
      $('#create-survey-validations').text("The Survey Title cannot be blank.").show().fadeOut( 2500 );
    } else if (surveyDescription == "") {
      $('#create-survey-validations').text("The Survey Description cannot be blank.").show().fadeOut( 2500 );
    } else {
      $('#question-name').show().fadeIn( 500 );
      $('#add-question-button, #create-survey-validations').fadeOut( 750 );
    }
    event.preventDefault();
  });

});
