<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class = "pagetitle">
		<h1>${postObj.title}</h1>
		<nav class="d-flex justify-content-end">
			<ol class = "breadcrumb">
				<li class="breadcrumb-item">작성자 : ${postObj.writerId}</li>
				<li class="breadcrumb-item">작성일 : ${fn:substring(postObj.postDate.toString(), 0, 19)}</li>
				<li class="breadcrumb-item">조회수 : ${postObj.views}</li>
			</ol>
		</nav>
		
		<hr class="divider">
		
		<c:if test="${!empty postObj.fileName}">
			<img src="/upload/${postObj.fileName}" style="max-width: 100%; height: auto;"/><br>
		</c:if>
		${postObj.contents}
		
		<hr class="divider">
		여기에 댓글 폼 추가
	</div>
</body>
</html>