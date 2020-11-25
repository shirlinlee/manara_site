
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
                <div class="sec1">
                    <div class="product_pic W50 f_left" style="background-image: url(new_201811/img/product/oe/main-img-oe.jpg)">
                        <img src="<!--{$smarty.const.HTTPS_URL}-->user_data/new_201811/img/product/oe/main-img-m-oe.jpg" class="mb" alt="">
                    </div>
                    <div class="W50 poA t_left">
                        <div class="awrd_area">
                            <img src="<!--{$smarty.const.HTTPS_URL}-->user_data/new_201811/img/product/award-gold.png" class="pc" width="65" alt="">
                        </div>
                        <p class="f_golden f24 CJK_b">1瓶就搞定!</p>
                        <h3 class="f40 CJK">實現<font class="f_red CJK_b">緊緻美肌</font></h3>
                        <p class="f24">全效活膚保濕精華露</p>
                        <p class="f15">富含滿滿的美容精華成分，細緻毛孔，改善暗沉，回復肌膚彈力光澤。</p>
                        <div class="price_area">
                            <div class="add-product W50">
                                <div class="product-input f15">
                                    定期價格<font class="f30 f_red">$1,440</font>
                                    <img src="<!--{$smarty.const.HTTPS_URL}-->user_data/new_201811/img/product/icon-20-off.png" class="off_20" alt="">
                                </div>
                                
                                <form action="<!--{$smarty.const.ROOT_URLPATH}-->products/detail.php" method="post">
                                    <input type="hidden" name="mode" value="cart"><!-- 固定値'cart' -->
                                    <input type="hidden" name="product_id" value="200001390"><!-- 商品ID -->
                                    <input type="hidden" name="product_class_id" value="200001391"><!-- 商品クラスID -->
                                    <input type="hidden" name="regular_purchase_flg" value="1"><!-- 定期:1/都度:0で値送信 -->
                                    <input type="hidden" id="price_1" value="1440"><!--　商品単価 -->
                                    <div class="product-input" style="display:none">
                                        <select class="kui-select" name="quantity" id="quantity_1" onchange="onChangeQuantity(this)"><!-- 数量 -->
                                            <option value="1">1</option>
                                        </select>
                                    </div>
                                    <div class="add-button">
                                        <button type="submit" class="btn f_white bg_red">
                                            <span>一般型 - 定期購買</span>
                                        </button>
                                    </div>
                                </form>

                                <form action="<!--{$smarty.const.ROOT_URLPATH}-->products/detail.php" method="post">
                                    <input type="hidden" name="mode" value="cart"><!-- 固定値'cart' -->
                                    <input type="hidden" name="product_id" value="200001390"><!-- 商品ID -->
                                    <input type="hidden" name="product_class_id" value="200001391"><!-- 商品クラスID -->
                                    <input type="hidden" name="regular_purchase_flg" value="1"><!-- 定期:1/都度:0で値送信 -->
                                    <input type="hidden" id="price_1" value="1440"><!--　商品単価 -->
                                    <div class="product-input" style="display:none">
                                        <select class="kui-select" name="quantity" id="quantity_1" onchange="onChangeQuantity(this)"><!-- 数量 -->
                                            <option value="1">1</option>
                                        </select>
                                    </div>
                                    <div class="add-button">
                                        <button type="submit" class="btn f_white bg_gold">
                                            <span>極潤型 - 定期購買</span>
                                        </button>
                                    </div>
                                </form>



                                <h6 class="f_red info info_regular"><i class="">i</i><span>定期更優惠方案!</span></h6>
                            </div>
                            <div class="add-product W50">
                                <div class="product-input f15">
                                    一般售價<font> $1,800</font>
                                </div>
                                
                                <form action="<!--{$smarty.const.ROOT_URLPATH}-->products/detail.php" method="post">
                                    <input type="hidden" name="mode" value="cart">
                                    <input type="hidden" name="mode" value="cart">
                                    <input type="hidden" name="product_id" value="200001382">
                                    <input type="hidden" name="product_class_id" value="200001383">
                                    <input type="hidden" name="regular_purchase_flg" value="0">
                                    <input type="hidden" id="price_2" value="1800">
                                    <div class="product-input" style="display:none">
                                        <select class="kui-select" name="quantity" id="quantity_2" onchange="onChangeQuantity(this)">
                                        <option value="1">1</option>
                                        </select>
                                    </div>
                                    <div class="add-button">
                                        <button type="submit" class="btn_black">
                                            <span>一般型 - 直接購買</span>
                                        </button>
                                    </div>
                                </form>

                                <form action="<!--{$smarty.const.ROOT_URLPATH}-->products/detail.php" method="post">
                                    <input type="hidden" name="mode" value="cart">
                                    <input type="hidden" name="mode" value="cart">
                                    <input type="hidden" name="product_id" value="200001382">
                                    <input type="hidden" name="product_class_id" value="200001383">
                                    <input type="hidden" name="regular_purchase_flg" value="0">
                                    <input type="hidden" id="price_2" value="1800">
                                    <div class="product-input" style="display:none">
                                        <select class="kui-select" name="quantity" id="quantity_2" onchange="onChangeQuantity(this)">
                                        <option value="1">1</option>
                                        </select>
                                    </div>
                                    <div class="add-button">
                                        <button type="submit" class="btn_gold">
                                            <span>極潤型 - 直接購買</span>
                                        </button>
                                    </div>
                                </form>

                            </div>
                            
                        </div>
                    </div>
                </div>
                <div class="sec2 W100">
                   <h2 class="f40 CJK_b f_white">榮獲「世界品質評鑑大賞」<br class="mb">金賞的肯定</h2>
                </div>
                <div class="sec3 W100" style="background-color:#fbebe1">
                    <div class="W1200">
                    
                        <h5 class="f36 CJK_b">All in One<br>全效合一美容精華液</h5>
                    </div>
                    <div class="W1200 bg_white">
                        <div class="intro_1 W1030">
                            <img src="<!--{$smarty.const.HTTPS_URL}-->user_data/new_201811/img/product/oe/banner-oe-001.jpg" class="W100 pc" alt="">
                            <img src="<!--{$smarty.const.HTTPS_URL}-->user_data/new_201811/img/product/oe/banner-oe-m-001.jpg" class="W100 mb" alt="">
                        </div>
                        <div class="intro_2 W1030">
                            <h4 class="f_white CJK_b f36">一般型</h4>
                            <div class="details W100">
                                <div class="img_wrapper W40">
                                    <img src="<!--{$smarty.const.HTTPS_URL}-->user_data/new_201811/img/product/oe/oe.png" class="poA pro" alt="">
                                </div> 
                                <div class="detail_wrapper t_left W60">
                                    <h5 class="f24">全效活膚保濕精華露 - 一般型<span class="f15 f_grey">ONLY ESSENCE</span></h5>
                                    <p class="f18">富含滿滿的美容精華成分，細緻毛孔，改善暗沉，<br>回復肌膚彈力光澤。適合普通、混合及乾燥肌。</p>
                                    <p class="f15">容量：100ml</p>
                                    <div class="price_area">
                                        <div class="add-product W50">
                                            <div class="product-input f15">
                                                定期價格<font class="f30 f_red">$1,440</font>
                                                <img src="<!--{$smarty.const.HTTPS_URL}-->user_data/new_201811/img/product/icon-20-off.png" class="off_20" alt="">
                                            </div>
                                            
                                            <form action="<!--{$smarty.const.ROOT_URLPATH}-->products/detail.php" method="post">
                                                <input type="hidden" name="mode" value="cart"><!-- 固定値'cart' -->
                                                <input type="hidden" name="product_id" value="200001390"><!-- 商品ID -->
                                                <input type="hidden" name="product_class_id" value="200001391"><!-- 商品クラスID -->
                                                <input type="hidden" name="regular_purchase_flg" value="1"><!-- 定期:1/都度:0で値送信 -->
                                                <input type="hidden" id="price_1" value="1440"><!--　商品単価 -->
                                                <div class="product-input" style="display:none">
                                                    <select class="kui-select" name="quantity" id="quantity_1" onchange="onChangeQuantity(this)"><!-- 数量 -->
                                                        <option value="1">1</option>
                                                    </select>
                                                </div>
                                                <div class="add-button">
                                                    <button type="submit" class="btn f_white bg_red">
                                                        <span>一般型 - 定期購買</span>
                                                    </button>
                                                </div>
                                            </form>



                                            <h6 class="f_red info info_regular"><i class="">i</i><span>定期更優惠方案!</span></h6>
                                        </div>
                                        <div class="add-product W50">
                                            <div class="product-input f15">
                                                一般售價<font> $1,800</font>
                                            </div>
                                            
                                            <form action="<!--{$smarty.const.ROOT_URLPATH}-->products/detail.php" method="post">
                                                <input type="hidden" name="mode" value="cart">
                                                <input type="hidden" name="mode" value="cart">
                                                <input type="hidden" name="product_id" value="200001382">
                                                <input type="hidden" name="product_class_id" value="200001383">
                                                <input type="hidden" name="regular_purchase_flg" value="0">
                                                <input type="hidden" id="price_2" value="1800">
                                                <div class="product-input" style="display:none">
                                                    <select class="kui-select" name="quantity" id="quantity_2" onchange="onChangeQuantity(this)">
                                                    <option value="1">1</option>
                                                    </select>
                                                </div>
                                                <div class="add-button">
                                                    <button type="submit" class="btn_black">
                                                        <span>一般型 - 直接購買</span>
                                                    </button>
                                                </div>
                                            </form>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div> 

                        <div class="intro_2 W1030 oem">
                            <h4 class="f_white CJK_b f36">極潤型</h4>
                            <div class="details W100">
                                <div class="img_wrapper W40">
                                    <img src="<!--{$smarty.const.HTTPS_URL}-->user_data/new_201811/img/product/oe/oem.png" class="poA pro" alt="">
                                </div> 
                                <div class="detail_wrapper t_left W60">
                                    <h5 class="f24">全效活膚保濕精華露 - 極潤型<span class="f15 f_grey">ONLY ESSENCE MOIST</span></h5>
                                    <p class="f18">富含滿滿的美容精華成分，細緻毛孔，改善暗沉，<br>回復肌膚彈力光澤。適合超乾燥肌。</p>
                                    <p class="f15">容量：100ml</p>
                                    <div class="price_area">
                                        <div class="add-product W50">
                                            <div class="product-input f15">
                                                定期價格<font class="f30 f_red">$1,440</font>
                                                <img src="<!--{$smarty.const.HTTPS_URL}-->user_data/new_201811/img/product/icon-20-off.png" class="off_20" alt="">
                                            </div>
                                            
                                            <form action="<!--{$smarty.const.ROOT_URLPATH}-->products/detail.php" method="post">
                                                <input type="hidden" name="mode" value="cart"><!-- 固定値'cart' -->
                                                <input type="hidden" name="product_id" value="200001390"><!-- 商品ID -->
                                                <input type="hidden" name="product_class_id" value="200001391"><!-- 商品クラスID -->
                                                <input type="hidden" name="regular_purchase_flg" value="1"><!-- 定期:1/都度:0で値送信 -->
                                                <input type="hidden" id="price_1" value="1440"><!--　商品単価 -->
                                                <div class="product-input" style="display:none">
                                                    <select class="kui-select" name="quantity" id="quantity_1" onchange="onChangeQuantity(this)"><!-- 数量 -->
                                                        <option value="1">1</option>
                                                    </select>
                                                </div>
                                                <div class="add-button">
                                                    <button type="submit" class="btn f_white bg_gold">
                                                        <span>極潤型 - 定期購買</span>
                                                    </button>
                                                </div>
                                            </form>



                                            <h6 class="f_red info info_regular"><i class="">i</i><span>定期更優惠方案!</span></h6>
                                        </div>
                                        <div class="add-product W50">
                                            <div class="product-input f15">
                                                一般售價<font> $1,800</font>
                                            </div>
                                            
                                            <form action="<!--{$smarty.const.ROOT_URLPATH}-->products/detail.php" method="post">
                                                <input type="hidden" name="mode" value="cart">
                                                <input type="hidden" name="mode" value="cart">
                                                <input type="hidden" name="product_id" value="200001382">
                                                <input type="hidden" name="product_class_id" value="200001383">
                                                <input type="hidden" name="regular_purchase_flg" value="0">
                                                <input type="hidden" id="price_2" value="1800">
                                                <div class="product-input" style="display:none">
                                                    <select class="kui-select" name="quantity" id="quantity_2" onchange="onChangeQuantity(this)">
                                                    <option value="1">1</option>
                                                    </select>
                                                </div>
                                                <div class="add-button">
                                                    <button type="submit" class="btn_gold">
                                                        <span>極潤型 - 直接購買</span>
                                                    </button>
                                                </div>
                                            </form>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div> 

                        <div class="oe_Q W1030 W100">
                            <div class="W33">
                                <img src="<!--{$smarty.const.HTTPS_URL}-->user_data/new_201811/img/product/oe/img-oe-point-4.jpg" alt="">
                            </div>
                            <div class="W67">
                                <h5 class="f30 t_left">
                                全效活膚保濕精華露<br />一般型 和 極潤型 有什麼不同呢？
                                </h5>
                                <div class="t_left">
                                    <p class="f24 f_red t_left">可依據您的肌膚狀況需求和個人喜好做選擇。</p>
                                    <p class="f18"><font class="f_red f_b">一般型</font> 延展性佳，質地接近乳液狀，快速吸收不粘膩。推薦<font class="f_b">中性肌、油性肌</font>使用。<br /><font class="f_red f_b">極潤型</font> 濃厚乳霜狀。能僅僅鎖住肌膚表面油份和水分，推薦<font class="f_b">乾燥肌</font>使用。</p>
                                    <p class="f18">也可依季節更換使用，春夏推薦一般型，秋冬可用極潤型保濕效果更佳。</p>
                                    <p class="f18">若擔心肌膚不適，可來電索取試用包。</p>
                                </div>
                            </div>
                        </div>
                        
                        <div class="intro_3">
                            <div class="point_1 oe pb40 W1030">
                                <p class="point_step">Point 1</p>
                                <p class="point_slogan f45 f_pink">
                                    細緻毛孔專科!
                                </p>
                                <div class="W100 f_white">
                                    <p class="f36 dialog">〈全效活膚保濕精華露〉添加了<br>可以大量增加優質皮脂素</p>
                                    <p class="f40">ケアナリア（RAR)</p>
                                    <img src="<!--{$smarty.const.HTTPS_URL}-->user_data/new_201811/img/product/oe/img-oe-graphic.png" class="W100" alt="">
                                </div>
                            </div>
                            <div class="point_2 oe W1030">
                                <div class="W50 f_left t_left">
                                    <p class="point_step">Point 2</p>
                                    <p class="point_slogan f_pink f45">
                                        抗老化保養<br>
                                        <span class="f30 f_black">全效合一，一瓶搞定!</span>
                                    </p>
                                    <p class="point_des f18">
                                    富含「玻尿酸」及「膠原蛋白」等58種美容精華成分，能細緻毛孔，改善暗沉，回復肌膚彈力光澤!
                                    </p>
                                </div> 
                                <img src="<!--{$smarty.const.HTTPS_URL}-->user_data/new_201811/img/product/oe/img-oe-point-2.jpg" class="W50" alt="">
                            </div>
                            <div class="point_3 W1030">
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

                    <img src="<!--{$smarty.const.HTTPS_URL}-->user_data/new_201811/img/product/oe/bg-leaf-oe-r.png" alt="" class="flower f7">
                    <img src="<!--{$smarty.const.HTTPS_URL}-->user_data/new_201811/img/product/oe/bg-leaf-oe-l.png" alt="" class="flower f6">
                    <img src="<!--{$smarty.const.HTTPS_URL}-->user_data/new_201811/img/product/bg-leaf-2.png" alt="" class="flower f8">
                    <img src="<!--{$smarty.const.HTTPS_URL}-->user_data/new_201811/img/product/bg-leaf-3.png" alt="" class="flower f9">
                    <img src="<!--{$smarty.const.HTTPS_URL}-->user_data/new_201811/img/product/bg-leaf-4.png" alt="" class="flower f10">


                        
                </div>

                <div class="sec4 W100" style="background-image:url(new_201811/img/product/oe/banner-story-oe.jpg)">
                    <h3 class="f36 f_white">
                        <span class="f48">Development Story</span>
                        研發故事
                    </h3>
                </div>

                <div class="sec5 W100">
                    <div class="W1200">
                        <img src="<!--{$smarty.const.HTTPS_URL}-->user_data/new_201811/img/product/oe/img-ueru.jpg" alt="" class="people">    
                        <div class="des">
                            <p class="ori f15">開發的原點</p>
                            <p class="said CJK_b f24">
                            粗大毛孔<br>無法靠保養而改善嗎 ?!
                            </p>   
                            <p class="f18">
                            數年前，喜愛溫熱卸妝凝膠的顧客告訴我們，<br>「溫熱卸妝凝膠改善了黑頭粉刺，但毛孔粗大仍無法改善？！」「肌膚做足夠保濕了，但毛孔仍卻非常的明顯！」讓我燃起了想要解決顧客毛孔問題的使命感！進而開始開發產品。<br><br>進一步發現肌膚皮脂有分兩種，一種為惡質；另一種為優質皮脂。當惡質皮脂較多時，肌膚則會呈現毛孔粗大、粗糙等狀況，並且根據法國美容界報導，有效抑制惡質皮脂的成分即是『ケアナリア』，經過一番努力後，成功地開發了有效改善毛孔的全效保養品。<br><br>
                            </p>
                            <p class="ps f15">
                            全效活膚精華露開發者<br>
                            製品開發部 向井 真理子<br>
                            1984年出生，曾任某日系大牌的美容諮詢專員，活用自身擁有豐富的美容知識及對於追求美的熱情，去服務每一位顧客，並且持續是顧客指定服務專員NO.1，對於難以改善的肌膚煩惱，總是具有挑戰及積極地去解決它。
                            </p>
                        </div>
                    </div>
                    
                </div>

                <div class="sec6 W100 bg_red f_white">
                    <div class="W1200">
                        <p class="f48">HOW to USE</p>
                        <p class="f24">全效活膚保濕精華露的正確使用方式</p>
                    </div>
                    
                </div>

                <div class="sec7 W100">
                    <ul class="use_step W100">
                        <li>
                        <img src="<!--{$smarty.const.HTTPS_URL}-->user_data/new_201811/img/product/oe/img-oe-step-1.jpg" alt="">
                        <p class="f21 f_b">洗完臉後的保養</p>
                        <p class="f15">於卸妝洗臉之後，<span class="f_pink">按壓３次</span>於手掌心。</p>

                        </li>
                        <li>
                        <img src="<!--{$smarty.const.HTTPS_URL}-->user_data/new_201811/img/product/oe/img-oe-step-2.jpg" alt="">
                        <p class="f21 f_b">滲透吸收</p>
                        <p class="f15">臉部整體均勻塗抹後，<span class="f_pink">用手掌輕壓使其滲透吸收</span>。</p>
                        </li>
                        <li>
                        <img src="<!--{$smarty.const.HTTPS_URL}-->user_data/new_201811/img/product/oe/img-oe-step-3.jpg" alt="">
                        <p class="f21 f_b">重點加強</p>
                        <p class="f15"><span class="f_pink">再按壓１次</span>，均勻塗抹在<span class="f_pink">毛孔粗大</span>或較<span class="f_pink">乾燥</span>等比較在意的部位。</p>
                        </li>

                    </ul>
                    <div class="W1200 video_wrap">
                        <div class="W67">
                            <img src="<!--{$smarty.const.HTTPS_URL}-->user_data/new_201811/img/product/video_frame.png" alt="" width="100%">
                            <iframe width="100%" class="poA" src="https://www.youtube.com/embed/ivnChpGRjQs" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
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
                                    <div class="img_wrapper" style="background-color:#fbebe1"><img src="<!--{$smarty.const.HTTPS_URL}-->user_data/new_201811/img/product/oe/oem_oe.png" alt=""></div>
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
                                    <div class="img_wrapper" style="background-color:#fbebe1"><img src="<!--{$smarty.const.HTTPS_URL}-->user_data/new_201811/img/product/oe/oem_oe.png" alt=""></div>
                                    <p class="f18">全效活膚保濕精華露</p>
                                    <p class="f15">ONLY ESSENCE</p>
                                </li>

                                <li class="W25" data-href="BB.php">
                                    <div class="img_wrapper"><img src="<!--{$smarty.const.HTTPS_URL}-->user_data/new_201811/img/product/bb/bb.png" alt=""></div>
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
                            <div class="td p_name">全效活膚保濕精華露（一般型・極潤型）</div>
                        </div>
                        <div class="W50">
                            <div class="th">容量</div>
                            <div class="td">100ml(約可使用2個月)</div>
                        </div>
                        <div class="W100">
                            <div class="th">使用時間</div>
                            <div class="td">日、夜間皆可使用</div>
                        </div>
                        <div class="W100">
                            <div class="th">成分</div>
                            <div class="td">水、甘油、1,3-丙二醇、辛酸/癸酸三酸甘油脂、戊二醇、丁二醇、雙甘油、乳油木果脂、菜薊葉萃取、白花菜葉萃取、胚胎蛋白、蜂王漿萃取、α熊果苷、水解膠原蛋白、可溶性膠原、琥珀去端肽膠原、乙醯基十肽-3、寡肽-24、1,10-癸二醇、10-羥基癸酸、吡咯烷酮羧酸、甘氨酸、丙氨酸、異亮氨酸、精氨酸、天冬氨酸、蘇氨酸、脯氨酸、苯丙氨酸、組氨酸、絲氨酸、癸二酸、纈氨酸、水解歐洲李、紫松果菊萃取、葡萄藤萃取、可溶性蛋白多糖、月見草籽萃取、野大豆籽萃取、歐洲七葉樹籽萃取、石榴果萃取、泰國野葛根萃取、酵母菌溶胞物萃取、超氧化物歧化酶、鞘安醇單胞菌發酵產物萃取、乙基玻尿酸鈉、水解透明質酸、波釀酸鈉、摩洛哥堅果油、猴麵包樹籽油、黃蘖樹皮萃取、聚季銨鹽-61、氫氧化鈉、生育醇、咯烷酮羧酸鈉、乳酸鈉、聚甘油-10、肉豆蔻酸酯、丙烯酸羥乙酯/丙烯二甲基牛磺酸鈉共聚物、丙烯酸丁酯/異丙基丙烯醯胺PEG18、二甲基丙烯酸酯交聯共聚物、雜薰衣草油、甜橙果皮油、卡莫波、苯氧乙醇</div>
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
        <link rel="stylesheet" href="new_201811/css/new_product.css?v=1226" />
        <link rel="stylesheet" href="new_201811/css/new_oe.css?v=0409" />


        <script src="new_201811/js/init.js"></script>

        <!--   肚子結束  -->
        


    </div>
</div>   




<script type="text/javascript" src="new_201811/js/product.js"></script>

<?php include '../footer.php'; ?> 
