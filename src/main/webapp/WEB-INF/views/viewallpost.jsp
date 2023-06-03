<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.text.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <script src="/assets/js/additionalFunc.js"></script> -->	<!-- Ajax로 해당 페이지를 불러오기 때문에, 이벤트 핸들러가 중복 등록되어 여러번 호출되는 오류가 발생 -->
</head>
<body>
	<h1 class="card-title">${club.clubName}</h1>
	<table class="table table-sm table-hover datatable">
		<thead>
			<tr style="text-align: center">
				<th scope="col">게시글 번호</th>
				<th scope="col">제목</th>
				<th scope="col">작성자</th>
				<th scope="col">작성일자</th>
				<th scope="col">조회수</th>
			</tr>
		</thead>
        
		<tbody>
			<c:forEach var="post" items="${posts}" varStatus="status">
				<tr>
					<th scope="row" style="text-align: center">${status.count}</th>
					<td>
						<a href="#" class="text-primary fw-bold" data-bs-toggle="modal" data-bs-target="#viewPostModal" onclick="changeModal('viewpost', '${post.postId}')">${post.title} </a>
						<c:if test="${!empty post.fileName}">
							<i class = "bi bi-file-earmark"></i>
						</c:if>
					</td>
					<td style="text-align: center">${post.writerName}(${post.writerId})</td>
					<td style="text-align: center">${fn:substring(post.postDate.toString(), 0, 19)}</td>
					<td style="text-align: center">${post.views}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
<script src="/assets/js/main.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</html>
