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
	<div class="modal-header">
		<h5 class="modal-title">Post Detail</h5>
		<button type="button" class="btn-close" 
			data-bs-dismiss="modal"	aria-label="Close"></button>
	</div>
	<div class="modal-body" id="viewPostModalBody">
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
			파일 저장 : <a class="btn" href="/Users/Jun/Image/" download="${postObj.fileName}">${postObj.fileName}</a><br>	 <!-- "/home/ubuntu/Project/Image/" -->
		</c:if>
		
		<c:if test="${userInfo.userId eq postObj.writerId}">
			<a href="#" onclick="changeModal('modifypost', '${postObj.postId}')">수정하러 가자</a>
			<a href="#" onclick="deletePost('{&quot;writerId&quot;: &quot;${postObj.writerId}&quot;, &quot;postId&quot;: &quot;${postObj.postId}&quot;, &quot;boardId&quot;: &quot;${postObj.boardId}&quot;}')">삭제하러 가자</a>
		</c:if>
	</div>
	<div class="modal-footer">
		<button type="button" class="btn btn-secondary"
			data-bs-dismiss="modal">Close</button>
	</div>
</body>
</html>