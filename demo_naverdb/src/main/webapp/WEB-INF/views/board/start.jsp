<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="resources/js/jquery-3.7.1.min.js"></script>
	<script>
		$(document).ready(function () {
			$('.login').on('click', function(e) {
				if(<%=session.getAttribute("sessionid")%> == null){
					e.preventDefault();
					alert("로그인 하세요.");
				}
			});
		});
	</script>
</head>
<body>
	<h1>로그인 정보 = <%=session.getAttribute("sessionid")%> </h1><br>
	<h1> 나의 게시판 화면입니다. </h1>
	<h2> 메뉴는 다음과 같습니다. </h2>
	<ul>
		<li><a href='boardlist'>게시물 리스트 보러가기</a></li>
		<li><a class="login" href='boardwrite'>글쓰러가기</a></li>
		<li><a href='boardlogin'>로그인하기</a></li>
		<li><a href='boardlogout'>로그아웃하기</a></li>
	</ul>
</body>
</html>