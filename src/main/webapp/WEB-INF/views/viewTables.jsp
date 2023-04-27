<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>USERS</h2>
	<c:forEach items="${users}" var="user">
		${user}<br>
	</c:forEach>

	<h2>CLUB</h2>
	<c:forEach items="${clubs}" var="club">
		${club}<br>
	</c:forEach>

	<h2>DEPT</h2>
	<c:forEach items="${depts}" var="dept">
		${dept}<br>
	</c:forEach>
</body>
</html>