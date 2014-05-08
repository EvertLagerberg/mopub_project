<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>






<!DOCTYPE html>
<html>
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta charset="ISO-8859-1">
<title>Upload</title>
</head>
<body>
<h3>Url to ics-file:</h3>
<form action="/intprog_project/EventController" method="POST">
<input type="hidden" name="action" value="addUrl">
<input type="text" name="url" value=""><br>
<input type="submit" value="Submit">
</form>
<%=request.getAttribute("schemaList")%>
</body>
</html>
