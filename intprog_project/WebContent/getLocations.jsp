<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Lägg in Geolocations</title>
</head>
<body>


<c:if test="${session_groupID != null}">
   value=${session_groupID}
</c:if>
<p><c:out value="${message}"/></p>
<form action="/intprog_project/LocationController" >
<input type=text name=username size=20 />
<p><input type=submit value="Ladda in locationionen"/></p>
</form>



<table>
<tr>
<td>Room</td>
<td>Longitude</td>
<td>Latitude</td>
</tr>

<c:forEach items="${locationlist}" var="location">
<tr>
<td><c:out value="${location.room}"/></td>
<td><c:out value="${location.longitude}"/></td>
<td><c:out value="${location.latitude}"/></td>


</tr>
</c:forEach>
</table>











</body>
</html>