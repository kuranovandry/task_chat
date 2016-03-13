//= require jquery
//= require jquery_ujs
//= require channels
//= require_tree .

$(document).ready(function () {
  $(document).on('mouseenter', '.removebutton', function () {
    $(this).find(".btn").show();
  }).on('mouseleave', '.removebutton', function () {
    $(this).find(".btn").hide();
  });

  setTimeout(function() {
    $('.alert').slideUp();
  }, 3000);
});
