

<?php include '../header.php'; ?>

<!-- https://www.manara.asia/tw/ -->
<!--{$smarty.const.ROOT_URLPATH}-->


<div id="container">
    <div id="one_maincolumn" class="main_column">

        <!--   肚子開始  -->
        <link rel="stylesheet" href="../user_data/new_201811/css/new_login.css" />

        <div id="undercolumn" class="container sec-wrap">
        <div id="main_text">
            <h2>
                會員登入
                <font>LOGIN</font>
            </h2>
                <div id="shoppingCart">
                    <div id="undercolumn_login">
                        <h2 class="title"><!--{$tpl_title|h}--></h2>
                        <form name="member_form" id="member_form" method="post" action="?" onsubmit="return fnCheckLogin('member_form')">
                            <input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME}-->" value="<!--{$transactionid}-->" />
                            <input type="hidden" name="mode" value="login" />

                            <div class="login_area first">
                                <h3>會員登入</h3>
                                <div class="inputbox">
                                    <dl class="formlist clearfix">
                                        <!--{assign var=key value="login_email"}-->
                                        <dt>電子郵件&nbsp;:</dt>
                                        <dd>
                                            <!--{if strlen($arrErr[$key]) >= 1}--><span class="attention"><!--{$arrErr[$key]}--></span><br /><!--{/if}-->
                                            <input type="text" name="<!--{$key}-->" value="<!--{$tpl_login_email|h}-->" maxlength="<!--{$arrForm[$key].length}-->" style="<!--{$arrErr[$key]|sfGetErrorColor}-->; ime-mode: disabled;" />
                                            <p class="login_memory">
                                                <!--{assign var=key value="login_memory"}-->
                                                <!-- //FIXME 開假的input -->
                                                <input type="checkbox" name="" value="1" id="login_memory" />
                                                
                                                <?php
                                                    //<input type="checkbox" name="<!--{$key}-->" value="1" id="login_memory" <!--{$tpl_login_memory|sfGetChecked:1}--> />
                                                ?>
                                                
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
                                            <input type="password" name="<!--{$key}-->" maxlength="<!--{$arrForm[$key].length}-->" style="<!--{$arrErr[$key]|sfGetErrorColor}-->" />
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
        </div>
    </div>
</div>


<?php include '../footer.php'; ?> 

<script>
    $(function(){
        $('input').each(function(){
            $(this).attr('value','')
        })
    })
    $(window).on('click',function(){
        console.log('123')
        window.location="deliv.php";
    })

</script>