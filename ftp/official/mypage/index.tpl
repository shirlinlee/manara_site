<div class="W100 t_center">
    <div class="W1360 bread">
        <span class="f15 f_pink f_left"><a class="f_grey" href="/tw/">首頁 /</a> <font class="f_grey">會員中心 / </font>訂單查詢</span>
    </div>
</div>
<div id="mypagecolumn" class="container sec-wrap">
    <!--{if $tpl_navi != ""}-->
        <!--{include file=$tpl_navi}-->
    <!--{else}-->
        <!--{include file=`$smarty.const.TEMPLATE_REALDIR`mypage/navi.tpl}-->
    <!--{/if}-->
    <div id="mycontents_area">
        <form name="form1" method="post" action="?">
            <input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME}-->" value="<!--{$transactionid}-->" />
            <input type="hidden" name="order_id" value="" />
            <input type="hidden" name="pageno" value="<!--{$objNavi->nowpage}-->" />

            <!--{* add 定期配送 by takano, 2019/06/17 *}-->
            <!--{*定期配送ここから*}-->
            <!-- 定期配送を表示する -->
            <!--{if is_array($arrRegularOrder)}-->
            <h3 class="f21">定期配送</h3>
            <table class="mypage_table" summary="定期配送">
                <tr>
                    <th>訂單編號</th>
                    <th>商品</th>
                    <th>配送狀態</th>
                    <th>定期回数</th>
                </tr>
                <!--{section name=cnt loop=$arrRegularOrder}-->
                <tr>
                    <td>
                        <a href="<!--{$smarty.const.ROOT_URLPATH}-->mypage/history.php?order_id=<!--{$arrRegularOrder[cnt].order_id}-->"  style="color:#d70146;"><!--{$arrRegularOrder[cnt].order_id}--></a></td>
                    <td>
                        <!--{$arrRegularOrder[cnt].product_names|smarty:nodefaults}-->
                    </td>
                    <td><!--{$arrRegularOrder[cnt].shipping_date|h}--><br>
                        <!-- 2018.02.13 ytagawa mod start 受注ステータスが「配送中、配送完了」のものも表示されるよう修正 -->
                        <!--{if $arrRegularOrder[cnt].status == 300}-->
                        預定配送
                        <!--{elseif $arrRegularOrder[cnt].status == 400}-->
                        配送中
                        <!--{elseif $arrRegularOrder[cnt].status == 900}-->
                        配送完了
                        <!--{/if}-->
                        <!-- 2018.02.13 ytagawa mod end -->
                    </td>
                        <td><!--{$arrRegularOrder[cnt].current_delivery_number_of_time|number_format|smarty:nodefaults}-->回</td>
                    </tr>
                <!--{/section}-->
            </table>
            <!--{/if}-->
            <!--{*定期配送ここまで*}-->


            <h3 class="f21">一般訂購</h3>

            <!--{if $objNavi->all_row > 0}-->
                <table class="mypage_table" summary="購買明細">
                    <tr>
                        <th>訂購日期</th>
                        <th>訂單編號</th>
                        <th>合計金額</th>
                        <th>訂購方式</th>
                        <th>訂單狀態</th>
                    </tr>
                    <!--{section name=cnt loop=$arrOrder}-->
                        <tr>
                            <td><!--{$arrOrder[cnt].shipping_date|h}--></td>
                            <td><a href="<!--{$smarty.const.ROOT_URLPATH}-->mypage/history.php?order_id=<!--{$arrOrder[cnt].order_id}-->"><!--{$arrOrder[cnt].order_id}--></a></td>
                            <td><!--{$arrOrder[cnt].payment_total|number_format}-->元</td>
                            <!--- 訂購方式 -->

                            <!--{if $arrOrder[cnt].current_delivery_number_of_time > 0}-->
                                <td>定期（<!--{$arrOrder[cnt].current_delivery_number_of_time|number_format}-->回）</td>
                            <!--{else}-->
                                <td>單回</td>
                            <!--{/if}-->


                            <!--- 訂單狀態 -->
                            <!--{if $smarty.const.MYPAGE_ORDER_STATUS_DISP_FLAG }-->
                                <!--{assign var=order_status_id value="`$arrOrder[cnt].status`"}-->
                                <!--{if $order_status_id != $smarty.const.ORDER_PENDING }-->
                                    <td><!--{$arrCustomerOrderStatus[$order_status_id]|h}--></td>
                                <!--{else}-->
                                    <td class="attention"><!--{$arrCustomerOrderStatus[$order_status_id]|h}--></td>
                                <!--{/if}-->
                            <!--{/if}-->

                        </tr>
                    <!--{/section}-->
                </table>
                <p>一共有 <span class="attention"><!--{$objNavi->all_row}--> 筆</span> 購買明細</p>
                <div class="pagenumber_area">
                    <!--▼ページナビ-->
                    <!--{$objNavi->strnavi}-->
                    <!--▲ページナビ-->
                </div>

            <!--{else}-->
                <p>無任何購買明細。</p>
            
            <!--{/if}-->

            
            

        
        </form>
    </div>
</div>

<link rel="stylesheet" href="../user_data/new_201811/css/new_init.css" />
<link rel="stylesheet" href="../user_data/new_201811/css/new_mypage.css" />