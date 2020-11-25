<!--{*
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
 *}-->

<script type="text/javascript" src="<!--{$smarty.const.ROOT_URLPATH}-->js/jquery.facebox/facebox.js"></script>
<script type="text/javascript" src="<!--{$smarty.const.ROOT_URLPATH}-->js/jquery.ui/jquery-ui-1.8.24.custom.min.js"></script>

<link rel="stylesheet" type="text/css" href="<!--{$smarty.const.ROOT_URLPATH}-->js/jquery.ui/smoothness/jquery-ui-1.8.24.custom.css" media="screen" />
<link rel="stylesheet" type="text/css" href="<!--{$smarty.const.ROOT_URLPATH}-->js/jquery.facebox/facebox.css" media="screen" />

<script type="text/javascript">//<![CDATA[

  var send = true;

  function fnCheckSubmit() {
    if(send) {
      send = false;
      return true;
    } else {
      alert("正在處理中，請稍等。");
      return false;
    }
  }

  $(document).ready(function() {

    $('a.expansion').facebox({
      loadingImage : '<!--{$smarty.const.ROOT_URLPATH}-->js/jquery.facebox/loading.gif',
      closeImage   : '<!--{$smarty.const.ROOT_URLPATH}-->js/jquery.facebox/closelabel.png'
    });

    $('#zipSearchDialog').dialog({
          autoOpen: false,
          modal: true,
          closeOnEscape: false,
          resizable : false,
          height: 500,
          width: 700,
    });

  });


  // 1:住所 2:配送先
  var fieldFlg = '';

  // 郵便番号検索ウィンドウを開く
  function showZipSearchDialog(flg){

    fieldFlg = flg;

    if ( fieldFlg == '2' && !document.form1['deliv_check'].checked ) {
      return;
    }

    $('#dialogCity1').empty();
    $('#dialogCity2').empty();
    $('#dialogZipCode').empty();
	var o = new Option("----- 選擇 -----", "");
	$(o).html("----- 選擇 -----");
	$("#dialogCity1").append(o);

	var o1 = new Option("----- 選擇 -----", "");
	$(o1).html("----- 選擇 -----");
	$("#dialogCity2").append(o1);

    var prefCode = '';
    $("#dialogPref").val('');

    if ( fieldFlg == '1' ) {
      prefCode = $('#order_pref').val();
    }
    else {
      prefCode = $('#shipping_pref').val();
    }

    if ( prefCode != null && prefCode != "" ) {
      $("#dialogPref").val(prefCode);
      refreshCity1();
    }

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
		var o = new Option("----- 選擇 -----", "");
		$(o).html("----- 選擇 -----");
		$("#dialogCity1").append(o);

		var o1 = new Option("----- 選擇 -----", "");
		$(o1).html("----- 選擇 -----");
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
		var o = new Option("----- 選擇 -----", "");
		$(o).html("----- 選擇 -----");
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

    if ( fieldFlg == '1' ) {
      $('#order_zipcode').val(zipCode);
      $('#order_pref').val(prefCode);
      $('#order_addr01').val(cityName1 + cityName2);
    }
    else {
      $('#shipping_zipcode').val(zipCode);
      $('#shipping_pref').val(prefCode);
      $('#shipping_addr01').val(cityName1 + cityName2);
    }

    $('#zipSearchDialog').dialog('close');

  }

//]]>
</script>

<div id="zipSearchDialog" title="郵遞區號檢索">
  1．請選擇縣市區道路名稱
  <div align="center">
    <select name="dialogPref" id="dialogPref" style="width:200px;" onchange="javascript:refreshCity1();">
      <option value="" >----- 選擇 -----</option>
      <!--{html_options options=$arrPref selected=$arrForm[$key3].value}-->
    </select>
    <select name="dialogCity1" id="dialogCity1" style="width:200px;" onchange="javascript:refreshCity2();">
      <option value="" >----- 選擇 -----</option>
    </select>
    <select name="dialogCity2" id="dialogCity2" style="width:200px;" onchange="javascript:refreshZipCodeList();">
      <option value="" >----- 選擇 -----</option>
    </select>
    <br />
    <br />
  </div>
  <div>
    2．請在以下候補名單選擇您的郵遞區號
  </div>
  <div align="center">
    <select name="dialogZipCode" id="dialogZipCode" style="width:600px;" size="16">
    </select>
  </div>
  <br />
  <div align="right">
    <input type="image" onmouseover="chgImgImageSubmit('<!--{$TPL_URLPATH}-->img/button/btn_next_on.jpg',this)" onmouseout="chgImgImageSubmit('<!--{$TPL_URLPATH}-->img/button/btn_next.jpg',this)" src="<!--{$TPL_URLPATH}-->img/button/btn_next.jpg" name="zipCodeSelect" id="zipCodeSelect" onClick="javascript:zipCodeSelecAction();"/>
  </div>
