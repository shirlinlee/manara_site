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

   

    <div class="container sec-wrap">
        <div id="main_text">
            <div class="columns-12">
                <div id="shoppingCart" class="col-md-8 col-sm-10 col-xs-12 col-offset-2">
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
                            <tr>
                                <th>刪除</th>
                                <th>產品圖片</th>
                                <th>產品名稱</th>
                                <th>單價</th>
                                <th>數量</th>
                                <th>小計</th>
                            </tr>
                            <!--{foreach from=$cartItems[$key] item=item}-->
                            <tr>
                                <td><a href="?" onclick="fnFormModeSubmit('form<!--{$key}-->', 'delete', 'cart_no', '<!--{$item.cart_no}-->'); return false;"><img src="<!--{$smarty.const.HTTPS_URL}-->user_data/new/img/icon/icon-delete.png"></a></td>
                                <td><img src="<!--{$smarty.const.ROOT_URLPATH}-->resize_image.php?image=<!--{$item.productsClass.main_list_image|sfNoImageMainList|h}-->&amp;width=180&amp;height=180" alt="<!--{$item.productsClass.name|h}-->" /></td>
                                <td><!--{$item.productsClass.name|h}--></td>
                                <td><!--{$item.price|sfCalcIncTax|number_format}-->元</td>
                                <td><!--{$item.quantity}-->
                                    <a href="?" onclick="fnFormModeSubmit('form<!--{$key}-->','down','cart_no','<!--{$item.cart_no}-->'); return false;" class="btn">-</a>
                                    <a href="?" onclick="fnFormModeSubmit('form<!--{$key}-->','up','cart_no','<!--{$item.cart_no}-->'); return false;" class="btn color-focus">+</a>
                                </td>
                                <td><!--{$item.total_inctax|number_format}-->元</td>
                            </tr>
                            <!--{/foreach}-->
                            <tr>
                                <td colspan="5" class="tb-th">小計</td>
                                <td><!--{$tpl_total_inctax[$key]|number_format}-->元</td>
                            </tr>
                            <tr>
                                <td colspan="5" class="tb-th">合計</td>
                                <td><!--{$arrData[$key].total-$arrData[$key].deliv_fee|number_format}-->元</td>
                            </tr>
                        </table>
                        <div class="col-8 col-centered align-center">
                            <p>內容與金額符合請點擊下方"購買"按鈕</p>
                            <ul class="submit-button">
                              
                                <a href="<!--{$tpl_prev_url|h}-->"><img src="<!--{$smarty.const.HTTPS_URL}-->user_data/new/img/back-btn.png"></a>
                                <li><input type="image" name="submit" src="<!--{$smarty.const.HTTPS_URL}-->user_data/new/img/confirm-btn.png" border="0" alt="Submit" /></li>
                            </ul>
                        </div>
                        </form>
                    </div>
                    <!-- PC End-->
                    <!-- MB Start 已改正-->
                    <div class="product-mb">
                        <form name="form<!--{$key}-->" id="form<!--{$key}-->" method="post" action="?">
                        <input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME}-->" value="<!--{$transactionid}-->" />
                        <input type="hidden" name="mode" value="confirm" />
                        <input type="hidden" name="cart_no" value="" />
                        <input type="hidden" name="cartKey" value="<!--{$key}-->" />
                        <input type="hidden" name="category_id" value="<!--{$tpl_category_id|h}-->" />
                        <table class="product-mb-table">
                            <!--{foreach from=$cartItems[$key] item=item}-->
                            <tr>
                                <td class="mb-pic"><img src="<!--{$smarty.const.ROOT_URLPATH}-->resize_image.php?image=<!--{$item.productsClass.main_list_image|sfNoImageMainList|h}-->&amp;width=180&amp;height=180" alt="<!--{$item.productsClass.name|h}-->" /></td>
                                <td><div class="mb-title">
                                    <p><!--{$item.productsClass.name|h}--></p>
                                    <p><!--{$item.price|sfCalcIncTax|number_format}-->元</p></div>
                                </td>
                                <td class="mb-delete"><a href="?" onclick="fnFormModeSubmit('form<!--{$key}-->', 'delete', 'cart_no', '<!--{$item.cart_no}-->'); return false;"><img src="<!--{$smarty.const.HTTPS_URL}-->user_data/new/img/icon/icon-delete.png"></a></td>
                            </tr>
                            <tr>
                                <td colspan="3">
                                    <div class="mb-num">數量 <!--{$item.quantity}-->
                                        <a href="?" onclick="fnFormModeSubmit('form<!--{$key}-->','down','cart_no','<!--{$item.cart_no}-->'); return false;" class="btn">-</a>
                                        <a href="?" onclick="fnFormModeSubmit('form<!--{$key}-->','up','cart_no','<!--{$item.cart_no}-->'); return false;" class="btn color-focus">+</a><span >小計：<!--{$item.total_inctax|number_format}-->元</span>
                                    </div>
                                </td>
                                
                            </tr>
                            <!--{/foreach}-->
                            <tr>
                                <td colspan="3" class="align-right">
                                    <p>合計：<span><!--{$arrData[$key].total-$arrData[$key].deliv_fee|number_format}-->元</span></p>
                                </td>
                            </tr>
                        </table>
                      
                        <div class="col-8 col-centered align-center">
                            <ul class="submit-button">
                               
                                <a href="<!--{$tpl_prev_url|h}-->"><img src="<!--{$smarty.const.HTTPS_URL}-->user_data/new/img/back-btn.png"></a>
                                <li><input type="image" name="submit" src="<!--{$smarty.const.HTTPS_URL}-->user_data/new/img/confirm-btn.png" border="0" alt="Submit" /></li>
                            </ul>
                        </div>
                        </form>
                    </div>
                    <!-- MB End 已改正-->



      
        <!--{/foreach}-->
        <!--{else}-->
            <p class="empty align-center"><span class="attention">※ 目前購物車內無任何商品。</span></p>
            <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
        <!--{/if}-->
                </div>
            </div>
        </div>
    </div>
