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
<script type="text/javascript">
// test
  var _amount;
  var _orderInfo;
  var _name01;
  var _name02;
  var _tel01;

  // API認証
  var _apiUrl             = '<!--{$smarty.const.API_URL}-->';
  var _apidbApplicationId = '<!--{$smarty.const.APIDB_APPLICATION_ID}-->';
  var _apidbAccountId     = '<!--{$smarty.const.APIDB_ACCOUNT_ID}-->';
  var _apidbAccountSecret = '<!--{$smarty.const.APIDB_ACCOUNT_SECRET}-->';
  var _apiGenkey          = '<!--{$smarty.const.API_GENKEY}-->';
  var _timezone          = '<!--{$smarty.const.TIMEZONE}-->';

//<![CDATA[
    var send = true;

    function fnCheckSubmit() {
        if(send) {
            send = false;
            return true;
        } else {
            alert("Please wait while processing transaction.");
            return false;
        }
    }

    $(document).ready(function() {
    
        $('a.expansion').facebox({
            loadingImage : '<!--{$smarty.const.ROOT_URLPATH}-->js/jquery.facebox/loading.gif',
            closeImage   : '<!--{$smarty.const.ROOT_URLPATH}-->js/jquery.facebox/closelabel.png'
        });
        
        _order_id = '<!--{$smarty.session.order_id}-->';
        _shipping_date = '<!--{$smarty.session.earliest_shipping_date}-->';
        _amount = '<!--{$tpl_amount}-->';
        _orderInfo = '<!--{$tpl_orderInfo}-->';
        _name01 = '<!--{$smarty.session.customer.name01}-->';
        _name02 = '<!--{$smarty.session.customer.name02}-->';
        _tel01  = '<!--{$smarty.session.customer.tel01}-->';


        if ( typeof sessionStorage === 'undefined' ) {
          alert('抱歉！現在閣下使用的瀏覽器不支援刷卡付款。\n請利用較新版本的瀏覽器或使用貨到付款。');
          return;
        }

        sessionStorage.setItem("_order_id",_order_id);
        sessionStorage.setItem("_shipping_date",_shipping_date);
        sessionStorage.setItem("apiUrl",_apiUrl);
        sessionStorage.setItem("apidbApplicationId",_apidbApplicationId);
        sessionStorage.setItem("apidbAccountId",_apidbAccountId);
        sessionStorage.setItem("apidbAccountSecret",_apidbAccountSecret);
        sessionStorage.setItem("apiGenkey",_apiGenkey);
        sessionStorage.setItem("timezone",_timezone);

        sessionStorage.setItem("amount",_amount);
        sessionStorage.setItem("orderInfo",_orderInfo);
        sessionStorage.setItem("name01",_name01);
        sessionStorage.setItem("name02",_name02);
        sessionStorage.setItem("tel01",_tel01);
        
        window.location.href = '<!--{$smarty.const.ROOT_URLPATH}-->shippingcard/PaymentStartEccube.html';

    });


/*
        function opneSunTechForm(btn){
           btn.disabled=true;
           window.open(
              '<!--{$smarty.const.ROOT_URLPATH}-->shippingcard/PaymentStartEccube.html',
              'SunTech',
              'width=600, height=800, menubar=no, toolbar=no, scrollbars=yes'
            );
        }
*/


//]]></script>





<div id="undercolumn">
    <div id="undercolumn_shopping">
        <h2 class="title"><!--{$tpl_title|h}--></h2>
        <form name="form1" id="form1" method="post" action="?">


        <div class="btn_area">
            <ul>
                <li><a class="bt04" href="?mode=return">返回</a></li>
<!--{*                <li><a class="bt02" href="?mode=confirm">完了</a></li> *}-->
            </ul>
        </div>
        
    </form>
    </div>
</div>
