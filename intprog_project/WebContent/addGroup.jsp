<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<html>

<head>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<title>Login</title>

<link rel="stylesheet" href="anytime.5.0.1-1402250308.css" />
<script src="jquery-1.11.0.min.js"></script>
<script src="anytime.5.0.1-1402250308.js"></script>










</head>




<body>






<h1>VÄLKOMMEN!!</h1>
<p><c:out value="${test}"/></p>





<h3>Skapa en ny grupp</h3>
<form action="/intprog_project/GroupController">
<input type="hidden" name="action" value="addGroup">
Grupp namn<input type=text name=name size=20>

<style>
  #rangeDemoStart, #rangeDemoFinish {
    background-image:url("calendar.png");
    background-position:right center;
    background-repeat:no-repeat; }
  </style>
 
<h4>Projektets tidspann</h4>
Start: <input type="text" id="rangeDemoStart" name ="rangeStart" size="14" />
Finish: <input type="text" id="rangeDemoFinish" name="rangeEnd" size="14" disabled="disabled"/>
<input type="button" id="rangeDemoToday" value="today" />
<input type="button" id="rangeDemoClear" value="clear" />
<script>
  var oneDay = 24*60*60*1000;
  var rangeDemoFormat = "%e-%b-%Y";
  var rangeDemoConv = new AnyTime.Converter({format:rangeDemoFormat});
  $("#rangeDemoToday").click( function(e) {
      $("#rangeDemoStart").val(rangeDemoConv.format(new Date())).change(); } );
  $("#rangeDemoClear").click( function(e) {
      $("#rangeDemoStart").val("").change(); } );
  $("#rangeDemoStart").AnyTime_picker({format:rangeDemoFormat});
  $("#rangeDemoStart").change(
    function(e) {
      try {
        var fromDay = rangeDemoConv.parse($("#rangeDemoStart").val()).getTime();
        var dayLater = new Date(fromDay+oneDay);
        dayLater.setHours(0,0,0,0);
        var ninetyDaysLater = new Date(fromDay+(90*oneDay));
        ninetyDaysLater.setHours(23,59,59,999);
        $("#rangeDemoFinish").
          AnyTime_noPicker().
          removeAttr("disabled").
          val(rangeDemoConv.format(dayLater)).
          AnyTime_picker( {
            earliest: dayLater,
            format: rangeDemoFormat,
            latest: ninetyDaysLater
            } );
        }
      catch(e) {
        $("#rangeDemoFinish").val("").attr("disabled","disabled");
        }
      } );
</script>

<h4>Mellan vilka tider vill ni arbeta om dagarna?</h4>

Från: <input type="text" id="field2" name="starttime" value="08:00" /><br>
Till: <input type="text" id="field3" name="endtime" value="17:00" />


<script>
  AnyTime.picker( "field1",
    { format: "%W, %M %D in the Year %z %E", firstDOW: 1 } );
  $("#field2").AnyTime_picker(
    { format: "%H:%i", labelTitle: "Starttid",
      labelHour: "Timme", labelMinute: "Minut" } );
  $("#field3").AnyTime_picker(
		    { format: "%H:%i", labelTitle: "Starttid",
		      labelHour: "Timme", labelMinute: "Minut" } );
</script>

<h4>Vilka veckodagar vill ni jobba?</h4>
<input type="checkbox" name="weekday" value="Monday"/>Måndagar<br>
<input type="checkbox" name="weekday" value="Thuesday"/>Tisdagar<br>
<input type="checkbox" name="weekday" value="Wednesday"/>Onsdagar<br>
<input type="checkbox" name="weekday" value="Thursday"/>Torsdagar<br>
<input type="checkbox" name="weekday" value = "Friday"/>Fredagar<br>
<input type="checkbox" name="weekday" value="Saturday"/>Lördag<br>
<input type="checkbox" name="weekday" value = "Sunday"/>Söndag<br>

<input type="submit" value="Utför">
</form>


















</body>
</html>