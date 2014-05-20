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
  

   </div>
  



   <div class="col-xs-3">
         <button onclick="Route(null,null)" class="btn btn-primary btn-md center-block" id="route">Route</button>

</div>
   <div class="col-xs-1">


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
      eventObject.name = "Lektion 1";
      eventObject.description = "${event.description}"; 

      eventObject.startdate = "2014-05-20"; 
      eventObject.enddate = "2014-05-20";

      eventObject.starttime ="12:00:00"; 
      eventObject.endtime = "13:00:00";
      eventObject.room = "Q1";
      eventObject.latitude=59.34811019897461;
      eventObject.longitude=18.074687957763672;
      list.push(eventObject);






      eventObject = new Object();
      eventObject.name = "Lektion 2";
      eventObject.description = "${event.description}"; 

      eventObject.startdate = "2014-05-20"; 
      eventObject.enddate = "2014-05-20";

      eventObject.starttime ="14:00:00"; 
      eventObject.endtime = "17:00:00";
      eventObject.room = "Q1";
      eventObject.latitude=59.3536376953125;
      eventObject.longitude=18.06534767150879;
      list.push(eventObject);

            eventObject = new Object();
      eventObject.name = "Lektion 3";
      eventObject.description = "${event.description}"; 

      eventObject.startdate = "2014-05-20"; 
      eventObject.enddate = "2014-05-20";

      eventObject.starttime ="14:00:00"; 
      eventObject.endtime = "17:00:00";
      eventObject.room = "E1";
      eventObject.latitude=59.34691619873047;
      eventObject.longitude=18.073184967041016;
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



    var icon = {
     url: "Marker-Symbols/marker.png", // url
     scaledSize: new google.maps.Size(65, 62) // size
      };


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
        document.getElementById('nextevent_Room').innerHTML = "Next event: in " + "<span class='badge'>"+list[i].room+"</span>";
        
          var deadline = Date.parse("2014-05-20 02:32:00"/*list[i].startdate + " " + list[i].starttime*/);
        $('#nextevent_Starttime').countdown({until: deadline, onExpiry: countUp, compact: true, format: 'HMS',
    layout: 'starts in {hnn}{sep}{mnn}{sep}{snn}'});

        function countUp(){
          console.log(deadline)
          $('#nextevent_Room').countdown({since: deadline, compact: true, format: 'HMS',
    layout: 'starts in {hnn}{sep}{mnn}{sep}{snn}'});
        }


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
      var timeTemp = convertTime(timeNow);
      timeLeft = end-timeTemp; //Tiden som är kvar tills markern ska försvinna
      setTimeout(callDelete,timeLeft); //Jag försökte att anropa deleteMarker direkt här, men det fungerade inte. 
                        //Därav funktionen callDelete
      function callDelete(){
        deleteMarker(markEndTime);  
      }
    }
    function eventOverlap(marker){
    marker.setAnimation(google.maps.Animation.BOUNCE);
    console.log("inne") 
    //Jag tog bort delen som satte animationen till null om man klickade på markern.
    }
  }







  function deleteMarker(time) { 
    for(var i = 0; i < markers.length; i++){ 
      if(markers[i].etime==time){
        var marker = markers[i].marker;
        marker.setMap(null); //Marker tas bort från kartan
        
        if((markers.length-1)!=i){
          markers[i+1].marker.setAnimation(google.maps.Animation.BOUNCE); //Nästa marker hoppar
        document.getElementById('nextevent_Room').innerHTML = "Next event: in " + "<span class='badge'>"+list[i+1].room+"</span>";
       var deadline = Date.parse(list[i+1].startdate + " " + list[i+1].starttime);
        $('#nextevent_Starttime').countdown({until: deadline, compact: true, format: 'HMS',
    layout: 'starts in {hnn}{sep}{mnn}{sep}{snn}'});
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
    '<p><b>'+ event.starttime + '<br>'+event.endtime +'</p></div><br><button onclick="Route('+event.latitude +',' + event.longitude +')" class="btn btn-primary btn-md center-block" id="route">Route</button>';
    return contentString;
  }
  





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
  
  google.maps.event.addDomListener(window,'load',initialize);
  google.maps.event.addDomListener(window,'load',geoLocation);





  //// time and date for the device
  function startTime() {
	start();
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
	  var isUser = <c:out value="${isUser}"/>;
	   	if(isUser){
	   		//console.log("hej2")
	   		$('#update').trigger('click');
	   		}
  }
    


  function geoLocation(callback) {

    // Try HTML5 geolocation
    if(navigator.geolocation) {
      navigator.geolocation.getCurrentPosition(function(position) {
        var navigator = new google.maps.LatLng(position.coords.latitude,position.coords.longitude);
      
        /*var alienMarker = {
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
        });*/


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
</script>


</body>
</html>



