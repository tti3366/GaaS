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
동아리 개설 페이지<br>

<!-- 스프링 폼 사용 -->
<form:form modelAttribute="createClub" action="/enrollclub" method="post">

    
    
	<label>동아리 명 : <input type="text" id="clubName" name="clubName" value="${club.clubName }" onchange="info()"/></label>
	<br>
	
	<label>동아리 장 학번 : <input type="text" id="managerId" name="managerId" value="${club.managerId }" onchange="info()"/></label>
	<br>
	
	<label>전공/교양 : 
		<input type="radio" id="division" name="division" value="전공" onclick="info()">전공
		<input type="radio" id="division" name="division" value="교양" onclick="info()">교양
	
	
	</label>
	<br>
	
	<input type="submit" id="subBtn" value="개설" disabled/><br>
</form:form>

<script type="text/javascript">

function info(){
	var clubName=document.getElementById("clubName").value;
	var managerId=document.getElementById("managerId").value;
	var division=document.getElementById("division").value;
	
	
	if(clubName=="" || managerId=="" || division==""){
		//하나라도 비었으면 버튼 비활성화
		document.getElementById("subBtn").disabled=true;
	}else{
		document.getElementById("subBtn").disabled=false;
	}
	
}

</script>
</body>
</html>