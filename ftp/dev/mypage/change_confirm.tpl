<!--{*
/*
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
 */
*}-->
<div class="W100 t_center">
    <div class="W1360 bread">
        <span class="f15 f_pink f_left"><a class="f_grey" href="/tw/">首頁 /</a> <font class="f_grey">會員中心 / </font>會員資料</span>
    </div>
</div>
<div id="mypagecolumn" class="container sec-wrap">
    <!--{include file=$tpl_navi}-->
    <div id="mycontents_area">
        <h3>再次確認變更資料</h3>
        <p>請確認所變更的資料。如需要修改， 請點選「回上頁」按鈕。<br />*如點選「送出」按鈕，即完成修改。</p>

        <form name="form1" id="form1" method="post" action="?">
        <input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME}-->" value="<!--{$transactionid}-->" />
        <input type="hidden" name="mode" value="complete" />
        <input type="hidden" name="customer_id" value="<!--{$arrForm.customer_id|h}-->" />
        <!--{foreach from=$arrForm key=key item=item}-->
            <!--{if $key ne "mode" && $key ne "subm"}-->
            <input type="hidden" name="<!--{$key|h}-->" value="<!--{$item|h}-->" />
            <!--{/if}-->
        <!--{/foreach}-->
        <table summary=" " class="delivname mypage_table">
            <col width="30%" />
            <col width="70%" />
            <tr>
                <th>姓名</th>
                <td><!--{$arrForm.name01|h}--> <!--{$arrForm.name02|h}--></td>
            </tr>
            <tr>
                <th>性別</th>
                <td><!--{$arrSex[$arrForm.sex]}--></td>
            </tr>
            <tr>
                <th>郵遞區號</th>
                <!--{* <td><!--{$arrForm.zip01}-->-<!--{$arrForm.zip02}--></td> *}-->
                <td><!--{$arrForm.zipcode}--></td>
            </tr>
            <tr>
                <th>地址</th>
                <td><!--{$arrPref[$arrForm.pref]}--><!--{$arrForm.addr01|h}--><!--{$arrForm.addr02|h}--></td>
            </tr>
            <tr>
                <th>電話號碼</th>
                <td><!--{$arrForm.tel01|h}-->-<!--{$arrForm.tel02}--> / <!--{$arrForm.tel03}--></td>
            </tr>
            <tr style="display: none;">
                <th>傳真號碼</th>
                <td><!--{if strlen($arrForm.fax01) > 0}--><!--{$arrForm.fax01}-->-<!--{$arrForm.fax02}-->-<!--{$arrForm.fax03}--><!--{else}-->未選擇<!--{/if}--></td>
            </tr>
            <tr>
                <th>電子郵件信箱</th>
                <td><a href="<!--{$arrForm.email|escape:'hex'}-->"><!--{$arrForm.email|escape:'hexentity'}--></a></td>
            </tr>
            <tr style="display: none;">
                <th>(手機)電子郵件信箱</th>
                <td>
                    <!--{if strlen($arrForm.email_mobile) > 0}-->
                    <a href="<!--{$arrForm.email_mobile|escape:'hex'}-->"><!--{$arrForm.email_mobile|escape:'hexentity'}--></a>
                    <!--{else}-->
                    未註冊
                    <!--{/if}-->
                </td>
            </tr>
            <tr>
                <th>職業</th>
                <td><!--{$arrJob[$arrForm.job]|default:"未選擇"|h}--></td>
            </tr>
            <tr>
                <th>生日</th>
                <td><!--{if strlen($arrForm.year) > 0 && strlen($arrForm.month) > 0 && strlen($arrForm.day) > 0}-->
                民國<!--{$arrForm.year-1911}-->年<br />
                <!--{$arrForm.year|h}--> / <!--{$arrForm.month|h}--> / <!--{$arrForm.day|h}--><!--{else}-->未註冊<!--{/if}--></td>
            </tr>
            <tr>
                <th>設定密碼<br />
                </th>
                <td><!--{$passlen}--></td>
            </tr>
            <tr style="display: none;">
                <th>忘記密碼提示</th>
                <td>問題:&nbsp;<!--{$arrReminder[$arrForm.reminder]|h}--><br />
                    答案:&nbsp;<!--{$arrForm.reminder_answer|h}--></td>
            </tr>
            <tr style="display: none;">
                <th>關於訂閱電子報</th>
                <td><!--{$arrMAILMAGATYPE[$arrForm.mailmaga_flg]}--></td>
            </tr>
        </table>
            <div class="btn_area btn_display" >
                <ul>
                    <li>
                        <a class="btn bg_white f_black border_round" href="?" onclick="fnModeSubmit('return', '', ''); return false;" onmouseover="chgImg('<!--{$TPL_URLPATH}-->img/button/btn_back_on.jpg','back');" onmouseout="chgImg('<!--{$TPL_URLPATH}-->img/button/btn_back.jpg','back');">回上頁</a>
                    </li>
                    <li>
                        <button class="btn bg_red f_white" name="complete" id="complete">送出</button>
                    </li>
                </ul>
            </div>
        </form>
    </div>
</div>


<link rel="stylesheet" href="../user_data/new_201811/css/new_init.css" />
<link rel="stylesheet" href="../user_data/new_201811/css/new_mypage.css" />