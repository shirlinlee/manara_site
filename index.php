

<?php include 'header.php'; ?>

<!-- https://www.manara.asia/tw/ -->
<!--{$smarty.const.ROOT_URLPATH}-->


<div id="container">
    <div id="one_maincolumn" class="main_column">
        <script type="text/javascript" src="user_data/new_201811/js/index.js"></script>
        
        <!--<link rel="stylesheet" href="-->
        <!--{$smarty.const.ROOT_URLPATH}-->
        <!--user_data/packages/defaultta/css/new_lee.css" /> -->
        
        
        <!--   肚子開始  -->

        <link rel="stylesheet" href="user_data/new_201811/css/new_init.css" />
        <link rel="stylesheet" href="user_data/new_201811/css/new_index.css" />
        <script src="https://hammerjs.github.io/dist/hammer.js"></script>
        <script src="https://snapwidget.com/js/snapwidget.js"></script>


        <div class="index_banner">
           
            <ul class="index_slider" id="index_slider" :style="{'width': slideWidth, 'marginLeft':slideLeft}">  
                <li v-for="(banner,i) in banners_pc" :style="{ 'background-image': 'url('+bannerLinkHandler(banner.image,i)+')' } ">
                    <a :href="banner.link"></a>
                </li> 
            </ul>
              
            <div class="dots_wrapper">
                <span v-for="(banner,i) in banners_pc" :class="{'active': slide_current==i }" @click="sildeHandler(i)"></span>
            </div>
        </div>

        <div class="bg_pink f_white close_parent" v-if="emergnecy.length">
            <div class="W1200">
                <div id="attention">
                    <h5 class="t_left">緊急異動通知</h5>
                    <p class="t_left"> {{emergnecy[0].content}} </p>    
                    <span href="javascript:;" class="close poA f_white icon-icon-close" @click="attentionHandler"></span>
                </div>
            </div>
        </div>

        <section id="special" class="W1200 columns-12">
            <h5 class="title">活動快訊<span class="sub_title">EVENTS</span></h5>
            
            <div class="col-md-6 col-sm-6 col-xs-12" v-for="e in event">
                <a :href="e.link">
                    <img :src="linkHandler(e.image)" width="100%">

                </a>
            </div>
            
        </section>  

        <section id="product_index" class="t_center">
            <h5 class="title">推薦明星商品<span class="sub_title">PRODUCTS</span></h5>
            <div class="W1200 columns-12">
                <div class="col-md-3 col-sm-3 col-xs-6">
                    <a href="javascript:;" class="item_pro">
                        <div class="img_wrapper"><img src="<!--{$smarty.const.HTTPS_URL}-->user_data/new_201811/img/pro_01.png" /></div>
                        <span class="f18 f_black t_center">溫熱卸妝凝膠</span>
                        <span class="f15 f_black t_center">HOT CLEANING GEL</span>
                    </a>
                </div>
                <div class="col-md-3 col-sm-3 col-xs-6">
                    <a href="javascript:;" class="item_pro">
                    <div class="img_wrapper"><img src="<!--{$smarty.const.HTTPS_URL}-->user_data/new_201811/img/pro_02.png" /></div>
                        <span class="f18 f_black t_center">深層毛孔洗顏凝膠</span>
                        <span class="f15 f_black t_center">MOIST WASH GEL</span>
                    </a>
                </div>
                <div class="col-md-3 col-sm-3 col-xs-6">
                    <a href="javascript:;" class="item_pro">
                        <div class="img_wrapper"><img src="<!--{$smarty.const.HTTPS_URL}-->user_data/new_201811/img/pro_03.png" /></div>
                        <span class="f18 f_black t_center">毛孔無瑕礦泥洗顏粉</span>
                        <span class="f15 f_black t_center">NAMA NERI WASH</span>
                    </a>
                </div>
                <div class="col-md-3 col-sm-3 col-xs-6">
                    <a href="javascript:;" class="item_pro">
                        <div class="img_wrapper"><img src="<!--{$smarty.const.HTTPS_URL}-->user_data/new_201811/img/pro_04.png" /></div>
                        <span class="f18 f_black t_center">全效活膚保濕精華露</span>
                        <span class="f15 f_black t_center">ONLY ESSENCE</span>
                    </a>
                </div>
            </div> 
            <div class="btn_black">
                全系列商品           
            </div>                

        </section>  


        <section id="ceo" class="W1200">
            <img src="<!--{$smarty.const.HTTPS_URL}-->user_data/new_201811/img/ceo_pc.jpg" class="pc" width="100%" alt="">
            <img src="<!--{$smarty.const.HTTPS_URL}-->user_data/new_201811/img/ceo_mb.jpg" class="mb" width="100%" alt="">
        </section>

        <section id="news" class="bg_grey">
            <div class="W1200 t_left columns-12">
                <h5 class="title t_left col-l-12">最新訊息與通知<span class="sub_title">NEWS & INFORMATION</span></h5>
                <ul class="col-l-12 f18">
                    <li @click="newsHandler('date','title','des','src')">
                        <span class="date">2018.05</span>
                        <span class="text">使う直前にビタミンCと美容液をワンタッチでシートになじませるだけ！マナラ ホワイトパウダーマスク新登場！</span>
                    </li>
                    <li @click="newsHandler('date','title','des','src')">
                        <span class="date">2018.04</span>
                        <span class="text">マナラ ホットクレンジングゲル 限定イランイランミックスを全国バラエティショップにて数量限定発売！</span>
                    </li>
                    <li @click="newsHandler('date','title','des','src')">
                        <span class="date">2018.03</span>
                        <span class="text">ひと塗りでマイナス5歳！“年齢巻き戻しマスカラ”マナラ カールMAX新登場！</span>
                    </li>
                    <li @click="newsHandler('date','title','des','src')">
                        <span class="date">2018.02</span>
                        <span class="text">最高レベルの紫外線カット率を誇る マナラ 大人のUVカット帽子 新登場！</span>
                    </li>
                    <li @click="newsHandler('date','title','des','src')">
                        <span class="date">2017.12</span>
                        <span class="text">ワイヤーを超える脅威のバストメイク力！ノンワイヤーバストアップブラ新登場！</span>
                    </li>
                    
                </ul>  
            </div>
        </section>

        <section id="social">
            <div class="W1200 columns-12">
                <h5 class="title t_left col-l-12">從更多地方認識我們<span class="sub_title">#maNaraTW SNS</span></h5>
                <!-- LightWidget WIDGET -->
                
                <div class="col-md-8 col-sm-8 ig">
                    <!-- SnapWidget -->
                    
                    <iframe src="https://snapwidget.com/embed/636443" class="snapwidget-widget" allowtransparency="true" frameborder="0" scrolling="no" style="border:none; overflow:hidden; width:100%; "></iframe>
                    
                    <!-- <script src="https://cdn.lightwidget.com/widgets/lightwidget.js"></script>
                    <iframe src="http://lightwidget.com/widgets/10874b8eb5f45dc2827c274565c88784.html" scrolling="no" allowtransparency="true" class="lightwidget-widget mb" style="width:100%;border:0;overflow:hidden;"></iframe>
                    <script src="https://cdn.lightwidget.com/widgets/lightwidget.js"></script>
                    <iframe src="//lightwidget.com/widgets/ddc83499b17a5ece888b3b20b85f8633.html" scrolling="no" allowtransparency="true" class="lightwidget-widget pc" style="width:100%;border:0;overflow:hidden;"></iframe> -->

                </div>
                <div class="col-md-4 col-sm-4">
                    <div id="fb-root"></div>
                    <div class="fb"></div>
                </div>
                <div class="col-md-4 col-sm-4 t_center">
                    <a href="javascript:;" class="W50 svg_font f48 icon-icon-line">
                        <span class="f24">LINE</span><span class="f15">@manaraTW</span>    
                    </a>
                    <a href="javascript:;" class="W50 svg_font f48 icon-icon-youtube">
                        <span class="f18">Youtube</span><span class="f15">@manaraTW</span>    
                        
                    </a>
                </div>
            
            </div>
        </section>
        <!-- 最新消息燈箱   --->
        <div class="lb_wrapper" v-show="lbOpen" @click="lbHandler">
            <div class="lb W960 bg_white">
                <p class="f_red f24 news">NEWS & INFORMATION</p>
                <img src="<!--{$smarty.const.HTTPS_URL}-->user_data/new_201811/img/btn-close.svg" class="close poA" alt="" @click="lbHandler">
                <div class="lb_content">
                    <p class="f18 f_grey date">{{this.lb_date}}</p>
                    <p class="f30 subtitle">{{this.lb_title}}</p>
                    <p class="f18 des">
                    {{this.lb_des}}
                    </p>
                    <img :src="this.lb_src" class="W100" alt="">
                </div>  


            </div>

        </div>

        <script>
            (function(d, s, id) {
                var js, fjs = d.getElementsByTagName(s)[0];
                if (d.getElementById(id)) return;
                js = d.createElement(s); js.id = id;
                js.src = "//connect.facebook.net/zh_TW/sdk.js#xfbml=1&version=v2.8&appId=166946443490956";
                fjs.parentNode.insertBefore(js, fjs);
            }(document, 'script', 'facebook-jssdk'));




            var app = new Vue({
                el: '#one_maincolumn',
                data: {
                    banners: [],
                    banners_pc: [],
                    banners_mb: [],
                    emergnecy: [],
                    event: null,
                    lbOpen: false,
                    lb_data: null,
                    isDev: false,
                    isMobile: false,
                    lb_date:'',
                    lb_title:'',
                    lb_des:'',
                    lb_src: '',
                    slide_current:0
                },
                watch: {
                
                   
                },
                computed: {
                    slideWidth:function(){
                        console.log(this.banners_pc.length);
                        return this.banners_pc.length*100+'%';

                    },
                    slideLeft:function(){
                        return - this.slide_current*100+'%';
                    }
                    
                },
                beforeMount() {
                    var $this = this;
                    $.ajax({
                        url: "https://ecweb-dev.cros.tw/tw/user_data/admin/api/data.php",
                        type: "GET",
                        dataType: "json",

                        success: function(Jdata) {
                                $this.banners = Jdata.data.banner;
                                $this.emergnecy = Jdata.data.emergnecy;
                                $this.event = Jdata.data.event; 
                                $this.bannerHandler();
                        },
                        error: function() {
                            console.alert("ERROR!!!");
                        }
                    });
                },
           
                mounted() {
                    var $this = this;

                    this.DevHandler();
                    this.mobileHandler();
                    this.$nextTick( function() {
                        $(window).bind("load resize", function(){  
                            setTimeout(function() {
                            var container_width = $('.fb').width();    
                                $('.fb').html('<div class="fb-page" ' + 
                                'data-href="https://www.facebook.com/manaratw/"' +
                                ' data-width="' + container_width + '" data-tabs="timeline" data-small-header="false" data-adapt-container-width="true" data-height="215" data-hide-cover="false" data-show-facepile="true"><div class="fb-xfbml-parse-ignore"><blockquote cite="http://www.facebook.com/manaratw/"><a href="http://www.facebook.com/IniciativaAutoMat">Manara化妝品</a></blockquote></div></div>');
                                FB.XFBML.parse( );    
                            }, 100);  

                            $this.mobileHandler();
                            
                        }); 

                        var myElement = document.getElementById('index_slider');
                        var mc = new Hammer(myElement);
                        mc.on("swipeleft swiperight", function(ev) {
                           
                            if (ev.type === "swipeleft" && $this.slide_current < $this.banners_pc.length-1 ) {
                                
                                $this.slide_current = $this.slide_current+1;console.log(ev.type);
                            }
                            if (ev.type === "swiperight" && $this.slide_current > 0) {
                                console.log(ev.type);
                                $this.slide_current = $this.slide_current-1;
                            }
                        });
       
                        
                    })
                   
                }, 
                methods:{
                    DevHandler() {
                        this.isDev = window.location.href.indexOf('localhost') > -1;
                        if (this.isDev) {
                            $('img, a, link').each(function () {
                                var el = $(this).context.tagName;
                                if (el === 'IMG') {
                                    var current_src = $(this).attr('src').replace('<!--{$smarty.const.ROOT_URLPATH}-->', '/manara_site/').replace('<!--{$smarty.const.HTTPS_URL}-->', '/manara_site/');
                                    $(this).attr('src', current_src);
                                }
                                if (el === 'LINK' || el === 'A') {
                                    var current_href = $(this).attr('href').replace('<!--{$smarty.const.ROOT_URLPATH}-->', 'https://www.manara.asia/tw/').replace('<!--{$smarty.const.HTTPS_URL}-->', 'https://www.manara.asia/tw/');
                                    $(this).attr('href', current_href);
                                }
                            })
                        }
                        
                    },
                    mobileHandler(){
                        if ($(window).innerWidth() <= 768) {
                            this.isMobile = true;
                        } else {
                            this.isMobile = false;
                        }
                    },
                    bannerHandler(){
                        var $this = this;
                        this.banners.filter(function(item,i){
                            if(item.type == 'A') {
                                var obj = item;
                                $this.banners_pc.push(obj);
                            } else if (item.type == 'B') {
                                var obj = item;
                                $this.banners_mb.push(obj);
                            }
                        });
                       

                    },
                    sildeHandler(i){
                        console.log(i);
                        this.slide_current = i;

                    },
                    attentionHandler(){
                        $('.close_parent').slideUp();
                    },
                    lbHandler(){
                        this.lbOpen = false;
                    },
                    linkHandler:function(addr){
                        var domain = (this.isDev) ? 'https://ecweb-dev.cros.tw/tw/': '';
                        return domain + addr;
                    },
                    bannerLinkHandler:function(addr,i){
                        var domain = (this.isDev) ? 'https://ecweb-dev.cros.tw/tw/': '';
                        console.log(this.banners_mb[i].image);
                        if( this.isMobile ) {
                            addr = this.banners_mb[i].image;
                        } 
                        return domain + addr;
                    },
                    newsHandler(date,title,des,src){
                        this.lb_date = '2018.12.01';
                        this.lb_title = '聖誕限時快閃活動只到12/28止';
                        this.lb_des = '日本原裝，熱銷1000萬限時優惠「毛孔變好乾淨，一直以來的困擾簡單解決了」 「洗完保濕不緊繃，用了 3 年，離不開 maNara 了！」 和熱銷千萬的 maNara 一起打擊黑頭！ 立即體驗回購率 98% 的溫熱...';
                        this.lb_src = 'https://ecweb-dev.cros.tw/tw/user_data/new_201811/img/news-img-upload.jpg';
                        this.lbOpen = true;
                    }

                }
            })

           

            
        </script>

        <!--   肚子結束  -->

        
    </div>
</div>   

<style>
    .bxslider li{
        display: none;
    }
    .bxslider li:first-child{
        display: block;
    }
</style>



<?php include 'footer.php'; ?> 

