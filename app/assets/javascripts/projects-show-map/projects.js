$( document ).ready(function() {

    var map = L.map('project-map-container').setView([51.505, -0.09], 2);

    L.tileLayer('https://{s}.tiles.mapbox.com/v4/javiabia.148f6b63/{z}/{x}/{y}.png?access_token=pk.eyJ1IjoiamF2aWFiaWEiLCJhIjoiS1ZyQ3BQYyJ9.v8yJTbF879AQ_t6j5XafiQ', {
        attribution: '&copy; <a href="http://osm.org/copyright">OpenStreetMap</a> contributors'
    }).addTo(map);

    var project_id = function(){
  	  return window.location.pathname.split("/")[4];
  	};

	$.ajax({
        url: "http://localhost:8080/projects/map_project",
        data: {"id" : project_id()},
        success: function(response){
          var geoJsonArray = response;
          //Características de los markers
          var geojsonMarkerOptions = {
              radius: 6,
              fillColor: "#8A2223",
              color: "#8A2223",
              weight: 1,
              opacity: 1,
              fillOpacity: 0.6
          };
          //opciones de visualización
          L.geoJson(geoJsonArray, {
            pointToLayer: function (feature, latlng) {
              return L.circleMarker(latlng, geojsonMarkerOptions);
            }
          }).addTo(map);
        },
        error: function(){
          console.log("error")
        }
      })

});