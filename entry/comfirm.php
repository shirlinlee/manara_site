

<?php include '../header.php'; ?>


<div id="container">
    <div id="one_maincolumn" class="main_column">
        <link rel="stylesheet" href="../user_data/new_201811/css/new_login.css" />
       
        
        <!--   肚子開始  -->
        <div id="mypagecolumn"  class="container sec-wrap">
            <div id="undercolumn_entry">
                <h2>會員登錄確認
                    <font>Member Registration</font>
                </h2>
                <p class="pb40 t_center">請確認下列內容是否需要修改？<br>若無需修改，請點選最下方「送出」之按鍵</p>
                <form name="form1" id="form1" class="comfirm" method="post" action="?">
                    <input type="hidden" name="transactionid" value="1adcc6211146b1b848fb649fe18047ab7bb1feda">
                    <input type="hidden" name="mode" value="complete">
                    <input type="hidden" name="name01" value="李">
                    <input type="hidden" name="name02" value="小萬">
                    <input type="hidden" name="kana01" value="">
                    <input type="hidden" name="kana02" value="">
                    <input type="hidden" name="zipcode" value="104">
                    <input type="hidden" name="pref" value="2">
                    <input type="hidden" name="addr01" value="新店區">
                    <input type="hidden" name="addr02" value="中央五街">
                    <input type="hidden" name="tel01" value="0978036006">
                    <input type="hidden" name="tel02" value="">
                    <input type="hidden" name="tel03" value="">
                    <input type="hidden" name="fax01" value="">
                    <input type="hidden" name="fax02" value="">
                    <input type="hidden" name="fax03" value="">
                    <input type="hidden" name="password" value="love1111">
                    <input type="hidden" name="sex" value="2">
                    <input type="hidden" name="job" value="">
                    <input type="hidden" name="year" value="">
                    <input type="hidden" name="month" value="">
                    <input type="hidden" name="day" value="">
                    <input type="hidden" name="mailmaga_flg" value="1">
                    <input type="hidden" name="age" value="">
                    <input type="hidden" name="company_code" value="">
                    <input type="hidden" name="company_name" value="">
                    <input type="hidden" name="email" value="hn85412404@yahoo.com.tw">
                    <input type="hidden" name="password02" value="love1111">
                    <input type="hidden" name="email02" value="hn85412404@yahoo.com.tw">
                
                    <table summary="入力内容確認/">
                        <colgroup>
                            <col width="30%">
                            <col width="70%">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th>姓名</th>
                                <td>
                                    李&nbsp;
                                    小萬
                                </td>
                            </tr>
                            <tr>
                                <th>郵遞區號</th>
                                <td>
                                                        104
                                </td>
                            </tr>
                            <tr>
                                <th>地址</th>
                                <td>
                                    新北市 新店區 中央五街
                                </td>
                            </tr>
                            <tr>
                                <th>電話號碼</th>
                                <td>
                                                            0978036006
                                                        <!--/*  */-->
                                </td>
                            </tr>
                            <tr>
                                <th>傳真號碼</th>
                                <td>
                                    未登録
                                </td>
                            </tr>
                            <tr>
                                <th>電子郵件信箱</th>
                                <td>
                                    <a href="mailto:%68%6e%38%35%34%31%32%34%30%34%40%79%61%68%6f%6f%2e%63%6f%6d%2e%74%77">hn85412404@yahoo.com.tw</a>
                                </td>
                            </tr>
                            <tr>
                                <th>性別</th>
                                <td>
                                                            女性
                                                    </td>
                            </tr>
                            <tr>
                                <th>職業</th>
                                <td>未選択</td>
                            </tr>
                            <tr>
                                <th>出生年月日</th>
                                <td>
                                    未登録
                                </td>
                            </tr>
                <!-- 以下追加項目 -->
                            <tr>
                                <th>年齢</th>
                                <td>
                                    未設定
                                </td>
                            </tr>
                            <tr>
                                <th>統編</th>
                                <td>
                                </td>
                            </tr>
                            <tr>
                                <th>統編抬頭</th>
                                <td>
                                </td>
                            </tr>
                <!-- 以上追加項目 -->
                            <tr>
                                <th>設定密碼<br>
                                </th>
                                <td>********</td>
                            </tr>
                            <tr style="display: none;">
                                <th>忘記密碼時之密碼提示</th>
                                <td>
                                    提問:<br>
                                    解答:
                                </td>
                            </tr>
                            <tr style="display: none;">
                                <th>行銷資訊</th>
                                <td>
                                    有興趣得到促銷活動訊息
                                </td>
                            </tr>
                        </tbody>
                    </table>

                    <div class="btn_area mt50">
                        <a href="?" class="btn f_black" onclick="fnModeSubmit('return', '', ''); return false;"  name="back" id="back">
                            返回
                        </a>
                        <a href="<!--{$smarty.const.ENTRY_URL}-->" class="btn f_white bg_red" name="send" id="send">
                            同意
                        </a>
                    </div>

                </form>
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



<?php include '../footer.php'; ?> 

