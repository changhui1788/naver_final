<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="memberservice" method="post">
		아이디 <input type="text" name="memberid"><br>
		암호 <input type="password" name="pw"><br>
		이름 <input type="text" name="membername"><br>
		전화번호 <input type="tel" name="phone"><br>
		이메일 <input type="email" name="email"><br>
		가입일 <input type="datetime-local" name="regdate"><br>
		<input type="submit" value="회원가입">
	</form>
</body>
</html>