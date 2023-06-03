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
	작성자 : ${postObj.writerId }<br>
	제목 : ${postObj.title }<br>
	내용 : ${postObj.contents }<br>
	작성일자 : ${fn:substring(postObj.postDate.toString(), 0, 19)}<br>
	조회수 : ${postObj.views }<br>
	게시글 상태 : ${postObj.statusCode }<br>
	--------------------------------------------------<br>
	게시글 번호 : ${postObj.postId }<br>
	동아리 코드 : ${postObj.clubId }<br>
	게시판 코드 : ${postObj.boardId }<br>
	
	<c:if test="${!empty postObj.fileName}">
		파일 이름 : ${postObj.fileName}<br>
		<img src="/upload/${postObj.fileName}" style="max-width: 100%; height: auto;"/><br>
		파일 저장 : <a class="btn" href="/Users/Jun/Image/" download="${postObj.fileName}">${postObj.fileName}</a><br>
	</c:if>
</body>
</html>