<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import ="java.util.*, java.text.*" %>
<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>FHAK</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="assets/img/logo.png" rel="icon">
  <link href="assets/img/logo.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.gstatic.com" rel="preconnect">
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="assets/vendor/quill/quill.snow.css" rel="stylesheet">
  <link href="assets/vendor/quill/quill.bubble.css" rel="stylesheet">
  <link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="assets/vendor/simple-datatables/style.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="css/style.css" rel="stylesheet">

  <!-- =======================================================
  * Template Name: NiceAdmin
  * Updated: Mar 09 2023 with Bootstrap v5.2.3
  * Template URL: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
</head>

<body>

  <!-- ======= Header ======= -->
  <header id="header" class="header fixed-top d-flex align-items-center">

    <div class="d-flex align-items-center justify-content-between">
      <a href="index.html" class="logo d-flex align-items-center">
        <img src="assets/img/logo.png" alt="">
        <span class="d-none d-lg-block">FHAK</span>
      </a>
      <i class="bi bi-list toggle-sidebar-btn"></i>
    </div><!-- End Logo -->

    <nav class="header-nav ms-auto">
      <ul class="d-flex align-items-center">
        <li class="nav-item dropdown pe-3">
          <a class="nav-link nav-profile d-flex align-items-center pe-0" href="#" data-bs-toggle="dropdown">
            <span class="d-none d-md-block dropdown-toggle ps-2">UserName</span>
          </a>

		<!-- 유저 정보  -->
          <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile">
            <li class="dropdown-header">
              <h6>UserName</h6>
              <span>MemberId</span>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>

            <li>
              <a class="dropdown-item d-flex align-items-center" href="users-profile.html">
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
              <a class="dropdown-item d-flex align-items-center" href="#">
                <i class="bi bi-box-arrow-right"></i>
                <span>Sign Out</span>
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
        <a class="nav-link " href="home.jsp">
          <i class="bi bi-grid"></i>
          <span>HOME</span>
        </a>
      </li>
      
      <li class="nav-item">
        <a class="nav-link collapsed" href="/login">
          <i class="bi bi-box-arrow-in-right"></i>
          <span>Login</span>
        </a>
      </li><!-- End Login Page Nav -->

      <li class="nav-heading">Major</li>

	<!-- 학과 -->
	  <li class="nav-item">
        <a class="nav-link collapsed" data-bs-toggle="collapse" href="#ME">
          <i class="bi bi-menu-button-wide"></i><span>Mechanical Engineering</span><i class="bi bi-chevron-down ms-auto"></i>
        </a>
        <ul id="ME" class="nav-content collapse " data-bs-parent="#sidebar-nav">
        <!--  동아리 -->
        <!-- c:foreach로 CLUB 테이블에서 가져와서 해당하는 번호만큼 생성 ex) 전기 - 1번 -->
          <c:forEach items="${clubSW}" var="club">
             <li>
               <a href="/${club}">
                 <i class="bi bi-circle"></i>
                    <span>${club}</span>
               </a>
             </li>
          </c:forEach>
        </ul>
      </li>
      
      <li class="nav-item">
        <a class="nav-link collapsed" data-bs-toggle="collapse" href="#E">
          <i class="bi bi-menu-button-wide"></i><span>Electrical Engineering</span><i class="bi bi-chevron-down ms-auto"></i>
        </a>
        <ul id="E" class="nav-content collapse " data-bs-parent="#sidebar-nav">
        <!--  동아리 -->
        <!-- c:foreach로 CLUB 테이블에서 가져와서 해당하는 번호만큼 생성 ex) 전기 - 1번 -->
          <c:forEach items="${clubSW}" var="club">
             <li>
               <a href="/${club}">
                 <i class="bi bi-circle"></i>
                    <span>${club}</span>
               </a>
             </li>
          </c:forEach>
        </ul>
      </li>
      
      <li class="nav-item">
        <a class="nav-link collapsed" data-bs-toggle="collapse" href="#SW">
          <i class="bi bi-menu-button-wide"></i><span>Smart Software</span><i class="bi bi-chevron-down ms-auto"></i>
        </a>
        <ul id="SW" class="nav-content collapse " data-bs-parent="#sidebar-nav">
        <!--  동아리 -->
        <!-- c:foreach로 CLUB 테이블에서 가져와서 해당하는 번호만큼 생성 ex) 전기 - 1번 -->
          <c:forEach items="${clubSW}" var="club">
             <li>
               <a href="/${club}">
                 <i class="bi bi-circle"></i>
                    <span>${club}</span>
               </a>
             </li>
          </c:forEach>
        </ul>
      </li>
      
      <li class="nav-item">
        <a class="nav-link collapsed" data-bs-toggle="collapse" href="#SE">
          <i class="bi bi-menu-button-wide"></i><span>Smart Mechanical Engineering</span><i class="bi bi-chevron-down ms-auto"></i>
        </a>
        <ul id="SE" class="nav-content collapse " data-bs-parent="#sidebar-nav">
        <!--  동아리 -->
        <!-- c:foreach로 CLUB 테이블에서 가져와서 해당하는 번호만큼 생성 ex) 전기 - 1번 -->
          <c:forEach items="${clubSW}" var="club">
             <li>
               <a href="/${club}">
                 <i class="bi bi-circle"></i>
                    <span>${club}</span>
               </a>
             </li>
          </c:forEach>
        </ul>
      </li>
      
      <li class="nav-item">
        <a class="nav-link collapsed" data-bs-toggle="collapse" href="#EE">
          <i class="bi bi-menu-button-wide"></i><span>Electrical Electronic Engineering</span><i class="bi bi-chevron-down ms-auto"></i>
        </a>
        <ul id="EE" class="nav-content collapse " data-bs-parent="#sidebar-nav">
        <!--  동아리 -->
        <!-- c:foreach로 CLUB 테이블에서 가져와서 해당하는 번호만큼 생성 ex) 전기 - 1번 -->
          <c:forEach items="${clubSW}" var="club">
             <li>
               <a href="/${club}">
                 <i class="bi bi-circle"></i>
                    <span>${club}</span>
               </a>
             </li>
          </c:forEach>
        </ul>
      </li>
      <!-- 전공 동아리 끝 -->

      

      <li class="nav-heading">Common</li>

      <li class="nav-item">
        <a class="nav-link collapsed" href="users-profile.html">
          <i class="bi bi-person"></i><!-- 아이콘 모양 설정 -->
          <span>Futsal</span>
        </a>
      </li><!-- End Profile Page Nav -->

      <li class="nav-item">
        <a class="nav-link collapsed" href="pages-faq.html">
          <i class="bi bi-question-circle"></i>
          <span>Basketball</span>
        </a>
      </li><!-- 교양 동아리 끝 -->

    </ul>

  </aside><!-- 사이드바 끝 -->

  <main id="main" class="main">
    <section class="section dashboard">
      <div class="row">
        <!-- Left side columns -->
        <div class="col-lg-8">
          <div class="row">
          
          <% for(int i = 0 ; i<3; i++){ %>
           <!-- 회원 게시판-->
            <div class="col-xxl-4 col-md-6">
              <div class="card info-card">
                <div class="card-body">
                  <div class="d-flex align-items-center" style="margin-top : 30px">
                    <!-- <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                      <i class="bi bi-cart"></i>
                    </div> -->
                    <div class="ps-3">
                      <h6><%= i %> Button</h6>
                    </div>
                  </div>
                </div>
              </div>
            </div>
			<%} %>
          
          <!-- 게시판 -->
            <div class="col-md-12" style="height:500px">
              <div class="card top-selling" >

				<!--  filter를 나중에 뒤로가기 버튼으로 변경합시다. -->
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

                <div class="card-body" style="height:500px" >
                  <h5 class="card-title">게시판 성격에 따라 변하게</h5>

                  <table class="table table-borderless" >
                    <thead>
                      <tr style="text-align:center">
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
	                            <th scope="row" style="text-align:center">1</th>
	                            <td><a href="#" class="text-primary fw-bold">Test</a></td>
	                            <td style="text-align:center">고명준</td>
	                            <td style="text-align:center"><%=str  %></td>
	                            <td class="fw-bold" style="text-align:center">124</td>
	                        </tr>
                    </tbody>
                  </table>
                </div>
              </div>
            </div><!-- 게시판 끝-->

          </div>
        </div><!-- End Left side columns -->

        <!-- Right side columns -->
        <div class="col-lg-4">

          <!-- Recent Activity -->
          <div class="card" style="height : 400px;">
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

            <div class="card-body">
              <h5 class="card-title">Recent Activity <span>| Today</span></h5>

              <div class="activity">

                <div class="activity-item d-flex">
                  <div class="activite-label">32 min</div>
                  <i class='bi bi-circle-fill activity-badge text-success align-self-start'></i>
                  <div class="activity-content">
                    Quia quae rerum <a href="#" class="fw-bold text-dark">explicabo officiis</a> beatae
                  </div>
                </div><!-- End activity item-->

                <div class="activity-item d-flex">
                  <div class="activite-label">56 min</div>
                  <i class='bi bi-circle-fill activity-badge text-danger align-self-start'></i>
                  <div class="activity-content">
                    Voluptatem blanditiis blanditiis eveniet
                  </div>
                </div><!-- End activity item-->

                <div class="activity-item d-flex">
                  <div class="activite-label">2 hrs</div>
                  <i class='bi bi-circle-fill activity-badge text-primary align-self-start'></i>
                  <div class="activity-content">
                    Voluptates corrupti molestias voluptatem
                  </div>
                </div><!-- End activity item-->

                <div class="activity-item d-flex">
                  <div class="activite-label">1 day</div>
                  <i class='bi bi-circle-fill activity-badge text-info align-self-start'></i>
                  <div class="activity-content">
                    Tempore autem saepe <a href="#" class="fw-bold text-dark">occaecati voluptatem</a> tempore
                  </div>
                </div><!-- End activity item-->

                <div class="activity-item d-flex">
                  <div class="activite-label">2 days</div>
                  <i class='bi bi-circle-fill activity-badge text-warning align-self-start'></i>
                  <div class="activity-content">
                    Est sit eum reiciendis exercitationem
                  </div>
                </div><!-- End activity item-->

                <div class="activity-item d-flex">
                  <div class="activite-label">4 weeks</div>
                  <i class='bi bi-circle-fill activity-badge text-muted align-self-start'></i>
                  <div class="activity-content">
                    Dicta dolorem harum nulla eius. Ut quidem quidem sit quas
                  </div>
                </div><!-- End activity item-->

              </div>

            </div>
          </div><!-- End Recent Activity -->

          <!-- Budget Report -->
          <div class="card" style="height : 193px;">
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

            <div class="card-body pb-0">
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
          </div><!-- End Budget Report -->
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
      Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
    </div>
  </footer><!-- End Footer -->

  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <!-- Vendor JS Files -->
  <script src="assets/vendor/apexcharts/apexcharts.min.js"></script>
  <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="assets/vendor/chart.js/chart.umd.js"></script>
  <script src="assets/vendor/echarts/echarts.min.js"></script>
  <script src="assets/vendor/quill/quill.min.js"></script>
  <script src="assets/vendor/simple-datatables/simple-datatables.js"></script>
  <script src="assets/vendor/tinymce/tinymce.min.js"></script>
  <script src="assets/vendor/php-email-form/validate.js"></script>

  <!-- Template Main JS File -->
  <script src="assets/js/main.js"></script>

</body>

</html>
