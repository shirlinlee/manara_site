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

<div id="undercolumn">
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
            <p>我們會給您寄送購物郵件。<br />
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

<!--130812-->
<!-- Google Code for CV&#12479;&#12464; Conversion Page -->
<script type="text/javascript">
/* <![CDATA[ */
var google_conversion_id = 985867658;
var google_conversion_language = "en";
var google_conversion_format = "2";
var google_conversion_color = "ffffff";
var google_conversion_label = "4Z8ICN6wyQYQisuM1gM";
var google_conversion_value = 0;
/* ]]> */
</script>
<script type="text/javascript" src="//www.googleadservices.com/pagead/conversion.js">
</script>
<noscript>
<div style="display:inline;">
<img height="1" width="1" style="border-style:none;"  src="//www.googleadservices.com/pagead/conversion/985867658/?value=0&amp;label=4Z8ICN6wyQYQisuM1gM&amp;guid=ON&amp;script=0"/>
</div>
</noscript>
<!--131212-->
<!--131212-->
<script type="text/javascript">
/* <![CDATA[ */
var google_conversion_id = 985867658;
var google_custom_params = window.google_tag_params;
var google_remarketing_only = true;
/* ]]> */
</script>
<script type="text/javascript" src="//www.googleadservices.com/pagead/conversion.js">
</script>
<noscript>
<div style="display:inline;">
<img height="1" width="1" style="border-style:none;" src="//googleads.g.doubleclick.net/pagead/viewthroughconversion/985867658/?value=0&amp;guid=ON&amp;script=0"/>
</div>
</noscript>

<script type="text/javascript" class="microad_blade_track">
<!--
var microad_blade_gl = microad_blade_gl || { 'params' : new Array(), 'complete_map' : new Object() };
(function() {
var param = {'co_account_id' : '7888', 'group_id' : 'convtrack22754', 'country_id' : '10', 'ver' : '2.1.0'};
microad_blade_gl.params.push(param);

var src = (location.protocol == 'https:')
? 'https://d-cache.microadinc.com/js/blade_track_gl.js' : 'http://d-cache.microadinc.com/js/blade_track_gl.js';

var bs = document.createElement('script');
bs.type = 'text/javascript'; bs.async = true;
bs.charset = 'utf-8'; bs.src = src;

var s = document.getElementsByTagName('script')[0];
s.parentNode.insertBefore(bs, s);
})();
-->
</script>


<!--140312-->
<!--FBCVtag-->
<!-- Facebook Conversion Code for CVtag -->
<script type="text/javascript">
var fb_param = {};
fb_param.pixel_id = '6019327723914';
fb_param.value = '0.00';
fb_param.currency = 'JPY';
(function(){
  var fpw = document.createElement('script');
  fpw.async = true;
  fpw.src = '//connect.facebook.net/en_US/fp.js';
  var ref = document.getElementsByTagName('script')[0];
  ref.parentNode.insertBefore(fpw, ref);
})();
</script>
<noscript><img height="1" width="1" alt="" style="display:none"
src="https://www.facebook.com/offsite_event.php?id=6019327723914&amp;value=0
&amp;currency=JPY" /></noscript>
<!--FBCVtag-->

<script type="text/javascript" src="https://stars-n.com/ac/action.js"></script>
<script type="text/javascript">
var adCid = 'AD000362'; //広告ID(固定)
var adUid = '<!--{$order_id}-->'; //注文番号
var adPid = '1'; //成果番号
var adAmount = ''; //売上合計金額(定率報酬の場合のみ)
adConversion(adCid,adUid,adPid,adAmount);
</script>

<!--141128-->
<!--1-->
<!--2-->
<!---->


