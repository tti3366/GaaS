<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.text.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1 class="card-title">${clubObj.clubName}</h1>
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
		<% 
           	Date date = new Date();
           	SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
           	String str = sd.format(date);
        %>
		<tbody>
			<tr>
				<th scope="row" style="text-align: center">1</th>
				<td><a href="/mypage" class="text-primary fw-bold">Test</a></td>
				<td style="text-align: center">고명준</td>
				<td style="text-align: center"><%=str%></td>
				<td class="fw-bold" style="text-align: center">${abc}</td>
			</tr>
		</tbody>
	</table>
</body>
</html>