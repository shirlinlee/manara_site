
<?php include 'header.php';?>

<!-- https://www.manara.asia/tw/ -->
<!--{$smarty.const.ROOT_URLPATH}-->


<div id="container">
    <div id="one_maincolumn" class="main_column">
        <!--   肚子開始  -->       

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
<div id="product">

        <div id="banner" class="row bg_grey">
            <div class="columns-12 product-box W1170">
                <div class="col-md-7 col-sm-6 col-xs-6 pic">
                    <img src="img/p_01.jpg" height="100%" />
                </div>
                <div class="col-md-5 col-sm-6 col-xs-6 txt">
                    <div class="product-pc-title">
                        <h3 class="title">溫熱卸妝凝膠
                            <span class="sub_title en">hot cleaning gel</span>
                        </h3>
                    </div>
                    <div class="product-content">
                        <p class="des">溫熱凝膠讓化妝污垢和毛孔的黑頭都乾淨清除。配合91.4％的美容液成分，不用重覆洗臉兩次，接假睫毛的妳也可使用。</p>
                        <p class="volumn"><span class="th">容量</span>200g(約60日份)</p>
                        <div class="btn_area W100">
                            <form class="W50" action="<!--{$smarty.const.ROOT_URLPATH}-->products/detail.php" method="post">
                                <input type="hidden" name="mode" value="cart" />
                                <input type="hidden" name="product_id" value="200000007" />
                                <input type="hidden" name="product_class_id" value="200000008" />
                                <input type="hidden" name="regular_purchase_flg" value="0" />
                                <input type="hidden" id="price_2" value="1390" >
                                <div>
                                    一般售價<font class="price">1,390</font>
                                </div>
                                <div class="add-button">
                                    <button type="submit" class="btn bg_pink f_white">
                                        <span>立即購買</span>
                                    </button>
                                </div>
                            </form>
                            
                            <form class="W50" action="<!--{$smarty.const.ROOT_URLPATH}-->products/detail.php" method="post">
                                <input type="hidden" name="mode" value="cart" /><!-- 固定値'cart' -->
                                <input type="hidden" name="product_id" value="200001260" /><!-- 商品ID -->
                                <input type="hidden" name="product_class_id" value="200001261" /><!-- 商品クラスID -->
                                <input type="hidden" name="regular_purchase_flg" value="1" /><!-- 定期:1/都度:0で値送信 -->
                                <input type="hidden" id="price_1" value="1180" ><!--　商品単価 -->
                                <div>
                                    優惠售價<font class="price">1,180</font>
                                </div>
                                <!-- <div class="product-input">
                                    <span class="color-red">數量</span>
                                    <select class="kui-select" name="quantity" id="quantity_1" onChange="onChangeQuantity(this)">
                                        <option value="1">1</option>
                                        <option value="2">2</option>
                                        <option value="3">3</option>
                                    </select>
                                </div> -->
                                <div class="add-button">
                                    <button type="submit" class="btn bg_red f_white">
                                        <span>定期購買</span>
                                    </button>
                                </div>
                            </form>

                            <h6 class="f_red info"><i class="">i</i><span>什麼是定期方案?</span></h6>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div id="award" class="row bg_gold">

        </div>



</div>
        <!-- CONTENT END -->

         
        
        <!--   肚子結束  -->


    </div>
</div>   


<link rel="stylesheet" href="css/new_init.css" />
<link rel="stylesheet" href="css/new_product.css" />




<?php include 'footer.php';?> 
