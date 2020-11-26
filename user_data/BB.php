 
<?php include '../header.php'; ?>

<!-- https://www.manara.asia/tw/ -->
<!--{$smarty.const.ROOT_URLPATH}-->


<div id="container">
    <div id="one_maincolumn" class="main_column">
        <div class="W1360 bread">
            <span class="f15 f_left f_pink"><a class="f_white" href="/tw/">首頁 /</a> <a class="f_white" href="/tw/user_data/product_list.php">MANARA商品 /</a>奇肌無瑕水感BB棒<span>
        </div>
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
                
                <div class="sec1">
                    <div class="product_pic W50 f_left" style="background-image: url(new_201811/img/product/bb/main-img-bb.jpg)">
                        <img src="<!--{$smarty.const.HTTPS_URL}-->user_data/new_201811/img/product/bb/main-img-m-bb.jpg" class="mb" alt="">
                    </div>
    
                    <div class="W50 poA t_left">
                        <div class="awrd_area">
                            <img src="<!--{$smarty.const.HTTPS_URL}-->user_data/new_201811/img/product/award-gold.png" class="pc" width="65" alt="">
                        </div>
                        <p class="f_golden f24 CJK_b">30秒完成專業底妝!</p>
                        <h3 class="f40 CJK"><font class="f_red CJK_b">接觸</font>到肌膚的瞬間  就<font class="f_red CJK_b">融化</font>了</h3>
                        <p class="f24">奇肌無瑕水感BB棒 </p>
                        <p class="f18">美容液94%配合，防曬、飾底、潤色，一次擁有六大功效！<br/>質地柔滑，能輕鬆畫出完美妝容。</p>
                        <div class="price_area" style="margin-top: 25px;">
                            <div class="product-input f15">
                                一般售價 <font class="f30 f_red">$1,250</font>
                            </div>
                            <div class="add-product W50">
                                <form action="<!--{$smarty.const.ROOT_URLPATH}-->products/detail.php" method="post">
                                    <!-- <input type="hidden" name="product_id" value="200000009">
                                    <input type="hidden" name="product_class_id" value="200000010"> -->
                                    <input type="hidden" name="mode" value="cart">
                                    <input type="hidden" name="product_id" value="20002030">
                                    <input type="hidden" name="product_class_id" value="20002031">
                                    <input type="hidden" name="regular_purchase_flg" value="0">
                                    <input type="hidden" id="price_2" value="1250">
                                    <div class="product-input" style="display:none">
                                        <select class="kui-select" name="quantity" id="quantity_2" onchange="onChangeQuantity(this)">
                                        <option value="1">1</option>
                                        </select>
                                    </div>
                                    <div class="add-button">
                                        <button type="submit" class="btn_black">
                                            <span><font class="skin_color"></font>自然色購買</span>
                                        </button>
                                    </div>
                                </form>
                            </div>
                            <div class="add-product W50">
                                <form action="<!--{$smarty.const.ROOT_URLPATH}-->products/detail.php" method="post">
                                    <!-- <input type="hidden" name="product_id" value="200000262">
                                    <input type="hidden" name="product_class_id" value="200000263"> -->
                                    <input type="hidden" name="mode" value="cart"><!-- 固定値'cart' -->
                                    <input type="hidden" name="product_id" value="20002032"><!-- 商品ID -->
                                    <input type="hidden" name="product_class_id" value="20002033"><!-- 商品クラスID -->
                                    <input type="hidden" name="regular_purchase_flg" value="1"><!-- 定期:1/都度:0で値送信 -->
                                    <input type="hidden" id="price_1" value="1110"><!--　商品単価 -->
                                     <div class="product-input" style="display:none">
                                        <select class="kui-select" name="quantity" id="quantity_1" onchange="onChangeQuantity(this)"><!-- 数量 -->
                                        <option value="1">1</option>
                                        </select>
                                    </div>
                                    <div class="add-button">
                                        <button type="submit" class="btn_black">
                                            <span><font class="skin_bright_color"></font>明亮色購買</span>
                                        </button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="sec2 W100">
                    <h2 class="f40 CJK_b f_white"><br class="mb pad">榮獲「世界品質評鑑大賞」金賞的肯定</h2>
                </div>
                <div class="sec3 W100 bg_skin">
                    <div class="W1200">
                        <h5 class="f30 f_golden CJK_b pb15">難以置信！<br class="mb">與肌膚貼合的全新感受！</h5>
                        <p class="f18 pb20">冰淇淋般的綿密軟滑質地，<br class="pc"/>與肌膚相遇時，<br class="pc"/>會瞬間融化、快速完妝。</p>
                    </div>
                    <div class="W1200 bg_white">
                        
                        <div class="W100 W960">
                            <img src="<!--{$smarty.const.HTTPS_URL}-->user_data/new_201811/img/product/bb/banner-bb-001.jpg" alt="" class="pc">
                            <img src="<!--{$smarty.const.HTTPS_URL}-->user_data/new_201811/img/product/bb/banner-bb-m-001.jpg" alt="" class="mb">

                        </div>
                        <div class="intro_2 W960">
                            <h4 class="f_white CJK_b f36">防曬、遮瑕、潤色，輕鬆打造完美妝容</h4>
                            <div class="details W100">
                                <div class="img_wrapper W40">
                                    <img src="<!--{$smarty.const.HTTPS_URL}-->user_data/new_201811/img/product/bb/img-bb-3.jpg" class="W100" alt="">
                                </div> 
                                <div class="detail_wrapper t_left W60">
                                    <h5 class="f24">奇肌無瑕水感BB棒 <span class="f15 f_grey">BB LIQUID BAR SPF35 PA+++</span></h5>
                                    <p class="f18">美容液94%配合，防曬、飾底、潤色，一次擁有六大功效！<br class="pc">質地柔滑，能輕鬆畫出完美妝容。</p>
                                    <p class="f15">容量：7g (約可使用3~4個月)</p>
                                    <div class="price_area" style="margin-top: 25px;">
                                        <div class="product-input f15">
                                            一般售價 <font class="f30 f_red">$1,250</font>
                                        </div>
                                        <div class="add-product W50">
                                            <form action="<!--{$smarty.const.ROOT_URLPATH}-->products/detail.php" method="post">
                                                <!-- <input type="hidden" name="product_id" value="200000009">
                                                <input type="hidden" name="product_class_id" value="200000010"> -->
                                                <input type="hidden" name="mode" value="cart">
                                                <input type="hidden" name="product_id" value="20002030">
                                                <input type="hidden" name="product_class_id" value="20002031">
                                                <input type="hidden" name="regular_purchase_flg" value="0">
                                                <input type="hidden" id="price_2" value="1250">
                                                <div class="product-input" style="display:none">
                                                    <select class="kui-select" name="quantity" id="quantity_2" onchange="onChangeQuantity(this)">
                                                    <option value="1">1</option>
                                                    </select>
                                                </div>
                                                <div class="add-button">
                                                    <button type="submit" class="btn_black">
                                                        <span><font class="skin_color"></font>自然色購買</span>
                                                    </button>
                                                </div>
                                            </form>
                                        </div>
                                        <div class="add-product W50">
                                            <form action="<!--{$smarty.const.ROOT_URLPATH}-->products/detail.php" method="post">
                                                <!-- <input type="hidden" name="product_id" value="200000262">
                                                <input type="hidden" name="product_class_id" value="200000263"> -->
                                                <input type="hidden" name="mode" value="cart"><!-- 固定値'cart' -->
                                                <input type="hidden" name="product_id" value="20002032"><!-- 商品ID -->
                                                <input type="hidden" name="product_class_id" value="20002033"><!-- 商品クラスID -->
                                                <input type="hidden" name="regular_purchase_flg" value="1"><!-- 定期:1/都度:0で値送信 -->
                                                <input type="hidden" id="price_1" value="1110"><!--　商品単価 -->
                                                <div class="product-input" style="display:none">
                                                    <select class="kui-select" name="quantity" id="quantity_1" onchange="onChangeQuantity(this)"><!-- 数量 -->
                                                    <option value="1">1</option>
                                                    </select>
                                                </div>
                                                <div class="add-button">
                                                    <button type="submit" class="btn_black">
                                                        <span><font class="skin_bright_color"></font>明亮色購買</span>
                                                    </button>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div> 
                        </div> 
                        
                        <img src="<!--{$smarty.const.HTTPS_URL}-->user_data/new_201811/img/product/bb/banner-bb-002.jpg" class="W960 mb50" style="margin-top: -20px" width="100%" alt="">
                        
                        <div class="intro_3">
                       
                            <div class="point_1 mg pb60 W960">
                                <p class="point_step f_left">Point 1</p>
                                <hr>
                                <div class="W50 f_left t_left">
                                    <p class="point_slogan f30 CJK_b pb15">
                                        <span class="f45 f_pink">質地柔滑</span> 畫出精緻妝容
                                    </p>
                                    
                                    <p class="f18">棒狀式粉底給人印象總是硬又難用？，<br />奇肌無瑕水感BB棒特點是既柔軟又好推。<br />簡單、快速，輕鬆上妝，打造精緻底妝！</p>
                                </div>
                                <img src="<!--{$smarty.const.HTTPS_URL}-->user_data/new_201811/img/product/bb/img-point-1-bb-01.jpg" class="W50 f_right" alt="">
                                
                            </div>
                            <div class="point_2 W960" style="background: #fff1ec;">
                                <p class="point_step">Point 2</p>
                                <p class="point_slogan f30 f_pink">
                                    毛孔斑點自然遮蓋！
                                </p>
                                <p class="point_des f18">
                                    爲了遮蓋肌膚煩惱，內含３種高效修容配方！
                                </p>
                                <ul class="point_list t_left f18 mt30">
                                    <li><font class="f_pink f_b">一 超柔焦粉末，</font>能均勻地沾附於肌膚上，光線折射後散發出無色差明亮膚色，有效遮瑕斑點、細紋及毛孔。</li>
                                    <li><font class="f_pink f_b">二 凹凸修正防護網，</font>深入肌膚瑕疵處，填平凹洞，讓您的細紋及毛孔自然遮瑕。</li>
                                    <li><font class="f_pink f_b">三 高效亮彩粉末，</font>使用粉色粉末有效使肌膚紅潤有氣色，消除暗沉。</li>
                                </ul>
                                <div class="W100">
                                    <img src="<!--{$smarty.const.HTTPS_URL}-->user_data/new_201811/img/product/bb/img-point-2-bb-02.png" width="645" alt="">
                                </div>
                            </div>
                            
                            <div class="point_3 W960">
                                <p class="point_step">Point 3</p>
                                <p class="point_slogan f24">
                                我們的堅持！<br><span class="f30">對於肌膚，只使用最</span><span class="f36 f_pink">安心安全</span>的成分！<br>
                                <span class="f30">堅持</span><span class="f36 f_pink"><font class="f60">7</font>大無添加成分</span>
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
                    <img src="<!--{$smarty.const.HTTPS_URL}-->user_data/new_201811/img/product/cg/bg-fruit-1.png" alt="" class="flower f1">
                    <img src="<!--{$smarty.const.HTTPS_URL}-->user_data/new_201811/img/product/cg/bg-fruit-2.png" alt="" class="flower f2">
                    <img src="<!--{$smarty.const.HTTPS_URL}-->user_data/new_201811/img/product/cg/bg-fruit-3.png" alt="" class="flower f3">
                    <img src="<!--{$smarty.const.HTTPS_URL}-->user_data/new_201811/img/product/cg/bg-fruit-4.png" alt="" class="flower f4">
                    <img src="<!--{$smarty.const.HTTPS_URL}-->user_data/new_201811/img/product/cg/bg-fruit-5.png" alt="" class="flower f5">

                        
                </div>

                <div class="sec4 W100">
                    <h3 class="f36 f_white">
                        <span class="f48">Development Story</span>
                        研發故事
                    </h3>
                </div>

                <div class="sec5 W100">
                    <div class="W1200">
                        <img src="<!--{$smarty.const.HTTPS_URL}-->user_data/new_201811/img/product/bb/img-boss.jpg" alt="" class="people">    
                        <div class="des">
                            <p class="ori f15">開發的原點</p>
                            <p class="said CJK_b f24">
                                新手化妝不擔心！<br>出門約會前30秒即完成。
                            </p>   
                            <p class="f18">
                                自從生了小孩之後就沒有辦法有足夠的時間好好化妝，所以我一直想要開發出「不用花時間也能輕鬆畫出完美底妝」的產品！<br /><br />
                                奇肌無瑕水感BB棒，高含94％美容液成分，冰淇淋般的柔密質地，能在肌膚上瞬間化開，即便是新手化妝也不用擔心，輕鬆無壓力地完成專業底妝。所以現在我能夠快速完成專業底妝，讓自己更漂亮之外也完美地兼顧了母親及妻子的角色唷！
                            </p>
                            <p class="ps f15">
                                溫奇肌無瑕水感BB棒開發者<br />
                                製品開發部 佐佐木 美繪<br />
                                1976年出生，曾任某日系大牌的美容諮詢顧問10年之久，服務近3萬人，針對顧客的肌膚煩惱給予保養建議。在美妝保養檢定獲連續3年最優秀賞。於2010年加入日本曼娜麗，現任總社的製品開發部負責人。
                            </p>
                        </div>
                    </div>
                </div>

                <div class="sec6 W100 bg_red f_white">
                    <div class="W1200">
                        <p class="f48">HOW to USE</p>
                        <p class="f24">奇肌無瑕水感BB棒的正確使用方式</p>
                    </div>
                    
                </div>

                <div class="sec7 W100">
                    <div class="W1200">
                        <div class="W50 inline">
                            <h6 class="f_white f18" style="background:#beae77">使用方法</h6>
                            <ul class="W100 use_step">
                                <li class="W50">
                                    <img src="<!--{$smarty.const.HTTPS_URL}-->user_data/new_201811/img/product/bb/img-bb-step-a-1.jpg" alt="">
                                    <p class="f21 f_b">旋轉出奇肌無瑕水感BB棒</p>
                                    <p class="f15">旋出5mm長度，於額頭輕抹1道、臉頰２〜3道粉底。</p>
                                </li>
                                <li class="W50">
                                    <img src="<!--{$smarty.const.HTTPS_URL}-->user_data/new_201811/img/product/bb/img-bb-step-a-2.jpg" alt="">
                                    <p class="f21 f_b">均勻塗抹全臉</p>
                                    <p class="f15">以手或海綿均勻推開，鼻子周圍以多餘的粉按壓即可。特別在意的部分可加強堆疊，完美遮瑕不厚重。
                                    </p>
                                </li>
                            </ul>
                        </div>
                        <div class="W50 inline">
                            <h6 class="f_white f18" style="background:#ff8c93">肌膚煩惱小技巧</h6>
                            <ul class="W100 use_step">
                                <li class="W50 hidden_arrow">
                                    <img src="<!--{$smarty.const.HTTPS_URL}-->user_data/new_201811/img/product/bb/img-bb-step-b-1.jpg" alt="">
                                    <p class="f21 f_b">在意毛孔的您</p>
                                    <p class="f15">旋出5mm長度，於額頭輕抹1道、臉頰２〜3道粉底。</p>
                                </li>
                                <li class="W50">
                                    <img src="<!--{$smarty.const.HTTPS_URL}-->user_data/new_201811/img/product/bb/img-bb-step-b-2.jpg" alt="">
                                    <p class="f21 f_b">在意斑點的您</p>
                                    <p class="f15">用指腹沾取奇肌無瑕水感BB後，在斑點處用指腹輕輕按壓堆疊，自然遮瑕。<br/><img src="<!--{$smarty.const.HTTPS_URL}-->user_data/new_201811/img/product/bb/img-bb-step-b-3.jpg" class="step_img" /></p>
                                </li>
                            </ul>
                        </div>
                    </div>
                    
                    
                    <div class="W1200 video_wrap">
                        <div class="W67">
                            <img src="<!--{$smarty.const.HTTPS_URL}-->user_data/new_201811/img/product/video_frame.png" alt="" width="100%">
                            <iframe width="100%" class="poA" src="https://www.youtube.com/embed/wFIX3JCS5Ec" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                        </div>
                        
                        <div class="poA txt f_red pc">
                            <img src="<!--{$smarty.const.HTTPS_URL}-->user_data/new_201811/img/icon/icon-video.svg" alt="">
                            <p class="f30">觀看使用影片</p>
                            <p class="f16">VIDEO</p>
                        </div>

                    </div>
                    <div class="day_night f21">
                        <div class="W33">
                            <h5 class="night f_white"><img src="<!--{$smarty.const.HTTPS_URL}-->user_data/new_201811/img/product/icon/icon-night.svg" class="icon">夜間保養順序</h5>
                            <ul class="W100">
                                <li class="W50">
                                    <div class="img_wrapper"><img src="<!--{$smarty.const.HTTPS_URL}-->user_data/new_201811/img/product/cg/cg.png" alt=""></div>
                                    <p class="f18">溫熱卸妝凝膠</p>
                                    <p class="f15">HOT CLEANING GEL</p>
                                    <img src="<!--{$smarty.const.HTTPS_URL}-->user_data/new_201811/img/product/icon/icon-next-night.svg" class="icon">
                                </li>
                                <li class="W50" data-href="OE.php">
                                    <div class="img_wrapper"><img src="<!--{$smarty.const.HTTPS_URL}-->user_data/new_201811/img/product/oe/oe.png" alt=""></div>
                                    <p class="f18">全效活膚保濕精華露</p>
                                    <p class="f15">ONLY ESSENCE</p>
                                </li>
                            </ul>
                        </div>
                        <div class="W67">
                            <h5 class="day W60 f_white"><img src="<!--{$smarty.const.HTTPS_URL}-->user_data/new_201811/img/product/icon/icon-day.svg" class="icon">晨間保養順序</h5>
                            <ul class="W100">
                                <li class="W25" data-href="MG.php">
                                    <div class="img_wrapper"><img src="<!--{$smarty.const.HTTPS_URL}-->user_data/new_201811/img/product/mg/mg.png" alt=""></div>
                                    <p class="f18">深層毛孔洗顏凝膠</p>
                                    <p class="f15">MOIST WASH GEL</p>
                                    <img src="<!--{$smarty.const.HTTPS_URL}-->user_data/new_201811/img/product/icon/or.png" class="icon">

                                </li>
                                <li class="W25" data-href="TW.php">
                                    <div class="img_wrapper"><img src="<!--{$smarty.const.HTTPS_URL}-->user_data/new_201811/img/product/ns/ns.png" alt=""></div>
                                    <p class="f18">毛孔無瑕礦泥洗顏粉</p>
                                    <p class="f15">NAMA NERI WASH</p>
                                    <img src="<!--{$smarty.const.HTTPS_URL}-->user_data/new_201811/img/product/icon/icon-next-day.svg" class="icon">

                                </li>
                                <li class="W25" data-href="OE.php">
                                    <div class="img_wrapper"><img src="<!--{$smarty.const.HTTPS_URL}-->user_data/new_201811/img/product/oe/oe.png" alt=""></div>
                                    <p class="f18">全效活膚保濕精華露</p>
                                    <p class="f15">ONLY ESSENCE</p>
                                </li>

                                <li class="W25" data-href="BB.php">
                                    <div class="img_wrapper" style="background-color:#d8be90"><img src="<!--{$smarty.const.HTTPS_URL}-->user_data/new_201811/img/product/bb/bb.png" alt=""></div>
                                    <p class="f18">奇肌無瑕水感BB棒</p>
                                    <p class="f15">BB LIQUID BAR</p>
                                    <img src="<!--{$smarty.const.HTTPS_URL}-->user_data/new_201811/img/product/icon/icon-next-day.svg" class="icon before">
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>

                <div class="sec8 W100">
                    <div class="info_table W1200 f15">
                        <div class="W50">
                            <div class="th">產品名稱</div>
                            <div class="td p_name">奇肌無瑕水感BB棒</div>
                        </div>
                        <div class="W50">
                            <div class="th">容量</div>
                            <div class="td">7g(約可使用3~4個月)</div>
                        </div>
                        <div class="W100">
                            <div class="th">使用時間</div>
                            <div class="td">防曬修容使用</div>
                        </div>
                        <div class="W100">
                            <div class="th">成分</div>
                            <div class="td">異十三醇異壬酸酯、氧化鈦、聚二甲基矽氧烷、二苯基甲矽烷氧基苯基聚三甲基矽氧烷、氧化鋅、月桂醯離胺酸、聚乙烯、去水山梨糖醇異硬脂酸酯、三異辛酸甘油酯、合成蠟、（二甲基矽氧烷/乙烯基二甲基矽氧烷）聚合物、聚甲基矽氧烷、二氧化矽、玻尿酸鈉、水解玻尿酸、乙基玻尿酸鈉、神經醯胺３、神經醯胺６Ⅱ、神經醯胺２、水解膠原蛋白、葛根根部萃取物、黃豆種子萃取物、月見草種子萃取物、七葉樹種子萃取物、石榴果實萃取物、3-O-乙基抗壞血酸、α-熊果素、熊果素、抗壞血酸二棕櫚酸酯、抗壞血酸四己基癸酸酯、抗壞血酸棕櫚酸酯磷酸酯三鈉、朝鮮薊葉萃取物、甘油、二十二醇、水、BG、乳油木果油、雲母、硬脂醇甘草酸酯、生育酚、水合二氧化矽、堪地理拉蠟、戊二醇、蔗糖醋酸硬脂酸酯、氫化二甲基矽氧烷、聚甘油-10 五硬脂酸酯、硬脂醯乳酸鈉、植物固醇異硬脂酸酯、氧化鐵、氫氧化鋁</div>
                        </div>
                    </div>
                </div>

                <div class="sec9 W100">
                    <div class="all_">
                        <h4 class="f30 f_red W100">MANARA全系列產品</h4>
                        <p class="f18 W100">了解更多關於MANARA的全系列產品</p>
                        <a href="javascript:;"><img src="<!--{$smarty.const.HTTPS_URL}-->user_data/new_201811/img/product/icon/icon-more.svg" alt=""></a>
                    </div>
                    <ul class="W1200">
                        <li class="W33" data-href="faq.php">
                            <img src="<!--{$smarty.const.HTTPS_URL}-->user_data/new_201811/img/product/icon/icon-qa.png" alt="">
                            <div class="des">
                                <p class="f21">常見問題</p>
                                <p class="f15">產品的使用上有任何問題都可以在這裡找到解答。</p>
                            </div>
                        </li>
                        <li class="W33" data-href="regular.php">
                            <img src="<!--{$smarty.const.HTTPS_URL}-->user_data/new_201811/img/product/icon/icon-regular.png" alt="">
                            <div class="des">
                                <p class="f21">定期方案</p>
                                <p class="f15">選擇定期方案，為您帶來輕鬆無負擔的美麗。</p>
                            </div>
                        </li>
                        <li class="W33" data-href="features.php">
                            <img src="<!--{$smarty.const.HTTPS_URL}-->user_data/new_201811/img/product/icon/icon-heart.png" alt="">
                            <div class="des">
                                <p class="f21">品牌故事</p>
                                <p class="f15">了解更多MANARA及我們的用心。</p>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        <!-- CONTENT END -->
        <link rel="stylesheet" href="new_201811/css/new_init.css" />
        <link rel="stylesheet" href="new_201811/css/new_product.css?v=123" />
        <link rel="stylesheet" href="new_201811/css/bb.css?v=123" />


        <script src="new_201811/js/init.js"></script>
        
        <!--   肚子結束  -->
       


    </div>
</div>   




 <script type="text/javascript" src="new_201811/js/product.js"></script>


<?php include '../footer.php'; ?> 
