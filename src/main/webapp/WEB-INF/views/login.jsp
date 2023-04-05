<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
하나라도 입력 안하면 submmit 못하게 jsp 파일에서 설정하는게 나을듯<br>
잘못입력시 메세지 출력이 필요할듯<br>
로그인 유지 설정 필요
<!-- 스프링 폼 사용 -->
<form:form modelAttribute="loginData" action="/loginProc" method="post">

	<label>ID : <input type="text" name="userId" value="${user.userId}"/></label>
	<br>
	
	<label>PW : <input type="password" name="userPw"/></label>
	<br>
	
	<input type="submit" value="로그인"/><br>
	
	${alert} <!-- 로그인 실패 알림 메시지 -->
</form:form>


<a href="/signup">회원가입</a>


</body>
</html>