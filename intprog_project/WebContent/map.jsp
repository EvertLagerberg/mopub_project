<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>




<!DOCTYPE html>
<html>
<head>
 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

 <!-- Bootstrap core CSS -->
 <link href="css/bootstrap.min.css" rel="stylesheet">

 <!-- CSS -->
 <link href="css/footer.css" rel="stylesheet">
 <link href="css/custom.css" rel="stylesheet">

 <meta charset="utf-8">
 <meta http-equiv="X-UA-Compatible" content="IE=edge">

 <!--Web App settings -->
 <meta name="apple-mobile-web-app-capable" content="yes">

 <!-- Status Bar -->
 <meta name= "apple-mobile-web-app-status-bar-style" content="black-translucent" />

 <!-- Home Screen Title -->
 <title>Google and time</title>
 <meta name="apple-mobile-web-app-title" content="Google and Time">


 <meta name="viewport" content="initial-scale=1.0, user-scalable=no, minimal-ui">
 <meta name="mobile-web-app-capable" content="yes">

 <script type="text/javascript"src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCOgf60Bt5Zk7eIz-eApBBXlVEcEsuOg6M&sensor=true"></script>



</head>










<body onload="startTime()">

  <!-- Fixed navbar -->
  <div class="navbar navbar-default navbar-fixed-top" role="navigation">
    <div class="container">
      <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
          <span class="sr-only">Toggle navigation</span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="#">Mopub</a>
      </div>
      <div class="collapse navbar-collapse">
        <ul class="nav navbar-nav">
          <li class="active"><a href="#">Home</a></li>
          <li><a href="#search">Search</a></li>
          <li><a href="#addevent">Add Event</a></li>
          <li><a href="#update">Update Cal</a></li>
          <li><a href="#about">About</a></li>
        </ul>
      </div><!--/.nav-collapse -->
    </div>
  </div>



  <!--The Google Map -->
  <div id="map_canvas"> </div>


  <table>
    <tr>
      <td>Username</td>
      <td>Starttime</td>
      <td>Endtime</td>
      <td class="namn">Namn</td>
      <td>Location</td>
      <td>Longitude</td>
      <td>Latitude</td>




    </tr>

    <c:forEach items="${daylist}" var="event">
    <tr>
      <td><c:out value="${event.username}"/></td>
      <td><c:out value="${event.starttime}"/></td>
      <td><c:out value="${event.endtime}"/></td>
      <td><c:out value="${event.name}"/></td>
      <td><c:out value="${event.room}"/></td>
      <td><c:out value="${event.longitude}"/></td>
      <td><c:out value="${event.latitude}"/></td>

    </tr>
  </c:forEach>
</table>



<!--SEARCH PAGE-->
<div id="search">
  <div class="container">
    <div class="row">

     <h2>Search Room</h2>
     <h3> Här lägger vi funktion för att söka på salar</h3>
     <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin malesuada sollicitudin mauris sit amet auctor. Pellentesque sed tincidunt turpis. Sed a sapien vel nibh sollicitudin condimentum quis id magna. Nam eget sollicitudin massa. Nullam aliquet ullamcorper nisl, quis tempor augue lobortis id. Donec vel placerat nibh. Sed posuere sit amet enim vel scelerisque. Nunc ac elit pharetra nibh scelerisque vehicula et et libero. Vivamus ut lacus lectus. Donec convallis erat sed purus sodales aliquam. Ut non elit non felis volutpat rhoncus id et nunc. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Suspendisse eget tellus venenatis, adipiscing metus nec, pellentesque est.</p>
     <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin malesuada sollicitudin mauris sit amet auctor. Pellentesque sed tincidunt turpis. Sed a sapien vel nibh sollicitudin condimentum quis id magna. Nam eget sollicitudin massa. Nullam aliquet ullamcorper nisl, quis tempor augue lobortis id. Donec vel placerat nibh. Sed posuere sit amet enim vel scelerisque. Nunc ac elit pharetra nibh scelerisque vehicula et et libero. Vivamus ut lacus lectus. Donec convallis erat sed purus sodales aliquam. Ut non elit non felis volutpat rhoncus id et nunc. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Suspendisse eget tellus venenatis, adipiscing metus nec, pellentesque est.</p>
     <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin malesuada sollicitudin mauris sit amet auctor. Pellentesque sed tincidunt turpis. Sed a sapien vel nibh sollicitudin condimentum quis id magna. Nam eget sollicitudin massa. Nullam aliquet ullamcorper nisl, quis tempor augue lobortis id. Donec vel placerat nibh. Sed posuere sit amet enim vel scelerisque. Nunc ac elit pharetra nibh scelerisque vehicula et et libero. Vivamus ut lacus lectus. Donec convallis erat sed purus sodales aliquam. Ut non elit non felis volutpat rhoncus id et nunc. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Suspendisse eget tellus venenatis, adipiscing metus nec, pellentesque est.</p>
     <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin malesuada sollicitudin mauris sit amet auctor. Pellentesque sed tincidunt turpis. Sed a sapien vel nibh sollicitudin condimentum quis id magna. Nam eget sollicitudin massa. Nullam aliquet ullamcorper nisl, quis tempor augue lobortis id. Donec vel placerat nibh. Sed posuere sit amet enim vel scelerisque. Nunc ac elit pharetra nibh scelerisque vehicula et et libero. Vivamus ut lacus lectus. Donec convallis erat sed purus sodales aliquam. Ut non elit non felis volutpat rhoncus id et nunc. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Suspendisse eget tellus venenatis, adipiscing metus nec, pellentesque est.</p>


     <br/>
     <br/>

   </div>
 </div>
