<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>




<!DOCTYPE html>
<html>
  <head>
  	<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<title>Google and time</title>  
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
	<meta name="mobile-web-app-capable" content="yes">
	<style type="text/css">
	#map_canvas{
		width: 600px;
		height: 400px;
	}
    </style>
    <script type="text/javascript"src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCOgf60Bt5Zk7eIz-eApBBXlVEcEsuOg6M&sensor=true"></script>
  </head>
  <body onload="startTime()">
    <div id="map_canvas"> </div>
	<div id="time"> </div>
	<div id="current"> <button onclick="Route()"> Route </button></div>
	<div id="duration"> </div>
	<div id="total"> </div>
	<script type="text/javascript">
	var rendererOptions = { draggable: true}; // Not needed
	var directionsDisplay = new google.maps.DirectionsRenderer(rendererOptions);
	var directionsService = new google.maps.DirectionsService();
	var loc  = ["59.347", "18.073", "59.350", "18.069"]; // Change to array's with long and lat, for loop creates markers
    var map;
	
	function initialize() {
		var properties = {
			center: new google.maps.LatLng(59.347353, 18.073558),
			zoom:15,
			mapTypeId:google.maps.MapTypeId.SATELLITE
	};
	
	map = new google.maps.Map(document.getElementById('map_canvas'), properties);
	directionsDisplay.setMap(map);
	directionsDisplay.setPanel(document.getElementById('directionsPanel'));

  google.maps.event.addListener(directionsDisplay, 'directions_changed', function() {
    computeTotalDistance(directionsDisplay.directions);
  });
	

	var eMarker = new google.maps.Marker({
		position: new google.maps.LatLng(loc[0], loc[1]),
		position: map.getCenter(),
		title: 'E',
		map: map,
		draggable: true
	});
	
	var lMarker = new google.maps.Marker({
		position: new google.maps.LatLng(loc[2], loc[3]),
		map: map,
		title: 'L'
	});
	
	}
	
	function Route() {
	var start = new google.maps.LatLng(loc[0], loc[1]);
	var end = new google.maps.LatLng(loc[2], loc[3]);
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

   </script>
   
   
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

<c:forEach items="${eventlist}" var="event">
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
   
   
  </body>
</html>



