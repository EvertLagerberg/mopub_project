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



<body>

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
          <li><a href="#search"  id="update">Search</a></li>
          <li><a href="#addevent">Add Event</a></li>
          <li><a href="#update"><span class="glyphicon glyphicon-cog"></span> Update Cal</a></li>
          <li><a href="#about"><span class="glyphicon glyphicon-heart"></span> About</a></li>
          <li><a href="//localhost:8888/phpserver/login.php?logout=yes"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
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






<!--SEARCH PAGE-->
<div id="search">
  <div class="container">
    <div class="row page">

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
    <div class="row page">

   <div id="nextevent_Starttime"> </div >

   </div>
 </div>
</div>

<!--UPDATEE CAL PAGE-->
<div id="update">
  <div class="container">
    <div class="row page">

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
    <div class="row page">

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
  var timeNow = startTime();
  
  //schemaList är en array med bönor av varje event, som jag skapade upp i en controller.

  /*<c:forEach items="${daylist}" var="event" varStatus="status">
    var eventEnd ="${event.endtime}";
    var eventEndList = eventEnd.split(" ");
    var eventEndtime = eventEndList[1];
    var eventEnddate = eventEndList[0];
  
    var eventStart ="${event.starttime}";
    var eventStartList = eventStart.split(" ");
    var eventStarttime = eventStartList[1];
    var eventStartdate = eventStartList[0];
  
    //Evert:if-satsen här krockar med Tommys grej att när en dag är slut så laddas nästa dagars events in. Men då är ju tiden den dagen "senare" än nästa dags events.
  
    if (eventEnd > timeNow) {
      eventObject = new Object();
      eventObject.name = "${event.name}";
      eventObject.description = "${event.description}"; 
      eventObject.starttime = eventStart; 
      eventObject.endtime = eventEnd;
      eventObject.room = "${event.room}";
      eventObject.latitude="${event.latitude}";
      eventObject.longitude="${event.longitude}";
      list.push(eventObject);
    }
      
      eventObject = new Object();
      eventObject.name = "${event.name}";
      eventObject.description = "${event.description}"; 

      eventObject.startdate = eventStartdate; 
      eventObject.enddate = eventEnddate;

      eventObject.starttime = eventStarttime; 
      eventObject.endtime = eventEndtime;
      eventObject.room = "${event.room}";
      eventObject.latitude="${event.latitude}";
      eventObject.longitude="${event.longitude}";
      list.push(eventObject);
  </c:forEach>*/



      eventObject = new Object();
      eventObject.name = "Övrigt - Mobilutveckling med webbteknologier (DM2518)";
      eventObject.description = "${event.description}"; 
      eventObject.starttime ="19:00:00"; 
      eventObject.endtime = "22:00:00";
      eventObject.room = "Q1";
      eventObject.latitude=59.35015106201172;
      eventObject.longitude=18.06719970703125;
      eventObject.altroom = "";
      list.push(eventObject);

      eventObject = new Object();
      eventObject.name = "Övrigt - Mobilutveckling med webbteknologier (DM2518)";
      eventObject.description = "${event.description}"; 
      eventObject.starttime ="19:00:00"; 
      eventObject.endtime = "22:00:00";
      eventObject.room = "F1";
      eventObject.latitude=59.34811019897461;
      eventObject.longitude=18.06534767150879;
      eventObject.altroom = "E35,E32,"
      list.push(eventObject);

      eventObject = new Object();
      eventObject.name = "Övrigt - Mobilutveckling med webbteknologier (DM2518)";
      eventObject.description = "${event.description}"; 
      eventObject.starttime ="19:00:00"; 
      eventObject.endtime = "22:00:00";
      eventObject.room = "Saknas";
      eventObject.latitude=59.347330625522105;
      eventObject.longitude=18.07062953710556;
      eventObject.altroom="";
      list.push(eventObject);





  



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
     url: "Marker-Symbols/saknasred.png", // url
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


      var etime = list[i].endtime;
      marker.setMap(map);
      var markObject = new Object();
      markObject.marker = marker;
      markObject.etime = etime;
      markers.push(markObject);


     if(i==0){ //första marker sätts till att hoppa
        marker.setAnimation(google.maps.Animation.BOUNCE);
        nextEvent(list[i]);


      }
      else{
      console.log("inne i elsen");
      var num = i;
      num = parseInt(num);
      numBefore = num - 1;
      markerTimeBefore = markers[numBefore].eTime; //Plockar ut förra markerns sluttid
      if(startTime<markerTimeBefore){ //om starttime är innan sluttiden
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
	//start();
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
  
  /*function start(){
	  var isUser = <c:out value="${isUser}"/>;
	   	if(isUser){
	   		//console.log("hej2")
	   		$('#update').trigger('click');
	   		}
  }*/
    

  google.maps.event.addDomListener(window,'load',initialize);
  google.maps.event.addDomListener(window,'load',geoLocation);

 
</script>


</body>
</html>