</div>



<div id="undercolumn">
    <div id="undercolumn_customer">
        <p class="flow_area"><img src="<!--{$TPL_URLPATH}-->img/picture/img_flow_01.jpg" /></p>
        <h2 class="title"><!--{$tpl_title|h}--></h2>

        <div class="information">
            <p>請填寫以下欄位內容。「<span class="attention">※</span>」為必填欄位。<br />
                <!--{if $smarty.const.USE_MULTIPLE_SHIPPING !== false}-->
                    填寫后請點擊「送至以上地址」<br/>
                    或者您可以點擊「送至多個地址」。
                <!--{else}-->
                    填寫后請點擊最下方的「下一步」。<br />
										<span class="attention" style="font-size:120%;">[信用卡系統維護作業公告]</span><br />
										親愛的顧客，您好<br />
										為了提供更好的服務品質，我們預計將於 <span class="attention">2015年9月29日(星期二) 上午8:00~10:00</span> 進行信用卡系統升級維護作業。在維護期間信用卡交易將暫停服務，此段時間如有付款需求，建議您選擇其他付款方式，或等待系統維護完成後再進行付款作業。<br />
										如造成您的不便，敬請見諒。
                <!--{/if}-->
            </p>
        </div>

        <form name="form1" id="form1" method="post" action="?">
        <input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME}-->" value="<!--{$transactionid}-->" />
        <input type="hidden" name="mode" value="nonmember_confirm" />
        <input type="hidden" name="uniqid" value="<!--{$tpl_uniqid}-->" />


        <table summary=" ">
            <tr>
                <th>姓名<span class="attention">*</span></th>
                <td>
                    <!--{assign var=key1 value="order_name01"}-->
                    <!--{assign var=key2 value="order_name02"}-->
                    <span class="attention"><!--{$arrErr[$key1]}--><!--{$arrErr[$key2]}--></span>
                    姓&nbsp;<input type="text" name="<!--{$key1}-->" value="<!--{$arrForm[$key1].value|h}-->" maxlength="<!--{$arrForm[$key1].length}-->" style="<!--{$arrErr[$key1]|sfGetErrorColor}-->;" class="box120" />&nbsp;
                    名&nbsp;<input type="text" name="<!--{$key2}-->" value="<!--{$arrForm[$key2].value|h}-->" maxlength="<!--{$arrForm[$key2].length}-->" style="<!--{$arrErr[$key2]|sfGetErrorColor}-->;" class="box120" />
                </td>
            </tr>
            <tr>
                <th>郵編<span class="attention">*</span></th>
                <td valign="middle">
                    <!--{* <!--{assign var=key1 value="order_zip01"}--> *}-->
                    <!--{* <!--{assign var=key2 value="order_zip02"}--> *}-->
                    <!--{assign var=key1 value="order_zipcode"}-->

                    <!--{* <span class="attention"><!--{$arrErr[$key1]}--><!--{$arrErr[$key2]}--></span> *}-->
                    <span class="attention"><!--{$arrErr[$key1]}--></span>

                    <p class="top">
                        <!--{* &nbsp;<input type="text" name="<!--{$key1}-->" value="<!--{$arrForm[$key1].value|h}-->" maxlength="<!--{$arrForm[$key1].length}-->" style="<!--{$arrErr[$key1]|sfGetErrorColor}-->; ime-mode: disabled;" class="box60" />&nbsp;-&nbsp;    <input type="text"    name="<!--{$key2}-->" value="<!--{$arrForm[$key2].value|h}-->" maxlength="<!--{$arrForm[$key2].length}-->" style="<!--{$arrErr[$key2]|sfGetErrorColor}-->; ime-mode: disabled;" class="box60" /> *}-->
                        &nbsp;<input type="text" id="<!--{$key1}-->" name="<!--{$key1}-->" value="<!--{$arrForm[$key1].value|h}-->" maxlength="<!--{$arrForm[$key1].length}-->" style="<!--{$arrErr[$key1]|sfGetErrorColor}-->; ime-mode: disabled;" class="box60" />
                    </p>

                    <p class="zipimg">
                      <a class="bt01" href="javascript:return false;" onclick="showZipSearchDialog('1');" target="_blank">郵遞區號檢索</a>
                    </p>

                </td>
            </tr>
            <tr>
                <th>地址<span class="attention">*</span></th>
                <td>
                    <!--{assign var=key3 value="order_pref"}-->
                    <select id="<!--{$key3}-->" name="<!--{$key3}-->" style="<!--{$arrErr[$key3]|sfGetErrorColor}-->">
                            <option value="" selected="selected">請選擇城市</option>
                            <!--{html_options options=$arrPref selected=$arrForm[$key3].value}-->
                    </select>

                    <span class="attention"><!--{$arrErr.order_addr01}--><!--{$arrErr.order_addr02}--></span>
                    <p>
                        <!--{assign var=key value="order_addr01"}-->
                        <input type="text" id="<!--{$key}-->" name="<!--{$key}-->" value="<!--{$arrForm[$key].value|h}-->" maxlength="<!--{$arrForm[$key].length}-->" style="<!--{$arrErr[$key]|sfGetErrorColor}-->;" class="box380" /><br />
                        <!--{$smarty.const.SAMPLE_ADDRESS1}--></p>
                    <p>
                        <!--{assign var=key value="order_addr02"}-->
                        <input type="text" id="<!--{$key}-->" name="<!--{$key}-->" value="<!--{$arrForm[$key].value|h}-->" maxlength="<!--{$arrForm[$key].length}-->" style="<!--{$arrErr[$key]|sfGetErrorColor}-->;" class="box380" /><br />
                        <!--{$smarty.const.SAMPLE_ADDRESS2}--></p>
                    <p class="mini"><span class="attention">請務必註記大樓名稱。</span></p>
                </td>
            </tr>
            <tr>
                <th>電話<span class="attention">*</span></th>
                <td>
                    <!--{assign var=key1 value="order_tel01"}-->
                    <!--{assign var=key2 value="order_tel02"}-->
                    <!--{assign var=key3 value="order_tel03"}-->
                    <!--{if $arrErr[$key1] || $arrErr[$key2] || $arrErr[$key3]}-->
                        <div class="attention"><!--{$arrErr[$key1]}--><!--{$arrErr[$key2]}--><!--{$arrErr[$key3]}--></div>
                    <!--{/if}-->
                      1<span class="attention">*</span>&nbsp;<input type="text" name="<!--{$key1}-->" value="<!--{$arrForm[$key1].value|h}-->" maxlength="<!--{$smarty.const.TEL_ITEM_LEN}-->" style="<!--{$arrErr[$key1]|sfGetErrorColor}-->; ime-mode: disabled;" class="box300 top" /><br />
                      2<span class="attention">&nbsp;</span>&nbsp;<input type="text" name="<!--{$key2}-->" value="<!--{$arrForm[$key2].value|h}-->" maxlength="<!--{$smarty.const.TEL_ITEM_LEN}-->" style="<!--{$arrErr[$key2]|sfGetErrorColor}-->; ime-mode: disabled;" class="box300" />
                    <!--{*         <input type="text" name="<!--{$key3}-->" value="<!--{$arrForm[$key3]|h}-->" maxlength="<!--{$smarty.const.TEL_ITEM_LEN}-->" style="<!--{$arrErr[$key3]|sfGetErrorColor}-->; ime-mode: disabled;" class="box60" /> *}-->

                </td>
            </tr>
            <tr>
                <th>傳真號碼</th>
                <td>
                    <!--{assign var=key1 value="order_fax01"}-->
                    <!--{assign var=key2 value="order_fax02"}-->
                    <!--{assign var=key3 value="order_fax03"}-->
                    <!--{if $arrErr[$key1] || $arrErr[$key2] || $arrErr[$key3]}-->
                        <div class="attention"><!--{$arrErr[$key1]}--><!--{$arrErr[$key2]}--><!--{$arrErr[$key3]}--></div>
                    <!--{/if}-->
                    <input type="text" name="<!--{$key1}-->" value="<!--{$arrForm[$key1].value|h}-->" maxlength="<!--{$smarty.const.TEL_ITEM_LEN}-->" style="<!--{$arrErr[$key1]|sfGetErrorColor}-->; ime-mode: disabled;" class="box300 top" /><br />
                    <!--{*         <input type="text" name="<!--{$key2}-->" value="<!--{$arrForm[$key2].value|h}-->" maxlength="<!--{$smarty.const.TEL_ITEM_LEN}-->" style="<!--{$arrErr[$key2]|sfGetErrorColor}-->; ime-mode: disabled;" class="box300" /> *}-->
                    <!--{*         <input type="text" name="<!--{$key3}-->" value="<!--{$arrForm[$key3].value|h}-->" maxlength="<!--{$smarty.const.TEL_ITEM_LEN}-->" style="<!--{$arrErr[$key3]|sfGetErrorColor}-->; ime-mode: disabled;" class="box60" /> *}-->
                </td>

            </tr>
            <tr>
                <th>電子郵件<span class="attention">*</span></th>
                <td>
                    <!--{assign var=key value="order_email"}-->
                    <span class="attention"><!--{$arrErr[$key]}--></span>
                    <input type="text" name="<!--{$key}-->" value="<!--{$arrForm[$key].value|h}-->" maxlength="<!--{$arrForm[$key].length}-->" style="<!--{$arrErr[$key]|sfGetErrorColor}-->; ime-mode: disabled;" class="box380 top" /><br />
                    <!--{assign var=key value="order_email02"}-->
                    <span class="attention"><!--{$arrErr[$key]}--></span>
                    <input type="text" name="<!--{$key}-->" value="<!--{$arrForm[$key].value|h}-->" maxlength="<!--{$arrForm[$key].length}-->" style="<!--{$arrErr[$key]|sfGetErrorColor}-->; ime-mode: disabled;" class="box380" /><br />
                    <p class="mini"><span class="attention">請再次輸入以利確認</span></p>
                </td>
            </tr>
            <tr>
                <th>性別<span class="attention">*</span></th>
                <td>
                    <!--{assign var=key value="order_sex"}-->
                    <!--{if $arrErr[$key]}-->
                        <div class="attention"><!--{$arrErr[$key]}--></div>
                    <!--{/if}-->
                    <span style="<!--{$arrErr[$key]|sfGetErrorColor}-->">
        <!--{*                <input type="radio" id="none" name="<!--{$key}-->" value="0" <!--{if $arrForm[$key1].value eq 0}--> checked="checked" <!--{/if}--> /><label for="none">未選擇</label> *}-->
                        <input type="radio" id="man" name="<!--{$key}-->" value="1" <!--{if $arrForm[$key].value eq 1}--> checked="checked" <!--{/if}--> /><label for="man">男性</label>
                        <input type="radio" id="woman" name="<!--{$key}-->" value="2" <!--{if $arrForm[$key].value eq 2}--> checked="checked" <!--{/if}--> /><label for="woman">女性</label>
                    </span>
                </td>
            </tr>
            <tr>
                <th>職業</th>
                <td>
                    <!--{assign var=key value="order_job"}-->
                    <!--{if $arrErr[$key]}-->
                        <!--{assign var=err value="background-color: `$smarty.const.ERR_COLOR`"}-->
                    <!--{/if}-->
                    <select name="<!--{$key}-->" style="<!--{$arrErr[$key]|sfGetErrorColor}-->">
                        <option value="">請選擇</option>
                        <!--{html_options options=$arrJob selected=$arrForm[$key].value}-->
                    </select>
                </td>
            </tr>
            <tr>
                <th>出生年月日</th>
                <td>
                    <!--{assign var=errBirth value="`$arrErr.year``$arrErr.month``$arrErr.day`"}-->

                    <!--{if $errBirth}-->
                        <div class="attention"><!--{$errBirth}--></div>
                    <!--{/if}-->
                    <!--{* 民国暦の表示 *}-->
                                民国<select name="yearMinkoku" style="<!--{$errBirth|sfGetErrorColor}-->" onChange="this.form.year.value=this.form.yearMinkoku.value">
                                    <!--{html_options options=$arrYearMinkoku selected=$arrForm.year|default:''}-->
                                </select>年<br />
                    <!--{* 民国暦の表示 *}-->
                    <select name="year" style="<!--{$errBirth|sfGetErrorColor}-->" onChange="this.form.yearMinkoku.value=this.form.year.value">
                        <!--{html_options options=$arrYear selected=$arrForm.year.value|default:''}-->
                    </select>年
                    <select name="month" style="<!--{$errBirth|sfGetErrorColor}-->">
                        <!--{html_options options=$arrMonth selected=$arrForm.month.value|default:''}-->
                    </select>月
                    <select name="day" style="<!--{$errBirth|sfGetErrorColor}-->">
                        <!--{html_options options=$arrDay selected=$arrForm.day.value|default:''}-->
                    </select>日
                </td>


            </tr>
            <tr>
                <th colspan="2">
                <!--{assign var=key value="deliv_check"}-->
                <input type="checkbox" name="<!--{$key}-->" value="1" onclick="fnCheckInputDeliv();" <!--{$arrForm[$key].value|sfGetChecked:1}--> id="deliv_label" />
                <label for="deliv_label"><span class="attention">填寫送貨地址</span> ※若與以上地址相同則可省略。</label>
                </th>
            </tr>
            <tr>
                <th>姓名<span class="attention">*</span></th>
                <td>
                    <!--{assign var=key1 value="shipping_name01"}-->
                    <!--{assign var=key2 value="shipping_name02"}-->
                    <span class="attention"><!--{$arrErr[$key1]}--><!--{$arrErr[$key2]}--></span>
                    姓&nbsp;<input type="text" name="<!--{$key1}-->" value="<!--{$arrForm[$key1].value|h}-->" maxlength="<!--{$arrForm[$key1].length}-->" style="<!--{$arrErr[$key1]|sfGetErrorColor}-->;" class="box120" />&nbsp;
                    名&nbsp;<input type="text" name="<!--{$key2}-->" value="<!--{$arrForm[$key2].value|h}-->" maxlength="<!--{$arrForm[$key2].length}-->" style="<!--{$arrErr[$key2]|sfGetErrorColor}-->;" class="box120" />
                </td>
            </tr>
            <tr>
                <th>郵編<span class="attention">*</span></th>
                <td valign="middle">
                    <!--{* <!--{assign var=key1 value="shipping_zip01"}--> *}-->
                    <!--{* <!--{assign var=key2 value="shipping_zip02"}--> *}-->
                    <!--{assign var=key1 value="shipping_zipcode"}-->

                    <!--{* <span class="attention"><!--{$arrErr[$key1]}--><!--{$arrErr[$key2]}--></span> *}-->
                    <span class="attention"><!--{$arrErr[$key1]}--></span>

                    <p class="top">
                        <!--{* &nbsp;<input type="text" name="<!--{$key1}-->" value="<!--{$arrForm[$key1].value|h}-->" maxlength="<!--{$arrForm[$key1].length}-->" style="<!--{$arrErr[$key1]|sfGetErrorColor}-->; ime-mode: disabled;"    class="box60" />&nbsp;-&nbsp;    <input type="text"    name="<!--{$key2}-->" value="<!--{$arrForm[$key2].value|h}-->" maxlength="<!--{$arrForm[$key2].length}-->" style="<!--{$arrErr[$key2]|sfGetErrorColor}-->; ime-mode: disabled;" class="box60" /> *}-->
                        &nbsp;<input type="text" id="<!--{$key1}-->" name="<!--{$key1}-->" value="<!--{$arrForm[$key1].value|h}-->" maxlength="<!--{$arrForm[$key1].length}-->" style="<!--{$arrErr[$key1]|sfGetErrorColor}-->; ime-mode: disabled;"    class="box60" />
                    </p>

                    <p class="zipimg">
                      <a class="bt01" href="javascript:return false;" onclick="showZipSearchDialog('2');" target="_blank">郵遞區號檢索</a>
                    </p>

                    <!--{*
                    <p class="zipimg"><a class="bt01" href="<!--{$smarty.const.ROOT_URLPATH}-->地址/<!--{$smarty.const.DIR_INDEX_PATH}-->" onclick="fnPutAddress
                    ('<!--{$smarty.const.INPUT_ZIP_URLPATH}-->', 'shipping_zip01', 'shipping_zip02', 'shipping_pref', 'shipping_addr01'); return false;" target="_blank">自動帶入地址</a>
                        <span class="mini">&nbsp;輸入郵遞區號後，請點選。</span></p>
                    *}-->
                </td>
            </tr>
            <tr>
                <th>地址<span class="attention">*</span></th>
                <td>
                    <!--{assign var=key3 value="shipping_pref"}-->
                    <select id="<!--{$key3}-->" name="<!--{$key3}-->" style="<!--{$arrErr[$key3]|sfGetErrorColor}-->">
                            <option value="" selected="selected">請選擇城市</option>
                            <!--{html_options options=$arrPref selected=$arrForm[$key3].value}-->
                    </select>
                    <span class="attention"><!--{$arrErr.shipping_addr01}--><!--{$arrErr.shipping_addr02}--></span>
                    <p>
                        <!--{assign var=key value="shipping_addr01"}-->
                        <input type="text" id="<!--{$key}-->" name="<!--{$key}-->" value="<!--{$arrForm[$key].value|h}-->" maxlength="<!--{$arrForm[$key].length}-->" style="<!--{$arrErr[$key]|sfGetErrorColor}-->;" class="box380" /><br />
                        <!--{$smarty.const.SAMPLE_ADDRESS1}--></p>
                    <p>
                        <!--{assign var=key value="shipping_addr02"}-->
                        <input type="text" id="<!--{$key}-->" name="<!--{$key}-->" value="<!--{$arrForm[$key].value|h}-->" maxlength="<!--{$arrForm[$key].length}-->" style="<!--{$arrErr[$key]|sfGetErrorColor}-->;" class="box380" /><br />
                        <!--{$smarty.const.SAMPLE_ADDRESS2}--></p>
                    <p class="mini"><span class="attention">請務必註記大樓名稱。</span></p>
                </td>
            </tr>
            <tr>
                <th>電話<span class="attention">*</span></th>
                <td>
                    <!--{assign var=key1 value="shipping_tel01"}-->
                    <!--{assign var=key2 value="shipping_tel02"}-->
                    <!--{assign var=key3 value="shipping_tel03"}-->
                    <!--{if $arrErr[$key1] || $arrErr[$key2] || $arrErr[$key3]}-->
                        <div class="attention"><!--{$arrErr[$key1]}--><!--{$arrErr[$key2]}--><!--{$arrErr[$key3]}--></div>
                    <!--{/if}-->
                      1 <span class="attention">*</span>&nbsp;<input type="text" name="<!--{$key1}-->" value="<!--{$arrForm[$key1].value|h}-->" maxlength="<!--{$smarty.const.TEL_ITEM_LEN}-->" style="<!--{$arrErr[$key1]|sfGetErrorColor}-->; ime-mode: disabled;" class="box300 top" /><br />
                      2 <span class="attention">&nbsp;</span>&nbsp;<input type="text" name="<!--{$key2}-->" value="<!--{$arrForm[$key2].value|h}-->" maxlength="<!--{$smarty.const.TEL_ITEM_LEN}-->" style="<!--{$arrErr[$key2]|sfGetErrorColor}-->; ime-mode: disabled;" class="box300" />
                    <!--{*         <input type="text" name="<!--{$key3}-->" value="<!--{$arrForm[$key3]|h}-->" maxlength="<!--{$smarty.const.TEL_ITEM_LEN}-->" style="<!--{$arrErr[$key3]|sfGetErrorColor}-->; ime-mode: disabled;" class="box60" /> *}-->
                </td>
            </tr>
        </table>

        <!--{if $smarty.const.USE_MULTIPLE_SHIPPING !== false}-->
            <p class="alignC">該商品需要送至多個地址嗎？</p>
        <!--{/if}-->
        <div class="btn_area">
            <ul>
                <!--{if $smarty.const.USE_MULTIPLE_SHIPPING !== false}-->
                    <li>
                        <input type="image" onmouseover="chgImgImageSubmit('<!--{$TPL_URLPATH}-->img/button/btn_singular_on.jpg',this)" onmouseout="chgImgImageSubmit('<!--{$TPL_URLPATH}-->img/button/btn_singular.jpg',this)" src="<!--{$TPL_URLPATH}-->img/button/btn_singular.jpg" name="singular" id="singular" />
                    <li>
                    <a href="javascript:;" onclick="fnModeSubmit('multiple', '', ''); return false" onmouseover="chgImg('<!--{$TPL_URLPATH}-->img/button/btn_multiple_on.jpg','several');" onmouseout="chgImg('<!--{$TPL_URLPATH}-->img/button/btn_multiple.jpg','several');">
                        <img src="<!--{$TPL_URLPATH}-->img/button/btn_multiple.jpg" border="0" name="several" id="several" /></a>
                    </li>
                <!--{else}-->
                    <li>
                        <input type="image" onmouseover="chgImgImageSubmit('<!--{$TPL_URLPATH}-->img/button/btn_next_on.jpg',this)" onmouseout="chgImgImageSubmit('<!--{$TPL_URLPATH}-->img/button/btn_next.jpg',this)" src="<!--{$TPL_URLPATH}-->img/button/btn_next.jpg" name="singular" id="singular" />
                    </li>
                <!--{/if}-->
            </ul>
        </div>
        </form>
    </div>
</div>

