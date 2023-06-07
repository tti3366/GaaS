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
    <div class="modal-body pagetitle" id="viewPostModalBody">
      
      <h1>${postObj.title}</h1>
      <nav class="d-flex justify-content-end">
        <ol class = "breadcrumb">
          <li class="breadcrumb-item">작성자 : ${postObj.writerId}</li>
          <li class="breadcrumb-item">작성일 : ${fn:substring(postObj.postDate.toString(), 0, 19)}</li>
          <li class="breadcrumb-item">조회수 : ${postObj.views}</li>
        </ol>
      </nav>

      <c:if test="${userInfo.userId eq postObj.writerId}">
        <a href="#" onclick="changeModal('modifypost', '${postObj.postId}')">수정</a>
        <a href="#" onclick="deletePost('{&quot;writerId&quot;: &quot;${postObj.writerId}&quot;, &quot;postId&quot;: &quot;${postObj.postId}&quot;, &quot;boardId&quot;: &quot;${postObj.boardId}&quot;}')">삭제</a>
      </c:if>
      
      <hr class="divider">

      <c:if test="${!empty postObj.fileName}">
        <img src="/upload/${postObj.fileName}" style="max-width: 100%; height: auto;"/><br> <!-- "/home/ubuntu/Project/Image/" -->
        <!-- 파일 저장 : <a class="btn" href="/Users/Jun/Image/" download="${postObj.fileName}">${postObj.fileName}</a><br>	 -->
      </c:if>
      ${postObj.contents}

      <hr class="divider">
      여기에 댓글 폼 추가
      
    </div>
  	<div class="modal-footer">
      
      <button type="button" class="btn btn-secondary"
        data-bs-dismiss="modal">Close</button>
      
  	</div>
</body>
</html>