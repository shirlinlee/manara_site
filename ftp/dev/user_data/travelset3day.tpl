<!-- CONTENT START -->
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
<div class="container sec-wrap" id="product">
    <div id="main_text">
        <div class="row">
            <div class="columns-12 product-box">
                <div class="col-md-4 col-sm-4 col-xs-6 col-offset-2">
                    <div class="product-pic">
                        <!-- Product Slider Start -->
                        <div class="mm-tabs-wrapper">
                            <div class="tab-item">
                                <ul class="bxslider">
                                  <li><img src="<!--{$smarty.const.HTTPS_URL}-->user_data/new_201811/img/product/ts/ts.png" /></li>
                                </ul>
                            </div>
                        </div>
                        <!-- Product Slider End -->
                    </div>
                </div>
                <div class="col-md-8 col-sm-8 col-xs-6 info-border">
                    <h3 class="f24 t_left pb15">MANARA旅行隨身組3日份</h3>
                    <div class="product-content">
                        <p class="pb20">內容物：<br />
                        溫熱卸妝凝膠 (4g) 3包<br />
                        深層毛孔洗顏凝膠 (2ml) 3包<br />
                        毛孔無瑕礦泥洗顏粉 (0.75g) 3包<br />
                        全效活膚保濕精華露 (0.8ml) 6包<br />
                        ※隨行包裝有變更可能性。<br /><br />
                        旅行隨身包非常推薦以下的粉絲們使用唷～！<br />
                        <br />
                        「旅行同時也想要使用MANARA來保養！」<br />
                        「去健身房隨身攜帶很方便！」<br />
                        「很想試試看MANARA的保養商品！」<br />
                        </p>
                        <div class="add-product W50">
                            <!-- <div class="product-title">
                                <p class="pd-text-1">直接購買</p>
                            </div> -->
                            <form action="<!--{$smarty.const.ROOT_URLPATH}-->products/detail.php" method="post">
                                <input type="hidden" name="mode" value="cart" />
                                <input type="hidden" name="product_id" value="200001394" />
                                <input type="hidden" name="product_class_id" value="200001395" />
                                <input type="hidden" name="regular_purchase_flg" value="0" />
                                <input type="hidden" id="price_2" value="400" >
                                <div class="">
                                    <span class="p-info">售價：400元</span>
                                </div>
                                <div class="pb15">
                                    <span class="color-pink">數量</span>
                                    <select class="kui-select" name="quantity" id="quantity_2" onChange="onChangeQuantity(this)">
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    </select>
                                </div>
                                
                                <!-- <input class="btn color-focus" type="submit" value="加入購物車" /> -->
                                <button type="submit" class="btn W100 bg_red f_white">
                                    <span>立即購買</span>
                                </button>
                            </form>
                        </div>

                    </div>
                    
                </div>
            </div>
        </div>
        
    </div>
</div>
        <link rel="stylesheet" href="new_201811/css/new_init.css?v=0102" />
        <link rel="stylesheet" href="new_201811/css/new_product_list.css?v=0103" />

        <!-- CONTENT END -->
