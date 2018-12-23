
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
                    <h2 class="f40 CJK_b f_white">連續10年 榮獲「世界品質評鑑大賞」金賞的肯定</h2>
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
                            <div class="txt">
                                <div class="img_wrapper">
                                    <img src="<!--{$smarty.const.HTTPS_URL}-->user_data/new_201811/img/product/cg/info-cg-1.png" alt="">
                                    <img src="<!--{$smarty.const.HTTPS_URL}-->user_data/new_201811/img/product/cg/award-queen.jpg" alt="">
                                </div>
                                <h6>我們秉持著變美麗的<font>3個</font>堅持</h6>
                                <ul class="f_golden f30">
                                    <li>只提供肌膚有實際效果的產品</li>
                                    <li>每天都能安心使用</li>
                                    <li>簡單無負擔的使用</li>
                                </ul>
                            </div>
                        </div>
                        
                        
                    </div>
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
<link rel="stylesheet" href="user_data/new_201811/css/new_product.css" />




<?php include 'footer.php';?> 
