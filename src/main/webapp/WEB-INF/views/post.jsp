<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 작성 페이지</title>
<link href="/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
</head>
<body>
	<div class="container">
    <h1>글 작성</h1>
    <form method="POST" action="/process" enctype="multipart/form-data">
      <div class="form-group">
        <label for="title">제목</label>
        <input type="text" class="form-control" id="title" name="title" required>
      </div>
      
      <div class="form-group">
        <label for="content">내용</label>
        <textarea class="form-control" id="content" name="content" rows="5" required></textarea>
      </div>
      
      <div>
        <label for="image">이미지 첨부</label>
        <input type="file" id="image" name="image">
      </div>
      
      <button type="submit" class="btn btn-primary">작성 완료</button>
    </form>
  </div>
  
  
  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
  
</body>
</html>

