$(function() {
  // カテゴリーセレクトボックスのオプションを作成
  function appendOption(category){
    var html = `<option value="${category.name}" data-category="${category.id}">${category.category_name}</option>`;
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

  $("#parent-form").on("change",function() {
  // 親ボックスのidを取得してそのidをAjax通信でコントローラーへ送る
    var parentValue = document.getElementById("parent-form").value;
    console.log(parentValue);
    //　("parent-form")は親ボックスのid属性
    if (parentValue != "---"){ //親カテゴリーが初期値でないことを確認
      $.ajax({
        url: 'get_category_children',
        type: 'GET',
        data: { parent_name: parentValue },
        dataType: 'json'
      })
      .done(function(children){
        $('#children-wrapper').remove(); //親が変更された時、子以下を削除するする
        $('#grandchildren-wrapper').remove();
        // $('#size-wrapper').remove();
        // $('#brand-wrapper').remove();
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
      // $('#size-wrapper').remove();
      // $('#brand-wrapper').remove();
    }
  })
  // 子カテゴリー選択後のイベント
  $('.products-contents__main-details__category').on('change', '#child-form', function(){
    var childValue = $('#child-form option:selected').data('category'); //選択された子カテゴリーのidを取得
    console.log(childValue);
    if (childValue != "---"){ //子カテゴリーが初期値でないことを確認
      $.ajax({
        url: 'get_category_grandchildren',
        type: 'GET',
        data: { child_id: childValue },
        dataType: 'json'
      })
      .done(function(grandchildren){
        if (grandchildren.length != 0) {
          $('#grandchildren-wrapper').remove(); //子が変更された時、孫以下を削除するする
          // $('#size-wrapper').remove();
          // $('#brand-wrapper').remove();
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
      // $('#size-wrapper').remove();
      // $('#brand-wrapper').remove();
    }
  })
})