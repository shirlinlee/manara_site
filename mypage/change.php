

<?php include '../header.php'; ?>

<!-- https://www.manara.asia/tw/ -->
<!--{$smarty.const.ROOT_URLPATH}-->


<div id="container">
    <div id="one_maincolumn" class="main_column">
     
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
            <h2 class="title"><!--{$tpl_title|h}--></h2>
            
            <!-- FIXME: 真的#mynavi_area, 不需動作 -->
            <!--{include file=$tpl_navi}-->
            
            <!-- FIXME: 砍假的#mynavi_area -->
            <div id="mynavi_area">
                <ul class="mynavi_list clearfix">
                    <li class="f15"><a href="./" class="selected">購物清單</a></li>
                    <li class="f15"><a href="change.php" class="">會員資料</a></li>
                    <li class="f15"><a href="delivery.php" class="">送貨地址管理</a></li>
                    <li class="f15"><a href="index.php?mode=logout" class="">登出</a></li>
                </ul>
                <div class="point_announce clearfix">
                    <p class="f18">您好&nbsp;<span class="user_name"><font class="f_red">李 芷儀</font> 先生/女士</span></p>
                </div><!--▲現在のポイント-->
            </div>




            
            <div id="mycontents_area" >
                <h3 class="f21">會員資料維護</h3>
                <!-- <p>請在以下欄位輸入。「<span class="attention">※</span>」為必填欄位。<br />填寫後請點擊最下面的「確認頁面」</p> -->

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

                    <table summary="會員註冊內容變更" class="delivname mypage_table">
            
            <colgroup><col width="24%">
            <col width="">
            </colgroup><tbody><tr>
                <th>姓名</th>
                <td>
                                            <input type="text" name="name01" value="鄧" maxlength="100" style=";" class="box120">
                    <input type="text" name="name02" value="詠珊" maxlength="100" style=";" class="box120">
                </td>
            </tr>
            <tr>
                <th>郵遞區號</th>
                <td>
                                                            
                            
                
                            <input type="text" id="zipcode" name="zipcode" value="11697" maxlength="10" style="; ime-mode: disabled;" class="box100">&nbsp;
                    <a class="bt01 f_red" href="javascript:return false;" onclick="showZipSearchDialog();" target="_blank">郵遞區號檢索</a>
            
                        </td>
            </tr>
            <tr>
                <th>地址</th>
                <td>
                            <select name="pref" id="pref" style="">
                            <option value="" selected="selected">請選擇城市</option>
                            <option label="台北市" value="0" selected="selected">台北市</option>
            <option label="基隆市" value="1">基隆市</option>
            <option label="新北市" value="2">新北市</option>
            <option label="連江縣" value="3">連江縣</option>
            <option label="宜蘭縣" value="4">宜蘭縣</option>
            <option label="釣魚台" value="5">釣魚台</option>
            <option label="新竹市" value="6">新竹市</option>
            <option label="新竹縣" value="7">新竹縣</option>
            <option label="桃園縣" value="8">桃園縣</option>
            <option label="苗栗縣" value="9">苗栗縣</option>
            <option label="台中市" value="10">台中市</option>
            <option label="彰化縣" value="11">彰化縣</option>
            <option label="南投縣" value="12">南投縣</option>
            <option label="嘉義市" value="13">嘉義市</option>
            <option label="嘉義縣" value="14">嘉義縣</option>
            <option label="雲林縣" value="15">雲林縣</option>
            <option label="台南市" value="16">台南市</option>
            <option label="高雄市" value="17">高雄市</option>
            <option label="南海島" value="18">南海島</option>
            <option label="澎湖縣" value="19">澎湖縣</option>
            <option label="金門縣" value="20">金門縣</option>
            <option label="屏東縣" value="21">屏東縣</option>
            <option label="台東縣" value="22">台東縣</option>
            <option label="花蓮縣" value="23">花蓮縣</option>
            
                    </select>
                    <p><input type="text" id="addr01" name="addr01" value="文山區興隆路三段" class="box300" style=";"><br>
                        市區道路名稱 (例：大安區忠孝東路四段)</p>
                    <p><input type="text" id="addr02" name="addr02" value="207巷17弄3號3樓" class="box300" style=";"><br>
                        道路號及大樓名稱 (例：1-3-5)<span class="attention">。 請務必註記大樓名稱。</span></p>
                </td>
            </tr>
            <tr>
                <th>電話</th>
                <td>
                                                    <input type="text" name="tel01" value="0955071314" maxlength="10" style="; ime-mode: disabled;" class="box240">
                    <span class="attention">&nbsp;</span>&nbsp;<input type="text" name="tel02" value="" maxlength="10" style="; ime-mode: disabled;" class="box240">
                        </td>
            </tr>
            <tr>
                <th>傳真號碼</th>
                <td>
                                                    <input type="text" name="fax01" value="" maxlength="10" style="; ime-mode: disabled;" class="box240"><br>
                </td>
            </tr>
                <tr>
                    <th>電子郵件</th>
                    <td>
                                                <input type="text" name="email" value="anyateng@gmail.com" style="; ime-mode: disabled;" class="box240"><br>
                    </td>
                </tr>
                <tr>
                    <th>再次輸入電子郵件</th>
                    <td>
                                                <input type="text" name="email02" value="anyateng@gmail.com" style="; ime-mode: disabled;" class="box240" placeholder="請再次輸入以利確認"><br>
                    </td>
                </tr>
                        <tr>
                        <th>(手機)電子郵件</th>
                        <td>
                                                                            <input type="text" name="email_mobile" value="" style="; ime-mode: disabled;" maxlength="200" class="box240"><br>
                            <input type="text" name="email_mobile02" value="" style="; ime-mode: disabled;" maxlength="200" class="box240"><br>
                            <span class="attention mini">請再次輸入以利確認</span>
                        </td>
                    </tr>
                    <tr>
                    <th>性別</th>
                    <td>
                                                <span style="">
                            <input type="radio" id="man" name="sex" value="1"><label for="man">男性</label>
                            <input type="radio" id="woman" name="sex" value="2" checked="checked"><label for="woman">女性</label>
                        </span>
                    </td>
                </tr>
                <tr>
                    <th>職業</th>
                    <td>
                                                <select name="job" class="box300">
                            <option value="" selected="selected">請選擇</option>
                            <option label="金融／保險" value="1">金融／保險</option>
            <option label="房地產" value="2">房地產</option>
            <option label="政府機關" value="3">政府機關</option>
            <option label="軍警" value="4">軍警</option>
            <option label="教育／研究" value="5">教育／研究</option>
            <option label="經商" value="6">經商</option>
            <option label="建築" value="7">建築</option>
            <option label="製造／供應商" value="8">製造／供應商</option>
            <option label="資訊" value="9">資訊</option>
            <option label="服務" value="10">服務</option>
            <option label="醫療" value="11">醫療</option>
            <option label="法律相關行業" value="12">法律相關行業</option>
            <option label="流通／零商" value="13">流通／零商</option>
            <option label="交通／運輸／旅遊" value="14">交通／運輸／旅遊</option>
            <option label="娛樂／出版" value="15">娛樂／出版</option>
            <option label="傳播／公共關係廣告／行銷" value="16" selected="selected">傳播／公共關係廣告／行銷</option>
            <option label="藝術" value="17">藝術</option>
            <option label="農漁牧" value="18">農漁牧</option>
            <option label="學生" value="19">學生</option>
            <option label="家管" value="20">家管</option>
            <option label="待業中" value="21">待業中</option>
            <option label="其他" value="22">其他</option>
            
                        </select>
                    </td>
                </tr>
                <tr>
                    <th>出生年月日</th>
                    <td>
                                                   
                        民國<select class="box80" name="yearMinkoku" style="" onchange="this.form.year.value=this.form.yearMinkoku.value">
                            <option label="-10" value="1901">-10</option>
            <option label="-9" value="1902">-9</option>
            <option label="-8" value="1903">-8</option>
            <option label="-7" value="1904">-7</option>
            <option label="-6" value="1905">-6</option>
            <option label="-5" value="1906">-5</option>
            <option label="-4" value="1907">-4</option>
            <option label="-3" value="1908">-3</option>
            <option label="-2" value="1909">-2</option>
            <option label="-1" value="1910">-1</option>
            <option label="0" value="1911">0</option>
            <option label="1" value="1912">1</option>
            <option label="2" value="1913">2</option>
            <option label="3" value="1914">3</option>
            <option label="4" value="1915">4</option>
            <option label="5" value="1916">5</option>
            <option label="6" value="1917">6</option>
            <option label="7" value="1918">7</option>
            <option label="8" value="1919">8</option>
            <option label="9" value="1920">9</option>
            <option label="10" value="1921">10</option>
            <option label="11" value="1922">11</option>
            <option label="12" value="1923">12</option>
            <option label="13" value="1924">13</option>
            <option label="14" value="1925">14</option>
            <option label="15" value="1926">15</option>
            <option label="16" value="1927">16</option>
            <option label="17" value="1928">17</option>
            <option label="18" value="1929">18</option>
            <option label="19" value="1930">19</option>
            <option label="20" value="1931">20</option>
            <option label="21" value="1932">21</option>
            <option label="22" value="1933">22</option>
            <option label="23" value="1934">23</option>
            <option label="24" value="1935">24</option>
            <option label="25" value="1936">25</option>
            <option label="26" value="1937">26</option>
            <option label="27" value="1938">27</option>
            <option label="28" value="1939">28</option>
            <option label="29" value="1940">29</option>
            <option label="30" value="1941">30</option>
            <option label="31" value="1942">31</option>
            <option label="32" value="1943">32</option>
            <option label="33" value="1944">33</option>
            <option label="34" value="1945">34</option>
            <option label="35" value="1946">35</option>
            <option label="36" value="1947">36</option>
            <option label="37" value="1948">37</option>
            <option label="38" value="1949">38</option>
            <option label="39" value="1950">39</option>
            <option label="40" value="1951">40</option>
            <option label="41" value="1952">41</option>
            <option label="42" value="1953">42</option>
            <option label="43" value="1954">43</option>
            <option label="44" value="1955">44</option>
            <option label="45" value="1956">45</option>
            <option label="46" value="1957">46</option>
            <option label="47" value="1958">47</option>
            <option label="48" value="1959">48</option>
            <option label="49" value="1960">49</option>
            <option label="50" value="1961">50</option>
            <option label="51" value="1962">51</option>
            <option label="52" value="1963">52</option>
            <option label="53" value="1964">53</option>
            <option label="54" value="1965">54</option>
            <option label="55" value="1966">55</option>
            <option label="56" value="1967">56</option>
            <option label="57" value="1968">57</option>
            <option label="58" value="1969">58</option>
            <option label="59" value="1970">59</option>
            <option label="----" value="">----</option>
            <option label="60" value="1971">60</option>
            <option label="61" value="1972">61</option>
            <option label="62" value="1973">62</option>
            <option label="63" value="1974">63</option>
            <option label="64" value="1975">64</option>
            <option label="65" value="1976">65</option>
            <option label="66" value="1977">66</option>
            <option label="67" value="1978">67</option>
            <option label="68" value="1979">68</option>
            <option label="69" value="1980">69</option>
            <option label="70" value="1981">70</option>
            <option label="71" value="1982">71</option>
            <option label="72" value="1983">72</option>
            <option label="73" value="1984" selected="selected">73</option>
            <option label="74" value="1985">74</option>
            <option label="75" value="1986">75</option>
            <option label="76" value="1987">76</option>
            <option label="77" value="1988">77</option>
            <option label="78" value="1989">78</option>
            <option label="79" value="1990">79</option>
            <option label="80" value="1991">80</option>
            <option label="81" value="1992">81</option>
            <option label="82" value="1993">82</option>
            <option label="83" value="1994">83</option>
            <option label="84" value="1995">84</option>
            <option label="85" value="1996">85</option>
            <option label="86" value="1997">86</option>
            <option label="87" value="1998">87</option>
            <option label="88" value="1999">88</option>
            <option label="89" value="2000">89</option>
            <option label="90" value="2001">90</option>
            <option label="91" value="2002">91</option>
            <option label="92" value="2003">92</option>
            <option label="93" value="2004">93</option>
            <option label="94" value="2005">94</option>
            <option label="95" value="2006">95</option>
            <option label="96" value="2007">96</option>
            <option label="97" value="2008">97</option>
            <option label="98" value="2009">98</option>
            <option label="99" value="2010">99</option>
            <option label="100" value="2011">100</option>
            <option label="101" value="2012">101</option>
            <option label="102" value="2013">102</option>
            <option label="103" value="2014">103</option>
            <option label="104" value="2015">104</option>
            <option label="105" value="2016">105</option>
            <option label="106" value="2017">106</option>
            <option label="107" value="2018">107</option>
            <option label="108" value="2019">108</option>
            
                        </select>年
                                    <select class="box80" name="year" style="" onchange="this.form.yearMinkoku.value=this.form.year.value">
                            <option label="1901" value="1901">1901</option>
            <option label="1902" value="1902">1902</option>
            <option label="1903" value="1903">1903</option>
            <option label="1904" value="1904">1904</option>
            <option label="1905" value="1905">1905</option>
            <option label="1906" value="1906">1906</option>
            <option label="1907" value="1907">1907</option>
            <option label="1908" value="1908">1908</option>
            <option label="1909" value="1909">1909</option>
            <option label="1910" value="1910">1910</option>
            <option label="1911" value="1911">1911</option>
            <option label="1912" value="1912">1912</option>
            <option label="1913" value="1913">1913</option>
            <option label="1914" value="1914">1914</option>
            <option label="1915" value="1915">1915</option>
            <option label="1916" value="1916">1916</option>
            <option label="1917" value="1917">1917</option>
            <option label="1918" value="1918">1918</option>
            <option label="1919" value="1919">1919</option>
            <option label="1920" value="1920">1920</option>
            <option label="1921" value="1921">1921</option>
            <option label="1922" value="1922">1922</option>
            <option label="1923" value="1923">1923</option>
            <option label="1924" value="1924">1924</option>
            <option label="1925" value="1925">1925</option>
            <option label="1926" value="1926">1926</option>
            <option label="1927" value="1927">1927</option>
            <option label="1928" value="1928">1928</option>
            <option label="1929" value="1929">1929</option>
            <option label="1930" value="1930">1930</option>
            <option label="1931" value="1931">1931</option>
            <option label="1932" value="1932">1932</option>
            <option label="1933" value="1933">1933</option>
            <option label="1934" value="1934">1934</option>
            <option label="1935" value="1935">1935</option>
            <option label="1936" value="1936">1936</option>
            <option label="1937" value="1937">1937</option>
            <option label="1938" value="1938">1938</option>
            <option label="1939" value="1939">1939</option>
            <option label="1940" value="1940">1940</option>
            <option label="1941" value="1941">1941</option>
            <option label="1942" value="1942">1942</option>
            <option label="1943" value="1943">1943</option>
            <option label="1944" value="1944">1944</option>
            <option label="1945" value="1945">1945</option>
            <option label="1946" value="1946">1946</option>
            <option label="1947" value="1947">1947</option>
            <option label="1948" value="1948">1948</option>
            <option label="1949" value="1949">1949</option>
            <option label="1950" value="1950">1950</option>
            <option label="1951" value="1951">1951</option>
            <option label="1952" value="1952">1952</option>
            <option label="1953" value="1953">1953</option>
            <option label="1954" value="1954">1954</option>
            <option label="1955" value="1955">1955</option>
            <option label="1956" value="1956">1956</option>
            <option label="1957" value="1957">1957</option>
            <option label="1958" value="1958">1958</option>
            <option label="1959" value="1959">1959</option>
            <option label="1960" value="1960">1960</option>
            <option label="1961" value="1961">1961</option>
            <option label="1962" value="1962">1962</option>
            <option label="1963" value="1963">1963</option>
            <option label="1964" value="1964">1964</option>
            <option label="1965" value="1965">1965</option>
            <option label="1966" value="1966">1966</option>
            <option label="1967" value="1967">1967</option>
            <option label="1968" value="1968">1968</option>
            <option label="1969" value="1969">1969</option>
            <option label="1970" value="1970">1970</option>
            <option label="----" value="">----</option>
            <option label="1971" value="1971">1971</option>
            <option label="1972" value="1972">1972</option>
            <option label="1973" value="1973">1973</option>
            <option label="1974" value="1974">1974</option>
            <option label="1975" value="1975">1975</option>
            <option label="1976" value="1976">1976</option>
            <option label="1977" value="1977">1977</option>
            <option label="1978" value="1978">1978</option>
            <option label="1979" value="1979">1979</option>
            <option label="1980" value="1980">1980</option>
            <option label="1981" value="1981">1981</option>
            <option label="1982" value="1982">1982</option>
            <option label="1983" value="1983">1983</option>
            <option label="1984" value="1984" selected="selected">1984</option>
            <option label="1985" value="1985">1985</option>
            <option label="1986" value="1986">1986</option>
            <option label="1987" value="1987">1987</option>
            <option label="1988" value="1988">1988</option>
            <option label="1989" value="1989">1989</option>
            <option label="1990" value="1990">1990</option>
            <option label="1991" value="1991">1991</option>
            <option label="1992" value="1992">1992</option>
            <option label="1993" value="1993">1993</option>
            <option label="1994" value="1994">1994</option>
            <option label="1995" value="1995">1995</option>
            <option label="1996" value="1996">1996</option>
            <option label="1997" value="1997">1997</option>
            <option label="1998" value="1998">1998</option>
            <option label="1999" value="1999">1999</option>
            <option label="2000" value="2000">2000</option>
            <option label="2001" value="2001">2001</option>
            <option label="2002" value="2002">2002</option>
            <option label="2003" value="2003">2003</option>
            <option label="2004" value="2004">2004</option>
            <option label="2005" value="2005">2005</option>
            <option label="2006" value="2006">2006</option>
            <option label="2007" value="2007">2007</option>
            <option label="2008" value="2008">2008</option>
            <option label="2009" value="2009">2009</option>
            <option label="2010" value="2010">2010</option>
            <option label="2011" value="2011">2011</option>
            <option label="2012" value="2012">2012</option>
            <option label="2013" value="2013">2013</option>
            <option label="2014" value="2014">2014</option>
            <option label="2015" value="2015">2015</option>
            <option label="2016" value="2016">2016</option>
            <option label="2017" value="2017">2017</option>
            <option label="2018" value="2018">2018</option>
            <option label="2019" value="2019">2019</option>
            
                        </select>年
                        <select class="box80" name="month" style="">
                            <option label="--" value="">--</option>
            <option label="1" value="1">1</option>
            <option label="2" value="2">2</option>
            <option label="3" value="3">3</option>
            <option label="4" value="4">4</option>
            <option label="5" value="5">5</option>
            <option label="6" value="6">6</option>
            <option label="7" value="7">7</option>
            <option label="8" value="8">8</option>
            <option label="9" value="9" selected="selected">9</option>
            <option label="10" value="10">10</option>
            <option label="11" value="11">11</option>
            <option label="12" value="12">12</option>
            
                        </select>月
                        <select class="box80" name="day" style="">
                            <option label="--" value="">--</option>
            <option label="1" value="1">1</option>
            <option label="2" value="2">2</option>
            <option label="3" value="3">3</option>
            <option label="4" value="4">4</option>
            <option label="5" value="5">5</option>
            <option label="6" value="6">6</option>
            <option label="7" value="7" selected="selected">7</option>
            <option label="8" value="8">8</option>
            <option label="9" value="9">9</option>
            <option label="10" value="10">10</option>
            <option label="11" value="11">11</option>
            <option label="12" value="12">12</option>
            <option label="13" value="13">13</option>
            <option label="14" value="14">14</option>
            <option label="15" value="15">15</option>
            <option label="16" value="16">16</option>
            <option label="17" value="17">17</option>
            <option label="18" value="18">18</option>
            <option label="19" value="19">19</option>
            <option label="20" value="20">20</option>
            <option label="21" value="21">21</option>
            <option label="22" value="22">22</option>
            <option label="23" value="23">23</option>
            <option label="24" value="24">24</option>
            <option label="25" value="25">25</option>
            <option label="26" value="26">26</option>
            <option label="27" value="27">27</option>
            <option label="28" value="28">28</option>
            <option label="29" value="29">29</option>
            <option label="30" value="30">30</option>
            <option label="31" value="31">31</option>
            
                        </select>日
                    </td>
                </tr>
            <!-- 以下追加項目 -->
            
            <tr>
                <th>年齡</th>
                <td>
                                    <input type="text" name="age" value="35" maxlength="3" style=";" class="box100">
                </td>
            </tr>
            <tr>
                <th>統編<span class="attention">（若為公司行號）</span></th>
                <td>
                                    <input type="text" name="company_code" value="" maxlength="100" style=";" class="box180">
                </td>
            </tr>
            <tr>
                <th>統編抬頭<span class="attention">（若為公司行號）</span></th>
                <td>
                                    <input type="text" name="company_name" value="" maxlength="100" style=";" class="box180">
                </td>
            </tr>
            <!-- 以上追加項目 -->
                        <tr>
                        <th>設定密碼<br>
                        </th>
                        <td>
                                            <input type="password" name="password" value="******" maxlength="100" style="" class="box120">
                            <p><span class="attention mini">只允許半形數字及英文，密碼長度必須為 4 - 100 碼</span></p>
                            <input type="password" name="password02" value="******" maxlength="100" style="" class="box120">
                            <p><span class="attention mini">請再次輸入以利確認</span></p>
                        </td>
                    </tr>
                    <tr>
                        <th>忘記密碼時之密碼提示</th>
                        <td>
                                            提問: 
                            <select name="reminder"class="box200" >
                                <option value="" selected="selected">請選擇</option>
                                <option label="你母親的姓氏？" value="1">你母親的姓氏？</option>
            <option label="你最喜愛的漫畫？" value="2">你最喜愛的漫畫？</option>
            <option label="你最喜歡的寵物名字？" value="3" selected="selected">你最喜歡的寵物名字？</option>
            <option label="你的第一任女友/男友是誰？" value="4">你的第一任女友/男友是誰？</option>
            <option label="你心中最好看的電影名稱為何？" value="5">你心中最好看的電影名稱為何？</option>
            <option label="您最尊敬的老師姓名為？" value="6">您最尊敬的老師姓名為？</option>
            <option label="最喜歡的食物？" value="7">最喜歡的食物？</option>
            
                            </select>
                            <br>
                            解答: <input type="text" name="reminder_answer" value="******" style=";" class="box200">
                        </td>
                    </tr>
                    <tr style="display: none;">
                        <th>行銷資訊</th>
                        <td>
                                            <input type="hidden" name="mailmaga_flg" value="1">
                        </td>
                    </tr>
            
                
                    </tbody></table>

                   

                    <table summary="會員註冊內容變更"  class="delivname mypage_table"  style="display: none;">
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

        <link rel="stylesheet" href="../user_datanew_201811/css/new_init.css" />
        <link rel="stylesheet" href="../user_data/new_201811/css/new_mypage.css" />


        <!--   肚子結束  -->
    </div>
</div>   


<script type="text/javascript" src="../user_data/new_201811/js/product.js"></script>

<?php include '../footer.php'; ?> 

