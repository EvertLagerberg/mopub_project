<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<html>

<head>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<title>Login</title>
</head>

<body>



<form action="upload" method="POST" enctype="multipart/form-data" >
Användarnamn: 
<input type=text name=username size=20 

<c:if test="${Username != null}">
   value=${Username}
</c:if>

/>
<p><input type=submit value="login"/></p>
</form>
<form action="userForm.jsp"> 
<p><input type=submit value="Skapa ny anvädare"/></p>
</form>
</body>
</html>