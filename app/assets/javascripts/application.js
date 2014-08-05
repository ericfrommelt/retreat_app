// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$(document).ready(function() {
  console.log('ready!');
  $('body').on('click', '.close', closeUserAuthModal);
  $('#new-getaway-modal').on('click', '.place-option', setPlace);

  autocomplete = new google.maps.places.Autocomplete(
      /** @type {HTMLInputElement} */(document.getElementById('autocomplete')),
      { types: ['(cities)'] });
  // When the user selects an address from the dropdown,
  // populate the address fields in the form.
  google.maps.event.addListener(autocomplete, 'place_changed', function() {
    var textField = $('#autocomplete');
    var placeArray = textField.val().split(', ');
    textField.replaceWith('<p>'+ textField.val() +'</p>');

    var hiddenFieldCity = $('<input type="hidden" name="getaway[city]" value="'+ placeArray[0] +'" >');
    var hiddenFieldCountry = $('<input type="hidden" name="getaway[country]" value="'+ placeArray[1] +'" >');

    $('#new-getaway-date-form').prepend(hiddenFieldCountry);
    $('#new-getaway-date-form').prepend(hiddenFieldCity);

    $('p#date-placeholder').hide();
    $('#departure-date-div').show();

    $('#comment-placeholder').hide();
    $('#comment-div').show();

    $('#new-getaway-date-form').append('<input type="submit" value="Save Trip">');

  });
})

var autocomplete;

function closeUserAuthModal() {
  console.log('close click');
  $('.modal').hide();
  $('#user-auth-modal').hide();
}

function setPlace() {
  var place_array = $(this).text().split(', ');

  place.city = place_array[0];
  place.country = place_array[1];

  $('#place-search-form').replaceWith('<p>'+ place.city +', '+ place.country +'</p>')

  $('.modal').hide();
  $('#departure-date-div').show();
}
