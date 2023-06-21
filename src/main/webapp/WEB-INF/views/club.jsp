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
	<h1 class="card-title">
		<b>[${club.division}] ${club.clubName}</b> <br>
		<span style="font-size: 0.8em;">${club.clubInformation}</span>
	</h1>
		
	<%-- 동아리장 : ${club.managerId}<br> --%>
	<c:if test="${!empty club.clubImage}">
		<img src="/upload/club/${club.clubImage}" style="max-width: 100%; height: auto;"/><br><br>
	</c:if>
	
	
	<script>
		<c:if test="${!empty alert}">
			alert('${alert}');
		</c:if>
		<c:if test="${!empty script}">
			${script}
		</c:if>
	</script>
</body>
</html>