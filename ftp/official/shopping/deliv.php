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
<div id="undercolumn" class="container sec-wrap">
<div id="main_text">
            <div class="columns-12">
                <div id="shoppingCart" class="col-md-8 col-sm-10 col-xs-12 col-offset-2">
    <div id="undercolumn_shopping">
        <p class="flow_area">
            <img src="<!--{$TPL_URLPATH}-->img/picture/img_flow_01.jpg"  />
        </p>
        <h2 class="title"><!--{$tpl_title|h}--></h2>

        <div id="address_area" class="clearfix">
                <p>請從以下地址裡選擇您要送貨的地址，點擊「送往選擇的地址」按鈕。</p>
                <!--{if $tpl_addrmax < $smarty.const.DELIV_ADDR_MAX}-->
                    <p>若以下地址裡沒有您要送貨的地址，請點擊「增加送貨地址」。</p>
                <!--{/if}-->
                <p class="mini attention">※最多可增加<!--{$smarty.const.DELIV_ADDR_MAX|h}-->個地址。</p>
            <!--{if $smarty.const.USE_MULTIPLE_SHIPPING !== false}-->
                <div class="add_multiple">
                    <p>這個商品需要送往<br />多個地址嗎？</p>
                    <a href="javascript:;" onclick="fnModeSubmit('multiple', '', ''); return false" onmouseover="chgImg('<!--{$TPL_URLPATH}-->img/button/btn_several_address_on.jpg','several');" onmouseout="chgImg('<!--{$TPL_URLPATH}-->img/button/btn_several_address.jpg','several');"><img src="<!--{$TPL_URLPATH}-->img/button/btn_several_address.jpg"  name="several" id="several" /></a>
                </div>
            <!--{/if}-->
        </div>

        <!--{if $tpl_addrmax < $smarty.const.DELIV_ADDR_MAX}-->
            <p class="addbtn">
                <a href="<!--{$smarty.const.ROOT_URLPATH}-->mypage/delivery_addr.php" onclick="win02('<!--{$smarty.const.ROOT_URLPATH}-->mypage/delivery_addr.php?page=<!--{$smarty.server.SCRIPT_NAME|h}-->','new_deiv','1080','1080'); return false;" onmouseover="chgImg('<!--{$TPL_URLPATH}-->img/button/btn_add_address_on.jpg','addition');" onmouseout="chgImg('<!--{$TPL_URLPATH}-->img/button/btn_add_address.jpg','addition');"><img src="<!--{$TPL_URLPATH}-->img/button/btn_add_address.jpg" name="addition" id="addition" /></a>
            </p>
        <!--{/if}-->

        <form name="form1" id="form1" method="post" action="?">
        <input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME}-->" value="<!--{$transactionid}-->" />
        <input type="hidden" name="mode" value="customer_addr" />
        <input type="hidden" name="uniqid" value="<!--{$tpl_uniqid}-->" />
        <input type="hidden" name="other_deliv_id" value="" />
        <!--{if $arrErr.deli != ""}-->
            <p class="attention"><!--{$arrErr.deli}--></p>
        <!--{/if}-->
        <table summary="指定送貨地址" style="table-layout:fixed;word-wrap:break-word;word-break;break-all;">
            <col width="10%" />
            <col width="20%" />
            <col width="50%" />
            <col width="10%" />
            <col width="10%" />
            <tr>
                <th class="alignC">選擇</th>
                <th class="alignC">地址種類</th>
                <th class="alignC">配送資訊</th>
                <th class="alignC">變更</th>
                <th class="alignC">刪除</th>
            </tr>
            <!--{section name=cnt loop=$arrAddr}-->
                <tr>
                    <td class="alignC">
                        <!--{if $smarty.section.cnt.first}-->
                            <input type="radio" name="deliv_check" id="chk_id_<!--{$smarty.section.cnt.iteration}-->" value="-1" <!--{if $arrForm.deliv_check.value == "" || $arrForm.deliv_check.value == -1}--> checked="checked"<!--{/if}--> />
                        <!--{else}-->
                            <input type="radio" name="deliv_check" id="chk_id_<!--{$smarty.section.cnt.iteration}-->" value="<!--{$arrAddr[cnt].other_deliv_id}-->"<!--{if $arrForm.deliv_check.value == $arrAddr[cnt].other_deliv_id}--> checked="checked"<!--{/if}--> />
                        <!--{/if}-->
                    </td>
                    <td class="alignC">
                        <label for="chk_id_<!--{$smarty.section.cnt.iteration}-->">
                            <!--{if $smarty.section.cnt.first}-->
                                會員註冊地址
                            <!--{else}-->
                                增加送貨地址
                            <!--{/if}-->
                        </label>
                    </td>
                    <td>
                        <!--{assign var=key value=$arrAddr[cnt].pref}-->
                        <!--{$arrPref[$key]}--><!--{$arrAddr[cnt].addr01|h}--><!--{$arrAddr[cnt].addr02|h}--><br />
                        <!--{$arrAddr[cnt].name01|h}--> <!--{$arrAddr[cnt].name02|h}-->
                    </td>
                    <td class="alignC">
                        <!--{if !$smarty.section.cnt.first}-->
                            <a href="<!--{$smarty.const.ROOT_URLPATH}-->mypage/delivery_addr.php" onclick="win02('<!--{$smarty.const.ROOT_URLPATH}-->mypage/delivery_addr.php?page=<!--{$smarty.server.SCRIPT_NAME|h}-->&amp;other_deliv_id=<!--{$arrAddr[cnt].other_deliv_id}-->','new_deiv','600','640'); return false;">變更</a>
                            <!--{else}-->
                                -
                            <!--{/if}-->
                    </td>
                    <td class="alignC">
                        <!--{if !$smarty.section.cnt.first}-->
                            <a href="?" onclick="fnModeSubmit('delete', 'other_deliv_id', '<!--{$arrAddr[cnt].other_deliv_id}-->'); return false">刪除</a>
                            <!--{else}-->
                                -
                            <!--{/if}-->
                    </td>
                </tr>
            <!--{/section}-->
        </table>

        <div class="btn_area">
            <ul>
                <li>
                    <a href="<!--{$smarty.const.CART_URLPATH}-->" onmouseover="chgImgImageSubmit('<!--{$TPL_URLPATH}-->img/button/btn_back_on.jpg',back03)" onmouseout="chgImgImageSubmit('<!--{$TPL_URLPATH}-->img/button/btn_back.jpg',back03)">
                    <img src="<!--{$TPL_URLPATH}-->img/button/btn_back.jpg" border="0" name="back03" id="back03" /></a>
                </li>
                <li>
                <input type="image" onmouseover="chgImgImageSubmit('<!--{$TPL_URLPATH}-->img/button/btn_next_on.jpg',this)" onmouseout="chgImgImageSubmit('<!--{$TPL_URLPATH}-->img/button/btn_next.jpg',this)" src="<!--{$TPL_URLPATH}-->img/button/btn_next.jpg" name="send_button" id="send_button" />
                </li>
            </ul>
        </div>

        </form>
    </div>
</div>
</div></div></div>