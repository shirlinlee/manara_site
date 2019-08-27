<!--{*
/*
 * This file is part of EC-CUBE
 *
 * Copyright(c) 2000-2012 LOCKON CO.,LTD. All Rights Reserved.
 *
 * http://www.lockon.co.jp/
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 2
 * of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
 */
*}-->
<script type="text/javascript" src="<!--{$smarty.const.ROOT_URLPATH}-->js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="<!--{$smarty.const.ROOT_URLPATH}-->js/jquery.facebox/facebox.js"></script>
<script type="text/javascript" src="<!--{$smarty.const.ROOT_URLPATH}-->js/jquery.ui/jquery-ui-1.8.24.custom.min.js"></script>

<link rel="stylesheet" type="text/css" href="<!--{$smarty.const.ROOT_URLPATH}-->js/jquery.ui/smoothness/jquery-ui-1.8.24.custom.css" media="screen" />
<link rel="stylesheet" type="text/css" href="<!--{$smarty.const.ROOT_URLPATH}-->js/jquery.facebox/facebox.css" media="screen" />
<script type="text/javascript">//<![CDATA[

    $(document).ready(function() {
        $('a.expansion').facebox({
            loadingImage : '<!--{$smarty.const.ROOT_URLPATH}-->js/jquery.facebox/loading.gif',
            closeImage   : '<!--{$smarty.const.ROOT_URLPATH}-->js/jquery.facebox/closelabel.png'
        });
    });

    // 宅配配送日リスト
    var shippingDateList = [];

    // コンビニ配送日リスト
    var cvsShippingDateList = [];

    $(function() {

        // 2017.12.11 ytagawa add start
        // ランディングページから取得する宅配配送日
        var ldShippingDate = null;

        // ランディングページから取得するコンビニ配送日
        var ldCvsShippingDate = null;

        // 選択した配送日
        var shippingDateValue = $('input[id^="shipping_date_value"]').val();

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

        // コンビニ配送できない日付を定義
        var excludeDates = [
                '2018/12/31',
                '2019/01/01',
                '2019/01/02',
                '2019/01/03',
                '2019/02/04',
                '2019/02/05',
                '2019/02/06',
                '2019/02/07',
                '2019/02/08',
                '2019/02/09',
                '2019/02/10',
                '2019/02/11',
                '2019/02/12',
                '2019/04/06',
                '2019/04/07',
                '2019/04/08',
                '2019/04/09',
                '2019/06/09',
                '2019/06/10',
                '2019/06/11',
                '2019/09/15',
                '2019/09/16',
                '2019/09/17',
                '2019/10/12',
                '2019/10/13',
                '2019/10/14',
                '2019/10/15'];

        // 配送日リスト
        var defulatEarliestShippingDate = [];

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
                $('select[name^=update_shipping_date] option').each(function(item) {
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
                $('select[name^=cvs_update_shipping_date] option').each(function(item) {
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

            var selectedValue = (shippingDateValue != null ? shippingDateValue : $('select[name^=update_shipping_date]').val());
            shippingDateValue = null;  // 2 回目以降は使用しないのでクリア

            var isCvs = ($('input[name=receiving_method]:checked').val() == '1');

            $('select[name^=update_shipping_date] option').remove();

            var _list = (isCvs ? cvsShippingDateList : shippingDateList);
            for (var i = 0, l = _list.length; i < l; i++) {
                var value = _list[i];
                var selected = (value == selectedValue ? 'selected' : '');
                $('select[name^=update_shipping_date]').append('<option label="' + value + '" value="' + value + '" ' + selected + '>' + value + '</option>');
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


        $('input[id^=receiving_method_]').click(function() {

            if ($(this).val() == 1) {
                $('[receiving-method="0"]').each(function() {
                    $(this).hide();
                });
                $('[receiving-method="1"]').each(function() {
                    $(this).show();
                });
            }
            else {
                $('[receiving-method="0"]').each(function() {
                    $(this).show();
                });
                $('[receiving-method="1"]').each(function() {
                    $(this).hide();
                });
            }

            $('#receiving_method').val($(this).val());

            refershShippingList();

        });

    });



    function openConvMap() {

        // 宅配通
        var sUrl = "<!--{$smarty.const.CROS_HTTPS_URL}-->searchConvStore.html?dspFlag=2&host="+location.origin+"/user_data";

        // SF
//      var sUrl = "<!--{$smarty.const.ROOT_URLPATH}-->searchSFConvStore.html?dspFlag=2";

        var agent = navigator.userAgent;

        if (isUseMobile(agent)) {
            window.sessionStorage.setItem(["href"],[location.href]);
            window.sessionStorage.setItem('conv', 'conv');
            window.location.href = sUrl;
        }
        else {
            window.open(sUrl, "_CvsMap", "height=652, width=965, top=0, left=0, toolbar=no, menubar=no, scrollbars=no, resizable=no,location=no, status=no");
        }

    }


    /**
     * 2018.11.07 ytagawa
     *
     * CTW 向け、7-11 選択画面表示.
     */
    function open711Map() {

        var apiUrl = 'https://map.ec.ctwlogistics.com.tw/';
        var hostUrl = location.origin;
        var agent = navigator.userAgent;

        var form = null;

        // モバイルの場合、画面遷移.
        if (isUseMobile(agent)) {

            window.sessionStorage.setItem(["href"],[location.href]);
            window.sessionStorage.setItem('conv', 'conv');

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
        orderData.value = hostUrl + '/search711Store.html?dspFlag=2';

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


    // セッションストレージにconvが存在する = コンビニ選択から戻ってきた
    var conv = window.sessionStorage.getItem('conv');

    if (conv == 'conv') {
        // 一度もどってきたら、removeする
        window.sessionStorage.removeItem('conv');

        // 受取方法
//        $("input[name='receiving_method']").val([window.sessionStorage.getItem('receiving_method')]);
//        $("input:radio[name=receiving_method]:checked").click();
        $("#conv_store_spot").val(window.sessionStorage.getItem('conv_store_spot'));
        $("#conv_store_num").val(window.sessionStorage.getItem('conv_store_num'));
        $("#conv_store_name").val(window.sessionStorage.getItem('conv_store_name'));
        $("#conv_store_tel").val(window.sessionStorage.getItem('conv_store_tel'));
        $("#conv_store_addr").val(window.sessionStorage.getItem('conv_store_addr'));

    }

    // 郵便番号検索ウィンドウを開く
    function showZipSearchDialog(){

        $('#dialogCity1').empty();
        $('#dialogCity2').empty();
        $('#dialogZipCode').empty();
        var o = new Option("-- 選擇 --", "");
        $(o).html("-- 選擇 --");
        $("#dialogCity1").append(o);

        var o1 = new Option("-- 選擇 --", "");
        $(o1).html("-- 選擇 --");
        $("#dialogCity2").append(o1);

        var prefCode = $('#pref').val();

        if ( prefCode != null && prefCode != "" ) {
            $("#dialogPref").val(prefCode);
            refreshCity1();
        }

        $('#zipSearchDialog').dialog({width:600});
        $('#zipSearchDialog').dialog('open');

    }


    // 市区町村１セレクトリストをリフレッシュする
    function refreshCity1(){

        var prefVal = $("#dialogPref").val();

        $.ajax({
            type: "get",
            url: "../zipSearch.php",
            data: { "target": "city1" , "prefCd" : prefVal},
            crossDomain: false,
            dataType : "jsonp",
            jsonp: "callBack",
            success : function(data) {
                $('#dialogCity1').empty();
                $('#dialogCity2').empty();
                $('#dialogZipCode').empty();
                var o = new Option("-- 選擇 --", "");
                $(o).html("-- 選擇 --");
                $("#dialogCity1").append(o);

                var o1 = new Option("-- 選擇 --", "");
                $(o1).html("-- 選擇 --");
                $("#dialogCity2").append(o1);

                for ( var i=0;i<data.length;i++ ) {
                    var o = new Option(data[i]["name"], data[i]["id2"]);
                    $(o).html(data[i]["name"]);
                    $("#dialogCity1").append(o);
                }
            }
        });

    }

    // 市区町村2セレクトリストをリフレッシュする
    function refreshCity2(){

        var prefVal = $("#dialogPref").val();
        var cityVal = $("#dialogCity1").val();

        $.ajax({
            type: "get",
            url: "../zipSearch.php",
            data: { "target": "city2" , "prefCd" : prefVal , "cityCd" : cityVal },
            crossDomain: false,
            dataType : "jsonp",
            jsonp: "callBack",
            success : function(data) {
                $('#dialogCity2').empty();
                $('#dialogZipCode').empty();
                var o = new Option("-- 選擇 --", "");
                $(o).html("-- 選擇 --");
                $("#dialogCity2").append(o);

                for ( var i=0;i<data.length;i++ ) {
                    var o = new Option(data[i]["name"], data[i]["id3"]);
                    $(o).html(data[i]["name"]);
                    $("#dialogCity2").append(o);
                }
            }
        });

    }

    // 郵便番号リストをリフレッシュする
    function refreshZipCodeList(){

        var prefVal = $("#dialogPref").val();
        var cityVal1 = $("#dialogCity1").val();
        var cityVal2 = $("#dialogCity2").val();

        $.ajax({
            type: "get",
            url: "../zipSearch.php",
            data: { "target": "zip" , "prefCd" : prefVal , "cityCd1" : cityVal1 ,  "cityCd2" : cityVal2},
            crossDomain: false,
            dataType : "jsonp",
            jsonp: "callBack",
            success : function(data) {
                $('#dialogZipCode').empty();

                var prefOption = $('[name=dialogPref] option:selected').text();
                var city1Option = $('[name=dialogCity1] option:selected').text();
                var city2Option = $('[name=dialogCity2] option:selected').text();

                var isFirst = true;

                for ( var i=0;i<data.length;i++ ) {
                    var o = new Option(data[i]["zipcode"] + "  :  " + data[i]["name"], data[i]["zipcode"],isFirst,isFirst);
                    isFirst = false;
                    $(o).html(data[i]["zipcode"] + "  :  " + prefOption + " " + city1Option + " " + city2Option + " " + data[i]["name"]);
                    $("#dialogZipCode").append(o);
                }
            }
        });

    }


    function zipCodeSelecAction(){

        var zipCode = $("select[name='dialogZipCode']").val();

        if ( zipCode == null || zipCode == "" ) {
            return;
        }

        var prefCode = $("select[name='dialogPref']").val();
        var cityName1 = $('[name=dialogCity1] option:selected').text();
        var cityName2 = $('[name=dialogCity2] option:selected').text();

        $('#zipcode').val(zipCode);
        $('#pref').val(prefCode);
        $('#addr01').val(cityName1 + cityName2);

        $('#zipSearchDialog').dialog('close');

        /// 市区町村のプルダウンを構築して値を選択
        refreshAddressCity();
    }


    /**
     * 市区町村セレクトリストをリフレッシュ.
     */
    function refreshAddressCity() {

        var prefVal = $("#pref").val();

        $.ajax({
            type: "get",
            url: "../zipSearch.php",
            data: { "target": "city1" , "prefCd" : prefVal},
            crossDomain: false,
            dataType : "jsonp",
            jsonp: "callBack",
            success : function(data) {

                /// 選択肢を削除
                $("#citySelect").children().remove();

                /// 選択値をクリア
                $("#city").val('');

                /// 選択肢を追加
                var o = new Option("請選擇區域", "");
                $(o).html("請選擇區域");
                $("#citySelect").append(o);

                var addr01 = $("#addr01").val();

                for (var i = 0; i < data.length; i++) {
                    var cityName = data[i]["name"];
                    var selected = false;

                    if (addr01 != null && addr01.indexOf(cityName) != -1) {
                        $("#city").val(cityName);
                        $("#addr01").val(addr01.replace(cityName, ''));
                        selected = true;
                    }

                    var o = new Option(cityName, cityName, false, selected);
                    $(o).html(cityName);
                    $("#citySelect").append(o);
                }
            }
        });
    }

    /**
     * 市区町村変更時.
     */
    function changeAddressCity() {
        var cityName = $("#citySelect").val();
        $("#city").val(cityName);
    }

    /**
     * onload.
     */
    $(document).ready(function() {
        /// 会員情報変更画面では、pref が選択済みなので、市の選択ボックス生成.
        var prefVal = $("#pref").val();
        if (prefVal != null) {
            refreshAddressCity();
        }

        $('#zipSearchDialog').dialog({
            autoOpen: false,
            modal: true,
            closeOnEscape: false,
            resizable : false,
        }); 
    });



    /**
     * 配送予定日を更新.
     */
    function updateShippingDate() {

        var shippingDate = $('select#update_shipping_date').val();

        if (shippingDate != null && shippingDate != '') {

            if ((shippingDateList.length > 0 && shippingDateList.indexOf(shippingDate) != -1)
                  || (cvsShippingDateList.length > 0 && cvsShippingDateList.indexOf(shippingDate) != -1)) {

<!--{* #1576 オーソリ済、実売済の受注では、配送予定日を変更する前に警告を表示. *}-->
<!--{if $is_confirm_card_authorized}-->
                if (isShippingDateChanged) {
                    if (window.confirm('因信用卡作業已授權完成(或已扣款完成)，是否還要修改配送預定日？')) {
                        fnFormModeSubmit('form1', 'update', 'order_id', <!--{$tpl_arrOrderData.order_id}-->);
                    }
                }
                else {
                    fnFormModeSubmit('form1', 'update', 'order_id', <!--{$tpl_arrOrderData.order_id}-->);
                }
<!--{else}-->
                fnFormModeSubmit('form1', 'update', 'order_id', <!--{$tpl_arrOrderData.order_id}-->);
<!--{/if}-->

            }

        }

    }


    function fnFormModeSubmit(form, mode, keyname, keyid) {
        document.forms[form]['mode'].value = mode;
        if(keyname != "" && keyid != "") {
            document.forms[form][keyname].value = keyid;
        }
        document.forms[form].submit();
    }


    /// 配送予定日の変更を保持.
    isShippingDateChanged = false;

    function changeShippingDate(el) {
        isShippingDateChanged = false;
        if ($('#shipping_date_value1').val() != el.value) {
            isShippingDateChanged = true;
        }
    }


//]]></script>

<div id="undercolumn2">

    <div id="mypagecolumn" class="container sec-wrap">

        <h2 class="title"><!--{$tpl_title|h}--></h2>

        <!--{include file=$tpl_navi}-->
        <div id="mycontents_area">

            <span class="attention"><!--{$error_message|h}--></span>

        <!--{foreach item=shippingItem name=shippingItem from=$arrShipping}-->
            <!--{assign var=index value=$shippingItem.shipping_id}-->
            <h3>送貨地址（編集）<!--{if $isMultiple}--><!--{$smarty.foreach.shippingItem.iteration}--><!--{/if}--></h3>
            <!--{if $isMultiple}-->
            <table summary="お届け内容確認/">
                <col width="30%" />
                <col width="40%" />
                <col width="20%" />
                <col width="10%" />
                <tr>
                    <th class="alignC">商品編號</th>
                    <th class="alignC">商品名稱</th>
                    <th class="alignC">單價</th>
                    <th class="alignC">數量</th>
                    <!--{* XXX 購入小計と誤差が出るためコメントアウト
                    <th>Subtotal</th>
                    *}-->
                </tr>
                <!--{foreach item=item from=$shippingItem.shipment_item}-->
                <tr>
                    <td><!--{$item.productsClass.product_code|h}--></td>
                    <td><!--{* 商品名 *}--><!--{$item.productsClass.name|h}--><br />
                        <!--{if $item.productsClass.classcategory_name1 != ""}-->
                            <!--{$item.productsClass.class_name1}-->:<!--{$item.productsClass.classcategory_name1}--><br />
                        <!--{/if}-->
                        <!--{if $item.productsClass.classcategory_name2 != ""}-->
                            <!--{$item.productsClass.class_name2}-->:<!--{$item.productsClass.classcategory_name2}-->
                        <!--{/if}-->
                    </td>
                    <td class="alignR">
                        <!--{$item.price|sfCalcIncTax|number_format}--> NTD
                    </td>
                    <td class="alignC"><!--{$item.quantity}--></td>
                    <!--{* XXX 購入小計と誤差が出るためコメントアウト
                    <td class="alignR"><!--{$item.total_inctax|number_format}--></td> NTD
                    *}-->
                </tr>
                <!--{/foreach}-->
            </table>
            <!--{/if}-->

            <form name="form1" id="form1" method="post" action="?order_id=<!--{$tpl_arrOrderData.order_id}-->">
                <input type="hidden" name="order_id" value="<!--{$tpl_arrOrderData.order_id}-->">
                <input type="hidden" name="mode" value="update">
                <input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME}-->" value="<!--{$transactionid}-->" />

                <table summary="送貨地址" class="delivname">
                    <col width="30%" />
                    <col width="70%" />
                    <tbody>

                    <!--{* コンビニ払いがないアカウントでは、代引の場合、受取方法は選択できてはいけないので、こっちの tr を使う。
                    <!--{if $tpl_arrOrderData.payment_id == 2}-->
                        <tr style="display:none;">
                    <!--{else}-->
                        <tr>
                    <!--{/if}-->
                    *}-->
                        <tr>
                            <th class="alignL">取貨方式</th>
                            <td>
                                <!--{assign var=receiving_method value="$tpl_arrOrderData.receiving_method"}-->
                                <label style="margin-right: 10px;"><input type="radio" name="receiving_method" id="receiving_method_0" value="0" <!--{if $tpl_arrOrderData.receiving_method == 0}-->checked<!--{/if}-->>宅配</label>
                                <label style="margin-right: 10px;"><input type="radio" name="receiving_method" id="receiving_method_1" value="1" <!--{if $tpl_arrOrderData.receiving_method == 1}-->checked<!--{/if}-->>超商取貨</label>
                                <input type="hidden" id="receiving_method" value="<!--{$receiving_method|h}-->">

                                <!--{* CTW のみ *}-->
                                <!--{if $tpl_arrOrderData.receiving_method == 0}-->
                                <div class="attention" receiving-method="1" <!--{if $tpl_arrOrderData.receiving_method == 0}-->style="display:none;"<!--{/if}-->>
                                    因超商取貨會以簡訊做通知，所以需要您的手機號碼資訊，若您在登錄會員資料時，電話號碼非手機號碼，請先進入「會員」後，再連結「會員內容變更」，將電話號碼變更為手機號碼後，再將取貨方式變更為超商取貨，謝謝。
                                </div>
                                <!--{/if}-->

                            </td>
                        </tr>

                        <tr receiving-method="1" <!--{if $tpl_arrOrderData.receiving_method == 0}-->style="display:none;"<!--{/if}-->>
                            <th class="alignL">超商ID</th>
                            <td>
                                <div class="attention"><!--{$arrErr.conv_store_spot}--></div>
                                <div style="display: flex;justify-content: space-between;">
                                    <input type="text" id="conv_store_spot" name="conv_store_spot" readonly="readonly" value="<!--{$shippingItem.conv_store_spot|h}-->" style="border: 0;<!--{$arrErr.conv_store_spot|sfGetErrorColor}-->;"/>
                                    <div>

                    <!--{* CTW じゃないアカウントでは非表示。カルピス様など。 *}-->
                                        <button type="button" onclick="open711Map();" style="padding: 5px;">7-ELEVEN</button>
                    <!--{* CTW じゃないアカウントでは非表示。カルピス様など。 *}-->

                                        <button type="button" onclick="openConvMap();" style="padding: 5px;">全家/OK/萊爾富</button>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <tr receiving-method="1" <!--{if $tpl_arrOrderData.receiving_method == 0}-->style="display:none;"<!--{/if}-->>
                            <th class="alignL">超商名</th>
                            <td>
                                <input type="text" id="conv_store_name" name="conv_store_name" readonly="readonly" value="<!--{$shippingItem.conv_store_name|h}-->" style="border: 0;width: 100%;<!--{$arrErr.conv_store_spot|sfGetErrorColor}-->;" />
                            </td>
                        </tr>
                        <tr receiving-method="1" <!--{if $tpl_arrOrderData.receiving_method == 0}-->style="display:none;"<!--{/if}-->>
                            <th class="alignL">超商地址</th>
                            <td><input type="text" id="conv_store_addr" name="conv_store_addr" readonly="readonly" value="<!--{$shippingItem.conv_store_addr|h}-->" style="border: 0;width: 100%;<!--{$arrErr.conv_store_spot|sfGetErrorColor}-->;" /></td>
                        </tr>
                        <tr style="display:none;">
                            <th class="alignL">超商序数</th>
                            <td><input type="text" id="conv_store_num" name="conv_store_num" readonly="readonly" value="<!--{$shippingItem.conv_store_num|h}-->" /></td>
                        </tr>
                        <tr receiving-method="1" <!--{if $tpl_arrOrderData.receiving_method == 0}-->style="display:none;"<!--{/if}-->>
                            <th class="alignL">超商電話</th>
                            <td><input type="text" id="conv_store_tel" name="conv_store_tel" readonly="readonly" value="<!--{$shippingItem.conv_store_tel|h}-->" style="border: 0;width: 100%;<!--{$arrErr.conv_store_spot|sfGetErrorColor}-->;" /></td>
                        </tr>

                        <tr receiving-method="0" <!--{if $tpl_arrOrderData.receiving_method == 1}-->style="display:none;"<!--{/if}-->>
                            <th class="alignL">姓名</th>
                            <td>
                                <div class="attention"><!--{$arrErr.shipping_name01}--></div>
                                <input type="text" value="<!--{$shippingItem.shipping_name01|h}-->" name="shipping_name01" maxlength="<!--{$smarty.const.STEXT_LEN}-->" style="<!--{$arrErr.shipping_name01|sfGetErrorColor}-->;" class="box120" />&nbsp;
                                <div class="attention"><!--{$arrErr.shipping_name02}--></div>
                                <input type="text" value="<!--{$shippingItem.shipping_name02|h}-->" name="shipping_name02" maxlength="<!--{$smarty.const.STEXT_LEN}-->" style="<!--{$arrErr.shipping_name02|sfGetErrorColor}-->;" class="box120" />
                            </td>
                        </tr>
                        <tr receiving-method="0" <!--{if $tpl_arrOrderData.receiving_method == 1}-->style="display:none;"<!--{/if}-->>
                            <th class="alignL">郵遞區號</th>
                            <!--{* <td><!--{$shippingItem.shipping_zip01}-->-<!--{$shippingItem.shipping_zip02}--></td> *}-->
                            <td>
                                <div class="attention"><!--{$arrErr.shipping_zipcode}--></div>
                                <input type="text" id="zipcode" value="<!--{$shippingItem.shipping_zipcode}-->" style="width: 70px;<!--{$arrErr.shipping_zipcode|sfGetErrorColor}-->" name="shipping_zipcode" />
                                <a class="bt01" href="javascript:return false;" onclick="showZipSearchDialog();" target="_blank" style="color:blue;">郵遞區號檢索</a>
                            </td>
                        </tr>
                        <tr receiving-method="0" <!--{if $tpl_arrOrderData.receiving_method == 1}-->style="display:none;"<!--{/if}-->>
                            <th class="alignL">地址</th>
                            <td>
                                <!--{assign var=key1 value="`$prefix`zipcode"}-->
                                <!--{assign var=key3 value="`$prefix`pref"}-->
                                <!--{assign var=key6 value="`$prefix`city"}-->
                                <!--{assign var=key4 value="`$prefix`addr01"}-->
                                <!--{assign var=key5 value="`$prefix`addr02"}-->
                                <div class="attention"><!--{$arrErr.pref}--></div>
                                <select name="<!--{$key3}-->" id="pref" style="<!--{$arrErr[$key3]|sfGetErrorColor}-->" onchange="javascript:refreshAddressCity();">
                                    <option value="" selected="selected">請選擇城市</option>
                                    <!--{html_options options=$arrPref selected=$shippingItem.shipping_pref}-->
                                </select>

                                <div class="attention"><!--{$arrErr.city}--></div>
                                <select id="citySelect" style="<!--{$arrErr[$key6]|sfGetErrorColor}-->" onchange="javascript:changeAddressCity();">
                                    <option value="" selected="selected">請選擇區域</option>
                                </select>

                                <input type="hidden" id="city" name="<!--{$key6}-->" value="<!--{$arrForm[$key6]|h}-->" />

                                <div class="attention"><!--{$arrErr.addr01}--></div>
                                <p class="top"><input type="text" id="addr01" name="<!--{$key4}-->" value="<!--{$shippingItem.shipping_addr01|h}--><!--{$shippingItem.shipping_addr02|h}-->" class="box300" style="<!--{$arrErr[$key4]|sfGetErrorColor}-->;" /><br />
                                請填完整的地址</p>
                                <p class="top"><input type="hidden" id="addr02" name="<!--{$key5}-->" value="" class="box300" style="<!--{$arrErr[$key5]|sfGetErrorColor}-->;" /></p>

                            </td>
                        </tr>
                        <tr receiving-method="0" <!--{if $tpl_arrOrderData.receiving_method == 1}-->style="display:none;"<!--{/if}-->>
                            <th class="alignL">手機</th>
                            <td>
                                <div class="attention"><!--{$arrErr.shipping_tel01}--></div>
                                <input type="text" value="<!--{$shippingItem.shipping_tel01}-->" name="shipping_tel01" style="<!--{$arrErr.shipping_tel01|sfGetErrorColor}-->"/>
                            </td>
                        </tr>

                        <tr>
                            <th class="alignL">到貨予定日/時間</th>
                            <td>
                            <!--{if !$arrDelivDate}-->
                                <span><!--{$shippingItem.shipping_date|default:'未選定'|h}-->&nbsp;&nbsp;<!--{$shippingItem.shipping_time|default:'未選定'|h}--></span>
                            <!--{else}-->
                                <!--{assign var=key value="update_shipping_date"}-->
                                <select name="<!--{$key}-->" id="<!--{$key}-->" style="<!--{$arrErr[$key]|sfGetErrorColor}-->" onchange="changeShippingDate(this);">
                                <!--{assign var=shipping_date_value value=$arrForm[$key].value|default:$shippingItem.shipping_date}-->
                                <!--{html_options options=$arrDelivDate selected=$shipping_date_value}-->
                                </select>&nbsp;

                                <!--{assign var=cvsKey value="cvs_update_shipping_date"}-->
                                <select name="<!--{$cvsKey}-->" id="<!--{$cvsKey}-->" style="display:none;">
                                    <!--{html_options options=$arrConvDelivDate}-->
                                </select>&nbsp;

                                <!--{assign var=shippingDateValue value="shipping_date_value`$index`"}-->
                                <input type="hidden" id="<!--{$shippingDateValue}-->" value="<!--{$shipping_date_value}-->">

                                <div receiving-method="0" <!--{if $tpl_arrOrderData.receiving_method == 1}-->style="display:none;"<!--{/if}-->>
                                  <!--{* お届け時間（到貨時間）の表示 *}-->
                                  <!--{assign var=key value="update_deliv_time_id"}-->
                                  <select name="<!--{$key}-->" id="<!--{$key}-->" style="<!--{$arrErr[$key]|sfGetErrorColor}-->">
                                    <!--{assign var=shipping_time_value value=$arrForm[$key].value|default:$shippingItem.time_id}-->
                                    <!--{html_options options=$arrDelivTime selected=$shipping_time_value}-->
                                  </select>
                                </div>

                            <!--{/if}-->
                            </td>
                        </tr>

            <!--{* MP 様は定期サイクル不要 *}-->
            <!--{* カルピス様は定期サイクル「30日、45日、60日」 *}-->
            <!--{* 新日本製薬様は定期サイクル「30日、45日」 *}-->

            <!--{if $tpl_arrOrderData.regular_purchase_flg == 1}-->
                        <tr>
                            <th class="alignL">定期配送周期</th>
                            <td>
                                <select name="regular_cycle">
                                    <option value="30" <!--{if $tpl_arrOrderData.delivery_cycle == 30}-->selected<!--{/if}-->>30天</option>
                                    <option value="60" <!--{if $tpl_arrOrderData.delivery_cycle == 60}-->selected<!--{/if}-->>60天</option>
                                    <option value="90" <!--{if $tpl_arrOrderData.delivery_cycle == 90}-->selected<!--{/if}-->>90天</option>
                                </select>
                            </td>
                        </tr>
            <!--{/if}-->

                    </tbody>
                </table>
        <!--{/foreach}-->

                <br />

     
                <div class="btn_area">
                    <ul>
                        <li>
                            <a href="<!--{$smarty.const.ROOT_URLPATH}-->mypage/history.php?order_id=<!--{$tpl_arrOrderData.order_id}-->" onclick="" style="padding: 10px 30px;background: #999;font-size: 14px;margin-left: 20px;color: #FFF;">返回</a>
        <!--{if $tpl_arrOrderData.status == 300}-->
                            <a href="javascript:void(0);" onclick="updateShippingDate();return false;" style="padding: 10px 30px;background: #d3a443;font-size: 14px;margin-left: 20px;color: #FFF;">確認送出</a>
        <!--{/if}-->
                        </li>
                    </ul>
                </div>

            </form>

        </div>
    </div>
</div>

<div id="zipSearchDialog" title="郵遞區號檢索">
    1．請選擇縣市區道路名稱
    <div align="center">
        <select name="dialogPref" id="dialogPref" style="width:150px;" onchange="javascript:refreshCity1();">
            <option value="" >-- 選擇 --</option>
            <!--{html_options options=$arrPref selected=$arrForm[$key3].value}-->
        </select>
        <select name="dialogCity1" id="dialogCity1" style="width:150px;" onchange="javascript:refreshCity2();">
            <option value="" >-- 選擇 --</option>
        </select>
        <select name="dialogCity2" id="dialogCity2" style="width:150px;" onchange="javascript:refreshZipCodeList();">
            <option value="" >-- 選擇 --</option>
        </select>
        <br />
        <br />
    </div>
    <div>
        2．請在以下候補名單選擇您的郵遞區號
    </div>
    <div align="center">
        <select name="dialogZipCode" id="dialogZipCode" style="width:400px;" size="6">
            <option value="" ></option>
        </select>
    </div>
    <br />
    <div align="right">
        <input type="image" onmouseover="chgImgImageSubmit('<!--{$TPL_URLPATH}-->img/button/btn_next_on.jpg',this)" onmouseout="chgImgImageSubmit('<!--{$TPL_URLPATH}-->img/button/btn_next.jpg',this)" src="<!--{$TPL_URLPATH}-->img/button/btn_next.jpg" name="zipCodeSelect" id="zipCodeSelect" onClick="javascript:zipCodeSelecAction();"/>
    </div>
</div>

