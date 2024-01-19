<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="moviereserve">
		아이디 <input type="text" name="id"><br>
		암호 <input type="password" name="pw"><br>
		나이 <input type="number" name="age"><br>
		영화 목록<br>
		<c:forEach items="${moviemap }" varStatus="vs">
			${vs.current.key } : ${vs.current.value.age }
			<input type="checkbox" name="movielist" value="${vs.current.key }">
			<br>
		</c:forEach>
		<input type="submit" value="영화신청">
	</form>
</body>
</html>