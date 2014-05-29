function nextEvent(event){



	document.getElementById('nextevent_Room').innerHTML = "Next event: in " + "<span class='badge'>"+event.room+"</span>";
	document.getElementById('nextevent_Date').innerHTML = 'starts on <span class="badge">'+event.startdate+'</span>';
	document.getElementById('nextevent_Starttime').innerHTML = 'Starts at ' + event.starttime; 

	

}




function infoWindowContent(event){

	if(event.room === "Saknas" && event.altroom ==""){

		var contentString = '<div id="content">'+
		'<h4>'+event.name+'</h4>'+
		'<p><b>'+ event.starttime + ' - '+event.endtime +'</p>'+
		'</div>'+
		'<p>Location is missing.</p>'; 

	} else if(event.room === "Saknas" && event.altroom !=""){
		var contentString = '<div id="content">'+
		'<h4>'+event.name+'</h4>'+
		'<p><b>'+ event.starttime + ' - '+event.endtime +'</p>'+
		'<p>' +event.altroom+' Coordinates for the location couldn\'t be found!</p>'+
		'</div>'; 

	}
	else if(event.altroom !=""){

		console.log(event.altroom);
		var contentString = '<div id="content">'+
		'<h4>'+event.name+'</h4>'+
		'<p><span class="badge">'+event.room+'</span> '+event.altroom+'</p>'+
		'<p><b>'+ event.starttime + ' - '+event.endtime +'</p>'+
		'</div>'+
		'<br>'+
		'<button type="button" onclick="Route('+event.latitude +',' + event.longitude +')"'+
		'class="btn btn-primary btn-sm center-block" id="route">Route Here</button>';







	}



	else {



		var contentString = '<div id="content">'+
		'<h4>'+event.name+'</h4>'+
		'<p><span class="badge">'+event.room+'</span></p>'+
		'<p><b>'+ event.starttime + ' - '+event.endtime +'</p>'+
		'</div>'+
		'<br>'+
		'<button type="button" onclick="Route('+event.latitude +',' + event.longitude +')"'+
		'class="btn btn-primary btn-sm center-block" id="route">Route Here</button>';
	}
	return contentString;
}



function deleteMarker(time) {
	console.log("deleteMarker");
	for(var i = 0; i < markers.length; i++){ 
		if(markers[i].eDate == myDate){
			if(markers[i].eTime==time){
				var marker = markers[i].marker;
				console.log("setMapNull");
				marker.setMap(null); //Marker tas bort från kartan

				if((markers.length-1)!=i){
					markers[i+1].marker.setAnimation(google.maps.Animation.BOUNCE); //Nästa marker hoppar
					nextEvent(list[i+1]);
				}
				else{
					window.alert("There are no more events today, to see your next events refresh your browser.");
				}
			}
		}
	}
}



function eventOverlap(marker){
	console.log("overlap");

	var icon = {
			url: "Marker-Symbols/orangeexclamation.png", // url
			scaledSize: new google.maps.Size(65, 62) // size
	};

	marker.setIcon(icon);
}



