

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
                <p class="message">歡迎您在MaNara進行消費；請您先詳細閱讀以下約定條款：
        </p>
                <p>本約定條款的目的，是為了保護MaNara「曼娜麗股份有限公司」以及您的利益，如果您點選「我同意」或類似語意的選項、或在MaNara進行訂購、付款、消費或進行相關行為，就視為您事先已經知悉、並同意本約定條款的所有約定。</p>

                <form name="form1" id="form1" method="post" action="?">
                <input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME}-->" value="<!--{$transactionid}-->" />
                <textarea name="textfield" style="width:100%;height:200px;overflow-y: scroll; overflow-x: hidden;" readonly="readonly"><!--{"\n"}--><!--{$tpl_kiyaku_text|h}--></textarea>

                <div class="btn_area">
                    <ul>
                        <li>
                            <a href="<!--{$smarty.const.TOP_URLPATH}-->" onmouseover="chgImg('<!--{$TPL_URLPATH}-->img/button/btn_entry_cannot_on.jpg','b_noagree');" onmouseout="chgImg('<!--{$TPL_URLPATH}-->img/button/btn_entry_cannot.jpg','b_noagree');">
                                <img src="<!--{$TPL_URLPATH}-->img/button/btn_entry_cannot.jpg" border="0" name="b_noagree" /></a>
                        </li>
                        <li>
                            <a href="<!--{$smarty.const.ENTRY_URL}-->" onmouseover="chgImg('<!--{$TPL_URLPATH}-->img/button/btn_entry_agree_on.jpg','b_agree');" onmouseout="chgImg('<!--{$TPL_URLPATH}-->img/button/btn_entry_agree.jpg','b_agree');">
                        <img src="<!--{$TPL_URLPATH}-->img/button/btn_entry_agree.jpg" border="0" name="b_agree" /></a>
                        </li>
                    </ul>
                </div>

                </form>
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

