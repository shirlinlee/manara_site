<div class="W100 t_center">
    <div class="W1360 bread">
        <span class="f15 f_pink f_left"><a class="f_grey" href="/tw/">首頁 /</a> <font class="f_grey">會員中心 / </font>訂單查詢</span>
    </div>
</div>

<div id="mypagecolumn" class="container sec-wrap">
    <!--{include file=$tpl_navi}-->

    <div id="mycontents_area">
        <h3 class="f21"><!--{$tpl_subtitle|h}--></h3>
        <div class="bg_l_pink clearfix pd20">
            <p>
                <span class="st">購買時間:&nbsp;</span><!--{$tpl_arrOrderData.create_date|sfDispDBDate}--><br />
                <span class="st">訂單編號:&nbsp;</span><!--{$tpl_arrOrderData.order_id}--><br />
                <span class="st">訂單狀態:&nbsp;</span><!--{if $tpl_arrOrderData.status == 300}-->出貨準備中<!--{elseif $tpl_arrOrderData.status == 400}-->配送中<!--{elseif $tpl_arrOrderData.status == 900}-->已送達<!--{elseif $tpl_arrOrderData.status == 910}-->已取消<!--{/if}--><!--{if $tpl_arrOrderData.return_status == 200}-->退貨申請中<!--{elseif $tpl_arrOrderData.return_status == 300}-->委託收取退貨中<!--{elseif $tpl_arrOrderData.return_status == 400}-->已派車往前收取退貨<!--{elseif $tpl_arrOrderData.return_status == 500}-->等待退款流程<!--{elseif $tpl_arrOrderData.return_status == 900}-->已完成退款<!--{/if}-->
                <br />
                <span class="st">購入方法:&nbsp;</span><!--{if $tpl_arrOrderData.regular_purchase_flg == 0}-->單回<!--{else}-->定期（<!--{$tpl_arrOrderData.current_delivery_number_of_time}-->回）<!--{/if}--><br />
                <span class="st">支付方法:&nbsp;</span><!--{$tpl_arrOrderData.payment_method|h}-->
            </p>
            
        </div>

        <table summary="購入商品詳細/" class="mypage_table">
            <col width="25%" />
            <col width="15%" />
            <col width="10%" />
            <col width="15%" />
            <tr>
                <th class="alignC">商品名</th>
                <th class="alignC">單價</th>
                <th class="alignC">數量</th>
                <th class="alignC">小計</th>
            </tr>
            <!--{foreach from=$tpl_arrOrderDetail item=orderDetail}-->
                <tr>
                    <td>
                        
                        <a<!--{if $orderDetail.enable}--> href="
                            <!--{if $orderDetail.product_id == "200000009"}-->
                            <!--{$smarty.const.HTTPS_URL}-->user_data/product1.php
                            <!--{/if}-->
                            <!--{if $orderDetail.product_id == "200000262"}-->
                            <!--{$smarty.const.HTTPS_URL}-->user_data/product1.php
                            <!--{/if}-->
                            <!--{if $orderDetail.product_id == "200000276"}-->
                            <!--{$smarty.const.HTTPS_URL}-->user_data/product2.php
                            <!--{/if}-->
                            <!--{if $orderDetail.product_id == "200000278"}-->
                            <!--{$smarty.const.HTTPS_URL}-->user_data/product2.php
                            <!--{/if}-->
                            <!--{if $orderDetail.product_id == "200000280"}-->
                            <!--{$smarty.const.HTTPS_URL}-->user_data/product3.php
                            <!--{/if}-->
                            <!--{if $orderDetail.product_id == "200000282"}-->
                            <!--{$smarty.const.HTTPS_URL}-->user_data/product3.php
                            <!--{/if}-->
                        "<!--{/if}-->><!--{$orderDetail.product_name|h}--></a><br />
                        <!--{if $orderDetail.classcategory_name1 != ""}-->
                            <!--{$orderDetail.classcategory_name1|h}--><br />
                        <!--{/if}-->
                        <!--{if $orderDetail.classcategory_name2 != ""}-->
                            <!--{$orderDetail.classcategory_name2|h}-->
                        <!--{/if}-->
                    </td>
                    <!--{assign var=price value=`$orderDetail.price`}-->
                    <!--{assign var=quantity value=`$orderDetail.quantity`}-->
                    <td>NT$<!--{$price|sfCalcIncTax|number_format|h}--></td>
                    <td><!--{$quantity|h}--></td>
                    <td class="f_red">NT$<!--{$price|sfCalcIncTax|sfMultiply:$quantity|number_format}--></td>
                </tr>
            <!--{/foreach}-->
            <tr>
                <td colspan="3" class="t_right">小計</th>
                <td class="t_right">NT$<!--{$tpl_arrOrderData.subtotal|number_format}--></td>
            </tr>
            <!--{assign var=point_discount value="`$tpl_arrOrderData.use_point*$smarty.const.POINT_VALUE`"}-->
            <!--{if $point_discount > 0}-->
            <tr>
                <td colspan="3" class="t_right">紅利點數折扣</th>
                <td class="t_right">NT$&minus;<!--{$point_discount|number_format}--></td>
            </tr>
            <!--{/if}-->
            <!--{assign var=key value="discount"}-->
            <!--{if $tpl_arrOrderData[$key] != "" && $tpl_arrOrderData[$key] > 0}-->
            <tr>
                <td colspan="3" class="t_right">折扣</th>
                <td class="t_right">NT$&minus;<!--{$tpl_arrOrderData[$key]|number_format}--></td>
            </tr>
            <!--{/if}-->
            <tr>
                <td colspan="3" class="t_right">運費</th>
                <td class="t_right"><!--{assign var=key value="deliv_fee"}-->NT$<!--{$tpl_arrOrderData[$key]|number_format|h}--></td>
            </tr>
            <tr>
                <td colspan="3" class="t_right">手續費</th>
                <!--{assign var=key value="charge"}-->
                <td class="t_right">NT$<!--{$tpl_arrOrderData[$key]|number_format|h}--></td>
            </tr>
            <tr class="hasBorderBottom">
                <td colspan="3" class="t_right">合計</th>
                <td class="t_right"><span class="price f_red f24 f_b">NT$<!--{$tpl_arrOrderData.payment_total|number_format}--></span></td>
            </tr>
        </table>

        <!-- 使用ポイントここから -->
        <!--{if $smarty.const.USE_POINT !== false}-->
            <table summary="使用ポイント/" class="mypage_table">
                <col width="30%" />
                <col width="70%" />
                <tr>
                    <th class="alignL">使用紅利點數</th>
                    <td><!--{assign var=key value="use_point"}--><!--{$tpl_arrOrderData[$key]|number_format|default:0}--> pts</td>
                </tr>
                <tr>
                    <th class="alignL">本次將新增之紅利點數</th>
                    <td><!--{$tpl_arrOrderData.add_point|number_format|default:0}--> pts</td>
                </tr>
            </table>
        <!--{/if}-->
        <!-- 使用ポイントここまで -->

        <!--{foreach item=shippingItem name=shippingItem from=$arrShipping}-->
            <h3 class="f21">送貨地址<!--{if $isMultiple}--><!--{$smarty.foreach.shippingItem.iteration}--><!--{/if}--></h3>
        
            <!--{if $isMultiple}-->
            <table summary="お届け内容確認/" class="mypage_table">
                <col width="30%" />
                <col width="40%" />
                <col width="20%" />
                <col width="10%" />
                <tr>
                    <th class="alignC">商品編號</th>
                    <th class="alignC">商品名稱</th>
                    <th class="alignC">單價</th>
                    <th class="alignC">數量</th>
                    <!--{* XXX 購入小計と誤差が出るためコメントアウト
                    <th>Subtotal</th>
                    *}-->
                </tr>
                <!--{foreach item=item from=$shippingItem.shipment_item}-->
                    <tr>
                        <td><!--{$item.productsClass.product_code|h}--></td>
                        <td><!--{* 商品名 *}--><!--{$item.productsClass.name|h}--><br />
                            <!--{if $item.productsClass.classcategory_name1 != ""}-->
                                <!--{$item.productsClass.class_name1}-->:<!--{$item.productsClass.classcategory_name1}--><br />
                            <!--{/if}-->
                            <!--{if $item.productsClass.classcategory_name2 != ""}-->
                                <!--{$item.productsClass.class_name2}-->:<!--{$item.productsClass.classcategory_name2}-->
                            <!--{/if}-->
                        </td>
                        <td>
                            NT$<!--{$item.price|sfCalcIncTax|number_format}-->
                        </td>
                        <td class="alignC"><!--{$item.quantity}--></td>
                        <!--{* XXX 購入小計と誤差が出るためコメントアウト
                        <td>NT$<!--{$item.total_inctax|number_format}--></td>
                        *}-->
                    </tr>
                <!--{/foreach}-->
            </table>
            <!--{/if}-->
            <table summary="送貨地址" class="delivname mypage_table">
                <col width="30%" />
                <col width="70%" />
                <tbody>
                    <tr>
                    <!--{if $tpl_arrOrderData.receiving_method == 1}-->
                            超商取貨
                    <!--{else}-->
                            宅配
                    <!--{/if}-->
                        </td>
                    </tr>
                    <!--{if $tpl_arrOrderData.receiving_method == 1}-->
                    <tr>
                        <th class="alignL">超商ID</th>
                        <td><!--{$shippingItem.conv_store_spot|h}--></td>
                    </tr>
                    <tr>
                        <th class="alignL">超商名</th>
                        <td><!--{$shippingItem.conv_store_name|h}--></td>
                    </tr>
                    <tr>
                        <th class="alignL">超商地址</th>
                        <td><!--{$shippingItem.conv_store_addr|h}--></td>
                    </tr>
                    <tr>
                        <th class="alignL">超商電話</th>
                        <td><!--{$shippingItem.conv_store_tel|h}--></td>
                    </tr>
                    <!--{else}-->
                    <tr>
                        <th class="alignL">姓名</th>
                        <td><!--{$shippingItem.shipping_name01|h}-->&nbsp;<!--{$shippingItem.shipping_name02|h}--></td>
                    </tr>
                    <tr>
                        <th class="alignL">郵遞區號</th>
                        <!--{* <td><!--{$shippingItem.shipping_zip01}-->-<!--{$shippingItem.shipping_zip02}--></td> *}-->
                        <td><!--{$shippingItem.shipping_zipcode}--></td>
                    </tr>
                    <tr>
                        <th class="alignL">地址</th>
                        <td><!--{$arrPref[$shippingItem.shipping_pref]}--><!--{$shippingItem.shipping_addr01|h}--><!--{$shippingItem.shipping_addr02|h}--></td>
                    </tr>
                    <tr>
                        <th class="alignL">手機</th>
                        <td>
                          <!--{$shippingItem.shipping_tel01}-->
                          <!--{if strlen($shippingItem.shipping_tel02)}-->/&nbsp;<!--{$shippingItem.shipping_tel02}--><!--{/if}-->
                          <!--{if strlen($shippingItem.shipping_tel03)}-->/&nbsp;<!--{$shippingItem.shipping_tel03}--><!--{/if}-->
                        </td>
                    </tr>
                    <tr>
                        <th class="alignL">室話</th>
                        <td>
                          <!--{$shippingItem.shipping_fax01}-->
                          <!--{if strlen($shippingItem.shipping_fax02)}-->/&nbsp;<!--{$shippingItem.shipping_fax02}--><!--{/if}-->
                          <!--{if strlen($shippingItem.shipping_fax03)}-->/&nbsp;<!--{$shippingItem.shipping_fax03}--><!--{/if}-->
                        </td>
                    </tr>
                    <!--{/if}-->
                    <tr>
                        <th class="alignL">到貨予定日/時間</th>
                        <td>
                            <span><!--{$shippingItem.shipping_date|default:'未選定'|h}-->
                    <!--{if $tpl_arrOrderData.receiving_method == 0}-->
                                &nbsp;&nbsp;<!--{$shippingItem.shipping_time|default:'未選定'|h}-->
                    <!--{/if}-->
                            </span>
                        </td>
                    </tr>

                    <!--{if $tpl_arrOrderData.regular_purchase_flg == 1}-->
                    <tr>
                        <th class="alignL">定期配送周期</th>
                        <td><!--{$tpl_arrOrderData.delivery_cycle}-->天</td>
                    </tr>
                    <!--{/if}-->
                </tbody>
                
            </table>

           
        <!--{/foreach}-->

