<?php include '../header.php'; ?>
<div id="container">
    <div id="one_maincolumn" class="main_column">
     
        <!--   肚子開始  -->
        <link rel="stylesheet" href="../user_data/new_201811/css/new_chart.css" />

        <div id="undercolumn" class="container sec-wrap">
            <div id="main_text">
                <div class="columns-12">
                    <div id="shoppingCart">
                        <div id="undercolumn_shopping">
                        
                            <ul class="flow_area">
                                <li class="active"><span>1</span>付款與運送方式</li>
                                <li class="active"><span>2</span>訂單確認</li>
                                <li class="active"><span>3</span>訂單完成</li>
                            </ul>
                            <div class="bg_l_pink t_center" id="complete_page">
                                <h4 class="title f24 f_red">您的訂單已完成</h4>
                                <!--{* エラーメッセージがある場合は表示される *}-->
                                <span class="attention"><!--{$tpl_errormessage|h}--></span>
                                
                                <!--{if $smarty.session.apply_order == 'COMPLETE'}-->
                                <!-- ▼その他決済情報を表示する場合は表示 -->
                                <!--{if $arrOther.title.value}-->
                                    <p><span class="attention">*<!--{$arrOther.title.name}--> 信息</span><br />
                                        <!--{foreach key=key item=item from=$arrOther}-->
                                            <!--{if $key != "title"}-->
                                                <!--{if $item.name != ""}-->
                                                    <!--{$item.name}-->:
                                                <!--{/if}-->
                                                    <!--{$item.value|nl2br}--><br />
                                            <!--{/if}-->
                                        <!--{/foreach}-->
                                    </p>
                                <!--{/if}-->
                                <!-- ▲コンビに決済の場合には表示 -->

                                <div id="complete_area">
                                    <p class="message">
                                        非常感謝您購買曼娜麗股份有限公司的商品。<br>我們將寄送訂購資訊至您的電子郵件，期待您下次光臨。
                                    </p>
                                </div>
                                
                                <!--{else}-->
                                <div id="complete_area">
                                    <p class="attention">您的订单未成功完成。<br>这是非常抱歉给您添麻烦，但是请直接从下面的查询检查给管理员。</p>
                                    <div class="shop_information">
                                        <p class="name"><!--{$arrInfo.shop_name|h}--></p>
                                        <p>TEL:<!--{$arrInfo.tel01}-->-<!--{$arrInfo.tel02}-->-<!--{$arrInfo.tel03}--> <!--{if $arrInfo.business_hour != ""}-->(受理時間<!--{$arrInfo.business_hour}-->)<!--{/if}--><br />
                                        E-mail:<a href="mailto:<!--{$arrInfo.email02|escape:'hex'}-->"><!--{$arrInfo.email02|escape:'hexentity'}--></a>
                                        </p>
                                    </div>
                                </div>
                                <!--{/if}-->



                            </div>
                            
                            <div class="btn_area">
                                <a href="<!--{$smarty.const.TOP_URLPATH}-->" class="btn f_black bg_white mr15" >回到首頁</a>
                                <a href="<!--{$smarty.const.TOP_URLPATH}-->/login.php" class="btn f_white bg_red" >查詢訂單</a>

                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!--   肚子結束  -->

    </div>
</div>


<?php include '../footer.php'; ?> 


