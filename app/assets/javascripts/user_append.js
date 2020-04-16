$(function() {

  var user_list = $("#modal__search__result");
  var group_list = $(".form__lists");

  function appendUser(user){
    var html = `<div class="modal__search__result", data-user-id="${user.user_id}", data-user-name="${user.user_name}", data-user-mail="${user.user_mail}">
                  <p>${user.user_name}</p>
                </div>
                `
    user_list.append(html);
  }

  function appendErrMsgToHTML(msg){
    var html = `<div class="modal__search__result">
                  <p>${msg}</p>
                </div>
                `
    user_list.append(html);
  }

  function appendGroup(id,name,mail){
    var html = `<ul class="form__lists">
                  <li class="form__list">
                  <input id="group_user_ids" name="group[user_ids][]" type="hidden" value="${id}">
                    ${name}
                  <div class="form__list__button">
                    削除
                  </div>
                  </li>
                </ul>
                `
    group_list.append(html);
  };

  var searchVal= ""
  $('#modal__search__button').on('click', function(){
    searchVal = $('#modal__search__user').val();
    searchGmail = searchVal.match(/^[a-zA-Z0-9.!#$%&'*+\/=?^_`{|}~-]+@gmail.com*$/)
    if (searchGmail != null) {
      $.ajax({
        type: 'GET',
        url:  '/users',
        data: {
                gmail: searchVal
              },
        dataType: 'json'
      }).done(function(user){
        // 成功の場合の処理
        $('#modal__search__result').empty();
        if (user != null) {
          appendUser(user);
        }
        else {
          $('#modal__search__result').empty();
          appendErrMsgToHTML("該当するユーザーは存在しません");
        }
      }).fail(function(){
        // エラーの場合処理
        $('#modal__search__result').empty();
        appendErrMsgToHTML("該当するユーザーは存在しません");
      });
    } else {
      $('#modal__search__result').empty();
      appendErrMsgToHTML("アドレスが正しくありません");
      appendErrMsgToHTML("「@gmail.com」で検索してください");
    }
  });

  $('#append__user').on('click', function(){
    var userId = $('.modal__search__result').data('user-id')
    var userName = $('.modal__search__result').data('user-name')
    var userMail = $('.modal__search__result').data('user-mail')
    $('body').removeClass('modal-open');
    $('#Modal').modal('hide');
    $('#Modal').css('display', 'none');
    $('.modal-backdrop').modal('hide');
    appendGroup(userId,userName,userMail);
  });
});

{/* <div aria-labelledby="Modal" class="modal fade show" id="Modal" role="dialog" tabindex="-1" style="display: block;" aria-modal="true">
<div aria-labelledby="Modal" class="modal fade" id="Modal" role="dialog" tabindex="-1" style="display: none;" aria-hidden="true"> */}
