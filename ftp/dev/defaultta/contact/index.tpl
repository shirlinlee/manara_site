


<!--   肚子開始  -->
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
                            <span class="attention"><!--{$arrErr.genre}--></span>
                            <select name="genre" class="box300">
                            <option value="">請選擇</option><!--{html_options options=$arrGenre selected=$arrForm.genre.value|h|default:$arrData.genre|h}-->
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <th>訂單編號</th>
                        <td>
                            <input type="text" class="box300" name="cod" value="<!--{$arrForm.cod.value|h|default:$arrData.cod|h}-->" maxlength="<!--{$smarty.const.STEXT_LEN}-->" style="<!--{$arrErr.cod|sfGetErrorColor}-->; ime-mode: active;" />
                            <span class="attention"><!--{$arrErr.cod}--></span>
                            <div class="attention">※若為有關訂單之諮詢內容，請務必填寫「訂單編號」於其中</div>
                        </td>
                    </tr>

                    <tr>
                        <th>姓名<span class="attention">*</span></th>
                        <td>
                            <span class="attention"><!--{$arrErr.name01}--><!--{$arrErr.name02}--></span>
                            <input type="text" class="box120" name="name01" value="<!--{$arrForm.name01.value|default:$arrData.name01|h}-->" maxlength="<!--{$smarty.const.STEXT_LEN}-->" style="<!--{$arrErr.name01|sfGetErrorColor}-->;" placeholder="姓氏" /> 
                            <input type="text" class="box120" name="name02" value="<!--{$arrForm.name02.value|default:$arrData.name02|h}-->" maxlength="<!--{$smarty.const.STEXT_LEN}-->" style="<!--{$arrErr.name02|sfGetErrorColor}-->;" placeholder="名字" />
                        </td>
                    </tr
                    <tr>
                        <th>郵遞區號</th>
                        <td>
                            <!--{* <span class="attention"><!--{$arrErr.zip01}--><!--{$arrErr.zip02}--></span> *}-->
                            <span class="attention"><!--{$arrErr.zipcode}--></span>

                            <p class="top">
                                <!--{* <input type="text" name="zip01" class="box60" value="<!--{$arrForm.zip01.value|default:$arrData.zip01|h}-->" maxlength="<!--{$smarty.const.ZIP01_LEN}-->" style="<!--{$arrErr.zip01|sfGetErrorColor}-->; ime-mode: disabled;" />&nbsp;-&nbsp; *}-->
                                <!--{* <input type="text" name="zip02" class="box60" value="<!--{$arrForm.zip02.value|default:$arrData.zip02|h}-->" maxlength="<!--{$smarty.const.ZIP02_LEN}-->" style="<!--{$arrErr.zip02|sfGetErrorColor}-->; ime-mode: disabled;" /> *}-->
                                <input type="text" name="zipcode" class="box60" value="<!--{$arrForm.zipcode.value|default:$arrData.zipcode|h}-->" maxlength="<!--{$smarty.const.ZIPCODE_LEN}-->" style="<!--{$arrErr.zipcode|sfGetErrorColor}-->; ime-mode: disabled;" /> 
                            </p>
                            
                            <!--{*
                            <p class="zipimg">
                                <a class="bt01" href="javascript:fnCallAddress('<!--{$smarty.const.INPUT_ZIP_URLPATH}-->', 'zip01', 'zip02', 'pref', 'addr01');">自動帶入地址</a>
                                <span class="mini">&nbsp;輸入郵遞區號後，請點選。</span>
                            </p>
                            *}-->
                        </td>
                    </tr>
                    <tr>
                        <th>地址</th>
                        <td>
                            <span class="attention"><!--{$arrErr.addr01}--><!--{$arrErr.addr02}--></span>

                            <p>
                                <input type="text" class="box300" name="addr01" value="<!--{$arrForm.addr01.value|default:$arrData.addr01|h}-->" style="<!--{$arrErr.addr01|sfGetErrorColor}-->" /><br />
                                <!--{$smarty.const.SAMPLE_ADDRESS1}-->
                            </p>

                            <p>
                                <input type="text" class="box300" name="addr02" value="<!--{$arrForm.addr02.value|default:$arrData.addr02|h}-->" style="<!--{$arrErr.addr02|sfGetErrorColor}-->;" /><br />
                                <!--{$smarty.const.SAMPLE_ADDRESS2}-->
                            </p>

                            <p class="mini"><span class="attention">請務必註記大樓名稱。</span></p>
                        </td>
                    </tr>
                    <tr>
                        <th>電話</th>
                        <td>
                            <span class="attention"><!--{$arrErr.tel01}--><!--{$arrErr.tel02}--><!--{$arrErr.tel03}--></span>
                            <input type="text" class="box180 top" name="tel01" value="<!--{$arrForm.tel01.value|default:$arrData.tel01|h}-->" maxlength="<!--{$smarty.const.TEL_ITEM_LEN}-->" style="<!--{$arrErr.tel01|sfGetErrorColor}-->; ime-mode: disabled;" /><br />
                            <!--{* <input type="text" class="box60" name="tel03" value="<!--{$arrForm.tel03.value|default:$arrData.tel03|h}-->" maxlength="<!--{$smarty.const.TEL_ITEM_LEN}-->" style="<!--{$arrErr.tel03|sfGetErrorColor}-->; ime-mode: disabled;" /> *}-->
                        </td>
                    </tr>
                    <tr>
                        <th>電子郵件<span class="attention">*</span></th>
                        <td>
                            <span class="attention"><!--{$arrErr.email}--><!--{$arrErr.email02}--></span>
                            <input type="text" class="box300 top" name="email" value="<!--{$arrForm.email.value|default:$arrData.email|h}-->" style="<!--{$arrErr.email|sfGetErrorColor}-->; ime-mode: disabled;" /><br />
                            <!--{* ログインしていれば入力済みにする *}-->
                            <!--{if $smarty.server.REQUEST_METHOD != 'POST' && $smarty.session.customer}-->
                            <!--{assign var=email02 value=$arrData.email}-->
                            <!--{/if}-->
                            <input type="text" class="box300" name="email02" value="<!--{$arrForm.email02.value|default:$email02|h}-->" style="<!--{$arrErr.email02|sfGetErrorColor}-->; ime-mode: disabled;"  placeholder="請再次輸入以利確認" /><br />
                        </td>
                    </tr>
                    <tr>
                        <th>聯繫我們之內容<span class="attention">*</span><br />
                        <span class="mini">(<!--{$smarty.const.MLTEXT_LEN}-->字以下)</span></th>
                        <td>
                            <span class="attention"><!--{$arrErr.contents}--></span>
                            <textarea name="contents" class="W100" cols="40" rows="10" style="<!--{$arrErr.contents.value|h|sfGetErrorColor}-->"><!--{"\n"}--><!--{$arrForm.contents.value|h}--></textarea>
                        </td>
                    </tr>
                </table>

                <div class="btn_area">
                    <button name="confirm" class="btn f_white bg_red">送出</button>
                    <!-- <input type="image" onmouseover="chgImgImageSubmit('<!--{$TPL_URLPATH}-->img/button/btn_confirm_on.jpg', this)" onmouseout="chgImgImageSubmit('<!--{$TPL_URLPATH}-->img/button/btn_confirm.jpg', this)" src="<!--{$TPL_URLPATH}-->img/button/btn_confirm.jpg" name="confirm" />-->
                        
                </div>

                </form>
            </div>
        </div>
   </div>
</div>