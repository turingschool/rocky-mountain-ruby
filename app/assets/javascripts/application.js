// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require jquery.matchHeight.js
//= require jquery.FloatLabel.js
//= require_tree .

$(function() {
    $('[data-mh]').matchHeight();


    $('.toggle-nav').click(function(e) {
        e.preventDefault();
        $('nav.navbar').toggleClass('open');
    });


    // Find all anchors
    if (window.location.pathname == '/') {
        $('#navbar').find('a[href]').each(function(i, a) {
            var $a = $(a);
            var href = $a.attr('href');
            // check is anchor href starts with page's URI
            if (href.indexOf('/#') == 0) {
                // remove URI from href
                href = href.replace('/', '');
                // update anchors HREF with new one
                $a.attr('href', href);

                $(a).on('click', function(e) {
                    e.preventDefault();
                    var _this = $(this);
                    console.log(_this.attr('href'));
                    $('html, body').animate({
                        scrollTop: $(_this.attr('href')).offset().top
                    }, 600, function() {
                        window.location.hash = _this.attr('href');
                    });
                });
            }

            setTimeout(function() {
                $('body').scrollspy({
                    target: '#navbar',
                    offset: 20
                });
            }, 500);
        });
    }


    $('form').validate();

    var $btn = $('form .btn-submit');

    $('form').ajaxForm({
        target: '#formResults',
        resetForm: true,
        beforeSubmit: function() {
            $btn.button('loading');
        },
        success: function() {
            $btn.button('reset');
        }
    });
});
