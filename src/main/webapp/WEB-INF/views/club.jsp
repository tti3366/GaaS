<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.text.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <script src="/assets/js/additionalFunc.js"></script> -->	<!-- Ajax로 해당 페이지를 불러오기 때문에, 이벤트 핸들러가 중복 등록되어 여러번 호출되는 오류가 발생 -->
</head>
<body>
	<h1 class="card-title">${club.clubName}</h1>
	동아리 소개
	
	<script>
		<c:if test="${!empty alert}">
			alert('${alert}');
		</c:if>
	</script>
</body>
</html>