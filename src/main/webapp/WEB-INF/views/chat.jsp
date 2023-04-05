<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<script src="http://code.jquery.com/jquery-latest.js"></script>


<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 채팅 보이는 부분 -->
            <div class="card-body">
           		<div class="container">
					<table class="table table-bordered" >		
						<tr style="border:none;">
							<td colspan="2" style="border:none;"><div id="chatList"></div></td>
						</tr>		
					</table>
				</div>	
        	</div>	
          </div>
          
 <!-- 내용입력, 연결/종료 버튼 -->
          <div class="card" style="height : 130px; margin-top:0;">
          		<input type="text" name="msg" id="msg" placeholder="대화 내용을 입력하세요." class="form-control" disabled>
          		<button type="button" class="btn btn-default" id="btnConnect">연결</button>
				<button type="button" class="btn btn-default" id="btnDisconnect" disabled>종료</button>
          		
          </div>
<!-- 채팅 스크립트 -->
          <script>
				let userId = '${userInfo.userId }'; //학번
				let userName = '${userInfo.userName}';//이름

				let USER = userName + "(" + userId + ")";//이름 + 학번

				//let url = "ws://146.56.165.103:8080/chatserver"; //채팅 서버 146.56.165.103
				let url="ws://localhost:8080/chatserver";
				//웹 소켓
				let ws;
				

				//연결 버튼 클릭 시	
				$('#btnConnect').click(function() {

					// 연결
					ws = new WebSocket(url);
	
					// 소켓 이벤트 매핑
					// 웹 소켓 연결이 될때(소켓 만들자 마자 메세지 전송하면 실패하기 쉬워서 연결이 되었는지 onopen으로 확인하고 메세지 전송 시작)
					ws.onopen = function(evt) {
	
						//1. 내 채팅 창에 접속했음을 알림
						printMe(USER, '님이 입장했습니다.');
	
						//2. 다른 사람 채팅 창에 내가 접속했음을 알림
						ws.send('1#' + USER + '#');//처음 접속해서 send하면 ws.onmessage가 받아서 처리
	
						//print(userName+"("+userId+")", '님이 입장했습니다.');// 입장할 때 유저명+"입장했습니다" 출력
	
						// 현재 사용자가 입장했다고 서버에게 통지(유저명 전달)
						// -> 1#유저명
	
						//속성
						$('#btnConnect').attr('disabled', true);
						$('#btnDisconnect').attr('disabled', false);
						$('#msg').attr('disabled', false);
						$('#msg').focus();
						
					};

					//send하면 얘가 받아서 처리
					ws.onmessage = function(evt) {
						
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
						
						$('#chatTable').scrollTop($('#chatTable').prop('scrollHeight'));
						
					};

					//소켓이 닫힐 때
					ws.onclose = function(evt) {
						console.log('소켓이 닫힙니다.');
					};
	
					//소켓 에러 날 때
					ws.onerror = function(evt) {
						console.log(evt.data);
					};

				});

		
				// 접속했을 때 내 채팅방에 보일 메세지
				function printMe(user, txt) {
					let temp = '';
					temp += '<div align="center" style="margin-bottom:3px;">';
					temp += '[' + user + '] ';
					temp += txt;
					temp += ' <span style="font-size:11px;color:#777;"> </span>';
					temp += '</div>';
		
					$('#chatList').append(temp);//채팅창에 추가
					$('#chatTable').scrollTop($('#chatTable').prop('scrollHeight'));
				}

				//메세지 전송할 때 내 채팅방에 보일 메세지
				function printMe2(user, txt) {
					let temp = '';
		
					temp += '<div align="right" style=" margin-bottom:3px; word-break:break-all;">';
					temp += ' <span style="font-size:11px;color:#777;">'
							+ new Date().toLocaleTimeString() + '</span>';
					temp += " " + txt;
					temp += '</div>';
		
					$('#chatList').append(temp);//채팅창에 추가
					$('#chatTable').scrollTop($('#chatTable').prop('scrollHeight'));
				}

				//메세지 전송할 때 다른 클라이언트 한테 보일 메세지
				function print(user, txt) {
					let temp = '';
					temp += '<div style=" margin-bottom:3px; word-break:break-all;">';
					temp += '[' + user + '] : ';
					temp += txt;
					temp += ' <span style="font-size:11px;color:#777;">'
							+ new Date().toLocaleTimeString() + '</span>';
					temp += '</div>';
		
					$('#chatList').append(temp);//채팅창에 추가
					$('#chatTable').scrollTop($('#chatTable').prop('scrollHeight'));
				}

				// 클라이언트가 접속했다는 것을 다른 클라이언트에 알림		
				function print2(user) {
					let temp = '';
					temp += '<div align="center" style="margin-bottom:3px;">';
					temp += "[" + user + "] 님이 입장했습니다.";
					temp += ' <span style="font-size:11px;color:#777;"> </span>';
					temp += '</div>';
		
					$('#chatList').append(temp);
					$('#chatTable').scrollTop($('#chatTable').prop('scrollHeight'));
				}

				// client 접속 종료
				function print3(user) {
					let temp = '';
					temp += '<div style="margin-bottom:3px;">';
					temp += "'" + user + "' 이(가) 종료했습니다.";
					temp += ' <span style="font-size:11px;color:#777;">'
							+ new Date().toLocaleTimeString() + '</span>';
					temp += '</div>';
		
					$('#chatList').append(temp);
					$('#chatTable').scrollTop($('#chatTable').prop('scrollHeight'));
				}

				//보낼 메세지 입력하고 엔터치면 메세지 전송
				$('#msg').keydown(function() {
					if (event.keyCode == 13) {
		
						//서버에게 메시지 전달
						//2#유저명#메시지
		
						ws.send('2#' + USER + '#' + $(this).val()); //다른 클라이언트에 메세지 전송
						printMe2(USER, $(this).val()); //본인 대화창에 메세지 출력
		
						$('#msg').val('');
						$('#msg').focus();
						
						
					}
				});

				$('#btnDisconnect').click(function() {
					ws.send('3#' + userName + "(" + userId + ")" + '#');
					ws.close();
		
					$('#user').attr('readonly', false);
					$('#user').val('');
		
					$('#btnConnect').attr('disabled', false);
					$('#btnDisconnect').attr('disabled', true);
		
					$('#msg').val('');
					$('#msg').attr('disabled', true);
				});
			</script>
			<!-- 채팅 스크립트 끝 -->
</body>
</html>