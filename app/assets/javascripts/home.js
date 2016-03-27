$( document ).ready(function() {

  var map = L.map('home-map-container').setView([51.505, -0.09], 3);

    L.tileLayer('https://{s}.tiles.mapbox.com/v4/javiabia.148f6b63/{z}/{x}/{y}.png?access_token=pk.eyJ1IjoiamF2aWFiaWEiLCJhIjoiS1ZyQ3BQYyJ9.v8yJTbF879AQ_t6j5XafiQ', {
        attribution: '&copy; <a href="http://osm.org/copyright">OpenStreetMap</a> contributors'
    }).addTo(map);

      
      $.ajax({
        url: "http://localhost:3000/projects/map_elements",

        success: function(response){
          var geoJsonArray = response;
          var sitesLayer = L.geoJson.addTo(map);

          sitesLayer.addData(geoJsonArray[0]);

        },
        error: function(){
          console.log("error")
        }
      })




  //EVENTS

  $(".map").click( function(e){
    e.preventDefault;
    $("#home-map-container").addClass("home-map--animated");
  })

});