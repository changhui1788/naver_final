<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>글 수정</h1>
	<form action="boardupdate" method="post">
		<input type="hidden" name="seq" value="${board.seq }">
		제목 <input type="text" name="title" maxlength="100" value="${board.title }"><br>
		내용 <textarea rows="10" cols="50" name="contents" maxlength="4000">${board.contents}</textarea><br>
		<input type="submit" value="저장"><br>
	</form>
</body>
</html>