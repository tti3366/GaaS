<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Signup</title>
</head>
<body>
회원가입 페이지<br>
아이디나 이메일 중복확인이 필요할듯


<!-- 스프링 폼 사용 -->
<form:form modelAttribute="signupTest" action="/swExample/signUpCheck" method="post">

    
    
	<label>학번 : <input type="text" id="userId" name="userId" value="${User.userId }" onchange="info()"/></label>
	<br>
	
	<label>비밀번호 : <input type="password" id="userPw" name="userPw" value="${User.userPw }" onchange="info()"/></label>
	<br>
	
	<label>이름 : <input type="text" id="userName" name="userName" value="${User.userName }" onchange="info()"/></label>
	<br>
	
	<label>이메일 : <input type="email" id="userEmail" name="userEmail" pattern="[a-zA-Z0-9]+[@][a-zA-Z0-9]+[.]+[a-zA-Z]+[.]*[a-zA-Z]*" size="40" value="${User.userEmail }" onchange="info()"/></label>
	<br>
	
	<label>전화번호 : <input type="text" id="userPhoneNumber" name="userPhoneNumber" placeholder="하이픈(-)을 제외하고 입력하세요" value="${User.userPhoneNumber }" onchange="info()"/></label>
	<br>
	<input type="submit" id="subBtn" value="가입" disabled/><br>
	<input type="button" id="btn" value="가입" onclick="location.href='/swExample/signUpCheck'" disabled /><br>
</form:form>

<script type="text/javascript">

function info(){
	var userId=document.getElementById("userId").value;
	var userPw=document.getElementById("userPw").value;
	var userName=document.getElementById("userName").value;
	var userEmail=document.getElementById("userEmail").value;
	var userPhoneNumber=document.getElementById("userPhoneNumber").value;
	
	if(userId=="" || userPw=="" || userName=="" || userEmail=="" || userPhoneNumber==""){
		//하나라도 비었으면 버튼 비활성화
		document.getElementById("subBtn").disabled=true;
	}else{
		document.getElementById("subBtn").disabled=false;
	}
	
}




</script>

</body>
</html>