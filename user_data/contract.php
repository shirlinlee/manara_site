<?php include '../header.php'; ?>

<div id="container">
    <div id="one_maincolumn" class="main_column">
        <!--   肚子開始  -->       
        
        <div id="container_contract" class="clearfix">
            <div id="one_maincolumn" class="main_column">
                <div class="W100 t_center">
                    <div class="W1360 bread">
                        <span class="f15 f_pink f_left"><a class="f_grey" href="/tw/">首頁 /</a> MANARA化妝品交易條款規約</span>
                    </div>
                 </div>
        
                <div class="main-content">
                    <div class="W1200">
                        <h4 class="f24 t_left">MANARA化妝品交易條款規約</h4>
                        <h6 class="f14 t_left">本合約乃規定曼娜麗股份有限公司（下稱「本公司」）銷售MANARA化妝品時之交易條件、規章等。購買MANARA化妝品之產品時，請閱讀本合約之全文，並須同意本合約。</h6>
                        <div class="contract_item" v-for="(list,index) in lists">
                            <h5 class="f15 f_b t_left" >第{{index+1}}條  {{ list.subject }}</h5>
                            <p class="t_left f14" v-if="list.des!==''">{{ list.des }}</p>
                            <ul v-if="list.item.length">
                                <li class="t_left f14"  v-for="(i,idx) in list.item" :class="{'lastLine':idx === 3}"><span :class="{'hasDes':list.des!==''&& index!==5,'dot':index===5 }">{{idx+1}}</span>{{i}}</li>
                            </ul>
                        </div>
                    </div>
                    
                </div>
            </div>
        </div>

        <!-- <script src="new/js/cus-listgroup.js"></script> -->
        <link rel="stylesheet" href="new_201811/css/new_init.css?v=0131" />
        <link rel="stylesheet" href="new_201811/css/new_contract.css?v=0131" />

        <script>
         var app = new Vue({
                el: '#container_contract',
                data: {
                    lists:[
                        { subject: '合約之適用、變更', des: '',item: ['於本公司網站（https://www.manara.asia/tw/　；下稱「本公司網站」）申購，以及透過電話、郵寄（明信片、信封）、傳真以及電子郵件申購者，適用本合約。','本合約由本公司刊載於本公司網站。本公司網站上所刊載之交易條件、規章等，構成本合約之一部分。','本公司得變更本合約。合約之變更，以刊載於本公司網站之方式為之。變更後之合約，自刊載於本公司網站之時點起，即生效力。'] },
                        { subject: '個人資料之處理', des: '本公司自客戶所接獲之個人資料（係指「個人資料保護法」所定之個人資料；下同），由本公司遵照本公司之隱私政策加以管理。',item: [] },
                        { subject: '訂單之確定', des: '',item: ['客戶之訂單，於到達本公司時成立。客戶之訂單由於不可歸責於本公司之事由以致未能到達本公司者，訂單並未成立，本公司不予負責。','前項訂單到達本公司，本公司立即發出通知表明不接受訂單之意旨，並未遲延者，訂單即不成立。','本公司接獲客戶之訂單，開始準備發送商品之時點，客戶之訂單即告確定。'] },
                        { subject: '商品之配送', des: '',item: ['商品之配送，由客戶負擔本公司所定之運費。','訂單確定之商品，由本公司自行選擇配送業者以及配送方法，配送至客戶下單時指定之地點。','商品配送之日期與時間，本公司儘可能配合客戶要求為之；惟由於交通狀況等因素，亦可能無法按照客戶指定之日期與時間送達，請預先了解並同意。下單時指定希望配送之日期與時間，不保證即能按照指定之日期與時間送達。','本公司並未涉及配送業者提供之服務（變更收貨日期與時間或收貨地點、再次配送、通知、轉送等）。是否利用配送業者提供之服務，請客戶自行判斷。'] },
                        { subject: '取消', des: '',item: ['訂單一旦成立，截至商品送達預定日期之1星期前，客戶仍得通知本公司取消。但以該等通知於商品送達預定日期之1星期前到達本公司者為限。','由於天災地變、政府機關之行為、法令、暴動、戰爭等不可抗力事由，以致商品難以送達，或商品之送達可能遲誤相當期間者，本公司得取消訂單。'] },
                        { subject: '清償方法', des: '商品價款之給付、清償，得利用下列方法。請按照各該清償方法，遵守各自之契約、合約等規定。',item: ['信用卡付款','貨到付款','LINE Pay','其他本公司所定之方法'] },
                        { subject: '退貨、換貨', des: '',item: ['客戶於自其受領收品交付之日起算7日之期間內，得解除買賣契約退還商品。但以該等商品之化妝箱並未拆封（封箱膠條（封口膠條、防止拆封膠條）尚未剝開，或者騎縫孔尚未撕開）為限。','商品之換貨，以依照本公司規定認可者為限，始得替換不同尺寸等。'] },
                        { subject: '瑕疵擔保責任', des: '商品有瑕疵者，得替換商品，或退還價款。於此情形，退貨之費用由本公司負擔。',item: [] },
                        { subject: '禁止事項', des: '客戶不得從事下列各款所定之行為。',item: ['本於不正或不當目的，或者超乎正常之態樣，利用本公司網站、本公司服務與本公司內容之行為。','造成其他客戶困擾之行為','妨礙本公司營業之行為','侵害歸屬於本公司或本公司享有使用權之商標權、著作權、隱私或其他權利，或恐有侵害之虞之行為','以他人名義、網路會員資格或帳號下單訂購，下單訂購之內容虛偽不實，或者協助前稱各該情事之行為','為轉賣、標售等目的展示本公司商品，或為其他營利目的讓與本公司商品','為準備前款事宜而購買本公司商品，或向本公司索取樣品','不正當使用信用卡','違反法令之行為','上列各款以外，經本公司認定為不適當之行為',] },
                        { subject: '停止交易等', des: '有下列各款情事之一者，本公司得限制、拒絕或停止與客戶之交易。',item: ['客戶之行為符合第9條之禁止行為時','商品價款債務不履行或履行遲延時','本公司就訂單提出之問題客戶無法回答時','訂單數量超乎通常預定之使用量，而無法說明理由時','上列各款以外之情形，經本公司認定為必要時'] },
                        { subject: '禁止基於轉賣等目的購買等', des: '本公司基於品質與衛生保持之觀點，禁止為轉賣、標售等目的展示本公司商品，或為其他營利目的讓與本公司商品。購買商品或索取樣品之目的，在於提供轉賣、標售之展示，或者出於其他營利目的者，皆予拒絕。',item: [] },
                        { subject: '自本公司正式銷售窗口以外其他途徑購買之商品', des: '自本公司正式銷售窗口以外其他途徑購買之商品，由於管理狀況不明，得將其排除於售後服務對象之外。',item: [] },
                        { subject: '準據法', des: '本合約之成立、效力、履行以及解釋，應適用日本國法。',item: [] },
                        { subject: '紛爭解決', des: '客戶與本公司間之交易發生問題時，應本諸誠意協議解決之。',item: [] },
                        { subject: '管轄法院', des: '適用本合約之交易所涉之法律上紛爭，以台北地方法院為第一審之專屬合意管轄法院。',item: [] },
                    ],
                },
                methods:{
                    timeHandler(time){
                        var icon = '';
                        if(time.indexOf('日')>-1 || time.indexOf('防曬')>-1) {
                            icon =  icon+'<font class="day"></font>';
                        }
                        if(time.indexOf('夜')>-1) {
                            icon =  icon +'<font class="night"></font>';
                        }   
                        return icon;
                    },
                    linkHandler(page){
                        window.location=page;
                    }
                }
            })
        </script>

        <!--   肚子結束  -->
        


    </div>
</div>   
<script type="text/javascript" src="new_201811/js/product.js"></script>

<?php include '../footer.php'; ?> 
