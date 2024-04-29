<%@page import="com.org.dto.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<% User user = (User)session.getAttribute("user"); 
	if(user == null){
		response.sendRedirect("index.jsp");
	}else{%>
		<h2>
		Name : <%user.getName(); %> <br>
		Age : <%user.getAge(); %> <br>
		Email : <%user.getEmail(); %> <br>
		Mobile : <%user.getMobile(); %> <br>
		</h2>
	<%} %>
</body>
</html>