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

<script type="text/javascript">//<![CDATA[
    $(function() {
        if ($('input[name=deliv_id]:checked').val()
            || $('#deliv_id').val()) {
            showForm(true);
        } else {
            showForm(false);
        }
        $('input[id^=deliv_]').click(function() {
            showForm(true);
            var data = {};
            data.mode = 'select_deliv';
            data.deliv_id = $(this).val();
            data['<!--{$smarty.const.TRANSACTION_ID_NAME}-->'] = '<!--{$transactionid}-->';
            $.ajax({
                type : 'POST',
                url : location.pathname,
                data: data,
                cache : false,
                dataType : 'json',
                error : remoteException,
                success : function(data, dataType) {
                    if (data.error) {
                        remoteException();
                    } else {
                        // 支払い方法の行を生成
                        var payment_tbody = $('#payment tbody');
                        payment_tbody.empty();
                        for (var i in data.arrPayment) {
                            // ラジオボタン
                            <!--{* IE7未満対応のため name と id をベタ書きする *}-->
                            var radio = $('<input type="radio" name="payment_id" id="pay_' + i + '" />')
                                .val(data.arrPayment[i].payment_id);
                            // ラベル
                            var label = $('<label />')
                                .attr('for', 'pay_' + i)
                                .text(data.arrPayment[i].payment_method);
                            // 行
                            var tr = $('<tr />')
                                .append($('<td />')
                                    .addClass('alignC')
                                    .append(radio))
                                .append($('<td />').append(label));

                            // 支払方法の画像が登録されている場合は表示
                            if (data.img_show) {
                                var payment_image = data.arrPayment[i].payment_image;
                                $('th#payment_method').attr('colspan', 3);
                                if (payment_image) {
                                    var img = $('<img />').attr('src', '<!--{$smarty.const.IMAGE_SAVE_URLPATH}-->' + payment_image);
                                    tr.append($('<td />').append(img));
                                } else {
                                    tr.append($('<td />'));
                                }
                            } else {
                                $('th#payment_method').attr('colspan', 2);
                            }

                            tr.appendTo(payment_tbody);
                        }
                        // お届け時間を生成
                        var deliv_time_id_select = $('select[id^=deliv_time_id]');
                        deliv_time_id_select.empty();
                        deliv_time_id_select.append($('<option />').text('無指定').val(''));
                        for (var i in data.arrDelivTime) {
                            var option = $('<option />')
                                .val(i)
                                .text(data.arrDelivTime[i])
                                .appendTo(deliv_time_id_select);
                        }
                    }
                }
            });
        });

        /**
         * 通信エラー表示.
         */
        function remoteException(XMLHttpRequest, textStatus, errorThrown) {
            alert('發生通信錯誤，將移動到購物車頁面。');
            location.href = '<!--{$smarty.const.CART_URLPATH}-->';
        }

        /**
         * 配送方法の選択状態により表示を切り替える
         */
        function showForm(show) {
            if (show) {
                $('#payment, div.delivdate, .select-msg').show();
                $('.non-select-msg').hide();
            } else {
                $('#payment, div.delivdate, .select-msg').hide();
                $('.non-select-msg').show();
            }
        }
    });
