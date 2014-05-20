  function nextEvent(event){


        
        document.getElementById('nextevent_Room').innerHTML = "Next event: in " + "<span class='badge'>"+event.room+"</span>";
        
          var deadline = Date.parse(event.starttime);
          
        $('#nextevent_Starttime').countdown({until: deadline, onExpiry:countUp, expiryText: '<div class="over">has already started</div>', alwaysExpire: true, compact: true, format: 'HMS',
    layout: 'starts in {hnn}{sep}{mnn}{sep}{snn}'});



 
//Verkar inte funka att mappa till samma div som det över
  function countUp(){

    $('#nextevent_Late').countdown({since: deadline, compact: true, format: 'HMS',
    layout: '-{hnn}{sep}{mnn}{sep}{snn}'});

        }







  }




    function infoWindowContent(event){

    if(event.room === "Saknas"){

     var contentString = '<div id="content">'+
    '<h4>'+event.name+'</h4>'+
    '<p><b>'+ event.starttime + ' - '+event.endtime +'</p>'+
    '</div>'+
    '<p>Given location is invalid</p>'; 

    } else if(event.altroom !=""){

    console.log(event.altroom);
    var contentString = '<div id="content">'+
    '<h4>'+event.name+'</h4>'+
    '<p><span class="badge">'+event.room+'</span> '+event.altroom+'</p>'+
    '<p><b>'+ event.starttime + ' - '+event.endtime +'</p>'+
    '</div>'+
    '<br><div class="btn-group">'+
    '<button type="button" onclick="Route('+event.latitude +',' + event.longitude +')"'+
    'class="btn btn-primary btn-sm center-block" id="route">Route Here</button>'+
    '<button type="button" onclick="Route('+event.latitude +',' + event.longitude +')"'+
    'class="btn btn-success btn-sm center-block" id="choose">Choose</button>'+
    '</div';







    }








    else {



    var contentString = '<div id="content">'+
    '<h4>'+event.name+'</h4>'+
    '<p><span class="badge">'+event.room+'</span></p>'+
    '<p><b>'+ event.starttime + ' - '+event.endtime +'</p>'+
    '</div>'+
    '<br><div class="btn-group">'+
    '<button type="button" onclick="Route('+event.latitude +',' + event.longitude +')"'+
    'class="btn btn-primary btn-sm center-block" id="route">Route Here</button>'+
    '<button type="button" onclick="Route('+event.latitude +',' + event.longitude +')"'+
    'class="btn btn-success btn-sm center-block" id="choose">Choose</button>'+
    '</div';
    }
    return contentString;
  }



    function deleteMarker(time) {
      console.log("deleteMarker");
    for(var i = 0; i < markers.length; i++){ 
      if(markers[i].eTime==time){
        var marker = markers[i].marker;
        console.log("setMapNull");
        marker.setMap(null); //Marker tas bort från kartan
        
        if((markers.length-1)!=i){
          markers[i+1].marker.setAnimation(google.maps.Animation.BOUNCE); //Nästa marker hoppar
          nextEvent(list[i+1]);

        }
      }
    }
  }



    function eventOverlap(marker){
    console.log("overlap");

    var icon = {
     url: "Marker-Symbols/krockorange.png", // url
     scaledSize: new google.maps.Size(65, 62) // size
    };

    marker.setIcon(icon);


    //Jag tog bort delen som satte animationen till null om man klickade på markern.
    }



