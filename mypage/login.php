

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

        <div id="undercolumn" class="container sec-wrap">
            <div id="main_text">
                <div class="columns-12">
                    <div id="shoppingCart" class="col-md-8 col-sm-10 col-xs-12 col-offset-2">
                        <h2 class="title"><!--{$tpl_title|h}--></h2>
                        <div id="undercolumn_login">
                            <form name="login_mypage" id="login_mypage" method="post" action="<!--{$smarty.const.HTTPS_URL}-->frontparts/login_check.php" onsubmit="return fnCheckLogin('login_mypage')">
                            <input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME}-->" value="<!--{$transactionid}-->" />
                            <input type="hidden" name="mode" value="login" />
                            <input type="hidden" name="url" value="<!--{$smarty.server.REQUEST_URI|h}-->" />

                            <div class="login_area">
                                <h3>已經註冊會員的客戶</h3>
                                <p class="inputtext">會員請用電子郵件和密碼登入頁面。</p>
                                <div class="inputbox">
                                    <dl class="formlist clearfix">
                                        <!--{assign var=key value="login_email"}-->
                                        <span class="attention"><!--{$arrErr[$key]}--></span>
                                        <dt>電子郵件&nbsp;:</dt>
                                        <dd>
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
                                    忘記密碼請點擊<a href="<!--{$smarty.const.HTTPS_URL|sfTrimURL}-->/forgot/<!--{$smarty.const.DIR_INDEX_PATH}-->" onclick="win01('<!--{$smarty.const.HTTPS_URL|sfTrimURL}-->/forgot/<!--{$smarty.const.DIR_INDEX_PATH}-->','forget','600','460'); return false;" target="_blank">這裡</a>。<br />
                                    ※忘記帳號請您聯繫我們，請<a href="<!--{$smarty.const.ROOT_URLPATH}-->contact/<!--{$smarty.const.DIR_INDEX_PATH}-->">聯絡我們</a>。
                                </p>
                            </div>

                            <div class="login_area">
                                <h3>未註冊會員的顧客</h3
                                <p class="inputtext">註冊會員可以更便捷的使用會員中心。<br />
                                    而且，登入後就無需每次輸入姓名和地址，更利於您方便購物。
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
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
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

