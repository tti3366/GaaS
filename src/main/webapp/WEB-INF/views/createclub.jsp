<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
<title>Create Club</title>
</head>
<body>

<div class="col-lg-6">
  <div class="card">
    <div class="card-body">
      <h5 class="card-title">Create Club</h5>
        <form:form modelAttribute="createClub" action="/enrollclub" method="post">
      	<div class="row mb-3">
          <label class="col-sm-2 col-form-label">Proposer</label>
          <div class="col-sm-10">
            <input type="text" class="form-control" value="${userInfo.userName} / ${userInfo.userId}" disabled>
          </div>
        </div>
      
        <div class="row mb-3">
          <label for="clubName" class="col-sm-2 col-form-label">Club Name</label>
          <div class="col-sm-10">
            <input type="text" class="form-control" id="clubName" name="clubName" required>
          </div>
        </div>
        
        <div class="row mb-3">
          <label for="clubInformation" class="col-sm-2 col-form-label">Club Information</label>
          <div class="col-sm-10">
            <textarea class="form-control" style="height: 50px" id="clubInformation" name="clubInformation" required></textarea>
          </div>
        </div>
        
        <fieldset class="row mb-3">
          <legend class="col-form-label col-sm-2 pt-0">Major/Common</legend>
          <div class="col-sm-10">
            <div class="form-check">
              <input class="form-check-input" type="radio" name="division" id="division" value="전공" checked>
              <label class="form-check-label" for="gridRadios1">
                Major
              </label>
            </div>
            <div class="form-check">
              <input class="form-check-input" type="radio" name="division" id="division" value="일반">
              <label class="form-check-label" for="gridRadios2">
                Common
              </label>
            </div>
          </div>
        </fieldset>

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