</div>

<!--ADD EVENT PAGE-->
<div id="addevent">
  <div class="container">
    <div class="row">

     <h2>Add event</h2>
     <h3> Här lägger vi funktion för att lägga till event</h3>
     <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin malesuada sollicitudin mauris sit amet auctor. Pellentesque sed tincidunt turpis. Sed a sapien vel nibh sollicitudin condimentum quis id magna. Nam eget sollicitudin massa. Nullam aliquet ullamcorper nisl, quis tempor augue lobortis id. Donec vel placerat nibh. Sed posuere sit amet enim vel scelerisque. Nunc ac elit pharetra nibh scelerisque vehicula et et libero. Vivamus ut lacus lectus. Donec convallis erat sed purus sodales aliquam. Ut non elit non felis volutpat rhoncus id et nunc. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Suspendisse eget tellus venenatis, adipiscing metus nec, pellentesque est.</p>
     <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin malesuada sollicitudin mauris sit amet auctor. Pellentesque sed tincidunt turpis. Sed a sapien vel nibh sollicitudin condimentum quis id magna. Nam eget sollicitudin massa. Nullam aliquet ullamcorper nisl, quis tempor augue lobortis id. Donec vel placerat nibh. Sed posuere sit amet enim vel scelerisque. Nunc ac elit pharetra nibh scelerisque vehicula et et libero. Vivamus ut lacus lectus. Donec convallis erat sed purus sodales aliquam. Ut non elit non felis volutpat rhoncus id et nunc. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Suspendisse eget tellus venenatis, adipiscing metus nec, pellentesque est.</p>
     <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin malesuada sollicitudin mauris sit amet auctor. Pellentesque sed tincidunt turpis. Sed a sapien vel nibh sollicitudin condimentum quis id magna. Nam eget sollicitudin massa. Nullam aliquet ullamcorper nisl, quis tempor augue lobortis id. Donec vel placerat nibh. Sed posuere sit amet enim vel scelerisque. Nunc ac elit pharetra nibh scelerisque vehicula et et libero. Vivamus ut lacus lectus. Donec convallis erat sed purus sodales aliquam. Ut non elit non felis volutpat rhoncus id et nunc. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Suspendisse eget tellus venenatis, adipiscing metus nec, pellentesque est.</p>
     <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin malesuada sollicitudin mauris sit amet auctor. Pellentesque sed tincidunt turpis. Sed a sapien vel nibh sollicitudin condimentum quis id magna. Nam eget sollicitudin massa. Nullam aliquet ullamcorper nisl, quis tempor augue lobortis id. Donec vel placerat nibh. Sed posuere sit amet enim vel scelerisque. Nunc ac elit pharetra nibh scelerisque vehicula et et libero. Vivamus ut lacus lectus. Donec convallis erat sed purus sodales aliquam. Ut non elit non felis volutpat rhoncus id et nunc. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Suspendisse eget tellus venenatis, adipiscing metus nec, pellentesque est.</p>

   </div>
 </div>
</div>

<!--UPDATEE CAL PAGE-->
<div id="update">
  <div class="container">
    <div class="row">

     <h2>Uppdatera</h2>
     <h3> Här lägger vi funktion för att uppdatera sin länk</h3>

     <h3>Url to ics-file:</h3>
     <form action="/intprog_project/EventController" method="POST">
      <input type="hidden" name="action" value="addUrl">
      <input type="text" name="url" value=""><br>
      <input type="submit" value="Submit">
    </form>

  </div>