//]]></script>
<div id="undercolumn">
    <div id="undercolumn_shopping">
        <p class="flow_area">
            <img src="<!--{$TPL_URLPATH}-->img/picture/img_flow_02.jpg" />
        </p>
        <h2 class="title"><!--{$tpl_title|h}--></h2>

        <form name="form1" id="form1" method="post" action="?">
        <input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME}-->" value="<!--{$transactionid}-->" />
        <input type="hidden" name="mode" value="confirm" />
        <input type="hidden" name="uniqid" value="<!--{$tpl_uniqid}-->" />

        <!--{assign var=key value="deliv_id"}-->
        <!--{if $is_single_deliv}-->
            <input type="hidden" name="<!--{$key}-->" value="<!--{$arrForm[$key].value|h}-->" id="deliv_id" />
        <!--{else}-->
        <div class="pay_area">
            <h3>選擇配送方法</h3>
            <p>請選擇配送方法</p>

            <!--{if $arrErr[$key] != ""}-->
            <p class="attention"><!--{$arrErr[$key]}--></p>
            <!--{/if}-->
            <table summary="配送方法選擇送貨方式">
                <col width="20%" />
                <col width="80%" />
                <tr>
                    <th class="alignC">選択</th>
                    <th class="alignC" colspan="2">配送方法</th>
                </tr>
                <!--{section name=cnt loop=$arrDeliv}-->
                <tr>
                    <td class="alignC"><input type="radio" id="deliv_<!--{$smarty.section.cnt.iteration}-->" name="<!--{$key}-->" value="<!--{$arrDeliv[cnt].deliv_id}-->" style="<!--{$arrErr[$key]|sfGetErrorColor}-->" <!--{$arrDeliv[cnt].deliv_id|sfGetChecked:$arrForm[$key].value}--> />
                    </td>
                    <td>
                        <label for="deliv_<!--{$smarty.section.cnt.iteration}-->"><!--{$arrDeliv[cnt].name|h}--><!--{if $arrDeliv[cnt].remark != ""}--><p><!--{$arrDeliv[cnt].remark|h|nl2br}--></p><!--{/if}--></label>
                    </td>
                </tr>
                <!--{/section}-->
            </table>
        </div>
        <!--{/if}-->

        <div class="pay_area">
            <h3>選擇支付方法</h3>
            <p class="select-msg">請選擇支付方法</p>
            <p class="non-select-msg">請先選擇支付方法</p>

            <!--{assign var=key value="payment_id"}-->
            <!--{if $arrErr[$key] != ""}-->
            <p class="attention"><!--{$arrErr[$key]}--></p>
            <!--{/if}-->
            
            <p><span class="attention" style="font-size:120%;">[信用卡系統維護作業公告]</span><br />親愛的顧客，您好<br />為了提供更好的服務品質，我們預計將於 <span class="attention">2015年9月29日(星期二) 上午8:00~10:00</span> 進行信用卡系統升級維護作業。在維護期間信用卡交易將暫停服務，此段時間如有付款需求，建議您選擇其他付款方式，或等待系統維護完成後再進行付款作業。<br />如造成您的不便，敬請見諒。</p>
						
            <table summary="支払方法選擇付款方式" id="payment">
                <col width="20%" />
                <col width="80%" />
                <thead>
                    <tr>
                        <th class="alignC">選択</th>
                        <th class="alignC" colspan="<!--{if !$img_show}-->2<!--{else}-->3<!--{/if}-->" id="payment_method">付款方式</th>
                    </tr>
                </thead>
                <tbody>
                    <!--{section name=cnt loop=$arrPayment}-->
                        <tr>
                        <td class="alignC"><input type="radio" id="pay_<!--{$smarty.section.cnt.iteration}-->" name="<!--{$key}-->"  value="<!--{$arrPayment[cnt].payment_id}-->" style="<!--{$arrErr[$key]|sfGetErrorColor}-->" <!--{$arrPayment[cnt].payment_id|sfGetChecked:$arrForm[$key].value}--> /></td>
                        <td>
                            <label for="pay_<!--{$smarty.section.cnt.iteration}-->"><!--{$arrPayment[cnt].payment_method|h}--><!--{if $arrPayment[cnt].note != ""}--><!--{/if}--></label>
                        </td>
                        <!--{if $img_show}-->
                            <td>
                                <!--{if $arrPayment[cnt].payment_image != ""}-->
                                    <img src="<!--{$smarty.const.IMAGE_SAVE_URLPATH}--><!--{$arrPayment[cnt].payment_image}-->" />
                                <!--{/if}-->
                            </td>
                        <!--{/if}-->
                        </tr>
                    <!--{/section}-->
                </tbody>
            </table>
        </div>

        <!--{if $cartKey != $smarty.const.PRODUCT_TYPE_DOWNLOAD}-->
        <div class="pay_area02">
            <h3>選擇送貨時間</h3>
            <p class="select-msg">請選擇送貨時間</p>
            <p class="non-select-msg">請選擇送貨時間</p>
            <!--{foreach item=shippingItem name=shippingItem from=$arrShipping}-->
            <!--{assign var=index value=$shippingItem.shipping_id}-->
            <div class="delivdate top">
                <!--{if $is_multiple}-->
                    <span class="st"><!--{$shippingItem.shipping_name01}--><!--{$shippingItem.shipping_name02}-->
                    <!--{$arrPref[$shippingItem.shipping_pref]}--><!--{$shippingItem.shipping_addr01}--><!--{$shippingItem.shipping_addr02}--></span><br/>
                <!--{/if}-->
                <!--★お届け日★-->
                <!--{assign var=key value="deliv_date`$index`"}-->
                <span class="attention"><!--{$arrErr[$key]}--></span>
                送貨日期:
                <!--{if !$arrDelivDate}-->
                    沒有指定。
                <!--{else}-->
                    <select name="<!--{$key}-->" id="<!--{$key}-->" style="<!--{$arrErr[$key]|sfGetErrorColor}-->">
                        <option value="" selected="">未指定</option>
                        <!--{assign var=shipping_date_value value=$arrForm[$key].value|default:$shippingItem.shipping_date}-->
                        <!--{html_options options=$arrDelivDate selected=$shipping_date_value}-->
                    </select>&nbsp;
                <!--{/if}-->
                <!--★お届け時間★-->
                <!--{assign var=key value="deliv_time_id`$index`"}-->
                <span class="attention"><!--{$arrErr[$key]}--></span>
                送貨時間:
                <select name="<!--{$key}-->" id="<!--{$key}-->" style="<!--{$arrErr[$key]|sfGetErrorColor}-->">
                    <!--{assign var=shipping_time_value value=$arrForm[$key].value|default:$shippingItem.time_id}-->
                    <!--{html_options options=$arrDelivTime selected=$shipping_time_value}-->
                </select>
            </div>
            <!--{/foreach}-->
        </div>
        <!--{/if}-->

        <!-- ▼ポイント使用 ここから -->
        <!--{if $tpl_login == 1 && $smarty.const.USE_POINT !== false}-->
            <div class="point_area">
                <h3>ポイント使用の指定/</h3>
                	<p><span class="attention">紅利點數1點可抵扣<!--{$smarty.const.POINT_VALUE|number_format}-->元</span><br />
                       若要使用點數，請確認「使用紅利點數」後，填入本次使用點數
                    </p>
                    <div class="point_announce">
                        <p><span class="user_name"><!--{$name01|h}--> <!--{$name02|h}-->先生/小姐</span>目前所持之紅利點數為<span class="point"><!--{$tpl_user_point|default:0|number_format}-->Pt</span><br />
                            本次購買金額總計：<span class="price"><!--{$arrPrices.subtotal|number_format}-->元</span> <span class="attention">(未含運費及手續費)</span>
                        </p>
                        <ul>
                            <li>
                            <input type="radio" id="point_on" name="point_check" value="1" <!--{$arrForm.point_check.value|sfGetChecked:1}--> onclick="fnCheckInputPoint();" /><label for="point_on">使用紅利點數</label>
                                <!--{assign var=key value="use_point"}--><br />
                                本次購物使用 <input type="text" name="<!--{$key}-->" value="<!--{$arrForm[$key].value|default:$tpl_user_point}-->" maxlength="<!--{$arrForm[$key].length}-->" style="<!--{$arrErr[$key]|sfGetErrorColor}-->" class="box60" /> pt<span class="attention"><!--{$arrErr[$key]}--></span>
                            </li>
                            <li><input type="radio" id="point_off" name="point_check" value="2" <!--{$arrForm.point_check.value|sfGetChecked:2}--> onclick="fnCheckInputPoint();" /><label for="point_off">不使用紅利點數</label></li>
                        </ul>
                </div>
            </div>
        <!--{/if}-->
        <!-- ▲ポイント使用 ここまで -->

