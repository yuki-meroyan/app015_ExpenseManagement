$(function() {

  var user_list = $("#modal__search__result");

  function appendUser(user){
    var html = `<div class="modal__search__result">
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

  function appendGroup(user){
    var html = `<div class="form__search__result__box">
                  <input id="group_user_ids" name="group[user_ids][]" type="hidden" value="${user.user_id}"></input>
                  <img class="form__search__image" src="${user.user_image}">
                  <div class="form__search__name">${user.user_name}</div>
                  <div class="form__search__button button" id="form__remove__button">削除</div>
                </div>
                `
    group_list.append(html);
  };

  var searchVal= ""
  $('#modal__search__button').on('click', function(){

    searchVal = $('#modal__search__user').val();
    searchGmail = searchVal.match(/^[a-zA-Z0-9.!#$%&'*+\/=?^_`{|}~-]+@gmail.com*$/)
    if (searchGmail != null) {
      // $('input[name="group[user_ids][]"]').each(function(i,user){
      //   users.push($(user).val());
      // })
      $.ajax({
        type: 'GET',
        url:  '/users',
        data: {
                gmail: searchVal
                // ,
                // selected_users: users
              },
        dataType: 'json'
      }).done(function(user){
        // 成功の場合の処理
        $('#modal__search__result').empty();
        if (user != null) {
          console.log(user.user_name)
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
    //   $.ajax({
    //   type: 'GET',
    //   url: '/users',
    //   data: {
    //           keyword: input,
    //           selected_users: users
    //         },
    //   dataType: 'json'
    //   })
    //   .done(function(users) {
    //     $('#form__search__result').empty();
    //     if (users.length !== 0) {
    //       users.forEach(function(user){
    //       appendUser(user);
    //       });
    //     }
    //     else {
    //       appendErrMsgToHTML("ユーザー検索に失敗しました");
    //     }
    //   })
    } else {
      alert ("アドレスが正しくありません「@gmail.com」で検索してください")
    }
  });

  $('#appendUser').on('click', function(){

  });
});