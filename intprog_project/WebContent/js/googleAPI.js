



  var rendererOptions = { draggable: true}; // Not needed
  var directionsDisplay = new google.maps.DirectionsRenderer(rendererOptions);
  var directionsService = new google.maps.DirectionsService();
  var map;
  
  function initialize() {

    var properties = {
      center: new google.maps.LatLng(59.347353, 18.073558),
      zoom:15,
      mapTypeId:google.maps.MapTypeId.SATELLITE,
      disableDefaultUI: true
    };
    map = new google.maps.Map(document.getElementById('map_canvas'), properties);
    directionsDisplay.setMap(map);
    directionsDisplay.setPanel(document.getElementById('directionsPanel'));

    google.maps.event.addListener(directionsDisplay, 'directions_changed', function() {
      computeTotalDistance(directionsDisplay.directions);
    });

    for (var i = 0; i < list.length; i++) { 
      console.log("inne i loopen");
      console.log(list[i].name);
      console.log(list[i].longitude);
      console.log(list[i].longitude);      
      var location = new google.maps.LatLng(list[i].latitude,list[i].longitude);
      var marker = new google.maps.Marker({
        position: location,
        map: map,
        draggable: true, //not needed
        title: list[i].name
      });

      var content = infoWindowContent(list[i]);
      var infowindow = new google.maps.InfoWindow()
      google.maps.event.addListener(marker,'click', (function(marker,content,infowindow){ 
        return function() {
         infowindow.setContent(content);
         infowindow.open(map,marker);
       };
     })(marker,content,infowindow)); 

    }
  }

  function infoWindowContent(event){
    var contentString = '<div id="content">'+ '<h4>'+event.name+'</h4>'+
    '<p><b>'+ event.starttime + '<br>'+event.endtime +'<br></b>'+event.description+'</p></div>';
    return contentString;
  }
  
  function Route() {

    geoLocation(function(startpos) {
      
      console.log(startpos);
      

      var start = startpos;
      var end = null;
      for (var i = 0; i < list.length; i++) {


        if(timeNow < list[i].endtime){

          var end = new google.maps.LatLng(list[i].latitude,list[i].longitude);
          console.log(list[i].name)
          break;
        }


      }
      if(end != null){
      var request = {
        origin:start,
        destination:end,
        travelMode: google.maps.TravelMode.WALKING
      };
      console.log("utanför");
      directionsService.route(request, function(response, status) {
        console.log("innanföf");
        console.log(status);
        if (status == google.maps.DirectionsStatus.OK) {
          console.log("inne i skiten");
          directionsDisplay.setDirections(response);
        }
      });

    } else {
      console.log("alla event har passerat");
    }
    });
    
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
    document.getElementById('duration').innerHTML = time ;
    document.getElementById('total').innerHTML =total + " meter";
  }
  
  google.maps.event.addDomListener(window,'load',initialize);
  google.maps.event.addDomListener(window,'load',geoLocation);

  //// time and date for the device
  function startTime() {
    var currentdate=new Date();
    var h=currentdate.getHours();
    var m=currentdate.getMinutes();
    var s=currentdate.getSeconds();
    m = checkTime(m);
    s = checkTime(s);
    document.getElementById('time').innerHTML = h+":"+m+":"+s;
    var t = setTimeout(function(){startTime()},500);
  }
  function checkTime(i) {
      if (i<10) {i = "0" + i};  // adds zeros in front of numbers < 10
      return i;
    }
    


    function geoLocation(callback) {

              // Try HTML5 geolocation
              if(navigator.geolocation) {
                navigator.geolocation.getCurrentPosition(function(position) {
                  var navigator = new google.maps.LatLng(position.coords.latitude,position.coords.longitude);
                  


                  var alienMarker = {
                    path: 'M 375,8.5 C 226.5,8.5 21.5,102.2 21.5,346 C 21.5,346.8 21.5,347.7 21.5,348.5 C 23.2,591.2 270.1,891.5 375,891.5 C 480.3,891.5 728.5,589.8 728.5,346 C 728.5,102.2 523.5,8.5 375,8.5 z M 57,367.5 C 230,367.5 355,489.5 355,672.5 C 174,672.5 57,555.5 57,367.5 z M 699,367.5 C 699,555.5 579.6,672.5 395,672.5 C 395,489.5 522.5,367.5 699,367.5 z',
                    fillColor: 'orange',
                    fillOpacity: 0.8,
                    scale: 0.05,
                    strokeColor: 'gold',
                    strokeWeight: 1
                  };

                  
                  var marker4 = new google.maps.Marker({
                    position:navigator,
                    map:map,
                    icon:alienMarker,
                    draggable:false,
                    animation: google.maps.Animation.DROP,
                    position: navigator,
                    title: "myPosition"




                  });
                  var word = "tja";
                  if(callback){
                    callback(navigator);

                  }


                })




};
}