</div>
</div>




<div id="about">
  <div class="container">
    <div class="row">

      <!--ABOUT PAGE-->
      <h2>About</h2>
      <h3> Här lägger vi  information om projektet</h3>
      <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin malesuada sollicitudin mauris sit amet auctor. Pellentesque sed tincidunt turpis. Sed a sapien vel nibh sollicitudin condimentum quis id magna. Nam eget sollicitudin massa. Nullam aliquet ullamcorper nisl, quis tempor augue lobortis id. Donec vel placerat nibh. Sed posuere sit amet enim vel scelerisque. Nunc ac elit pharetra nibh scelerisque vehicula et et libero. Vivamus ut lacus lectus. Donec convallis erat sed purus sodales aliquam. Ut non elit non felis volutpat rhoncus id et nunc. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Suspendisse eget tellus venenatis, adipiscing metus nec, pellentesque est.</p>
      <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin malesuada sollicitudin mauris sit amet auctor. Pellentesque sed tincidunt turpis. Sed a sapien vel nibh sollicitudin condimentum quis id magna. Nam eget sollicitudin massa. Nullam aliquet ullamcorper nisl, quis tempor augue lobortis id. Donec vel placerat nibh. Sed posuere sit amet enim vel scelerisque. Nunc ac elit pharetra nibh scelerisque vehicula et et libero. Vivamus ut lacus lectus. Donec convallis erat sed purus sodales aliquam. Ut non elit non felis volutpat rhoncus id et nunc. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Suspendisse eget tellus venenatis, adipiscing metus nec, pellentesque est.</p>
      <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin malesuada sollicitudin mauris sit amet auctor. Pellentesque sed tincidunt turpis. Sed a sapien vel nibh sollicitudin condimentum quis id magna. Nam eget sollicitudin massa. Nullam aliquet ullamcorper nisl, quis tempor augue lobortis id. Donec vel placerat nibh. Sed posuere sit amet enim vel scelerisque. Nunc ac elit pharetra nibh scelerisque vehicula et et libero. Vivamus ut lacus lectus. Donec convallis erat sed purus sodales aliquam. Ut non elit non felis volutpat rhoncus id et nunc. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Suspendisse eget tellus venenatis, adipiscing metus nec, pellentesque est.</p>
      <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin malesuada sollicitudin mauris sit amet auctor. Pellentesque sed tincidunt turpis. Sed a sapien vel nibh sollicitudin condimentum quis id magna. Nam eget sollicitudin massa. Nullam aliquet ullamcorper nisl, quis tempor augue lobortis id. Donec vel placerat nibh. Sed posuere sit amet enim vel scelerisque. Nunc ac elit pharetra nibh scelerisque vehicula et et libero. Vivamus ut lacus lectus. Donec convallis erat sed purus sodales aliquam. Ut non elit non felis volutpat rhoncus id et nunc. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Suspendisse eget tellus venenatis, adipiscing metus nec, pellentesque est.</p>


    </div>
  </div>
</div>






<!--PAGE FOOTER/MENUBAR-->
<div id="footer">
  <div class="container">
   <button onclick="Route()" class="btn btn-primary btn-lg center-block">Route</button>
   <div id="todaytime"> </div>
   <div id="duration">Durarion: - </div>
   <div id="total">Total:</div>
 </div>
</div>


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.9.1/jquery-ui.js"></script>
<script src="js/bootstrap.min.js"></script>


<!--Script that prevents drag function on mobile safari-->
<script>
  $('#footer').on('touchmove', function(event) {
    event.preventDefault();
  });
</script>

<!--Script that collapses navbar after any link is clicked-->
<script>
  $(document).on('click','.navbar-collapse.in',function(e) {
    if( $(e.target).is('a') ) {
      $(this).collapse('hide');
    }
  });
</script>


