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

<div id="mynavi_area">
    <!--{strip}-->
        <ul class="mynavi_list clearfix">

            <!--{* 会員状態 *}-->
            <!--{if $tpl_login}-->
                <li class="f15"><a href="./<!--{$smarty.const.DIR_INDEX_PATH}-->" class="<!--{if $tpl_mypageno == 'index'}--> selected<!--{/if}-->">
                    訂單查詢</a></li>

                <li class="f15"><a href="change.php" class="<!--{if $tpl_mypageno == 'change'}--> selected<!--{/if}-->">
                    會員資料</a></li>
                <li class="f15"><a href="delivery.php" class="<!--{if $tpl_mypageno == 'delivery'}--> selected<!--{/if}-->">
                    配送地址管理</a></li>
<!--{* comment out 会員取消
                <li class="f15"><a href="refusal.php" class="<!--{if $tpl_mypageno == 'refusal'}--> selected<!--{/if}-->">
                    取消會員資格</a></li>
*}-->
                <li class="f15"><a href="index.php?mode=logout" class="<!--{if $tpl_mypageno == 'refusal'}--> selected<!--{/if}-->">
                    登出</a></li>

            <!--{* 退会状態 *}-->
            <!--{else}-->
                <li class="f15"><a href="<!--{$smarty.const.TOP_URLPATH}-->" class="<!--{if $tpl_mypageno == 'index'}--> selected<!--{/if}-->">
                    訂單查詢</a></li>
                <!--{if $smarty.const.OPTION_FAVORITE_PRODUCT == 1}-->
                    <li class="f15"><a href="<!--{$smarty.const.TOP_URLPATH}-->" class="<!--{if $tpl_mypageno == 'favorite'}--> selected<!--{/if}-->">
                        收藏夾</a></li>
                <!--{/if}-->
                <li class="f15"><a href="<!--{$smarty.const.TOP_URLPATH}-->" class="<!--{if $tpl_mypageno == 'change'}--> selected<!--{/if}-->">
                    會員資料<</a></li>
                <li class="f15"><a href="<!--{$smarty.const.TOP_URLPATH}-->" class="<!--{if $tpl_mypageno == 'delivery'}--> selected<!--{/if}-->">
                    配送地址管理</a></li>
                <li class="f15"><a href="<!--{$smarty.const.TOP_URLPATH}-->" class="<!--{if $tpl_mypageno == 'refusal'}--> selected<!--{/if}-->">
                    取消會員資格</a></li>
                <li class="f15"><a href="<!--{$smarty.const.TOP_URLPATH}-->" class="<!--{if $tpl_mypageno == 'refusal'}--> selected<!--{/if}-->">
                    登出</a></li>
            <!--{/if}-->
        </ul>
        
        <!--▼現在のポイント-->
        <!--{if $point_disp !== false}-->
            <div class="point_announce clearfix">
                <p class="f18">您好&nbsp;
                    <span class="user_name"><font class="f_red"><!--{$CustomerName1|h}--> <!--{$CustomerName2|h}--></font> 先生/女士</span>
                    <!--{if $smarty.const.USE_POINT !== false}-->&nbsp;
                        現在您所持有的積分為&nbsp;<span class="point st"><!--{$CustomerPoint|number_format|default:"0"|h}--> pt </span>
                    <!--{/if}-->
                </p>
            </div>
        <!--{/if}-->
        <!--▲現在のポイント-->
    <!--{/strip}-->

</div>
<!--▲NAVI-->
