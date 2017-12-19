// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require rails-ujs
//= require ckeditor/init
//= require bootstrap-sprockets
//= require_tree .


$(document).ready(function() {
    $('.carousel').carousel({
      interval: 6000
    })
});

$(function() {
  remove_fields = function(link){
    $(link).prev('input[type=hidden]').val('1');
    $(link).closest('fieldset').hide();
  };

  $('.add_fields').on('click', function(event){
    var time = new Date().getTime();
    var regexp = new RegExp($(this).data('id'), 'g');
    $(this).before($(this).data('fields').replace(regexp, time));
    event.preventDefault();
  })
});
