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

  $("#navbar ul li a[href^='#']").on('click', function(e) {
    e.preventDefault();
    $('html, body').animate({
      scrollTop: $(this.hash).offset().top
    }, 600, function(){
      window.location.hash = this.hash;
    });
  });

  //$('.js-float-label-wrapper').FloatLabel();

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
