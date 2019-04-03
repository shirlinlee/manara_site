

<?php include 'header.php'; ?>

<!-- https://www.manara.asia/tw/ -->
<!--{$smarty.const.ROOT_URLPATH}-->


<div id="container">
    <div id="one_maincolumn" class="main_column">
        <script type="text/javascript" src="user_data/new_201811/js/index.js"></script>
        
        <!--<link rel="stylesheet" href="-->
        <!--{$smarty.const.ROOT_URLPATH}-->
        <!--user_data/packages/defaultta/css/new_lee.css" /> -->
        
        
        <!--   肚子開始  -->

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

                // 移除離島
                var list = [3,5,18,19,20];
                for (i=0; i<list.length; i++) {
                $('#pref, #dialogPref').find('option[value="' + list[i] + '"]').remove();
                }

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


                // 2016.12.22 yyausda add start (統一発票番号入力チェック)
                function checkReceiptNumber() {
                    var errorMessage = '';
                    var companyCode = $(':text[name="company_code"]').val();
                    if ( companyCode != null && companyCode != '') {

                        var isCompanyCodeErrFlg = false;
                        // 数字チェック, 入力数字規則ルール
                        if ( isNaN(companyCode) ) {
                            errorMessage += '統編需為8碼數字.';
                            isCompanyCodeErrFlg = true;
                        }
                        if (isCompanyCodeErrFlg != true) {
                            if(companyCode.length != 8){
                            errorMessage += '統編需為8碼數字.';
                            isCompanyCodeErrFlg = true;
                            }
                        }
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
                        }
                        if (isCompanyCodeErrFlg) {
                            alert(errorMessage);
                            return false;
                        }
                    }
                    return true;
                }
                // 2016.12.22 yyausda add end (統一発票番号入力チェック)


            //]]>
            </script>


            <div id="undercolumn" class="container sec-wrap">
            <div id="main_text">
                        <div class="columns-12">
                            <div id="shoppingCart" class="col-md-8 col-sm-10 col-xs-12 col-offset-2">
                <div id="undercolumn_entry">
                    <h2 class="title">註冊會員</h2>
                    <!--{if $smarty.const.CUSTOMER_CONFIRM_MAIL}-->
                        <p>註冊后還未能稱為正式會員。<br />
                            我們會給您電子郵件發MAIL，請確認后才能成為正式會員。</p>
                    <!--{/if}-->
                    <form name="form1" id="form1" method="post" action="?" onsubmit="return checkReceiptNumber();">
                        <input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME}-->" value="<!--{$transactionid}-->" />
                        <input type="hidden" name="mode" value="confirm" />

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
                                2．請在以下候補名單選擇您的郵遞區號<br />
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


                        <table summary="會員登録フォーム/">
                        <!--{include file="`$smarty.const.TEMPLATE_REALDIR`frontparts/form_personal_input.tpl" flgFields=3 emailMobile=false prefix=""}-->
                        </table>

                        <div class="btn_area">
                            <ul>
                                <li>
                                    <input type="image" onmouseover="chgImgImageSubmit('<!--{$TPL_URLPATH}-->img/button/btn_confirm_on.jpg',this)" onmouseout="chgImgImageSubmit('<!--{$TPL_URLPATH}-->img/button/btn_confirm.jpg',this)" src="<!--{$TPL_URLPATH}-->img/button/btn_confirm.jpg" name="confirm" id="confirm" />
                                </li>
                            </ul>
                        </div>

                    </form>
                </div>
            </div>
            </div>
        </div>
    </div>


        <!--   肚子結束  -->

        
    </div>
</div>   

<style>
    .bxslider li{
        display: none;
    }
    .bxslider li:first-child{
        display: block;
    }
</style>



<?php include 'footer.php'; ?> 

