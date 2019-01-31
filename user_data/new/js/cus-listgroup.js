//hide all, except tab1. 
$(".js-tab-content").hide();
$(".js-tab-content:first").show();


$.fn.ulSelect = function () {
    var ul = $(this);

    if (!ul.hasClass('cus-ul-select')) {
        ul.addClass('cus-ul-select');
    }

    // SVG arrow
    var arrow = '<svg id="ul-arrow" xmlns="http://www.w3.org/2000/svg" version="1.1" width="20" height="20" viewBox="0 0 32 32"><line stroke-width="1" x1="" y1="" x2="" y2="" stroke="#449FDB" opacity=""/><path d="M4.131 8.962c-0.434-0.429-1.134-0.429-1.566 0-0.432 0.427-0.432 1.122 0 1.55l12.653 12.528c0.434 0.429 1.133 0.429 1.566 0l12.653-12.528c0.432-0.429 0.434-1.122 0-1.55s-1.136-0.429-1.566-0.002l-11.87 11.426-11.869-11.424z" fill="#999"/></svg>';
    $('li:first-of-type', this).addClass('active').append(arrow);
    $(this).on('click', 'li', function (event) {

        // click to target
        $(".js-tab-content").hide();
        var tabTarget = $(this).children("a");
        var activeTab = $(tabTarget).attr("rel");
        $(activeTab).fadeIn();



        // Remove div#selected if it exists
        if ($('#selected--cus-ul-select').length) {
            $('#selected--cus-ul-select').remove();
        }
        ul.before('<div id="selected--cus-ul-select">');
        var selected = $('#selected--cus-ul-select');
        $('li #ul-arrow', ul).remove();
        ul.toggleClass('active');
        // Remove active class from any <li> that has it...
        ul.children().removeClass('active');
        // And add the class to the <li> that gets clicked
        $(this).toggleClass('active');

        var selectedText = $(this).text();
        if (ul.hasClass('active')) {
            selected.text(selectedText).addClass('active').append(arrow);
        } else {
            selected.text('').removeClass('active');
            $('li.active', ul).append(arrow);
        }
    });

    // Close the faux select menu when clicking outside it 
    $(document).on('click', function (event) {
        if ($('ul.cus-ul-select').length) {
            if (!$('ul.cus-ul-select').has(event.target).length == 0) {
                return;
            } else {
                $('ul.cus-ul-select').removeClass('active');
                $('#selected--cus-ul-select').removeClass('active').text('');
                $('#ul-arrow').remove();
                $('ul.cus-ul-select li.active').append(arrow);
            }
        }
    });
}

// Run
$('#be-select').ulSelect();





// screen-FAQ-tab
$(".js-tab-btn").click(function () {
    
    // click to target
    $(".js-tab-content").hide();
    var activeTab = $(this).attr("rel");
    $(activeTab).fadeIn();

});