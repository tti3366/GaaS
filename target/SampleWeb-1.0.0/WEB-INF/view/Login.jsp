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
<form:form modelAttribute="test" action="/swExample/loginCheck" method="post">

	<label>ID : <input type="text" name="userId" value="${User.userId }"/></label>
	<br>
	
	<label>PW : <input type="password" name="userPw"/></label>
	<br>
	
	<input type="submit" value="로그인"/><br>
</form:form>


<a href="/swExample/signup">회원가입</a>


</body>
</html>