<!--{* ▼追加項目 ここから *}-->
        <div class="pay_area02">
            <h3>統一發票</h3>
            <p>統一發票寄送地址</p>
                <!--{assign var=key value="receipt_type"}-->
                <span class="attention"><!--{$arrErr[$key]}--></span>
                <span <!--{if $arrErr[$key] != ""}--><!--{sfSetErrorStyle}--><!--{/if}-->>
                  <input type="radio" id="receipt_people" name="receipt_type" value="P" <!--{$arrForm[$key].value|sfGetChecked:'P'}--> onclick="fnCheckInputReceiptType();" style="<!--{$arrErr[$key]|sfGetErrorColor}-->" /><label for="receipt_people">個人地址</label>
                  <input type="radio" id="receipt_company" name="receipt_type" value="C" <!--{$arrForm[$key].value|sfGetChecked:'C'}--> onclick="fnCheckInputReceiptType();" /><label for="receipt_company">公司地址</label>
                </span><br />

                <!--{assign var=key1 value="company_code"}-->
                <!--{assign var=key2 value="company_name"}-->
                <!--{if $arrErr[$key1] || $arrErr[$key2]}-->
                  <div class="attention"><!--{$arrErr[$key1]}--><!--{$arrErr[$key2]}--></div>
                <!--{/if}-->
                統編&nbsp;<input type="text" name="<!--{$key1}-->" value="<!--{$arrForm[$key1].value|default:$tpl_company_code}-->" maxlength="<!--{$smarty.const.STEXT_LEN}-->" style="<!--{$arrErr[$key1]|sfGetErrorColor}-->;" class="box300" /><br />
                統編抬頭&nbsp;<input type="text" name="<!--{$key2}-->" value="<!--{$arrForm[$key2].value|default:$tpl_company_name}-->" maxlength="<!--{$smarty.const.STEXT_LEN}-->" style="<!--{$arrErr[$key2]|sfGetErrorColor}-->;" class="box300" />
        </div>
