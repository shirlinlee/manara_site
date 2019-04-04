

<?php include '../header.php'; ?>

<!-- https://www.manara.asia/tw/ -->
<!--{$smarty.const.ROOT_URLPATH}-->


<div id="container">
    <div id="one_maincolumn" class="main_column">
        
        <!--   肚子開始  -->
        <link rel="stylesheet" href="../user_data/new_201811/css/new_login.css" />

        <script type="text/javascript" src="https://www.manara.asia/tw/js/jquery.facebox/facebox.js"></script>
        <script type="text/javascript" src="https://www.manara.asia/tw/js/jquery.ui/jquery-ui-1.8.24.custom.min.js"></script>

        <link rel="stylesheet" type="text/css" href="https://www.manara.asia/tw/js/jquery.facebox/facebox.css" media="screen" />

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
                <h2>
                    會員登錄
                    <font>Member Registration</font>
                </h2>
                
                <form name="form1" id="form1" method="post" action="?" onsubmit="return checkReceiptNumber();">
                    <input type="hidden" name="transactionid" value="1adcc6211146b1b848fb649fe18047ab7bb1feda">
                    <input type="hidden" name="mode" value="confirm">

                    <table summary="会員登録フォーム/">
                        <colgroup><col width="24%">
                            <col width="">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th>姓名<span class="attention">*</span></th>
                                <td>
                                    <input type="text" name="name01" placeholder="姓氏" value="" maxlength="50" class="box120 mr10"> 
                                    <input type="text" name="name02" placeholder="名字" value="" maxlength="50" class="box120">
                                </td>
                            </tr>
                            <tr>
                                <th>性別<span class="attention">*</span></th>
                                <td>
                                    <span style="">
                                        <input type="radio" id="man" name="sex" value="1"><label for="man" class="pl10 pr20">男性</label>
                                        <input type="radio" id="woman" name="sex" value="2"><label for="woman" class="pl10">女性</label>
                                    </span>
                                </td>
                            </tr>
                            <tr>
                                <th>出生年月日</th>
                                <td>
                                    民國  

                                    <select name="yearMinkoku" style="" onchange="this.form.year.value=this.form.yearMinkoku.value" class="box100">
                                        <option label="-10" value="1901">-10</option>
                                        <option label="-9" value="1902">-9</option>
                                    </select>
                                    <font class="pr10">年</font>
                                    <select name="year" style="" onchange="this.form.yearMinkoku.value=this.form.year.value" class="box100">
                                        <option label="1901" value="1901">1901</option>
                                        <option label="1902" value="1902">1902</option>
                                        <option label="1903" value="1903">1903</option>
                                        <option label="1904" value="1904">1904</option>
                                    </select>
                                    <font class="pr10">年</font>
                                    <select name="month" style="" class="box80">
                                        <option label="--" value="" selected="selected">--</option>
                                        <option label="1" value="1">1</option>
                                        <option label="2" value="2">2</option>

                                    </select>
                                    <font class="pr10">月</font>
                                    <select name="day" style="" class="box80">
                                        <option label="--" value="" selected="selected">--</option>
                                        <option label="1" value="1">1</option>
                                    </select> 日
                                </td>
                            </tr>

                            <tr>
                                <th>年齡</th>
                                <td>
                                    <input type="text" name="age" value="" maxlength="3" class="box100 age"> 歲
                                </td>
                            </tr>

                            <tr>
                                <th>職業</th>
                                <td>
                                    <select name="job" class="box300">
                                        <option value="" selected="selected">請選擇</option>
                                        <option label="金融／保險" value="1">金融／保險</option>
                                    </select>
                                </td>
                            </tr>

                            <tr>
                                <th>電子郵件<span class="attention">*</span></th>
                                <td>
                                    <input type="text" name="email" value="" class="box300"><br>
                                </td>
                            </tr>

                            <tr>
                                <th>再次輸入電子郵件<span class="attention">*</span></th>
                                <td>
                                    <input type="text" name="email02" value="" placeholder="請再次輸入以利確認" class="box300"><br>
                                </td>
                            </tr>


                            <tr>
                                <th>設定密碼<span class="attention">*</span><br>
                                </th>
                                <td>
                                    <input type="password" name="password" value="" maxlength="50" style="" class="box200">
                                    <p class="attention mini f_red pl10">只允許半形數字及英文，密碼長度必須為 4 - 50 碼</p>
                                </td>
                            </tr>
                            
                            <tr>
                                <th>再次輸入密碼<span class="attention">*</span><br>
                                </th>
                                <td>
                                    <input type="password" name="password02" value="" placeholder="請再次輸入以利確認" maxlength="50" style="" class="box200">
                                </td>
                            </tr>

                            <tr>
                                <th>郵遞區號<span class="attention">*</span></th>
                                <td>
                                    <p class="top">
                                        <input type="text" id="zipcode" name="zipcode" value="" maxlength="10" class="box120">
                                    </p>
                                </td>
                            </tr>
                            <tr>
                                <th>地址<span class="attention">*</span></th>
                                <td>
                                    <select name="pref" id="pref" style="" class="box180 mb10">
                                        <option value="" selected="selected">請選擇城市</option>
                                        <option label="台北市" value="0">台北市</option>
                                    </select>
                                    <p class="top">
                                        <input type="text" id="addr01" name="addr01" value="" class="box300 mb5"><br>
                                        <font class="pb10">市區道路名稱 (例：大安區忠孝東路四段)</font>
                                    </p>
                                    <p class="top">
                                        <input type="text" id="addr02" name="addr02" value="" class="box300 mb5"><br>
                                        <font>道路號及大樓名稱 (例：1-3-5)。<span class="attention f_red">請務必註記大樓名稱。</span></font>
                                    </p>
                                    
                                </td>
                            </tr>
                            <tr>
                                <th>電話<span class="attention">*</span></th>
                                <td>
                                    <input type="text" name="tel01" value="" maxlength="10" class="box180">
                                </td>
                            </tr>
                            <tr>
                                <th>傳真號碼</th>
                                <td>
                                    <input type="text" name="fax01" value="" maxlength="10" class="box180">
                                </td>
                            </tr>

                            
                            <tr>
                                <th>統編<span class="attention">（若為公司行號）</span></th>
                                <td>
                                    <input type="text" name="company_code" value="" maxlength="50" class="box180">
                                </td>
                            </tr>
                            <tr>
                                <th>公司抬頭</th>
                                <td>
                                    <input type="text" name="company_name" value="" maxlength="50" class="box300">
                                </td>
                            </tr>
                            
                            <!-- <tr style="display: none;">
                                <th>忘記密碼時之密碼提示<span class="attention">*</span></th>
                                <td>
                                    提問:
                                    <select name="reminder" style=";width:100%">
                                        <option value="" selected="selected">請選擇</option>
                                        <option label="你母親的姓氏？" value="1">你母親的姓氏？</option>
                                        <option label="你最喜愛的漫畫？" value="2">你最喜愛的漫畫？</option>
                                        <option label="你最喜歡的寵物名字？" value="3">你最喜歡的寵物名字？</option>
                                        <option label="你的第一任女友/男友是誰？" value="4">你的第一任女友/男友是誰？</option>
                                        <option label="你心中最好看的電影名稱為何？" value="5">你心中最好看的電影名稱為何？</option>
                                        <option label="您最尊敬的老師姓名為？" value="6">您最尊敬的老師姓名為？</option>
                                        <option label="最喜歡的食物？" value="7">最喜歡的食物？</option>

                                    </select>
                                    <br>
                                    解答:<input type="text" name="reminder_answer" value="" class="box260">
                                </td>
                            </tr>
                            <tr style="display: none;">
                                <th>行銷資訊<span class="attention">*</span></th>
                                <td>
                                    <input type="hidden" name="mailmaga_flg" value="1">
                                </td>
                            </tr> -->

                        </tbody>
                    </table>

                    <div class="btn_area">
                        <a href="<!--{$smarty.const.ENTRY_URL}-->" class="btn f_white bg_red" name="confirm" id="confirm">
                            送出
                        </a>
                    </div>
                </form>
            </div>
        </div>

    <!--   肚子結束  -->

        
    </div>
</div>   

<?php include '../footer.php'; ?> 

