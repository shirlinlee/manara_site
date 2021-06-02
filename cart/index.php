

<?php include '../header.php'; ?>

<!-- https://www.manara.asia/tw/ -->
<!--{$smarty.const.ROOT_URLPATH}-->


<div id="container">
    <div id="one_maincolumn" class="main_column">
     
    <!--   肚子開始  -->
    <link rel="stylesheet" href="../user_data/new_201811/css/new_chart.css" />
    <div class="container sec-wrap">
        <div id="main_text">
                <div id="shoppingCart">
                    <!--{if count($cartItems) > 0}-->
                    <!--{foreach from=$cartKeys item=key}-->
                    <!-- PC Start-->
                    <div class="product-pc">
                        <form name="form<!--{$key}-->" id="form<!--{$key}-->" method="post" action="?">
                        <input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME}-->" value="<!--{$transactionid}-->" />
                        <input type="hidden" name="mode" value="confirm" />
                        <input type="hidden" name="cart_no" value="" />
                        <input type="hidden" name="cartKey" value="<!--{$key}-->" />
                        <input type="hidden" name="category_id" value="<!--{$tpl_category_id|h}-->" />
                        <table class="product-table">
                            <tr class="f15 mb_none">
                                <th class="W55 t_left">商品</th>
                                <th class="W10">售價</th>
                                <th class="W17">數量</th>
                                <th class="W10">小計</th>
                                <th class="W8">刪除</th>
                            </tr>
                            <!--{foreach from=$cartItems[$key] item=item}-->
                            <tr class="f18">
                                
                                <td class="W55">
                                    <div class="flex_wrap">
                                        <div class="pic_td">
                                            <!-- //FIXME 真圖關假圖上 -->
                                            <img src="../user_data/new_201811/img/product/list/cg.png" />
                                            <img style="display:none" src="<!--{$smarty.const.ROOT_URLPATH}-->resize_image.php?image=<!--{$item.productsClass.main_list_image|sfNoImageMainList|h}-->&amp;width=180&amp;height=180" alt="<!--{$item.productsClass.name|h}-->" />
                                        </div>
                                        <!-- //FIXME 砍假文字 -->
                                        <div class="prod_name">
                                            定期-溫熱卸妝凝膠 按摩PLUS(200g)
                                            <!--{$item.productsClass.name|h}-->
                                            
                                            
                                            <!-- //FIXME 砍假currency mb -->
                                            <div class="currency mb">1,100</div>
                                            <div class="currency mb" style="display:none"><!--{$item.price|sfCalcIncTax|number_format}--></div>

                                        </div> 
                                    </div>
                                </td>
                                <td class="W10 mb_none t_center">
                                    <!-- //FIXME 砍假文字 -->
                                    <span class="currency">1,110</span>
                                    <span class="currency" style="display:none"><!--{$item.price|sfCalcIncTax|number_format}--></span>
                                </td>
                                <td class="W17 mb_none t_center">
                                    <div class="counting_area">
                                        <!-- //FIXME 砍假文字 -->
                                        1
                                        <!--{$item.quantity}-->
                                        <a href="?" onclick="fnFormModeSubmit('form<!--{$key}-->','down','cart_no','<!--{$item.cart_no}-->'); return false;" class="count_btn bg_black"></a>
                                        <a href="?" onclick="fnFormModeSubmit('form<!--{$key}-->','up','cart_no','<!--{$item.cart_no}-->'); return false;" class="count_btn bg_red"></a>
                                    </div>
                                </td>
                                <td class="W10 mb_none f_red t_center">
                                    <!-- //FIXME 砍假文字 -->
                                    <span class="currency">1,110</span>
                                    <span class="currency" style="display:none"><!--{$item.total_inctax|number_format}--></span>
                                </td>
                                <td class="W8 t_center">
                                    <a href="?" class="delete" onclick="fnFormModeSubmit('form<!--{$key}-->', 'delete', 'cart_no', '<!--{$item.cart_no}-->'); return false;">
                                    </a>
                                </td>
                            </tr>


                            <!-- // FIXME: 假tr -->
                            <tr class="mb">
                                <td colspan="2">
                                    <div class="counting_area">
                                        數量 1
                                        <a href="?" onclick="fnFormModeSubmit('form<!--{$key}-->','down','cart_no','<!--{$item.cart_no}-->'); return false;" class="count_btn bg_black"></a>
                                        <a href="?" onclick="fnFormModeSubmit('form<!--{$key}-->','up','cart_no','<!--{$item.cart_no}-->'); return false;" class="count_btn bg_red"></a>
                                    </div>
                                    <div class="currency f_red">1,110</div>
                                </td>   
                            </tr>

                            <!-- // FIXME: 真tr -->
                            <tr class="mb" style="display:none">
                                <td colspan="2">
                                    <div class="counting_area">
                                        數量 <!--{$item.quantity}-->
                                        <a href="?" onclick="fnFormModeSubmit('form<!--{$key}-->','down','cart_no','<!--{$item.cart_no}-->'); return false;" class="count_btn bg_black"></a>
                                        <a href="?" onclick="fnFormModeSubmit('form<!--{$key}-->','up','cart_no','<!--{$item.cart_no}-->'); return false;" class="count_btn bg_red"></a>
                                    </div>
                                    <div class="currency f_red"><!--{$item.total_inctax|number_format}--></div>
                                </td>
                                    
                            </tr>

                            <!--{/foreach}-->
                            
                            
                            
                            <tr class="mb_none">
                                <td colspan="6" class="tb-th borderB0 f15" style="padding-bottom: 5px;">小計 <span class="mount f18">
                                    <!-- //FIXME 砍假文字 -->
                                    $2,550
                                    <!--{$tpl_total_inctax[$key]|number_format}--></span>
                                </td>
                            </tr>
                            <tr class="total">
                                <td colspan="6" class="tb-th borderT0 f18 ">合計 <span class="mount f24 f_red f_bold">
                                    <!-- //FIXME 砍假文字 -->
                                    $2,550
                                    <!--{$arrData[$key].total-$arrData[$key].deliv_fee|number_format}--></span>
                                </td>
                            </tr>
                        </table>
                        <div class="btn_area">
                            <ul class="submit-button">
                                <a href="<!--{$tpl_prev_url|h}-->" class="btn f_black bg_white mr15">繼續購物</a>
                                <button name="submit" class="btn f_white bg_red">送出訂單</button>
                                <!-- <li><input type="image" name="submit" src="{$smarty.const.HTTPS_URL}user_data/new/img/confirm-btn.png" border="0" alt="Submit" /></li> -->
                            </ul>
                        </div>
                        </form>
                    </div>
                    <!-- PC End-->

                    <!-- MB Start 已改正-->
                        <!-- 拔除 -->
                    <!-- MB End 已改正-->

      
        <!--{/foreach}-->
        <!--{else}-->
            <!-- //FIXME 要打開下方文字 -->
            <p style="display:none" class="empty align-center"><span class="attention">※ 目前購物車內無任何商品。</span></p>
        <!--{/if}-->
                </div>
        </div>
    </div>
    


        <!--   肚子結束  -->



</div>
</div>

<?php include '../footer.php'; ?> 

<script>
    $('body').on('click','button',function(e){
        e.preventDefault();
        window.location="/manara_site/shopping/";
    })

</script>