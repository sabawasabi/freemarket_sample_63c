$(function() {
  // カテゴリーセレクトボックスのオプションを作成
  function appendOption(category){
    var html = `<option value="${category.id}" data-category="${category.id}">${category.category_name}</option>`;
    return html;
  }
  // サイズセレクトボックスのオプションを作成
  function appendSizeOption(products_size){
    var html = `<option value="${products_size.id}">${products_size.size_name}</option>`;
    return html;
  }

  // 子カテゴリーの表示作成
  function appendChidrenBox(insertHTML){
    var childSelectHtml = '';
    childSelectHtml = `<div class='products-contents__main-details__category-wrapper__added' id= 'children-wrapper'>
                        <div class='products-contents__main-details__category-wrapper__box'>
                          <select class="products-contents__main-details__category-box" id="child-form" name="product[category_id]">
                            <option value="---" data-category="---">---</option>
                            ${insertHTML}
                          </select>
                        </div>
                      </div>`;
    $('.products-contents__main-details__category').append(childSelectHtml);
  }
  // 孫カテゴリーの表示作成
  function appendGrandchidrenBox(insertHTML){
    var grandchildSelectHtml = '';
    grandchildSelectHtml = `<div class='products-contents__main-details__category-wrapper__added' id= 'grandchildren-wrapper'>
                              <div class='products-contents__main-details__category-wrapper__box'>
                                <select class="products-contents__main-details__category-box" id="grandchild-form" name="product[category_id]">
                                  <option value="---" data-category="---">---</option>
                                  ${insertHTML}
                                </select>
                              </div>
                            </div>`;
    $('.products-contents__main-details__category').append(grandchildSelectHtml);
  }
  // サイズ入力欄の表示作成
  function appendSizeBox(insertHTML){
    var sizeSelectHtml = '';
    sizeSelectHtml = `<div class='.products-contents__main-details__category' id= 'size-wrapper'>
                        <label class="products-contents__main-details__category__title" for="サイズ">サイズ</label>
                          <span class='products-contents__main-details__category__title-required'>必須</span>
                        <div class='products-contents__main-details__category-wrapper'>
                          <div class='products-contents__main-details__category-wrapper__box'>
                            <select class="products-contents__main-details__category-box" id="size" name="product[products_size_id]">
                              <option value="---">---</option>
                              ${insertHTML}
                            </select>
                          </div>
                        </div>
                      </div>`;
    $('.products-contents__main-details__category').append(sizeSelectHtml);
  }

  $("#parent-form").on("change",function() {
  // 親ボックスのidを取得してそのidをAjax通信でコントローラーへ送る
    var parentValue = document.getElementById("parent-form").value;
    //　("parent-form")は親ボックスのid属性
    if (parentValue != "---"){ //親カテゴリーが初期値でないことを確認
      $.ajax({
        url: '/products/get_category_children',
        type: 'GET',
        data: { parent_id: parentValue },
        dataType: 'json'
      })
      .done(function(children){
        $('#children-wrapper').remove(); //親が変更された時、子以下を削除するする
        $('#grandchildren-wrapper').remove();
        $('#size-wrapper').remove();
        var insertHTML = '';
        children.forEach(function(child){
          insertHTML += appendOption(child);
        });
        appendChidrenBox(insertHTML);
      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました');
      })
    }else{
      $('#children-wrapper').remove(); //親カテゴリーが初期値になった時、子以下を削除するする
      $('#grandchildren-wrapper').remove();
      $('#size-wrapper').remove();
    }
  })
  // 子カテゴリー選択後のイベント
  $('.products-contents__main-details__category').on('change', '#child-form', function(){
    var childValue = $('#child-form option:selected').data('category'); //選択された子カテゴリーのidを取得
    if (childValue != "---"){ //子カテゴリーが初期値でないことを確認
      $.ajax({
        url: '/products/get_category_grandchildren',
        type: 'GET',
        data: { child_id: childValue },
        dataType: 'json'
      })
      .done(function(grandchildren){
        if (grandchildren.length != 0) {
          $('#grandchildren-wrapper').remove(); //子が変更された時、孫以下を削除するする
          var insertHTML = '';
          grandchildren.forEach(function(grandchild){
            insertHTML += appendOption(grandchild);
          });
          appendGrandchidrenBox(insertHTML);
        }
      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました');
      })
    }else{
      $('#grandchildren-wrapper').remove(); //子カテゴリーが初期値になった時、孫以下を削除する
    }
  })
  // 孫カテゴリー選択後のイベント
  $('.products-contents__main-details__category').on('change', '#grandchild-form', function(){
    var grandValue = $('#grandchild-form option:selected').data('category'); //選択された孫カテゴリーのidを取得
    if (grandValue != "---"){ //孫カテゴリーが初期値でないことを確認
      $.ajax({
        url: '/products/get_size',
        type: 'GET',
        data: { grandchild_id: grandValue },
        dataType: 'json'
      })
      .done(function(sizes){
        $('#size-wrapper').remove(); //孫が変更された時、サイズ欄以下を削除する
        if (sizes.length != 0) {
        var insertHTML = '';
          sizes.forEach(function(products_size){
            insertHTML += appendSizeOption(products_size);
          });
          appendSizeBox(insertHTML);
        }
      })
      .fail(function(){
        alert('サイズ取得に失敗しました');
      })
    }else{
      $('#size-wrapper').remove(); //孫カテゴリーが初期値になった時、サイズ欄以下を削除するs
    }
  });
})