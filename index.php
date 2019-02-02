

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

        <link rel="stylesheet" href="user_data/new_201811/css/new_init.css?v=0202" />
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
                    <h5 class="t_left">{{emergnecy[0].title}} </h5>
                    <p class="t_left" v-html="emergnecy[0].content"></p>    
                    <span href="javascript:;" class="close poA f_white icon-icon-close" @click="attentionHandler"></span>
                </div>
            </div>
        </div>
        <div class="bg_pink f_white close_parent">
            <div class="W1200">
                <div id="attention">
                    <h5 class="t_left">test</h5>
                    <p class="t_left">testtest</p>    
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
                    <a href="javascript:;" class="item_pro" @click="windowHref('user_data/CG.php')">
                        <div class="img_wrapper"><img src="<!--{$smarty.const.HTTPS_URL}-->user_data/new_201811/img/pro_01.png" /></div>
                        <span class="f18 f_black t_center">溫熱卸妝凝膠</span>
                        <span class="f15 f_black t_center">HOT CLEANING GEL</span>
                    </a>
                </div>
                <div class="col-md-3 col-sm-3 col-xs-6">
                    <a href="javascript:;" class="item_pro" @click="windowHref('user_data/MG.php')">
                    <div class="img_wrapper"><img src="<!--{$smarty.const.HTTPS_URL}-->user_data/new_201811/img/pro_02.png" /></div>
                        <span class="f18 f_black t_center">深層毛孔洗顏凝膠</span>
                        <span class="f15 f_black t_center">MOIST WASH GEL</span>
                    </a>
                </div>
                <div class="col-md-3 col-sm-3 col-xs-6">
                    <a href="javascript:;" class="item_pro" @click="windowHref('user_data/NS.php')">
                        <div class="img_wrapper"><img src="<!--{$smarty.const.HTTPS_URL}-->user_data/new_201811/img/pro_03.png" /></div>
                        <span class="f18 f_black t_center">毛孔無瑕礦泥洗顏粉</span>
                        <span class="f15 f_black t_center">NAMA NERI WASH</span>
                    </a>
                </div>
                <div class="col-md-3 col-sm-3 col-xs-6">
                    <a href="javascript:;" class="item_pro" @click="windowHref('user_data/OE.php')">
                        <div class="img_wrapper"><img src="<!--{$smarty.const.HTTPS_URL}-->user_data/new_201811/img/pro_04.png" /></div>
                        <span class="f18 f_black t_center">全效活膚保濕精華露</span>
                        <span class="f15 f_black t_center">ONLY ESSENCE</span>
                    </a>
                </div>
            </div> 
            <div class="btn_black" @click="windowHref('user_data/product_list.php')">
                全系列商品           
            </div>                

        </section>  


        <section id="ceo" class="W1200">
            <div class="W50 pc">
                <p class="f24 f_pink">您準備好了嗎?</p>
                <p class="f36 f_pink">改變肌膚，閃耀人生！</p>
                <p class="18">帶您認識MANARA</p>
                <div class="btn_black" @click="windowHref('user_data/features.php')">
                CHECK           
                </div>  
            </div>
            <img src="<!--{$smarty.const.HTTPS_URL}-->user_data/new_201811/img/img-ceo-pc.png" class="pc W50 f_right" alt="">
            <img src="<!--{$smarty.const.HTTPS_URL}-->user_data/new_201811/img/img-ceo-m.jpg" class="mb" alt="" @click="windowHref('user_data/features.php')">

        </section>

        <section id="news">
            <div class="W1200 t_left columns-12">
                <h5 class="title t_left col-l-12">最新訊息與通知<span class="sub_title">NEWS & INFORMATION</span></h5>
                <ul class="col-l-12 f18">
                    <li v-for="(n,i) in news" @click="newsHandler(n.date,n.title,n.content,n.image)">
                        <span class="date">{{ dateHandler(n.date)}}</span>
                        <span class="text">{{n.title}}</span>
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
                    
                    <iframe src="https://snapwidget.com/embed/636443" ref="ig" class="snapwidget-widget" allowtransparency="true" frameborder="0" scrolling="no" style="border:none; overflow:hidden; width:100%; "></iframe>
                    
                    <!-- <script src="https://cdn.lightwidget.com/widgets/lightwidget.js"></script>
                    <iframe src="http://lightwidget.com/widgets/10874b8eb5f45dc2827c274565c88784.html" scrolling="no" allowtransparency="true" class="lightwidget-widget mb" style="width:100%;border:0;overflow:hidden;"></iframe>
                    <script src="https://cdn.lightwidget.com/widgets/lightwidget.js"></script>
                    <iframe src="//lightwidget.com/widgets/ddc83499b17a5ece888b3b20b85f8633.html" scrolling="no" allowtransparency="true" class="lightwidget-widget pc" style="width:100%;border:0;overflow:hidden;"></iframe> -->

                </div>
                <div class="col-md-4 col-sm-4">
                    <div id="fb-root"></div>
                    <div class="fb"></div>
                </div>
                <!-- <div class="col-md-4 col-sm-4 t_center">
                    <a href="javascript:;" class="W50 svg_font f48 icon-icon-line">
                        <span class="f24">LINE</span><span class="f15">@manaraTW</span>    
                    </a>
                    <a href="javascript:;" class="W50 svg_font f48 icon-icon-youtube">
                        <span class="f18">Youtube</span><span class="f15">@manaraTW</span>    
                        
                    </a>
                </div> -->
            
            </div>
        </section>
        <!-- 最新消息燈箱   --->
        <div class="lb_wrapper" v-show="lbOpen" :class="{'show':lbOpen}">
            <div class="lb_bg" @click.stop.prevent="lbHandler"></div>     
            <div class="lb W960 bg_white">
                <p class="f_red f24 news">NEWS & INFORMATION</p>
                <img src="<!--{$smarty.const.HTTPS_URL}-->user_data/new_201811/img/btn-close.svg" class="close poA" alt="" @click="lbHandler">
                <div class="lb_content">
                    <p class="f18 f_grey date">{{lb_date}}</p>
                    <p class="f30 subtitle">{{lb_title}}</p>
                    <p class="f18 des" v-html="lb_des"></p>
                    <img :src="lb_src" class="W100" alt="" v-if="lb_src!=='user_data/admin/'">
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
                    news:[],
                    event: null,
                    lbOpen: false,
                    lb_data: null,
                    isDev: false,
                    isMobile: false,
                    lb_date:'',
                    lb_title:'',
                    lb_des:'',
                    lb_src: '',
                    slide_current:0,
                    container_height: null,
                    fb_recount: false
                },
                watch: {

                   
                },
                computed: {
                    slideWidth:function(){
                        // console.log(this.banners_pc.length);
                        return this.banners_pc.length*100+'%';

                    },
                    slideLeft:function(){
                        return - this.slide_current*100+'%';
                    }
                    
                },
                beforeMount() {
                    var $this = this;
                    $.ajax({
                        url: "/tw/user_data/admin/api/data.php",
                        type: "GET",
                        dataType: "json",

                        success: function(Jdata) {
                            // console.log(Jdata);
                            $this.banners = Jdata.data.banner;
                            $this.emergnecy = Jdata.data.emergnecy;
                            $this.event = Jdata.data.event; 
                            $this.news = Jdata.data.news; 
                            $this.bannerHandler();
                        },
                        error: function() {
                            console.log("ERROR!!!");
                        }
                    });
                },
           
                mounted() {
                    var $this = this;

                    this.DevHandler();
                    this.mobileHandler();
                    this.$nextTick( function() {
                        $(window).bind("load resize", function(){  
                            $this.fbFrame();
                            $this.mobileHandler();
                        }); 

                        $this.mobileHandler();

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


                        $(window).scroll(function(){
                            var scroll = $(window).scrollTop();
                            var threshold = $('#ceo').offset().top - $(window).innerHeight();
                            if(scroll > threshold && !$this.fb_recount)  {
                                $this.fb_recount = true;
                                $this.fbFrame();
                            }
                        })
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
                    fbFrame(){
                        var $this = this;
                        if ( $(window).innerWidth() <= 450) {
                            $this.container_height = 500;
                        } else {
                            ( $('div.ig').height() > 235 ) ? $this.container_height = $('div.ig').height(): $this.container_height = 235;
                        }
                        setTimeout(function() {
                        var container_width = $('.fb').width();    
                            $('.fb').html('<div class="fb-page" ' + 
                            'data-href="https://www.facebook.com/manaratw/"' +
                            ' data-width="' + container_width + '" data-tabs="timeline" data-small-header="false" data-adapt-container-width="true" data-height="'+ $this.container_height +'" data-hide-cover="false" data-show-facepile="true"><div class="fb-xfbml-parse-ignore"><blockquote cite="http://www.facebook.com/manaratw/"><a href="http://www.facebook.com/IniciativaAutoMat">Manara化妝品</a></blockquote></div></div>');
                            FB.XFBML.parse( );    
                        }, 100);  
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
                        // console.log(i);
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
                        // console.log(this.banners_mb[i].image);
                        if( this.isMobile ) {
                            addr = this.banners_mb[i].image;
                        } 
                        return domain + addr;
                    },
                    newsHandler(date,title,des,src){
                        // this.lb_date = '2018.12.01';
                        // this.lb_title = '聖誕限時快閃活動只到12/28止';
                        // this.lb_des = '日本原裝，熱銷1000萬限時優惠「毛孔變好乾淨，一直以來的困擾簡單解決了」 「洗完保濕不緊繃，用了 3 年，離不開 maNara 了！」 和熱銷千萬的 maNara 一起打擊黑頭！ 立即體驗回購率 98% 的溫熱...';
                        // this.lb_src = 'https://ecweb-dev.cros.tw/tw/user_data/new_201811/img/news-img-upload.jpg';
                        this.lb_date = date;
                        this.lb_title = title;
                        this.lb_des = des;
                        this.lb_src = src;
                        this.lbOpen = true;
                    },
                    dateHandler(date){
                        return date.replace(/-/g,'.').substr(0,7);

                    },
                    windowHref(page){
                        window.location=page;
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

