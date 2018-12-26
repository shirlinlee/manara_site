
<?php include '../header.php'; ?>

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
                    <div class="product_pic ns W50 poA">
                        <img src="<!--{$smarty.const.HTTPS_URL}-->user_data/new_201811/img/product/mg/main-img-mg.jpg" alt="">
                    </div>
                    <div class="info-border W50 f_right t_left">
                        <p class="f_golden f24 CJK">去除老廢角質</p>
                        <h3 class="f40 CJK">保濕洗顏，<font class="f_red CJK_b">維持肌膚水分!</font></h3>
                        <p class="f30">深層毛孔洗顏凝膠</p>
                        <p class="f18">含97.5%的高濃度美容精華液，<br>帶走肌膚髒汙同時 ; 維持住肌膚保水度。</p>
                        <div class="price_area">
                            <div class="add-product W50">
                                <div class="product-input f15">
                                    一般售價<font class="f30 f_b">$1,200</font>
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
                                    定期價格<font class="f30 f_b">$1,020</font>
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
                    <h2 class="f40 CJK_b f_white">榮獲「世界品質評鑑大賞」<br class="mb pad">金賞的肯定</h2>
                </div>
                <div class="sec3 W100 bg_yellow">
                    <div class="W1200">
                        <h5 class="f36 CJK_b">不含<font class="f_pink">化學洗淨成分0%!</font></h5>
                        <p class="f24">讓滿滿的美容精華液帶走髒汙，並維持肌膚彈潤保濕！</p>
                    </div>
                    <div class="W1200 bg_white">
                        <div class="intro_title">
                            <p class="f24">MOIST WASH GEL</p>
                            <h2 class="f55 CJK">深層毛孔洗顔凝膠</h2>
                        </div>
                        <div class="intro_1 ns">
                            <img src="<!--{$smarty.const.HTTPS_URL}-->user_data/new_201811/img/product/mg/info-mg-1.jpg" alt="" class="pic">
                            <hr class="pad mb">
                            <div class="txt t_center">
                                <ul class="buble">
                                    <li>
                                        <h6 class="f_white f36">透明感</h6>
                                        <p class="f18">美白對苯二酚誘導體<br>VitC誘導體</p>
                                    </li>
                                    <li>
                                        <h6 class="f_white f36">保濕</h6>
                                        <p class="f16">６種促進膠原蛋白<br>增生成分<br>水解膠原蛋白</p>
                                    </li>
                                    <li>
                                        <h6 class="f_white f36">彈力</h6>
                                        <p class="f16">４種大小分子玻尿酸<br>天然橄欖油<br>角鯊烯<br>荷荷芭種子油</p>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="intro_2 W960">
                            <h4 class="f_white CJK_b f36">徹底感受，精華液洗顏的魅力</h4>
                            <div class="details W100">
                                <div class="img_wrapper W50">
                                    <img src="<!--{$smarty.const.HTTPS_URL}-->user_data/new_201811/img/product/mg/mg.png" class="poA pro" alt="">
                                </div> 
                                <div class="detail_wrapper t_left W50">
                                    <h6 class="f24">深層毛孔洗顔凝膠<span class="f15">MOIST WASH GEL</span></h6>
                                    <p class="f18">含97.5%的高濃度美容精華液，<br>帶走肌膚髒汙同時 ; 維持住肌膚保水度。</p>
                                    <p class="f15">容量：120ml (約60日份)</p>
                                    <div class="price_area">
                                        <div class="add-product W50">
                                            <div class="product-input f15">
                                                一般售價<font class="f30 f_b">$1,200</font>
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
                                                定期價格<font class="f30 f_b">$1,020</font>
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
                            <div class="point_1 mg pb40 W960">
                                <p class="point_step f_left">Point 1</p>
                                <hr>
                                <div class="W67 f_left t_left">
                                    <p class="point_slogan f30">
                                        <span class="f30 f_pink">日本首次！</span>配合膠囊化木瓜酵素
                                    </p>
                                    <p class="f30 CJK_b pb15">溫和去除<span class="f44 f_pink">老廢角質</span>及<span class="f44 f_pink">淨化毛孔！</span></p>
                                    <p class="f18">膠囊化木瓜酵素能夠將老廢角質去除，<br>並且促進肌膚再生！<br>讓肌膚像水煮蛋一樣光滑、潤澤。</p>
                                </div>
                                <img src="<!--{$smarty.const.HTTPS_URL}-->user_data/new_201811/img/product/mg/img-mg-point-1.jpg" class="W33 f_right" alt="">
                                
                            </div>
                            <div class="point_2 bg_yellow W960">
                                <p class="point_step">Point 2</p>
                                <p class="point_slogan f30">
                                    <span class="f45 f_pink">朝鮮薊葉精華</span>
                                </p>
                                <p class="point_des f18">
                                    修護毛孔粗大、老化、黑頭等問題，將肌膚導向健康、毛孔緊緻的好膚質。
                                </p>
                                <ul class="point_material mg t_center f_white f15">
                                    <li><span class="f30">黑頭粉刺</span>抑制麥拉寧黑色素的生成，進而改善黑頭。</li>
                                    <li><span class="f30">粗大毛孔</span>抑制分泌過剩的皮脂，使毛孔緊縮！</li>
                                    <li><span class="f30">鬆弛毛孔</span>促進新陳代謝，重整肌膚紋路，讓毛孔不再粗大明顯。</li>

                                </ul>
                            </div>
                            <div class="point_4 W960">
                                <div class="W40 f_right">
                                    <p class="point_step f_right">Point 3</p>
                                    <p class="point_slogan f36 f_right">
                                        提升後續保養品吸收力！
                                        <span class="f18">修護肌膚水通道，提升後續保養品吸收力，並維持肌膚高保水度。</span>
                                    </p>
                                </div>
                                <img src="<!--{$smarty.const.HTTPS_URL}-->user_data/new_201811/img/product/mg/img-mg-point-3.jpg" class="W60 f_left" alt="">
                                
                            </div>
                            <div class="point_3 W960">
                                <p class="point_step">Point 4</p>
                                <p class="point_slogan f24">
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

                    <!-- 背景花  -->

                    <img src="<!--{$smarty.const.HTTPS_URL}-->user_data/new_201811/img/product/mg/bg-leaf-mg-r.png" alt="" class="flower f7">
                    <img src="<!--{$smarty.const.HTTPS_URL}-->user_data/new_201811/img/product/mg/bg-leaf-mg-l.png" alt="" class="flower f6">
                    <img src="<!--{$smarty.const.HTTPS_URL}-->user_data/new_201811/img/product/bg-leaf-2.png" alt="" class="flower f8">
                    <img src="<!--{$smarty.const.HTTPS_URL}-->user_data/new_201811/img/product/bg-leaf-3.png" alt="" class="flower f9">
                    <img src="<!--{$smarty.const.HTTPS_URL}-->user_data/new_201811/img/product/bg-leaf-4.png" alt="" class="flower f10">


                        
                </div>

                <div class="sec4 W100" style="background-image:url(new_201811/img/product/ns/banner-story-ns.jpg)">
                    <h3 class="f36 f_white">
                        <span class="f48">Development Story</span>
                        研發故事
                    </h3>
                </div>

                <div class="sec5 W100">
                    <div class="W1200">
                        <img src="<!--{$smarty.const.HTTPS_URL}-->user_data/new_201811/img/product/ns/img-sasaki-n-sstory.jpg" alt="" class="people">    
                        <div class="des">
                            <p class="ori f15">開發的原點</p>
                            <p class="said CJK_b f24">
                            不管做什麼努力，<br>毛孔仍無法徹底潔淨…
                            </p>   
                            <p class="f18">
                            我們留意到顧客的心聲:<br>
                            「溫熱卸妝凝膠改善了黑頭粉刺，但閉鎖粉刺總是存在下巴跟鼻翼兩側等處，肌膚總是摸起來凸凸粗粗的不平滑，到底要如何能讓毛孔更加的乾淨呢？」<br>

                            粉刺若是沒有即時清除，將會氧化後成黑頭粉刺，並且塞住毛孔後，將毛孔慢慢的撐開，形成「粗大毛孔」的原因之一。<br>
                            於是毛孔無瑕礦泥洗顏粉誕生了！<br><br>
                            </p>
                            <p class="ps f15">
                            毛孔無瑕礦泥洗顏粉開發者<br>
                            製品開發部 佐佐木 美繪<br>
                            1976年出生，曾任某日系大牌的美容諮詢顧問10年之久，服務近3萬人，針對顧客的肌膚煩惱給予保養建議。在美妝保養檢定獲連續3年最優秀賞。於2010年加入日本曼娜麗，現任總社的製品開發部負責人。
                            </p>
                        </div>
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
                        <img src="<!--{$smarty.const.HTTPS_URL}-->user_data/new_201811/img/product/ns/img-ns-step-1.jpg" alt="">
                        <p class="f21">取10元硬幣大小的量</p>
                        <p class="f15">於掌心中取10元硬幣大小的量。為避免倒出粉末時飛散開來，<span class="f_pink">可先用水將手沾溼。</span></p>

                        </li>
                        <li>
                        <img src="<!--{$smarty.const.HTTPS_URL}-->user_data/new_201811/img/product/ns/img-ns-step-2.jpg" alt="">
                        <p class="f21">混合成泥狀</p>
                        <p class="f15">先用少量水開始混合，再酌量調整水量至成泥狀後，即可塗抹於全臉。<span class="f_grey">小訣竅 : 可於</span><span class="f_pink">下巴及鼻頭粉刺處</span><span class="f_grey">，加強按摩。</span></p>
                        </li>
                        <li>
                        <img src="<!--{$smarty.const.HTTPS_URL}-->user_data/new_201811/img/product/ns/img-ns-step-3.jpg" alt="">
                        <p class="f21">不須起泡</p>
                        <p class="f15">利用流動常溫水，清洗乾淨為止。</p>
                        </li>

                    </ul>
                    <div class="day_night f21">
                        <div class="W40">
                            <h5 class="night f_white"><img src="<!--{$smarty.const.HTTPS_URL}-->user_data/new_201811/img/product/icon/icon-night.svg" class="icon">夜間保養順序</h5>
                            <ul class="W100">
                                <li class="W50">
                                    <div class="img_wrapper"><img src="<!--{$smarty.const.HTTPS_URL}-->user_data/new_201811/img/product/cg/cg.png" alt=""></div>
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
                                    <div class="img_wrapper" style="background-color:#daf0fe"><img src="<!--{$smarty.const.HTTPS_URL}-->user_data/new_201811/img/product/ns/ns.png" alt=""></div>
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
                            <div class="td">毛孔無瑕礦泥洗顏粉</div>
                        </div>
                        <div class="W50">
                            <div class="th">容量</div>
                            <div class="td">60g (約可使用2個月)</div>
                        </div>
                        <div class="W100">
                            <div class="th">使用時間</div>
                            <div class="td">日間使用</div>
                        </div>
                        <div class="W100">
                            <div class="th">成分</div>
                            <div class="td">滑石粉、月桂肌胺酸鈉、葉蠟石、月桂天冬氨酸鈉、日本棚倉黏土、聚乙烯吡咯烷酮、椰油甘氨酸鈉、二氧化矽、三仙膠、矽酸鈣、磷酸氫二鈉、磷酸鉀、糊精、蛋白酶、甘草酸二鉀、水、丁二醇、脂肪酶、水解膠原蛋白、羥丙基三甲基氯化銨透明質酸、抗壞血酸棕櫚酸酯三納、α熊果素、甘油、木瓜蛋白酶、石榴果實萃取、乳酸桿菌、蓮籽發酵產物濾液、酵母菌、薏苡種子發酵產物濾液、月見草籽萃取、歐洲七葉樹籽萃取、野大豆籽萃取、泰國野葛根萃取、菜薊葉萃取</div>
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
        <script type="text/javascript" src="new_201811/js/product.js"></script>


    </div>
</div>   


<link rel="stylesheet" href="new_201811/css/new_init.css" />
<link rel="stylesheet" href="new_201811/css/new_product.css?v=1226" />




<?php include '../footer.php'; ?> 
