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
//= require jquery-ui
//= require jquery_ujs
//= require_tree .

var ready;
ready = function() {

  console.log('ready!');
  $('body').on('click', '.close', closeModal);
  $('#timeline').on('click', '.log-trip', loadNewGetaway);
  $('#timeline').on('click', '.read-more', loadShowGetaway);
  $('body').on('click', '.getaway-photo', changeActivityPhoto);

  changeBackgroundImage();
  googlePlacesAutocomplete();
  correctFigureImages();


  // autocomplete for friends search
  $('#search').autocomplete({
    source: function(request, response) {
      $.get('/search_friends_autocomplete', {
        data: {search: request.term},
        dataType: 'json'
      }).done(function(data) {
          response(data.names);
      });
    },
    messages: {
      noResults: '',
      results: function() {}
    }
  });


};

// Turbolinks workaround that helps reload the google autocomplete
// function on every page.
$(document).ready(ready);
$(document).on('page:load', ready);

// variable for helping the google places autocomplete
// functionality work
var autocomplete;

// adds redirect functionality to the
// log a trip button on user show page
function loadNewGetaway() {
  location.href = '/getaways/new';
}

// adds redirect functionality to the read more button on
// the user show page for a particular trip
function loadShowGetaway() {
  var getawayID = $(this).closest('.timeline-block').data('id');
  location.href = '/getaways/' + getawayID;
}

// adds the ability to change a user photo
function changeActivityPhoto() {
  var photo = $(this);
  $.ajax('/activities/'+ photo.data('activityid') +'/update_photo', {
    type: 'PUT',
    data: {photo_id: photo.data('photoid')}
  }).done(function(data) {
    $('.modal').hide();
    var image = $('#activity_'+ data.id).find('img')
    image.attr('src', data.image_url);

    var imageHeight = image.height();
    var imageWidth = image.width();

    if (imageWidth > imageHeight) {
      image.parent().addClass('landscape');
    } else {
      image.parent().addClass('portrait');
    }
  });
}

// find any image on the page inside a figure and set it so that
// it covers the entirety of the figure depending on it's length or
// width. This doesn't solve for left right positioning.
function correctFigureImages() {

  var figureImages = $('figure img');

  for (var i = 0; i < figureImages.length; i++) {
    if (figureImages.eq(i).width() > figureImages.eq(i).height()) {
      figureImages.eq(i).parent().addClass('landscape');
    } else {
      figureImages.eq(i).parent().addClass('portrait');
    }
  }
}




// google places autocomplete functionality
function googlePlacesAutocomplete() {

  // choosing places by city name
  autocomplete = new google.maps.places.Autocomplete(
      /** @type {HTMLInputElement} */(document.getElementById('autocomplete')),
      { types: ['(cities)'] });

  // When the user selects an address from the address dropdown,
  // The address is saved on screen, and the hidden fields for the
  // form on the page are generated based on the choice
  google.maps.event.addListener(autocomplete, 'place_changed', function() {
    var textField = $('#autocomplete');

    // the value for the city is taken and split by the comma and space
    // to get the city and country (this is usually the first two elements)
    var placeArray = textField.val().split(', ');
    textField.replaceWith('<p>'+ textField.val() +'</p>');


    // hidden input fields are generated and added to the form so that the city and country can be sent
    // to the create action of the getaway controller.
    var hiddenFieldCity = $('<input type="hidden" name="getaway[city]" value="'+ placeArray[0] +'" >');
    var hiddenFieldCountry = $('<input type="hidden" name="getaway[country]" value="'+ placeArray[1] +'" >');
    $('#new-getaway-date-form').prepend(hiddenFieldCountry);
    $('#new-getaway-date-form').prepend(hiddenFieldCity);

    // the date picker is now revealed
    $('p#date-placeholder').hide();
    $('#departure-date-div').show();

    // the comment text area is now revealed
    $('#comment-placeholder').hide();
    $('#comment-div').show();

    // submit button added to the form
    $('#new-getaway-date-form').append('<input type="submit" value="Save Trip">');
  });
}


// This changes the background image of the header on the getaway show page.
function changeBackgroundImage() {
  var tripHeader = $('.trip-header')

  // the header is given a random photo url attribute in the backend
  // this is happening on the getaway show page.
  var photoUrl = tripHeader.data('randomphotourl');

  if (photoUrl !== 'none') {
    tripHeader.css('background-image', 'url("'+ photoUrl +'")');
  }
}

// closes all modals
function closeModal() {
  $(this).remove();
  $('.modal').fadeOut('fast');
}
