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
        <!--{if $smarty.session.apply_order == 'COMPLETE'}-->
            <img src="<!--{$TPL_URLPATH}-->img/picture/img_flow_04.jpg"  />
        <!--{/if}-->
        </p>
        <h2 class="title"><!--{$tpl_title|h}--></h2>
        <!--{* エラーメッセージがある場合は表示される *}-->
        <span class="attention"><!--{$tpl_errormessage|h}--></span>
        
        <!--{if $smarty.session.apply_order == 'COMPLETE'}-->
          <!-- ▼その他決済情報を表示する場合は表示 -->
          <!--{if $arrOther.title.value}-->
              <p><span class="attention">*<!--{$arrOther.title.name}--> 信息</span><br />
                  <!--{foreach key=key item=item from=$arrOther}-->
                      <!--{if $key != "title"}-->
                          <!--{if $item.name != ""}-->
                              <!--{$item.name}-->:
                          <!--{/if}-->
                              <!--{$item.value|nl2br}--><br />
                      <!--{/if}-->
                  <!--{/foreach}-->
              </p>
          <!--{/if}-->
          <!-- ▲コンビに決済の場合には表示 -->

          <div id="complete_area">
              <p class="message">非常感謝您購買<!--{$arrInfo.shop_name|h}-->的商品。</p>
            <p>我們將寄送訂購資訊至您的電子郵件。<br />
                期待您下次光臨。</p>
     
              <div class="shop_information">
                  <p class="name"><!--{$arrInfo.shop_name|h}--></p>
                  <p>TEL:<!--{$arrInfo.tel01}-->-<!--{$arrInfo.tel02}-->-<!--{$arrInfo.tel03}--> <!--{if $arrInfo.business_hour != ""}-->(受理時間<!--{$arrInfo.business_hour}-->)<!--{/if}--><br />
                  E-mail:<a href="mailto:<!--{$arrInfo.email02|escape:'hex'}-->"><!--{$arrInfo.email02|escape:'hexentity'}--></a>
                  </p>
              </div>
          </div>
          
         <!--{else}-->
           <div id="complete_area">
             <p class="message attention">[注] 您的订单未成功完成。</p>
             <p class="attention">这是非常抱歉给您添麻烦，但是请直接从下面的查询检查给管理员。</p>
              <div class="shop_information">
                  <p class="name"><!--{$arrInfo.shop_name|h}--></p>
                  <p>TEL:<!--{$arrInfo.tel01}-->-<!--{$arrInfo.tel02}-->-<!--{$arrInfo.tel03}--> <!--{if $arrInfo.business_hour != ""}-->(受理時間<!--{$arrInfo.business_hour}-->)<!--{/if}--><br />
                  E-mail:<a href="mailto:<!--{$arrInfo.email02|escape:'hex'}-->"><!--{$arrInfo.email02|escape:'hexentity'}--></a>
                  </p>
              </div>
          </div>
         <!--{/if}-->

        <div class="btn_area">
            <ul>
                <li>
                    <a href="<!--{$smarty.const.TOP_URLPATH}-->" onmouseover="chgImg('<!--{$TPL_URLPATH}-->img/button/btn_toppage_on.jpg','b_toppage');" onmouseout="chgImg('<!--{$TPL_URLPATH}-->img/button/btn_toppage.jpg','b_toppage');">
                        <img src="<!--{$TPL_URLPATH}-->img/button/btn_toppage.jpg"  border="0" name="b_toppage" /></a>
                </li>
            </ul>
        </div>

    </div>
</div>

</div></div></div>