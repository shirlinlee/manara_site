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

<col class="W25" />
    <col />
    <tr>
        <td>姓名</td>
        <td>
            <!--{assign var=key1 value="`$prefix`name01"}-->
            <!--{assign var=key2 value="`$prefix`name02"}-->
            <!--{if $arrErr[$key1] || $arrErr[$key2]}-->
                <div class="attention"><!--{$arrErr[$key1]}--><!--{$arrErr[$key2]}--></div>
            <!--{/if}-->
            <input type="text" name="<!--{$key1}-->" value="<!--{$arrForm[$key1]|h}-->" maxlength="<!--{$smarty.const.STEXT_LEN}-->" style="<!--{$arrErr[$key1]|sfGetErrorColor}-->;" class="box120" />
            <input type="text" name="<!--{$key2}-->" value="<!--{$arrForm[$key2]|h}-->" maxlength="<!--{$smarty.const.STEXT_LEN}-->" style="<!--{$arrErr[$key2]|sfGetErrorColor}-->;" class="box120" />
        </td>
    </tr>
    <tr>
        <td>郵遞區號</td>
        <td>
            <!--{* <!--{assign var=key1 value="`$prefix`zip01"}--> *}-->
            <!--{* <!--{assign var=key2 value="`$prefix`zip02"}--> *}-->
            <!--{assign var=key1 value="`$prefix`zipcode"}-->
            <!--{assign var=key3 value="`$prefix`pref"}-->
            <!--{assign var=key4 value="`$prefix`addr01"}-->
            <!--{assign var=key5 value="`$prefix`addr02"}-->

            <!--{*
            <!--{if $arrErr[$key1] || $arrErr[$key2]}-->
                <div class="attention"><!--{$arrErr[$key1]}--><!--{$arrErr[$key2]}--></div>
            <!--{/if}-->
            *}-->
            <!--{if $arrErr[$key1]}-->
                <div class="attention"><!--{$arrErr[$key1]}--></div>
            <!--{/if}-->

        
            <!--{* &nbsp;<input type="text" name="<!--{$key1}-->" value="<!--{$arrForm[$key1]|h}-->" maxlength="<!--{$smarty.const.ZIP01_LEN}-->" style="<!--{$arrErr[$key1]|sfGetErrorColor}-->; ime-mode: disabled;" class="box100" />&nbsp;-&nbsp;<input type="text" name="<!--{$key2}-->" value="<!--{$arrForm[$key2]|h}-->" maxlength="<!--{$smarty.const.ZIP02_LEN}-->" style="<!--{$arrErr[$key2]|sfGetErrorColor}-->; ime-mode: disabled;" class="box100" />&nbsp; *}-->
            <input type="text" id="zipcode" name="<!--{$key1}-->" value="<!--{$arrForm[$key1]|h}-->" maxlength="<!--{$smarty.const.ZIPCODE_LEN}-->" style="<!--{$arrErr[$key1]|sfGetErrorColor}-->; ime-mode: disabled;" class="box100" />&nbsp;
            <a class="bt01 f_red" href="javascript:return false;" onclick="showZipSearchDialog();" target="_blank">郵遞區號檢索</a>

            <!--{*
            <p class="zipimg">
                <a class="bt01 f_red" href="<!--{$smarty.const.ROOT_URLPATH}-->input_zip.php" onclick="fnCallAddress('<!--{$smarty.const.INPUT_ZIP_URLPATH}-->', '<!--{$key1}-->', '<!--{$key2}-->', '<!--{$key3}-->', '<!--{$key4}-->'); return false;" target="_blank">自動帶入地址</a>
                &nbsp;<span class="mini">輸入郵遞區號後，請點選。</span>
            </p>
            *}-->
        </td>
    </tr>
    <tr>
        <td>地址</td>
        <td>
            <!--{if $arrErr[$key3] || $arrErr[$key4] || $arrErr[$key5]}-->
                <div class="attention"><!--{$arrErr[$key3]}--><!--{$arrErr[$key4]}--><!--{$arrErr[$key5]}--></div>
            <!--{/if}-->
            <select name="<!--{$key3}-->" id="pref" style="<!--{$arrErr[$key3]|sfGetErrorColor}-->">
                    <option value="" selected="selected">請選擇城市</option>
                    <!--{html_options options=$arrPref selected=$arrForm[$key3]}-->
            </select>
            <p><input type="text" id="addr01" name="<!--{$key4}-->" value="<!--{$arrForm[$key4]|h}-->" class="box300" style="<!--{$arrErr[$key4]|sfGetErrorColor}-->;" /><br />
                <!--{$smarty.const.SAMPLE_ADDRESS1}--></p>
            <p><input type="text" id="addr02" name="<!--{$key5}-->" value="<!--{$arrForm[$key5]|h}-->" class="box300" style="<!--{$arrErr[$key5]|sfGetErrorColor}-->;" /><br />
                <!--{$smarty.const.SAMPLE_ADDRESS2}--><span class="attention">。 請務必註記大樓名稱。</span></p>
        </td>
    </tr>
    <tr>
        <td>電話</td>
        <td>
            <!--{assign var=key1 value="`$prefix`tel01"}-->
            <!--{assign var=key2 value="`$prefix`tel02"}-->
            <!--{assign var=key3 value="`$prefix`tel03"}-->
            <!--{if $arrErr[$key1] || $arrErr[$key2] || $arrErr[$key3]}-->
                <div class="attention"><!--{$arrErr[$key1]}--><!--{$arrErr[$key2]}--><!--{$arrErr[$key3]}--></div>
            <!--{/if}-->
            <input type="text" name="<!--{$key1}-->" value="<!--{$arrForm[$key1]|h}-->" maxlength="<!--{$smarty.const.TEL_ITEM_LEN}-->" style="<!--{$arrErr[$key1]|sfGetErrorColor}-->; ime-mode: disabled;" class="box240" />
            <span class="attention">&nbsp;</span>&nbsp;<input type="text" name="<!--{$key2}-->" value="<!--{$arrForm[$key2]|h}-->" maxlength="<!--{$smarty.const.TEL_ITEM_LEN}-->" style="<!--{$arrErr[$key2]|sfGetErrorColor}-->; ime-mode: disabled;" class="box240" />
            <!--{*  <input type="text" name="<!--{$key3}-->" value="<!--{$arrForm[$key3]|h}-->" maxlength="<!--{$smarty.const.TEL_ITEM_LEN}-->" style="<!--{$arrErr[$key3]|sfGetErrorColor}-->; ime-mode: disabled;" class="box60" /> *}-->
        </td>
    </tr>

    <!--{if $flgFields > 1}-->
    <tr>
        <td>電子郵件</td>
        <td>
            <!--{assign var=key1 value="`$prefix`email"}-->
            <!--{if $arrErr[$key1]}-->
                <div class="attention"><!--{$arrErr[$key1]}--><!--{$arrErr[$key2]}--></div>
            <!--{/if}-->
            <input type="text" name="<!--{$key1}-->" value="<!--{$arrForm[$key1]|h}-->" style="<!--{$arrErr[$key1]|sfGetErrorColor}-->; ime-mode: disabled;" class="box240" /><br />
        </td>
    </tr>
    <tr>
        <td>再次輸入電子郵件</td>
        <td>
            <!--{assign var=key2 value="`$prefix`email02"}-->
            <!--{if $arrErr[$key2]}-->
                <div class="attention"><!--{$arrErr[$key1]}--><!--{$arrErr[$key2]}--></div>
            <!--{/if}-->
            <input type="text" name="<!--{$key2}-->" value="<!--{$arrForm[$key2]|h}-->" style="<!--{$arrErr[$key1]|cat:$arrErr[$key2]|sfGetErrorColor}-->; ime-mode: disabled;" class="box240" placeholder="請再次輸入以利確認"/><br />
        </td>
    </tr>
    <!--{if $emailMobile}-->
        <tr>
            <td>(手機)電子郵件</td>
            <td>
                <!--{assign var=key1 value="`$prefix`email_mobile"}-->
                <!--{assign var=key2 value="`$prefix`email_mobile02"}-->
                <!--{if $arrErr[$key1] || $arrErr[$key2]}-->
                <div class="attention"><!--{$arrErr[$key1]}--><!--{$arrErr[$key2]}--></div>
                <!--{/if}-->
                <input type="text" name="<!--{$key1}-->" value="<!--{$arrForm[$key1]|h}-->" style="<!--{$arrErr[$key1]|sfGetErrorColor}-->; ime-mode: disabled;" maxlength="<!--{$smarty.const.MTEXT_LEN}-->" class="box240" /><br />
                <input type="text" name="<!--{$key2}-->" value="<!--{$arrForm[$key2]|h}-->" style="<!--{$arrErr[$key1]|cat:$arrErr[$key2]|sfGetErrorColor}-->; ime-mode: disabled;" maxlength="<!--{$smarty.const.MTEXT_LEN}-->" class="box240" /><br />
                <span class="attention mini">請再次輸入以利確認</span>
            </td>
        </tr>
    <!--{/if}-->
    <tr>
        <td>性別</td>
        <td>
            <!--{assign var=key1 value="`$prefix`sex"}-->
            <!--{if $arrErr[$key1]}-->
                <div class="attention"><!--{$arrErr[$key1]}--></div>
            <!--{/if}-->
            <span style="<!--{$arrErr[$key1]|sfGetErrorColor}-->">
