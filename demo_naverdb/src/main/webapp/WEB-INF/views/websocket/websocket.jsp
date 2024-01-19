<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="/js/jquery-3.7.1.min.js"></script>
</head>
<body>
	별명 : <input type="text" id="nickname" value="${param.id }">
	<input type="button" id="enterbtn" value="입장">
	<input type="button" id="exitbtn" value="퇴장"><br>
	<h1>채팅</h1>
	<div id="chatmessagearea" style="background-color: pink; border: 2px solid black;"></div>
	전송 메시지 <input type="text" id="message">
	<input type="button" id="sendbtn" value="메시지 전송">
	
	<script type="text/javascript">
		$('#enterbtn').on('click', function() {
			websocket = new WebSocket("ws://localhost:9070/ws");
			websocket.onopen = function(){console.log("웝소켓 연결 성공");}
			websocket.onclose = function(){console.log("웝소켓 해제 성공");}
			websocket.onmessage = function(event){
				let data = event.data;
				$('#chatmessagearea').append(data + "<br>");
				console.log("웝소켓서버로부터 수신성공");
				
			}
		});
		
		$('#exitbtn').on('click', function() {
			websocket.close();
		});
		
		$('#sendbtn').on('click', function() {
			if($('#message').val() == ""){}
			else{
				let msg = $('#nickname').val() + " : " + $('#message').val();
				websocket.send(msg);
				$('#message').val("");
			}
		});
	</script>
</body>
</html>