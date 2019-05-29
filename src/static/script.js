jQuery(document).ready(function () {

    $("html").css('background-image', 'url("/photo?' + Math.random() * 2048 * 2048 + '")');

    (function () {
        $("#time").text(moment().format('DD.MM.YYYY HH:mm'));
        setTimeout(arguments.callee, 60 * 1000);
    })();

    (function () {
        var image = $('#html');
        image.fadeOut(1000, function () {
            image.css('background-image', 'url("/photo?' + Math.random() * 2048 * 2048 + '")');
            image.fadeIn(1000);
        });
        setTimeout(arguments.callee, 10 * 1000);
    })();

    (function () {
        jQuery.getJSON("/weather", function (data) {
            $("#tempval").text(parseFloat(data.currently.temperature).toFixed(1))
        });
        setTimeout(arguments.callee, 10 * 60 * 1000);
    })();

    jQuery("body").click(function () {
        location.reload();
    });

});
