var dev = window.location.href.indexOf('localhost') > -1;
if (dev) {
    $('img, a, link').each(function() {
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