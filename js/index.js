var dev = window.location.href.indexOf('localhost') > -1;
console.log(dev);
if (dev) {
    $('img, a, link').each(function() {
        var el = $(this).context.tagName;

        if (el === 'IMG') {
            var current_src = $(this).attr('src').replace('<!--{$smarty.const.ROOT_URLPATH}-->', 'https://www.manara.asia/tw/');
            $(this).attr('src', current_src);
        }
        if (el === 'LINK' || el === 'A') {
            var current_href = $(this).attr('href').replace('<!--{$smarty.const.ROOT_URLPATH}-->', 'https://www.manara.asia/tw/');
            $(this).attr('href', current_href);
        }
    })
}

$(function() {
    $('body').on('click', '.close', function() {
        $(this).parents('.close_parent').slideUp();
    });

    $('.banner-slider ul').bxSlider({
        auto: true,
        hideControlOnEnd: true,
        speed: 1000
    });

})