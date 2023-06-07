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
          <li class="breadcrumb-item">작성자 : ${postObj.writerName}(${postObj.writerId})</li>
          <li class="breadcrumb-item">작성일 : ${fn:substring(postObj.postDate.toString(), 0, 19)}</li>
          <li class="breadcrumb-item">조회수 : ${postObj.views}</li>
        </ol>
      </nav>
      
      <hr class="divider">

      <c:if test="${!empty postObj.fileName}">
        <img src="/upload/${postObj.fileName}" style="max-width: 100%; height: auto;"/><br><br>
        <!-- 파일 저장 : <a class="btn" href="/Users/Jun/Image/" download="${postObj.fileName}">${postObj.fileName}</a><br>	 -->  <!-- "/home/ubuntu/Project/Image/" -->
      </c:if>
      ${postObj.contents}

      <hr class="divider">
      여기에 댓글 폼 추가
      
    </div>
  	<div class="modal-footer">
    <c:if test="${userInfo.userId eq postObj.writerId}">
      	
		<button type="button" class="btn btn-primary" 
			onclick="changeModal('modifypost', '${postObj.postId}')">
			Modify Post
		</button>
		<button type="button" class="btn btn-primary" data-bs-dismiss="modal" 
			onclick="deletePost('{&quot;writerId&quot;: &quot;${postObj.writerId}&quot;, &quot;postId&quot;: &quot;${postObj.postId}&quot;, &quot;boardId&quot;: &quot;${postObj.boardId}&quot;}')">
			Delete Post
		</button>
	</c:if>
      	<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
        	Close
       	</button>
      
  	</div>
</body>
</html>