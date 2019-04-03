

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

        <div id="mypagecolumn"  class="container sec-wrap">
            <div id="undercolumn_entry">
                <h2 class="title"><!--{$tpl_title|h}--></h2>
                <p>請確認下列內容是否需要修改？<br />
                若無需修改，請點選最下方「前往完成頁」之按鍵</p>
                <form name="form1" id="form1" method="post" action="?">
                <input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME}-->" value="<!--{$transactionid}-->" />
                <input type="hidden" name="mode" value="complete">
                <!--{foreach from=$arrForm key=key item=item}-->
                    <input type="hidden" name="<!--{$key|h}-->" value="<!--{$item|h}-->" />
                <!--{/foreach}-->

                <table summary="入力内容確認/">
                    <col width="30%" />
                    <col width="70%" />
                    <tr>
                        <th>姓名</th>
                        <td>
                            <!--{$arrForm.name01|h}-->&nbsp;
                            <!--{$arrForm.name02|h}-->
                        </td>
                    </tr>
                    <tr>
                        <th>郵遞區號</th>
                        <td>
                            <!--{* <!--{$arrForm.zip01|h}--> - <!--{$arrForm.zip02|h}--> *}-->
                            <!--{$arrForm.zipcode|h}-->
                        </td>
                    </tr>
                    <tr>
                        <th>地址</th>
                        <td>
                            <!--{$arrPref[$arrForm.pref]|h}--> <!--{$arrForm.addr01|h}--> <!--{$arrForm.addr02|h}-->
                        </td>
                    </tr>
                    <tr>
                        <th>電話號碼</th>
                        <td>
                            <!--{if strlen($arrForm.tel02) > 0}-->
                                1:&nbsp;&nbsp;<!--{$arrForm.tel01|h}--><br />
                                2:&nbsp;&nbsp;<!--{$arrForm.tel02|h}-->
                            <!--{else}-->
                                <!--{$arrForm.tel01|h}-->
                            <!--{/if}-->
                            <!--/* <!--{$arrForm.tel03|h}--> */-->
                        </td>
                    </tr>
                    <tr>
                        <th>傳真號碼</th>
                        <td>
                            <!--{if strlen($arrForm.fax01) > 0}-->
                                <!--{$arrForm.fax01|h}-->
                            <!--{else}-->
                                未登録/
                            <!--{/if}-->
                        </td>
                    </tr>
                    <tr>
                        <th>電子郵件信箱</th>
                        <td>
                            <a href="mailto:<!--{$arrForm.email|escape:'hex'}-->"><!--{$arrForm.email|escape:'hexentity'}--></a>
                        </td>
                    </tr>
                    <tr>
                        <th>性別</th>
                        <td>
                            <!--{if $arrForm.sex eq 0}-->
                                未選択/
                            <!--{elseif $arrForm.sex eq 1}-->
                                男性
                            <!--{else}-->
                                女性
                            <!--{/if}-->
                        </td>
                    </tr>
                    <tr>
                        <th>職業</th>
                        <td><!--{$arrJob[$arrForm.job]|default:"未選択"|h}--></td>
                    </tr>
                    <tr>
                        <th>出生年月日</th>
                        <td>
                            <!--{if strlen($arrForm.year) > 0 && strlen($arrForm.month) > 0 && strlen($arrForm.day) > 0}-->
                                民國<!--{$arrForm.year-1911|h}-->年<br />
                                <!--{$arrForm.year|h}-->/<!--{$arrForm.month|h}-->/<!--{$arrForm.day|h}-->
                            <!--{else}-->
                                未登録/
                            <!--{/if}-->
                        </td>
                    </tr>
        <!-- 以下追加項目 -->
                    <tr>
                        <th>年齢/</th>
                        <td>
                            <!--{if strlen($arrForm.year) > 0 && strlen($arrForm.month) > 0 && strlen($arrForm.day) > 0}-->
                                <!--{$arrForm.age|h}--> 
                            <!--{else}-->
                                未設定/
                            <!--{/if}-->
                        </td>
                    </tr>
                    <tr>
                        <th>統編</th>
                        <td>
                        <!--{$arrForm.company_code|h}--> 
                        </td>
                    </tr>
                    <tr>
                        <th>統編抬頭</th>
                        <td>
                        <!--{$arrForm.company_name|h}--> 
                        </td>
                    </tr>
        <!-- 以上追加項目 -->
                    <tr>
                        <th>設定密碼<br />
                        </th>
                        <td><!--{$passlen}--></td>
                    </tr>
                    <tr>
                        <th>忘記密碼時之密碼提示</th>
                        <td>
                            提問:<!--{$arrReminder[$arrForm.reminder]|h}--><br />
                            解答:<!--{$arrForm.reminder_answer|h}-->
                        </td>
                    </tr>
                    <tr style="display: none;">
                        <th>行銷資訊</th>
                        <td>
                            <!--{if $arrForm.mailmaga_flg eq 1}-->
                            有興趣得到促銷活動訊息
                            <!--{elseif $arrForm.mailmaga_flg eq 2}-->
                            僅訂閱純文字電子報
                            <!--{else}-->
                            沒有興趣
                            <!--{/if}-->
                        </td>
                    </tr>
                </table>

                <div class="btn_area">
                    <ul>
        <!--{*                <li>
                            <a class="bt04" href="?" onclick="fnModeSubmit('return', '', ''); return false;">返回</a>
                        </li>
                        <li>
                            <button class="bt02">註冊會員</button>
                        </li>
        *}-->
                        <li>
                            <a href="?" onclick="fnModeSubmit('return', '', ''); return false;" onmouseover="chgImg('<!--{$TPL_URLPATH}-->img/button/btn_back_on.jpg','back')" onmouseout="chgImg('<!--{$TPL_URLPATH}-->img/button/btn_back.jpg','back')"><img src="<!--{$TPL_URLPATH}-->img/button/btn_back.jpg" border="0" name="back" id="back" /></a>
                        </li>
                        <li>
                            <input type="image" onmouseover="chgImgImageSubmit('<!--{$TPL_URLPATH}-->img/button/btn_entry_on.jpg',this)" onmouseout="chgImgImageSubmit('<!--{$TPL_URLPATH}-->img/button/btn_entry.jpg',this)" src="<!--{$TPL_URLPATH}-->img/button/btn_entry.jpg" border="0" name="send" id="send" />
                        </li>
                    </ul>
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



<?php include 'footer.php'; ?> 

