
#病気一覧、及び症状検索画面での検索box (search_box)内のカテゴライズ分類とカテゴライズのプルダウン連動制御
$ ->
  do ->
    # カテゴリのセレクトボックスの中身を置き換えるためのメソッド
    # 一旦空にして、サーバから受け取った値を順に詰め込んでいる。
    replaceSelectOptions = ($select, results) ->
      $select.html $('<option>')
      $.each results, ->
        option = $('<option>').val(this.id).text(this.categorise_name)
        $select.append(option)

    replaceChildrenOptions = ->
      # 選択された親カテゴリのオプションから、data-children-pathの値を読み取る
      childrenPath = $(@).find('option:selected').data().childrenPath
      # 子カテゴリのセレクトボックスを取得する
      $selectChildren = $(@).closest('form').find('.select-children')
      if childrenPath?
        # childrenPathが存在する = 親カテゴリが選択されている場合、
        # ajaxでサーバーに子カテゴリの一覧を問い合わせる
        # categorises_controller 側でjson定義している
        $.ajax
          url: childrenPath
          dataType: "json"
          success: (results) ->
            # サーバーから受け取った子カテゴリの一覧でセレクトボックスを置き換える
            replaceSelectOptions($selectChildren, results)
          error: (XMLHttpRequest, textStatus, errorThrown) ->
             # 何らかのエラーが発生した場合
            console.error("Error occurred in replaceChildrenOptions")
            console.log("XMLHttpRequest: #{XMLHttpRequest.status}")
            console.log("textStatus: #{textStatus}")
            console.log("errorThrown: #{errorThrown}")
      else
        replaceSelectOptions($selectChildren, [])


    #LargeCategoryのプルダウン変更イベントの設定
    $('.select-parent').on
      'change': replaceChildrenOptions