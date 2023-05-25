<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta content="" name="description">
<meta content="" name="keywords">

<!-- Favicons -->
<link href="/assets/img/logo.png" rel="icon">
<link href="/assets/img/logo.png" rel="apple-touch-icon">

<!-- Vendor CSS Files -->
<link href="/assets/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="/assets/vendor/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet">
<link href="/assets/vendor/boxicons/css/boxicons.min.css"
	rel="stylesheet">
<link href="/assets/vendor/quill/quill.snow.css" rel="stylesheet">
<link href="/assets/vendor/quill/quill.bubble.css" rel="stylesheet">
<link href="/assets/vendor/remixicon/remixicon.css" rel="stylesheet">
<link href="/assets/vendor/simple-datatables/style.css" rel="stylesheet">

<!-- Template Main CSS File -->
<link href="/css/style.css" rel="stylesheet">
<title>SignIn Club</title>
</head>
<body>

<div class="col-lg-6">
  <div class="card">
    <div class="card-body">
      <h5 class="card-title">SignIn Club</h5>
        <form:form modelAttribute="clubUser" action="/enterclub" method="post">
      	<div class="row mb-3">
          <label class="col-sm-2 col-form-label">이름</label>
          <div class="col-sm-10">
            <input type="text" class="form-control" value="${userInfo.userName}" disabled>
          </div>
        </div>
        
        <div class="row mb-3">
          <label class="col-sm-2 col-form-label">학번</label>
          <div class="col-sm-10">
            <input type="text" class="form-control" value="${userInfo.userId}" disabled>
          </div>
        </div>
      
        <div class="row mb-3">
          <label class="col-sm-2 col-form-label">연락처</label>
          <div class="col-sm-10">
            <input type="text" class="form-control" value="${userInfo.userPhoneNumber}" disabled>
          </div>
        </div>
        
        <div class="row mb-3"
        	<label class="col-sm-2 col-form-label">동아리</label>
	        <select id="clubSelect" name="clubName">
		        <c:forEach items="${clubs}" var="club">
		            <option value="${club.clubName}">
		            	<c:if test="${club.division eq '일반'}">[일반]</c:if>
		            	<c:if test="${club.division eq '전공'}">[전공]</c:if>
		            	${club.clubName}
		            </option>
		        </c:forEach>
	    	</select>
    	</div>
        
        <div class="row mb-3">
          <label for="Introduce" class="col-sm-2 col-form-label">인사말</label>
          <div class="col-sm-10">
            <textarea class="form-control" style="height: 50px" id="Introduce" name="Introduce" required></textarea>
          </div>
        </div>

        <div class="row mb-3">
          <div class="col-sm-10">
            <button type="submit" class="btn btn-primary">Submit</button>
          </div>
        </div>
      </form:form>
    </div>
  </div>
</div>
        
<script src="/assets/vendor/apexcharts/apexcharts.min.js"></script>
<script src="/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="/assets/vendor/chart.js/chart.umd.js"></script>
<script src="/assets/vendor/echarts/echarts.min.js"></script>
<script src="/assets/vendor/quill/quill.min.js"></script>
<script src="/assets/vendor/simple-datatables/simple-datatables.js"></script>
<script src="/assets/vendor/tinymce/tinymce.min.js"></script>
<script src="/assets/vendor/php-email-form/validate.js"></script>

<!-- Template Main JS File -->
<script src="/assets/js/jquery-1.10.2.js"></script>
<script src="/assets/js/main.js"></script>
<script src="/assets/js/additionalFunc.js"></script>

</body>
</html>