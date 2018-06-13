  document.addEventListener("turbolinks:load", function() {

    //sets a default lat long on the homepag map
    var map = new GMaps({
      div: '#homemap',
      lat: 51.5074,
      lng: 0.1278,
      zoom: 10,
    });
    //add the map var to the windows DOM
    window.map = map;

    //get the homemap and parse the existing markers, store and add the to windows object//  
    var tasks = JSON.parse(document.querySelector("#homemap").dataset.markers);
    window.tasks = tasks;

    // var bounds = new google.maps.LatLngBounds();
    // alert(tasks)
    //adding markers to the map
    tasks.forEach(function(task) {
      if (task.latitude && task.longitude) {
        var a = task.latitude;
        var b = task.longitude;
        alert (a,b)

        var marker = map.addMarker({
          lat: a,
          long: b, 
          title: task.title,
          infoWindow: { 
            content: '<p>ahmad</p>'
          }
        });

        // bounds.extend(marker.position);
      }
    });
    // map.fitBounds(bounds);
  });