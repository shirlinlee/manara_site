<!--{*
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
 *}-->


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


<div id="undercolumn" class="container sec-wrap">
<div id="main_text">
            <div class="columns-12">
                <div id="shoppingCart" class="col-md-8 col-sm-10 col-xs-12 col-offset-2">
    <h2 class="title"><!--{$tpl_title|h}--></h2>
    <div id="undercolumn_contact">
        <p>請確認以下內容無誤後按下一步按鈕。</p>
        <form name="form1" id="form1" method="post" action="?">
        <input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME}-->" value="<!--{$transactionid}-->" />
        <input type="hidden" name="mode" value="complete" />
        <!--{foreach key=key item=item from=$arrForm}-->
            <!--{if $key ne 'mode'}-->
                <input type="hidden" name="<!--{$key}-->" value="<!--{$item.value|h}-->" />
            <!--{/if}-->
        <!--{/foreach}-->
        <table summary="聯絡内容確認">
            <col width="30%" />
            <col width="70%" />
            <tr>
                <th>諮詢項目<span class="attention">※</span></th>
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
                <th>電話號碼</th>
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
            <ul>
                <li>
                    <a href="?" onclick="fnModeSubmit('return', '', ''); return false;" onmouseover="chgImg('<!--{$TPL_URLPATH}-->img/button/btn_back_on.jpg','back02');" onmouseout="chgImg('<!--{$TPL_URLPATH}-->img/button/btn_back.jpg','back02');"> <img src="<!--{$TPL_URLPATH}-->img/button/btn_back.jpg" name="back02" id="back02" /></a>
                </li>
                <li>
                    <input type="image" onclick="return fnCheckSubmit();" onmouseover="chgImgImageSubmit('<!--{$TPL_URLPATH}-->img/button/btn_complete_on.jpg',this)" onmouseout="chgImgImageSubmit('<!--{$TPL_URLPATH}-->img/button/btn_complete.jpg',this)" src="<!--{$TPL_URLPATH}-->img/button/btn_complete.jpg" name="send" id="send" />
                </li>
            </ul>
        </div>

        </form>
    </div>
</div>
</div></div></div>
