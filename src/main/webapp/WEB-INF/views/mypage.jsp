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

		<nav class="header-nav ms-auto">
			<ul class="d-flex align-items-center">
				<li class="nav-item dropdown pe-3"><a
					class="nav-link nav-profile d-flex align-items-center pe-0"
					href="#" data-bs-toggle="dropdown"> 
						<c:choose>           
				            <c:when test = "${userInfo.authority eq 'manager'}">
						    	<i class="ri-admin-line"></i>
						    </c:when>
						    <c:when test = "${userInfo.authority eq 'admin'}">
						    	<i class="ri-aliens-line"></i>
						    </c:when>
						    <c:otherwise>
						    	<i class="ri-user-line"></i>
					        </c:otherwise>
			            </c:choose>
						<span class="d-none d-md-block dropdown-toggle ps-2">${userInfo.userName}</span>
				</a> <!-- 유저 정보  -->
					<ul
						class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile">
						<li class="dropdown-header">
							<h6>${userInfo.userName}</h6> <span>${userInfo.userId}</span>
						</li>

						<li>
							<hr class="dropdown-divider">
						</li>

						<li><a class="dropdown-item d-flex align-items-center"
							href="/mypage">
							<i class="bi bi-person"></i> 
							<span>My Profile</span>
						</a></li>
						<li>
							<hr class="dropdown-divider">
						</li>

						<li><a class="dropdown-item d-flex align-items-center"
							href="
				              	<c:choose>
				              		<c:when test="${userInfo.authority eq 'manager'}">
				              			/manager/clubUsers
				              		</c:when>
				              		<c:when test="${userInfo.authority eq 'admin'}">
				              			/admin/viewTables
				              		</c:when>
				              		<c:when test="${userInfo.authority eq 'user'}">
				              			<!-- 본인 동아리 현황 -->
				              		</c:when>
				              	</c:choose>  						
							"> <i class="bi bi-gear"></i>
							<span>Account Settings</span>
						</a></li>
						<li>
							<hr class="dropdown-divider">
						</li>

						<li><a class="dropdown-item d-flex align-items-center"
							href="pages-faq.html"> <i class="bi bi-question-circle"></i>
								<span>Need Help?</span>
						</a></li>
						<li>
							<hr class="dropdown-divider">
						</li>

						<li><a class="dropdown-item d-flex align-items-center"
							href="/logoutProc"> <i class="bi bi-box-arrow-right"></i>
							<span>Logout</span>
						</a></li>

					</ul>
					<!-- End Profile Dropdown Items --></li>
				<!-- End Profile Nav -->

			</ul>
		</nav>
		<!-- End Icons Navigation -->

	</header>
	<!-- End Header -->

	<!-- ======= Sidebar ======= -->
	<aside id="sidebar" class="sidebar">

		<ul class="sidebar-nav" id="sidebar-nav">

			<li class="nav-heading">Main</li>

			<!--  MAIN PAGE -->
			<li class="nav-item">
				<a class="nav-link " href="/home"> 
					<i class="bi bi-grid"></i>
					<span>HOME</span>
				</a>
			</li>
			
			<c:choose>
			      <c:when test = "${userInfo.authority eq 'manager'}">
				      <li class="nav-item">
				        <a class="nav-link collapsed" href="">
				          <i class="ri-team-line"></i>
				          <span>Manage Club</span>
				        </a>
				      </li>
			      </c:when>
			      <c:when test = "${userInfo.authority eq 'user'}">
				      <li class="nav-item">
				        <a class="nav-link collapsed" href="">
				          <i class="ri-pencil-line"></i>
				          <span>Enroll Club</span>
				        </a>
				      </li>
			      </c:when>
			      <c:otherwise>
				      <li class="nav-item">
				        <a class="nav-link collapsed" href="">
				          <i class="ri-settings-5-line"></i>
				          <span>Administrator</span>
				        </a>
				      </li>
			      </c:otherwise>
		    </c:choose>

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
					<li class="breadcrumb-item">Users</li>
					<li class="breadcrumb-item active">Profile</li>
				</ol>
			</nav>
		</div>
		<!-- End Page Title -->

		<section class="section profile">
			<div class="row">

				<div class="col-xl-12">

					<div class="card">
						<div class="card-body pt-3">
							<!-- Bordered Tabs -->
							<ul class="nav nav-tabs nav-tabs-bordered">

								<li class="nav-item">
									<button class="nav-link active" data-bs-toggle="tab"
										data-bs-target="#profile-overview">Overview</button>
								</li>

								<li class="nav-item">
									<button class="nav-link" data-bs-toggle="tab"
										data-bs-target="#profile-edit">Edit Profile</button>
								</li>

								<li class="nav-item">
									<button class="nav-link" data-bs-toggle="tab"
										data-bs-target="#profile-change-password">Change Password</button>
								</li>

								<li class="nav-item">
									<button class="nav-link" data-bs-toggle="tab"
										data-bs-target="#profile-deletion">Account & Club</button>
								</li>

							</ul>
							<div class="tab-content pt-2">

								<div class="tab-pane fade show active profile-overview"
									id="profile-overview">
									<h5 class="card-title">Profile Details</h5>

									<div class="row">
										<div class="col-lg-3 col-md-4 label ">Name</div>
										<div class="col-lg-9 col-md-8">${userInfo.userName}</div>
									</div>

									<div class="row">
										<div class="col-lg-3 col-md-4 label">User ID</div>
										<div class="col-lg-9 col-md-8">${userInfo.userId}</div>
									</div>

									<div class="row">
										<div class="col-lg-3 col-md-4 label">Department</div>
										<div class="col-lg-9 col-md-8">${deptByUser.nameEn}</div>
									</div>

									<div class="row">
										<div class="col-lg-3 col-md-4 label">Phone</div>
										<div class="col-lg-9 col-md-8">${userInfo.userPhoneNumber}</div>
									</div>

									<div class="row">
										<div class="col-lg-3 col-md-4 label">Email</div>
										<div class="col-lg-9 col-md-8">${userInfo.userEmail}</div>
									</div>

									<div class="row">
										<div class="col-lg-3 col-md-4 label">About</div>
										<div class="col-lg-9 col-md-8">${userInfo.about}</div>
									</div>

									${alert}
								</div>

								<!-- 프로필 변경 -->
								<div class="tab-pane fade profile-edit pt-3" id="profile-edit">
									<!-- Profile Edit Form -->
									<form:form class="row g-3 needs-validation"
										modelAttribute="updateUserData" action="/updateUserProc"
										method="post">
										<!--                
					<div class="row mb-3">
                      <label for="profileImage" class="col-md-4 col-lg-3 col-form-label">Profile Image</label>
                      <div class="col-md-8 col-lg-9">
                        <img src="assets/img/profile-img.jpg" alt="Profile">
                        <div class="pt-2">
                          <a href="#" class="btn btn-primary btn-sm" title="Upload new profile image"><i class="bi bi-upload"></i></a>
                          <a href="#" class="btn btn-danger btn-sm" title="Remove my profile image"><i class="bi bi-trash"></i></a>
                        </div>
                      </div>
                    </div>
 -->

										<div class="row mb-3">
											<label for="Phone" class="col-md-4 col-lg-3 col-form-label">Phone</label>
											<div class="col-md-8 col-lg-9">
												<input name="userPhoneNumber" type="text"
													class="form-control" id="userPhoneNumber"
													value="${userInfo.userPhoneNumber}" required>
												<div class="invalid-feedback">Please enter a valid
													Phone Number!</div>
											</div>
										</div>

										<div class="row mb-3">
											<label for="Email" class="col-md-4 col-lg-3 col-form-label">Email</label>
											<div class="col-md-8 col-lg-9">
												<input name="userEmail" type="email" class="form-control"
													id="userEmail"
													pattern="[a-zA-Z0-9]+[@][a-zA-Z0-9]+[.]+[a-zA-Z]+[.]*[a-zA-Z]*[.]*[a-zA-Z]*"
													size="40" value="${userInfo.userEmail}" required>
												<div class="invalid-feedback">Please enter a valid
													Email address!</div>
											</div>
										</div>

										<div class="row mb-3">
											<label for="about" class="col-md-4 col-lg-3 col-form-label">About</label>
											<div class="col-md-8 col-lg-9">
												<input name="about" type="text" class="form-control"
													id="about" value="${userInfo.about}">
											</div>
										</div>

										<div class="text-center">
											<button type="submit" class="btn btn-primary">Save
												Changes</button>
										</div>
									</form:form>
									<!-- End Profile Edit Form -->

								</div>

								<div class="tab-pane fade pt-3" id="profile-change-password">
									<form:form class="row g-3 needs-validation"
										modelAttribute="changePw" action="/changePwProc" method="post">

										<div class="row mb-3">
											<label for="currentPassword"
												class="col-md-4 col-lg-3 col-form-label">Current
												Password</label>
											<div class="col-md-8 col-lg-9">
												<input name="currentPwd" type="password"
													class="form-control" id="currentPwd">
											</div>
										</div>

										<div class="row mb-3">
											<label for="newPassword"
												class="col-md-4 col-lg-3 col-form-label">New
												Password</label>
											<div class="col-md-8 col-lg-9">
												<input name="newPwd" type="password" class="form-control"
													id="newPwd">
											</div>
										</div>

										<div class="row mb-3">
											<label for="renewPassword"
												class="col-md-4 col-lg-3 col-form-label">
												Re-enter New Password</label>
											<div class="col-md-8 col-lg-9">
												<input name="newPwdCheck" type="password"
													class="form-control" id="newPwdCheck">
											</div>
										</div>
										<div class="text-center">
											<button type="submit" class="btn btn-primary">
											Change Password</button>
										</div>
									</form:form>
								</div>

								<div class="tab-pane fade pt-3" id="profile-deletion">
									<div class="row mb-3">
										<label class="col-md-4 col-lg-3 col-form-label">Account Deletion</label>
										<div class="col-md-8 col-lg-9">
											<div class="pt-2">
												 <a class="btn btn-danger btn-sm" data-bs-toggle="modal" data-bs-target="#deleteModal"
													title="Remove my Account"><i class="bi bi-trash"></i></a>
											</div>
										</div>
									</div>
										<div class="modal fade" id="deleteModal" tabindex="-1">
							                <div class="modal-dialog">
							                  <div class="modal-content">
							                    <div class="modal-header">
							                      <h5 class="modal-title">Delete Account</h5>
							                      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
							                    </div>
							                    <div class="modal-body">
							                      Do you want to delete your account?
							                    </div>
							                    <div class="modal-footer">
							                      <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">No</button>
							                      <button type="button" class="btn btn-danger" onclick="location.href='/deleteUsers'">Yes</button>
							                    </div>
							                  </div>
							                </div>
							            </div>
									<div class="row mb-3">
										<label class="col-md-4 col-lg-3 col-form-label">Club Create Page</label>
										<div class="col-md-8 col-lg-9">
											<div class="pt-2">
												 <a data-bs-toggle="modal" data-bs-target="#createClubModal"
												 class="btn btn-primary btn-sm" title="Create Club"><i class="bi bi-door-open"></i></a>
											</div>
										</div>
										
										<!-- Modal을 이용한 개설 신청 페이지 -->
										<div class="modal fade" id="createClubModal" tabindex="-1">
							                <div class="modal-dialog modal-lg">
							                  <div class="modal-content">
							                    <div class="modal-header">
							                      <h5 class="modal-title">Create Club</h5>
							                      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
							                    </div>
							                    <c:choose>
							                    	<c:when test = "${userInfo.authority eq 'user'}">
							                    		<form:form modelAttribute="createClub" action="/enrollclub" method="post">
									                    <div class="modal-body">
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
									                    </div>
									                    <div class="modal-footer">
									                      <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
									                      <button type="submit" class="btn btn-primary">Create Club</button>
									                    </div>
									                    </form:form>
								                    </c:when>
								                    <c:otherwise>
								                    	<div class="modal-body">
									                    You can't create a club.
									                    </div>
									                    <div class="modal-footer">
									                      <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
									                    </div>
								                    </c:otherwise>
							                    </c:choose>
							                  </div>
							                </div>
						              	</div>
									</div>
									<div class="row mb-3">
										<label class="col-md-4 col-lg-3 col-form-label">Sign In Club</label>
										<div class="col-md-8 col-lg-9">
											<div class="pt-2">
												 <a href="#" onclick="window.open('/signinclub','SignInClubPopup','width=500, height=520')"
												 class="btn btn-primary btn-sm" title="Sign In Club"><i class="bi bi-door-open"></i></a>
											</div>
										</div>
									</div>
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