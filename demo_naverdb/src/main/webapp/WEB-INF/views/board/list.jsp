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
	<h1> 검색 </h1>
	<form action="boardsearchlist">
		<select name="item">
			<option value="title">제목</option>
			<option value="contents">내용</option>
			<option value="writer">작성자</option>
			<option value="all">모두</option>
		</select>
		검색어 : <input name="word">
		<input type="submit" value="검색">
	</form>
	<hr>
	<h1> 게시물 목록 </h1>
	<table border="2px solid black">
		<caption>게시물</caption>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>조회수</th>
		</tr>
		<c:forEach items="${pagingboardlist }" var="dto">
			<tr>
				<td>${dto.seq }</td>
				<td><a href="boarddetail?seq=${dto.seq}">${dto.title }</a></td>
				<td>${dto.writer }</td>
				<td>${dto.viewcount }</td>
			</tr>
		</c:forEach>
	</table>
	<h4> 페이지 번호 </h4>
	<%
		int pagecount = (Integer) request.getAttribute("pagecount");
		int totalcount = (Integer) request.getAttribute("totalcount");
		int totalpage = 0;
		if(totalcount % pagecount == 0)
			totalpage = totalcount / pagecount;
		else
			totalpage = totalcount / pagecount + 1;
		
		for(int i = 0; i < totalpage; i++){
		%>
			<a href="boardlist?pagenum=<%=i + 1 %>"><%=i + 1 %></a>
		<%
		}
	%>
</body>
</html>