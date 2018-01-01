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

$(function() {
  $('.carousel').carousel({
      interval: 6000
  })

  remove_fields = function(event, link){
    $(link).prev('input[type=hidden]').val('1');
    $(link).closest('fieldset').hide();
    event.preventDefault();
  };

  add_fields = function(event, link){
    var time = new Date().getTime();
    var regexp = new RegExp($(link).data('id'), 'g');
    $(link).before($(link).data('fields').replace(regexp, time));
    event.preventDefault();
  }

  $('.cancellation-booking').on('click', function(event){
    event.preventDefault();
    var booking_id =  this.id;
    $.ajax({
      method: 'DELETE',
      url: "/bookings/" + booking_id
    }).success(function(data){
      $('#booking-'+ booking_id).remove();
      alert(data.content);
    })
  });

  sessionStorage.setItem("SelItem", "all");
  $('#search_option').on('click', function() {
    var selVal = $(this).val();
    sessionStorage.setItem("SelItem", selVal);
  });
  var selItem = sessionStorage.getItem('SelItem');
  $('#search_option').val(selItem).attr('selected');
});

