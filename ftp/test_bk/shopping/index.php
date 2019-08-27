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
    <div id="undercolumn_login">
        <h2 class="title"><!--{$tpl_title|h}--></h2>
        <form name="member_form" id="member_form" method="post" action="?" onsubmit="return fnCheckLogin('member_form')">
        <input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME}-->" value="<!--{$transactionid}-->" />
        <input type="hidden" name="mode" value="login" />

        <div class="login_area">
            <h3>已經註冊會員的客戶</h3>
            <p class="inputtext">會員請用電子郵件和密碼登入頁面。</p>
            <div class="inputbox">
                <dl class="formlist clearfix">
                    <!--{assign var=key value="login_email"}-->
                    <dt>電子郵件&nbsp;:</dt>
                    <dd>
                        <!--{if strlen($arrErr[$key]) >= 1}--><span class="attention"><!--{$arrErr[$key]}--></span><br /><!--{/if}-->
                        <input type="text" name="<!--{$key}-->" value="<!--{$tpl_login_email|h}-->" maxlength="<!--{$arrForm[$key].length}-->" style="<!--{$arrErr[$key]|sfGetErrorColor}-->; ime-mode: disabled;" class="box300" />
                        <p class="login_memory">
                            <!--{assign var=key value="login_memory"}-->
                            <input type="checkbox" name="<!--{$key}-->" value="1"<!--{$tpl_login_memory|sfGetChecked:1}--> id="login_memory" />
                            <label for="login_memory">記住我的帳號</label>
                        </p>
                    </dd>
                </dl>
                <dl class="formlist clearfix">
                    <dt>
                        <!--{assign var=key value="login_pass"}-->
                        <span class="attention"><!--{$arrErr[$key]}--></span>
                        密碼&nbsp;:
                    </dt>
                    <dd>
                        <input type="password" name="<!--{$key}-->" maxlength="<!--{$arrForm[$key].length}-->" style="<!--{$arrErr[$key]|sfGetErrorColor}-->" class="box300" />
                    </dd>
                </dl>
                <div class="btn_area">
                    <ul>
                        <li>
                            <input type="image" onmouseover="chgImgImageSubmit('<!--{$TPL_URLPATH}-->img/button/btn_login_on.jpg',this)" onmouseout="chgImgImageSubmit('<!--{$TPL_URLPATH}-->img/button/btn_login.jpg',this)" src="<!--{$TPL_URLPATH}-->img/button/btn_login.jpg" name="log" id="log" />
                        </li>
                    </ul>
                </div>
            </div>
            <p>
                ※忘記密碼請點擊<a href="<!--{$smarty.const.HTTPS_URL|sfTrimURL}-->/forgot/<!--{$smarty.const.DIR_INDEX_PATH}-->" onclick="win01('<!--{$smarty.const.HTTPS_URL|sfTrimURL}-->/forgot/<!--{$smarty.const.DIR_INDEX_PATH}-->','forget','600','460'); return false;" target="_blank">這裡</a>。<br />
                ※忘記帳號請您聯繫我們，請點擊<a href="<!--{$smarty.const.ROOT_URLPATH}-->contact/<!--{$smarty.const.DIR_INDEX_PATH}-->">諮詢</a>頁面。
            </p>
        </div>
        </form>
        <div class="login_area">
            <h3>未註冊會員的客戶</h3>


            <h4>註冊會員</h4>
            <p class="inputtext">註冊會員可以更便捷的使用會員中心。<br />
                而且，登入后就無需每次輸入姓名和地址，更利於您方便購物。
            </p>
            <div class="inputbox">
                <div class="btn_area">
                    <ul>
                        <li>
                            <a href="<!--{$smarty.const.ROOT_URLPATH}-->entry/kiyaku.php" onmouseover="chgImg('<!--{$TPL_URLPATH}-->img/button/btn_entry_on.jpg','b_gotoentry');" onmouseout="chgImg('<!--{$TPL_URLPATH}-->img/button/btn_entry.jpg','b_gotoentry');">
                            <img src="<!--{$TPL_URLPATH}-->img/button/btn_entry.jpg" border="0" name="b_gotoentry" /></a>
                        </li>
                    </ul>
                </div>
            </div>

            <h4>不註冊会員直接購買</h4>
            <p class="inputtext">不註冊会員直接購買，請從這裡進行。</p>
            <form name="member_form2" id="member_form2" method="post" action="?">
            <input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME}-->" value="<!--{$transactionid}-->" />
            <input type="hidden" name="mode" value="nonmember" />
            <div class="inputbox">
                <div class="btn_area">
                    <ul>
                        <li>
                            <input type="image" onmouseover="chgImgImageSubmit('<!--{$TPL_URLPATH}-->img/button/btn_buystep_on.jpg',this)" onmouseout="chgImgImageSubmit('<!--{$TPL_URLPATH}-->img/button/btn_buystep.jpg',this)" src="<!--{$TPL_URLPATH}-->img/button/btn_buystep.jpg" name="buystep" id="buystep" />
                        </li>
                    </ul>
                </div>
            </div>
            </form>

        </div>
    </div>
</div>
</div></div></div>

