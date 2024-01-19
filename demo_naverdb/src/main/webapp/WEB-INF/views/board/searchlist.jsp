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
	<h1> 검색 목록 </h1>
	<table border="2px solid black">
		<caption>게시물</caption>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>조회수</th>
		</tr>
		<c:forEach items="${searchlist }" var="dto">
			<tr>
				<td>${dto.seq }</td>
				<td><a href="boarddetail?seq=${dto.seq}">${dto.title }</a></td>
				<td>${dto.writer }</td>
				<td>${dto.viewcount }</td>
			</tr>
		</c:forEach>
	</table>
	<br>
	<a href="boardlist"> 전체게시물리스트 보러가기</a>
</body>
</html>