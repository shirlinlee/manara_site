$(function () {
    //手機版menu從左向右滑入效果
    $(".navicon").click(function () {
        // var menuContent = document.getElementsByClassName("navicon");
        var x = $(".menu-content-phone").css("left");
        if (x == "-300px") {
            $(".menu-content-phone").stop().animate({
                left: '0'
            }, 300);
        } else {
            $(".menu-content-phone").stop().animate({
                left: '-300px'
            }, 300);
        }
    });
    //手機版menu-2nd第二層選單的開關
    $(".js-menu-2nd-box-btn").click(function () {
        var open2ndMenu = $(this).next(".menu-2nd-box");
        var btnArrow = $(this).children(".js-btn-arrow");
        if ($(btnArrow).hasClass("js-nav-2nd-open")) {
            $(btnArrow).removeClass("js-nav-2nd-open");
            $(btnArrow).addClass("js-nav-2nd-close");
            $(open2ndMenu).slideToggle(300);
        } else {
            $(btnArrow).removeClass("js-nav-2nd-close");
            $(btnArrow).addClass("js-nav-2nd-open");
            $(open2ndMenu).slideToggle(300);
        }
        return false;
    });
    //桌機版menu展開次選單
    $(".menu-2nd-box-screen-btn").mouseover(function(){
        $(".menu-2nd-box-screen",this).stop().slideDown();
    });
    $(".menu-2nd-box-screen-btn,.menu-2nd-box-screen").mouseout(function(){
        $(".menu-2nd-box-screen").stop().slideUp();
    });

});