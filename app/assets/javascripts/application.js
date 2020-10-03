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
//= require jquery3
//= require popper
//= require bootstrap-sprockets
//= require cocoon
//= require twitter/typeahead
//= require rails-ujs
//= require activestorage
//= require_tree .

function initMap(inputAddress, mapOptions) {
    const map = new google.maps.Map(document.getElementById('city-map'), mapOptions);

    const geocoder = new google.maps.Geocoder();
    geocodeAddress(inputAddress, map);

    function geocodeAddress(address, resultsMap) {
        geocoder.geocode({ address: address }, (results, status) => {
          if (status === "OK") {
            resultsMap.setCenter(results[0].geometry.location);
            new google.maps.Marker({
              map: resultsMap,
              position: results[0].geometry.location,
            });
          } else {
            alert("Geocode was not successful for the following reason: " + status);
          }
        });
      }
}