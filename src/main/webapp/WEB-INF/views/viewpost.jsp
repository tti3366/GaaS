<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>

<style>
	.comments-text{
		width:100%;
	}
</style>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="modal-header">
		<h5 class="modal-title">Post Detail</h5>
		<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	</div>
	
	<div class="modal-body pagetitle" id="viewPostModalBody">
		<h1>${postObj.title}</h1>
		
		<nav class="d-flex justify-content-end">
			<ol class="breadcrumb">
				<li class="breadcrumb-item">작성자 : ${postObj.writerName}(${postObj.writerId})</li>
				<li class="breadcrumb-item">작성일 : ${fn:substring(postObj.postDate.toString(), 0, 19)}</li>
				<li class="breadcrumb-item">조회수 : ${postObj.views}</li>
			</ol>
		</nav>
	
		<hr class="divider">
	
		<c:if test="${!empty postObj.fileName}">
			<img src="/upload/post/${postObj.fileName}" style="max-width: 100%; height: auto;" />
			<br><br>
			<!-- 파일 저장 : <a class="btn" href="/Users/Jun/Image/" download="${postObj.fileName}">${postObj.fileName}</a><br>	 -->
			<!-- "/home/ubuntu/Project/Image/" -->
		</c:if>
		${postObj.contents}
	
		<div id="commentList">
			<c:set var="replyCnt" value="1" />						<!-- 댓글 번호 -->
			
			<c:forEach var="reply" items="${replies}">
						
				<c:if test="${reply.statusCode != 2}">				<!-- 삭제된 댓글(2)이 아닐 때 (초기 0 | 수정 1) -->
					<c:if test="${replyCnt == 1}">					<!-- 작성된 댓글이 하나 이상일 때부터 댓글 구분선 추가 -->
						<hr class="divider">
					</c:if>
					
					${replyCnt} | <input type="text" id="${reply.replyId }" value="${reply.contents }" disabled /> | ${reply.writerName}(${reply.writerId}) | ${fn:substring(reply.replyDate.toString(), 0, 19)} |  
					
					<c:set var="replyCnt" value="${replyCnt + 1}" /><!-- 댓글 번호 증가 -->
					<c:set var="userId" value="${userInfo.userId}" />
					<c:set var="writerId" value="${reply.writerId}" />
		
					<c:if test="${userId eq writerId }">
						<input id="modifybtn${reply.replyId }" type="button" value="수정"
							onclick="changeComment('modify', ${postObj.postId}, ${reply.replyId})" />
						<input id="deletebtn${reply.replyId }" type="button" value="삭제"
							onclick="changeComment('delete', ${postObj.postId}, ${reply.replyId})" />
					</c:if>
		
					<c:if test="${reply.statusCode == 1}"> [수정됨]</c:if>
					<br>
				</c:if>
			</c:forEach>
		</div>
	
		<hr class="divider">
		
		<p>댓글</p>
		<form id="commentSubmit" method="POST">
			<div align="right" class="comments-box">
				<textarea class="comments-text" id="contents" name="contents" rows="2" cols="100" required></textarea>
				<input type="hidden" id="postId" name="postId" value="${postObj.postId }" /> 
				<input type="hidden" id="statusCode" name="statusCode" value="${postObj.statusCode }" /> 
				<input class="btn btn-primary" type="submit" value="작성" />
			</div>
		</form>
	</div>
	
	<div class="modal-footer">
		<c:if test="${userInfo.userId eq postObj.writerId}">

			<button type="button" class="btn btn-primary" 
				onclick="changeModal('modifypost', '${postObj.postId}')">
				Modify Post</button>
			<button type="button" class="btn btn-primary" data-bs-dismiss="modal"
				onclick="deletePost('{&quot;writerId&quot;: &quot;${postObj.writerId}&quot;, &quot;postId&quot;: &quot;${postObj.postId}&quot;, &quot;boardId&quot;: &quot;${postObj.boardId}&quot;}')">
				Delete Post</button>
		</c:if>
		<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
				Close</button>
	</div>
	<!-- <script src="/assets/js/additionalFunc.js"></script> -->
</body>
</html>