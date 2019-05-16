

<?php include '../header.php'; ?>

<!-- https://www.manara.asia/tw/ -->
<!--{$smarty.const.ROOT_URLPATH}-->


<div id="container">
    <div id="one_maincolumn" class="main_column W1200">
     
        <!--   肚子開始  -->
        <link rel="stylesheet" href="../user_data/new_201811/css/new_contact.css" />

        <div class="W100 t_center">
            <div class="banner_m banner-contact">
                <div class="banner-txt">
                    <h4>聯絡我們</h4>
                    <span></span>
                    <h6>Contact Us</h6>
                </div>
            </div>
        </div>
        
        <div class="W100 t_center">
            <div class="W1360 bread">
                <span class="f15 f_pink f_left"><a class="f_grey" href="/tw/">首頁 /</a> 聯絡我們</span>
            </div>
        </div>
        
        <div id="main_text">
            <div class="columns-12">
                <div id="shoppingCart" class="col-md-8 col-sm-10 col-xs-12 col-offset-2">
                <div id="undercolumn_contact">
                    <p class="f15 pb30 pt30 t_center line15">
                    請確認下列內容是否需要修改？<br>若無需修改，請點選最下方「送出」之按鍵
                    </p>
                    <form name="form1" id="form1" method="post" action="?">
                    
                        <table summary="聯絡内容確認" class="f15">
                            <col width="30%" />
                            <col width="70%" />
                            <tr>
                                <th>諮詢項目<span class="attention">*</span></th>
                                <td>關於商品</td>
                            </tr>
                            <tr>
                                <th>訂單編號</th>
                                <td>XX12345678</td>
                            </tr>
                            <tr>
                                <th>姓名</th>
                                <td>曼  娜麗</td>
                            </tr>
                            <tr>
                                <th>郵遞區號</th>
                                <td>231
                                </td>
                            </tr>
                            <tr>
                                <th>地址</th>
                                <td>新北市新店區中央武五街</td>
                            </tr>
                            <tr>
                                <th>電話號碼</th>
                                <td>0978036006
                                </td>
                            </tr>
                            <tr>
                                <th>電子郵件</th>
                                <td><a href="mailto:<!--{$arrForm.email.value|escape:'hex'}-->">hello@email.com</a></td>
                            </tr>
                            <tr>
                                <th>聯繫我們之內容*</th>
                                <td>請問沒有收到贈品該如何處理呢？謝謝</td>
                            </tr>
                        </table>
                        <div class="btn_area mt20">
                            <a href="javascript:;" onclick="fnModeSubmit('return', '', ''); return false;"  name="back02" id="back02" class="btn f_black mr10">返回</a>
                            <input onclick="return fnCheckSubmit();" name="send" id="send" value="送出" class="btn f_white bg_red" />
                        </div>

                    </form>
                </div>
                </div>
            </div>
        </div>
        <!--   肚子結束  -->

        
    </div>
</div>   



<?php include '../footer.php'; ?> 