<!--{* ▲追加項目 ここまで *}-->
    <div class="pay_area02">
            <h3>促銷編號</h3>
            <p>如果您是看到廣告傳單,請在此處填寫促銷編號。</p>
            <div>
                <!--★促銷編號★-->
                
                <span class="attention"><!--{$arrErr.memo10}--></span>
                <input type="text" class="box200" name="memo10" value="<!--{$arrForm.memo10.value|h|default:$arrData.memo10|h}-->" maxlength="<!--{$smarty.const.STEXT_LEN}-->" style="<!--{$arrErr.memo10|sfGetErrorColor}-->; ime-mode: active;" />
            </div>
        </div>
        <div class="pay_area02">
            <h3>其他諮詢(如配送備註)</h3>
            <p>若有其他疑問，請在此處填寫諮詢內容。</p>
            <div>
                <!--★その他お問い合わせ事項★-->
                <!--{assign var=key value="message"}-->
                <span class="attention"><!--{$arrErr[$key]}--></span>
                <textarea name="<!--{$key}-->" style="<!--{$arrErr[$key]|sfGetErrorColor}-->" cols="70" rows="8" class="txtarea" wrap="hard"><!--{"\n"}--><!--{$arrForm[$key].value|h}--></textarea>
                <p class="attention">(文字 <!--{$smarty.const.LTEXT_LEN}--> 字以內)</p>
            </div>
        </div>


        <div class="btn_area">
            <ul>
                <li>
                <a href="?mode=return" onmouseover="chgImg('<!--{$TPL_URLPATH}-->img/button/btn_back_on.jpg','back03')" onmouseout="chgImg('<!--{$TPL_URLPATH}-->img/button/btn_back.jpg','back03')">
                    <img src="<!--{$TPL_URLPATH}-->img/button/btn_back.jpg" border="0" name="back03" id="back03" /></a>
                </li>
                <li>
                    <input type="image" onmouseover="chgImgImageSubmit('<!--{$TPL_URLPATH}-->img/button/btn_next_on.jpg',this)" onmouseout="chgImgImageSubmit('<!--{$TPL_URLPATH}-->img/button/btn_next.jpg',this)" src="<!--{$TPL_URLPATH}-->img/button/btn_next.jpg" name="next" id="next" />
                </li>
            </ul>
        </div>
        </form>
    </div>
</div>