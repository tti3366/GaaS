<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>FHAK</title>
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

<title>MyPage</title>
</head>
<body>
	<!-- ======= Header ======= -->
	<header id="header" class="header fixed-top d-flex align-items-center">

		<div class="d-flex align-items-center justify-content-between">
			<a href="/home" class="logo d-flex align-items-center"> <img
				src="/assets/img/logo.png" alt=""> <span
				class="d-none d-lg-block">FHAK</span>
			</a> <i class="bi bi-list toggle-sidebar-btn"></i>
		</div>
		<!-- End Logo -->
	</header>
	<!-- End Header -->

	<!-- ======= Sidebar ======= -->
	<aside id="sidebar" class="sidebar">

		<ul class="sidebar-nav" id="sidebar-nav">

			<li class="nav-heading">Main</li>

			<!--  HOME -->
			<li class="nav-item">
				<a class="nav-link " href="/home"> 
					<i class="bi bi-grid"></i>
					<span>HOME</span>
				</a>
			</li>
			
 	        <li class="nav-item">
	         <a class="nav-link collapsed" href="/manager/clubUsers">
	          <i class="ri-settings-5-line"></i>
	          <span>Manage Club</span>
	         </a>
	        </li>

			<li class="nav-item">
				<a class="nav-link collapsed"href="/logoutProc">
					<i class="bi bi-box-arrow-in-right"></i>
					<span>LOGOUT</span>
				</a>
			</li>
			<!-- End Login Page Nav -->


		</ul>

	</aside>
	<!-- 사이드바 끝 -->


	<main id="main" class="main">

		<div class="pagetitle">
			<h1>${club.clubName}</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item">${club.clubInformation}</li>
				</ol>
			</nav>
		</div>
		<!-- End Page Title -->

		<section class="section profile">
			<div class="row">

				<div class="col-xl-12">

					<div class="card" style="height:1000px">
						<div class="card-body pt-3">
							<!-- Bordered Tabs -->
							<ul class="nav nav-tabs nav-tabs-bordered">

								<li class="nav-item">
									<button class="nav-link active" data-bs-toggle="tab"
										data-bs-target="#clubUsers">Users</button>
								</li>

							</ul>
							<div class="tab-content pt-2">
								<form id="form_clubUsers" class="forms" action="modify/clubUsers" method="post">
									<table id="table_clubUsers" class="table table-hover">
										<thead>
											<tr style="text-align: center">
												<th scope="col">ROWNUM</th>
												<th scope="col">dept_name_kr</th>
												<th scope="col">user_id</th>
												<th scope="col">user_name</th>
												<th scope="col">user_phone_number</th>
												<th scope="col">introduce</th>
												<th scope="col">join_date</th>
												<th scope="col">allow_state</th>
											</tr>
										</thead>
										<tbody>
										<c:forEach items="${clubUsers}" var="clubUser" varStatus="status">
											<tr>
												<th scope="row" style="text-align: center">
													${status.count}
												</th>
												<td style="text-align: center"><input type="text" class="form-control" id="clubUsers${status.count}_1" size="20" name="deptNameKr" value="${clubUser.deptNameKr}" disabled/></td>
												<td style="text-align: center"><input type="text" class="form-control" id="clubUsers${status.count}_2" size="8" name="userId" value="${clubUser.userId}" disabled/></td>
												<td style="text-align: center"><input type="text" class="form-control" id="clubUsers${status.count}_3" size="10" minlength="2" maxlength="10" name="userName" value="${clubUser.userName}" disabled/></td>
												<td style="text-align: center"><input type="text" class="form-control" id="clubUsers${status.count}_4" size="11" minlength="10" maxlength="11" name="userPhoneNumber" value="${clubUser.userPhoneNumber}" disabled/></td>
												<td style="text-align: center"><input type="text" class="form-control" id="clubUsers${status.count}_5" size="50" minlength="0" maxlength="50" name="introduce" value="${clubUser.introduce}" disabled/></td>
												<td style="text-align: center"><input type="text" class="form-control" id="clubUsers${status.count}_6" size="20" name="joinDateStr" value="${clubUser.joinDateStr}" disabled/></td>
												<td style="text-align: center"><input type="checkbox" id="clubUsers${status.count}_7" class="checkbox_clubUsers form-check-input" name="allowState" value="${clubUser.allowState}" onclick="changeValue(this, 'checkbox')" <c:if test="${clubUser.allowState == 1}">checked</c:if>/></td>
								
												<input type="hidden" id="clubUsers${status.count}_8" name="clubId" value="${clubUser.clubId}"/>
											</tr>	
										</c:forEach>
										</tbody>
									</table>
									<input type="button" value="전체 선택" onclick="changeAllAllow('clubUsers')"/>
									<input type="submit" value="수정"/>
								</form>
							</div>
							<!-- End Bordered Tabs -->
						</div>
					</div>
				</div>
			</div>
		</section>
	</main>
	<footer id="footer" class="footer">
		<div class="copyright">
			&copy; Copyright <strong><span>NiceAdmin</span></strong>. All Rights
			Reserved
		</div>
		<div class="credits">
			<!-- All the links in the footer should remain intact. -->
			<!-- You can delete the links only if you purchased the pro version. -->
			<!-- Licensing information: https://bootstrapmade.com/license/ -->
			<!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/ -->
			Designed by <a href="#" onclick="test()">BootstrapMade</a>
		</div>
	</footer>
	<!-- End Footer -->

	<a href="#"
		class="back-to-top d-flex align-items-center justify-content-center"><i
		class="bi bi-arrow-up-short"></i></a>

	<!-- Vendor JS Files -->
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