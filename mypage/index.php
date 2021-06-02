

<?php include '../header.php'; ?>

<!-- https://www.manara.asia/tw/ -->
<!--{$smarty.const.ROOT_URLPATH}-->


<div id="container">
    <div id="one_maincolumn" class="main_column">
     
        <!--   肚子開始  -->
        
        <div class="W100 t_center">
            <div class="W1360 bread">
                <span class="f15 f_pink f_left"><a class="f_grey" href="/tw/">首頁 /</a> <font class="f_grey">會員中心 / </font>訂單查詢</span>
            </div>
        </div>

        <div id="mypagecolumn" class="container sec-wrap">
    

            <!-- FIXME: 真的#mynavi_area, 不需動作 -->
            <!--{if $tpl_navi != ""}-->
                <!--{include file=$tpl_navi}-->
            <!--{else}-->
                <!--{include file=`$smarty.const.TEMPLATE_REALDIR`mypage/navi.tpl}-->
            <!--{/if}-->

            
            
            <!-- FIXME: 砍假的#mynavi_area -->
            <div id="mynavi_area">
                <ul class="mynavi_list clearfix">
                    <li class="f15"><a href="./" class="selected">購物清單</a></li>
                    <li class="f15"><a href="change.php" class="">會員資料</a></li>
                    <li class="f15"><a href="delivery.php" class="">送貨地址管理</a></li>
                    <li class="f15"><a href="index.php?mode=logout" class="">登出</a></li>
                </ul>
                <div class="point_announce clearfix">
                    <p class="f18">您好&nbsp;<span class="user_name"><font class="f_red">李 芷儀</font> 先生/女士</span></p>
                </div><!--▲現在のポイント-->
            </div>


            

            <div id="mycontents_area">
                <form name="form1" method="post" action="?">
                    <input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME}-->" value="<!--{$transactionid}-->" />
                    <input type="hidden" name="order_id" value="" />
                    <input type="hidden" name="pageno" value="<!--{$objNavi->nowpage}-->" />

                    <!--{if is_array($arrRegularOrder)}-->
                    <h3 class="f21">定期配送</h3>

                    <table class="mypage_table" summary="定期情報">
                        <tbody>
                            <tr>
                                <th class="W15 t_center">訂單編號</th>
                                <th class="W40">商品</th>
                                <th class="W20 t_center">配送狀態</th>
                                <th class="W15 t_center">定期回数</th>
                            </tr>
                            <tr>
                                <td><a class="f_red" href="/tw/mypage/history.php?order_id=217">217</a></td>
                                <td>定期-溫熱卸妝凝膠 按摩PLUS(200g)</td>
                                <td class="W30 t_center">2019-08-03<br>
                                    預定配送
                                </td>
                                <td class="t_center">1回</td>
                            </tr>
                            <tr>
                                <td><a class="f_red" href="/tw/mypage/history.php?order_id=200001472">200001472</a></td>
                                <td>NSx1 EC 定期<br>OE x 1(teiki)(stg)</td>
                                <td class="W30 t_center">2019-07-23<br>
                                    預定配送
                                </td>
                                <td class="t_center">4回</td>
                            </tr>
                            <tr>
                                <td><a class="f_red" href="/tw/mypage/history.php?order_id=200001421">200001421</a></td>
                                <td>NSx1 EC 定期<br>OE x 1(teiki)(stg)</td>
                                <td class="W30 t_center">2019-05-24<br>
                                    預定配送
                                </td>
                                <td class="t_center">3回</td>
                            </tr>
                            <tr>
                                <td><a class="f_red" href="/tw/mypage/history.php?order_id=200001318">200001318</a></td>
                                <td>NSx1 EC 定期<br>OE x 1(teiki)(stg)</td>
                                <td class="W30 t_center">2019-03-25<br>
                                    預定配送
                                </td>
                                <td class="t_center">2回</td>
                            </tr>
                            <tr>
                                <td><a class="f_red" href="/tw/mypage/history.php?order_id=177">177</a></td>
                                <td>maNara毛孔無瑕礦泥洗顏粉x1<br>NSx1 EC 定期<br>OE x 1(teiki)(stg)<br>CG x 1 [都度]</td>
                                <td class="W30 t_center">2019-01-24<br>
                                    預定配送
                                </td>
                                <td class="t_center">1回</td>
                            </tr>
                        </tbody>
                    </table>

                    <!-- FIXME: 真table -->
                    <table class="mypage_table" summary="定期配送" style="display: none">
                        <tr>
                            <th class="W10 t_center">訂單編號</th>
                            <th class="W60">商品</th>
                            <th class="W20 t_center">配送狀態</th>
                            <th class="W10 t_center">定期回数</th>
                        </tr>
                        <!--{section name=cnt loop=$arrRegularOrder}-->
                        <tr>
                            <td>
                                <a href="<!--{$smarty.const.ROOT_URLPATH}-->mypage/history.php?order_id=<!--{$arrRegularOrder[cnt].order_id}-->" ><!--{$arrRegularOrder[cnt].order_id}--></a></td>
                            <td><!--{$arrRegularOrder[cnt].product_names|smarty:nodefaults}--></td>
                            <td>
                                <!--{$arrRegularOrder[cnt].shipping_date|h}--><br>
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
                            <td class="t_center"><!--{$arrRegularOrder[cnt].current_delivery_number_of_time|number_format|smarty:nodefaults}-->回</td>
                        </tr>
                        <!--{/section}-->
                    </table>
                    <!--{/if}-->

                    <h3 class="f21"><!--{$tpl_subtitle|h}--></h3>
                    <!--{if $objNavi->all_row > 0}-->
                    <p>一共有 <span class="attention"><!--{$objNavi->all_row}--> 筆</span> 購買明細</p>
                    <div class="pagenumber_area">
                        <!--▼ページナビ-->
                        <!--{$objNavi->strnavi}-->
                        <!--▲ページナビ-->
                    </div>

                    <!-- FIXME: 假table -->
                    <table class="mypage_table" summary="購買明細" style="table-layout:fixed;word-wrap:break-word;word-break;break-all;">
                        <tbody>
                            <tr>
                                <th class="W30 t_center">購買時間</th>
                                <th>訂單編號</th>
                                <th>合計金額</th>
                            </tr>
                            <tr>
                                <td class="W30 t_center">2019/08/12 09:46</td>
                                <td><a class="f_red" href="/tw/mypage/history.php?order_id=219">219</a></td>
                                <td class="alignR">1,200元</td>
                            </tr>
                            <tr>
                                <td class="W30 t_center">2019/06/26 21:10</td>
                                <td><a class="f_red" href="/tw/mypage/history.php?order_id=209">209</a></td>
                                <td class="alignR">1,200元</td>
                            </tr>
                            <tr>
                                <td class="W30 t_center">2019/06/03 13:11</td>
                                <td><a class="f_red" href="/tw/mypage/history.php?order_id=193">193</a></td>
                                <td class="alignR">1,390元</td>
                            </tr>
                            <tr>
                                <td class="W30 t_center">2019/05/16 14:00</td>
                                <td><a class="f_red" href="/tw/mypage/history.php?order_id=191">191</a></td>
                                <td class="alignR">1,390元</td>
                            </tr>
                        </tbody>
                    </table>


                    <table class="mypage_table" summary="購買明細">
                        <tbody>
                            <tr>
                                <th class="W30 t_center">購買時間</th>
                                <th>訂單狀態</th>
                                <th>定期</th>
                                <th class="W15 t_center">詳細</th>
                            </tr>
                            <tr>
                                <td class="W30 t_center">2019/08/12 09:46</td>
                                <td>訂單</td>
                                <td>都度</td>
                                <td class="W15 t_center"><a href="/tw/mypage/history.php?order_id=219" style="color:blue;">詳細</a></td>
                            </tr>
                            <tr>
                                <td class="W30 t_center">2019/06/26 21:10</td>
                                <td>訂單</td>
                                <td>都度</td>
                                <td class="W15 t_center"><a href="/tw/mypage/history.php?order_id=209" style="color:blue;">詳細</a></td>
                            </tr>
                            <tr>
                                <td class="W30 t_center">2019/06/03 13:11</td>
                                <td>訂單</td>
                                <td>都度</td>
                                <td class="W15 t_center"><a href="/tw/mypage/history.php?order_id=193" style="color:blue;">詳細</a></td>
                            </tr>
                            <tr>
                                <td class="W30 t_center">2019/05/16 14:00</td>
                                <td>訂單</td>
                                <td>都度</td>
                                <td class="W15 t_center"><a href="/tw/mypage/history.php?order_id=191" style="color:blue;">詳細</a></td>
                            </tr>
                        </tbody>
                    </table>

                   

                     <!-- FIXME: 真table -->
                    <table class="mypage_table" summary="購買明細" style="display: none">
                        <tr>
                            <th class="W30 t_center">購買時間</th>
                            <th>訂單編號</th>
                            <th>合計金額</th>
                        </tr>
                        <!--{section name=cnt loop=$arrOrder}-->
                            <tr>
                                <td class="W30 t_center"><!--{$arrOrder[cnt].create_date|sfDispDBDate}--></td>
                                <td><a class="f_red" href="<!--{$smarty.const.ROOT_URLPATH}-->mypage/history.php?order_id=<!--{$arrOrder[cnt].order_id}-->"><!--{$arrOrder[cnt].order_id}--></a></td>
                                <td><!--{$arrOrder[cnt].payment_total|number_format}-->元</td>
                            </tr>
                        <!--{/section}-->
                    </table>


                    <!-- FIXME: 真table -->
                    <table class="mypage_table" summary="購買明細" style="display: none">
                        <tr>
                            <th class="W30 t_center">購買時間</th>
                            <!--{if $smarty.const.MYPAGE_ORDER_STATUS_DISP_FLAG }-->
                            <th>訂單狀態</th>
                            <!--{/if}-->
                            <th>定期</th>
                            <th class="W15 t_center">詳細</th>
                        </tr>
                        <!--{section name=cnt loop=$arrOrder}-->
                            <tr>
                                <td class="W30 t_center">
                                    <!--{$arrOrder[cnt].create_date|sfDispDBDate}-->
                                </td>
                                <!--{if $smarty.const.MYPAGE_ORDER_STATUS_DISP_FLAG }-->
                                <!--{assign var=order_status_id value="`$arrOrder[cnt].status`"}-->
                                <!--{if $order_status_id != $smarty.const.ORDER_PENDING }-->
                                <td><!--{$arrCustomerOrderStatus[$order_status_id]|h}--></td>
                                <!--{else}-->
                                <td class="attention">
                                <!--{$arrCustomerOrderStatus[$order_status_id]|h}--></td>
                                <!--{/if}-->
                                <!--{/if}-->
                                <!--{if $arrOrder[cnt].current_delivery_number_of_time > 0}-->
                                <td>定期（<!--{$arrOrder[cnt].current_delivery_number_of_time|number_format}-->回）</td>
                                <!--{else}-->
                                <td>都度</td>
                                <!--{/if}-->
                                <td class="W10"><a class="f_red" href="<!--{$smarty.const.ROOT_URLPATH}-->mypage/history.php?order_id=<!--{$arrOrder[cnt].order_id}-->">詳細</a></td>
                            </tr>
                        <!--{/section}-->
                    </table>

                    <!--{else}-->
                        <p>無任何購買明細。</p>
                    <!--{/if}-->
                </form>
            </div>
        </div>


        <link rel="stylesheet" href="../user_data/new_201811/css/new_init.css" />
        <link rel="stylesheet" href="../user_data/new_201811/css/new_mypage.css" />

        <!--   肚子結束  -->
    </div>
</div>   



<?php include '../footer.php'; ?> 

