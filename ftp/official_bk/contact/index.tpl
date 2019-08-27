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

<div id="undercolumn" class="container sec-wrap">
<div id="main_text">
            <div class="columns-12">
                <div id="shoppingCart" class="col-md-8 col-sm-10 col-xs-12 col-offset-2">
    <h2 class="title"><!--{$tpl_title|h}--></h2>

    <div id="undercolumn_contact">

        <p>・有關已訂購的商品內容之變更、訂單取消、退換貨，緊急聯絡事項，請直接與我們聯絡 0809-091-920
        ( 營業時間：上午9：00 - 下午18：00 (全年無休) )</p>
        <p>・此聯絡我們的服務項目並不包括商品內容之變更訂單取消。</p>
        <p>・於周末、國定假日及平日五點以後的來信，將會在隔一日的營業日之後回覆。</p>

        <form name="form1" method="post" action="?">
        <input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME}-->" value="<!--{$transactionid}-->" />
        <input type="hidden" name="mode" value="confirm" />

        <table summary="聯繫我們" style="table-layout:fixed;word-wrap:break-word;word-break;break-all;">

            <tr>
                <th width="20%">諮詢項目<span class="attention">※</span></th>
                <td>
                    <span class="attention"><!--{$arrErr.genre}--></span>
                    <select name="genre" style="<!--{$arrErr.genre|sfGetErrorColor}-->">
                    <option value="">請選擇諮詢項目</option><!--{html_options options=$arrGenre selected=$arrForm.genre.value|h|default:$arrData.genre|h}-->
                    </select>
                </td>
            </tr>
            <tr>
                <th><br>訂單編號</th>
                <td>
                    <input type="text" class="box120" name="cod" value="<!--{$arrForm.cod.value|h|default:$arrData.cod|h}-->" maxlength="<!--{$smarty.const.STEXT_LEN}-->" style="<!--{$arrErr.cod|sfGetErrorColor}-->; ime-mode: active;" />
                    <span class="attention"><!--{$arrErr.cod}--></span>(若是關於訂單的諮詢請填寫訂單編號)
                </td>
            </tr>

            <tr>
                <th>姓名<span class="attention">*</span></th>
                <td>
                    <span class="attention"><!--{$arrErr.name01}--><!--{$arrErr.name02}--></span>
                    姓&nbsp;<input type="text" class="box120" name="name01" value="<!--{$arrForm.name01.value|default:$arrData.name01|h}-->" maxlength="<!--{$smarty.const.STEXT_LEN}-->" style="<!--{$arrErr.name01|sfGetErrorColor}-->;" /> <br />
                    名&nbsp;<input type="text" class="box120" name="name02" value="<!--{$arrForm.name02.value|default:$arrData.name02|h}-->" maxlength="<!--{$smarty.const.STEXT_LEN}-->" style="<!--{$arrErr.name02|sfGetErrorColor}-->;" />
                </td>
            </tr
            <tr>
                <th>郵遞區號</th>
                <td>
                    <!--{* <span class="attention"><!--{$arrErr.zip01}--><!--{$arrErr.zip02}--></span> *}-->
                    <span class="attention"><!--{$arrErr.zipcode}--></span>

                    <p class="top">
                        &nbsp;
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
                <th>電話號碼</th>
                <td>
                    <span class="attention"><!--{$arrErr.tel01}--><!--{$arrErr.tel02}--><!--{$arrErr.tel03}--></span>
                    1.&nbsp;<input type="text" class="box300 top" name="tel01" value="<!--{$arrForm.tel01.value|default:$arrData.tel01|h}-->" maxlength="<!--{$smarty.const.TEL_ITEM_LEN}-->" style="<!--{$arrErr.tel01|sfGetErrorColor}-->; ime-mode: disabled;" /><br />
                    2.&nbsp;<input type="text" class="box300" name="tel02" value="<!--{$arrForm.tel02.value|default:$arrData.tel02|h}-->" maxlength="<!--{$smarty.const.TEL_ITEM_LEN}-->" style="<!--{$arrErr.tel02|sfGetErrorColor}-->; ime-mode: disabled;" />
                    <!--{* <input type="text" class="box60" name="tel03" value="<!--{$arrForm.tel03.value|default:$arrData.tel03|h}-->" maxlength="<!--{$smarty.const.TEL_ITEM_LEN}-->" style="<!--{$arrErr.tel03|sfGetErrorColor}-->; ime-mode: disabled;" /> *}-->
                </td>
            </tr>
            <tr>
                <th>電子郵件信箱<span class="attention">*</span></th>
                <td>
                    <span class="attention"><!--{$arrErr.email}--><!--{$arrErr.email02}--></span>
                    <input type="text" class="box300 top" name="email" value="<!--{$arrForm.email.value|default:$arrData.email|h}-->" style="<!--{$arrErr.email|sfGetErrorColor}-->; ime-mode: disabled;" /><br />
                    <!--{* ログインしていれば入力済みにする *}-->
                    <!--{if $smarty.server.REQUEST_METHOD != 'POST' && $smarty.session.customer}-->
                    <!--{assign var=email02 value=$arrData.email}-->
                    <!--{/if}-->
                    <input type="text" class="box300" name="email02" value="<!--{$arrForm.email02.value|default:$email02|h}-->" style="<!--{$arrErr.email02|sfGetErrorColor}-->; ime-mode: disabled;" /><br />
                    <p class="mini"><span class="attention">請再次輸入相同的電子郵件</span></p>
                </td>
            </tr>
            <tr>
                <th>聯繫我們之內容<span class="attention">*</span><br />
                <span class="mini">(<!--{$smarty.const.MLTEXT_LEN}-->字以下)</span></th>
                <td>
                    <span class="attention"><!--{$arrErr.contents}--></span>
                    <textarea name="contents" class="box300 top"  cols="40" rows="10" style="<!--{$arrErr.contents.value|h|sfGetErrorColor}-->"><!--{"\n"}--><!--{$arrForm.contents.value|h}--></textarea>
                    <p class="mini attention">※若為有關訂單之諮詢內容，請務必填寫「訂單編號」於其中</p>
                </td>
            </tr>
        </table>

        <div class="btn_area">
            <ul>
                <li>
                    <input type="image" onmouseover="chgImgImageSubmit('<!--{$TPL_URLPATH}-->img/button/btn_confirm_on.jpg', this)" onmouseout="chgImgImageSubmit('<!--{$TPL_URLPATH}-->img/button/btn_confirm.jpg', this)" src="<!--{$TPL_URLPATH}-->img/button/btn_confirm.jpg" name="confirm" />
                </li>
            </ul>
        </div>

        </form>
    </div>
</div>
</div></div></div>