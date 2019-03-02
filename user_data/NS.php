
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
                    <div class="product_pic W50 f_left" style="background-image: url(new_201811/img/product/ns/main-img-ns.jpg)">
                        <img src="<!--{$smarty.const.HTTPS_URL}-->user_data/new_201811/img/product/ns/main-img-m-ns.jpg" class="mb" alt="">
                    </div>

                    <div class="W50 poA t_left">
                        <p class="f_golden f24 CJK_b">粉刺對策</p>
                        <h3 class="f40 CJK"><font class="f_red CJK_b">毛孔淨化</font>超簡單</h3>
                        <p class="f24">毛孔無瑕礦泥洗顏粉</p>
                        <p class="f15">全新升級配方！使用更簡單～<br>擁有淨化毛孔3種酵素與吸附粉刺泥成分，將毛孔髒污吸附出來。並添加保濕精華油成分，洗完保濕不乾澀！</p>
                        <div class="price_area">
                            
                            <div class="add-product W50">
                                <div class="product-input f15">
                                    定期價格<font class="f30 f_red">$960</font>
                                    <img src="<!--{$smarty.const.HTTPS_URL}-->user_data/new_201811/img/product/icon-20-off.png" class="off_20" alt="">
                                </div>
                                <form action="<!--{$smarty.const.ROOT_URLPATH}-->products/detail.php" method="post">
                                    <!-- <input type="hidden" name="product_id" value="200001101">
                                    <input type="hidden" name="product_class_id" value="200001102"> -->
                                    <input type="hidden" name="mode" value="cart"><!-- 固定値'cart' -->
                                    <input type="hidden" name="product_id" value="200151424"><!-- 商品ID -->
                                    <input type="hidden" name="product_class_id" value="200151425"><!-- 商品クラスID -->
                                    <input type="hidden" name="regular_purchase_flg" value="1"><!-- 定期:1/都度:0で値送信 -->
                                    <input type="hidden" id="price_1" value="960"><!--　商品単価 -->
                                    <div class="product-input" style="display:none">
                                        <select class="kui-select" name="quantity" id="quantity_1" onchange="onChangeQuantity(this)"><!-- 数量 -->
                                        <option value="1">1</option>
                                        </select>
                                    </div>
                                    <div class="add-button">
                                        <button type="submit" class="btn f_white bg_red">
                                            <span>定期購買</span>
                                        </button>
                                    </div>
                                </form>
                                <h6 class="f_red info"><i class="">i</i><span>定期更優惠方案!</span></h6>
                            </div>
                            <div class="add-product W50">
                                <div class="product-input f15">
                                    一般售價<font> $1,200</font>
                                </div>
                                <form action="<!--{$smarty.const.ROOT_URLPATH}-->products/detail.php" method="post">
                                    <input type="hidden" name="mode" value="cart" />
                                    <!-- <input type="hidden" name="product_id" value="200000505">
                                    <input type="hidden" name="product_class_id" value="200000506"> -->
                                    <input type="hidden" name="mode" value="cart">
                                    <input type="hidden" name="product_id" value="200133986">
                                    <input type="hidden" name="product_class_id" value="200133987">
                                    <input type="hidden" name="regular_purchase_flg" value="0">
                                    <input type="hidden" id="price_2" value="1390">
                                    <div class="product-input" style="display:none">
                                        <select class="kui-select" name="quantity" id="quantity_2" onchange="onChangeQuantity(this)">
                                        <option value="1">1</option>
                                        </select>
                                    </div>
                                    <div class="add-button">
                                        <button type="submit" class="btn_black">
                                            <span>立即購買</span>
                                        </button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="sec2 W100">
                   <!-- <h2 class="f40 CJK_b f_white">連續10年 <br class="mb pad">榮獲「世界品質評鑑大賞」金賞的肯定</h2> -->
                </div>
                <div class="sec3 W100 bg_blue">
                    <div class="W1200">
                        <h5 class="f30 CJK_b">不須起泡的快速洗顏粉！<br>實現早晨可立即出門的夢想</h5>
                    </div>
                    <div class="W1200 bg_white">
                        <div class="W100 W960">
                            <img src="<!--{$smarty.const.HTTPS_URL}-->user_data/new_201811/img/product/ns/banner-ns-001.jpg" alt="" class="pc">
                            <img src="<!--{$smarty.const.HTTPS_URL}-->user_data/new_201811/img/product/ns/banner-ns-m-001.jpg" alt="" class="mb">
                        </div>
                        <div class="intro_2 W960">
                            <h4 class="f_white CJK_b f36">使用更簡單，粉末不再飛揚！</h4>
                            <div class="details W100">
                                <div class="img_wrapper W40">
                                    <img src="<!--{$smarty.const.HTTPS_URL}-->user_data/new_201811/img/product/ns/ns.png" class="poA pro" alt="">
                                </div> 
                                <div class="detail_wrapper t_left W60">
                                    <h5 class="f24">毛孔無瑕礦泥洗顏粉<img src="<!--{$smarty.const.HTTPS_URL}-->user_data/new_201811/img/product/icon-levelup.png" class="up_grade" alt=""><span class="f15 f_grey">NAMA NERI WASH</span></h5>
                                    <p class="f18">全新升級配方！使用更簡單～<br>擁有淨化毛孔3種酵素與吸附粉刺泥成分，將毛孔髒污吸附出來。並添加保濕精華油成分，洗完保濕不乾澀！</p>
                                    <p class="f15">容量：45g (約60日份)</p>
                                    <div class="price_area">
                                        <div class="add-product W50">
                                            <div class="product-input f15">
                                                定期價格<font class="f30 f_red">$960</font>
                                                <img src="<!--{$smarty.const.HTTPS_URL}-->user_data/new_201811/img/product/icon-20-off.png" class="off_20" alt="">
                                            </div>
                                            <form action="<!--{$smarty.const.ROOT_URLPATH}-->products/detail.php" method="post">
                                                <!-- <input type="hidden" name="product_id" value="200001101">
                                                <input type="hidden" name="product_class_id" value="200001102"> -->
                                                <input type="hidden" name="mode" value="cart"><!-- 固定値'cart' -->
                                                <input type="hidden" name="product_id" value="200151424"><!-- 商品ID -->
                                                <input type="hidden" name="product_class_id" value="200151425"><!-- 商品クラスID -->
                                                <input type="hidden" name="regular_purchase_flg" value="1"><!-- 定期:1/都度:0で値送信 -->
                                                <input type="hidden" id="price_1" value="960"><!--　商品単価 -->
                                                <div class="product-input" style="display:none">
                                                    <select class="kui-select" name="quantity" id="quantity_1" onchange="onChangeQuantity(this)"><!-- 数量 -->
                                                    <option value="1">1</option>
                                                    </select>
                                                </div>
                                                <div class="add-button">
                                                    <button type="submit" class="btn f_white bg_red">
                                                        <span>定期購買</span>
                                                    </button>
                                                </div>
                                            </form>
                                            <h6 class="f_red info"><i class="">i</i><span>定期更優惠方案!</span></h6>
                                        </div>
                                        <div class="add-product W50">
                                            <div class="product-input f15">
                                                一般售價<font> $1,200</font>
                                            </div>
                                            <form action="<!--{$smarty.const.ROOT_URLPATH}-->products/detail.php" method="post">
                                                <input type="hidden" name="mode" value="cart" />
                                                <!-- <input type="hidden" name="product_id" value="200000505">
                                                <input type="hidden" name="product_class_id" value="200000506"> -->
                                                <input type="hidden" name="mode" value="cart">
                                                <input type="hidden" name="product_id" value="200133986">
                                                <input type="hidden" name="product_class_id" value="200133987">
                                                <input type="hidden" name="regular_purchase_flg" value="0">
                                                <input type="hidden" id="price_2" value="1390">
                                                <div class="product-input" style="display:none">
                                                    <select class="kui-select" name="quantity" id="quantity_2" onchange="onChangeQuantity(this)">
                                                    <option value="1">1</option>
                                                    </select>
                                                </div>
                                                <div class="add-button">
                                                    <button type="submit" class="btn_black">
                                                        <span>立即購買</span>
                                                    </button>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div> 
                        
                        <div class="intro_3">
                            <div class="point_1 pb40 W960">
                                <p class="point_step">Point 1</p>
                                <hr>
                                <div class="t_center">
                                    <p class="point_slogan">
                                        <span class="f45 f_pink">肌膚超估溜！</span><span class="f30">洗後</span><span class="f45 f_pink">肌膚不緊繃！</span>
                                        <p class="f30 CJK_b pb15">「保濕型礦泥」+「吸附型玻尿酸」</p>
                                    </p>
                                    
                                    <p class="f18">礦泥土為胺基酸的洗淨成分可以防止肌膚被過度清潔, 並且內含吸附型<br class="pc">玻尿酸保濕成分，洗顏後仍保持肌膚不緊繃！</p>
                                </div>
                                <img src="<!--{$smarty.const.HTTPS_URL}-->user_data/new_201811/img/product/ns/img-ns-point-1.jpg" class="pc" alt="">
                                <img src="<!--{$smarty.const.HTTPS_URL}-->user_data/new_201811/img/product/ns/img-ns-m-point-1.jpg" class="mb" alt="">
                                
                                
                            </div>
                            <div class="point_2 W960" style="background: #ebf9ff">
                                <p class="point_step">Point 2</p>
                                <p class="point_slogan f30">
                                    實現完美美肌<br><span class="f45 f_pink">富含美容精華成分</span>
                                </p>
                                <p class="point_des f18">
                                五種天然植物精華，<br>抑制閉鎖黑頭粉刺的生成
                                </p>
                                <div class="ns_material">
                                    <div class="W50">
                                        <div class="f18 f_red f_b">Fresh VITC</div>    
                                        <img src="<!--{$smarty.const.HTTPS_URL}-->user_data/new_201811/img/product/ns/img-ns-point-2-2.png" alt="">
                                    </div>
                                    <div class="W50">
                                        <div class="f18 f_red f_b">吸附型玻尿酸</div>    
                                        <img src="<!--{$smarty.const.HTTPS_URL}-->user_data/new_201811/img/product/ns/img-ns-point-2-1.png" alt="">
                                    </div>
                                    
                                </div>
                                <ul class="point_material t_left f15">
                                    <li><img src="<!--{$smarty.const.HTTPS_URL}-->user_data/new_201811/img/product/ns/ingredient-ns-1.png" alt=""><span>蓮</span></li>
                                    <li><img src="<!--{$smarty.const.HTTPS_URL}-->user_data/new_201811/img/product/ns/ingredient-ns-2.png" alt=""><span>扶桑花精華</span></li>
                                    <li><img src="<!--{$smarty.const.HTTPS_URL}-->user_data/new_201811/img/product/ns/ingredient-ns-3.png" alt=""><span>無花果精華</span></li>
                                    <li><img src="<!--{$smarty.const.HTTPS_URL}-->user_data/new_201811/img/product/ns/ingredient-ns-4.png" alt=""><span>薏仁精華</span></li>
                                    <li><img src="<!--{$smarty.const.HTTPS_URL}-->user_data/new_201811/img/product/ns/ingredient-ns-5.png" alt=""><span>萱草精華</span></li>
                                    
                                </ul>
                            </div>
                            <div class="point_3 W960">
                                <p class="point_step">Point 3</p>
                                <p class="point_slogan f24">
                                我們的堅持！<br><span class="f30">對於肌膚，只使用最</span><span class="f36 f_pink">安心安全</span><span class="f30">的成分！</span><br>
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

                    <img src="<!--{$smarty.const.HTTPS_URL}-->user_data/new_201811/img/product/ns/bg-leaf-ns-r.png" alt="" class="flower f7">
                    <img src="<!--{$smarty.const.HTTPS_URL}-->user_data/new_201811/img/product/ns/bg-leaf-ns-l.png" alt="" class="flower f6">
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
                            <p class="said CJK_b f24 pb20">
                            不管做什麼努力，<br>毛孔仍無法徹底潔淨…
                            </p>   
                            <p class="f18">
                            自從大學時代就一直倍受粗大毛孔及粉刺的困擾，特別是因為化妝的關係而阻塞毛孔，使毛孔顯得又大又明顯，尤其是鼻頭的位置！加上人與人面對面說話時，總是看得到鼻頭的粉刺，讓我覺得非常的在意且不開心。開始工作之後，也常被同事說「你的毛孔看起來好髒唷！」真的好傷心，但又一直找不到適合的保養品去改善它，最後，還是用手將粉刺摳出，卻反而造成肌膚敏感泛紅及毛孔惡化！
                            </p>
                            <p class="f18 pb20">
                            因此，我開發了ＮＥＷ毛孔無瑕礦泥洗顏粉，酵素＋潤澤精華油的調和，針對去除黑頭及老廢角質有顯著的幫助，而酵素能夠深入毛孔溶解粉刺；添加多重保濕因子，洗淨後也能擁有潤澤美肌唷～！
                            </p>
                            <p class="ps f15">
                            毛孔無瑕礦泥洗顏粉開發者<br>
                            製品開發部 佐佐木 春佳<br>
                            2016年大學畢業之後進入MANARA化妝品公司，擔任開發部的製品研發，並陸續參與了UV防曬及蜜粉餅等四項產品改良，並且也獲得了大多數人的支持，完售的狀況也常常發生。而現在所開發的新製品，則想要針對「解決一個人的肌膚煩惱」而生。
                            
                            </p>
                        </div>
                    </div>
                    
                </div>

                <div class="sec6 W100 bg_red f_white">
                    <div class="W1200">
                        <p class="f48">HOW to USE</p>
                        <p class="f24">毛孔無瑕礦泥洗顏粉的正確使用方式</p>
                    </div>
                    
                </div>

                <div class="sec7 W100">
                    <ul class="use_step W100">
                        <li>
                        <img src="<!--{$smarty.const.HTTPS_URL}-->user_data/new_201811/img/product/ns/img-ns-step-1.jpg" alt="">
                        <p class="f21 f_b">取10元硬幣大小的量</p>
                        <p class="f15">於掌心中取10元硬幣大小的量。為避免倒出粉末時飛散開來，<span class="f_pink">可先用水將手沾溼。</span></p>

                        </li>
                        <li>
                        <img src="<!--{$smarty.const.HTTPS_URL}-->user_data/new_201811/img/product/ns/img-ns-step-2.jpg" alt="">
                        <p class="f21 f_b">混合成泥狀</p>
                        <p class="f15">先用少量水開始混合，再酌量調整水量至成泥狀後，即可塗抹於全臉。<span class="f_grey">小訣竅 : 可於</span><span class="f_pink">下巴及鼻頭粉刺處</span><span class="f_grey">，加強按摩。</span></p>
                        </li>
                        <li>
                        <img src="<!--{$smarty.const.HTTPS_URL}-->user_data/new_201811/img/product/ns/img-ns-step-3.jpg" alt="">
                        <p class="f21 f_b">不須起泡</p>
                        <p class="f15">利用流動常溫水，清洗乾淨為止。</p>
                        </li>

                    </ul>
                    <div class="W1200 video_wrap">
                        <div class="W67">
                            <img src="<!--{$smarty.const.HTTPS_URL}-->user_data/new_201811/img/product/video_frame.png" alt="" width="100%">
                            <iframe width="100%" class="poA" src="https://www.youtube.com/embed/zu0pJGHWpw8" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                        </div>
                        
                        <div class="poA txt f_red pc">
                            <img src="<!--{$smarty.const.HTTPS_URL}-->user_data/new_201811/img/icon/icon-video.svg" alt="">
                            <p class="f30">觀看使用影片</p>
                            <p class="f16">VIDEO</p>
                        </div>

                    </div>
                    <div class="day_night f21">
                        <div class="W40">
                            <h5 class="night f_white"><img src="<!--{$smarty.const.HTTPS_URL}-->user_data/new_201811/img/product/icon/icon-night.svg" class="icon">夜間保養順序</h5>
                            <ul class="W100">
                                <li class="W50" data-href="CG.php">
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
                        <div class="W60">
                            <h5 class="day W60 f_white"><img src="<!--{$smarty.const.HTTPS_URL}-->user_data/new_201811/img/product/icon/icon-day.svg" class="icon">晨間保養順序</h5>
                            <ul class="W100">
                                <li class="W33" data-href="MG.php">
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
                                <li class="W33" data-href="OE.php">
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
                            <div class="td p_name">毛孔無瑕礦泥洗顏粉</div>
                        </div>
                        <div class="W50">
                            <div class="th">容量</div>
                            <div class="td">45g (約可使用2個月)</div>
                        </div>
                        <div class="W100">
                            <div class="th">使用時間</div>
                            <div class="td">日間使用</div>
                        </div>
                        <div class="W100">
                            <div class="th">成分</div>
                            <div class="td">滑石粉、月桂醯谷氨酸鈉、月桂醯天冬氨酸鈉、微晶纖維素、 葉蠟石、 椰油醯甘氨酸鈉、 黃原膠、 聚乙烯吡咯烷酮、 二聚季戊四醇六羥基硬脂酸酯／六硬脂酸酯／六松脂酸酯、 丁二醇 矽粉、 日本棚倉黏土、 聚山梨醇酯 20 、磷酸氫二鈉 、磷酸鉀、 糊精、 蛋白酶、 脂肪酶、 木瓜蛋白脢、 羥丙基三甲基氯化銨透明質酸 、維他命C酯磷酸鈉鹽、 ALPHA-熊果素、 甘草酸二鉀、 水解膠原蛋白 、醉蝶花葉萃取、 甘油 、石榴果萃取 、乳酸桿菌／蓮籽發酵產物濾液、 酵母菌／萱草花發酵產物濾液、裂殖酵母菌絲體／無花果發酵產物濾液 乳酸桿菌／玫瑰茄花發酵產物濾液 、酵母菌／枸杞子種子發酵濾液 、月見草籽萃取、 歐洲七葉樹籽萃取、 野大豆籽萃取、 泰國野葛根萃取、 菜薊葉萃取、 1,3-丙二醇、 生育酚、 水</div>
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

        <script src="new_201811/js/init.js"></script>

        <!--   肚子結束  -->
        


    </div>
</div>   





<script type="text/javascript" src="new_201811/js/product.js"></script>
<?php include '../footer.php'; ?> 
