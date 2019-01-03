var dev = window.location.href.indexOf('localhost') > -1,
    domain = '';

console.log(dev);

$(function () {
    if (dev) {
        domain = 'https://ecweb-dev.cros.tw/tw/user_data/';
    }

    $('body').on('click', '.info', function () {
        window.location = domain + "regular.php";
    });

    $('body').on('click', '.all_', function () {
        window.location = "product_list.php";
    });

    // $('.sec4').on('click', 'h3', function () {
    //     window.location = domain + "features.php";
    // });

    $('.sec9').on('click', 'li', function () {
        var page = $(this).attr('data-href');
        window.location = domain + page;
    });

    var name = $('.sec3').find('h2').html();
    var bread = '<div class="W1200 bread"> <span class = "f15 f_grey f_left" ><a href="/tw/">首頁</a> / <a href="product_list.php">maNara商品</a> / ' + name + '</span></div>';

    $('#_product').prepend(bread);


    $('.day_night').on('click', 'li', function () {
        var page = $(this).attr('data-href');
        if (page === undefined) {
            console.log('now');
            return;
        }
        window.location = page;
    });


})