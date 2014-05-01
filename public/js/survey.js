// $(document).ready( function(){

//   $('.add-option').on('click', function(event) {
//     event.preventDefault();
//     var i = $("#inputs .option-field").length + 1;
//     var holder = $("<input class='option-field' type='text' name" + "='answer" + i +"'>");
//     // holder.removeClass('template');
//     // holder.addClass("removable");
//     holder.appendTo("#inputs");
//   });

//   $('.remove-last-option').on('click', function(event) {
//     event.preventDefault();
//     // $('.option-field.template').clone().show().toggleClass('template').appendTo('.option-field');
//     $(".option-field:last").remove();
//     // console.log("hello");
//   });


//   // Creating a Survey's Title and Description (with blank-field validations included)
//   $('#submit-option-button').on("click", function(event) {

//     // var answerChoice = $('#submit-option-form input[name="answer1"]').val();
//     var answerChoice = $('#submit-option-form .option-field').val();

//     // var otherChoices = $('#submit-option-form .removable').val();


//     // var surveyDescription = $('#create-survey-form input[name="survey[description]"]').val();

//     if (answerChoice == "") {
//       event.preventDefault();
//       $('#empty-warning').text("The Option field cannot be blank.").show().fadeOut( 2500 );
//   }
//     // } else if (otherChoices == "") {
//     //  event.preventDefault();
//     //   $('#empty-warning').text("The Survey Description cannot be blank.").show().fadeOut( 2500 );
//     // }


//     // var surveyTitle = $('#submit-option-form input[name="survey[title]"]').val();
//   });
// });









// // Creating a Survey's Answer Options
// $(document).ready( function(){

//   $('.add-option').on('click', function(event) {
//     event.preventDefault();
//     var i = $("#inputs .option-field").length + 1;
//     var holder = $("<input class='option-field removable' type='text' name" + "='answer" + i +"'>");
//     holder.removeClass('template');
//     holder.addClass("removable");
//     holder.appendTo("#inputs");
//   });

//   $('.remove-last-option').on('click', function(event) {
//     event.preventDefault();
//     // $('.option-field.template').clone().show().toggleClass('template').appendTo('.option-field');
//     $(".removable:last").remove();
//     // console.log("hello");
//   });
// });
