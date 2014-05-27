// $(document).ready(function() {
//   $('#sign-in').on("submit", function(event) {
//     var sign_in_password = $('#sign-in input[name=password]').val();
//     var sign_in_email = $('#sign-in input[name=email]').val();

//     if ((sign_in_email == false) || (sign_in_password == false)) {
//       event.preventDefault();
//       alert("You're an idiot! You didn't complete the sign in form!");
//     }
//   });

//   $('#sign-up').on("submit", function(event) {
//     var sign_up_email = $('#sign-up input[name="user[email]"]').val();
//     var sign_up_password = $('#sign-up input[name="user[password]"]').val();
//     var sign_up_password_confirmation = $('#sign-up input[name="user[password_confirmation]"]').val();

//     if ((sign_up_email == false) || (sign_up_password == false) || (sign_up_password_confirmation == false)) {
//       event.preventDefault();
//       alert("You're an idiot! You didn't complete the sign up form!");
//     }
//   });

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













//   $('.add-option').on('click', function(event) {
//     event.preventDefault();
//     // $('.option-field.template').clone().show().toggleClass('template').appendTo('.option-field');

//     var holder = $('.option-field.template').clone();
//     holder.removeClass('template')
//     holder.addClass("removable")
//     holder.insertAfter("#sorry-marco-seriously-i-apologize-for-using-a-div-inside-a-form")
//   });

//   $('.remove-option').on('click', function(event) {
//     event.preventDefault();
//     // $('.option-field.template').clone().show().toggleClass('template').appendTo('.option-field');
//     $(".removable:last").remove();
//     // console.log("hello");
//   });

// });



  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
