$(function(){
  $('.file_field1').on('change', function(e){
    $('.img_box1').html('');
    var file = e.target.files[0];
    var reader = new FileReader();
    reader.onload = (function(e){
      var ar = new Uint8Array(reader.result);
      $(".img_box1").append($("<img class = photo_img>").attr("src", e.target.result));
  })
  reader.readAsDataURL(file);
})

  $('.file_field2').on('change', function(e){
    $('.img_box2').html('');
    var file = e.target.files[0];
    var reader = new FileReader();
    reader.onload = (function(e){
      var ar = new Uint8Array(reader.result);
      $(".img_box2").append($("<img class = photo_img>").attr("src", e.target.result));
  })
  reader.readAsDataURL(file);
  })

  $('.file_field3').on('change', function(e){
    $('.img_box3').html('');
    var file = e.target.files[0];
    var reader = new FileReader();
    reader.onload = (function(e){
      var ar = new Uint8Array(reader.result);
      $(".img_box3").append($("<img class = photo_img>").attr("src", e.target.result));
  })
  reader.readAsDataURL(file);
  })

  $('.remove_btn1').on('click', function(){
    $('#image1').val('');
    $('.img_box1').html('');
  })

  $('.remove_btn2').on('click', function(){
    $('#image2').val('');
    $('.img_box2').html('');
  })

  $('.remove_btn3').on('click', function(){
    $('#image3').val('');
    $('.img_box3').html('');
  })
})