<!--{* comment out
        <h3 class="f21">郵件傳送歷史列表</h3>
        <table>
            <tr>
                <th class="alignC">處理日</th>
                <th class="alignC">通知郵件</th>
                <th class="alignC">主題</th>
            </tr>
            <!--{section name=cnt loop=$tpl_arrMailHistory}-->
            <tr class="center">
                <td class="alignC"><!--{$tpl_arrMailHistory[cnt].send_date|sfDispDBDate|h}--></td>
                <!--{assign var=key value="`$tpl_arrMailHistory[cnt].template_id`"}-->
                <td class="alignC"><!--{$arrMAILTEMPLATE[$key]|h}--></td>
                <td><a href="#" onclick="win02('./mail_view.php?send_id=<!--{$tpl_arrMailHistory[cnt].send_id}-->','mail_view','650','800'); return false;"><!--{$tpl_arrMailHistory[cnt].subject|h}--></a></td>
            </tr>
            <!--{/section}-->
        </table>
*}-->

        <br /><br />

        <div class="btn_area">
            <ul>
                <li>
                    <a href="./<!--{$smarty.const.DIR_INDEX_PATH}-->" class="btn bg_white f_black" id="change" >
                        返回
                    </a>
                </li>
            </ul>
        </div>

    </div>
</div>


<link rel="stylesheet" href="../user_data/new_201811/css/new_init.css" />
<link rel="stylesheet" href="../user_data/new_201811/css/new_mypage.css" />


