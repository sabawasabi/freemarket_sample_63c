$(function() {
  $("#products-contents__main-image__box-input__image").on("change", "#product_images_attributes_0_image", function(e) {
    
    
    
    
    
    
    
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
}