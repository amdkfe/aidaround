document.addEventListener("turbolinks:load", function() {
    var currgeocoder;

    //Set geo location lat and long
    navigator.geolocation.getCurrentPosition(function (position, html5Error) {
        geo_loc = processGeolocationResult(position);
        currLatLong = geo_loc.split(",");
        initializeCurrent(currLatLong[0], currLatLong[1]);
    });

    //Get geo location result
    function processGeolocationResult(position) {
        html5Lat = position.coords.latitude; //Get latitude
        html5Lon = position.coords.longitude; //Get longitude
        html5TimeStamp = position.timestamp; //Get timestamp
        html5Accuracy = position.coords.accuracy; //Get accuracy in meters
        return (html5Lat).toFixed(8) + ", " + (html5Lon).toFixed(8);
    }

    //Check value is present or
    function initializeCurrent(latcurr, longcurr) {
        currgeocoder = new google.maps.Geocoder();

        console.log(latcurr + "-- ######## --" + longcurr);

        if (latcurr != '' && longcurr != '') {
            //call google api function
            var myLatlng = new google.maps.LatLng(latcurr, longcurr);
            return getCurrentAddress(myLatlng);
        }
    }

    //Get current address
    function getCurrentAddress(location) {
        var address_field = document.getElementById("address");
        var lat_field = document.getElementById("latitude");
        var lon_field = document.getElementById("longitude");
        currgeocoder.geocode({
            'location': location
        }, function (results, status) {
            if (status == google.maps.GeocoderStatus.OK) {
                console.log(results[0]);
                $("#address").html(results[0].formatted_address);
                $("#latitude").html(results[0].formatted_address);
                address_field.value = results[0].formatted_address;
                lat_field.value = html5Lat;
                lon_field.value = html5Lon;
                  var map = new GMaps({
                  div: '#map',
                  lat: html5Lat,
                  lng: html5Lon
                });
                  map.addMarker({
                  lat: html5Lat,
                  lng: html5Lon
                  });
            } else {
                alert('Geocode was not successful for the following reason: ' + status);
            }
        });
    }
});
