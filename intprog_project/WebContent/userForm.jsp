<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>




<html>

<head>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<title>Login</title>

<script type="text/javascript">
	function validation(){
	document.getElementById("nameError").innerHTML="";
	document.getElementById("mailError").innerHTML="";
	document.getElementById("fileError").innerHTML="";
	var name=document.forms["userForm"]["username"].value;
	var mail=document.forms["userForm"]["usermail"].value;
	var file=document.forms["userForm"]["userfile"].value;
	var valid = 1;
	if (name.length < 2)
	  {
	  document.getElementById("nameError").innerHTML="Fyll i ett användarnamn!";
	  valid = 0;
	  }
	if (mail.length < 2)
	  {
	  document.getElementById("mailError").innerHTML="Fyll i en mail!";
	  valid = 0;
	  }
	if (file==""){
		document.getElementById("fileError").innerHTML="Välj en fil!";
		 valid = 0;
	}
	if (valid == 0){
		return false;
	}
	}
</script>


</head>
<body>
<form name="userForm" action="upload" method="POST" enctype="multipart/form-data"
onsubmit="return validation()" >
<table>
<tr>
<td>
Användarnamn: 
</td>
<td>
<input type=text name=username size=20
<c:if test="${Username != null}">
   value=${Username}
</c:if>
>
</td>
<td id="nameError">
<p><c:out value="${message}"/></p>
</td>
</tr>
<tr>
<td>
E-mail:
</td>
<td>
<input type=text name=usermail size=20
<c:if test="${Usermail != null}">
   value=${Usermail}
</c:if>
>
</td>
<td id="mailError"></td>
</tr>
<tr>
<td>
Url:
</td>
<td>
<p><input type=text name=userurl size=30
<c:if test="${UserUrl != null}">
   value=${UserUrl}
</c:if>
>
</p>
</td>
<td id="urlError"></td>
</tr>
<tr>
<td>
Fil:
</td>
<td>
<p><input id="userfile" type="file" name="file" /></p>
</td>
<td id="fileError"></td>
</tr>
<tr>
<td>
<br/>
<p><input type=submit value="Skapa Användare"/></p>
</td>
</tr>
</table>
</form>
</body>
</html>