<!-- GOOGLE MAPS -->
<script>
  var list = new Array();
  var timeNow = startTime();
  
  
  //schemaList är en array med bönor av varje event, som jag skapade upp i en controller.

  <c:forEach items="${daylist}" var="event" varStatus="status">
    var eventEnd ="${event.endtime}";
    var eventEnd = eventEnd.split(" ");
    var eventEnd = eventEnd[1];
  
    var eventStart ="${event.starttime}";
    var eventStart = eventStart.split(" ");
    var eventStart = eventStart[1];
  
    //Evert:if-satsen här krockar med Tommys grej att när en dag är slut så laddas nästa dagars events in. Men då är ju tiden den dagen "senare" än nästa dags events.
  
    /*if (eventEnd > timeNow) {
      eventObject = new Object();
      eventObject.name = "${event.name}";
      eventObject.description = "${event.description}"; 
      eventObject.starttime = eventStart; 
      eventObject.endtime = eventEnd;
      eventObject.room = "${event.room}";
      eventObject.latitude="${event.latitude}";
      eventObject.longitude="${event.longitude}";
      list.push(eventObject);
    }*/
      
      eventObject = new Object();
      eventObject.name = "${event.name}";
      eventObject.description = "${event.description}"; 
      eventObject.starttime = eventStart; 
      eventObject.endtime = eventEnd;
      eventObject.room = "${event.room}";
      eventObject.latitude="${event.latitude}";
      eventObject.longitude="${event.longitude}";
      list.push(eventObject);
  </c:forEach>



  var markers = new Array();
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
      
      var location = new google.maps.LatLng(list[i].latitude,list[i].longitude);

      var marker = new google.maps.Marker({
        position: location,
        map: map,
        draggable: true, //not needed
        title: list[i].name
      });


      var etime = list[i].endtime;
      marker.setMap(map);
      var markObject = new Object();
      markObject.marker = marker;
      markObject.etime = etime;
      markers.push(markObject);


      if(i==0){ //första marker sätts till att hoppa
        marker.setAnimation(google.maps.Animation.BOUNCE);
      }

      var content = infoWindowContent(list[i]);
      var infowindow = new google.maps.InfoWindow()
      google.maps.event.addListener(marker,'click', (function(marker,content,infowindow){ 
        return function() {
          infowindow.setContent(content);
          infowindow.open(map,marker);
       };
      })(marker,content,infowindow)); 
    }

    //Evert: Hur är den är While-slingan till respektive marker?
    var counter = 0; 
    while(markers.length!=counter){ //while loopen körs lika många gånger som det finns markers
      setTime(counter); //en timeout sätts för alla markers
      counter++;
    } 
    //Evert: Vad är now för något?
    function setTime(count){
      var markEndTime = markers[count].etime;
      var end = convertTime(markEndTime); //Tiden konverteras till millisekunder
      var timeTemp = convertTime(now);
      timeLeft = end-timeTemp; //Tiden som är kvar tills markern ska försvinna
      setTimeout(callDelete,timeLeft); //Jag försökte att anropa deleteMarker direkt här, men det fungerade inte. 
                        //Därav funktionen callDelete
      function callDelete(){
        deleteMarker(markEndTime);  
      }
    }
  }







  function deleteMarker(time) { 
    for(var i = 0; i < markers.length; i++){ 
      if(markers[i].etime==time){
        var marker = markers[i].marker;
        marker.setMap(null); //Marker tas bort från kartan
        
        if((markers.length-1)!=i){
          markers[i+1].marker.setAnimation(google.maps.Animation.BOUNCE); //Nästa marker hoppar
        }
      }
    }
  }
    




  function convertTime(t){ //Konverterar tiden till millisekunder
    var hour = Number(t.split(':')[0]);
    var min = (hour*60+(Number(t.split(':')[1])))*60;
    var convertedTime=(min+Number(t.split(':')[2]))*1000;
    return convertedTime;
  }





  function infoWindowContent(event){
    var contentString = '<div id="content">'+ '<h4>'+event.name+'</h4>'+
    '<p><b>'+ event.starttime + '<br>'+event.endtime +'<br></b>'+event.description+'</p></div>';
    return contentString;
  }
  





  function Route() {
    
    geoLocation(function(startpos) {
    
      var start = startpos;
      var end = null;
      
      for (var i = 0; i < list.length; i++) {

        if(timeNow < list[i].endtime){
          var end = new google.maps.LatLng(list[i].latitude,list[i].longitude);
          
          break;
        }
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
    currentdate=new Date();
    var h=currentdate.getHours();
    var m=currentdate.getMinutes();
    var s=currentdate.getSeconds();
    m = checkTime(m);
    s = checkTime(s);
    var timeNow = h+":"+m+":"+s;
    document.getElementById('todaytime').innerHTML = timeNow;
    var ts = setTimeout(function(){startTime()},500);
    return timeNow;
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

        if(callback && typeof(callback) === "function"){
          callback(navigator);

        }


      });

    }
  }
</script>


</body>
</html>



