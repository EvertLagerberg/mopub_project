<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Geolocations</title>
</head>
<body>


<c:if test="${session_groupID != null}">
   value=${session_groupID}
</c:if>
<p><c:out value="${message}"/></p>
<form action="/intprog_project/LocationController" >
<p><input type=submit value="Ladda in locationdata"/></p>
</form>















</body>
</html>