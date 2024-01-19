<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="/js/jquery-3.7.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#ajaxbtn').on('click', function() {
			$.ajax({
				url : "helloajax",
				type : "get",
				dataType : "json",
				success : function(server){
					$('#ajaxresult').html(server.model);
				}
			});
		});
	});
</script>
</head>
<body>
	<h1>helloboot.jsp</h1>
	
	<img src="/media/images/html5.jpg"><br>
	
	<input type="button" value="ajax 요청 버튼" id="ajaxbtn"><br>
	ajax 결과 출력 : <h1 id="ajaxresult"></h1>
</body>
</html>