

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
                <div id="shoppingCart">

                    <div id="undercolumn_contact">
                        <div class="border f15">
                            <h3 class="f21 f_red pb10 t_left">我們希望獲得更多您的意見並解決您的煩惱</h3>
                            <p>有關以下査詢，請參考「常見Q&A」: <a href="<!--{$smarty.const.TOP_URLPATH}-->/user_data/faq.php" class="f_pink">配送相關問題</a>、<a href="<!--{$smarty.const.TOP_URLPATH}-->/user_data/faq.php" class="f_pink">定期方案相關問題</a>、<a href="<!--{$smarty.const.TOP_URLPATH}-->/user_data/faq.php" class="f_pink">產品使用相關問題</a></p>
                            <p>有關已訂購的商品內容之變更、訂單取消、退換貨，緊急聯絡事項，請直接與我們聯絡 0809-091-920<br>( 營業時間：週一至周六 9:00-18:00；週日及農曆春節休假)</p>
                            <p>此聯絡我們的服務項目並不包括商品內容之變更訂單取消。</p>   
                            <p>於週末、國定假日及平日五點以後的來信，將會在隔一日的營業日之後回覆。</p>
                        </div>
                        <form name="form1" method="post" action="?">
                        <input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME}-->" value="<!--{$transactionid}-->" />
                        <input type="hidden" name="mode" value="confirm" />
                        <table summary="聯繫我們" class="f15">
                            <tr>
                                <th width="20%">諮詢項目<span class="attention">*</span></th>
                                <td>
                                    <span class="attention">※ 未填寫諮詢項目。<br></span>
                                    <select name="genre" class="box300" style="<!--{$arrErr.genre|sfGetErrorColor}-->">
                                        <option value="">請選擇</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <th>訂單編號</th>
                                <td>
                                    <input type="text" class="box300" name="cod" value=""" />
                                    <span class="attention"><!--{$arrErr.cod}--></span>
                                    <div class="f_red">※若為有關訂單之諮詢內容，請務必填寫「訂單編號」於其中</div>
                                </td>
                            </tr>

                            <tr>
                                <th>姓名<span class="attention">*</span></th>
                                <td>
                                    <span class="attention">※ 未填寫姓名(姓)。<br>※ 未填寫姓名(名)。<br></span>
                                    <input type="text" class="box120" name="name01" value="" />
                                    <input type="text" class="box120" name="name02" value="" />
                                </td>
                            </tr>
                            <tr>
                                <th>郵遞區號</th>
                                <td>
                                    <p>
                                        <input type="text" name="zipcode" class="box100" value="" /> 
                                    </p>
                                </td>
                            </tr>
                            <tr>
                                <th>地址</th>
                                <td>
                                    <p>
                                        <input type="text" class="box300 top" name="addr01" value="" /><br />
                                    </p>

                                    <p>
                                        <input type="text" class="box300" name="addr02" value="" /><br />
                                    </p>

                                    <p class="mini"><span class="attention">請務必註記大樓名稱。</span></p>
                                </td>
                            </tr>
                            <tr>
                                <th>電話</th>
                                <td>
                                    <span class="attention"><!--{$arrErr.tel01}--><!--{$arrErr.tel02}--><!--{$arrErr.tel03}--></span>
                                    <input type="text" class="box180" name="tel01" value="" maxlength="" /><br />
                                </td>
                            </tr>
                            <tr>
                                <th>電子郵件<span class="attention">*</span></th>
                                <td>
                                    <span class="attention">※ 未填寫電子郵件信箱 。<br>※ 未填寫電子郵件信箱(確認)。<br></span>
                                    <input type="text" class="box300 top" name="email" value="" /><br />
                                    <input type="text" class="box300" name="email02" value="" /><br />
                                    <p class="mini"><span class="attention">請再次輸入相同的電子郵件</span></p>
                                </td>
                            </tr>
                            <tr>
                                <th>聯繫我們之內容<span class="attention">*</span><br />
                                </th>
                                <td>
                                    <span class="attention"><!--{$arrErr.contents}--></span>
                                    <textarea name="contents" class="W100"  cols="40" rows="10"></textarea>
                                </td>
                            </tr>
                        </table>

                        <div class="btn_area">
                            <ul>
                                <li>
                                    <!-- <button name="confirm" class="btn f_white bg_red">送出</button> -->
                                    <a href="confirm.php" class="btn f_white bg_red">送出</a>

                                </li>
                            </ul>
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

