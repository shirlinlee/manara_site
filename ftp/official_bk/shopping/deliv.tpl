<!--   肚子開始  -->
<script type="text/javascript">//<![CDATA[

$(function() {
  if ($('input[name=deliv_id]:checked').val()
      || $('#deliv_id').val()) {
      showForm(true);
  } else {
      showForm(false);
  }

  // 2017.12.11 ytagawa add start
  // ランディングページから取得する宅配配送日
  var ldShippingDate = null;

  // ランディングページから取得するコンビニ配送日
  var ldCvsShippingDate = null;

  // ランディングページから配送日を取得
  $.ajax({
    url: '<!--{$smarty.const.CROS_HTTPS_URL}-->ld',
    type: "POST",
    cache: false,
    dataType: "json",
    data: {
      "type": "init",
      "accountId": "<!--{$smarty.const.CROS_ACCOUNT_ID}-->",
    },
    success : function(data) {
      ldShippingDate = data.shippingDate;
      ldCvsShippingDate = data.cvsShippingDate;
    },
    error: function(xhr, textStatus, errorThrown){
      alert(textStatus);
    }
  });
  // 2017.12.11 ytagawa add end

  if ($('input[name=carrier_type]:checked').val() == '0') {
    $('#carrier_type_area').show();
    $('#donate_type_label').show();
    $('#donate_type_radio').show();
  } else {
    $('#carrier_type_area').hide();
  }

  // 統一發票寄送地址
  // P:個人地址 C:公司地址
  if ($('input[name=receipt_type]:checked').val() == 'C') {
    // 'C'が選択されると
    // [捐贈發票]項目が非表示になる
    // 載具 > 共通性載具 > [自然人憑證條碼]項目が非表示になる
    $('#donate_type_display').hide();
    $('#carrier_number_person_barcode').val('');
    $('#carrier_number_person_barcode_li').addClass('hide');

  }

  // 統一發票
  fnCheckInputReceiptType();

  // 捐贈發票
  if ($('input[name=donate_type]:checked').val() == '1') {
    $('#donate_type_area').show();
  } else {
    $('#donate_type_area').hide();
  }

  onChangeCarrierNumber();
  <!--{* 2017.07.05 yyasuda add end (電子統一発票対応) *}-->



  $('input[id^=deliv_]').click(function() {
      showForm(true);
      var data = {};
      data.mode = 'select_deliv';
      data.deliv_id = $(this).val();
      data['<!--{$smarty.const.TRANSACTION_ID_NAME}-->'] = '<!--{$transactionid}-->';
      $.ajax({
          type : 'POST',
          url : location.pathname,
          data: data,
          cache : false,
          dataType : 'json',
          error : remoteException,
          success : function(data, dataType) {
              if (data.error) {
                  remoteException();
              } else {
                  // 支払い方法の行を生成
                  var payment_tbody = $('#payment tbody');
                  payment_tbody.empty();
                  for (var i in data.arrPayment) {
                      // ラジオボタン
                      <!--{* IE7未満対応のため name と id をベタ書きする *}-->
                      var radio = $('<input type="radio" name="payment_id" id="pay_' + i + '" />')
                          .val(data.arrPayment[i].payment_id);
                      // ラベル
                      var label = $('<label />')
                          .attr('for', 'pay_' + i)
                          .text(data.arrPayment[i].payment_method);
                      // 行
                      var tr = $('<tr />')
                          .append($('<td />')
                              .addClass('alignC')
                              .append(radio))
                          .append($('<td />').append(label));

                      // 支払方法の画像が登録されている場合は表示
                      if (data.img_show) {
                          var payment_image = data.arrPayment[i].payment_image;
                          $('th#payment_method').attr('colspan', 3);
                          if (payment_image) {
                              var img = $('<img />').attr('src', '<!--{$smarty.const.IMAGE_SAVE_URLPATH}-->' + payment_image);
                              tr.append($('<td />').append(img));
                          } else {
                              tr.append($('<td />'));
                          }
                      } else {
                          $('th#payment_method').attr('colspan', 2);
                      }

                      tr.appendTo(payment_tbody);
                  }
                  // お届け時間を生成
                  var deliv_time_id_select = $('select[id^=deliv_time_id]');
                  deliv_time_id_select.empty();
                  deliv_time_id_select.append($('<option />').text('無指定').val(''));
                  for (var i in data.arrDelivTime) {
                      var option = $('<option />')
                          .val(i)
                          .text(data.arrDelivTime[i])
                          .appendTo(deliv_time_id_select);
                  }
              }
          }
      });
  });

  /**
   * 通信エラー表示.
   */
  function remoteException(XMLHttpRequest, textStatus, errorThrown) {
      alert('發生通信錯誤，將移動到購物車頁面。');
      location.href = '<!--{$smarty.const.CART_URLPATH}-->';
  }

  /**
   * 配送方法の選択状態により表示を切り替える
   */
  function showForm(show) {
      if (show) {
          $('#payment, div.delivdate, .select-msg').show();
          $('.non-select-msg').hide();
      } else {
          $('#payment, div.delivdate, .select-msg').hide();
          $('.non-select-msg').show();
      }
  }
  // 2016.03 yyasuda add start (GMO対応)


  // 2017.12.11 ytagawa add start
  // 宅配配送日リスト
  var shippingDateList = [];

  // コンビニ配送日リスト
  var cvsShippingDateList = [];

  // 選択した配送日
  var shippingDateValue = $('input#shipping_date_value0').val();

  // コンビニ配送できない日付を定義
  var excludeDates = [
                '2019/9/15',
                '2019/9/16',
                '2019/9/17',
                '2019/10/12',
                '2019/10/13',
                '2019/10/14',
                '2019/10/15',
                '2020/1/25',
                '2020/1/26',
                '2020/1/27',
                '2020/1/28',
                '2020/1/29',
                '2020/1/30',
                '2020/1/31',
                '2020/3/1',
                '2020/3/2',
                '2020/3/3',
                '2020/4/4',
                '2020/4/5',
                '2020/4/6',
                '2020/4/7',
                '2020/5/3',
                '2020/5/4',
                '2020/5/5',
                '2020/6/27',
                '2020/6/28',
                '2020/6/29',
                '2020/6/30',
                '2020/10/3',
                '2020/10/4',
                '2020/10/5',
                '2020/10/6',
                '2020/10/11',
                '2020/10/12',
                '2020/10/13',];

  // 宅配かコンビニ配送かで「送貨日期」のリストを更新する
  //  - 宅配の場合、翌営業日の翌日から開始。
  //  - コンビニ配送の場合、翌々営業日の翌日から開始。
  function refershShippingList(){

    if (ldCvsShippingDate == null || ldShippingDate == null) {
      return;
    }

    // 宅配
    if ( shippingDateList.length == 0 ) {
      var isAppendable = false;
      $('select[name^=deliv_date] option').each(function(item) {
        var value = $(this).text();
        if (value.indexOf('(') != -1) {
          value = value.substr(0, value.indexOf('('));
        }
        var dValue = new Date(value);
        var dLdShippingDate = new Date(ldShippingDate);
        if (dValue.getTime() >= dLdShippingDate.getTime()) {
          isAppendable = true;
        }
        if (isAppendable) {
          shippingDateList.push($(this).text());
        }
      });
    }
    // コンビニ配送
    if ( cvsShippingDateList.length == 0 ) {
      var isAppendable = false;
      $('select[name^=cvs_deliv_date] option').each(function(item) {
        var value = $(this).text();
        if (value.indexOf('(') != -1) {
          value = value.substr(0, value.indexOf('('));
        }
        var dValue = new Date(value);
        var dLdCvsShippingDate = new Date(ldCvsShippingDate);
        if (dValue.getTime() >= dLdCvsShippingDate.getTime()) {
          isAppendable = true;
        }
        if (isAppendable) {
          // コンビニ配送できない日は除外する
          var isExclude = false;
          for (var i = 0, l = excludeDates.length; i < l; i++) {
            var excValue = excludeDates[i];
            var dExcValue = new Date(excValue);
            if (dValue.getTime() == dExcValue.getTime()) {
              isExclude = true;
            }
          }
          if (!isExclude) {
            cvsShippingDateList.push($(this).text());
          }
        }
      });
    }

    var selectedValue = (shippingDateValue != null ? shippingDateValue : $('select[name^=deliv_date]').val());
    shippingDateValue = null;  // 2 回目以降は使用しないのでクリア

    var isCvs = ($('input[name=receiving_method]:checked').val() == '1');

    $('select[name^=deliv_date] option').remove();

    var _list = (isCvs ? cvsShippingDateList : shippingDateList);
    for (var i = 0, l = _list.length; i < l; i++) {
      var value = _list[i];
      var selected = (value == selectedValue ? 'selected' : '');
      $('select[name^=deliv_date]').append('<option label="' + value + '" value="' + value + '" ' + selected + '>' + value + '</option>');
    }

  }

  /// 非同期で配送日が取得できた時点で初回のプロダウン生成を行う
  var refershShippingListLooper = function() {
    if (ldCvsShippingDate != null && ldShippingDate != null) {
      refershShippingList();
      clearTimeout(toShippingDateWait);
      return;
    }
    // 非同期通信が完了するまで待機
    var toShippingDateWait = setTimeout(refershShippingListLooper, 100);
  };

  refershShippingListLooper();
  // 2017.12.11 ytagawa add end


  /**
   * 支払方法
   */
  $('input[id^=pay_]').click(function() {
    <!--{* 2017.07.03 yyasuda add start (コンビニ配送対応) *}-->
    // コンビニ配送対応
    switch ($(this).val()) {
      case '1':
        // カード決済
        $('#card_info').show();
	$('#card_info').show();
	$('#receiving_method_house_area').show();
	$('#receiving_method_cvs_area').show();
        break;
      case '2':
        // 代金引換
        $('#card_info').hide();
        $('#receiving_method_house_area').show();
        $('#receiving_method_cvs_area').hide();
        $("input[name='receiving_method']").val(['0']);
        break;
      case '5':
        // コンビニ支払
        $('#card_info').hide();
        $('#receiving_method_house_area').hide();
        $('#receiving_method_cvs_area').show();
        $("input[name='receiving_method']").val(['1']);
        break;
      default:
        console.log("payment id : " + $(this).val() + ".");
    }
    // コンビニ配送
    isShowReceivingMethodCvs();

    // 2017.12.11 ytagawa add start
    refershShippingList();
    // 2017.12.11 ytagawa add end

    <!--{* 2017.07.03 yyasuda add end (コンビニ配送対応) *}-->


    /* 2018.05.09 ytagawa - コンビニ配送の場合、送貨時間は不指定にして非表示 */
    <!--{foreach item=shippingItem name=shippingItem from=$arrShipping}-->
    <!--{assign var=index value=$shippingItem.shipping_id}-->
    <!--{assign var=key value="deliv_time_id`$index`"}-->
    $('#<!--{$key}-->__div').show();
    if ($('input[name=receiving_method]:checked').val() == 1) {
      $('select#<!--{$key}-->').val(0);
      $('#<!--{$key}-->__div').hide();
    }
    <!--{/foreach}-->
  });


  /**
   * 受取方法の選択
   * コンビニを選択した場合に、項目を表示する
   */
  $('input[id^=receiving_method_]').click(function() {
   // コンビニ受取を選択か
    var isReceivingMethodCvs = ($(this).val() == 1) ? true : false;
    if (isReceivingMethodCvs) {
      $('#input_cvs_area').show();
    } else {
      $('#input_cvs_area').hide();
    }

    // 2017.12.11 ytagawa add start
    refershShippingList();
    // 2017.12.11 ytagawa add end

    /* 2018.05.09 ytagawa - コンビニ配送の場合、送貨時間は不指定にして非表示 */
    <!--{foreach item=shippingItem name=shippingItem from=$arrShipping}-->
    <!--{assign var=index value=$shippingItem.shipping_id}-->
    <!--{assign var=key value="deliv_time_id`$index`"}-->
    $('#<!--{$key}-->__div').show();
    if ($(this).val() == 1) {
      $('select#<!--{$key}-->').val(0);
      $('#<!--{$key}-->__div').hide();
    }
    <!--{/foreach}-->
  });


  /**
  * ***********************************************************
  * 電子統一発票
  * 表示/非表示切替
  * ***********************************************************
  */

  /**
  * 統一發票寄送地址
  * P:個人地址 C:公司地址
  */
  $('input[name="receipt_type"]').change(function() {
    // val()でチェックの状態を取得
    var val = $('input[name=receipt_type]:checked').val();
    if (val == 'C') {
      console.log('c');
      $('#donate_type').removeAttr('checked');
      $('#carrier_number_donate_code').val('');
      $('#carrier_number_company_code').val('');
      $('#donate_type_area').hide();
      $('#donate_type_display').hide();
      $('#carrier_number_person_barcode').val('');
      $('#carrier_number_person_barcode_li').addClass('hide');

    } else {
      console.log('p');
      $('#carrier_number_person_barcode_li').removeClass('hide');
      $('#donate_type_display').show();
    }
    onChangeCarrierNumber();
  });


  /**
   * 載具の選択
   * 1:無載具 / 0:共通性載具
   */
  $('input[id^=carrier_type_]').click(function() {
    var isShow = ($(this).val() == 0) ? true : false;
    if (isShow) {
      $('#carrier_type_area').show();
    } else {
      $('#carrier_type_area').hide();
      $('#carrier_number_phone_barcode').val('');
      $('#carrier_number_person_barcode').val('');
    }
    onChangeCarrierNumber();
  });

  /**
  * 捐贈發票
  * チェックボックス
  */
  $('input[name="donate_type"]').change(function() {
    // val()でチェックの状態を取得
    var val = $('#donate_type:checked').val();
    // もしpropがチェック状態だったら
    if (val == 1) {
      $('#donate_type_area').show();
    } else {
      $('carrier_number_donate_code').val('');
      $('carrier_number_company_code').val('');
      $('#donate_type_area').hide();
    }
  });

  /**
   * GMOクレジット決済利用済み且つ、今回もクレジット決済の場合は利用するカードを選択する
   * 同一のカードを使う、または別のカードを新しく登録する
   */
  $('input[id^=gmo_]').click(function() {
      // 同一カードの使用か
      var isGmoSaveCard = ($(this).val() == 0) ? true : false;
      if (isGmoSaveCard) {
          $('#card_detail').hide();
          $('#card_used_info').show();
      } else {
          $('#card_detail').show();
          $('#card_used_info').hide();
      }
  });
  // 2016.03 yyasuda add end (GMO対応)


  /**
   * スマートフォン　コンビニ受取対応
   * スマートフォンの場合、コンビニ受取でコンビニ選択をする際、外部サイトに画面遷移する
   * （PCの場合は、小さいウインドウが開いて、コンビニ選択をする）
   * コンビニ選択画面に遷移する前に、セッションストレージに、現在画面の入力情報をすべて保持しているので、
   * 保持していた情報を画面に戻す
   */
  // セッションストレージにconvが存在する = コンビニ選択から戻ってきた
  var conv = window.sessionStorage.getItem('conv');

  if (conv == 'conv') {
    // 一度もどってきたら、removeする
    window.sessionStorage.removeItem('conv');

    // 支払方法
    $("input[name='payment_id']").val([window.sessionStorage.getItem('payment_id')]);
    $("input:radio[name=payment_id]:checked").click();

    // カード情報
    $("input[name='card_used_type']").val([window.sessionStorage.getItem('card_used_type')]);
    $("input:radio[name=card_used_type]:checked").click();
    $("input[name='card_name01']").val([window.sessionStorage.getItem('card_name01')]);
    $("input[name='card_name02']").val([window.sessionStorage.getItem('card_name02')]);
    $("#card_expire_year").val([window.sessionStorage.getItem('card_expire_year')]);
    $("#card_expire_month").val([window.sessionStorage.getItem('card_expire_month')]);
    $("input[name='card_number']").val([window.sessionStorage.getItem('card_number')]);
    $("input[name='security_number']").val([window.sessionStorage.getItem('security_number')]);

    // 受取方法
    $("input[name='receiving_method']").val([window.sessionStorage.getItem('receiving_method')]);
    $("input:radio[name=receiving_method]:checked").click();
    $("#conv_store_spot").val(window.sessionStorage.getItem('conv_store_spot'));
    $("#conv_store_num").val(window.sessionStorage.getItem('conv_store_num'));
    $("#conv_store_name").val(window.sessionStorage.getItem('conv_store_name'));
    $("#conv_store_tel").val(window.sessionStorage.getItem('conv_store_tel'));
    $("#conv_store_addr").val(window.sessionStorage.getItem('conv_store_addr'));

    // 統一発票
    $("input[name='receipt_type']").val([window.sessionStorage.getItem('receipt_type')]);
    $("input:radio[name=receipt_type]:checked").change();
    $("input:radio[name=receipt_type]:checked").click();
    $("input[name='company_code']").val([window.sessionStorage.getItem('company_code')]);
    $("input[name='company_name']").val([window.sessionStorage.getItem('company_name')]);

    // 電子統一発票
    $("input[name='donate_type']").val([window.sessionStorage.getItem('donate_type')]);
    $("input:checkbox[name=donate_type]:checked").change();
    $("#carrier_number_donate_code").val([window.sessionStorage.getItem('carrier_number_donate_code')]);
    $("input[name='carrier_type']").val([window.sessionStorage.getItem('carrier_type')]);
    $("input:radio[name=carrier_type]:checked").click();
    $("#carrier_number_phone_barcode").val([window.sessionStorage.getItem('carrier_number_phone_barcode')]);
    $("#carrier_number_person_barcode").val([window.sessionStorage.getItem('carrier_number_person_barcode')]);


    // その他
    $("textarea[name='message']").val([window.sessionStorage.getItem('message')]);

  }

  /* 2018.02.13 ytagawa クレジットカード番号入力欄 4 つ対応 */
  var cardNumber = $('[name="card_number"]')[0].value;
  if (cardNumber != null && cardNumber != '') {
    var cardNumberSize = cardNumber.length;
    if (cardNumberSize > 12) {
      $('[name="card_number_4"]')[0].value = cardNumber.substring(12, cardNumberSize);
    }
    if (cardNumberSize > 8) {
      var endIndex = (cardNumberSize < 12 ? cardNumberSize : 12);
      $('[name="card_number_3"]')[0].value = cardNumber.substring(8, endIndex);
    }
    if (cardNumberSize > 4) {
      var endIndex = (cardNumberSize < 8 ? cardNumberSize : 8);
      $('[name="card_number_2"]')[0].value = cardNumber.substring(4, endIndex);
    }
    if (cardNumberSize > 0) {
      var endIndex = (cardNumberSize < 4 ? cardNumberSize : 4);
      $('[name="card_number_1"]')[0].value = cardNumber.substring(0, endIndex);
    }
  }

  /* GMO エラーならカード情報をクリア */
  var gmoError = '<!--{$gmo_error|h}-->';
  if (gmoError != '') {
    $('[name="card_expire_year"]')[0].selectedIndex = 0;
    $('[name="card_expire_month"]')[0].selectedIndex = 0;
    $('[name="card_number_1"]')[0].value = '';
    $('[name="card_number_2"]')[0].value = '';
    $('[name="card_number_3"]')[0].value = '';
    $('[name="card_number_4"]')[0].value = '';
    $('[name="card_number_1"]')[0].style.backgroundColor = '#ffe8e8';
    $('[name="card_number_2"]')[0].style.backgroundColor = '#ffe8e8';
    $('[name="card_number_3"]')[0].style.backgroundColor = '#ffe8e8';
    $('[name="card_number_4"]')[0].style.backgroundColor = '#ffe8e8';
    $('[name="security_number"]')[0].value = '';
    $('[name="security_number"]')[0].style.backgroundColor = '#ffe8e8';
  }

});


