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
                <div class="col-sm-10 col-xs-10 product-mb-title">
                    <h3>全效活膚保濕精華露</h3>
                </div>
                <div class="col-md-4 col-sm-4 col-xs-6 col-offset-2">
                    <div class="product-pic">
                        <!-- Product Slider Start -->
                        <div class="mm-tabs-wrapper">
                            <div class="tab-item">
                                <ul class="bxslider">
                                  <li><img src="<!--{$smarty.const.HTTPS_URL}-->user_data/new/img/product6/01_348x284.jpg" /></li>
                                </ul>
                            </div>
                        </div>
                        <!-- Product Slider End -->
                    </div>
                </div>
                <div class="col-md-4 col-sm-4 col-xs-6 info-border">
                    <div class="product-pc-title">
                        <h3>maNara旅行隨身組3日份</h3>
                    </div>
                    <div class="product-content">
                        <p>內容物：<br />
                        溫熱卸妝凝膠 1次份 (4g) 3包<br />
                        深層毛孔洗顏凝膠 1次份 (2ml)  3包<br />
                        全效活膚保濕精華露 1次份 (0.8ml)  6包<br />
                        <br />
                        旅行隨身包非常推薦以下的粉絲們使用唷～！<br />
                        <br />
                        「旅行同時也想要使用maNara來保養！」<br />
                        「去健身房隨身攜帶很方便！」<br />
                        「很想試試看maNara的保養商品！」<br />
                            </p>
                    </div>
                </div>
            </div>
        </div>
        <div class="row pd-20">
            <div class="columns-12">
                <!-- <div class="col-md-8 col-sm-8 col-offset-2">
                    <iframe width="560" height="315" src="https://www.youtube.com/embed/Sj3jHHdVfZo" frameborder="0" allowfullscreen=""></iframe>      
                </div>
                <hr class="col-md-8 col-offset-2"> -->
                <div class="col-md-4 col-sm-4 col-xs-12 col-offset-2">
                    <div class="add-product">
                        <div class="product-title">
                            <p class="pd-text-1">直接購買</p>
                        </div>
                        <form action="<!--{$smarty.const.ROOT_URLPATH}-->products/detail.php" method="post">
                            <input type="hidden" name="mode" value="cart" />
                            <input type="hidden" name="product_id" value="200125170" />
                            <input type="hidden" name="product_class_id" value="200125171" />
                            <input type="hidden" name="regular_purchase_flg" value="0" />
                            <input type="hidden" id="price_2" value="350" >
                            <div class="product-input">
                                <span class="p-info">售價：350</span>
                            </div>
                            <div class="product-input">
                                <span class="color-pink">數量</span>
                                <select class="kui-select" name="quantity" id="quantity_2" onChange="onChangeQuantity(this)">
                                  <option value="1">1</option>
                                  <option value="2">2</option>
                                  <option value="3">3</option>
                                </select>
                            </div>
                            <div class="add-button">
                                <!-- <input class="btn color-focus" type="submit" value="加入購物車" /> -->
                                <button type="submit" class="btn bt-color-red">
                                    <span>加入購物車</span>
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
        <!-- CONTENT END -->