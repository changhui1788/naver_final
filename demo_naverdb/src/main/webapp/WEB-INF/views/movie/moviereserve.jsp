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
	<h3>${loginDTO.id } 회원님 ${loginDTO.age} 살입니다.</h3>
	<h3>시청 가능 영화 목록</h3>
		<c:forEach items="${moviemap }" varStatus="vs">
			${vs.current.key } : ${vs.current.value.age }
			영상 : <video src="resources/media/multimedia/chrome.mp4" controls width=600 height="400"
					 poster="resources/media/multimedia/chrome.jpg"></video>
			<br>
		</c:forEach>
</body>
</html>