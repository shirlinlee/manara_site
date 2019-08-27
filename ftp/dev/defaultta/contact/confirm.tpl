<!--   肚子開始  -->
<!-- [ls ytagawa added] 連打対応. -->
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
//]]></script>



    <link rel="stylesheet" href="../user_data/new_201811/css/new_init.css" />
    <link rel="stylesheet" href="../user_data/new_201811/css/new_contact.css" />

    <div class="W100 t_center" style="display: inline-block;">
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
    <div class="W100 t_center">
        <div id="main_text">
            <div class="columns-12">
                <div id="shoppingCart">
                <div id="undercolumn_contact">
                    <p class="f15 pb30 pt30 t_center line15">
                    請確認下列內容是否需要修改？<br>若無需修改，請點選最下方「送出」之按鍵<br><br>
                    </p>
                    
                    <form name="form1" id="form1" method="post" action="?">
                    <input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME}-->" value="<!--{$transactionid}-->" />
                    <input type="hidden" name="mode" value="complete" />
                    <!--{foreach key=key item=item from=$arrForm}-->
                        <!--{if $key ne 'mode'}-->
                            <input type="hidden" name="<!--{$key}-->" value="<!--{$item.value|h}-->" />
                        <!--{/if}-->
                    <!--{/foreach}-->
                    <table summary="聯絡内容確認" class="f15">
                        <col width="30%" />
                        <col width="70%" />
                        <tr>
                            <th>諮詢項目<span class="attention">*</span></th>
                            <td><!--{$arrGenre[$arrForm.genre.value]}--></td>
                        </tr>
                        <tr>
                            <th>訂單編號</th>
                            <td><!--{$arrForm.cod.value|h}--></td>
                        </tr>
                        <tr>
                            <th>姓名</th>
                            <td><!--{$arrForm.name01.value|h}--> <!--{$arrForm.name02.value|h}--></td>
                        </tr>
                        <tr>
                            <th>郵遞區號</th>
                            <td>
                                <!--{*
                                <!--{if strlen($arrForm.zip01.value) > 0 && strlen($arrForm.zip02.value) > 0}-->
                                    <!--{$arrForm.zip01.value|h}-->-<!--{$arrForm.zip02.value|h}-->
                                <!--{/if}-->
                                *}-->
                                <!--{if strlen($arrForm.zipcode.value) > 0}-->
                                    <!--{$arrForm.zipcode.value|h}-->
                                <!--{/if}-->
                            </td>
                        </tr>
                        <tr>
                            <th>地址</th>
                            <td><!--{$arrForm.addr01.value|h}--><!--{$arrForm.addr02.value|h}--></td>
                        </tr>
                        <tr>
                            <th>電話</th>
                            <td>
                                <!--{$arrForm.tel01.value|h}--><br />
                                <!--{if strlen($arrForm.tel02.value) >0}-->
                                    <br /><!--{$arrForm.tel02.value|h}-->
                                <!--{/if}-->
                            </td>
                        </tr>
                        <tr>
                            <th>電子郵件</th>
                            <td><a href="mailto:<!--{$arrForm.email.value|escape:'hex'}-->"><!--{$arrForm.email.value|escape:'hexentity'}--></a></td>
                        </tr>
                        <tr>
                            <th>聯絡事項</th>
                            <td><!--{$arrForm.contents.value|h|nl2br}--></td>
                        </tr>
                    </table>
                    <div class="btn_area">
                        <a href="javascript:;" onclick="fnModeSubmit('return', '', ''); return false;"  name="back02" id="back02" class="btn f_black mr10">返回</a>
                        <button onclick="return fnCheckSubmit();" name="send" id="send" class="btn f_white bg_red">送出</button>
                    </div>

                    </form>
                </div>
            </div>
        </div>
    </div>
