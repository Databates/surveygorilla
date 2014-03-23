// Creating Fixed-Response answer choices + validations
$(document).ready( function(){


// Add additional answer choices and remove last answer choices

  $('#add-response').on('click', function() {
    $('#remove-response').show();
    var i = $('.question1-responses').length;
    var j = i + 1;
    var holder = $("<input class='question1-responses' type='text' name='response"+j+"'>");
    var position = "input[name=response"+i+"]";
    holder.appendTo('#question1-responses');
  });

  $('#remove-response').on('click', function() {
    $('.question1-responses:last').remove();
    var i = $('.question1-responses').length;
    if (i === 1) {
      $('#remove-response').hide();
    };
  });


// Validations:
  // for fixed-response questions, user options appear once validations below have been met;
  // these validations: response-type (dropdown/radio/check) must be selected and answer fields must have some text in them

// this validates upon text being typed in the text-field (and checks to see if a radio button is checked)
  $('input[name=response1]').on('keyup', function () {
    if ($('input[name=response1]').val() == "" && $('input[name=question1]:checked').val() == undefined) {
      $('#user-action-buttons').show();
    }
  });

// this validates upon a radio button being clicked (and checks to see if text is in answer fields)
  $('#add-question').click(function () {
    if ($('input[name=response1]').val() == "") {
      $('#create-question-validation').text('You need to enter text for your responses.').show().fadeOut( 2500 )
    } else if ($('input[name=question1]:checked').val() == undefined) {
      $('#create-question-validation').text('You need to choose a display type for your responses.').show().fadeOut( 2500 )
    }
  });
});