function langCvsMapOpen() {
  // 宅配通
  var sUrl = "<!--{$smarty.const.CROS_HTTPS_URL}-->searchConvStore.html?dspFlag=2&host="+location.origin+"/user_data";
  var agent = navigator.userAgent;
  if (isUseMobile(agent)) {
    window.sessionStorage.setItem(["href"],[location.href]);

    // 支払方法
    window.sessionStorage.setItem(["payment_id"],[$("input[name='payment_id']:checked").val()]);

    // カード情報
    window.sessionStorage.setItem(["card_used_type"],[$("input[name='card_used_type']:checked").val()]);
    window.sessionStorage.setItem(["card_name01"],[$('[name="card_name01"]').val()]);
    window.sessionStorage.setItem(["card_name02"],[$('[name="card_name02"]').val()]);
    window.sessionStorage.setItem(["card_expire_year"],[$('#card_expire_year').val()]);
    window.sessionStorage.setItem(["card_expire_month"],[$('#card_expire_month').val()]);
    window.sessionStorage.setItem(["card_number"],[$('[name="card_number"]').val()]);
    window.sessionStorage.setItem(["security_number"],[$('[name="security_number"]').val()]);

    // 受取方法
    window.sessionStorage.setItem(["receiving_method"],[$("input[name='receiving_method']:checked").val()]);

    // 統一発票
    window.sessionStorage.setItem(["receipt_type"],[$("input[name='receipt_type']:checked").val()]);
    window.sessionStorage.setItem(["company_code"],[$('[name="company_code"]').val()]);
    window.sessionStorage.setItem(["company_name"],[$('[name="company_name"]').val()]);

    // 電子統一発票
    window.sessionStorage.setItem(["carrier_type"],[$("input[name='carrier_type']:checked").val()]);
    window.sessionStorage.setItem(["carrier_number_phone_barcode"],[$('#carrier_number_phone_barcode').val()]);
    window.sessionStorage.setItem(["carrier_number_person_barcode"],[$('#carrier_number_person_barcode').val()]);
    window.sessionStorage.setItem(["donate_type"],[$("input[name='donate_type']:checked").val()]);
    window.sessionStorage.setItem(["carrier_number_donate_code"],[$('#carrier_number_donate_code').val()]);

    // その他
    window.sessionStorage.setItem(["message"],[$('[name="message"]').val()]);

    window.location.href = sUrl;
  }
  else {
    window.open(sUrl, "_CvsMap", "height=652, width=965, top=0, left=0, toolbar=no, menubar=no, scrollbars=no, resizable=no,location=no, status=no");
  }
}

