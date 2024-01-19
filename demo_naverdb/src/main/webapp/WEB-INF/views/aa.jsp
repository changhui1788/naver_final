<%@page import="org.springframework.web.servlet.ModelAndView"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>aa.jsp</h1>
	<h3><%=(String) request.getAttribute("model") %></h3>
	<h3>${model}</h3>
</body>
</html>