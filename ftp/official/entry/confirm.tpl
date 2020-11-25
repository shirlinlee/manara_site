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

<link rel="stylesheet" href="../user_data/new_201811/css/new_init.css" />
<link rel="stylesheet" href="../user_data/new_201811/css/new_login.css" />

<div id="mypagecolumn"  class="container sec-wrap">
    <div id="entry">
        <h2>會員登錄確認
            <font>Member Registration</font>
        </h2>
        <p class="pb40 t_center">請確認下列內容是否需要修改？<br>若無需修改，請點選最下方「送出」之按鍵</p>
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
                <th>年齢</th>
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
            <tr style="display: none;">
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
            <a href="javascript:;" class="btn f_black" onclick="fnModeSubmit('return', '', ''); return false;" border="0" name="back" id="back">
                <span>返回</span>
            </a>
            <button class="btn f_white bg_red" border="0" name="send" id="send"> <span>送出</span></button>
        </div>

        </form>
    </div>
</div>