function open711Map() {

    var apiUrl = 'https://map.ec.ctwlogistics.com.tw/';
    var hostUrl = location.origin;
    var agent = navigator.userAgent;

    var form = null;

    // モバイルの場合、画面遷移.
    if (isUseMobile(agent)) {

    window.sessionStorage.setItem(["href"],[location.href]);

    // 支払方法
    window.sessionStorage.setItem(["payment_id"],[$("input[name='payment_id']:checked").val()]);

    // カード情報
    window.sessionStorage.setItem(["card_used_type"],[$("input[name='card_used_type']:checked").val()]);
    window.sessionStorage.setItem(["card_name01"],[$('[name="card_name01"]').val()]);
    window.sessionStorage.setItem(["card_name02"],[$('[name="card_name02"]').val()]);
    window.sessionStorage.setItem(["card_expire_year"],[$('#card_expire_year').val()]);
    window.sessionStorage.setItem(["card_expire_month"],[$('#card_expire_month').val()]);
    window.sessionStorage.setItem(["card_number"],[$('[name="card_number"]').val()]);
    window.sessionStorage.setItem(["security_number"],[$('[name="security_number"]').val()]);

    // 受取方法
    window.sessionStorage.setItem(["receiving_method"],[$("input[name='receiving_method']:checked").val()]);

    // 統一発票
    window.sessionStorage.setItem(["receipt_type"],[$("input[name='receipt_type']:checked").val()]);
    window.sessionStorage.setItem(["company_code"],[$('[name="company_code"]').val()]);
    window.sessionStorage.setItem(["company_name"],[$('[name="company_name"]').val()]);

    // 電子統一発票
    window.sessionStorage.setItem(["carrier_type"],[$("input[name='carrier_type']:checked").val()]);
    window.sessionStorage.setItem(["carrier_number_phone_barcode"],[$('#carrier_number_phone_barcode').val()]);
    window.sessionStorage.setItem(["carrier_number_person_barcode"],[$('#carrier_number_person_barcode').val()]);
    window.sessionStorage.setItem(["donate_type"],[$("input[name='donate_type']:checked").val()]);
    window.sessionStorage.setItem(["carrier_number_donate_code"],[$('#carrier_number_donate_code').val()]);

    // その他
    window.sessionStorage.setItem(["message"],[$('[name="message"]').val()]);

    form = document.form1;
    }
    // PC の場合、ポップアップで開く.
    else {

    window.open('about:blank', '711_map_dialog',
        'height=652, width=965, top=0, left=0, toolbar=no, ' +
        'menubar=no, scrollbars=no, resizable=no, location=no, status=no'
    );

    form = document.createElement('form');
    form.id = '711_map_form';
    form.target = '711_map_dialog';
    }

    /// post パラメータを生成
    var orderData = document.createElement('input');
    orderData.name = 'OrderData'; /// カートに入れてあるカード以外の情報
    orderData.type = 'hidden';
    orderData.value = hostUrl + '/tw/search711Store.html?dspFlag=2';

    var uid = document.createElement('input');
    uid.name = 'UID';
    uid.type = 'hidden';
    uid.value = 'b344da8f-8c32-47e4-baa7-7e7340e95177';

    var serviceType = document.createElement('input');
    serviceType.name = 'ServiceType'; /// コンビニ払い：1、コンビニ払い以外：3
    serviceType.type = 'hidden';
    serviceType.value = ($("input[name='payment_id']:checked").val() == '5' ? '1' : '3');

    var recallURL = document.createElement('input');
    recallURL.name = 'RecallURL'; /// コンビ二選択後のコールバック URL
    recallURL.type = 'hidden';
    recallURL.value = '<!--{$smarty.const.CROS_HTTPS_URL}-->ctw711callback';

    /// form 生成して小窓に post パラメータを渡す
    form.action = apiUrl;
    form.method = 'post';
    form.appendChild(orderData);
    form.appendChild(uid);
    form.appendChild(serviceType);
    form.appendChild(recallURL);

    /// レスポンシブ対応
    if (typeof(screen) != 'undefined' && screen.width <= 768) {
    var rwd = document.createElement('input');
    rwd.name = 'RWD';
    rwd.type = 'hidden';
    rwd.value = '1';
    form.appendChild(rwd);
    }

    document.body.appendChild(form);
    form.submit();

    /// PC の場合、小窓に POST パラメータを渡す用に作った form 要素を削除
    if (!isUseMobile(agent)) {
    $('#711_map_form').remove();
    }

}

function isUseMobile(agent) {
    return ( agent.search(/iPhone/) != -1 || agent.search(/iPad/) != -1 || agent.search(/iPod/) != -1 || agent.search(/Android/) != -1 );
}

// コンビニ受取が選択されている場合、コンビニ受取エリアを表示する
function isShowReceivingMethodCvs(){
  if ( $('input[name=receiving_method]:checked').val() === '1' ) {
    // コンビニ受取選択
    $('#input_cvs_area').show();
  } else {
    $('#input_cvs_area').hide();
  }
}

