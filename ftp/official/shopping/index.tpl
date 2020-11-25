<link rel="stylesheet" href="../user_data/new_201811/css/new_init.css" />
<link rel="stylesheet" href="../user_data/new_201811/css/new_login.css" />

<div id="undercolumn" class="container sec-wrap">
    <div id="main_text">
        <h2>
            會員登入
            <font>LOGIN</font>
        </h2>
        <div id="undercolumn_login">
            <form name="login_mypage" id="login_mypage" method="post" action="<!--{$smarty.const.HTTPS_URL}-->frontparts/login_check.php" onsubmit="return fnCheckLogin('login_mypage')">
                <input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME}-->" value="<!--{$transactionid}-->" />
                <input type="hidden" name="mode" value="login" />
                <input type="hidden" name="url" value="<!--{$smarty.server.REQUEST_URI|h}-->" />

                <div class="login_area first">
                    <h3>會員登入</h3>
                    <div class="inputbox">
                        <dl class="clearfix">
                            <dt>電子郵件:</dt>
                            <dd>
                                <input type="text" name="login_email" value="" maxlength="" >
                                <p class="login_memory">
                                    <input type="checkbox" name="login_memory" value="1" id="login_memory">
                                    <label for="login_memory">記住我的帳號</label>
                                </p>
                            </dd>
                        </dl>
                        <dl class="clearfix">
                            <dt>
                                密碼:
                                <a class="f_red" href="<!--{$smarty.const.HTTPS_URL|sfTrimURL}-->/forgot/<!--{$smarty.const.DIR_INDEX_PATH}-->" onclick="win01('<!--{$smarty.const.HTTPS_URL|sfTrimURL}-->/forgot/<!--{$smarty.const.DIR_INDEX_PATH}-->','forget','600','460'); return false;" target="_blank">忘記密碼?</a>
                            </dt>
                            <dd>
                                <input type="password" name="login_pass" maxlength="" >
                            </dd>
                        </dl>
                        <div class="btn_area">
                            <button type="submit" class="btn f_white bg_red" name="log" id="log">
                                <span>登入</span>
                            </button>
                        </div>
                    </div>
                    <p class="f_grey">
                        ※忘記帳號請您<a href="<!--{$smarty.const.ROOT_URLPATH}-->contact/<!--{$smarty.const.DIR_INDEX_PATH}-->" class="f_red">聯絡我們</a>。
                    </p>
                </div>

                <div class="login_area">
                    <h3>會員申請</h3>
                    <p class="inputtext">註冊會員可以更便捷的使用會員中心。<br />
                        而且，登入後就無需每次輸入姓名和地址，更利於您方便購物。
                    </p>
                    <div class="inputbox">
                        <div class="btn_area">
                            <a href="<!--{$smarty.const.ROOT_URLPATH}-->entry/kiyaku.php" class="btn f_white bg_red">
                                <span>加入會員</span>
                            </a>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
