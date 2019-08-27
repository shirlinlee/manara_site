<!--{*
/*
 * This file is part of EC-CUBE
 *
 * Copyright(c) 2000-2012 LOCKON CO.,LTD. All Rights Reserved.
 *
 * http://www.lockon.co.jp/
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 2
 * of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
 */
*}-->
<div id="mypagecolumn" class="container sec-wrap">
    <h2 class="title">會員中心</h2>
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

<!--{* add 定期情報 by takano, 2019/06/17 *}-->
<!--{*定期情報ここから*}-->
<!-- 定期情報を表示する -->
<!--{if is_array($arrRegularOrder)}-->
        <h3>定期情報</h3>
            <table summary="定期情報">
                <tr>
                    <th class="alignC">這一次購買</th>
                    <th class="alignC">商品名</th>
                    <th class="alignC">配送状態</th>
                    <th class="alignC">定期回数</th>
                </tr>
                <!--{section name=cnt loop=$arrRegularOrder}-->
                    <tr>
                        <td class="alignR"><a href="<!--{$smarty.const.ROOT_URLPATH}-->mypage/history.php?order_id=<!--{$arrRegularOrder[cnt].order_id}-->"  style="color:blue;"><!--{$arrRegularOrder[cnt].order_id}--></a></td>
                        <td><!--{$arrRegularOrder[cnt].product_names|smarty:nodefaults}--></td>
                        <td class="alignC"><!--{$arrRegularOrder[cnt].shipping_date|h}--><br>
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
                        <td class="alignR"><!--{$arrRegularOrder[cnt].current_delivery_number_of_time|number_format|smarty:nodefaults}-->回</td>
                    </tr>
                <!--{/section}-->
            </table>
<!--{/if}-->
<!--{*定期情報ここまで*}-->


        <h3><!--{$tpl_subtitle|h}--></h3>

        <!--{if $objNavi->all_row > 0}-->

            <p>一共有 <span class="attention"><!--{$objNavi->all_row}--> 筆</span> 購買明細</p>
            <div class="pagenumber_area">
                <!--▼ページナビ-->
                <!--{$objNavi->strnavi}-->
                <!--▲ページナビ-->
            </div>

            <table summary="購買明細" style="table-layout:fixed;word-wrap:break-word;word-break;break-all;">
                <tr>
                    <th class="alignC">購買時間</th>
                    <th class="alignC">訂單編號</th>
                    <th class="alignC">合計金額</th>
                </tr>
                <!--{section name=cnt loop=$arrOrder}-->
                    <tr>
                        <td class="alignC"><!--{$arrOrder[cnt].create_date|sfDispDBDate}--></td>
                        <td><a href="<!--{$smarty.const.ROOT_URLPATH}-->mypage/history.php?order_id=<!--{$arrOrder[cnt].order_id}-->"><!--{$arrOrder[cnt].order_id}--></a></td>
                        <td class="alignR"><!--{$arrOrder[cnt].payment_total|number_format}-->元</td>
                    </tr>
                <!--{/section}-->
            </table>
            <!--{* add 購買明細2 by takano, 2019/06/17 *}-->
            <table summary="購買明細">
                <tr>
                    <th class="alignC">購買時間</th>
                    <!--{if $smarty.const.MYPAGE_ORDER_STATUS_DISP_FLAG }-->
                    <th class="alignC">訂單狀態</th>
                    <!--{/if}-->
                    <th class="alignC">都度／定期（定期回数）</th>
                    <th class="alignC">詳細</th>
                </tr>
                <!--{section name=cnt loop=$arrOrder}-->
                    <tr>
                        <td class="alignC"><!--{$arrOrder[cnt].create_date|sfDispDBDate}--></td>
                        <!--{if $smarty.const.MYPAGE_ORDER_STATUS_DISP_FLAG }-->
                            <!--{assign var=order_status_id value="`$arrOrder[cnt].status`"}-->
                            <!--{if $order_status_id != $smarty.const.ORDER_PENDING }-->
                            <td class="alignC"><!--{$arrCustomerOrderStatus[$order_status_id]|h}--></td>
                            <!--{else}-->
                            <td class="alignC attention"><!--{$arrCustomerOrderStatus[$order_status_id]|h}--></td>
                            <!--{/if}-->
                        <!--{/if}-->
                        <!--{if $arrOrder[cnt].current_delivery_number_of_time > 0}-->
                            <td class="alignC">定期（<!--{$arrOrder[cnt].current_delivery_number_of_time|number_format}-->回）</td>
                        <!--{else}-->
                            <td class="alignC">都度</td>
                        <!--{/if}-->
                        <td class="alignC"><a href="<!--{$smarty.const.ROOT_URLPATH}-->mypage/history.php?order_id=<!--{$arrOrder[cnt].order_id}-->" style="color:blue;">詳細</a></td>
                    </tr>
                <!--{/section}-->
            </table>

        <!--{else}-->
            <p>無任何購買明細。</p>
        <!--{/if}-->
        </form>
    </div>
</div>
