$(function() {
  $('.form__post__function').on('focusin', function() {
    $(this).parent().find('label').addClass('active');
  });

  $('.form__post__function').on('focusout', function() {
    if (!this.value) {
      $(this).parent().find('label').removeClass('active');
    }
  });
});

