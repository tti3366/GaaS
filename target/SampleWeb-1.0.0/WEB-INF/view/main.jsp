<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<style>
.container {
	width: 500px;
}

#list {
	height: 300px;
	padding: 15px;
	overflow: auto;
}

</style>

<script src="http://code.jquery.com/jquery-latest.js"></script>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
학번을 통해 소속학과 출력<br>
학번을 통해 동아리 있는지 출력<br>
동아리 있으면 동아리 출력<br><br>
학번을 substring해서 나온값을 학과 프로퍼티파일에서 찾아서 출력-->일일히 비교해서 하기엔 귀찮다<br>
소속 동아리,권한에 따라 다르게 동작할 수 있도록<br>
웹 소켓을 이용해서 채팅기능 구현<br><br>

학번 : ${userInfo.userId }<br>
비밀번호 : ${userInfo.userPw }<br>
이름 : ${userInfo.userName }<br>
이메일 : ${userInfo.userEmail }<br>
전화번호 : ${userInfo.userPhoneNumber }<br>
가입한 동아리 :

<c:forEach var="cc" items="${club}">
${cc }
</c:forEach>

<div class="container">
	<h1 class="page-header">Chat</h1>		
	
	<table class="table table-bordered">
		<tr>
			
			 
			<td><input type="text" name="user" id="user" class="form-control" placeholder="유저명"></td>
			
			
			<td>
				<button type="button" class="btn btn-default" id="btnConnect">연결</button>
				<button type="button" class="btn btn-default" id="btnDisconnect" disabled>종료</button>
			</td>
		</tr>
		<tr>
			<td colspan="2"><div id="list"></div></td>
		</tr>
		<tr>
			<td colspan="2"><input type="text" name="msg" id="msg" placeholder="대화 내용을 입력하세요." class="form-control" disabled></td>
		</tr>
	</table>
	
</div>


<script>
let userId='${userInfo.userId }'; //학번
let userName='${userInfo.userName}';//이름

let USER=userName+"("+userId+")";//이름 + 학번

let url = "ws://localhost:8080/swExample/chatserver"; //채팅 서버
	
//웹 소켓
let ws;
//연결하기

//연결 버튼 클릭 시	
$('#btnConnect').click(function() {
	
	// 연결
   	ws = new WebSocket(url);
   			
   	// 소켓 이벤트 매핑
   	// 웹 소켓 연결이 될때(소켓 만들자 마자 메세지 전송하면 실패하기 쉬워서 연결이 되었는지 onopen으로 확인하고 메세지 전송 시작)
   	ws.onopen = function (evt) {
   		
   		//1. 내 채팅 창에 접속했음을 알림
   		printMe(USER,'님이 입장했습니다.');
   		
   		//2. 다른 사람 채팅 창에 내가 접속했음을 알림
   		ws.send('1#' + USER + '#');//처음 접속해서 send하면 ws.onmessage가 받아서 처리

   		//print(userName+"("+userId+")", '님이 입장했습니다.');// 입장할 때 유저명+"입장했습니다" 출력
   				
   		// 현재 사용자가 입장했다고 서버에게 통지(유저명 전달)
   		// -> 1#유저명
		
		
		//속성
		$('#user').attr('readonly', true);
		$('#btnConnect').attr('disabled', true);
		$('#btnDisconnect').attr('disabled', false);
		$('#msg').attr('disabled', false);
		$('#msg').focus();
	};
    
	
	//send하면 얘가 받아서 처리
	ws.onmessage = function (evt) {
		print('', evt.data+"abc");
		
		//evt.data--> 1#김가영(22371004)# (처음 접속할 때), 1#김가영(22371004)#메세지 (메세지 전송할때)
		let index = evt.data.indexOf("#", 2); // #을 2번 인덱스 부터 찾으면 맨끝의 #이 찾아짐
		
		let no = evt.data.substring(0, 1); //1
		
		let user = evt.data.substring(2, index);// 유저이름 뽑기
		
		let txt = evt.data.substring(index + 1);//전할 메세지
		
   				
		if (no == '1') {
			print2(user);//다른 클라이언트한테 내가 접속했음을 알림
		} else if (no == '2') {
			print(user, txt);//메세지 전송
		} else if (no == '3') {
			print3(user);//클라이언트 접속 해제 알림
		}
		
		$('#list').scrollTop($('#list').prop('scrollHeight'));
	};
   	
	//소켓이 닫힐 때
	ws.onclose = function (evt) {
		console.log('소켓이 닫힙니다.');
	};

	//소켓 에러 날 때
	ws.onerror = function (evt) {
		console.log(evt.data);
	};
	
});