<!--{*                <input type="radio" id="none" name="<!--{$key1}-->" value="0" <!--{if $arrForm[$key1] eq 0}--> checked="checked" <!--{/if}--> /><label for="none">未選擇</label> *}-->
                <input type="radio" id="man" name="<!--{$key1}-->" value="1" <!--{if $arrForm[$key1] eq 1}--> checked="checked" <!--{/if}--> /><label for="man"> 男性 </label>
                <input type="radio" id="woman" name="<!--{$key1}-->" value="2" <!--{if $arrForm[$key1] eq 2}--> checked="checked" <!--{/if}--> /><label for="woman"> 女性 </label>
            </span>
        </td>
    </tr>
    <tr>
        <td>職業</td>
        <td>
            <!--{assign var=key1 value="`$prefix`job"}-->
            <!--{if $arrErr[$key1]}-->
                <div class="attention"><!--{$arrErr[$key1]}--></div>
            <!--{/if}-->
            <select name="<!--{$key1}-->" class="box300">
                <option value="" selected="selected">請選擇</option>
                <!--{html_options options=$arrJob selected=$arrForm[$key1]}-->
            </select>
        </td>
    </tr>
    <tr>
        <td>出生年月日</td>
        <td>
            <!--{assign var=errBirth value="`$arrErr.year``$arrErr.month``$arrErr.day`"}-->
            <!--{if $errBirth}-->
                <div class="attention"><!--{$errBirth}--></div>
            <!--{/if}-->
            <!--{* 民國暦の表示 *}-->   
            民國 <select class="box80" name="yearMinkoku" style="<!--{$errBirth|sfGetErrorColor}-->" onChange="this.form.year.value=this.form.yearMinkoku.value">
                <!--{html_options options=$arrYearMinkoku selected=$arrForm.year|default:''}-->
            </select> 年 
            <!--{* 民國暦の表示 *}-->
            <select class="box80" name="year" style="<!--{$errBirth|sfGetErrorColor}-->" onChange="this.form.yearMinkoku.value=this.form.year.value">
                <!--{html_options options=$arrYear selected=$arrForm.year|default:''}-->
            </select> 年 
            <select class="box80" name="month" style="<!--{$errBirth|sfGetErrorColor}-->">
                <!--{html_options options=$arrMonth selected=$arrForm.month|default:''}-->
            </select> 月 
            <select class="box80" name="day" style="<!--{$errBirth|sfGetErrorColor}-->">
                <!--{html_options options=$arrDay selected=$arrForm.day|default:''}-->
            </select> 日 
        </td>
    </tr>
    <!-- 以下追加項目 -->

    <tr>
        <td>年齡</td>
        <td>
            <!--{assign var=key1 value="`$prefix`age"}-->
            <!--{if $arrErr[$key1]}-->
                <div class="attention"><!--{$arrErr[$key1]}--></div>
            <!--{/if}-->
            <input type="text" name="<!--{$key1}-->" value="<!--{$arrForm[$key1]|h}-->" maxlength="3" style="<!--{$arrErr[$key1]|sfGetErrorColor}-->;" class="box100" />
        </td>
    </tr>
    <tr>
        <td>統編<span class="attention">（若為公司行號）</span></td>
        <td>
            <!--{assign var=key1 value="`$prefix`company_code"}-->
            <!--{if $arrErr[$key1]}-->
                <div class="attention"><!--{$arrErr[$key1]}--></div>
            <!--{/if}-->
            <input type="text" name="<!--{$key1}-->" value="<!--{$arrForm[$key1]|h}-->" maxlength="<!--{$smarty.const.STEXT_LEN}-->" style="<!--{$arrErr[$key1]|sfGetErrorColor}-->;" class="box180" />
        </td>
    </tr>
    <tr>
        <td>統編抬頭<span class="attention">（若為公司行號）</span></td>
        <td>
            <!--{assign var=key1 value="`$prefix`company_name"}-->
            <!--{if $arrErr[$key1]}-->
                <div class="attention"><!--{$arrErr[$key1]}--></div>
            <!--{/if}-->
            <input type="text" name="<!--{$key1}-->" value="<!--{$arrForm[$key1]|h}-->" maxlength="<!--{$smarty.const.STEXT_LEN}-->" style="<!--{$arrErr[$key1]|sfGetErrorColor}-->;" class="box180" />
        </td>
    </tr>
    <!-- 以上追加項目 -->
    <!--{if $flgFields > 2}-->
        <tr>
            <td>設定密碼<br />
            </td>
            <td>
                <!--{if $arrErr.password || $arrErr.password02}-->
                    <div class="attention"><!--{$arrErr.password}--><!--{$arrErr.password02}--></div>
                <!--{/if}-->
                <input type="password" name="password" value="<!--{$arrForm.password|h}-->" maxlength="<!--{$smarty.const.PASSWORD_MAX_LEN}-->" style="<!--{$arrErr.password|sfGetErrorColor}-->" class="box120" />
                <p><span class="attention mini">只允許半形數字及英文，密碼長度必須為 <!--{$smarty.const.PASSWORD_MIN_LEN}--> - <!--{$smarty.const.PASSWORD_MAX_LEN}--> 碼</span></p>
                <input type="password" name="password02" value="<!--{$arrForm.password02|h}-->" maxlength="<!--{$smarty.const.PASSWORD_MAX_LEN}-->" style="<!--{$arrErr.password|cat:$arrErr.password02|sfGetErrorColor}-->" class="box120" />
                <p><span class="attention mini">請再次輸入以利確認</span></p>
            </td>
        </tr>
        <tr>
            <td>忘記密碼時之密碼提示</td>
            <td>
                <!--{if $arrErr.reminder || $arrErr.reminder_answer}-->
                    <div class="attention"><!--{$arrErr.reminder}--><!--{$arrErr.reminder_answer}--></div>
                <!--{/if}-->
                提問: <select name="reminder" style="<!--{$arrErr.reminder|sfGetErrorColor}-->" class="box200">
                    <option value="" selected="selected">請選擇</option>
                    <!--{html_options options=$arrReminder selected=$arrForm.reminder}-->
                </select>
                <br />
                解答: <input type="text" name="reminder_answer" value="<!--{$arrForm.reminder_answer|h}-->" style="<!--{$arrErr.reminder_answer|sfGetErrorColor}-->;" class="box200" />
            </td>
        </tr>
        <tr style="display: none;">
            <td>行銷資訊</td>
            <td>
                <!--{if $arrErr.mailmaga_flg}-->
                    <div class="attention"><!--{$arrErr.mailmaga_flg}--></div>
                <!--{/if}-->
<!--{*
                <span style="<!--{$arrErr.mailmaga_flg|sfGetErrorColor}-->">
                    <input type="radio" name="mailmaga_flg" value="1" id="html" <!--{if $arrForm.mailmaga_flg eq 1}--> checked="checked" <!--{/if}--> /><label for="html">有興趣得到促銷活動訊息</label><br />
                    <input type="radio" name="mailmaga_flg" value="2" id="text" <!--{if $arrForm.mailmaga_flg eq 2}--> checked="checked" <!--{/if}--> /><label for="text">僅訂閱純文字電子報</label><br />
                    <input type="radio" name="mailmaga_flg" value="3" id="no" <!--{if $arrForm.mailmaga_flg eq 3}--> checked="checked" <!--{/if}--> /><label for="no">沒有興趣</label>
                </span>
*}-->
				<input type="hidden" name="mailmaga_flg" value="1" />
            </td>
        </tr>

    <!--{/if}-->
<!--{/if}-->