// 2016.10.20 yyausda add start (統一発票番号入力チェック)
function checkReceiptNumber() {
  var errorMessage = '';
  if (document.form1.receipt_company.checked == true) {
    var companyCode = $(':text[name="company_code"]').val();

    var isCompanyCodeErrFlg = false;
    // 2016.09 lin add start(数字かどうかのチェック)
    // 数字チェック, 入力数字規則ルール
    if ( isNaN(companyCode) ) {
      errorMessage += '統編需為8碼數字.';
      isCompanyCodeErrFlg = true;
    }
    // 2016.09 lin add end(数字かどうかのチェック)
    if (isCompanyCodeErrFlg != true) {
      if(companyCode.length != 8){
        errorMessage += '統編需為8碼數字.';
        isCompanyCodeErrFlg = true;
      }
    }
    //2016.09 lin add start(数字限定チェック)
    if (isCompanyCodeErrFlg != true) {
      var list = [1,2,1,2,1,2,4,1];
      var sumLeft = 0;
      var sumRight = 0;
      for (var i = 0; i < companyCode.length; i++) {
        sumLeft += parseInt(companyCode[i] * list[i] / 10);
        sumRight += companyCode[i] * list[i] % 10;
      }
      var sum = sumLeft + sumRight;
      if( sum % 10 != 0 && companyCode[6] != 7){
        errorMessage += '統編輸入有誤，請再次輸入';
        isCompanyCodeErrFlg = true;
      }
      // 00000000 もNGにする
      if ( companyCode == '00000000') {
        errorMessage += '統編輸入有誤，請再次輸入';
        isCompanyCodeErrFlg = true;
      }
    }
    if (isCompanyCodeErrFlg) {
      alert(errorMessage);
      return false;
    }

  }


  // 電子統一発票項目のエラーチェックの場合

  var carrierType = $("input[name='carrier_type']:checked").val();
  var donateType = $("input[name='donate_type']:checked").val();
  // 載具
  // 共通性載具を選択した場合の入力チェック
  if (carrierType == "0") {
    if (validatePhonePerson() != '') {
      alert(validatePhonePerson());
      return false;
    }
  }
  // 捐贈發票チェックした場合の入力チェック
  if (donateType == "1" && validateDonatecodeCompanyNot() != '') {
    alert(validateDonatecodeCompanyNot());
    return false;
  }

  return true;
}
// 2016.10.20 yyausda add end (統一発票番号入力チェック)

// 手機條碼と自然人憑證條碼のチェック
function validatePhonePerson() {
  var _carrierPhone = $('#carrier_number_phone_barcode').val();
  var _carrierPerson = $('#carrier_number_person_barcode').val();

  // 統一發票寄送地址
  // P:個人地址 C:公司地址
  // Cの場合、 carrier_number_person_barcode が非表示になる
  if ($('input[name=receipt_type]:checked').val() == 'P') {
    // 手機條碼と自然人憑證條碼の入力チェック
    // どちらか片方のみ入力があること
    if (_carrierPhone == "" && _carrierPerson == "") {
      return '手機條碼/自然人憑證條碼　只能選擇一個輸入。';
    } else if (_carrierPhone != "" && _carrierPerson != "") {
      return '手機條碼/自然人憑證條碼　只能選擇一個輸入。';
    }
  }
  else {
    // 手機條碼の入力チェック
    if (_carrierPhone == "") {
      return '手機條碼 入力必須';
    }
  }

  // 手機條碼の入力チェック
  if (_carrierPhone != '') {
    if (_carrierPhone.length != 8) {
      //手機條碼は8桁の値を指定して下さい。
      return '手機條碼載具格式有誤(8個字為/加上英數大寫或符號 + - .)';
    } else if ( !_carrierPhone.match(/^\/[A-Z0-9+-.]{7}$/) ) {
      // 手機條碼はスラッシュから始まる8桁の英数字、+、-、.でないといけないです。ご確認ください。
      // return '手機條碼為以 / 開頭的8位英數字或 + - . 符號。請確認輸入内容。';
      return '手機條碼載具格式有誤(8個字為/加上英數大寫或符號 + - .)';
    }
  }
  // 自然人憑證條碼の入力チェック
  // P:個人地址の場合のみチェックを行う
  if ($('input[name=receipt_type]:checked').val() == 'P' && _carrierPerson != '') {
    if (!_carrierPerson.match(/^[A-Z]{2}\d{14}$/)) {
      // return '自然人憑證條碼は2桁の大文字アルファベット＋14桁の数字の書式で指定して下さい。';
      return '自然人憑證條碼格式有誤(兩個大寫英文+14個數字)';
    }
  }

  return '';
}

// 愛心碼と統編のチェック
function validateDonatecodeCompanyNot() {
  var _carrierDonatecode = $('#carrier_number_donate_code').val();
  var _carrierCompanyCode = $('#carrier_number_company_code').val();
  // 愛心碼と統編の入力チェック
  if (_carrierDonatecode != "" && _carrierCompanyCode != "") {
    return '愛心碼/社福統編　只能選擇一個輸入。';
  }
  else if ( _carrierDonatecode == "" && _carrierCompanyCode == "") {
    return '愛心碼　入力必須。';
  } else {
    // 愛心碼の入力チェック
    if (_carrierDonatecode != '') {
      if (!_carrierDonatecode.match(/^[0-9]{3,7}$/)) {
        return '愛心碼必須為3-7位數字，請確認輸入内容。';
      }
    }
    // 統編の入力チェック
    if (_carrierCompanyCode != '') {

      if (isNaN(_carrierCompanyCode)) {
        return '統編需為8碼數字';
      }
      if (_carrierCompanyCode.length != 8) {
        return '統編需為8碼數字';
      }

      // 番号の計算
      var list = [1,2,1,2,1,2,4,1];
      var sumLeft = 0;
      var sumRight = 0;
      for (var i = 0; i < _carrierCompanyCode.length; i++) {
        sumLeft += parseInt(_carrierCompanyCode[i] * list[i] / 10);
        sumRight += _carrierCompanyCode[i] * list[i] % 10;
      }
      var sum = sumLeft + sumRight;
      // チェック
      if (sum % 10 != 0 && _carrierCompanyCode[6] != 7) {
        return '統編輸入有誤，請再次輸入';
      }
      if (_carrierDonatecode == '00000000') {
        return '統編輸入有誤，請再次輸入';
      }
    }
  }
  return '';
}

// '手機條碼'/'自然人憑證條碼'
//   ２つのテキストボックスは片方しか入力できない
//   １つのテキストボックスに値が入力された場合、
//   もう片方のテキストボックスの値はdisabledになる
//    - 手機條碼:carrier_number_phone_barcode
//    - 自然人憑證條碼:carrier_number_person_barcode
function onChangeCarrierNumber() {
  if ( $("#carrier_number_phone_barcode").val() == '' ) {
    $("#carrier_number_person_barcode")[0].disabled = false;
    $("#carrier_number_person_barcode")[0].style.backgroundColor = '';
  } else {
    $("#carrier_number_person_barcode")[0] = '';
    $("#carrier_number_person_barcode")[0].disabled = true;
    $("#carrier_number_person_barcode")[0].style.backgroundColor = '#dddddd';
  }

  if ( $("#carrier_number_person_barcode").val() == '' ) {
    $("#carrier_number_phone_barcode")[0].disabled = false;
    $("#carrier_number_phone_barcode")[0].style.backgroundColor = '';
  } else {
    $("#carrier_number_phone_barcode")[0] = '';
    $("#carrier_number_phone_barcode")[0].disabled = true;
    $("#carrier_number_phone_barcode")[0].style.backgroundColor = '#dddddd';
  }
}

/* 2018.02.13 ytagawa クレジットカード番号入力欄変更対応*/
function changeCardNumber() {
  var cn1 = $('[name="card_number_1"]')[0].value;
  var cn2 = $('[name="card_number_2"]')[0].value;
  var cn3 = $('[name="card_number_3"]')[0].value;
  var cn4 = $('[name="card_number_4"]')[0].value;
  $('[name="card_number"]')[0].value = (cn1 + cn2 + cn3 + cn4);
}
//]]>


