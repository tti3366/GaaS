<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.text.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="/assets/js/additionalFunc.js"></script>
</head>
<body>
	<h1 class="card-title">동아리명</h1>
	<table class="table table-borderless">
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
						<a href="#" class="text-primary fw-bold" onclick="changeMainBoard('post', '${post.postId}')">${post.title}</a>
						<c:if test="${!empty post.fileName}">
							파일 있음
						</c:if>
					</td>
					<td style="text-align: center">${post.writerName}(${post.writerId})</td>
					<td style="text-align: center">${post.postDate}</td>
					<td class="fw-bold" style="text-align: center">${post.views}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
<script src="/assets/js/main.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</html>
