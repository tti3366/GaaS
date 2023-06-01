<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
  table {
    width: 100%;
    border: 1px solid #444444;
    border-collapse: collapse;
  }
  th, tr {
    border: 1px solid #444444;
  }
</style>


<meta charset="UTF-8">
<title>Insert title here</title>
</head>
글을 클릭하면 경로에 postid를 줘서 출력할 수 있게(post로 해야할듯. 권한 없는 사용자가 url에 임의로 번호 넣어서 볼 수도 있어서)
<body>
	<div class="container" id="mainpost">
		<table>
			<c:forEach var="post" items="${posts}">
				<tr onclick="func1('${post.postId }')">
					<td>${post.postId}</td>
					<td>${post.writerId}</td>
					<td>${post.clubId}</td>
					<td>${post.boardId}</td>
					<td>${post.title}</td>
					<td>${post.contents}</td>
					<td>${post.postDate}</td>
					<td>${post.statusCode}</td>
					<td>${post.views}</td>
					<td>
						<c:if test="${!empty post.fileName}">
							
							${post.fileName }
						</c:if>
					</td>
					
	    		</tr>
			</c:forEach>
		</table>
		
		<script>
			function func1(event){
				console.log(event);
			}
			
	
		</script>
	</div>
</body>
<script src="/assets/js/main.js"></script>
  <script src="/assets/js/additionalFunc.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</html>
