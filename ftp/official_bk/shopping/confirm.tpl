<!--{*
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
 *}-->

<script type="text/javascript" src="<!--{$smarty.const.ROOT_URLPATH}-->js/jquery.facebox/facebox.js"></script>
<link rel="stylesheet" type="text/css" href="<!--{$smarty.const.ROOT_URLPATH}-->js/jquery.facebox/facebox.css" media="screen" />
<script type="text/javascript">//<![CDATA[
    var send = true;

    function fnCheckSubmit() {
        if(send) {

            // 2018.04.20 ytagawa - Protect the screen during processing.
            $('.shopping-confirm-purchase__protection').show();

            send = false;
            return true;
        } else {
            alert("正在處理中，請稍等。");
            return false;
        }
    }

    $(document).ready(function() {
        $('a.expansion').facebox({
            loadingImage : '<!--{$smarty.const.ROOT_URLPATH}-->js/jquery.facebox/loading.gif',
            closeImage   : '<!--{$smarty.const.ROOT_URLPATH}-->js/jquery.facebox/closelabel.png'
        });
    });
//]]></script>

<!--CONTENTS-->
<div id="undercolumn" class="container sec-wrap">
<div id="main_text">
            <div class="columns-12">
                <div id="shoppingCart" class="col-md-8 col-sm-10 col-xs-12 col-offset-2">
   <div id="undercolumn_shopping">
        <p class="flow_area"><img src="<!--{$TPL_URLPATH}-->img/picture/img_flow_03.jpg" /></p>

        <h2 class="title"><!--{$tpl_title|h}--></h2>
        <!--{* エラーメッセージがある場合は表示される *}-->
        <span class="attention"><!--{$tpl_errormessage|h}--></span>
        <p class="information">請確認以下內容無誤。<br />
            若正確請按「<!--{if $use_module}-->下一步<!--{else}-->購物完成<!--{/if}-->」按鈕。</p>

        <form name="form1" id="form1" method="post" action="?">
        <input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME}-->" value="<!--{$transactionid}-->" />
        <input type="hidden" name="mode" value="confirm" />
        <input type="hidden" name="uniqid" value="<!--{$tpl_uniqid}-->" />
        
        <div class="btn_area">
            <ul>
                <li>
                    <a href="./payment.php" onmouseover="chgImg('<!--{$TPL_URLPATH}-->img/button/btn_back_on.jpg', 'back04-top')" onmouseout="chgImg('<!--{$TPL_URLPATH}-->img/button/btn_back.jpg', 'back04-top')"><img src="<!--{$TPL_URLPATH}-->img/button/btn_back.jpg" border="0" name="back04-top" id="back04-top" /></a>
                </li>
                <!--{if $use_module}-->
                <li>
                    <input type="image" onclick="return fnCheckSubmit();" onmouseover="chgImgImageSubmit('<!--{$TPL_URLPATH}-->img/button/btn_next_on.jpg',this)" onmouseout="chgImgImageSubmit('<!--{$TPL_URLPATH}-->img/button/btn_next.jpg',this)" src="<!--{$TPL_URLPATH}-->img/button/btn_next.jpg" name="next-top" id="next-top" />
                </li>
                <!--{else}-->
                <li>
                    <input type="image" onclick="return fnCheckSubmit();" onmouseover="chgImgImageSubmit('<!--{$TPL_URLPATH}-->img/button/btn_order_complete_on.jpg',this)" onmouseout="chgImgImageSubmit('<!--{$TPL_URLPATH}-->img/button/btn_order_complete.jpg',this)" src="<!--{$TPL_URLPATH}-->img/button/btn_order_complete.jpg" name="next-top" id="next-top" />
                </li>
                <!--{/if}-->
            </ul>
        </div>
        <br>
        <table summary="ご注文内容確認/">
            <col width="40%" />
            <col width="20%" />
            <col width="10%" />
            <col width="20%" />
            <tr>
                <th scope="col">商品名</th>
                <th scope="col">単価</th>
                <th scope="col">數量</th>
                <th scope="col">小計</th>
            </tr>
            <!--{foreach from=$arrCartItems item=item}-->
                <tr>
                    <td>
                        <ul>
                            <li><strong><!--{$item.productsClass.name|h}--></strong></li>
                            <!--{if $item.productsClass.classcategory_name1 != ""}-->
                            <li><!--{$item.productsClass.class_name1}-->:<!--{$item.productsClass.classcategory_name1}--></li>
                            <!--{/if}-->
                            <!--{if $item.productsClass.classcategory_name2 != ""}-->
                            <li><!--{$item.productsClass.class_name2}-->:<!--{$item.productsClass.classcategory_name2}--></li>
                            <!--{/if}-->
                        </ul>
                    </td>
                    <td class="alignR">
                        NT$<!--{$item.price|sfCalcIncTax|number_format}-->
                    </td>
                    <td class="alignR"><!--{$item.quantity|number_format}--></td>
                    <td class="alignR">NT$<!--{$item.total_inctax|number_format}--></td>
                </tr>
            <!--{/foreach}-->
            <tr>
                <th colspan="3" class="alignR" scope="row">小計</th>
                <td class="alignR">NT$<!--{$tpl_total_inctax[$cartKey]|number_format}--></td>
            </tr>
            <!--{if $smarty.const.USE_POINT !== false}-->
                <tr>
                    <th colspan="3" class="alignR" scope="row">折扣(使用積分時)</th>
                    <td class="alignR">NT$
                        <!--{assign var=discount value=`$arrForm.use_point*$smarty.const.POINT_VALUE`}-->
                         -<!--{$discount|number_format|default:0}--></td>
                </tr>
            <!--{/if}-->
            <tr>
                <th colspan="3" class="alignR" scope="row">郵費</th>
                <td class="alignR">NT$<!--{$arrForm.deliv_fee|number_format}--></td>
            </tr>
            <tr>
                <th colspan="3" class="alignR" scope="row">手續費</th>
                <td class="alignR">NT$<!--{$arrForm.charge|number_format}--></td>
            </tr>
            <tr>
                <th colspan="3" class="alignR" scope="row">合計</th>
                <td class="alignR"><span class="price">NT$<!--{$arrForm.payment_total|number_format}--></span></td>
            </tr>
        </table>

        <!--{* ログイン済みの会員のみ *}-->
        <!--{if $tpl_login == 1 && $smarty.const.USE_POINT !== false}-->
            <table summary="ポイント確認/" class="delivname">
            <col width="30%" />
            <col width="70%" />
                <tr>
                    <th scope="row">本次購物前的積分</th>
                    <td><!--{$tpl_user_point|number_format|default:0}-->Pts</td>
                </tr>
                <tr>
                    <th scope="row">使用的積分</th>
                    <td>-<!--{$arrForm.use_point|number_format|default:0}-->Pts</td>
                </tr>
                <!--{if $arrForm.birth_point > 0}-->
                <tr>
                    <th scope="row">生日月積分</th>
                    <td>+<!--{$arrForm.birth_point|number_format|default:0}-->Pts</td>
                </tr>
                <!--{/if}-->
                <tr>
                    <th scope="row">本次購物累計積分</th>
                    <td>+<!--{$arrForm.add_point|number_format|default:0}-->Pts</td>
                </tr>
                <tr>
                <!--{assign var=total_point value=`$tpl_user_point-$arrForm.use_point+$arrForm.add_point`}-->
                    <th scope="row">累計后的積分</th>
                    <td><!--{$total_point|number_format}-->Pts</td>
                </tr>
            </table>
        <!--{/if}-->
        <!--{* ログイン済みの会員のみ *}-->

        <!--お届け先ここから-->
        <!--{* 販売方法判定（ダウンロード販売のみの場合はお届け先を表示しない） *}-->
        <!--{if $cartKey != $smarty.const.PRODUCT_TYPE_DOWNLOAD}-->
        <!--{foreach item=shippingItem from=$arrShipping name=shippingItem}-->
        <br /><br />
        <h3>送貨地址<!--{if $is_multiple}--><!--{$smarty.foreach.shippingItem.iteration}--><!--{/if}--></h3>
        <!--{if $is_multiple}-->
            <table summary="ご注文内容確認/">
                <col width="10%" />
                <col width="60%" />
                <col width="20%" />
                <col width="10%" />
                <tr>
                    <th scope="col">商品名</th>
                    <th scope="col">単価</th>
                    <th scope="col">數量</th>
                    <!--{* XXX 購入小計と誤差が出るためコメントアウト
                    <th scope="col">Subtotal</th>
                    *}-->
                </tr>
                <!--{foreach item=item from=$shippingItem.shipment_item}-->
                    <tr>
                        <td><!--{* 商品名 *}--><strong><!--{$item.productsClass.name|h}--></strong><br />
                            <!--{if $item.productsClass.classcategory_name1 != ""}-->
                                <!--{$item.productsClass.class_name1}-->:<!--{$item.productsClass.classcategory_name1}--><br />
                            <!--{/if}-->
                            <!--{if $item.productsClass.classcategory_name2 != ""}-->
                                <!--{$item.productsClass.class_name2}-->:<!--{$item.productsClass.classcategory_name2}-->
                            <!--{/if}-->
                        </td>
                        <td class="alignR">
                            NT$<!--{$item.price|sfCalcIncTax|number_format}-->
                        </td>
                        <td class="alignC"><!--{$item.quantity}--></td>
                        <!--{* XXX 購入小計と誤差が出るためコメントアウト
                        <td class="alignR">NT$<!--{$item.total_inctax|number_format}--></td>
                        *}-->
                    </tr>
                <!--{/foreach}-->
            </table>
        <!--{/if}-->

        <table summary="お届け先確認/" class="delivname">
            <col width="30%" />
            <col width="70%" />
            <tbody>
                <tr>
                    <th scope="row">姓名</th>
                    <td><!--{$shippingItem.shipping_name01|h}--> <!--{$shippingItem.shipping_name02|h}--></td>
                </tr>
                <tr>
                    <th scope="row">郵遞區號</th>
                    <!--{* <td><!--{$shippingItem.shipping_zip01|h}-->-<!--{$shippingItem.shipping_zip02|h}--></td> *}-->
                    <td><!--{$shippingItem.shipping_zipcode|h}--></td>
                </tr>
                <tr>
                    <th scope="row">地址</th>
                    <td><!--{$arrPref[$shippingItem.shipping_pref]}--><!--{$shippingItem.shipping_addr01|h}--> <!--{$shippingItem.shipping_addr02|h}--></td>
                </tr>
                <tr>
                    <th scope="row">電話</th>
                    <td>
                        <!--{if strlen($shippingItem.shipping_tel02) > 0}-->
                          1:&nbsp;&nbsp;<!--{$shippingItem.shipping_tel01}--><br />
                          2:&nbsp;&nbsp;<!--{$shippingItem.shipping_tel02}-->
                        <!--{else}-->
                          <!--{$shippingItem.shipping_tel01}-->
                        <!--{/if}-->
                        <!--{* <!--{$shippingItem.shipping_tel03}--> *}-->
                    </td>
                </tr>
                <tr>
                    <th scope="row">FAX</th>
                    <td>
                        <!--{$shippingItem.shipping_fax01}-->
                        <!--{* <!--{$shippingItem.shipping_fax02}--> *}-->
                        <!--{* <!--{$shippingItem.shipping_fax03}--> *}-->
                    </td>
                </tr>
            <!--{if $cartKey != $smarty.const.PRODUCT_TYPE_DOWNLOAD}-->
                <tr>
                    <th scope="row">送貨日</th>
                    <td><!--{$shippingItem.shipping_date|default:"未指定送貨日期"|h}--></td>
                </tr>
                <tr>
                    <th scope="row">送貨時間</th>
                    <td><!--{$shippingItem.shipping_time|default:"未指定送貨時間"|h}--></td>
                </tr>
            <!--{/if}-->
            </tbody>
        </table>
        <!--{/foreach}-->
        <!--{/if}-->
        <!--お届け先ここまで-->
        <br /><br />
        <h3>配送方法・支付方法・其他聯絡事項</h3>
        <table summary="Delivery method/Payment method/Other inquiries" class="delivname">
            <col width="30%" />
            <col width="70%" />
            <tbody>
            <tr>
                <th scope="row">配送方法</th>
                <td><!--{$arrDeliv[$arrForm.deliv_id]|h}--></td>
            </tr>
            <tr>
                <th scope="row">支付方法</th>
                <td><!--{$arrForm.payment_method|h}-->
                <!--{* 2016.03 yyasuda add start (GMO対応) *}-->
                    <!--{if $arrForm.payment_id == 1}-->
                        <!--{if !isset($is_gmo_used_flg|smarty:nodefaults) || $is_gmo_used_flg == 0}-->
                                <p style="border-top: 1px solid #ccc;">[使用此信用卡]</p>
                                <span class="card_title">持卡人姓名</span>:<!--{$smarty.session.gmo_card.card_name01|h}-->&nbsp;<!--{$smarty.session.gmo_card.card_name02|h}--><br />
                                <span class="card_title">有効期限</span>:<!--{$smarty.session.gmo_card.card_expire_year|h}-->&nbsp;/&nbsp;<!--{$smarty.session.gmo_card.card_expire_month|h}--><br />
                                <span class="card_title">卡號</span>:<!--{$smarty.session.gmo_card.card_number|h}--><br />
                                <span class="card_title">安全碼</span>:<!--{$smarty.session.gmo_card.security_number|h}--><br />
                        <!--{else}-->
                            <!--{if $smarty.session.gmo_card.card_used_type == 0}-->
                                <br />[使用上次購物的信用卡]
                            <!--{elseif $smarty.session.gmo_card.card_used_type == 1}-->
                                <p style="border-top: 1px solid #ccc;">[使用另一張信用卡]</p>
                                <span class="card_title">持卡人姓名</span>:<!--{$smarty.session.gmo_card.card_name01|h}-->&nbsp;<!--{$smarty.session.gmo_card.card_name02|h}--><br />
                                <span class="card_title">有効期限</span>:<!--{$smarty.session.gmo_card.card_expire_year|h}-->&nbsp;/&nbsp;<!--{$smarty.session.gmo_card.card_expire_month|h}--><br />
                                <span class="card_title">卡號</span>:<!--{$smarty.session.gmo_card.card_number|h}--><br />
                                <span class="card_title">安全碼</span>:<!--{$smarty.session.gmo_card.security_number|h}--><br />
                            <!--{/if}-->
                        <!--{/if}-->
                    <!--{/if}-->
                <!--{* 2016.03 yyasuda add end (GMO対応) *}-->
                </td>
            </tr>
            <!--{* ▼ 項目追加 ここから *}-->
            <tr>
                <th scope="row">統一發票</th>
                <td>
                <!--{if $arrForm.receipt_type == 'C'}-->公司<!--{else}-->個人<!--{/if}-->
                </td>
            </tr>
            <!--{if $arrForm.receipt_type == 'C'}-->
            <tr>
                <th scope="row">統編 </th>
                <td><!--{$arrForm.company_code|h}--></td>
            </tr>
            <tr>
                <th scope="row">統編抬頭</th>
                <td><!--{$arrForm.company_name|h}--></td>
            </tr>
            <!--{/if}-->
            <!--{* ▲ 項目追加 ここまで *}-->
            <tr>
                <th scope="row">其他聯絡事項</th>
                <td><!--{$arrForm.message|h|nl2br}--></td>
            </tr>
            </tbody>
        </table>

        <div class="btn_area">
            <ul>
                <li>
                    <a href="./payment.php" onmouseover="chgImg('<!--{$TPL_URLPATH}-->img/button/btn_back_on.jpg', 'back04-top')" onmouseout="chgImg('<!--{$TPL_URLPATH}-->img/button/btn_back.jpg', 'back04-top')"><img src="<!--{$TPL_URLPATH}-->img/button/btn_back.jpg" border="0" name="back04-top" id="back04-top" /></a>
                </li>
                <!--{if $use_module}-->
                <li>
                    <input type="image" onclick="return fnCheckSubmit();" onmouseover="chgImgImageSubmit('<!--{$TPL_URLPATH}-->img/button/btn_next_on.jpg',this)" onmouseout="chgImgImageSubmit('<!--{$TPL_URLPATH}-->img/button/btn_next.jpg',this)" src="<!--{$TPL_URLPATH}-->img/button/btn_next.jpg" name="next" id="next" />
                </li>
                <!--{else}-->
                <li>
                    <input type="image" onclick="return fnCheckSubmit();" onmouseover="chgImgImageSubmit('<!--{$TPL_URLPATH}-->img/button/btn_order_complete_on.jpg',this)" onmouseout="chgImgImageSubmit('<!--{$TPL_URLPATH}-->img/button/btn_order_complete.jpg',this)" src="<!--{$TPL_URLPATH}-->img/button/btn_order_complete.jpg"  name="next" id="next" />
                </li>
                <!--{/if}-->
            </ul>

        </div>
        </form>
    </div>
