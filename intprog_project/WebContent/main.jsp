<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<html>

<head>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="main.css"/>
<title>Result</title>
</head>
<body>
<p>Välkommen hit!NU <c:out value="${Username}"/></p>





<h3>Välj en grupp</h3>
<form action="/intprog_project/GroupController">
<input type="hidden" name="action" value="setGroup">
Dina Grupper: <select name="group">
<c:forEach items="${grouplist}" var="group">
<option value ="${group.ID}">${group.name}</option>
</c:forEach>
</select><br>

<input type="submit" value="Utför">
</form>




<button onclick="window.location.href='/intprog_project/addGroup.jsp'" type="button">Skapa ny grupp</button> 
<br/>


<h2>
<c:if test="${session_groupID != null}">


<c:forEach items="${grouplist}" var="group">


<c:if test="${session_groupID == group.ID}">
<c:out value="${group.name}"/>
</c:if>


</c:forEach>



</c:if>
</h2>


<button type="button">Visa Schema</button> 
<button onclick="window.location.href='/intprog_project/addUser.jsp'" type="button">Lägg till användare</button>



<form action="schema">
<input type="submit" value="Visa Gruppschema">
</form>
<br/>

<table>
<tr>
<td>Username</td>
<td>Weekday</td>
<td>Starttime</td>
<td>Endtime</td>
<td class="namn">Namn</td>
<td>Location</td>



</tr>

<c:forEach items="${eventlist}" var="event">
<tr>
<td><c:out value="${event.username}"/></td>
<td><c:out value="${event.weekday}"/></td>
<td><c:out value="${event.starttime}"/></td>
<td><c:out value="${event.endtime}"/></td>
<td><c:out value="${event.name}"/></td>
<td><c:out value="${event.location}"/></td>

</tr>
</c:forEach>
</table>









</body>
</html>