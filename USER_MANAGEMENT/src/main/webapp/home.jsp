<%@page import="java.util.List"%>
<%@page import="com.org.dto.User"%>
<%@page import="com.org.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	<%@ include file="css/innernav.css" %>
	h1 {
		text-align: center;
	}
	tr:nth-child(odd) {
		background-color: aqua;
	}
	td{
		padding: 5px 120px 5px 137px ;
		color: black;
	}
</style>
</head>
<body>
	<% 
	User sessionUser = (User)session.getAttribute("user"); 
	if(sessionUser == null){
		response.sendRedirect("index.jsp");
	}else{%>
	<%@include file="components/innernav.jsp" %>
	<%} %>
	<h1>Hey <%=sessionUser.getName() %> Welcome to User Management</h1><br><br>
	
	<%String msg = (String)session.getAttribute("delete"); 
	  if(msg != null){ %>
	  	<p><%=msg %></p>
	<% 
		session.removeAttribute("delete");
	  }
	%>
	
	<table style="border: 0px;">
		<tr>
			<td>Name</td>
			<td>Age</td>
			<td>Email</td>
			<td>Mobile</td>
			<td>  Make change </td>
		</tr>
		
		<%	UserDao dao = new UserDao();
			List<User> lu = dao.fetchAllUsers();
			
			for(User u : lu){
				
				if(sessionUser.getId() == u.getId()){
					continue;
				}%>
				<tr>
					<td><%u.getName(); %></td>
					<td><%u.getAge(); %></td>
					<td><%u.getEmail(); %></td>
					<td><%u.getMobile(); %></td>
					<td> <a href="#"> <button>Update</button></a> <a href="delete?uid=<%u.getId();%>"><button>Delete</button></a> </td>
				</tr>
			<%}
			
		%>
	</table>
	
	
	
</body>
</html>