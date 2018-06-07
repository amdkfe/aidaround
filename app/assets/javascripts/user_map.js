// $(document).on('ready turbolinks:change turbolinks:load', function() { });


function userMap(lat,lng){
var preview = document.querySelector('map');
var file    = document.getElementById('map_input').value;
var reader  = new FileReader();

reader.onloadend = function () {
    preview.src = reader.result;
  }
  if (file) {
handler = Gmaps.build('Google');  
handler.buildMap({ provider: {}, internal: {id: 'map'}}, function(){  
  markers = handler.addMarkers([  
    {  
      "lat": lat,  
      "lng": lng,  
      "picture": {  
        "width":  32,  
        "height": 32  
      },  
      "infowindow": "SJSU"  
    }  
  ]);  
  handler.bounds.extendWith(markers);  
  handler.fitMapToBounds();  
});
  } else {
    preview.src = "https://s3.eu-west-2.amazonaws.com/aidaround-avatar-bucket/default_avatar/avad.png";
  }
}


