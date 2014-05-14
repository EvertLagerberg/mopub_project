<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Map</title>
<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
	<meta name="mobile-web-app-capable" content="yes">
	<style type="text/css">
	#map_canvas{
		width: 600px;
		height: 400px;
	}
	#content { 
  		width: 200px; 
  		height: 100px; 
	} 
    </style>
    <script type="text/javascript"src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCOgf60Bt5Zk7eIz-eApBBXlVEcEsuOg6M&sensor=true"></script>

</head>
<body>
    <div id="map_canvas"> </div>
	<div id="todaytime"> </div>
	<div id="current"> <button onclick="Route()"> Route </button></div>
	<div id="duration"> </div>
	<div id="total"> </div> 
	<input id="time" type="text" value=""><input type="submit" value="Submit" onclick="deleteMarker();">  
	<script type="text/javascript">
	var list = new Array();
	//schemaList är en array med bönor av varje event, som jag skapade upp i en controller.
  	var timeNow = startTime();
	<c:forEach items="${schemaList}" var="event" varStatus="status">
		var eventEnd ="${event.endtime}";
		var eventEnd = eventEnd.split(" ");
		var eventEnd = eventEnd[1];
		
		var eventStart ="${event.starttime}";
		var eventStart = eventStart.split(" ");
		var eventStart = eventStart[1];

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
    			mapTypeId:google.maps.MapTypeId.SATELLITE
    	};
	    map = new google.maps.Map(document.getElementById('map_canvas'), properties);
	    directionsDisplay.setMap(map);
		directionsDisplay.setPanel(document.getElementById('directionsPanel'));

	  google.maps.event.addListener(directionsDisplay, 'directions_changed', function() {
	    computeTotalDistance(directionsDisplay.directions);
	  });
	  
   
	  
	  for (var i = 0; i < list.length; i++) { 
		  var location = new google.maps.LatLng(list[i].longitude,list[i].latitude);
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
		  	
		  if(i==0){
			  marker.setAnimation(google.maps.Animation.BOUNCE);
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
	 
    }
    
    function deleteMarker() {
    	var time = document.getElementById('time').value;
    	for(var i = 0; i < markers.length; i++){
    		if(markers[i].etime==time){
    			var marker = markers[i].marker;
    	   		marker.setMap(null);
    	   		if((markers.length-1)!=i){
    	   			markers[i+1].marker.setAnimation(google.maps.Animation.BOUNCE);
    	   		} 
    	   		
    		}
    		
    	}
    }
    
    
    
	  function infoWindowContent(event){
		  var contentString = '<div id="content">'+ '<h4>'+event.name+'</h4>'+
	      '<p><b>'+ event.starttime + '<br>'+event.endtime +'<br></b>'+event.description+'</p></div>';
          return contentString;
      }
    
	  
	  
	function Route() {
		var start = new google.maps.LatLng(list[0].longitude,list[0].latitude);
		var end = new google.maps.LatLng(list[1].longitude,list[1].latitude);
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
			currentdate=new Date();
		    var h=currentdate.getHours();
		    var m=currentdate.getMinutes();
		    var s=currentdate.getSeconds();
		    m = checkTime(m);
		    s = checkTime(s);
		   	var timeNow = h+":"+m+":"+s;
		    document.getElementById('todaytime').innerHTML = timeNow;
		    //var t = setTimeout(function(){startTime()},500);
		    return timeNow;
		}
		function checkTime(i) {
			if (i<10) {i = "0" + i};  // adds zeros in front of numbers < 10
		    return i;
		}
    
   </script>
  </body>
</html>
