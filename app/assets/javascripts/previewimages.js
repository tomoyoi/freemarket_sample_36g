// $(document).on("turbolinks:load", function(){

// //ドロップした時の処理にプレビューを表示させる
// window.addEventListener('drop', function(event) {
//    event.preventDefault();
//    console.log("event")
//    });

// //ドラッグを止める
//   window.addEventListener('dragover', function(event) {
//        event.preventDefault();
//    }, false);
// });


// $(function() {
//   $("#drop").on({
//     "dragenter dragover":function(e){
//       e.preventDefault();
//     },
//     "drop":function(e){
//       var file = e.originalEvent.dataTransfer.files[0];
//       var fr1 = new FileReader();
//       fr1.onload = function(e) {
//         var blob=new Blob([e.target.result],{"type":file.type});
//         var fr2 = new FileReader();
//         fr2.onload = function(e) {
//           var src=e.target.result;
//           src=new Uint8Array(src);
//           src=String.fromCharCode.apply("",src);
//           src=btoa(src);
//           src="data:"+file.type+";base64,"+src;
//           $("<img>").attr({"src":src,"alt":file.name}).appendTo('#drop');
//         }
//         fr2.readAsArrayBuffer(blob);
//       }
//       fr1.readAsArrayBuffer(file);
//       e.preventDefault();
//     },
//   });
// });

$(function() {

  var upload_image = $(".sell-dropbox-items");
  var i_count = 1;

  function appendImage(image,label_num) {
    var html = `<li class='sell-dropbox-items_container'>
                    <div class='sell-dropbox-items-figure'>
                        <img alt='商品画像' src='${image}'>
                    </div>
                    <a class="sell-dropbox-items-btn sell-image_edit">
                      <p>編集</p>
                    </a>
                    <a class="sell-dropbox-items-btn sell-image_delete" id=${label_num - 1}>
                      <p>削除</p>
                    </a>
                </li>`
    upload_image.append(html);
    ImageCount()
  }

  // 削除機能
  $(document).on("click",".sell-image_delete",function(e) {
    var input_num = $(this).attr('id');
    $(this).parent().remove();
    document.getElementById('image_attributes_0_image'+input_num).value = null
    $("label.sell-dropbox-uploader_container").attr('for','image_attributes_0_image'+ input_num);
    $('.sell-dropbox-uploader').removeClass('hidden');
    $('ul.sell-dropbox-items').css('border-right','thin dashed $gray');
    i_count -= 1;
  });

// 4つ以上のときフォームを消す
function ImageCount() {
  var imagelist = $('li.sell-dropbox-items_container');
  if(imagelist.length >= 4){
    $('.sell-dropbox-uploader').addClass('hidden');
    $('ul.sell-dropbox-items').css('border','none');
  }
  else if(imagelist.length < 3){
    $('.sell-dropbox-uploader').removeClass('hidden');
    $('ul.sell-dropbox-items').css('border-right','thin dashed $gray');
  }
  return imagelist.length
}

// dorpした時の処理
  var target = document.getElementById('drop');
  if (target) {
    target.addEventListener('dragover', function (e) {
      e.preventDefault();
      e.stopPropagation();
      e.dataTransfer.dropEffect = 'copy';
    });

  // dropして保存
    target.addEventListener('drop', function (e) {
      e.stopPropagation();
      e.preventDefault();
      document.getElementById('image_attributes_0_image'+ i_count).files = e.dataTransfer.files;
    });
  }

// preview
  $('.item_images').on("change",function(e) {
    for(var i = 0; i < this.files.length; i++){
      const reader = new FileReader();
      reader.onload = function (e) {
        appendImage(e.target.result,i_count);
      }
      reader.readAsDataURL(this.files[i]);
      i_count += 1;
      $("label.sell-dropbox-uploader_container").attr('for','image_attributes_0_image'+ i_count);
    }
  });

});
