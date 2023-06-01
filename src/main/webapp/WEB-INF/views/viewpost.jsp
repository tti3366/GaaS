<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%> 
<!DOCTYPE html>
<html>
<head>

<script src="/assets/js/additionalFunc.js"></script>
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
${postObj.fileName}<br>
<img src="/upload/${postObj.fileName}"/>
</body>
</html>