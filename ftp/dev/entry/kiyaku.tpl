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
<link rel="stylesheet" href="../user_data/new_201811/css/new_init.css" />
<link rel="stylesheet" href="../user_data/new_201811/css/new_login.css" />

<div id="mypagecolumn"  class="container sec-wrap">
    <div id="kiyaku">
        <h2>
            註冊條款
            <font>MEMBER</font>
        </h2>
        <p class="message">歡迎您在MANARA進行消費；請您先詳細閱讀以下約定條款：</p>
        <p>本約定條款的目的，是為了保護MANARA「曼娜麗股份有限公司」以及您的利益，如果您點選「我同意」或類似語意的選項、或在MANARA進行訂購、付款、消費或進行相關行為，就視為您事先已經知悉、並同意本約定條款的所有約定。</p>

        <form name="form2" id="form2" method="post" action="?">
            <input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME}-->" value="<!--{$transactionid}-->" />
            <textarea name="textfield" style="width:100%;height:200px;overflow-y: scroll; overflow-x: hidden;" readonly="readonly"><!--{"\n"}--><!--{$tpl_kiyaku_text|h}--></textarea>

            <div class="btn_area">
                <a href="<!--{$smarty.const.TOP_URLPATH}-->" class="btn f_black">
                    不同意
                </a>
                <a href="<!--{$smarty.const.ENTRY_URL}-->" class="btn f_white bg_red">
                <!--ENTRY_URL-->
                    同意
                </a>
            </div>

        </form>
    </div>
</div>
