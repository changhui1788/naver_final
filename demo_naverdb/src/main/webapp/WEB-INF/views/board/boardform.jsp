<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="js/jquery-3.7.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#writerinformbtn').on('click', function(){
			$.ajax({
				type : "get",
				url : "getwriter/" + $('#writer').val(),
				//data : { memberid : $("#writer").val() },
				dataType : "json",
				success : function(response) {
					//alert(JSON.stringify(response));
					$('#writerinform').html("<h3> 이름 : " + response.membername + "</h3>");
					$('#writerinform').append("<h3> 휴대전화 : " + response.phone + "</h3>");
					$('#writerinform').append("<h3> 이메일 : " + response.email + "</h3>");
					$('#writerinform').append("<h3> 가입일 : " + response.regdate + "</h3>");
				},
				error : function(request, e) {
					alert("코드 : " + request.status + " 메시지 : " + request.responseText + " 오류" + e);
				}
			});
		});
	});
</script>
</head>
<body>
	<h1>글쓰기</h1>
	<form action="boardwrite" method="post">
		제목 <input type="text" name="title" maxlength="100"><br>
		내용 <textarea rows="10" cols="50" name="contents" maxlength="4000"></textarea><br>
		작성자 <input type="text" name="writer" id="writer" value="${sessionid}" readonly><br>
		글암호 <input type="password" name="pw"><br>
		<input type="submit" value="저장"><br>
		<input type="button" id="writerinformbtn" value="작성자 정보보기"><br>
	</form>
	
	<div id="writerinform"></div>
</body>
</html>