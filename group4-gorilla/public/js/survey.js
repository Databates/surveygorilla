// Creating a Survey's Answer Options
$(document).ready( function(){

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
