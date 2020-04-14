$(function() {
  $(document).ready(function(){
    $('.form__post__textbox').blur(function() {
      if($(this).val().length === 0){
        $('.form__post__label').removeClass("focus");
      }
      else { returns; }
    })
    .focus(function() {
      $('.form__post__label').addClass("focus")
    });
  });
});