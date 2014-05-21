<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>




<!DOCTYPE html>
<html>
<head>
 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

 <!-- Bootstrap core CSS -->
 <link href="css/bootstrap.min.css" rel="stylesheet">

 <!-- Countdown css -->
 <link rel="stylesheet" type="text/css" href="css/jquery.countdown.css">

  <!-- icons css -->
 <link rel="stylesheet" type="text/css" href="css/map-icons.css">


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


 <script type="text/javascript"src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCOgf60Bt5Zk7eIz-eApBBXlVEcEsuOg6M&sensor=true"></script>





</head>

<body onload="start()">


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

          <li class="active"><a id="map" href="#">Home</a></li>
          <li><a id="Update" href="#update"><span class="glyphicon glyphicon-cog"></span>Add Cal</a></li>
          <li><a href="#about"><span class="glyphicon glyphicon-heart"></span>About</a></li>
          <li><a href="//localhost:8888/phpserver/login.php?logout=yes"><span class="glyphicon glyphicon-log-out"></span>Logout</a></li>

        </ul>
      </div><!--/.nav-collapse -->
    </div>
  </div>



  <!--The Google Map -->
  <div id="map_canvas"> </div>

  <!--PAGE FOOTER/MENUBAR-->
<div id="footer">
  <div class="container">
  <div class="row" id="routebar">
  <div class="text-center">
  <p><b>Chosen route:</b>
  <span id="total" class="small">-- </span>
  <span id="duration" class="small">--</span>
  </p>
  </div>
  </div>
<div class="row toolbar">
    
<div class="col-xs-8">

   
   <div id="nextevent_Room" class="small"> </div>
   <div id="nextevent_Date" class="small"> </div>
   <div id="nextevent_Starttime" class="small"> </div >
   <div id="nextevent_Late" class="small"> </div >
  

   </div>
  



   <div class="col-xs-3">
         <button onclick="Route(null,null)" class="btn btn-primary btn-md center-block" id="route">Route</button>

</div>
   <div class="col-xs-1">


</div>
   

  
  </div>
  </div>
  </div>




<!--ADD CAL PAGE-->
<div id="update">
  <div class="container theme-showcase">
  <div class="page">
    <div class="jumbotron">

     <h2>Add calendar</h2>
     <p>Enter the URL to your KTH schedule here. Once you have entered your URL , your scheduled events will appear on the map. To update your schedule, just enter the link again.</p>

     <form role="form" action="/intprog_project/EventController" method="POST">
      <input type="hidden" name="action" value="addUrl">
      <label for="URL">Schedule URL:</label>
      <input type="url" class="form-control" id="URL" name="url" value="">
      <button type="submit" class="btn btn-primary btn-lg center-block" value="Submit" id="submit">Submit</button>
    </form>

  </div>
  </div>
</div>
</div>




  





<!--ABOUT PAGE-->
<div id="about">
  <div class="container">
    <div class="page">

      
      
  <h2 id="history" class="page-header">About</h2>
      
  <p class="lead">This web app was made as a project in the course  Mobile development with web technologies (DM2518) Kungliga Tekniska Högskolan,KTH</p>

  <div class="well well-sm">
  <p>The idea of the site is to use the <a href="https://www.kth.se/social/">KTH Social</a> schedule service to easily find the location for every event and quickly get a quick overview of all the events for a day of lectures, seminars and labs at KTH Campus.</p>

  <p>After exporting your KTH Schedule into this web page, you will be able to see all the events of your schoolday. You can see the exact location for each event, and load a route on how to get there from your current location.</p>
  
  <p>Today the service is limited to KTH , but it could easily expand to other organizations as well</p>

  <br/>
  <p> Team: Tommy Roshult, Kristina Högberg och Evert Lagerberg.</p>
  </div>
  
     
        


    </div>
  </div>
</div>


  


  
  













 



  

</div>
</div>


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.9.1/jquery-ui.js"></script>
<script src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/jquery.plugin.js"></script> 
<script type="text/javascript" src="js/jquery.countdown.js"></script>
<script type="text/javascript" src="js/date.js"></script>
<script type="text/javascript" src="js/map-icons.js"></script>


    <!--Javascript functions for events-->
<script type="text/javascript" src="js/event.js"></script>

 <!--Javascript functions for route-->
<script type="text/javascript" src="js/route.js"></script>
 <!--Javascript functions for time-->
