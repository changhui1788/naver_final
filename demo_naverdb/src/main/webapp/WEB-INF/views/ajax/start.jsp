<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="resources/js/jquery-3.7.1.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			$('#ajaxbtn1').click(function(){
				var params = {
						"memberid" : $('#memberid').val(),
						"pw" : $('#pw').val()
				}
				
				$.ajax({
					type : "get",
					url : "ajaxlogin",
					data : params,
					dataType : "json",
					success : function(response) {
						//alert(JSON.stringify(response));
						if(response.loginresult == "로그인 성공"){
							$('#result').css('color', 'green');
						} else {
							$('#result').css('color', 'red');
						}
						$('#result').html("<h3>" + response.loginresult + "</h3>");
					},
					error : function(request, e) {
						alert("코드 : " + request.status + " 메시지 : " + request.responseText + " 오류" + e);
					}
				});
			});
			
			$('#ajaxbtn2').click(function(){
				var params = {
						"memberid" : $('#memberid').val(),
						"pw" : $('#pw').val()
				}
				
				$.ajax({
					type : "post",
					url : "ajaxmypage",
					data : params,
					dataType : "json",
					success : function(response) {
						//alert(JSON.stringify(response));
						if(response.membername == null){
							$('#result').html("<h3>회원 정보가 없습니다.</h3>");
							$('#result').css('color', 'red');
						} else {
							$('#result').html("<h3>" + response.memberid + "</h3>");
							$('#result').append("<h3>" + response.membername + "</h3>");
							$('#result').append("<h3>" + response.phone + "</h3>");
							$('#result').append("<h3>" + response.email + "</h3>");
							$('#result').append("<h3>" + response.regdate + "</h3>");
							$('#result').css('color', 'blue');
						}
					},
					error : function(request, e) {
						alert("코드 : " + request.status + " 메시지 : " + request.responseText + " 오류" + e);
					},
				});
			});
			
			$('#ajaxbtn3').click(function(){
				var params = {
						"memberid" : $('#memberid').val(),
						"pw" : $('#pw').val()
				}
				
				$.ajax({
					type : "post",
					url : "ajaxlist",
					data : params,
					dataType : "json",
					success : function(response) {			
							$('#result').html("<hr>");
						for (let i = 0; i < response.length; i++) {
							$('#result').append("<div id='member" + i + "'>");
							$("#member"+ i).append("<h3><a href=''>" + response[i].memberid + "</a></h3>");
							$("#member"+ i).append("<h3>" + response[i].membername + "</h3>");
							$("#member"+ i).append("<h3>" + response[i].phone + "</h3>");
							$("#member"+ i).append("<h3>" + response[i].email + "</h3>");
							$("#member"+ i).append("<h3>" + response[i].regdate + "</h3>");
							$('#result').append("</div>");
							$('#result').append("<hr>");
						}
						$('#result').css('color', 'blue');
						
					},
					error : function(request, e) {
						alert("코드 : " + request.status + " 메시지 : " + request.responseText + " 오류" + e);
					},
				});
			});
			
			$('#result').on('click', 'a', function(e) {
				e.preventDefault();
				
				$.ajax({
					type : "post",
					url : "ajaxgetpw/" + $(this).text(),
					dataType : "json",
					success : function(response) {
						$('#result').html("<h3> 암호 : "+ response.pw +"</h3>")
					},
					error : function(request, e) {
						alert("코드 : " + request.status + " 메시지 : " + request.responseText + " 오류" + e);
					},
				});
				
			});
			
			$('#ajaxbtn4').click(function(){
				
				let memberid = $('#memberid').val();
				if(memberid == ""){
					memberid = "empty";
				}
				
				$.ajax({
					type : "post",
					url : "ajaxgetpw/" + memberid,
					dataType : "json",
					success : function(response) {
						$('#result').html("<h3> 암호 : "+ response.pw +"</h3>")
					},
					error : function(request, e) {
						alert("코드 : " + request.status + " 메시지 : " + request.responseText + " 오류" + e);
					},
				});
			});
			
			$('#uploadbtn').click(function(e){
				e.preventDefault();
				
				let data = new FormData($('#uploadform').get(0));
				
				$.ajax({
					type : "post",
					url : "ajaxupload",
					data : data,
					encType : "multipart/form-data",
					processData : false,
					contentType : false,
					dataType : "json",
					success : function(response) {
						$('#uploadresult').html("<h3> 파일저장 결과 : "+ response.uploadresult +"</h3>")
					},
					error : function(request, e) {
						alert("코드 : " + request.status + " 메시지 : " + request.responseText + " 오류" + e);
					},
				});
			});
			
			
		});
	</script>
</head>
<body>
	<form action="nonajaxlogin">
		아이디 <input type="text" name="memberid" id="memberid"><br>
		암호 <input type="password" name="pw" id="pw"><br>
		<input type="submit" value="nonajax로그인"><br>
		<input type="button" id="ajaxbtn1" value="ajax로그인1"><br>
		<input type="button" id="ajaxbtn2" value="ajax로그인2"><br>
		<input type="button" id="ajaxbtn3" value="ajax로그인 전체 회원 조회"><br>
		<input type="button" id="ajaxbtn4" value="ajax암호"><br>
	</form>
	
	<div id="result"></div>
	
	<h1>ajax 파일 업로드</h1>
	<form id="uploadform">
		파일선택 : <input type="file" name="uploadfile"><br>
		<input type="button" id="uploadbtn" value="파일업로드"><br>
	</form>
	<br>
	<div id="uploadresult"></div>
</body>
</html>