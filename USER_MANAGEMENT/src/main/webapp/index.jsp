<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="components/bootstrapcss.jsp" %>
<style type="text/css">
	<%@ include file="css/style.css" %>
</style>
</head>
<body>
	<%@ include file="components/navbar.jsp" %>
	
	<div id="container">
	<%String msg = (String)session.getAttribute("failed"); 
	  if(msg != null){ %>
	  	<p><%=msg %></p>
	<% 
		session.removeAttribute("failed");
	  }
	%>
	<form action="login" method="post">
		<label for="email">Enter Email:</label><br>
		<input type="text" name="email" id="email"><br><br>
		
		<label for="password">Enter Password:</label><br>
		<input type="password" name="password" id="password"><br><br>
		
		<input type="submit" value="login" id="login">

	</form>
	</div>
</body>
</html>