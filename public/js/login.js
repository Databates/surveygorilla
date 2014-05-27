// Client-side Email/Password Validations
$(document).ready(function() {

  $('#sign-in').on("submit", function(event) {
    var sign_in_password = $('#sign-in input[name=password]').val();
    var sign_in_email = $('#sign-in input[name=email]').val();

    if ((sign_in_email == false) || (sign_in_password == false)) {
      event.preventDefault();
      alert("You're an idiot! You didn't complete the sign in form!");
    }
  });

  $('#sign-up').on("submit", function(event) {
    var sign_up_email = $('#sign-up input[name="user[email]"]').val();
    var sign_up_password = $('#sign-up input[name="user[password]"]').val();
    var sign_up_password_confirmation = $('#sign-up input[name="user[password_confirmation]"]').val();

    if ((sign_up_email == false) || (sign_up_password == false) || (sign_up_password_confirmation == false)) {
      event.preventDefault();
      alert("You're an idiot! You didn't complete the sign up form!");
    }
  });
});

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
