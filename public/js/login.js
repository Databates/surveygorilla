$(document).ready(function() {

  // User forms animations

  function activateForm(form) {
    form.toggleClass('active');
  }

  function hideOtherForms(formToKeep) {
    formToKeep.siblings().filter('.form')
                         .removeClass('active')
                         .animate({opacity: 0}, 'fast')
                         .hide();
  }

  function closeForm(form) {
    hideCloseButton();
    form.slideUp('fast');
    form.removeClass('active');
  }

  function showForm(form, callbk) {
    form.slideDown('fast', callbk);
  }

  function showCloseButton() {
    $('.button.close').css({display: 'block'}, 'fast');
  }

  function hideCloseButton() {
    $('.button.close').fadeOut('fast');
  }

  function revealForm(form) {
    form.animate({opacity: 1}, 'fast');
  }

  function concealForm(form, callbk) {
    form.animate({opacity: 0}, 'fast', callbk);
  }

  function slideToNext(form) {
    var currentHeight = parseInt(form.css('height'));
    var nextHeight  = parseInt(currentHeight + 60);
  
    $('#forms').animate({height: nextHeight})
               .css('overflow','visible');
  }

  function formViewController(form) {
    var activeCount = $('#forms').find('.active').length;
    var noneActive  = (activeCount === 0);
    var isActive    = form.hasClass('active');

    if ( noneActive ) {
      showCloseButton();
      showForm(form, function(){
        activateForm(form);
        revealForm(form);    
      })
    } else if ( isActive ) {
      concealForm(form, function() {
        $('#forms').css('height','auto');
        hideCloseButton();
        closeForm(form);
      })
    } else {
      slideToNext(form);
      hideOtherForms(form);
      form.fadeIn( function(){
        revealForm(form);
        activateForm(form);
      });
    }
  }

  $('#nav-signin').on('click', function(e) {
    e.preventDefault();
    formViewController($('#sign-in'));
  })

  $('#nav-signup').on('click', function(e) {
    e.preventDefault();
    formViewController($('#sign-up'));
  })

  $('#guest').on('click', function(e) {
    e.preventDefault();
    formViewController($('#guest-checkin'));
  })

  $('.button.close').on('click', function(e) {
    e.preventDefault();
    $('#forms').css('height','auto');
    closeForm($('#forms .active'));
  })

  // Client-side Email/Password Validations

  $('#sign-in').on("submit", function(e) {
    var sign_in_password = $('#sign-in input[name=password]').val();
    var sign_in_email = $('#sign-in input[name=email]').val();

    if ((sign_in_email == false) || (sign_in_password == false)) {
      e.preventDefault();
      alert("Please fill in all the required fields.");
    }
  });

  $('#sign-up').on("submit", function(e) {
    var sign_up_email  = $('#sign-up input[name="user[email]"]').val();
    var sign_up_pw     = $('#sign-up input[name="user[password]"]').val();
    var sign_up_pwconf = $('#sign-up input[name="user[password_confirmation]"]').val();

    if ((sign_up_email == false) || (sign_up_pw == false) || (sign_up_pwconf == false)) {
      e.preventDefault();
      alert("Please fill in all the required fields.");
    }
  });

});