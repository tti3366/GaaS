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
	         <a class="nav-link collapsed" href="/admin/viewTables">
	          <i class="ri-settings-5-line"></i>
	          <span>Administrator</span>
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
			<h1>Profile</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="/home">Home</a></li>
					<li class="breadcrumb-item">Admin</li>
					<li class="breadcrumb-item active">viewTables</li>
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
										data-bs-target="#users">Users</button>
								</li>

								<li class="nav-item">
									<button class="nav-link" data-bs-toggle="tab"
										data-bs-target="#clubs">Clubs</button>
								</li>

								<li class="nav-item">
									<button class="nav-link" data-bs-toggle="tab"
										data-bs-target="#depts">Depts</button>
								</li>
								

							</ul>
							<div class="tab-content pt-2">
								
								<!-- USERS -->
								<div class="tab-pane fade show active users" id="users">
									<form id="form_user" class="forms" action="modify/club" method="post">
										<table id="table_user" class="table table-hover datatable">
											<thead>
												<tr style="text-align: center">
													<th scope="col">ROWNUM</th>
													<th scope="col">user_id</th>
													<th scope="col">user_pw</th>
													<th scope="col">user_name</th>
													<th scope="col">user_email</th>
													<th scope="col">user_phone_number</th>
													<th scope="col">authority</th>
													<th scope="col">about</th>
												</tr>
											</thead>
											<tbody>
											<c:forEach items="${users}" var="user" varStatus="status">
												<tr>
													<th scope="row" style="text-align: right" width = "10">
														<div class="form-check form-switch">
														${status.count} <input type="checkbox" class="form-check-input checkbox_user" value="${status.count}" onclick="changeAvailable(this, 'user_${status.count}')"/>
														</div>
													</th>
													<td style="text-align: center"><input type="text" class="form-control" id="user${status.count}_1" size="15" name="userId" value="${user.userId}" disabled/></td>
													<td style="text-align: center"><input type="text" class="form-control" id="user${status.count}_2" size="20" minlength="4" maxlength="20" name="userPw" value="${user.userPw}" disabled/></td>
													<td style="text-align: center"><input type="text" class="form-control" id="user${status.count}_3" size="10" minlength="2" maxlength="10" name="userName" value="${user.userName}" disabled/></td>
													<td style="text-align: center"><input type="text" class="form-control" id="user${status.count}_4" size="30" minlength="10" maxlength="30" name="userEmail" value="${user.userEmail}" disabled/></td>
													<td style="text-align: center"><input type="text" class="form-control" id="user${status.count}_5" size="11" minlength="10" maxlength="11" name="userPhoneNumber" value="${user.userPhoneNumber}" disabled/></td>
													<td style="text-align: center">
														<select class="form-select" id="user${status.count}_6" name="authority" disabled>
														    <option value="user" <c:if test="${user.authority == 'user'}">selected</c:if>>사용자</option>
														    <option value="manager" <c:if test="${user.authority == 'manager'}">selected</c:if>>동아리장</option>
														    <option value="admin" <c:if test="${user.authority == 'admin'}">selected</c:if>>관리자</option>
														</select>
													</td>
													<td style="text-align: center"><input type="text" class="form-control" id="user${status.count}_7" size="40" minlength="0" maxlength="50" name="about" value="${user.about}" disabled/></td>
												</tr>	
											</c:forEach>
											</tbody>
										</table>
										<input type="submit" class="btn btn-primary" value="SAVE"/>
									</form>
								</div>

								<!-- CLUBS -->
								<div class="tab-pane fade clubs" id="clubs">
									<form id="form_club" class="forms" action="modify/club" method="post">
										<table id="table_club" class="table table-hover datatable">
											<thead>
												<tr style="text-align: center">
													<th scope="col">ROWNUM</th>
													<th scope="col">club_id</th>
													<th scope="col">club_name</th>
													<th scope="col">manager_id</th>
													<th scope="col">division</th>
													<th scope="col">dept_name_kr</th>
													<th scope="col">dept_name_en</th>
													<th scope="col">club_information</th>
													<th scope="col">club_state</th>
													<th scope="col">DELETE</th>
												</tr>
											</thead>
											<tbody>
											<c:forEach items="${clubs}" var="club" varStatus="status">
												<tr>
													<th scope="row" style="text-align: right" width = "10">
														<div class="form-check form-switch">
														${status.count} <input type="checkbox" class="form-check-input checkbox_club" value="${status.count}" onclick="changeAvailable(this, 'club_${status.count}')"/>
														</div>
													</th>
													<td style="text-align: center"><input type="text" class="form-control" id="club${status.count}_1" size="6" name="clubId" value="${club.clubId}" disabled/></td>
													<td style="text-align: center"><input type="text" class="form-control" id="club${status.count}_2" size="20" minlength="2" maxlength="20" name="clubName" value="${club.clubName}" disabled/></td>
													<td style="text-align: center"><input type="text" class="form-control" id="club${status.count}_3" size="10" name="managerId" value="${club.managerId}" disabled/></td>
													<td style="text-align: center"><input type="text" class="form-control" id="club${status.count}_4" size="5" name="division" value="${club.division}" disabled/></td>
													<td style="text-align: center"><input type="text" class="form-control" id="club${status.count}_5" size="30" name="deptNameKr" value="${club.deptNameKr}" disabled/></td>
													<td style="text-align: center"><input type="text" class="form-control" id="club${status.count}_6" size="20" name="deptNameEn" value="${club.deptNameEn}" disabled/></td>
													<td style="text-align: center"><input type="text" class="form-control" id="club${status.count}_7" size="20" minlength="0" maxlength="30" name="clubInformation" value="${club.clubInformation}" disabled/></td>
													<td style="text-align: center"><input type="checkbox" class="form-check-input" id="club${status.count}_8" name="clubState" value="${club.clubState}" onclick="changeValue(this, 'checkbox')" disabled <c:if test="${club.clubState == 1}">checked</c:if>/></td>
													<td style="text-align: center"><a class = "btn btn-danger btn-sm" onclick="deleteTarget('${club.clubId}','club')"/><i class="bi bi-trash"></i></a></td>
												</tr>	
											</c:forEach>
											</tbody>
										</table>
										<input type="submit" class="btn btn-primary" value="SAVE"/>
									</form>
								</div>
								
								<!-- DEPTS -->
								<div class="tab-pane fade depts" id="depts">
									<form id="form_dept" class="forms" action="modify/club" method="post">
										<table id="table_dept" class="table table-hover datatable">
											<thead>
												<tr style="text-align: center">
													<th scope="col">ROWNUM</th>
													<th scope="col">dept_id</th>
													<th scope="col">name_kr</th>
													<th scope="col">name_en</th>
												</tr>
											</thead>
											<tbody>
											<c:forEach items="${depts}" var="dept" varStatus="status">
												<tr>
													<th scope="row" style="text-align: right" width = "10">
														<div class="form-check form-switch">
														${status.count} <input type="checkbox" class="form-check-input checkbox_dept" value="${status.count}" onclick="changeAvailable(this, 'dept_${status.count}')"/>
														</div>
													</th>
													<td style="text-align: center"><input type="text" class="form-control" id="dept${status.count}_1" size="2" name="deptId" value="${dept.deptId}" disabled/></td>
													<td style="text-align: center"><input type="text" class="form-control" id="dept${status.count}_2" size="30" minlength="2" maxlength="30" name="nameKr" value="${dept.nameKr}" disabled/></td>
													<td style="text-align: center"><input type="text" class="form-control" id="dept${status.count}_3" size="50" minlength="2" maxlength="50" name="nameEn" value="${dept.nameEn}" disabled/></td>
												</tr>			
											</c:forEach>
											</tbody>
										</table>	
										<input type="submit" class="btn btn-primary" value="SAVE"/>
									</form>
								</div>
								
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