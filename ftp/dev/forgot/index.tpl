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

<!--{include file="`$smarty.const.TEMPLATE_REALDIR`popup_header.tpl" subtitle="If you have forgotten your password (input page)"}-->
<link rel="stylesheet" href="../user_data/new_201811/css/new_init.css" />

<div id="window_area" style=" margin: 15px auto 0; max-width: 340px;">
    <h2 class="f24 pb15">發送臨時密碼</h2>
    <p class="information f16" style="line-height: 1.5">請輸入註冊時登記之電子郵件信箱，並點選「發送臨時密碼」按鍵<br />
    <span class="attention">*發行新密碼後，將無法使用原密碼登入系統</span></p>
    <form action="?" method="post" name="form1">
    <input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME}-->" value="<!--{$transactionid}-->" />
    <input type="hidden" name="mode" value="mail_check" />

    <div class="W100 forget">
        <div class="mailaddres f16">
            <p>
                電子郵件:&nbsp;&nbsp;
                <input type="text" name="email" value="<!--{$arrForm.email|default:$tpl_login_email|h}-->" class="box300" style="<!--{$arrErr.email|sfGetErrorColor}-->; ime-mode: disabled;" />
            </p>
            <p class="attention"><!--{$arrErr.email}--></p>
        </div>
        <div class="name f16" style="display: none;">
            <p>
                姓&nbsp;<input type="text" class="box120" name="name01" value="<!--{$arrForm.name01|default:'*'|h}-->" maxlength="<!--{$smarty.const.STEXT_LEN}-->" style="<!--{$arrErr.name01|sfGetErrorColor}-->;" />
                名&nbsp;<input type="text" class="box120" name="name02" value="<!--{$arrForm.name02|default:'*'|h}-->" maxlength="<!--{$smarty.const.STEXT_LEN}-->" style="<!--{$arrErr.name02|sfGetErrorColor}-->;" />
            </p>
            <p class="attention">
                <!--{$arrErr.name01}--><!--{$arrErr.name02}-->
                <!--{$errmsg}-->
            </p>
        </div>
    </div>
    <div class="btn_area mt30" >
        <ul>
            <li><button class="btn f_white bg_red" style="min-width: 180px">發送臨時密碼</button></li>
        </ul>
    </div>
    </form>
</div>
<!--{include file="`$smarty.const.TEMPLATE_REALDIR`popup_footer.tpl"}-->