<!-- Facebook Conversion Code for ?? -->
<script>(function() {
  var _fbq = window._fbq || (window._fbq = []);
  if (!_fbq.loaded) {
    var fbds = document.createElement('script');
    fbds.async = true;
    fbds.src = '//connect.facebook.net/en_US/fbds.js';
    var s = document.getElementsByTagName('script')[0];
    s.parentNode.insertBefore(fbds, s);
    _fbq.loaded = true;
  }
})();
window._fbq = window._fbq || [];
window._fbq.push(['track', '6020877919333', {'value':'0.01','currency':'USD'}]);
</script>
<noscript><img height="1" width="1" alt="" style="display:none" src="https://www.facebook.com/tr?ev=6020877919333&amp;cd[value]=0.01&amp;cd[currency]=USD&amp;noscript=1" /></noscript>




<script type="application/javascript" src="https://s.yimg.com/wi/ytc.js"></script>
<script type="application/javascript">
YAHOO.ywa.I13N.fireBeacon(
[
{
"projectId" : "1000842632465",
"coloId" : "SP",
"properties" : {
/*"documentName" : "",*/
"pixelId" : "23653",
"qstrings" : {

}
}
}
]
);
</script>




<script type="application/javascript" src="https://s.yimg.com/wi/ytc.js"></script>
<script type="application/javascript">
YAHOO.ywa.I13N.fireBeacon(
[
{
"projectId" : "1000842632465",
"coloId" : "SP",
"properties" : {
/*"documentName" : "",*/
"pixelId" : "23677",
"qstrings" : {

}
}
}
]
);
</script>

<!-- ▼2016/03/08 mod @ hel -->
<script type="application/javascript">(function(w,d,t,r,u){w[u]=w[u]||[];w[u].push({'projectId':'1000842632465','properties':{'pixelId':'23677'}});var s=d.createElement(t);s.src=r;s.async=true;s.onload=s.onreadystatechange=function(){var y,rs=this.readyState,c=w[u];if(rs&&rs!="complete"&&rs!="loaded"){return}try{y=YAHOO.ywa.I13N.fireBeacon;w[u]=[];w[u].push=function(p){y([p])};y(c)}catch(e){}};var scr=d.getElementsByTagName(t)[0],par=scr.parentNode;par.insertBefore(s,scr)})(window,document,"script","https://s.yimg.com/wi/ytc.js","dotq");</script>
<!-- ▲2016/03/08 mod @ hel End -->
<!-- ▼2016/03/08 ptengine -->
<script type="text/javascript">
	  window._pt_lt = new Date().getTime();
	  window._pt_sp_2 = [];
	  _pt_sp_2.push('setAccount,7da31f24');
	  var _protocol = (("https:" == document.location.protocol) ? " https://" : " http://");
	  (function() {
		var atag = document.createElement('script'); atag.type = 'text/javascript'; atag.async = true;
		atag.src = _protocol + 'js.ptengine.jp/pta.js';
		var stag = document.createElement('script'); stag.type = 'text/javascript'; stag.async = true;
		stag.src = _protocol + 'js.ptengine.jp/pts.js';
		var s = document.getElementsByTagName('script')[0]; 
		s.parentNode.insertBefore(atag, s);s.parentNode.insertBefore(stag, s);
	  })();
</script>
<!-- ▲2016/03/08 ptengine -->

<!-- ▼2016/03/17 mod @ hel -->
<script type="application/javascript">(function(w,d,t,r,u){w[u]=w[u]||[];w[u].push({'projectId':'1000842632465','properties':{'pixelId':'23676'}});var s=d.createElement(t);s.src=r;s.async=true;s.onload=s.onreadystatechange=function(){var y,rs=this.readyState,c=w[u];if(rs&&rs!="complete"&&rs!="loaded"){return}try{y=YAHOO.ywa.I13N.fireBeacon;w[u]=[];w[u].push=function(p){y([p])};y(c)}catch(e){}};var scr=d.getElementsByTagName(t)[0],par=scr.parentNode;par.insertBefore(s,scr)})(window,document,"script","https://s.yimg.com/wi/ytc.js","dotq");</script>
<!-- ▲2016/03/17 mod @ hel -->