//align="right" 
// 접속했을 때 내 채팅방에 보일 메세지
function printMe(user, txt) {
	let temp = '';
	temp += '<div align="center" style="margin-bottom:3px;">';
	temp += '[' + user + '] ';
	temp += txt;
	temp += ' <span style="font-size:11px;color:#777;"> </span>';
	temp += '</div>';
			
	$('#list').append(temp);//채팅창에 추가
}

//메세지 전송할 때 내 채팅방에 보일 메세지
function printMe2(user,txt){
	let temp = '';
	
	temp += '<div align="right" style="width:500px; margin-bottom:3px; word-break:break-all;">';
	temp += ' <span style="font-size:11px;color:#777;">' + new Date().toLocaleTimeString() + '</span>';
	temp += " "+txt;
	//temp += '[' + user + '] ';
	
	
	temp += '</div>';
			
	$('#list').append(temp);//채팅창에 추가
}

//메세지 전송할 때 다른 클라이언트 한테 보일 메세지
function print(user, txt) {
	let temp = '';
	temp += '<div style="width: 500px; margin-bottom:3px; word-break:break-all;">';
	temp += '[' + user + '] : ';
	temp += txt;
	temp += ' <span style="font-size:11px;color:#777;">' + new Date().toLocaleTimeString() + '</span>';
	temp += '</div>';
			
	$('#list').append(temp);//채팅창에 추가
}

// 클라이언트가 접속했다는 것을 다른 클라이언트에 알림		
function print2(user) {
	let temp = '';
	temp += '<div align="center" style="margin-bottom:3px;">';
	temp += "[" + user + "] 님이 입장했습니다." ;
	temp += ' <span style="font-size:11px;color:#777;"> </span>';
	temp += '</div>';
			
	$('#list').append(temp);
}

// client 접속 종료
function print3(user) {
	let temp = '';
	temp += '<div style="margin-bottom:3px;">';
	temp += "'" + user + "' 이(가) 종료했습니다." ;
	temp += ' <span style="font-size:11px;color:#777;">' + new Date().toLocaleTimeString() + '</span>';
	temp += '</div>';
			
	$('#list').append(temp);
}


//유저명 입력하고 엔터치면 웹 소켓 연결해서 통신할 수 있게
$('#user').keydown(function() {
	if (event.keyCode == 13) {
		$('#btnConnect').click();
	}
});
		
		
//보낼 메세지 입력하고 엔터치면 메세지 전송
$('#msg').keydown(function() {
	if (event.keyCode == 13) {
				
		//서버에게 메시지 전달
		//2#유저명#메시지
		
		ws.send('2#' +USER + '#' + $(this).val()); //다른 클라이언트에 메세지 전송
		printMe2(USER, $(this).val()); //본인 대화창에 메세지 출력
		
        $('#msg').val('');
		$('#msg').focus();
				
	}
});
		
$('#btnDisconnect').click(function() {
	ws.send('3#' + userName+"("+userId+")" + '#');
	ws.close();
			
	$('#user').attr('readonly', false);
    $('#user').val('');
			
	$('#btnConnect').attr('disabled', false);
	$('#btnDisconnect').attr('disabled', true);
			
	$('#msg').val('');
	$('#msg').attr('disabled', true);
});

</script>
</body>
</html>