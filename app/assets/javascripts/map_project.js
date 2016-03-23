$( document ).ready(function() {
    var map = L.map('project-map-container').setView([51.505, -0.09], 3);

    L.tileLayer('https://{s}.tiles.mapbox.com/v4/javiabia.148f6b63/{z}/{x}/{y}.png?access_token=pk.eyJ1IjoiamF2aWFiaWEiLCJhIjoiS1ZyQ3BQYyJ9.v8yJTbF879AQ_t6j5XafiQ', {
        attribution: '&copy; <a href="http://osm.org/copyright">OpenStreetMap</a> contributors'
    }).addTo(map);

    var archioIcon = L.icon({
      iconUrl: '../../../assets/marker-icon.png',
      shadowUrl: '../../../assets/marker-shadow.png',
      iconSize: [24,36],
      iconAnchor: [12,36]
    })

    map.on('click', function(e) {
      var point = e.latlng; // e is an event object (MouseEvent in this case)
      L.marker(point, {icon: archioIcon, draggable: true}).addTo(map);
    });
});