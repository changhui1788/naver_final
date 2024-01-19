<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script src="js/jquery-3.7.1.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$('.verification').on('click', function(e) {
				let id = '<%=session.getAttribute("sessionid")%>';
				if(id == "null"){
					e.preventDefault();
					alert("로그인 하세요.");
				} else if(id != '${board.writer}') {
					e.preventDefault();
					alert("작성자만 수정이나 삭제가 가능합니다.");
				} else {
					let pw = prompt('암호를 입력하세요');
					if(pw != '${board.pw}'){
						e.preventDefault();
						alert("잘못된 암호입니다.");
					} else {
						let form = $('<form></form>');
						if($(this).attr('id') == 'update'){
							form.attr('action', 'updateform');
						} else {
							form.attr('action', 'boarddelete');
						}
					   	form.attr('method', 'post');
					    form.append($('<input />', { type: 'hidden', name: 'seq', value: '${board.seq }' }));
					    form.appendTo('body');
					    form.submit();
					}
				}
			});
		});
	</script>
</head>
<body>
	<h1>제목 : ${board.title }</h1>
	<h3>작성자 : ${board.writer }</h3>
	<h3>작성일자 : ${board.writingtime }</h3>
	<hr>
	<h4>${board.contents }</h4>
	
	<button class="verification" id="update">수정</button>
	<button class="verification" id="delete">삭제</button><br>
</body>
</html>