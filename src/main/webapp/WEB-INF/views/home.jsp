<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
  <link href="/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="/assets/vendor/quill/quill.snow.css" rel="stylesheet">
  <link href="/assets/vendor/quill/quill.bubble.css" rel="stylesheet">
  <link href="/assets/vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="/assets/vendor/simple-datatables/style.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="/css/style.css" rel="stylesheet">

</head>

<body>
  <!-- ======= Header ======= -->
  <header id="header" class="header fixed-top d-flex align-items-center">

    <div class="d-flex align-items-center justify-content-between">
      <a href="/home" class="logo d-flex align-items-center">
        <img src="/assets/img/logo.png" alt="">
        <span class="d-none d-lg-block">FHAK</span>
      </a>
      <i class="bi bi-list toggle-sidebar-btn"></i>
    </div><!-- End Logo -->

    <nav class="header-nav ms-auto">
      <ul class="d-flex align-items-center">
        <li class="nav-item dropdown pe-3">
          <a class="nav-link nav-profile d-flex align-items-center pe-0" href="#" data-bs-toggle="dropdown">
            <img src="/assets/img/${userInfo.authority}.png" alt="Profile" class="rounded-circle">
            <span class="d-none d-md-block dropdown-toggle ps-2">${userInfo.userName}</span>
          </a>

		<!-- 유저 정보  -->
          <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile">
            <li class="dropdown-header">
              <h6>${userInfo.userName}</h6>
              <span>${userInfo.userId}</span>
            </li>
            
            <li>
              <hr class="dropdown-divider">
            </li>

            <li>
              <a class="dropdown-item d-flex align-items-center" href="/mypage">
                <i class="bi bi-person"></i>
                <span>My Profile</span>
              </a>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>

            <li>
              <a class="dropdown-item d-flex align-items-center" href="users-profile.html">
                <i class="bi bi-gear"></i>
                <span>Account Settings</span>
              </a>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>

            <li>
              <a class="dropdown-item d-flex align-items-center" href="pages-faq.html">
                <i class="bi bi-question-circle"></i>
                <span>Need Help?</span>
              </a>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>

            <li>
              <a class="dropdown-item d-flex align-items-center" href="/logoutProc">
                <i class="bi bi-box-arrow-right"></i>
                <span>Logout</span>
              </a>
            </li>

          </ul><!-- End Profile Dropdown Items -->
        </li><!-- End Profile Nav -->

      </ul>
    </nav><!-- End Icons Navigation -->

  </header><!-- End Header -->

  <!-- ======= Sidebar ======= -->
  <aside id="sidebar" class="sidebar">

    <ul class="sidebar-nav" id="sidebar-nav">
    
      <li class="nav-heading">Main</li>

	<!--  MAIN PAGE -->
      <li class="nav-item">
        <a class="nav-link " href="/mypage">
          <i class="bi bi-grid"></i>
          <span>MY PAGE</span>
        </a>
      </li>
      
      <li class="nav-item">
        <a class="nav-link collapsed" href="/logoutProc">
          <i class="bi bi-box-arrow-in-right"></i>
          <span>LOGOUT</span>
        </a>
      </li><!-- End Login Page Nav -->

      <li class="nav-heading">DEPARTMENT</li>
      
      <!-- 학과 배열 선언 -->
      <c:forEach items="${depts}" var="dept">
      	
      	<script>console.log('${dept.nameEn}');</script>
      	
        <li class="nav-item">
          <a class="nav-link collapsed" data-bs-toggle="collapse" href="#${dept.nameKr}">
            <i class="bi bi-menu-button-wide"></i><span>${dept.nameEn}</span><i class="bi bi-chevron-down ms-auto"></i>
          </a>
          <ul id="${dept.nameKr}" class="nav-content collapse " data-bs-parent="#sidebar-nav">
            <c:forEach items="${clubs}" var="club">
              <c:if test="${club.deptNameEn == dept.nameEn}">
              
              	<script>console.log('-> ${club.clubName}');</script>
              	
                <li>
                  <a href="#" onclick="selectClubAndView(${club.clubId})">
                    <i class="bi bi-circle"></i>
                    <span>${club.clubName}</span>
                  </a>
                </li>
              </c:if>
            </c:forEach>
          </ul>
        </li>
      </c:forEach>

    </ul>

  </aside><!-- 사이드바 끝 -->

  <main id="main" class="main">
    <section class="section dashboard">
      <div class="row">
        <!-- Left side columns -->
        <div class="col-lg-8">
          <div class="row">
          
           <!-- 회원 게시판-->
            <div class="col-xxl-4 col-md-6">
              <div class="card info-card">
                <div class="card-body">
                  <div class="d-flex align-items-center" style="margin-top : 30px">
                    <!-- <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                      <i class="bi bi-cart"></i>
                    </div> -->
                    <div class="ps-3">
                      <h6>Public</h6>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            
            <div class="col-xxl-4 col-md-6">
              <div class="card info-card">
                <div class="card-body">
                  <div class="d-flex align-items-center" style="margin-top : 30px">
                    <!-- <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                      <i class="bi bi-cart"></i>
                    </div> -->
                    <div class="ps-3">
                      <h6>Private</h6>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            
            <div class="col-xxl-4 col-md-6">
              <div class="card info-card">
                <div class="card-body">
                  <div class="d-flex align-items-center" style="margin-top : 30px">
                    <!-- <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                      <i class="bi bi-cart"></i>
                    </div> -->
                    <div class="ps-3">
                      <h6>QnA</h6>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          
          <!-- 게시판 -->
            <div class="col-md-12" style="height:500px">
              <div class="card top-selling" >

				<!--  filter를 나중에 뒤로가기 버튼으로 변경합시다. -->
                <div class="filter">
                  <a class="icon" href="#" data-bs-toggle="dropdown"><i class="bi bi-three-dots"></i></a>
                  <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
                    <li class="dropdown-header text-start">
                      <h6>CRUD</h6>
                    </li>

                    <li><a class="dropdown-item" href="#">ADD</a></li>
                    <li><a class="dropdown-item" href="#">This Month</a></li>
                  </ul>
                </div>

                <div class="card-body" style="height:500px" >
                  	<div id="clubView"></div>	<!-- 게시판 뷰 -->
                </div>
              </div>
            </div><!-- 게시판 끝-->

          </div>
        </div><!-- End Left side columns -->

        <!-- 채팅창 시작 -->
        <div class="col-lg-4">

          
          <div class="card-body" style="height:50px; margin-bottom:0;">
          	<h1>Chat</h1>
          </div>
          <div class="card" style="height : 200px; margin-bottom:0;" id="chatTable">
            <!-- 채팅 페이지 include -->
            <jsp:include page="chat.jsp"/>	
            
            
            <!-- 추후 랭킹 페이지 -->
            <div class="card" style="height : 200px;">
            	<div class="filter">
              		<a class="icon" href="#" data-bs-toggle="dropdown"><i class="bi bi-three-dots"></i></a>
              		<ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
                		<li class="dropdown-header text-start">
                  			<h6>Filter</h6>
                		</li>

		                <li><a class="dropdown-item" href="#">Today</a></li>
		                <li><a class="dropdown-item" href="#">This Month</a></li>
		                <li><a class="dropdown-item" href="#">This Year</a></li>
              		</ul>
            	</div>
            	<h5 class="card-title">Budget Report <span>| This Month</span></h5>
            	<div id="budgetChart" style="min-height: 400px;" class="echart"></div>
            	<script>
                document.addEventListener("DOMContentLoaded", () => {
                  var budgetChart = echarts.init(document.querySelector("#budgetChart")).setOption({
                    legend: {
                      data: ['Allocated Budget', 'Actual Spending']
                    },
                    radar: {
                      // shape: 'circle',
                      indicator: [{
                          name: 'Sales',
                          max: 6500
                        },
                        {
                          name: 'Administration',
                          max: 16000
                        },
                        {
                          name: 'Information Technology',
                          max: 30000
                        },
                        {
                          name: 'Customer Support',
                          max: 38000
                        },
                        {
                          name: 'Development',
                          max: 52000
                        },
                        {
                          name: 'Marketing',
                          max: 25000
                        }
                      ]
                    },
                    series: [{
                      name: 'Budget vs spending',
                      type: 'radar',
                      data: [{
                          value: [4200, 3000, 20000, 35000, 50000, 18000],
                          name: 'Allocated Budget'
                        },
                        {
                          value: [5000, 14000, 28000, 26000, 42000, 21000],
                          name: 'Actual Spending'
                        }
                      ]
                    }]
                  });
                });
              </script>
            </div>
          </div>
          
          
        </div><!-- End Right side columns -->
      </div>
    </section>

  </main><!-- End #main -->

  <!-- ======= Footer ======= -->
  <footer id="footer" class="footer">
    <div class="copyright">
      &copy; Copyright <strong><span>NiceAdmin</span></strong>. All Rights Reserved
    </div>
    <div class="credits">
      <!-- All the links in the footer should remain intact. -->
      <!-- You can delete the links only if you purchased the pro version. -->
      <!-- Licensing information: https://bootstrapmade.com/license/ -->
      <!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/ -->
      Designed by <a href="#" onclick="test()">BootstrapMade</a>
    </div>
  </footer><!-- End Footer -->

  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

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
