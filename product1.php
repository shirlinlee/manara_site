
<?php include 'header.php';?>

<!-- https://www.manara.asia/tw/ -->
<!--{$smarty.const.ROOT_URLPATH}-->


<div id="container">
    <div id="one_maincolumn" class="main_column">
        <!--   肚子開始  -->       

        <script type="text/javascript">
        // 数量変更時に、表示されている価格を更新する
        function onChangeQuantity(element) {
            // 数量
            var quantity = element.value;
            // 単価
            var price_id = 'price_' + element.id.split('_')[1];
            var price = document.getElementById(price_id).value;
            // 価格 = 数量 * 単価
            var total = quantity * price;
            // 価格を表示しているID
            var total_id = 'total_' + element.id.split('_')[1];
            document.getElementById(total_id).value = total;
        }
        </script> 
        <div id="_product">
                <div class="sec1 W1200">
                    <div class="product_pic W50 poA">
                        <img src="<!--{$smarty.const.HTTPS_URL}-->user_data/new_201811/img/product/cg/main-img-cg.jpg" alt="">
                    </div>
                    <div class="info-border W50 f_right t_left">
                        <div class="awrd_area">
                            <img src="<!--{$smarty.const.HTTPS_URL}-->user_data/new_201811/img/product/award-gold.png" width="72" alt="">
                            <img src="<!--{$smarty.const.HTTPS_URL}-->user_data/new_201811/img/product/award-no-1.png" width="90" alt="">
                        </div>
                        <p class="f_golden f24 CJK">毛孔超乾淨!</p>
                        <h3 class="f40 CJK">改善黑頭，從<font class="f_red CJK_b">溫熱洗臉</font>開始</h3>
                        <p class="f30">溫熱卸妝凝膠</p>
                        <p class="f18">溫感打開毛孔！配合91.4％美容精華液，清潔保養同步。<br>不需要重複洗臉，嫁接睫毛的您也可使用。</p>
                        <div class="price_area">
                            <div class="add-product W50">
                                <div class="product-input f15">
                                    一般售價<font class="f30 f_b">$1,390</font>
                                </div>
                                <form action="<!--{$smarty.const.ROOT_URLPATH}-->products/detail.php" method="post">
                                    <input type="hidden" name="mode" value="cart" />
                                    <input type="hidden" name="product_id" value="200000007" />
                                    <input type="hidden" name="product_class_id" value="200000008" />
                                    <input type="hidden" name="regular_purchase_flg" value="0" />
                                    <input type="hidden" id="price_2" value="1390" >
                                    <!-- <div class="product-input">
                                        <span class="color-pink">數量</span>
                                        <select class="kui-select" name="quantity" id="quantity_2" onChange="onChangeQuantity(this)">
                                        <option value="1">1</option>
                                        <option value="2">2</option>
                                        <option value="3">3</option>
                                        </select>
                                    </div> -->
                                    <div class="add-button">
                                        <button type="submit" class="btn f_white bg_red">
                                            <span>立即購買</span>
                                        </button>
                                    </div>
                                </form>
                            </div>
                            <div class="add-product W50">
                                <div class="product-input f15">
                                    定期價格<font class="f30 f_b">$1,180</font>
                                </div>
                                <form action="<!--{$smarty.const.ROOT_URLPATH}-->products/detail.php" method="post">
                                    <input type="hidden" name="mode" value="cart" /><!-- 固定値'cart' -->
                                    <input type="hidden" name="product_id" value="200001260" /><!-- 商品ID -->
                                    <input type="hidden" name="product_class_id" value="200001261" /><!-- 商品クラスID -->
                                    <input type="hidden" name="regular_purchase_flg" value="1" /><!-- 定期:1/都度:0で値送信 -->
                                    <input type="hidden" id="price_1" value="1180" ><!--　商品単価 -->
                                    <!-- <div class="product-input">
                                        <span class="color-red">數量</span>
                                        <select class="kui-select" name="quantity" id="quantity_1" onChange="onChangeQuantity(this)">
                                        <option value="1">1</option>
                                        <option value="2">2</option>
                                        <option value="3">3</option>
                                        </select>
                                    </div> -->
                                    <div class="add-button">
                                        <button type="submit" class="btn f_white bg_pink">
                                            <span>定期購買</span>
                                        </button>
                                    </div>
                                </form>
                                <h6 class="f_red info"><i class="">i</i><span>定期更優惠方案!</span></h6>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="sec2 W100">
                    <h2 class="f40 CJK_b f_white">連續10年 <br class="mb pad">榮獲「世界品質評鑑大賞」金賞的肯定</h2>
                </div>
                <div class="sec3 W100 bg_grey">
                    <h5 class="f30 f_golden CJK_b">您的肌膚將見證我們對產品的堅持！</h5>
                    <p>2009年，溫熱卸妝凝膠首次獲得世界品質評鑑大賞「金賞」的肯定 ;<br/>連續10年來，我們不斷地研究開發及改進，但仍然秉持著最初的<br/>開發理念，以期解決每一位顧客的肌膚煩惱。</p>
                    <div class="W1200 bg_white">
                        <div class="intro_title">
                            <p class="f24">HOT CLEANING GEL</p>
                            <h2 class="f55 CJK">溫熱卸妝凝膠</h2>
                        </div>
                        <div class="intro_1">
                            <img src="<!--{$smarty.const.HTTPS_URL}-->user_data/new_201811/img/product/cg/cg-2.jpg" alt="" class="pic">
                            <hr class="pad mb">
                            <div class="txt CJK_b t_left">
                                <div class="img_wrapper">
                                    <img src="<!--{$smarty.const.HTTPS_URL}-->user_data/new_201811/img/product/cg/info-cg-1.png" alt="" class="img1">
                                    <img src="<!--{$smarty.const.HTTPS_URL}-->user_data/new_201811/img/product/cg/award-queen.jpg" alt="" class="img2 poA">
                                </div>
                                <h6 class="f30">我們秉持著變美麗的<span class="f55 f_golden">3</span><span class="f40 f_golden">個</span>堅持</h6>
                                <ul class="f_golden f30">
                                    <li><span class="f40">1</span>只提供肌膚有實際效果的產品</li>
                                    <li><span class="f40">2</span>每天都能安心使用</li>
                                    <li><span class="f40">3</span>簡單無負擔的使用</li>
                                </ul>
                            </div>
                        </div>
                        <div class="intro_2">
                            <h4 class="f_white CJK_b">日本毛孔專家，卸妝洗臉合而為一</h4>
                            <div class="details W100">
                                <div class="img_wrapper W50">
                                    <img src="<!--{$smarty.const.HTTPS_URL}-->user_data/new_201811/img/product/cg/award-lookin.jpg" class="poA award" alt="">
                                    <img src="<!--{$smarty.const.HTTPS_URL}-->user_data/new_201811/img/product/cg/cg.png" class="poA pro" alt="">
                                </div> 
                                <div class="detail_wrapper t_left W50">
                                    <h6 class="f24">溫熱卸妝凝膠<span class="f15">HOT CLEANING GEL</span></h6>
                                    <p class="f15">溫感打開毛孔！配合91.4%美容精華液，清潔保養同步。<br>不需要重複洗臉，嫁接睫毛的您也可使用。</p>
                                    <p class="f15">容量：200g (約60日份)</p>
                                    <div class="price_area">
                                        <div class="add-product W50">
                                            <div class="product-input f15">
                                                一般售價<font class="f30 f_b">$1,390</font>
                                            </div>
                                            <form action="<!--{$smarty.const.ROOT_URLPATH}-->products/detail.php" method="post">
                                                <input type="hidden" name="mode" value="cart" />
                                                <input type="hidden" name="product_id" value="200000007" />
                                                <input type="hidden" name="product_class_id" value="200000008" />
                                                <input type="hidden" name="regular_purchase_flg" value="0" />
                                                <input type="hidden" id="price_2" value="1390" >
                                                <!-- <div class="product-input">
                                                    <span class="color-pink">數量</span>
                                                    <select class="kui-select" name="quantity" id="quantity_2" onChange="onChangeQuantity(this)">
                                                    <option value="1">1</option>
                                                    <option value="2">2</option>
                                                    <option value="3">3</option>
                                                    </select>
                                                </div> -->
                                                <div class="add-button">
                                                    <button type="submit" class="btn f_white bg_red">
                                                        <span>立即購買</span>
                                                    </button>
                                                </div>
                                            </form>
                                        </div>
                                        <div class="add-product W50">
                                            <div class="product-input f15">
                                                定期價格<font class="f30 f_b">$1,180</font>
                                            </div>
                                            <form action="<!--{$smarty.const.ROOT_URLPATH}-->products/detail.php" method="post">
                                                <input type="hidden" name="mode" value="cart" /><!-- 固定値'cart' -->
                                                <input type="hidden" name="product_id" value="200001260" /><!-- 商品ID -->
                                                <input type="hidden" name="product_class_id" value="200001261" /><!-- 商品クラスID -->
                                                <input type="hidden" name="regular_purchase_flg" value="1" /><!-- 定期:1/都度:0で値送信 -->
                                                <input type="hidden" id="price_1" value="1180" ><!--　商品単価 -->
                                                <!-- <div class="product-input">
                                                    <span class="color-red">數量</span>
                                                    <select class="kui-select" name="quantity" id="quantity_1" onChange="onChangeQuantity(this)">
                                                    <option value="1">1</option>
                                                    <option value="2">2</option>
                                                    <option value="3">3</option>
                                                    </select>
                                                </div> -->
                                                <div class="add-button">
                                                    <button type="submit" class="btn f_white bg_pink">
                                                        <span>定期購買</span>
                                                    </button>
                                                </div>
                                            </form>
                                            <h6 class="f_red info f15"><i class="">i</i><span>定期更優惠方案!</span></h6>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div> 
                        
                        <div class="intro_3">
                            <div class="point_1">
                                <p class="point_step">Point 1</p>
                                <p class="point_slogan f30">
                                    <span class="f45 f_pink">不需重複洗臉</span>，<br class="mb">也能將毛孔髒污卸除乾淨！
                                </p>
                                <p class="point_des f18">
                                肌膚若清洗過度，會造成肌膚的傷害。內含滿滿美容液成分，能將毛孔髒污清洗乾淨且不造成肌膚負擔。「木瓜酵素」溫和去除老廢角質，把肌膚的髒汙清除得乾乾淨淨。卸完後不需再次洗臉！
                                </p>
                                <ul class="point_order t_left">
                                    <li>
                                        <span>1</span>
                                        <p class="f15">美容精華及木瓜酵素</p>
                                        <p class="f21">溫和軟化角質</p>
                                        <div class="img_wrapper">
                                            <img src="<!--{$smarty.const.HTTPS_URL}-->user_data/new_201811/img/product/cg/img-acne-1.jpg" alt="">
                                            <hr class="mb pad">
                                            <font class="f15">
                                            美容精華成分軟化老廢角質，毛孔汙垢更容易去除。
                                            </font>
                                        </div>

                                    </li>
                                    <li>
                                        <span>2</span>
                                        <p class="f15">溫感凝膠</p>
                                        <p class="f21">超強吸附髒污</p>
                                        <div class="img_wrapper">
                                            <img src="<!--{$smarty.const.HTTPS_URL}-->user_data/new_201811/img/product/cg/img-acne-2.jpg" alt="">
                                            <hr class="mb pad">
                                            <font class="f15">不帶給肌膚負擔，連帶妝的肌膚及毛孔都能清潔乾淨！</font>
                                        </div>
                                    </li>
                                    <li>
                                        <span>3</span>
                                        <p class="f15">肌膚無負擔</p>
                                        <p class="f21">簡單去除黑頭</p>
                                        <div class="img_wrapper">
                                            <img src="<!--{$smarty.const.HTTPS_URL}-->user_data/new_201811/img/product/cg/img-acne-3.jpg" alt="">
                                        </div>
                                    </li>

                                </ul>
                            </div>
                            <div class="point_2 bg_yellow">
                                <p class="point_step">Point 2</p>
                                <p class="point_slogan f30">
                                    洗臉卸妝同時保養肌膚！<br>富含 <span class="f45 f_pink">91.4% 美容精華成分</span>！
                                </p>
                                <p class="point_des f18">
                                    精華液成份讓卸妝後潤澤度UP<br>6種膠原蛋白所支援的成分，打造光潤彈力美肌
                                </p>
                                <ul class="point_material t_left f15">
                                    <li><img src="<!--{$smarty.const.HTTPS_URL}-->user_data/new_201811/img/product/cg/ingredient-cg-1.png" alt=""><span>玻尿酸</span></li>
                                    <li><img src="<!--{$smarty.const.HTTPS_URL}-->user_data/new_201811/img/product/cg/ingredient-cg-2.png" alt=""><span>蜂王漿精華</span></li>
                                    <li><img src="<!--{$smarty.const.HTTPS_URL}-->user_data/new_201811/img/product/cg/ingredient-cg-3.png" alt=""><span>神經醯胺</span></li>
                                    <li><img src="<!--{$smarty.const.HTTPS_URL}-->user_data/new_201811/img/product/cg/ingredient-cg-4.png" alt=""><span>膠原蛋白</span></li>
                                    

                                </ul>
                            </div>
                            <div class="point_3">
                                <p class="point_step">Point 3</p>
                                <p class="point_slogan f24">
                                我們的堅持！<br><span class="f30">對於肌膚，只使用最</span><span class="f36 f_pink">安心安全</span>的成分！<br>
                                <span class="f30">堅持</span><span class="f36 f_pink">7大無添加成分</span>
                                </p>
                                <ul class="point_poison t_center f15">
                                    <li><span>著色料</span></li>
                                    <li><span>合成香料</span></li>
                                    <li><span>礦物油</span></li>
                                    <li><span>石油系<br>界面活性劑</span></li>
                                    <li><span>酒精</span></li>
                                    <li><span>Paraben<br>防腐劑</span></li>
                                    <li><span>紫外線<br>吸收劑</span></li>
                                </ul>
                            </div>

                        </div>
                        
                    </div>
                </div>

                <div class="sec4 W100">
                    <h3 class="f36 f_white">
                        <span class="f48">Development Story</span>
                        研發故事
                    </h3>
                </div>

                <div class="sec5 W100">
                    <img src="<!--{$smarty.const.HTTPS_URL}-->user_data/new_201811/img/product/cg/img-boss.jpg" alt="" class="people">    
                    <div class="des">
                        <p class="ori f15">開發的原點</p>
                        <p class="said CJK_b f24">
                            被誤認比實際年齡<br>還要老上10歲的我⋯⋯
                        </p>   
                        <p class="f18">
                            曾任廣告代理店的營業部長，幾乎每天都工作到深夜，導致才30歲的肌膚就長出很多斑點及細紋。試了很多保養品，卻仍找不到適合自己並能改善肌膚的產品。<br>進而意識到市面上有很多保養品並沒有實效感受，無法改善肌膚問題，而且還發現大部分卸妝產品裡，竟然有與洗碗精相同的成分 ，大。受。打。擊！<br>「ないなら、私がつくろう！」(沒有的話！就自己來開發吧！）
                            <br><br>
                            從一位完全不懂化妝品的素人開始，我造訪了日本全國各地的化妝品製造工廠，九成以上的工廠都告訴我，「這樣的產品沒利潤吧？」「不放現在流行成分不會熱銷啦？」等的回覆。但，我們絕不放棄！經過數百次開發研究，理想的溫熱卸妝凝膠終於誕生了！<br>
                            我承諾會以女性心聲為出發點，並持續開發自己真心想使用的保養品。
                        </p>
                        <p class="ps f15">
                            溫熱卸妝凝膠開發者<br>
                            maNara化妝品社長 岩崎裕美子<br>
                            1968年出生。曾任日本廣告代理公司15年之久，1999年為取締役營業部長並擔任多家通信販賣保養品公司的負責人。退職後，創設了「女性一輩子都想要工作」的RANKUP公司。以期解決自己肌膚煩惱為目的，開始了maNara化妝品事業，並得到日本全國女性的回響。
                        </p>
                    </div>
                </div>

                <div class="sec6 W100 bg_red f_white">
                    <div class="W1200">
                        <p class="f48">HOW to USE</p>
                        <p class="f24">溫熱卸妝凝膠的正確使用方式</p>
                    </div>
                    
                </div>

                <div class="sec7 W100">
                    <ul class="use_step W100">
                        <li>
                        <img src="<!--{$smarty.const.HTTPS_URL}-->user_data/new_201811/img/product/cg/img-step-1.jpg" alt="">
                        <p class="f21">手乾臉乾的狀態下</p>
                        <p class="f15">於手掌中取10元硬幣大小，兩手合併輕揉凝膠，手溫使之軟化後，於全臉塗開。</p>

                        </li>
                        <li>
                        <img src="<!--{$smarty.const.HTTPS_URL}-->user_data/new_201811/img/product/cg/img-step-2.jpg" alt="">
                        <p class="f21">輕柔按摩，溶解彩妝髒污</p>
                        <p class="f15">指腹輕柔按摩臉部約1分鐘即可。</p>
                        </li>
                        <li>
                        <img src="<!--{$smarty.const.HTTPS_URL}-->user_data/new_201811/img/product/cg/img-step-3.jpg" alt="">
                        <p class="f21">乳化！並用流動溫水沖洗</p>
                        <p class="f15">用溫水沖洗約20次。請加強髮際、鼻翼兩側和下巴的清潔，避免殘留。完成後，無須再次洗臉。</p>
                        </li>

                    </ul>
                    <div class="day_night f21">
                        <div class="W40">
                            <h5 class="night f_white"><img src="<!--{$smarty.const.HTTPS_URL}-->user_data/new_201811/img/product/icon/icon-night.svg" class="icon">夜間保養順序</h5>
                            <ul class="W100">
                                <li class="W50">
                                    <div class="img_wrapper" style="background-color:#ffc149"><img src="<!--{$smarty.const.HTTPS_URL}-->user_data/new_201811/img/product/cg/cg.png" alt=""></div>
                                    <p class="f18">溫熱卸妝凝膠</p>
                                    <p class="f15">HOT CLEANING GEL</p>
                                    <img src="<!--{$smarty.const.HTTPS_URL}-->user_data/new_201811/img/product/icon/icon-next-night.svg" class="icon">
                                </li>
                                <li class="W50">
                                    <div class="img_wrapper"><img src="<!--{$smarty.const.HTTPS_URL}-->user_data/new_201811/img/product/oe/oe.png" alt=""></div>
                                    <p class="f18">全效活膚保濕精華露</p>
                                    <p class="f15">ONLY ESSENCE</p>
                                </li>
                            </ul>
                        </div>
                        <div class="W60">
                            <h5 class="day W60 f_white"><img src="<!--{$smarty.const.HTTPS_URL}-->user_data/new_201811/img/product/icon/icon-day.svg" class="icon">晨間保養順序</h5>
                            <ul class="W100">
                                <li class="W33">
                                    <div class="img_wrapper"><img src="<!--{$smarty.const.HTTPS_URL}-->user_data/new_201811/img/product/mg/mg.png" alt=""></div>
                                    <p class="f18">深層毛孔洗顏凝膠</p>
                                    <p class="f15">MOIST WASH GEL</p>
                                    <img src="<!--{$smarty.const.HTTPS_URL}-->user_data/new_201811/img/product/icon/or.png" class="icon">

                                </li>
                                <li class="W33">
                                    <div class="img_wrapper"><img src="<!--{$smarty.const.HTTPS_URL}-->user_data/new_201811/img/product/ns/ns.png" alt=""></div>
                                    <p class="f18">毛孔無瑕礦泥洗顏粉</p>
                                    <p class="f15">NAMA NERI WASH</p>
                                    <img src="<!--{$smarty.const.HTTPS_URL}-->user_data/new_201811/img/product/icon/icon-next-day.svg" class="icon">

                                </li>
                                <li class="W33">
                                    <div class="img_wrapper"><img src="<!--{$smarty.const.HTTPS_URL}-->user_data/new_201811/img/product/oe/oe.png" alt=""></div>
                                    <p class="f18">全效活膚保濕精華露</p>
                                    <p class="f15">ONLY ESSENCE</p>
                                </li>
                            </ul>
                        </div>
                        
                        
                        
                    </div>
                </div>

                <div class="sec8 W100">
                    <div class="info_table W1200 f15">
                        <div class="W50">
                            <div class="th">產品名稱</div>
                            <div class="td">溫熱卸妝凝膠</div>
                        </div>
                        <div class="W50">
                            <div class="th">容量</div>
                            <div class="td">200g (約可使用2個月)</div>
                        </div>
                        <div class="W100">
                            <div class="th">使用時間</div>
                            <div class="td">夜間使用</div>
                        </div>
                        <div class="W100">
                            <div class="th">成分</div>
                            <div class="td">甘油、雙丙甘醇、橄欖果油、（聚甘油-10 山崳酸酯／二十烷二酸酯）、（甘油山崳酸酯／二十酸酯）、PEG-10 向日葵油甘油酯類、甘油硬脂酸SE、水、白芒花籽油、木瓜酵素、水解膠原蛋白、菜薊葉萃取、玻尿酸鈉、羥丙基三甲基氯化銨透明質酸、腦苷脂類、角鯊烷、聚甘油-10 月桂酸酯、橄欖油酸乙基己酯、α熊果素、脂溶性維他命C、野薔薇果萃取、黃芩根萃取、廣西沙柑果皮萃取、仙桃仙人掌莖萃取、蜂王漿萃取、泰國野葛根萃取、月見草籽萃取、水解酵母萃取、聚麩胺酸、歐洲七葉樹籽萃取、石榴果萃取、野大豆籽萃取、維生素E、雨生紅球藻油、紅花籽油、野大豆油、蜂蠟、蜂蜜、胡蘿蔔根萃取、藻膠、丁二醇、柑橘皮粹取、戊二醇、維生素B12、卡波樹脂、苯氧乙醇</div>
                        </div>
                    </div>
                </div>

                <div class="sec9 W100">
                    <h4 class="f30 f_red W100">maNara全系列產品</h4>
                    <p class="f18 W100">了解更多關於maNara的全系列產品</p>
                    <a href="javascript:;"><img src="<!--{$smarty.const.HTTPS_URL}-->user_data/new_201811/img/product/icon/icon-more.svg" alt=""></a>
                    <ul class="W1200">
                        <li class="W33">
                            <img src="<!--{$smarty.const.HTTPS_URL}-->user_data/new_201811/img/product/icon/icon-qa.svg" alt="">
                            <div class="des">
                                <p class="f21">常見問題</p>
                                <p class="f15">產品的使用上有任何問題都可以在這裡找到解答。</p>
                            </div>
                        </li>
                        <li class="W33">
                            <img src="<!--{$smarty.const.HTTPS_URL}-->user_data/new_201811/img/product/icon/icon-regular.svg" alt="">
                            <div class="des">
                                <p class="f21">定期方案</p>
                                <p class="f15">選擇定期方案，為您帶來輕鬆無負擔的美麗。</p>
                            </div>
                        </li>
                        <li class="W33">
                            <img src="<!--{$smarty.const.HTTPS_URL}-->user_data/new_201811/img/product/icon/icon-heart.svg" alt="">
                            <div class="des">
                                <p class="f21">品牌故事</p>
                                <p class="f15">了解更多maNara及我們的用心。</p>
                            </div>
                        </li>
                    </ul>
                </div>
                        
            </div>
        <!-- CONTENT END -->
        <script>
        </script>

        
        <!--   肚子結束  -->
        <script type="text/javascript" src="user_data/new_201811/js/product.js"></script>


    </div>
</div>   


<link rel="stylesheet" href="user_data/new_201811/css/new_init.css" />
<link rel="stylesheet" href="user_data/new_201811/css/new_product.css?v=123" />




<?php include 'footer.php';?> 
