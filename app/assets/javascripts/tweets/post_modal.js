$(function(){
  function buildHtml(order){// 新しいinput(label)の追加
    var html = `
    <label class="label-item" id="label_${order}">
      <i class="fa fa-image"></i>
      <input type="file", name="tweet[images_attributes][${order}][file]", id="file", style="display:none;">
    </label>
    `
    return html;
  }
   function buildButton(id){// プレビュー画像の箱(div)の追加
    var html = `
    <div id="preview_item_${id}" class="preview">
      <span class="close-preview", data-image="${id}">×</span>
    </div>
    `
    return html;
  }


// イベント
  var new_file_id = $('.label-item').length;
  console.log("hello");
  $(document).on('input change','#file', function(e){// input の追加
    var labelLength = $('.label-item').length;
    if(labelLength < 4){
      $('.label-item').css('display', 'none');
      $('.without-file_field').remove();
      $('#append_file_field').append(buildHtml(new_file_id));
    }else{
      $('.label-item').css('display', 'none');
      $('#append_file_field').append('<i class="fa fa-image without-file_field"></i>');
    }

  //画像ファイルプレビュー表示
    var file = e.target.files[0],
        reader = new FileReader(),
        $preview = $(".images_preview_area");
        t = this;
    // 画像ファイル以外の場合は何もしない
    if(file.type.indexOf("image") < 0){
      return false;
    }

    reader.onload = (function(file) {
      return function(e) {
      $preview.append(buildButton(new_file_id));
      // new_file_id ++;
      var preview_image_item = $("#preview_item_"+ new_file_id);
      new_file_id ++;
      console.log(new_file_id);
        preview_image_item.append($('<img>').attr({
          src: e.target.result,
          width: "100px",
          height: "110px",
          class: "preview",
          title: file.name
        }));
      };
    })(file);

    reader.readAsDataURL(file);
  });

//画像ファイルプレビューの消去
  $(document).on('click','.close-preview', function(e){
    console.log("消去ボタンがクリックされました");
    var data = (this).getAttribute("data-image");
    var remove_label_id = data - 1; //消去選択された画像のlabel_id
    console.log(remove_label_id);
    $("#preview_item_" + data).remove(); //preview画像を画面上から消去
    $('#label_' + remove_label_id).remove(); //対象を持つinputを消去
    console.log(new_file_id);
    var without_file_field_length = $('.without-file_field').length;
    if( without_file_field_length != 0 ){ //imageが４枚選択されていれば
      $('.without-file_field').remove(); // inputを持たないfa-imageアイコンがあれば消去
      $('#append_file_field').append(buildHtml(new_file_id)); //file_filed追加
      new_file_id ++;
      console.log('ここ大事');
      console.log(new_file_id);
    }
  });

});
