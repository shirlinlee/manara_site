<?php include '../header.php'; ?>

<div id="container">
    <div id="one_maincolumn" class="main_column">
        <!--   肚子開始  -->       
        <div id="_product_wrapper">
            <div class="banner_m banner-list">
                <div class="banner-txt t_center">
                    <h4 class="f30 f_white">全系列產品</h4>
                    <span></span>
                    <h6 class="f24 f_white">Product Series</h6>
                </div>
            </div>
            <div class="W100 t_center">
                <div class="W1360 bread">
                    <span class="f15 f_pink f_left"><a class="f_grey" href="/tw/">首頁 /</a> MANARA商品</span>
                </div>
            </div>
            
            <div class="steps W1200">
                   <p class="red_title">
                       MANARA 毛孔保養全系列產品
                       <span>淨化毛孔，為您解決粉刺乾燥等肌膚煩惱</span>
                    </p>   
                    <img src="new_201811/img/product/list/img-liststep.jpg" class="pc" alt="">  
                    <img src="new_201811/img/product/list/img-liststep-m.jpg" class="mb" alt="">  
                
            </div>
            <div class="product_list W1200">
                <ul>
                    <li v-for="(w,i) in wash" @click="linkHandler(w.link)" :class="{'first':i===0}">
                        <h5 class="f24 poA" v-if="i===0">卸妝洗臉系列</h5>
                        <p class="f15 time t_left" v-html="timeHandler(w.time)"></p>
                        <p class="f24 name t_left">{{w.name}}</p>
                        <p class="f15 en_name t_left">{{w.en_name}}</p>
                        <img :src="w.imgSrc" alt="">
                        <p v-html="w.des" class="des"></p>
                        <p class="price f18"><span class="f24 f_red f_b">{{w.price}}</span>元</p>
                        <p class="f15 volumn">{{w.volumn}}</p>

                    </li>
                    <li v-for="(c,i) in care" @click="linkHandler(c.link)" :class="{'first':i===0}">
                        <h5 class="f24 poA" v-if="i===0">肌膚保養系列</h5>
                        <p class="f15 time t_left" v-html="timeHandler(c.time)"></p>
                        <p class="f24 name t_left">{{c.name}}</p>
                        <p class="f15 en_name t_left">{{c.en_name}}</p>
                        <img :src="c.imgSrc" alt="">
                        <p v-html="c.des" class="des"></p>
                        <p class="price f18"><span class="f24 f_red f_b">{{c.price}}</span>元</p>
                        <p class="f15 volumn">{{c.volumn}}</p>

                    </li>
                    <!-- <li v-for="(v,i) in uv" @click="linkHandler(v.link)" :class="{'first':i===0}">
                        <h5 class="f24 poA" v-if="i===0">UV防護系列</h5>
                        <p class="f15 time t_left" v-html="timeHandler(v.time)"></p>
                        <p class="f24 name t_left">{{v.name}}</p>
                        <p class="f15 en_name t_left">{{v.en_name}}</p>
                        <img :src="v.imgSrc" alt="">
                        <p v-html="v.des" class="des"></p>
                        <p class="price f18"><span class="f24 f_red f_b">{{v.price}}</span>元</p>
                        <p class="f15 volumn">{{v.volumn}}</p>

                    </li> -->
                    <li v-for="(t,i) in travel" @click="linkHandler(t.link)" :class="{'first':i===0, 'travel': true}">
                        <h5 class="f24 poA" v-if="i===0">旅行隨身系列</h5>
                        <p class="f15 time t_left" v-html="timeHandler(t.time)"></p>
                        <p class="f24 name t_left">{{t.name}}</p>
                        <p class="f15 en_name t_left">{{t.en_name}}</p>
                        <img :src="t.imgSrc" alt="">
                        <p v-html="t.des" class="des"></p>
                        <p class="price f18"><span class="f24 f_red f_b">{{t.price}}</span>元</p>
                        <p class="f15 volumn">{{t.volumn}}</p>
                    </li>
                    <li v-for="(t,i) in makeup" @click="linkHandler(t.link)" :class="{'first':i===0}">
                        <h5 class="f24 poA" v-if="i===0">彩妝系列</h5>
                        <p class="f15 time t_left" v-html="timeHandler(t.time)"></p>
                        <p class="f24 name t_left">{{t.name}}</p>
                        <p class="f15 en_name t_left">{{t.en_name}}</p>
                        <img :src="t.imgSrc" alt="">
                        <p v-html="t.des" class="des"></p>
                        <p class="price f18"><span class="f24 f_red f_b">{{t.price}}</span>元</p>
                        <p class="f15 volumn">{{t.volumn}}</p>
                    </li>
                </ul>
            </div>
        </div>
        <!-- CONTENT END -->

        <link rel="stylesheet" href="new_201811/css/new_init.css?v=0102" />
        <link rel="stylesheet" href="new_201811/css/new_product_list.css?v=0103" />
        <script>
         var app = new Vue({
                el: '#_product_wrapper',
                data: {
                    day:'<h5 class="day"></h5>',
                    night:'<h5 class="night"></h5>',
                    wash:[{name:'溫熱卸妝凝膠',en_name:'HOT CLEANING GEL',time:'夜間',link:'CG.php',imgSrc:'new_201811/img/product/list/cg.png',des:'含91.3%美容精華液<br>溫感打開毛孔<br>卸妝洗臉2合一',price:'$1,390',volumn:'200g (約60日份)'},
                        {name:'深層毛孔洗顔凝膠',en_name:'MOIST WASH GEL',time:'日間',link:'MG.php',imgSrc:'new_201811/img/product/list/mg.png',des:'新開發 不起泡洗臉<br>98.8%美容液預防乾燥<br>改善黑頭',price:'$1,200',volumn:'120ml (約60日份)'},
                        {name:'毛孔無瑕礦泥洗顏粉',en_name:'NAMA NERI WASH',time:'日間',link:'TW.php',imgSrc:'new_201811/img/product/list/ns.png',des:'生酵素溶解髒汙<br>保濕礦泥吸附髒污<br>淨化毛孔',price:'$1,200',volumn:'45g (約60日份)'}],
                    care:[{name:'全效活膚保濕精華露',en_name:'ONLY ESSENCE',time:'日夜',link:'OE.php',imgSrc:'new_201811/img/product/list/oe.png',des:'日本首支添加<br>白花菜葉萃取精華<br>細緻毛孔、修護細紋斑點',price:'$1,800',volumn:'100ml (約60日份)'},
                        {name:'全效活膚保濕精華露-極潤',en_name:'ONLY ESSENCE MOIST',time:'日夜',link:'OE.php',imgSrc:'new_201811/img/product/list/oem.png',des:'日本首支添加<br>白花菜葉萃取精華<br>細緻毛孔、修護細紋斑點',price:'$1,800',volumn:'100ml (約60日份)'}],
                    uv:[{name:'防曬美肌噴霧',en_name:'UV CUT SPRAY',time:'防曬需求使用',link:'product4.php',imgSrc:'new_201811/img/product/list/uvc.png',des:'SPF45  PA++++<br>物理防曬<br>含草本精油驅除蚊蟲',price:'$750',volumn:'70g'},
                        {name:'防曬美肌蜜粉餅',en_name:'UV CUT POWDER',time:'防曬補妝需求使用',link:'product4.php',imgSrc:'new_201811/img/product/list/uvp.png',des:'SPF45   PA++++<br>物理防曬<br>遮瑕毛孔抑制出油',price:'$750',volumn:'7g'}],
                    travel:[{name:'旅行隨身組3日份',en_name:'TRAVEL SET',time:'旅行隨身攜帶方便',link:'product6.php',imgSrc:'new_201811/img/product/list/ts.png',des:'溫熱卸妝凝膠 (4g) 3包<br>深層毛孔洗顏凝膠 (2ml) 3包<br>毛孔無瑕礦泥洗顏粉 (0.75g) 3包<br>全效活膚保濕精華露 (0.8ml) 6包<br>',price:'$400',volumn:'各3天分，總共15包'}],
                    makeup:[{name:'奇肌無瑕水感BB棒',en_name:'BB LIQUID BAR SPF35 PA+++',time:'旅行隨身攜帶方便',link:'BB.php',imgSrc:'new_201811/img/product/list/bb.png',des:'美容液94%配合<br>防曬、飾底、潤色，一次擁有六大功效！<br>質地柔滑，能輕鬆畫出完美妝容。',price:'$1250',volumn:'7g (約可使用3~4個月)'}]
                },
                mounted() {
                    var $this = this;

                    this.$nextTick( function() {
                        
                    })
                }, 
                methods:{
                    timeHandler(time){
                        if(time.indexOf('日')>-1 || time.indexOf('防曬')>-1) {
                            return time+'<font class="day"></font>';
                        } else if(time.indexOf('夜')>-1) {
                            return time+'<font class="night"></font>';
                        }   
                        return time;
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
