   



  function Route(endpointLat,endpointLong) {



    routeON = !routeON;


    if(routeON){
    
      geoLocation(function(startpos) {
        directionsDisplay.setMap(map);
        directionsDisplay.setOptions( { suppressMarkers: true } );
      
        var start = startpos;
        var end = null;

      if(endpointLat==null){
        
        for (var i = 0; i < list.length; i++) {

          if(timeNow < list[i].endtime){
            var end = new google.maps.LatLng(list[i].latitude,list[i].longitude);
            
            break;
          }
        }
      } else {
        var end = new google.maps.LatLng(endpointLat,endpointLong);

        


      }
        if(end != null){
          var request = {
            origin:start,
            destination:end,
            travelMode: google.maps.TravelMode.WALKING
          };
          directionsService.route(request, function(response, status) {

            if (status == google.maps.DirectionsStatus.OK) {
              directionsDisplay.setDirections(response);
            }
          });
        } 
        else {
          console.log("alla event har passerat den nuvarande tiden");
        }
       
      });
    } else {
      directionsDisplay.setMap();
    

    }
  } 





  function computeTotalDistance(result) {
    var total = 0;
    var time= 0;
    var from=0;
    var to=0;
    var myroute = result.routes[0];
    for (var i = 0; i < myroute.legs.length; i++) {
      total += myroute.legs[i].distance.value;
      time +=myroute.legs[i].duration.text;
      from =myroute.legs[i].start_address;
      to =myroute.legs[i].end_address;
    }
    time = time.replace('hours','H');
    time = time.replace('mins','M');
    document.getElementById('duration').innerHTML ="(approx " + time +")";
    document.getElementById('total').innerHTML ="Walk " + total + " m";
  }






   function geoLocation(callback) {

    // Try HTML5 geolocation
    if(navigator.geolocation) {
      navigator.geolocation.getCurrentPosition(function(position) {
        var navigator = new google.maps.LatLng(position.coords.latitude,position.coords.longitude);
    


  var geomarker = new Marker({
  map: map,
  title: 'Map Icons',
  position: navigator,
  zIndex: 9,
  icon: {
    path: MAP_PIN,
    fillColor: '#FF4981',
    fillOpacity: 0.8,
    scale: 0.3,
    strokeColor: '#FB2B69',
    strokeWeight: 1
  },
  label: '<i class="map-icon-walking"></i>'
});

        if(callback && typeof(callback) === "function"){
          callback(navigator);

        }


      });

    }
  }