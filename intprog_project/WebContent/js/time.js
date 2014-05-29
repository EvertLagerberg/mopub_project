      function setTime(count){
      console.log("SetTime");
      var markEndTime = markers[count].eTime;
      var end = convertTime(markEndTime); //Tiden konverteras till millisekunder
      var timeTemp = convertTime(timeNow);
      timeLeft = end-timeTemp; //Tiden som ??r kvar tills markern ska f??rsvinna
      setTimeout(callDelete,timeLeft); //Jag f??rs??kte att anropa deleteMarker direkt h??r, men det fungerade inte. 
                        //D??rav funktionen callDelete
      function callDelete(){
        console.log("callDelete");
        deleteMarker(markEndTime);  
      }
    }


  function convertTime(t){ //Konverterar tiden till millisekunder
    var hour = Number(t.split(':')[0]);
    var min = (hour*60+(Number(t.split(':')[1])))*60;
    var convertedTime=(min+Number(t.split(':')[2]))*1000;
    return convertedTime;
  }