</div>
</div></div></div>

<!-- 2018.04.20 ytagawa - When purchasing, message display correspondence. -->
<!-- PROTECTION -->
<style type="text/css">
    .shopping-confirm-purchase__protection {
        align-items: center;
        background-color: rgba(255,255,255,0.75);
        bottom: 0;
        display: flex;
        justify-content: center;
        left: 0;
        position: fixed;
        right: 0;
        top: 0;
        z-index: 10000;
    }

    .shopping-confirm-purchase__protection-message {
        align-items: center;
        background-color: rgba(30,30,30,0.85);
        border-radius: 10px;
        color: #fff;
        display: flex;
        padding: 20px;
        max-width: 420px;
    }

/* Now Loading */
.nowloading-spinner {
    margin: 40px 50px 40px 40px;
    font-size: 10px;
    width: 10px;
    height: 10px;
    border-radius: 50%;
    position: relative;
    text-indent: -9999em;
    -webkit-animation: load5 1.1s infinite ease;
    animation: nowloading-spin 1.1s infinite ease;
    -webkit-transform: translateZ(0);
    -ms-transform: translateZ(0);
    transform: translateZ(0);
}
@-webkit-keyframes nowloading-spin {
    0%,
    100% {
        box-shadow: 0em -2.6em 0em 0em #ffffff, 1.8em -1.8em 0 0em rgba(255, 255, 255, 0.2), 2.5em 0em 0 0em rgba(255, 255, 255, 0.2), 1.75em 1.75em 0 0em rgba(255, 255, 255, 0.2), 0em 2.5em 0 0em rgba(255, 255, 255, 0.2), -1.8em 1.8em 0 0em rgba(255, 255, 255, 0.2), -2.6em 0em 0 0em rgba(255, 255, 255, 0.5), -1.8em -1.8em 0 0em rgba(255, 255, 255, 0.7);
    }
    12.5% {
        box-shadow: 0em -2.6em 0em 0em rgba(255, 255, 255, 0.7), 1.8em -1.8em 0 0em #ffffff, 2.5em 0em 0 0em rgba(255, 255, 255, 0.2), 1.75em 1.75em 0 0em rgba(255, 255, 255, 0.2), 0em 2.5em 0 0em rgba(255, 255, 255, 0.2), -1.8em 1.8em 0 0em rgba(255, 255, 255, 0.2), -2.6em 0em 0 0em rgba(255, 255, 255, 0.2), -1.8em -1.8em 0 0em rgba(255, 255, 255, 0.5);
    }
    25% {
        box-shadow: 0em -2.6em 0em 0em rgba(255, 255, 255, 0.5), 1.8em -1.8em 0 0em rgba(255, 255, 255, 0.7), 2.5em 0em 0 0em #ffffff, 1.75em 1.75em 0 0em rgba(255, 255, 255, 0.2), 0em 2.5em 0 0em rgba(255, 255, 255, 0.2), -1.8em 1.8em 0 0em rgba(255, 255, 255, 0.2), -2.6em 0em 0 0em rgba(255, 255, 255, 0.2), -1.8em -1.8em 0 0em rgba(255, 255, 255, 0.2);
    }
    37.5% {
        box-shadow: 0em -2.6em 0em 0em rgba(255, 255, 255, 0.2), 1.8em -1.8em 0 0em rgba(255, 255, 255, 0.5), 2.5em 0em 0 0em rgba(255, 255, 255, 0.7), 1.75em 1.75em 0 0em #ffffff, 0em 2.5em 0 0em rgba(255, 255, 255, 0.2), -1.8em 1.8em 0 0em rgba(255, 255, 255, 0.2), -2.6em 0em 0 0em rgba(255, 255, 255, 0.2), -1.8em -1.8em 0 0em rgba(255, 255, 255, 0.2);
    }
    50% {
        box-shadow: 0em -2.6em 0em 0em rgba(255, 255, 255, 0.2), 1.8em -1.8em 0 0em rgba(255, 255, 255, 0.2), 2.5em 0em 0 0em rgba(255, 255, 255, 0.5), 1.75em 1.75em 0 0em rgba(255, 255, 255, 0.7), 0em 2.5em 0 0em #ffffff, -1.8em 1.8em 0 0em rgba(255, 255, 255, 0.2), -2.6em 0em 0 0em rgba(255, 255, 255, 0.2), -1.8em -1.8em 0 0em rgba(255, 255, 255, 0.2);
    }
    62.5% {
        box-shadow: 0em -2.6em 0em 0em rgba(255, 255, 255, 0.2), 1.8em -1.8em 0 0em rgba(255, 255, 255, 0.2), 2.5em 0em 0 0em rgba(255, 255, 255, 0.2), 1.75em 1.75em 0 0em rgba(255, 255, 255, 0.5), 0em 2.5em 0 0em rgba(255, 255, 255, 0.7), -1.8em 1.8em 0 0em #ffffff, -2.6em 0em 0 0em rgba(255, 255, 255, 0.2), -1.8em -1.8em 0 0em rgba(255, 255, 255, 0.2);
    }
    75% {
        box-shadow: 0em -2.6em 0em 0em rgba(255, 255, 255, 0.2), 1.8em -1.8em 0 0em rgba(255, 255, 255, 0.2), 2.5em 0em 0 0em rgba(255, 255, 255, 0.2), 1.75em 1.75em 0 0em rgba(255, 255, 255, 0.2), 0em 2.5em 0 0em rgba(255, 255, 255, 0.5), -1.8em 1.8em 0 0em rgba(255, 255, 255, 0.7), -2.6em 0em 0 0em #ffffff, -1.8em -1.8em 0 0em rgba(255, 255, 255, 0.2);
    }
    87.5% {
        box-shadow: 0em -2.6em 0em 0em rgba(255, 255, 255, 0.2), 1.8em -1.8em 0 0em rgba(255, 255, 255, 0.2), 2.5em 0em 0 0em rgba(255, 255, 255, 0.2), 1.75em 1.75em 0 0em rgba(255, 255, 255, 0.2), 0em 2.5em 0 0em rgba(255, 255, 255, 0.2), -1.8em 1.8em 0 0em rgba(255, 255, 255, 0.5), -2.6em 0em 0 0em rgba(255, 255, 255, 0.7), -1.8em -1.8em 0 0em #ffffff;
    }
}
@keyframes nowloading-spin {
    0%,
    100% {
        box-shadow: 0em -2.6em 0em 0em #ffffff, 1.8em -1.8em 0 0em rgba(255, 255, 255, 0.2), 2.5em 0em 0 0em rgba(255, 255, 255, 0.2), 1.75em 1.75em 0 0em rgba(255, 255, 255, 0.2), 0em 2.5em 0 0em rgba(255, 255, 255, 0.2), -1.8em 1.8em 0 0em rgba(255, 255, 255, 0.2), -2.6em 0em 0 0em rgba(255, 255, 255, 0.5), -1.8em -1.8em 0 0em rgba(255, 255, 255, 0.7);
    }
    12.5% {
        box-shadow: 0em -2.6em 0em 0em rgba(255, 255, 255, 0.7), 1.8em -1.8em 0 0em #ffffff, 2.5em 0em 0 0em rgba(255, 255, 255, 0.2), 1.75em 1.75em 0 0em rgba(255, 255, 255, 0.2), 0em 2.5em 0 0em rgba(255, 255, 255, 0.2), -1.8em 1.8em 0 0em rgba(255, 255, 255, 0.2), -2.6em 0em 0 0em rgba(255, 255, 255, 0.2), -1.8em -1.8em 0 0em rgba(255, 255, 255, 0.5);
    }
    25% {
        box-shadow: 0em -2.6em 0em 0em rgba(255, 255, 255, 0.5), 1.8em -1.8em 0 0em rgba(255, 255, 255, 0.7), 2.5em 0em 0 0em #ffffff, 1.75em 1.75em 0 0em rgba(255, 255, 255, 0.2), 0em 2.5em 0 0em rgba(255, 255, 255, 0.2), -1.8em 1.8em 0 0em rgba(255, 255, 255, 0.2), -2.6em 0em 0 0em rgba(255, 255, 255, 0.2), -1.8em -1.8em 0 0em rgba(255, 255, 255, 0.2);
    }
    37.5% {
        box-shadow: 0em -2.6em 0em 0em rgba(255, 255, 255, 0.2), 1.8em -1.8em 0 0em rgba(255, 255, 255, 0.5), 2.5em 0em 0 0em rgba(255, 255, 255, 0.7), 1.75em 1.75em 0 0em #ffffff, 0em 2.5em 0 0em rgba(255, 255, 255, 0.2), -1.8em 1.8em 0 0em rgba(255, 255, 255, 0.2), -2.6em 0em 0 0em rgba(255, 255, 255, 0.2), -1.8em -1.8em 0 0em rgba(255, 255, 255, 0.2);
    }
    50% {
        box-shadow: 0em -2.6em 0em 0em rgba(255, 255, 255, 0.2), 1.8em -1.8em 0 0em rgba(255, 255, 255, 0.2), 2.5em 0em 0 0em rgba(255, 255, 255, 0.5), 1.75em 1.75em 0 0em rgba(255, 255, 255, 0.7), 0em 2.5em 0 0em #ffffff, -1.8em 1.8em 0 0em rgba(255, 255, 255, 0.2), -2.6em 0em 0 0em rgba(255, 255, 255, 0.2), -1.8em -1.8em 0 0em rgba(255, 255, 255, 0.2);
    }
    62.5% {
        box-shadow: 0em -2.6em 0em 0em rgba(255, 255, 255, 0.2), 1.8em -1.8em 0 0em rgba(255, 255, 255, 0.2), 2.5em 0em 0 0em rgba(255, 255, 255, 0.2), 1.75em 1.75em 0 0em rgba(255, 255, 255, 0.5), 0em 2.5em 0 0em rgba(255, 255, 255, 0.7), -1.8em 1.8em 0 0em #ffffff, -2.6em 0em 0 0em rgba(255, 255, 255, 0.2), -1.8em -1.8em 0 0em rgba(255, 255, 255, 0.2);
    }
    75% {
        box-shadow: 0em -2.6em 0em 0em rgba(255, 255, 255, 0.2), 1.8em -1.8em 0 0em rgba(255, 255, 255, 0.2), 2.5em 0em 0 0em rgba(255, 255, 255, 0.2), 1.75em 1.75em 0 0em rgba(255, 255, 255, 0.2), 0em 2.5em 0 0em rgba(255, 255, 255, 0.5), -1.8em 1.8em 0 0em rgba(255, 255, 255, 0.7), -2.6em 0em 0 0em #ffffff, -1.8em -1.8em 0 0em rgba(255, 255, 255, 0.2);
    }
    87.5% {
        box-shadow: 0em -2.6em 0em 0em rgba(255, 255, 255, 0.2), 1.8em -1.8em 0 0em rgba(255, 255, 255, 0.2), 2.5em 0em 0 0em rgba(255, 255, 255, 0.2), 1.75em 1.75em 0 0em rgba(255, 255, 255, 0.2), 0em 2.5em 0 0em rgba(255, 255, 255, 0.2), -1.8em 1.8em 0 0em rgba(255, 255, 255, 0.5), -2.6em 0em 0 0em rgba(255, 255, 255, 0.7), -1.8em -1.8em 0 0em #ffffff;
    }
}


</style>
<div style="display:none;" class="shopping-confirm-purchase__protection">
    <div class="shopping-confirm-purchase__protection-message">
        <div class="nowloading-spin"><div class="nowloading-spinner"></div></div>目前正在處理您的訂單，請您耐心等候。處理完後會出現完成訂購的網頁則表示訂購成功。
    </div>
</div>
