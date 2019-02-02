           
        $(document).ready(function(){
            $(".navbar-toggle").on("click",function(){var n=$(this),a=n.parents(".navbar"),t=a.find(".navbar-content");n.toggleClass("active"),t.toggleClass("open")});
            
            // 移除離島項目
            if ($('#order_pref').length > 0) {
                var list = [3,5,18,19,20];
                for (i=0; i<list.length; i++) {
                    $('#order_pref, #dialogPref').find('option[value="' + list[i] + '"]').remove();
                }
            }
        });
        
        $(document).ready(function(){


            $('a').click(function(){
                $('html, body').animate({
                    scrollTop: $( $(this).attr('href') ).offset().top
                }, 500);
                return false;
            });
            if ($('#back-to-top').length) {
                var scrollTrigger = 100, // px
                    backToTop = function () {
                        var scrollTop = $(window).scrollTop();
                        if (scrollTop > scrollTrigger) {
                            $('#back-to-top').addClass('show');
                        } else {
                            $('#back-to-top').removeClass('show');
                        }
                    };
                backToTop();
                $(window).on('scroll', function () {
                    backToTop();
                });
            }

        });    

        /* Slider */
        $('.banner-slider ul').bxSlider({
          auto: true,
          hideControlOnEnd: true
        });

        $('.product-pic ul').bxSlider({
          pagerCustom: '#bx-pager'
        });

        $('.slider1').bxSlider({
            slideWidth: 200,
            minSlides: 4,
            maxSlides: 6,
            slideMargin: 10
        });

        $(window).load(function() {
            var imgNum = $(".bxslider li").length;
            if (imgNum>6) {
                $(".bx-next").css("background","url(images/controls.png) no-repeat -43px -32px");
                $(".bx-prev").css("background","url(images/controls.png) no-repeat 0px -32px");
            }else{
                $(".bx-next").css("display","none");
                $(".bx-prev").css("display","none");
            }
        });