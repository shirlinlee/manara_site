<link rel="stylesheet" href="../user_data/new_201811/css/new_init.css" />
<link rel="stylesheet" href="../user_data/new_201811/css/new_login.css" />


 <script>
    window.fbAsyncInit = function() {
        FB.init({
           appId            : '3836785389740276',
           autoLogAppEvents : true,
           xfbml            : true,
           version          : 'v9.0'
        });
        FB.AppEvents.logPageView();
    };

    (function(d, s, id){
        var js, fjs = d.getElementsByTagName(s)[0];
        if (d.getElementById(id)) {return;}
        js = d.createElement(s); js.id = id;
        js.src = "https://connect.facebook.net/en_US/sdk.js";
        fjs.parentNode.insertBefore(js, fjs);
    }(document, 'script', 'facebook-jssdk'));
</script>

<div id="fb-root"></div>
<script async defer crossorigin="anonymous" src="https://connect.facebook.net/ja_JP/sdk.js#xfbml=1&version=v9.0&appId=820498802077207&autoLogAppEvents=1" nonce="Luohbn9g">
</script>

<script>
    // ログインボタン自作の場合
    function login() {
        FB.login(function(response) {

            if (response.status == 'connected') {
                FB.api('/me?fields=id, last_name, first_name, email', function(response) {

                  // ログイン成功の時、PHP側にresponseをPOSTしたい
                  // formのsubmit前にmodeとfbInfoの値変えとく
                  $('#mode').val('fbAuth')
                  $('#fbInfo').val(JSON.stringify(response));

                  // 入力チェックされないようformのonsubmitも書き換え
                  document.getElementById('login_mypage').onsubmit = "";

                  document.login_mypage.submit();


                });

             }
             else {
                // 他の場合は何もしない
             }
        }, {scope: 'public_profile,email'});
    }

</script>



<div id="undercolumn" class="container sec-wrap">
    <div id="main_text">
        <h2>
            會員登入
            <font>LOGIN</font>
        </h2>
        <div id="undercolumn_login">
            <form name="login_mypage" id="login_mypage" method="post" action="<!--{$smarty.const.HTTPS_URL}-->frontparts/login_check.php" onsubmit="return fnCheckLogin('login_mypage')">
                <input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME}-->" value="<!--{$transactionid}-->" />

                <input type="hidden" id="mode" name="mode" value="login" />

                <input type="hidden" id="fbInfo" name="fbInfo" value="" />

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
                        ※忘記帳號請您<a href="<!--{$smarty.const.ROOT_URLPATH}-->contact/<!--{$smarty.const.DIR_INDEX_PATH}-->" class="f_red">聯絡我們</a>。<br />
                        ※若您曾於活動網頁購買過商品，請由此登入。<br />
                        ※若您尚未設定密碼，請由「<a class="f_red" href="<!--{$smarty.const.HTTPS_URL|sfTrimURL}-->/forgot/<!--{$smarty.const.DIR_INDEX_PATH}-->" onclick="win01('<!--{$smarty.const.HTTPS_URL|sfTrimURL}-->/forgot/<!--{$smarty.const.DIR_INDEX_PATH}-->','forget','600','460'); return false;" target="_blank">忘記密碼</a>」開始。<br />

                    </p>
                </div>

                <div class="login_area">
                    <h3 class="btn_area title-border" >或是</h3>
                    <div class="inputbox">
                        <div class="btn_area">
                            <ul>
                                <li>
                                   <a><img class="js-ec-sms_authentication_button" src="<!--{$TPL_URLPATH}-->img/button/login_SMS.png" /></a><br /><a onclick="login()"><img style="margin-top:20px;" src="<!--{$TPL_URLPATH}-->img/button/login_Facebook.png"/></a><br />
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>


                <div class="login_area">
                    <h3>新會員申請</h3>
                    <p class="inputtext">註冊會員可以更便捷的使用會員中心。<br />
                        而且，登入後就無需每次輸入姓名和地址，更利於您方便購物。
                    </p>
                    <div class="inputbox">
                        <div class="btn_area">
                            <a href="<!--{$smarty.const.ROOT_URLPATH}-->entry/kiyaku.php" class="btn f_white bg_red js-ec-modal-purchase-record-open">
                                <span>加入會員</span>
                            </a>
                        </div>
                    </div>
                </div>
            </form>
            <!--規約画面に渡す用のform-->
            <form name="ec_kiyaku" id="ec_kiyaku" method="post" action="<!--{$smarty.const.HTTPS_URL}-->entry/kiyaku.php">
              <input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME}-->" value="<!--{$transactionid}-->" />
              <input type="hidden" name="url" value="<!--{$smarty.server.REQUEST_URI|h}-->" />
              <input type="hidden" class="ec-non-member-customer-id" name="ec-non-member-customer-id" value="" />
            </form>

        </div>
    </div>
</div>

<script>
    $(function() {

        <!--{* SMS 認証ログインボタン *}-->
        $('.js-ec-sms_authentication_button').on('click', function() {
            $('.js-ec-modal-passcode-send').fadeIn();
            return false;
        });

        <!--{* 会員登録ボタン *}-->
        $('.js-ec-modal-purchase-record-open').on('click', function() {
            $('.js-ec-modal-purchase-record').fadeIn();
            return false;
        });

        // 2020.12.01 rkyoui Facebook認証で顧客見つからなかった時購入実績有無モーダル表示させたい
        if ('<!--{$smarty.session.fb_api_error}-->' == 'E3301') {
            $('.js-ec-modal-purchase-record').fadeIn();
            window.alert('未搜尋到與您的Facebook資訊相符的購買紀錄，請於畫面選擇是否曾經消費或進行新會員註冊。');
        }

    });
</script>

<style>
    #container {
        position: static !important;
    }
    .header{
        z-index:0;
    }
</style>