<script type="text/javascript" src="js/time.js"></script>


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
  var routeON = false;
  var list = new Array();
  var counter = 1;
  var timeNow = "08:00:00";
  
  //schemaList är en array med bönor av varje event, som jag skapade upp i en controller.

  <c:forEach items="${daylist}" var="event" varStatus="status">
    var eventEnd ="${event.endtime}";
    var eventEndList = eventEnd.split(" ");
    var eventEndtime = eventEndList[1];
    var eventEnddate = eventEndList[0];
  
    var eventStart ="${event.starttime}";
    var eventStartList = eventStart.split(" ");
    var eventStarttime = eventStartList[1];
    var eventStartdate = eventStartList[0];

      
      eventObject = new Object();
      eventObject.name = "${event.name}";
      

      eventObject.startdate = eventStartdate; 
      eventObject.enddate = eventEnddate;

      eventObject.starttime = eventStarttime; 
      eventObject.endtime = eventEndtime;
      eventObject.room = "${event.room}";
      eventObject.latitude="${event.latitude}";
      eventObject.longitude="${event.longitude}";

      eventObject.altroom="${event.altroom}";

      list.push(eventObject);
  </c:forEach>





      /*eventObject = new Object();

      eventObject.name = "Övrigt - Mobilutveckling med webbteknologier (DM2518)";
      eventObject.description = "${event.description}"; 
      eventObject.starttime ="22:40:00"; 
      eventObject.endtime = "23:00:00";
      eventObject.room = "F1";
      eventObject.latitude=59.34811019897461;
      eventObject.longitude=18.06534767150879;
      eventObject.altroom = "E35,E32,";
      list.push(eventObject);


      eventObject = new Object();
      eventObject.name = "Övrigt - Mobilutveckling med webbteknologier (DM2518)";
      eventObject.description = "${event.description}"; 
      eventObject.starttime ="23:00:00"; 
      eventObject.endtime = "23:30:00";
      eventObject.room = "F1";
      eventObject.latitude=59.34811019897462;
      eventObject.longitude=18.06534767150873;
      eventObject.altroom = "E35,E32,";
      list.push(eventObject);




      eventObject = new Object();
      eventObject.name = "Övrigt - Mobilutveckling med webbteknologier (DM2518)";
      eventObject.description = "${event.description}"; 
      eventObject.starttime ="23:00:00"; 
      eventObject.endtime = "23:30:00";
      eventObject.room = "Q1";
      eventObject.latitude=59.35015106201172;
      eventObject.longitude=18.06719970703125;
      eventObject.altroom = "";
      list.push(eventObject);

      eventObject = new Object();
      eventObject.name = "Övrigt - Mobilutveckling med webbteknologier (DM2518)";
      eventObject.description = "${event.description}"; 
      eventObject.starttime ="23:30:00"; 
      eventObject.endtime = "23:59:00";
      eventObject.room = "Saknas";
      eventObject.latitude=59.347330625522105;
      eventObject.longitude=18.07062953710556;
      eventObject.altroom="";
      list.push(eventObject);*/

  //}

  var markers = new Array();
  var rendererOptions = { draggable: true}; // Not needed
  var directionsDisplay = new google.maps.DirectionsRenderer(rendererOptions);
  var directionsService = new google.maps.DirectionsService();
  var map;





  function initialize() {

    var properties = {
      center: new google.maps.LatLng(59.347353, 18.073558),
      zoom:15,
      mapTypeId:google.maps.MapTypeId.ROADMAP,
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


  if (list[i].room === "Saknas"){
    var icon = {
     url: "Marker-Symbols/redquestion.png", // url
     scaledSize: new google.maps.Size(65, 62) // size
    };




    } else {
    var icon = {
     url: "Marker-Symbols/marker.png", // url
     scaledSize: new google.maps.Size(65, 62) // size
      };

    }  


      var marker = new google.maps.Marker({
        icon: icon,
        position: location,
        map: map,
        draggable: true, //not needed
        title: list[i].name
      });


      var eTime = list[i].endtime;
      var eDate = list[i].eventStartdate;
      console.log(eDate);
      marker.setMap(map);
      var markObject = new Object();
      markObject.marker = marker;
      markObject.eTime = eTime;
      markObject.eDate = eDate;
      markers.push(markObject);
      var markerTimeNow = list[i].starttime;


     if(i==0){ //första marker sätts till att hoppa
        marker.setAnimation(google.maps.Animation.BOUNCE);
        nextEvent(list[i]);
      }
      else{
      var num = i;
      num = parseInt(num);
      numBefore = num - 1;
      markerTimeBefore = markers[numBefore].eTime; //Plockar ut förra markerns sluttid
      if(markerTimeNow<markerTimeBefore){ //om starttime är innan sluttiden
    	  eventOverlap(marker); //båda markers sätts till att hoppa
    	  var m = markers[numBefore].marker; 
    	  eventOverlap(m);
    	  }
          
        }

      var content = infoWindowContent(list[i]);
      var infowindow = new google.maps.InfoWindow();
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

  }











  //// time and date for the device
  function startTime() {
    currentdate=new Date();
    var h=currentdate.getHours();
    var m=currentdate.getMinutes();
    var s=currentdate.getSeconds();
    m = checkTime(m);
    s = checkTime(s);
    
    var timeNow = h+":"+m+":"+s;
    //document.getElementById('todaytime').innerHTML = timeNow;
    var ts = setTimeout(function(){startTime()},500);
    return timeNow;
    }

  function checkTime(i) {
      if (i<10) {i = "0" + i};  // adds zeros in front of numbers < 10
      return i;
    }

  function start(){

	  startTime();
	  var isUser = <c:out value="${isUser}"/>
	  var existUser = <c:out value="${existUser}"/>;
	  	if(!existUser){
	  		window.location.href = "http://localhost:8888/phpserver/login.php"
	  	}
	  	else{
	   	if(!isUser){
	   	 	window.location.href = $('#Update').attr('href');
	   		}
	   	else{
	   		window.location.href = $('#map').attr('href');
	   	}

	  	}
  }



  google.maps.event.addDomListener(window,'load',initialize);
  google.maps.event.addDomListener(window,'load',geoLocation);


</script>


</body>
</html>



