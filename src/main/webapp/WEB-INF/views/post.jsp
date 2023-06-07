<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 작성 페이지</title>
</head>
<body>	
<c:choose>

<c:when test="${empty postObj}">	<!-- 게시글 작성 -->
	<div class="modal-header">
		<h5 class="modal-title">Write New Post</h5>
		<button type="button" class="btn-close" data-bs-dismiss="modal"
			aria-label="Close"></button>
	</div>
	<form method="POST" class="modalForms" enctype="multipart/form-data" action="/process">
		<div class="modal-body">
			<div class="row mb-3">
				<label class="col-sm-2 col-form-label">Writer</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" 
						value="${userInfo.userName}" disabled>
				</div>
			</div>
			<div class="form-group">
				<label for="title">Title</label> 
				<input type="text" class="form-control" id="title" name="title" required>
			</div>
			<br>
			<div class="form-group">
				<label for="content">Contents</label>
				<textarea class="form-control" id="contents" name="contents" rows="5" required></textarea>
			</div>
			<br>
			<div>
				<label for="image">Add Image</label> 
				<input class="form-control" type="file" id="image" name="image">
			</div>
		</div>
		
		<!-- 가장 최근에 선택한 동아리의 정보 (additionalFunc에서 동아리에 맞는 게시판으로 들어가기 위해 사용) -->
	   	<input type="hidden" name="boardId" value="${boardId}"/>
	     
		<div class="modal-footer">
			<button type="button" class="btn btn-secondary"
				data-bs-dismiss="modal">Close</button>
			<button type="submit" class="btn btn-primary"
				data-bs-dismiss="modal">Add Post</button>
		</div>
	</form>
	
</c:when>

<c:otherwise>	<!-- 게시글 수정 -->
	<div class="modal-header">
		<h5 class="modal-title">Modify Post</h5>
		<button type="button" class="btn-close" data-bs-dismiss="modal"
			aria-label="Close"></button>
	</div>		
	<form method="POST" class="modifyForms" enctype="multipart/form-data" action="/modifypost">
		<div class="modal-body">
			<div class="row mb-3">
				<label class="col-sm-2 col-form-label">Writer</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" 
						value="${userInfo.userName}(${userInfo.userId})" disabled>
				</div>
			</div>
			<div class="form-group">
				<label for="title">Title</label> 
				<input type="text" class="form-control" id="title" name="title" value="${postObj.title}" required>
			</div>
			<br>
			<div class="form-group">
				<label for="content">Contents</label>
				<textarea class="form-control" id="contents" name="contents" rows="5" required>${postObj.contents}</textarea>
			</div>
			<br>
			<div>
				<c:if test="${!empty postObj.fileName}">
					<img src="/upload/${postObj.fileName}" style="max-width: 100%; height: auto;"/><br><br>
				</c:if>
				<label for="image">Modify Image</label> 
				<input class="form-control" type="file" id="image" name="image">
			</div>
		</div>
	     
	     
		<!-- 수정할 게시글의 정보 -->
	   	<input type="hidden" name="postId" value="${postObj.postId}"/>
	   	<input type="hidden" name="writerId" value="${postObj.writerId}"/>
	   	<input type="hidden" name="boardId" value="${postObj.boardId}"/>
	   	
		<div class="modal-footer">
			<button type="submit" class="btn btn-primary"
				data-bs-dismiss="modal">Modify Post</button>
			<button type="button" class="btn btn-secondary"
				data-bs-dismiss="modal">Close</button>
		</div>
	</form>
		
</c:otherwise>
</c:choose>
</body>
</html>

