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
<link rel="stylesheet" href="../user_data/new_201811/css/new_init.css" />
<link rel="stylesheet" href="../user_data/new_201811/css/new_login.css" />

<div id="undercolumn" class="container sec-wrap">
    <div id="main_text">

        <h2>會員登入<font>LOGIN</font>
        </h2>
        <div id="login">
            <form name="login_mypage" id="login_mypage" method="post"
                action="<!--{$smarty.const.HTTPS_URL}-->frontparts/login_check.php"
                onsubmit="return fnCheckLogin('login_mypage')">
                <input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME}-->"
                    value="<!--{$transactionid}-->" />
                <input type="hidden" name="mode" value="login" />
                <input type="hidden" name="url" value="<!--{$smarty.server.REQUEST_URI|h}-->" />

                <div class="login_area first">
                    <!-- <h3>會員登入</h3> -->
                    <div class="inputbox">
                        <dl class="">
                            <!--{assign var=key value="login_email"}-->
                            <span class="attention">
                                <!--{$arrErr[$key]}--></span>
                            <dt>電子郵件&nbsp;:</dt>
                            <dd>
                                <input type="text" name="<!--{$key}-->" value="<!--{$tpl_login_email|h}-->"
                                    maxlength="<!--{$arrForm[$key].length}-->"
                                    style="<!--{$arrErr[$key]|sfGetErrorColor}-->; ime-mode: disabled;" />
                                <p class="login_memory">
                                    <!--{assign var=key value="login_memory"}-->
                                    <input type="checkbox" name="<!--{$key}-->" value="1"
                                        <!--{$tpl_login_memory|sfGetChecked:1}--> id="login_memory" />
                                    <label for="login_memory">記住我的帳號</label>
                                </p>
                            </dd>
                        </dl>
                        <dl class="">
                            <dt>
                                <!--{assign var=key value="login_pass"}-->
                                <span class="attention">
                                    <!--{$arrErr[$key]}--></span>
                                密碼&nbsp;:
                                <a class="f_red"
                                    href="<!--{$smarty.const.HTTPS_URL|sfTrimURL}-->/forgot/<!--{$smarty.const.DIR_INDEX_PATH}-->"
                                    onclick="win01('<!--{$smarty.const.HTTPS_URL|sfTrimURL}-->/forgot/<!--{$smarty.const.DIR_INDEX_PATH}-->','forget','600','460'); return false;"
                                    target="_blank">忘記密碼?</a>
                            </dt>
                            <dd>
                                <input type="password" name="<!--{$key}-->" maxlength="<!--{$arrForm[$key].length}-->"
                                    style="<!--{$arrErr[$key]|sfGetErrorColor}-->" />
                            </dd>
                        </dl>
                        <div class="btn_area">
                            <button type="submit" class="btn f_white bg_red" name="log" id="log">
                                <span>登入</span>
                            </button>
                        </div>
                    </div>
                    <p class="f_grey">
                        ※忘記帳號請您<a
                            href="<!--{$smarty.const.ROOT_URLPATH}-->contact/<!--{$smarty.const.DIR_INDEX_PATH}-->"
                            class="f_red">聯絡我們</a>。<br />
                        ※若您曾於活動網頁購買過商品，請由此登入。<br />
                        ※若您尚未設定密碼，請由「<a class="f_red"
                            href="<!--{$smarty.const.HTTPS_URL|sfTrimURL}-->/forgot/<!--{$smarty.const.DIR_INDEX_PATH}-->"
                            onclick="win01('<!--{$smarty.const.HTTPS_URL|sfTrimURL}-->/forgot/<!--{$smarty.const.DIR_INDEX_PATH}-->','forget','600','460'); return false;"
                            target="_blank">忘記密碼</a>」開始。<br />
                    </p>
                </div>

                <!-- <div class="login_area">
                    <h3>會員申請</h3>
                    <p class="inputtext">註冊會員可以更便捷的使用會員中心。<br />
                        而且，登入後就無需每次輸入姓名和地址，更利於您方便購物。
                    </p>
                    <div class="inputbox">
                        <div class="btn_area">
                            路徑拔除 entry/kiyaku.php
                            <a href="<!--" class="btn f_white bg_red">
                                <span>加入會員</span>
                            </a>
                        </div>
                    </div>
                </div> -->
            </form>
        </div>
    </div>

</div>
</div>