<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body> 
${postObj.postId }<br>
${postObj.writerId }<br>
${postObj.clubId }<br>
${postObj.boardId }<br>
${postObj.title }<br>
${postObj.contents }<br>
${postObj.postDate }<br>
${postObj.statusCode }<br>
${postObj.views }<br>
${postObj.fileName }<br>

<c:if test="${!empty postObj.fileName}">
	<img src="/upload/${postObj.fileName}"/>
	<a class="btn" href="/Users/Jun/Image/" download="${postObj.fileName}">${postObj.fileName}</a>
</c:if>

<a onclick='history.go(-1)'>뒤로가기 (미완성)</a>
<!-- https://carpet-part1.tistory.com/721 -->
</body>
</html>