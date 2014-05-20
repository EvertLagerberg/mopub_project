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

  function convertTime(t){ //Konverterar tiden till millisekunder
    var hour = Number(t.split(':')[0]);
    var min = (hour*60+(Number(t.split(':')[1])))*60;
    var convertedTime=(min+Number(t.split(':')[2]))*1000;
    return convertedTime;
  }