

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
        <div id="mypagecolumn"  class="container sec-wrap">
            <div id="undercolumn_entry">
                <h2 class="title"><!--{$tpl_title|h}--></h2>
                <div id="complete_area">
                    <p class="message">會員登記內容變更完成</p>
                    <p>現在還是<span class="attention">非正式會員</span>的狀態。<br />
                        請點擊電子郵件里的URL地址以完成註冊           </p>

                    <div class="shop_information">
                        <p class="name"><!--{$arrSiteInfo.company_name|h}--></p>
                        <p>TEL:<!--{$arrSiteInfo.tel01}-->-<!--{$arrSiteInfo.tel02}-->-<!--{$arrSiteInfo.tel03}-->
                            <!--{if $arrSiteInfo.business_hour != ""}-->(諮詢時間/<!--{$arrSiteInfo.business_hour}-->)<!--{/if}--><br />
                            E-mail:<a href="mailto:<!--{$arrSiteInfo.email02|escape:'hex'}-->"><!--{$arrSiteInfo.email02|escape:'hexentity'}--></a>
                        </p>
                    </div>

                    <div class="btn_area">
                        <ul>
                            <li>
                                <a href="<!--{$smarty.const.TOP_URLPATH}-->" onmouseover="chgImg('<!--{$TPL_URLPATH}-->img/button/btn_toppage_on.jpg','b_toppage');" onmouseout="chgImg('<!--{$TPL_URLPATH}-->img/button/btn_toppage.jpg','b_toppage');"><img src="<!--{$TPL_URLPATH}-->img/button/btn_toppage.jpg"  border="0" name="b_toppage" /></a>
                            </li>
                        </ul>
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

