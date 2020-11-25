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


<script type="text/javascript" src="<!--{$smarty.const.ROOT_URLPATH}-->js/jquery.facebox/facebox.js"></script>
<script type="text/javascript" src="<!--{$smarty.const.ROOT_URLPATH}-->js/jquery.ui/jquery-ui-1.8.24.custom.min.js"></script>

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

  dw = 700;
  if( dw > window.innerWidth ){
  	dw = window.innerWidth;
  }

    $('#zipSearchDialog').dialog({
          autoOpen: false,
          modal: true,
          closeOnEscape: false,
          resizable : false,
          height: 500,
          width: dw,
    });

  });


  // 郵便番号検索ウィンドウを開く
  function showZipSearchDialog(){

    $('#dialogCity1').empty();
    $('#dialogCity2').empty();
    $('#dialogZipCode').empty();
	var o = new Option("----- 選擇 -----", "");
	$(o).html("----- 選擇 -----");
	$("#dialogCity1").append(o);

	var o1 = new Option("----- 選擇 -----", "");
	$(o1).html("----- 選擇 -----");
	$("#dialogCity2").append(o1);

    var prefCode = $('#pref').val();
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

    $('#zipcode').val(zipCode);
    $('#pref').val(prefCode);
    $('#addr01').val(cityName1 + cityName2);

    $('#zipSearchDialog').dialog('close');

  }

//]]>
</script>

  <div class="W100 t_center">
      <div class="W1360 bread">
          <span class="f15 f_pink f_left"><a class="f_grey" href="/tw/">首頁 /</a> <font class="f_grey">會員中心 / </font>會員資料</span>
      </div>
  </div>
  <div id="mypagecolumn" class="container sec-wrap">
    
    <!--{include file=$tpl_navi}-->
    <div id="mycontents_area">


      <form name="form1" id="form1" method="post" action="?">
        <input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME}-->" value="<!--{$transactionid}-->" />
        <input type="hidden" name="mode" value="confirm" />
        <input type="hidden" name="customer_id" value="<!--{$arrForm.customer_id|h}-->" />

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


        <table summary="會員註冊內容變更" class="delivname mypage_table" style="table-layout:fixed;word-wrap:break-word;word-break;break-all;">
            <!--{include file="`$smarty.const.TEMPLATE_REALDIR`frontparts/form_personal_input.tpl" flgFields=3 emailMobile=true prefix=""}-->
        </table>
        <div class="btn_area">
              <ul>
                  <li>
                      <button class="btn f_white bg_red" name="refusal" id="refusal">送出</button>
                  </li>
              </ul>
          </div>
        </form>
    </div>
  </div>

<link rel="stylesheet" href="../user_data/new_201811/css/new_init.css" />
<link rel="stylesheet" href="../user_data/new_201811/css/new_mypage.css" />