</script>

        
        <link rel="stylesheet" href="../user_data/new_201811/css/new_chart.css" />
        <div class="W100 t_center">
          <div class="W1360 bread">
              <span class="f15 f_pink f_left"><a class="f_grey" href="/tw/">首頁 /</a> <a class="f_grey" href="/tw/user_data/product_list.php">MANARA商品 / </a>  <a class="f_grey" href="../cart/">購物清單 / </a> 付款與運送方式</span>
          </div>
        </div>
        <div id="undercolumn" class="container sec-wrap">
            <div id="main_text">
                <div id="shoppingCart">
                    <div id="undercolumn_shopping">
                        <ul class="flow_area">
                            <li class="active"><span>1</span>付款與運送方式</li>
                            <li><span>2</span>訂單確認</li>
                            <li><span>3</span>訂單完成</li>
                        </ul>
                        <h5 class="title f21 f_black t_left">指定送貨地址</h5>

                        <div id="address_area" class="clearfix f15">
                            <form name="form1" id="form1" method="post" action="?" onsubmit="return checkReceiptNumber();">
                                <input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME}-->" value="<!--{$transactionid}-->" />
                                <input type="hidden" name="mode" value="confirm" />
                                <input type="hidden" name="uniqid" value="<!--{$tpl_uniqid}-->" />
                                <input type="hidden" name="other_deliv_id" value="" />
                                <div class="border_round">
                                    <div class="information">
                                        <!--{if $tpl_addrmax < $smarty.const.DELIV_ADDR_MAX}-->
                                            <p>請選擇您要送貨的地址。若以下地址裡沒有您要送貨的地址，請點擊「增加新地址」。</p>
                                        <!--{/if}-->

                                        <!--{if $smarty.const.USE_MULTIPLE_SHIPPING !== false}-->
                                            <div class="add_multiple">
                                                <p>這個商品需要送往<br />多個地址嗎？</p>
                                                <a href="javascript:;" onclick="fnModeSubmit('multiple', '', ''); return false" >
                                                    <img src="<!--{$TPL_URLPATH}-->img/button/btn_several_address.jpg" name="several" id="several" />
                                                </a>
                                            </div>
                                        <!--{/if}-->
                                        <p class="mini attention f_red f15">※最多可增加<a href="<!--{$smarty.const.ROOT_URLPATH}-->mypage/delivery_addr.php" class="f_red" onclick="win02('<!--{$smarty.const.ROOT_URLPATH}-->mypage/delivery_addr.php?page=<!--{$smarty.server.SCRIPT_NAME|h}-->','new_deiv','600','640'); return false;"><!--{$smarty.const.DELIV_ADDR_MAX|h}-->個地址</a>。</p>
                                    
                                    </div>
                            
                                    <!--{if $arrErr.deli != ""}-->
                                    <p class="attention"><!--{$arrErr.deli}--></p>
                                    <!--{/if}-->
                                    <table summary="指定送貨地址" class="product-table">
                                        <tr class="f15 mb_none">
                                            <th class="W10">選擇</th>
                                            <th class="W17">種類</th>
                                            <th class="W50 t_left">地址</th>
                                            <th class="W10">變更</th>
                                            <th class="W10">刪除</th>
                                        </tr>
                                        <!--{section name=cnt loop=$arrAddr}-->
                                        <tr> 
                                            <td class="W10 t_center">
                                                <!--{if $smarty.section.cnt.first}-->
                                                <input type="radio" name="deliv_check" id="chk_id_<!--{$smarty.section.cnt.iteration}-->" value="-1" <!--{if $arrForm.deliv_check.value == "" || $arrForm.deliv_check.value == -1}--> checked="checked"<!--{/if}--> />
                                                <!--{else}-->
                                                <input type="radio" name="deliv_check" id="chk_id_<!--{$smarty.section.cnt.iteration}-->" value="<!--{$arrAddr[cnt].other_deliv_id}-->"<!--{if $arrForm.deliv_check.value == $arrAddr[cnt].other_deliv_id}--> checked="checked"<!--{/if}--> />
                                                <!--{/if}-->
                                            </td>
                                            <td class="W17 mb_none">
                                                <label for="chk_id_<!--{$smarty.section.cnt.iteration}-->">
                                                    <!--{if $smarty.section.cnt.first}-->
                                                        會員註冊地址
                                                    <!--{else}-->
                                                        增加送貨地址
                                                    <!--{/if}-->
                                                </label>
                                            </td>
                                            <td class="W50">
                                                <label for="chk_id_<!--{$smarty.section.cnt.iteration}-->" class="mb f_grey f13">
                                                  <!--{if $smarty.section.cnt.first}-->
                                                    會員註冊地址
                                                  <!--{else}-->
                                                      增加送貨地址
                                                  <!--{/if}-->
                                                </label>
                                               
                                                <!--{assign var=key value=$arrAddr[cnt].pref}-->
                                                <!--{$arrPref[$key]}--><!--{$arrAddr[cnt].addr01|h}--><!--{$arrAddr[cnt].addr02|h}--><br />
                                                <!--{$arrAddr[cnt].name01|h}--> <!--{$arrAddr[cnt].name02|h}-->
                                            </td>
                                            <td class="W10 t_center mb_none">
                                                <!--{if !$smarty.section.cnt.first}-->
                                                <a href="<!--{$smarty.const.ROOT_URLPATH}-->mypage/delivery_addr.php" onclick="win02('<!--{$smarty.const.ROOT_URLPATH}-->mypage/delivery_addr.php?page=<!--{$smarty.server.SCRIPT_NAME|h}-->&amp;other_deliv_id=<!--{$arrAddr[cnt].other_deliv_id}-->','new_deiv','600','640'); return false;">
                                                    <img src="../user_data/new_201811/img/icon/btn-edit.svg" alt="" class="edit">
                                                </a>
                                                <!--{else}-->
                                                -
                                                <!--{/if}-->
                                            </td>
                                            <td class="W10 t_center">
                                                <!--{if !$smarty.section.cnt.first}-->
                                                <a class="mb" href="<!--{$smarty.const.ROOT_URLPATH}-->mypage/delivery_addr.php" onclick="win02('<!--{$smarty.const.ROOT_URLPATH}-->mypage/delivery_addr.php?page=<!--{$smarty.server.SCRIPT_NAME|h}-->&amp;other_deliv_id=<!--{$arrAddr[cnt].other_deliv_id}-->','new_deiv','600','640'); return false;">
                                                      <img src="../user_data/new_201811/img/icon/btn-edit.svg" alt="" class="edit">
                                                </a>
                                                <!--{else}-->
                                                -
                                                <!--{/if}-->
                                                <!--{if !$smarty.section.cnt.first}-->
                                                <a href="?" class="delete" onclick="fnModeSubmit('delete', 'other_deliv_id', '<!--{$arrAddr[cnt].other_deliv_id}-->'); return false"></a>
                                                <!--{/if}-->
                                            </td>
                                        </tr>
                                        <!--{if $tpl_addrmax < $smarty.const.DELIV_ADDR_MAX}-->
                                        
                                        <!--{/if}-->
                                        <!--{/section}-->
                                    </table>
                                    <p class="addbtn">
                                        <a class="btn f_white bg_red" href="<!--{$smarty.const.ROOT_URLPATH}-->mypage/delivery_addr.php" onclick="win02('<!--{$smarty.const.ROOT_URLPATH}-->mypage/delivery_addr.php?page=<!--{$smarty.server.SCRIPT_NAME|h}-->','new_deiv','1080','1080'); return false;">
                                            增加新地址
                                        </a>
                                    </p>
                                </div>
                               
                                <h5 class="title f21 f_black t_left">指定付款方式‧到貨時間</h5>
                                <div class="border_round">
                                    <!--{assign var=key value="deliv_id"}-->
                                    <!--{if $is_single_deliv}-->
                                    <input type="hidden" name="<!--{$key}-->" value="<!--{$arrForm[$key].value|h}-->" id="deliv_id" />
                                    <!--{else}-->
                                    <div class="pay_area">
                                        <h3>選擇配送方法</h3>
                                        <p>請選擇配送方法</p>

                                        <!--{if $arrErr[$key] != ""}-->
                                        <p class="attention"><!--{$arrErr[$key]}--></p>
                                        <!--{/if}-->
                                        <table summary="配送方法選擇送貨方式">
                                            <col width="20%" />
                                            <col width="80%" />
                                            <tr>
                                                <th class="alignC">選擇</th>
                                                <th class="alignC" colspan="2">配送方法</th>
                                            </tr>
                                            <!--{section name=cnt loop=$arrDeliv}-->
                                            <tr>
                                                <td class="alignC"><input type="radio" id="deliv_<!--{$smarty.section.cnt.iteration}-->" name="<!--{$key}-->" value="<!--{$arrDeliv[cnt].deliv_id}-->" style="<!--{$arrErr[$key]|sfGetErrorColor}-->" <!--{$arrDeliv[cnt].deliv_id|sfGetChecked:$arrForm[$key].value}--> />
                                                </td>
                                                <td>
                                                    <label for="deliv_<!--{$smarty.section.cnt.iteration}-->"><!--{$arrDeliv[cnt].name|h}--><!--{if $arrDeliv[cnt].remark != ""}--><p><!--{$arrDeliv[cnt].remark|h|nl2br}--></p><!--{/if}--></label>
                                                </td>
                                            </tr>
                                            <!--{/section}-->
                                        </table>
                                    </div>
                                    <!--{/if}-->
                            
                      
                      
                                  <!--{if $arrErr[$key] != ""}-->
                                  <p class="attention"><!--{$arrErr[$key]}--></p>
                                  <!--{/if}-->

                                <table summary="支払方法選擇付款方式" id="payment">
                                    <tr>
                                        <td class="W25">選擇付款方式</th>
                                        <td class="W75">
                                            <div class="W100">
                                                 <!--{assign var=key value="payment_id"}-->

                                                <!--{assign var=paymentId value=`$arrForm[$key].value`}-->
                                                <!--{if $arrPrices.subtotal >= 4000 && $paymentId == 5}-->
                                                <!--{assign var=paymentId value=2}-->
                                                <!--{/if}-->


                                                <!--{if $arrErr[$key] != ""}-->
                                                <p class="attention"><!--{$arrErr[$key]}--></p>
                                                <!--{/if}-->
                                                
                                            </div>
                                            <div class="W100">
                                                <!--{section name=cnt loop=$arrPayment}-->
                                                <!--{if $arrPayment[cnt].payment_id != 7}-->
                                                    <!--{if $arrPrices.subtotal < 4000 || ($arrPrices.subtotal >= 4000 && $arrPayment[cnt].payment_id != 5)}-->
                                                    <div class="inline" id="payment_method">
                                                        <input type="radio" id="pay_<!--{$smarty.section.cnt.iteration}-->" name="<!--{$key}-->"  value="<!--{$arrPayment[cnt].payment_id}-->" style="<!--{$arrErr[$key]|sfGetErrorColor}-->" <!--{$arrPayment[cnt].payment_id|sfGetChecked:$paymentId}--> />
                                                    
                                                        <label for="pay_<!--{$smarty.section.cnt.iteration}-->"><!--{$arrPayment[cnt].payment_method|h}--><!--{if $arrPayment[cnt].note != ""}--><!--{/if}--></label>
                                                    
                                                        <!--{if $img_show}-->
                                                            <!--{if $arrPayment[cnt].payment_image != ""}-->
                                                                <img src="<!--{$smarty.const.IMAGE_SAVE_URLPATH}--><!--{$arrPayment[cnt].payment_image}-->" />
                                                            <!--{/if}-->
                                                        <!--{/if}-->
                                                    </div>
                                                    <!--{/if}-->
                                                <!--{/if}-->
                                                <!--{/section}-->

                                            </div>

                                          <div id="card_info" style="<!--{if $paymentId != 1}-->display:none;<!--{/if}-->">
                <!--{*
                        #2309 ytagawa
                        gmo_used_flg = 1 の場合、同一カード/別カードの選択肢を表示.
                *}-->
                <!--{assign var=key0 value="card_used_type"}-->
                <!--{if isset($is_gmo_used_flg|smarty:nodefaults) && $is_gmo_used_flg == 1}-->
                    <div id="card_used_flag">
                                                <!--{assign var=key0 value="card_used_type"}-->
                                                <span class="attention"><!--{$arrErr[$key0]}--></span>
                                                <p class="attention">若使用別張卡片，則目前所有未出貨的定期訂單，往後將以此新卡號進行刷卡結帳。</p>
                                                <input type="radio" id="gmo_same_card" name="<!--{$key0}-->" value="0" <!--{$arrForm[$key0].value|sfGetChecked:'0'}--> style="<!--{$arrErr[$key0]|sfGetErrorColor}-->" />
                                                <label for="gmo_same_card">使用同張信用卡</label>
                                                <input type="radio" id="gmo_other_card" name="<!--{$key0}-->" value="1" <!--{$arrForm[$key0].value|sfGetChecked:'1'}--> />
                                                <label for="gmo_other_card">使用別張信用卡​</label>
                                            </div>
                                            <!--{else}-->
                                            <input type="hidden" name="card_used_type" value="1" />
                                            <!--{/if}-->

                                            <!--{if $gmo_error != ''}-->
                                            <div class="W100" style="background-color: #ffe8e8;padding: 12px;">
                                                <div class="attention" style="font-weight: bold;margin-bottom: 5px;">信用卡支付失敗。請嘗試使用不同的信用卡，或是其他的非信用卡付款方式進行支付。</div>
                                                <div class="attention" style="font-weight: bold;margin-bottom: 5px;">（支付失敗原因可能為信用卡額度不足、過期或其他原因。確切的失敗原因請聯繫信用卡發行單位進行確認。）</div>
                                                <div class="attention" style="padding: 20px;"><!--{$gmo_error|h}--></div>
                                            </div>
                                            <!--{/if}-->

                <!--{* カード情報の登録 *}-->
                <!--{*
                        #2309 ytagawa
                        カード決済実績があって別カードの場合、カード情報入力は非表示.
                *}-->
                <div id="card_detail" style="<!--{if isset($is_gmo_used_flg|smarty:nodefaults) && $is_gmo_used_flg == 1 && $arrForm[$key0].value == 0}-->display:none;<!--{/if}-->">
                                              <!--{assign var=key1 value="card_name01"}-->
                                              <!--{assign var=key2 value="card_name02"}-->
                                              <!--{assign var=key3 value="card_expire_year"}-->
                                              <!--{assign var=key4 value="card_expire_month"}-->
                                              <!--{assign var=key5 value="card_number"}-->
                                              <!--{assign var=key6 value="security_number"}-->
                                              <!--{if $arrErr[$key1] || $arrErr[$key2] || $arrErr[$key3] || $arrErr[$key4] || $arrErr[$key5] || $arrErr[$key6]}-->
                                              <div class="attention W100">
                                                <!--{$arrErr[$key1]}--><!--{$arrErr[$key2]}--><!--{$arrErr[$key3]}-->
                                                <!--{$arrErr[$key4]}--><!--{$arrErr[$key5]}--><!--{$arrErr[$key6]}-->
                                              </div>
                                              <!--{/if}-->
                                              <div class="W100">
                                                <p class="card_head">持卡人</p>
                                                <p class="card_detail">
                                                  <input placeholder="姓氏" type="text" name="<!--{$key1}-->" value="<!--{$arrForm[$key1].value|default:$tpl_card_name01}-->" maxlength="<!--{$smarty.const.STEXT_LEN}-->" style="<!--{$arrErr[$key1]|sfGetErrorColor}-->;" class="box80" />
                                                  <input placeholder="名字" type="text" name="<!--{$key2}-->" value="<!--{$arrForm[$key2].value|default:$tpl_card_name02}-->" maxlength="<!--{$smarty.const.STEXT_LEN}-->" style="<!--{$arrErr[$key2]|sfGetErrorColor}-->;" class="box120" />
                                                </p>
                                              </div>
                                              
                                              <div class="W100">
                                                <p class="card_head">有效期限</p>
                                                <p class="card_detail">
                                                  <select class="box100" name="<!--{$key3}-->" id="<!--{$key3}-->" style="<!--{$arrErr[$key3]|sfGetErrorColor}-->">
                                                    <option value="" selected disabled hidden>選擇年份</option>
                                                    <!--{assign var=shipping_time_value value=$arrForm[$key3].value}-->
                                                    <!--{html_options options=$arrYears selected=$shipping_time_value}-->
                                                  </select>
                                                  <select class="box100" name="<!--{$key4}-->" id="<!--{$key4}-->" style="<!--{$arrErr[$key4]|sfGetErrorColor}-->">
                                                    <option value="" selected disabled hidden>選擇月份</option>
                                                    <!--{assign var=shipping_time_value value=$arrForm[$key4].value}-->
                                                    <!--{html_options options=$arrMonths selected=$shipping_time_value}-->
                                                  </select>
                                                </p>
                                              </div>

                                              <div class="W100">
                                                <p class="card_head">卡號</p>
                                                <p class="card_detail">
                                                  <input type="text" name="<!--{$key5}-->_1" maxlength="4" onchange="changeCardNumber();" style="<!--{$arrErr[$key5]|sfGetErrorColor}-->;" class="box100 cardNumber" />
                                                  <input type="text" name="<!--{$key5}-->_2" maxlength="4" onchange="changeCardNumber();" style="<!--{$arrErr[$key5]|sfGetErrorColor}-->;" class="box100 cardNumber" />
                                                  <input type="text" name="<!--{$key5}-->_3" maxlength="4" onchange="changeCardNumber();" style="<!--{$arrErr[$key5]|sfGetErrorColor}-->;" class="box100 cardNumber" />
                                                  <input type="text" name="<!--{$key5}-->_4" maxlength="4" onchange="changeCardNumber();" style="<!--{$arrErr[$key5]|sfGetErrorColor}-->;" class="box100 cardNumber" /></p>
                                              </div>

                                              <div class="W100">
                                                <p class="card_head">安全碼</p>
                                                <p class="card_detail">
                                                  <input type="text" name="<!--{$key6}-->" value="<!--{$arrForm[$key6].value|default:$tpl_security_number}-->" maxlength="3" style="<!--{$arrErr[$key6]|sfGetErrorColor}-->;" class="box100 cardNumber" /><br />
                                                  <input type="hidden" name="<!--{$key5}-->" value="<!--{$arrForm[$key5].value|default:$tpl_card_number}-->" />
                                                </p>
                                              </div>

                                                <!--{* 2017.07.21 yyasuda add start (マスクしたクレジットカード情報の表示) *}-->
                <!--{*
                        #2309 ytagawa
                        カード決済実績がない、またはカード決済実績はあるけど別カードの場合、前回カード情報は非表示.
                *}-->
                <div id="card_used_info">
                <!--{if $arrForm[$key0].value == 0 && isset($mask_card_number|smarty:nodefaults)}-->
                    <span>前次刷卡號碼：<!--{$mask_card_number}--></span>
                <!--{/if}-->
                </div>
                                                <!--{* 2017.07.21 yyasuda add end (マスクしたクレジットカード情報の表示) *}-->


                                              
                                            </div>

                                          </div>
                                          
                                        </td>
                                    </tr>

                                    <tr>
                                      <td class="W25">取貨方式</td>
                                      <td class="W75">
                                        <!--{assign var=receiving_method_key value="receiving_method"}-->
                                        <!--{assign var=receivingMethod value=`$arrForm[$receiving_method_key].value`}-->
                                        <!--{if $arrPrices.subtotal >= 4000 && $receivingMethod == 1}-->
                                        <!--{assign var=receivingMethod value=0}-->
                                        <!--{/if}-->

                                        <div class="W100">
                                            <span class="attention"><!--{$arrErr[$receiving_method_key]}--></span>
                                            <span id="receiving_method_house_area" style="<!--{if $paymentId == 5}-->display:none;<!--{/if}-->">
                                                <input type="radio" id="receiving_method_house" name="receiving_method" value="0" <!--{$receivingMethod|sfGetChecked:'0'}--> onclick="fnCheckInputReceiptType();" style="<!--{$arrErr[$receiving_method_key]|sfGetErrorColor}-->" /><label for="receiving_method_house">宅配 &nbsp;</label>
                                            </span>

                                            <!--{if $arrPrices.subtotal < 4000}-->
                                            <span id="receiving_method_cvs_area" style="<!--{if $paymentId == 2}-->display:none;<!--{/if}-->">
                                                <input type="radio" id="receiving_method_cnv" name="receiving_method" value="1" /><label for="receiving_method_cnv">超商取貨(7-11/全家/OK/萊爾富)</label>
                                            </span>
                                            <!--{/if}-->
                                        </div>

                                        
                                        <div id="input_cvs_area" style="<!--{if $receivingMethod == 0}-->display:none;<!--{/if}-->">
                                            <!-- CTW -->
                                            <div class="W100">
                                                <p onclick="open711Map()" class="f_red inline">選擇7-ELEVEN門市</p>&nbsp;&nbsp;
                                                <p onclick="langCvsMapOpen()" class="f_red inline">選擇全家/OK/萊爾富</p>
                                                <br />
                                            </div>

                                            <!-- 宅配通、SF -->
                                            <!-- <p><input type="button" value="選擇取貨超商" onclick="langCvsMapOpen()"></p> -->

                                            <div class="attention W100">
                                                因超商取貨會以簡訊做通知，所以需要您的手機號碼資訊，若您在登錄會員資料時，電話號碼非手機號碼，請先進入「會員」後，再連結「會員內容變更」，將電話號碼變更為手機號碼後，再進行產品購買，謝謝。
                                            </div>
                                            <br>
                                            
                                            <!--{assign var=key1 value="conv_store_spot"}-->
                                            <!--{assign var=key2 value="conv_store_name"}-->
                                            <!--{assign var=key3 value="conv_store_tel"}-->
                                            <!--{assign var=key4 value="conv_store_addr"}-->
                                            <!--{assign var=key5 value="conv_store_num"}-->
                                            <!--{if $arrErr[$key1] || $arrErr[$key2] || $arrErr[$key3] || $arrErr[$key4] || $arrErr[$key5]}-->
                                            <div class="attention W100">
                                                <!--{$arrErr[$key1]}--><!--{$arrErr[$key2]}--><!--{$arrErr[$key3]}--><!--{$arrErr[$key4]}--><!--{$arrErr[$key5]}-->
                                            </div>
                                            <!--{/if}-->
                                            <div class="W100"><p class="card_head">超商ID</p><p class="card_detail"><input type="text" id="<!--{$key1}-->" name="<!--{$key1}-->" value="<!--{$arrForm[$key1].value|default:$tpl_cvs_spot}-->"  style="<!--{$arrErr[$key1]|sfGetErrorColor}-->;" class="box120" readonly="readonly" /> </p></div>
                                            <div class="W100"><p class="card_head">超商名</p><p class="card_detail"><input type="text" id="<!--{$key2}-->" name="<!--{$key2}-->" value="<!--{$arrForm[$key2].value|default:$tpl_cvs_name}-->" style="<!--{$arrErr[$key2]|sfGetErrorColor}-->;" class="box200" readonly="readonly" /> </p></div>
                                            <div class="W100"><p class="card_head">超商電話</p><p class="card_detail"><input type="text" id="<!--{$key3}-->" name="<!--{$key3}-->" value="<!--{$arrForm[$key3].value|default:$tpl_cvs_tel}-->" style="<!--{$arrErr[$key3]|sfGetErrorColor}-->;" class="box200" readonly="readonly" /> </p></div>
                                            <div class="W100"><p class="card_head">超商地址</p><p class="card_detail"><input type="text" id="<!--{$key4}-->" name="<!--{$key4}-->" value="<!--{$arrForm[$key4].value|default:$tpl_cvs_addr}-->" style="<!--{$arrErr[$key4]|sfGetErrorColor}-->;" class="box400" readonly="readonly" /> </p></div>
                                            <input type="hidden" id="<!--{$key5}-->" name="<!--{$key5}-->" value="<!--{$arrForm[$key5].value|default:$tpl_cvs_num}-->" style="<!--{$arrErr[$key5]|sfGetErrorColor}-->;" class="box150" readonly="readonly" />
                                        </div>
                                        

                                        <!--{if $cartKey != $smarty.const.PRODUCT_TYPE_DOWNLOAD}-->
                                        <div class="pay_area02" style="margin-bottom: 0;">
                                        <!--{if true}--> <!--{* delete delivery date and time selection *}-->
                                            <!--{foreach item=shippingItem name=shippingItem from=$arrShipping}-->
                                            <!--{assign var=index value=$shippingItem.shipping_id}-->
                                            <!--{assign var=key value="deliv_time_id`$index`"}-->
                                            <input type="hidden" name="<!--{$key}-->" id="<!--{$key}-->" value="0" />
                                            <!--{/foreach}-->
                                        <!--{foreach from=$arrDelivDate key=keyString item=valueString name=deliv_date0}-->
                                        <!--{if $smarty.foreach.deliv_date0.index == 0}-->
                                            <input type="hidden" name="deliv_date0" id="deliv_date0" value="<!--{$keyString}-->">
                                        <!--{/if}-->
                                        <!--{/foreach}-->
                                        <!--{else}--> <!--{* delete delivery date and time selection *}-->
                                        <!--{/if}--> <!--{* delete delivery date and time selection *}-->
                                        </div>
                                        <!--{/if}-->


                                      </td>
                                    </tr>

                                    


                                    <tr>
                                      <td class="W25">
                                        選擇送貨日期
                                      </td>
                                      <td class="W75">
                                        <!--{foreach item=shippingItem name=shippingItem from=$arrShipping}-->
                                        <!--{assign var=index value=$shippingItem.shipping_id}-->
                                        <div class="delivdate top">
                                            <!--{if $is_multiple}-->
                                              <span class="st">
                                                <!--{$shippingItem.shipping_name01}--><!--{$shippingItem.shipping_name02}-->
                                                <!--{$arrPref[$shippingItem.shipping_pref]}--><!--{$shippingItem.shipping_addr01}-->
                                                <!--{$shippingItem.shipping_addr02}-->
                                              </span>
                                            <!--{/if}-->
                                            <!--★お届け日★-->
                                            <!--{assign var=key value="deliv_date`$index`"}-->
                                            <span class="attention"><!--{$arrErr[$key]}--></span>
                                          
                                            <!--{if !$arrDelivDate}-->
                                                沒有指定。
                                            <!--{else}-->
                                                <select class="box200" name="<!--{$key}-->" id="<!--{$key}-->" style="<!--{$arrErr[$key]|sfGetErrorColor}-->">
                                                <!-- 一度コメントアウトする    <option value="" selected="">未指定</option> -->
                                                    <!--{assign var=shipping_date_value value=$arrForm[$key].value|default:$shippingItem.shipping_date}-->
                                                    <!--{html_options options=$arrDelivDate selected=$shipping_date_value}-->
                                                </select>&nbsp;
                                                <!-- 2017.12.12 ytagawa add start -->
                                                <!--{assign var=cvsKey value="cvs_deliv_date`$index`"}-->
                                                <select name="<!--{$cvsKey}-->" id="<!--{$cvsKey}-->" style="display:none;">
                                                    <!--{html_options options=$arrConvDelivDate}-->
                                                </select>&nbsp;
                                                <!--{assign var=shippingDateValue value="shipping_date_value`$index`"}-->
                                                <input type="hidden" id="<!--{$shippingDateValue}-->" value="<!--{$shipping_date_value}-->">
                                                <!-- 2017.12.12 ytagawa add end -->
                                            <!--{/if}-->
                                            <br />
                                            <!--★お届け時間★-->
                                            <!--{assign var=key value="deliv_time_id`$index`"}-->
                                            <span class="attention"><!--{$arrErr[$key]}--></span>
                                        </div>
                                        <!--{/foreach}-->
                                      </td>
                                    </tr>

                                    <tr>
                                      <td class="W25">選擇送貨時間</td>
                                      <td class="W75">
                                        <div id="<!--{$key}-->__div" style="<!--{if $receivingMethod == 1}-->display:none;<!--{/if}-->">
                                            <select class="box200" name="<!--{$key}-->" id="<!--{$key}-->" style="<!--{$arrErr[$key]|sfGetErrorColor}-->">
                                                <!--{assign var=shipping_time_value value=$arrForm[$key].value|default:$shippingItem.time_id}-->
                                                <!--{html_options options=$arrDelivTime selected=$shipping_time_value}-->
                                            </select>
                                        </div>
                                      </td>
                                    </tr>

                                    <!-- ▼定期 ここから -->
                                    <!--{if $is_regular}-->
                                    <tr>
                                      <td class="W25">定期配送周期</td>
                                      <td class="W75">
                                        <select name="delivery_cycle" id="delivery_cycle" hidden>
                                            <option value="60">60</option>
                                          </select>
                                          60天
                                      </td>
                                    </tr>
                                    <!--{/if}-->
                                    <!-- ▲定期 ここまで -->


                                    <!-- ▼ポイント使用 ここから -->
                                    <!--{if $tpl_login == 1 && $smarty.const.USE_POINT !== false}-->
                                    <tr>
                                      <td class="W25">ポイント使用の指定/</td>
                                      <td class="W75">
                                       
                                        <div class="point_area">
                                            <div class="W100">
                                              <span class="attention">
                                              紅利點數1點可抵扣
                                              <!--{$smarty.const.POINT_VALUE|number_format}-->元
                                              </span>
                                              <br />
                                              若要使用點數，請確認「使用紅利點數」後，填入本次使用點數
                                            </div>
                                            <div class="point_announce W100">
                                              <p>
                                                <span class="user_name">
                                                  <!--{$name01|h}--> <!--{$name02|h}-->先生/小姐</span>目前所持之紅利點數為<span class="point"><!--{$tpl_user_point|default:0|number_format}-->Pt</span><br />
                                                  本次購買金額總計：<span class="price"><!--{$arrPrices.subtotal|number_format}-->元</span> <span class="attention">(未含運費及手續費)</span>
                                              </p>
                                              
                                              <div class="W100">
                                                <input type="radio" id="point_on" name="point_check" value="1" <!--{$arrForm.point_check.value|sfGetChecked:1}--> onclick="fnCheckInputPoint();" />
                                                <label for="point_on">使用紅利點數</label>
                                                <!--{assign var=key value="use_point"}-->
                                                本次購物使用 
                                                <input type="text" name="<!--{$key}-->" value="<!--{$arrForm[$key].value|default:$tpl_user_point}-->" maxlength="<!--{$arrForm[$key].length}-->" style="<!--{$arrErr[$key]|sfGetErrorColor}-->" class="box100" /> 
                                                pt
                                                <span class="attention"><!--{$arrErr[$key]}--></span>
                                              
                                              </div>
                                              <div class="W100">
                                                <input type="radio" id="point_off" name="point_check" value="2" <!--{$arrForm.point_check.value|sfGetChecked:2}--> onclick="fnCheckInputPoint();" />
                                                <label for="point_off">不使用紅利點數</label>
                                              </div>      
                                                  
                                            </div>
                                        </div>
                                        
                                      </td>
                                    </tr>
                                    <!--{/if}-->
                                    <!-- ▲ポイント使用 ここまで -->
                                   
                                </table>

                                </div>

                                <h5 class="title f21 f_black t_left">發票資訊</h5>
                                <div class="border_round">
                                  <table>
                                    
                                    <tr>
                                      <td class="W25 top-15">發票類型</td>
                                      
                                      <td class="W75">
                                        <!--{assign var=key value="receipt_type"}-->
                                        <span class="attention W100"><!--{$arrErr[$key]}--></span>
                                        <div class="W100" <!--{if $arrErr[$key] != ""}--><!--{sfSetErrorStyle}--><!--{/if}-->>
                                          <input type="radio" id="receipt_people" name="receipt_type" value="P" <!--{$arrForm[$key].value|sfGetChecked:'P'}--> onclick="fnCheckInputReceiptType();" style="<!--{$arrErr[$key]|sfGetErrorColor}-->" /><label for="receipt_people">個人</label>
                                          <input type="radio" id="receipt_company" name="receipt_type" value="C" <!--{$arrForm[$key].value|sfGetChecked:'C'}--> onclick="fnCheckInputReceiptType();" /><label for="receipt_company">公司報帳用發票</label>
                                        </div>

                                        <!--{assign var=key1 value="company_code"}-->
                                        <!--{assign var=key2 value="company_name"}-->
                                        <!--{if $arrErr[$key1] || $arrErr[$key2]}-->
                                        <div class="attention W100"><!--{$arrErr[$key1]}--><!--{$arrErr[$key2]}--></div>
                                        <!--{/if}-->
                                        <div class="W100">
                                          <div class="inline">統編&nbsp;<input type="text" name="<!--{$key1}-->" value="<!--{$arrForm[$key1].value|default:$tpl_company_code}-->" maxlength="<!--{$smarty.const.STEXT_LEN}-->" style="<!--{$arrErr[$key1]|sfGetErrorColor}-->;" class="box200" /></div>
                                          <div class="inline">統編抬頭&nbsp;<input type="text" name="<!--{$key2}-->" value="<!--{$arrForm[$key2].value|default:$tpl_company_name}-->" maxlength="<!--{$smarty.const.STEXT_LEN}-->" style="<!--{$arrErr[$key2]|sfGetErrorColor}-->;" class="box200" /></div>
                                        </div>
                                        
                                      </td>
                                    </tr>

                                    <tr>
                                      <td class="W25">載具</td>
                                      
                                      <td class="W75">
                                        <!--{assign var=key value="carrier_type"}-->
                                        <span class="attention"><!--{$arrErr[$key]}--></span>
                                        <div class="W100" <!--{if $arrErr[$key] != ""}--><!--{sfSetErrorStyle}--><!--{/if}-->>
                                          <input type="radio" id="<!--{$key}-->_1" name="<!--{$key}-->" value="1" <!--{$arrForm[$key].value|sfGetChecked:'1'}-->  /><label for="<!--{$key}-->_1">無載具</label>
                                          <input type="radio" id="<!--{$key}-->_0" name="<!--{$key}-->" value="0" <!--{$arrForm[$key].value|sfGetChecked:'0'}--> style="<!--{$arrErr[$key]|sfGetErrorColor}-->" /><label for="<!--{$key}-->_0">共通性載具</label>
                                        </div>

                                        <div id="<!--{$key}-->_area">
                                          <!--{assign var=key1 value="carrier_number_phone_barcode"}-->
                                          <!--{assign var=key2 value="carrier_number_person_barcode"}-->
                                          <!--{if $arrErr[$key1] || $arrErr[$key2]}-->
                                            <div class="attention W100"><!--{$arrErr[$key1]}--><!--{$arrErr[$key2]}--></div>
                                          <!--{/if}-->
                                          <ul class="W100">
                                            <li id="<!--{$key1}-->_li" class="inline"><input placeholder="手機條碼" type="text" id="<!--{$key1}-->" name="<!--{$key1}-->" value="<!--{$arrForm[$key1].value}-->" maxlength="<!--{$smarty.const.STEXT_LEN}-->" style="<!--{$arrErr[$key1]|sfGetErrorColor}-->;" class="box200" onchange="onChangeCarrierNumber();" />&nbsp;</li>
                                            <li id="<!--{$key2}-->_li" class="inline"><input placeholder="自然人憑證條碼" type="text" id="<!--{$key2}-->" name="<!--{$key2}-->" value="<!--{$arrForm[$key2].value}-->" maxlength="<!--{$smarty.const.STEXT_LEN}-->" style="<!--{$arrErr[$key2]|sfGetErrorColor}-->;" class="box200" onchange="onChangeCarrierNumber();" /></li>
                                          </ul>
                                        </div>

                                        <div id="donate_type_display" class="W100">
                                          <!--{assign var=key value="donate_type"}-->
                                          <label><input type="checkbox" name="donate_type" id="donate_type" value="1" <!--{if $arrForm[$key].value == 1}--> checked="checked" <!--{/if}--> />捐贈發票</label>
                                          <div id="<!--{$key}-->_area">
                                            <!--{assign var=key1 value="carrier_number_donate_code"}-->
                                            <!--{assign var=key2 value="carrier_number_company_code"}-->
                                            <!--{if $arrErr[$key1] || $arrErr[$key2]}-->
                                            <div class="attention W100"><!--{$arrErr[$key1]}--><!--{$arrErr[$key2]}--></div>
                                            <!--{/if}-->
                                            <ul>
                                              <li>愛心碼&nbsp;<input type="text" id="<!--{$key1}-->" name="<!--{$key1}-->" value="<!--{$arrForm[$key1].value}-->" maxlength="<!--{$smarty.const.STEXT_LEN}-->" style="<!--{$arrErr[$key1]|sfGetErrorColor}-->;" class="box100" /></li>
                                              <li style="display:none;">社福統編&nbsp;<input type="text" id="<!--{$key2}-->" name="<!--{$key2}-->" value="<!--{$arrForm[$key2].value}-->" maxlength="<!--{$smarty.const.STEXT_LEN}-->" style="<!--{$arrErr[$key2]|sfGetErrorColor}-->;" class="box300" /></li>
                                            </ul>
                                          </div>
                                        </div>
                                      </td>
                                    </tr>
                                  </table>
                                </div>

                                <h5 class="title f21 f_black t_left">備註留言</h5>
                                <p>若有其他疑問，請在此處填寫諮詢內容。</p>
                                <table>
                                  <tr>
                                    <div class="pay_area02">
                                      <div class="W100">
                                          <!--{assign var=key value="message"}-->
                                          <span class="attention"><!--{$arrErr[$key]}--></span>
                                          <textarea name="<!--{$key}-->" style="<!--{$arrErr[$key]|sfGetErrorColor}-->" cols="70" rows="2" class="txtarea border_round W100" wrap="hard" maxlength="15" placeholder=" (最多15個字)"><!--{"\n"}--><!--{$arrForm[$key].value|h}--></textarea>
                                      </div>
                                    </div>
                                  </tr>
                                </table>

                                <div class="btn_area">
                                    <a href="<!--{$smarty.const.CART_URLPATH}-->" class="btn f_black bg_white mr15" name="back03" id="back03">返回修改</a>
                                    <button name="send_button" class="btn f_white bg_red" name="send_button" id="send_button">下一步</button>
                                </div>
                                <!--   肚子結束  -->
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

