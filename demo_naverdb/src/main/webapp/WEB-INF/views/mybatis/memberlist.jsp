<%@page import="org.springframework.web.context.request.RequestScope"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<a href="registermember">회원가입</a>
	<a href="modifymember">내정보 수정</a>
	<a href="deletemember?memberid=${memberid}">회원탈퇴</a>
	<br><br>

	<form action="membersearchlist" method="post">
		<select name="item">
			<option value="membername">이름 검색</option>
			<option value="memberid">아이디 검색</option>
			<option value="phone">전화번호 검색</option>
			<option value="email">이메일 검색</option>
		</select> 검색어 : <input type="text" name="searchword"> <input
			type="submit" value="검색">
	</form>
	<hr>
	<!-- Controller 에서 글 추가하는게 편할듯 -->
	<c:choose>
		<c:when test="${fn:split(requestScope['javax.servlet.forward.request_uri'],'/')[1] eq 'memberlist'}">
			<h3>총 회원은 ${memberlist.size()} 명입니다.</h3>
			<h3>회원 목록</h3>
		</c:when>
		<c:when test="${fn:split(requestScope['javax.servlet.forward.request_uri'],'/')[1] eq 'membersearchlist'}">
			<h3>검색 회원은 ${memberlist.size()} 명입니다.</h3>
			<h3>검색 목록</h3>
		</c:when>
	</c:choose>
	<c:forEach items="${memberlist }" varStatus="vs">
		<h3>${vs.current.memberid }: ${vs.current.membername } :
			${vs.current.phone } : ${vs.current.email } : ${vs.current.regdate }</h3>
	</c:forEach>
</body>
</html>