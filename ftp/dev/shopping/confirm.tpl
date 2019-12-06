<!--   肚子開始  -->

        <script type="text/javascript" src="<!--{$smarty.const.ROOT_URLPATH}-->js/jquery.facebox/facebox.js"></script>
        <link rel="stylesheet" type="text/css" href="<!--{$smarty.const.ROOT_URLPATH}-->js/jquery.facebox/facebox.css" media="screen" />
        <script type="text/javascript">//<![CDATA[

            // if(window.location.host.includes('localhost')) return;
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
        
        
        <link rel="stylesheet" href="../user_data/new_201811/css/new_chart.css" />
         <div class="W100 t_center">
          <div class="W1360 bread">
              <span class="f15 f_pink f_left"><a class="f_grey" href="/tw/">首頁 /</a> <a class="f_grey" href="/tw/user_data/product_list.php">MANARA商品 / </a>  <a class="f_grey" href="../cart/">購物清單 / </a>訂單確認</span>
          </div>
        </div>
        <div id="undercolumn" class="container sec-wrap">
            <div id="main_text">
                <div class="columns-12">
                    <div id="shoppingCart">
                        <div id="undercolumn_shopping">
                            <ul class="flow_area">
                                <li class="active"><span>1</span>付款與運送方式</li>
                                <li class="active"><span>2</span>訂單確認</li>
                                <li><span>3</span>訂單完成</li>
                            </ul>
                            <!--{* エラーメッセージがある場合は表示される *}-->
                            <span class="attention"><!--{$tpl_errormessage|h}--></span>
                            <p class="information">
                                <br />
                                請確認以下內容無誤。<br />
                                若正確請按「購物完成」按鈕。
                            </p>

                            <form name="form1" id="form1" method="post" action="?">
                                <input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME}-->" value="<!--{$transactionid}-->" />
                                <input type="hidden" name="mode" value="confirm" />
                                <input type="hidden" name="uniqid" value="<!--{$tpl_uniqid}-->" />
                                
                                <table summary="ご注文内容確認/" class="product-table padding20" >
                                    <tr class="f15 t_left">
                                        <th scope="col" class="W55 border_0 mb-50 t_left">商品</th>
                                        <th scope="col" class="W14 border_0 mb-25">售價</th>
                                        <th scope="col" class="W14 border_0 mb_none">數量</th>
                                        <th scope="col" class="W17 border_0 mb-25 t_left">小計</th>
                                    </tr>


                                    
                                    <!--{foreach from=$arrCartItems item=item}-->
                                    <tr>
                                        <td class="mb-50">
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
                                        <td class="mb-25">
                                            NT$<!--{$item.price|sfCalcIncTax|number_format}-->
                                            <font class="mb">x<!--{$item.quantity|number_format}--></font>
                                        </td>
                                        <td class="mb_none"><!--{$item.quantity|number_format}--></td>
                                        <td class="f_red mb-25">NT$<!--{$item.total_inctax|number_format}--></td>
                                    </tr>
                                    <!--{/foreach}-->


                                    <tr class="form_final">
                                        <td colspan="4" class="t_right" scope="row">
                                            <div class="W100">
                                                <span>商品金額</span>
                                                <span class="W25">NT$<!--{$tpl_total_inctax[$cartKey]|number_format}--></span>
                                            </div>
                                            <!--{if $smarty.const.USE_POINT !== false}-->
                                            <div class="W100">
                                                <span>折扣(使用積分時)</span>
                                                <span class="W25">NT$
                                                    <!--{assign var=discount value=`$arrForm.use_point*$smarty.const.POINT_VALUE`}-->
                                                    -<!--{$discount|number_format|default:0}--></span>
                                            </div>
                                            <!--{/if}-->

                                            <div class="W100">
                                                <span>郵費</span>
                                                <span class="W25">NT$<!--{$arrForm.deliv_fee|number_format}--></span>
                                            </div>
                                            <div class="W100">
                                                <span>手續費</span>
                                                <span class="W25">NT$<!--{$arrForm.charge|number_format}--></span>
                                            </div>

                                            <div class="W100">
                                                <span>合計</span>
                                                <span class="price W25 f24 f_red f_b">NT$<!--{$arrForm.payment_total|number_format}--></span>
                                            </div>
                                        </td>
                                    </tr>
                                </table>

                                <!--{* ログイン済みの会員のみ *}-->
                                <!--{if $tpl_login == 1 && $smarty.const.USE_POINT !== false}-->
                                
                                <table summary="ポイント確認/" class="delivname" >
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

                                <h5 class="title f21 f_black t_left">送貨地址<!--{if $is_multiple}--><!--{$smarty.foreach.shippingItem.iteration}--><!--{/if}--></h5>
                                <!--{if $is_multiple}-->
                                <table summary="ご注文内容確認/" style="display:none" class="padding20">
                                    <col width="10%" />
                                    <col width="60%" />
                                    <col width="20%" />
                                    <col width="10%" />
                                    <tr>
                                        <th scope="col">商品</th>
                                        <th scope="col">售價</th>
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

                                <!--{if $arrForm.receiving_method == 1}-->
                                <table summary="お届け先確認/" class="delivname padding20">
                                    <col width="30%"./; />
                                    <col width="70%" />
                                    <tbody>
                                        <tr>
                                            <td scope="row">超商ID</td>
                                            <td><!--{$shippingItem.conv_store_spot|h}--></td>
                                        </tr>
                                        <tr>
                                            <td scope="row">超商名</td>
                                            <td><!--{$shippingItem.conv_store_name|h}--></td>
                                        </tr>
                                        <tr>
                                            <td scope="row">超商地址</td>
                                            <td><!--{$shippingItem.conv_store_addr|h}--></td>
                                        </tr>
                                        <tr>
                                            <td scope="row">超商電話</td>
                                            <td><!--{$shippingItem.conv_store_tel|h}--></td>
                                        </tr>

                                        <!--{if $cartKey != $smarty.const.PRODUCT_TYPE_DOWNLOAD}-->
                                        <tr>
                                            <td scope="row">送貨日</td>
                                            <td><!--{$shippingItem.shipping_date|default:"未指定送貨日期"|h}--></td>
                                        </tr>
                                        <tr>
                                            <td scope="row">送貨時間</td>
                                            <td><!--{$shippingItem.shipping_time|default:"未指定送貨時間"|h}--></td>
                                        </tr>
                                        <!--{/if}-->
                                    </tbody>
                                </table>
                                <!-- 宅配 -->
                                <!--{else}-->
                                <table summary="お届け先確認/" class="delivname  padding20">
                                    <col width="30%" />
                                    <col width="70%" />
                                    <tbody>
                                        <tr>
                                            <td scope="row">訂購姓名</td>
                                            <td><!--{$shippingItem.shipping_name01|h}--> <!--{$shippingItem.shipping_name02|h}--></td>
                                        </tr>
                                        <tr>
                                            <td scope="row">郵遞區號</td>
                                            <!--{* <td><!--{$shippingItem.shipping_zip01|h}-->-<!--{$shippingItem.shipping_zip02|h}--></td> *}-->
                                            <td><!--{$shippingItem.shipping_zipcode|h}--></td>
                                        </tr>
                                        <tr>
                                            <td scope="row">送貨地址</td>
                                            <td><!--{$arrPref[$shippingItem.shipping_pref]}--><!--{$shippingItem.shipping_addr01|h}--> <!--{$shippingItem.shipping_addr02|h}--></td>
                                        </tr>
                                        <tr>
                                            <td scope="row">電話</td>
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
                                            <td scope="row">FAX</td>
                                            <td>
                                                <!--{$shippingItem.shipping_fax01}-->
                                                <!--{* <!--{$shippingItem.shipping_fax02}--> *}-->
                                                <!--{* <!--{$shippingItem.shipping_fax03}--> *}-->
                                            </td>
                                        </tr>
                                    <!--{if $cartKey != $smarty.const.PRODUCT_TYPE_DOWNLOAD}-->
                                        <tr>
                                            <td scope="row">送貨日期</td>
                                            <td><!--{$shippingItem.shipping_date|default:"未指定送貨日期"|h}--></td>
                                        </tr>
                                        <tr>
                                            <td scope="row">送貨時間</td>
                                            <td><!--{$shippingItem.shipping_time|default:"未指定送貨時間"|h}--></td>
                                        </tr>
                                    <!--{/if}-->
                                    </tbody>
                                </table>
                                <!--{/if}-->
                                <!--{/foreach}-->
                                <!--{/if}-->
                                <!--お届け先ここまで-->
                                
                                <h5 class="title f21 f_black t_left">配送方法・支付方法・其他聯絡事項</h5>
                                <table summary="Delivery method/Payment method/Other inquiries" class="delivname  padding20">
                                    <col width="30%" />
                                    <col width="70%" />
                                    <tbody>
                                    <tr>
                                        <td scope="row">配送方法</td>
                                        <td><!--{$arrDeliv[$arrForm.deliv_id]|h}--></td>
                                    </tr>
                                    <tr>
                                        <td scope="row">支付方法</td>
                                        <td><!--{$arrForm.payment_method|h}-->
                                        <!--{* 2016.03 yyasuda add start (GMO対応) *}-->
                                            <!--{if $arrForm.payment_id == 1}-->
                                                <!--{if !isset($is_gmo_used_flg|smarty:nodefaults) || $is_gmo_used_flg == 0}-->
                                                        <p class="f_b">[使用此信用卡]</p>
                                                        <span class="card_title">持卡人姓名</span>:<!--{$smarty.session.gmo_card.card_name01|h}-->&nbsp;<!--{$smarty.session.gmo_card.card_name02|h}--><br />
                                                        <span class="card_title">有効期限</span>:<!--{$smarty.session.gmo_card.card_expire_year|h}-->&nbsp;/&nbsp;<!--{$smarty.session.gmo_card.card_expire_month|h}--><br />
                                                        <span class="card_title">卡號</span>:<!--{$smarty.session.gmo_card.card_number|h}--><br />
                                                        <span class="card_title">安全碼</span>:<!--{$smarty.session.gmo_card.security_number|h}--><br />
                                                <!--{else}-->
                                                    <!--{if $smarty.session.gmo_card.card_used_type == 0}-->
                                                        <br />[使用上次購物的信用卡]
                                                    <!--{elseif $smarty.session.gmo_card.card_used_type == 1}-->
                                                        <p class="f_b">[使用另一張信用卡]</p>
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
                                        <td scope="row">統一發票</td>
                                        <td>
                                        <!--{if $arrForm.receipt_type == 'C'}-->公司<!--{else}-->個人<!--{/if}-->
                                        </td>
                                    </tr>
                                    <!--{if $arrForm.receipt_type == 'C'}-->
                                    <tr>
                                        <td scope="row">統編 </td>
                                        <td><!--{$arrForm.company_code|h}--></td>
                                    </tr>
                                    <tr>
                                        <td scope="row">統編抬頭</td>
                                        <td><!--{$arrForm.company_name|h}--></td>
                                    </tr>
                                    <!--{/if}-->
                                    <!--{* ▲ 項目追加 ここまで *}-->
                                    <tr>
                                        <td scope="row">其他聯絡事項</td>
                                        <td><!--{$arrForm.message|h|nl2br}--></td>
                                    </tr>
                                    </tbody>
                                </table>

                                <div class="btn_area">
                                    <a href="./deliv.php" class="btn f_black bg_white mr15" name="back04-top" id="back04-top" />返回修改</a>
                                    <!--{if $use_module}-->
                                    <button name="send_button" class="btn f_white bg_red" onclick="return fnCheckSubmit();" name="next" id="next" >下一步</button>
                                    <!--{else}-->
                                    <button name="send_button" class="btn f_white bg_red" onclick="return fnCheckSubmit();" name="next" id="next" >確認送出</button>
                                    <!--{/if}-->
                                </div>

                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

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

         <!--   肚子結束  -->
