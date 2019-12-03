var dev = window.location.href.indexOf("localhost") > -1,
  domain = "",
  $body = window.opera
    ? document.compatMode == "CSS1Compat"
      ? $("html")
      : $("body")
    : $("html,body");

// document.addEventListener('DOMContentLoaded', function () {     var tag =
// location.hash;     if (tag === "#howtouse") {         console.log(tag,
// $('.sec6').offset().top);         // window.scrollTo(0,
// $('.sec6').offset().top);         $body.animate({             scrollTop:
// $('.sec6')                 .offset()                 .top         }, 500); //
// history.replaceState(null, null, ' ');     } });

$(function() {
  var tag = location.hash;
  if (dev) {
    domain = "https://ecweb-dev.cros.tw/tw/user_data/";
  }

  if (tag === "#howtouse") {
    $(window).on("load", function() {
      use();
    });
    use();
  }

  function use() {
    setTimeout(function() {
      $("html,body").animate(
        {
          scrollTop: $(".sec6").offset().top - 90
        },
        "slow"
      );
      history.replaceState(null, null, " ");
    }, 1000);
  }

  $("body").on("click", ".info", function() {
    window.location = domain + "regular.php";
  });

  $("body").on("click", ".all_", function() {
    window.location = "product_list.php";
  });

  // $('.sec4').on('click', 'h3', function () {     window.location = domain +
  // "features.php"; });

  $(".sec9").on("click", "li", function() {
    var page = $(this).attr("data-href");
    window.location = domain + page;
  });

  var name = $(".p_name").html();
  // var bread = '<div class="W1200 bread"> <span class = "f15 f_red f_left" ><a href="/tw/">首頁 / </' +
  //     'a><a href="product_list.php">MANARA商品 / </a>' + name + '</span></div>';

  // $('#_product').prepend(bread);

  $(".day_night").on("click", "li", function() {
    var page = $(this).attr("data-href");
    if (page === undefined) {
      console.log("now");
      return;
    }
    window.location = page;
  });
});
