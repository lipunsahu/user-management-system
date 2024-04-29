<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>register page</title>
<%@include file="components/bootstrapcss.jsp" %>
</head>
<body>
	<%@ include file="components/navbar.jsp" %>
	
	<%String msg = (String)session.getAttribute("success"); 
	  if(msg != null){ %>
	  	<p><%=msg %></p>
	<% 
		session.removeAttribute("success");
	  }
	%>
	
	<form action="register" method="post">
		<label for="name">Enter Name:</label><br>
		<input type="text" name="name" id="name"><br><br>
		
		<label for="age">Enter Age:</label><br>
		<input type="number" name="age" id="age"><br><br>
		
		<label for="email">Enter Email:</label><br>
		<input type="text" name="email" id="email"><br><br>
		
		<label for="password">Enter Password:</label><br>
		<input type="password" name="password" id="password"><br><br>
		
		<label for="mobile">Enter Mobile:</label><br>
		<input type="number" name="mobile" id="mobile"><br><br>
		
		<input type="submit" value="register">
		
	</form>
</body>
</html>