<?php include '../header.php'; ?>

<div id="container">
    <div id="one_maincolumn" class="main_column">
        <!--   肚子開始  -->       
        
        <div id="container" class="clearfix">
            <div id="one_maincolumn" class="main_column">
                <div class="W100 t_center">
                    <div class="banner_m banner-qa">
                        <div class="banner-txt">
                            <h4>常見問題</h4>
                            <span></span>
                            <h6>Q&A</h6>
                        </div>
                    </div>
                </div>
                    
                <div class="main-content">
                    <!-- 手機版QA清單 -->
                    <div class="qa-list-phone hide_screen">
                        

                        <div id="selected--cus-ul-select" :class="{'active': mb_tab_show}" @click="mb_tab_show = false">
                            {{ mb_tab_show ? mb_title : '' }}
                            <img src="new_201811/img/icon/icon-off.svg" alt="" class="arrow" v-if="mb_tab_show">
                            
                        </div>


                        <ul id="be-select" :class="{'cus-ul-select': isMb, 'active': mb_tab_show}">
                            <li v-for="(item,index) in faq" @click="tabHandlerMb(index,item.title)" :class="{'active': mb_title === item.title }">
                                <a href="javascript:void(0)" :class="{'active': current_tab === index}">
                                    <div>
                                        <img :src="imgSrc(item.icon)" alt="MANARA的常見問題">
                                    </div>
                                    <p>{{ item.title }}</p>
                                </a>
                                <img src="new_201811/img/icon/icon-off.svg" alt="" class="arrow" v-if="!mb_tab_show">
                                
                            </li>
                        
                        </ul>
                    </div>
                    <div class="qa-col-12">
                        <!-- 電腦版QA清單 -->
                        <div class="col-3 js-qa-list-screen qa-list-screen hide_phone">
                            <ul>
                                <li>
                                    <a class="js-tab-btn" :class="{'active': current_tab === index}" href="javascript:void(0)" v-for="(item,index) in faq" @click="tabHandler(index)">
                                        <div>
                                            <img :src="imgSrc(item.icon)" alt="MANARA的常見問題">
                                        </div>
                                        <p>{{ item.title }}</p>
                                    </a>
                                </li>
                                
                            </ul>
                        </div>
                        <div class="col-9 pt-1">
                          
                            <div class="js-tab-content qa-tab-content" :class="{'active': index === current_tab}" v-for="(item,index) in faq" :ref="'tab'+index" v-show="index === current_tab">
                                <h1 class="qa-title">{{ item.title }}</h1>
                                <div class="qa-card-box"  v-for="(q,i) in item.qa">
                                    <div class="qa-card">
                                        <div class="js-card-title qa-card-title qa-open" @click="seeDetail(index+'_ans_'+i, index+'_qus_'+i)" :ref="index+'_qus_'+i" :id="index+'_qus_'+i">{{ q.question }}</div>
                                        <p class="qa-card-txt" :ref="index+'_ans_'+i">
                                            <span v-html="q.answer">
                                        </p>
                                    </div>
                                </div>
                            </div>
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- <script src="new/js/cus-listgroup.js"></script> -->
        <link rel="stylesheet" href="new_201811/css/new_init.css?v=0131" />
        <link rel="stylesheet" href="new_201811/css/new_faq.css?v=0131" />



        <script>
         var app = new Vue({
                el: '#container',
                data: {
                    domain: 'https://ecweb-dev.cros.tw/tw/',
                    isDev: false,
                    isMb: false,
                    mb_title: null,
                    mb_tab_show: false,
                    faq: null,
                    current_tab: 0
                },
                beforeMount () {
                    var $this = this;
                    this.isDev = window.location.href.indexOf('localhost') > -1 || window.location.href.indexOf('ecweb-dev') > -1;

                    // $.ajax({
                    //     // url: ( this.isDev ) ? "https://ecweb-dev.cros.tw/tw/user_data/admin/api/faq.php" : "https://www.manara.asia/tw/user_data/admin/api/faq.php",
                    //     url: "https://www.manara.asia/tw/user_data/admin/api/faq.php",
                    //     type: "GET",
                    //     dataType: "json",
                    //     success: function(Jdata) {
                    //         $this.faq = Jdata.data.faq;
                    //     }
                    // })
                    
                    $.getJSON("../faq_data.json", function (Jdata) {
                        $this.faq = Jdata.data.faq;
                        console.log( $this.faq);
                    });
                    
                },
                watch: {
                    isMb() {
                        if( this.isMb && this.faq!== null) {
                            this.mb_title = this.faq[0].title;
                        }
                    },
                    faq(){
                        if( this.isMb && this.faq!== null) {
                            this.mb_title = this.faq[0].title;
                        }
                    }
                },
                mounted() {
                    var $this = this;
                    this.isMb = $(window).innerWidth() <= 768 ;

                    this.$nextTick( function() {
                        $(window).on('resize', function(){
                            $this.isMb = $(window).innerWidth() <= 768 ;
                        });

                        const hasCat = this.getUrlParameter('cat');
                        if(hasCat) {
                            this.openSpecificCat(hasCat);
                        }

                        
                    })
                }, 
                methods:{
                    imgSrc(src){
                        // return this.domain + src;
                        return src;
                    },
                    seeDetail(q_el, a_el){
                        $(this.$refs[q_el]).slideToggle();
                    },
                    tabHandler(tab) {
                        $('body').find(".js-tab-content").hide();
                        $(this.$refs[`tab${tab}`]).fadeIn();
                        this.current_tab = tab;
                    },
                    tabHandlerMb(tab, title) {
                        this.mb_tab_show = !this.mb_tab_show;
                        $('body').find(".js-tab-content").hide();
                        $(this.$refs[`tab${tab}`]).fadeIn();
                        this.mb_title = title;

                    },
                    getUrlParameter(name) {
                        name = name.replace(/[\[]/, '\\[').replace(/[\]]/, '\\]');
                        var regex = new RegExp('[\\?&]' + name + '=([^&#]*)');
                        var results = regex.exec(location.search);
                        return results === null ? '' : decodeURIComponent(results[1].replace(/\+/g, ' '));
                    },
                    openSpecificCat(cat) {
                        switch(cat){
                            case 'general': {
                                this.current_tab = 0;
                            }
                            break;
                            case 'regular': {
                                this.current_tab = 1;
                            }
                            break;
                            case 'deliv': {
                                this.current_tab = 2;
                            }
                            break;
                            case 'cg': {
                                this.current_tab = 3;
                            }
                            break;
                            case 'mg': {
                                this.current_tab = 4;
                            }
                            break;
                            case 'tw': {
                                this.current_tab = 5;
                            }
                            break;
                            case 'oe': {
                                this.current_tab = 6;
                            }
                            break;
                            case 'bb': {
                                this.current_tab = 7;
                            }
                            break;
                            case 'sc': {
                                this.current_tab = 8;
                            }
                            break;
                            default: {
                               
                            }
                        }
                        setTimeout(() => {
                            this.seeDetail(`${this.current_tab}_ans_${this.getUrlParameter('q')}`);
                            var $body = (window.opera) ? (document.compatMode == "CSS1Compat" ? $('html') : $('body')) : $('html,body');
                            $body.animate({scrollTop: $(this.$refs[`${this.current_tab}_ans_${this.getUrlParameter('q')}`]).offset().top - (this.isMobile()? 120: 170)  }, 50);
                            history.pushState('', '', 'faq.php');
                        }, 300);
                        
                    },
                    isMobile() {
                        return window.innerWidth <= 768;
                    },
                }
            })

            
        </script>

        <!--   肚子結束  -->
        


    </div>
</div>   
<script type="text/javascript" src="new_201811/js/product.js"></script>
<style>
    body{
        text-align: center;
    }
    .qa-card-box{
        text-align: left;
    }
</style>

<?php include '../footer.php'; ?> 
