<div class="W100 t_center">
    <div class="W1360 bread">
        <span class="f15 f_pink f_left"><a class="f_grey" href="/tw/">首頁 /</a> <font class="f_grey">會員中心 / </font>送貨地址管理</span>
    </div>
</div>

<div id="mypagecolumn" class="container sec-wrap">
    <!--{include file=$tpl_navi}-->
    <div id="mycontents_area">
        <div class="border_round">
            <h3 class="f21"><!--{$tpl_subtitle|h}--></h3>
            <p class="inforamtion">需要送貨至註冊地址以外的地方時可以在這裡增加其他送貨地址。<br />
            ※最多可增加至<span class="attention"><!--{$smarty.const.DELIV_ADDR_MAX|h}-->個</span>。</p>


            <!--{if $tpl_linemax > 0}-->
            <form name="form1" method="post" action="?" >
                <input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME}-->" value="<!--{$transactionid}-->" />
                <input type="hidden" name="mode" value="" />
                <input type="hidden" name="other_deliv_id" value="" />
                <input type="hidden" name="pageno" value="<!--{$tpl_pageno}-->" />

                <table summary="送貨地址" class="mypage_table">
                    <col width="15%" />
                    <col width="55%" />
                    <col width="15%" />
                    <col width="15%" />
                    <tr>
                        <th class="t_center">編號</th>
                        <th>地址</th>
                        <th class="t_center">變更</th>
                        <th class="t_center">刪除</th>

                    </tr>
                    <!--{section name=cnt loop=$arrOtherDeliv}-->
                        <tr>
                            <td class="t_center"><!--{$smarty.section.cnt.iteration}--></td>
                            <td>
                                <!--{* <!--{$arrOtherDeliv[cnt].zip01}-->-<!--{$arrOtherDeliv[cnt].zip02}--><br /> *}-->
                                <!--{$arrOtherDeliv[cnt].zipcode}--><br />
                                <!--{$arrOtherDeliv[cnt].addr01|h}--><!--{$arrOtherDeliv[cnt].addr02|h}--><br />
                                <!--{$arrOtherDeliv[cnt].name01|h}-->&nbsp;<!--{$arrOtherDeliv[cnt].name02|h}-->
                            </td>
                            <td class="t_center">
                                <a href="./delivery_addr.php" onclick="win02('./delivery_addr.php?other_deliv_id=<!--{$arrOtherDeliv[cnt].other_deliv_id}-->','deliv_disp','700','740'); return false;">
                                    <img src="../user_data/new_201811/img/icon/btn-edit.svg" alt="" class="edit">
                                </a>
                            </td>
                            <td class="t_center">
                                <a href="#" class="delete" onclick="fnModeSubmit('delete','other_deliv_id','<!--{$arrOtherDeliv[cnt].other_deliv_id}-->'); return false;"></a>
                            </td>
                        </tr>
                    <!--{/section}-->
                </table>

                <!--{if $tpl_linemax < $smarty.const.DELIV_ADDR_MAX}-->
                <!--{* 退会時非表示 *}-->
                <!--{if $tpl_login}-->
                    <p class="add_address">
                        <a class="bt01 btn f_white bg_red edit_deliv f_right" href="<!--{$smarty.const.ROOT_URLPATH}-->mypage/delivery_addr.php" onclick="win03('./delivery_addr.php','delivadd','1080','1080'); return false;" target="_blank">新增送貨地址</a>
                    </p>
                <!--{/if}-->
                <!--{/if}-->
            </form>
            <!--{else}-->
            <p class="delivempty add_address">
                <strong>還沒有增加新的地址</strong>
                <a class="bt01 btn f_white bg_red edit_deliv f_right" href="<!--{$smarty.const.ROOT_URLPATH}-->mypage/delivery_addr.php" onclick="win03('./delivery_addr.php','delivadd','1080','1080'); return false;" target="_blank">新增送貨地址</a>
            </p>
            <!--{/if}-->
        </div>
        
    </div>
</div>


<link rel="stylesheet" href="../user_data/new_201811/css/new_init.css" />
<link rel="stylesheet" href="../user_data/new_201811/css/new_mypage.css" />

