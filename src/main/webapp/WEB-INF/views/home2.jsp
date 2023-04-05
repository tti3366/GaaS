<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import ="java.util.*, java.text.*" %>
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

	<!--  MAIN PAGE -->
      <li class="nav-item">
        <a class="nav-link " href="index.jsp">
          <i class="bi bi-grid"></i>
          <span>MAIN</span>
        </a>
      </li>

	<!-- 학과 -->
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
      </li><!-- End Components Nav -->

      <li class="nav-item">
        <a class="nav-link collapsed" data-bs-target="#forms-nav" data-bs-toggle="collapse" href="#">
          <i class="bi bi-journal-text"></i><span>Forms</span><i class="bi bi-chevron-down ms-auto"></i>
        </a>
        <ul id="forms-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
          <li>
            <a href="forms-elements.html">
              <i class="bi bi-circle"></i><span>Form Elements</span>
            </a>
          </li>
          <li>
            <a href="forms-layouts.html">
              <i class="bi bi-circle"></i><span>Form Layouts</span>
            </a>
          </li>
          <li>
            <a href="forms-editors.html">
              <i class="bi bi-circle"></i><span>Form Editors</span>
            </a>
          </li>
          <li>
            <a href="forms-validation.html">
              <i class="bi bi-circle"></i><span>Form Validation</span>
            </a>
          </li>
        </ul>
      </li><!-- End Forms Nav -->

      <li class="nav-item">
        <a class="nav-link collapsed" data-bs-target="#tables-nav" data-bs-toggle="collapse" href="#">
          <i class="bi bi-layout-text-window-reverse"></i><span>Tables</span><i class="bi bi-chevron-down ms-auto"></i>
        </a>
        <ul id="tables-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
          <li>
            <a href="tables-general.html">
              <i class="bi bi-circle"></i><span>General Tables</span>
            </a>
          </li>
          <li>
            <a href="tables-data.html">
              <i class="bi bi-circle"></i><span>Data Tables</span>
            </a>
          </li>
        </ul>
      </li><!-- End Tables Nav -->

      <li class="nav-item">
        <a class="nav-link collapsed" data-bs-target="#charts-nav" data-bs-toggle="collapse" href="#">
          <i class="bi bi-bar-chart"></i><span>Charts</span><i class="bi bi-chevron-down ms-auto"></i>
        </a>
        <ul id="charts-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
          <li>
            <a href="charts-chartjs.html">
              <i class="bi bi-circle"></i><span>Chart.js</span>
            </a>
          </li>
          <li>
            <a href="charts-apexcharts.html">
              <i class="bi bi-circle"></i><span>ApexCharts</span>
            </a>
          </li>
          <li>
            <a href="charts-echarts.html">
              <i class="bi bi-circle"></i><span>ECharts</span>
            </a>
          </li>
        </ul>
      </li><!-- End Charts Nav -->

      <li class="nav-item">
        <a class="nav-link collapsed" data-bs-target="#icons-nav" data-bs-toggle="collapse" href="#">
          <i class="bi bi-gem"></i><span>Icons</span><i class="bi bi-chevron-down ms-auto"></i>
        </a>
        <ul id="icons-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
          <li>
            <a href="icons-bootstrap.html">
              <i class="bi bi-circle"></i><span>Bootstrap Icons</span>
            </a>
          </li>
          <li>
            <a href="icons-remix.html">
              <i class="bi bi-circle"></i><span>Remix Icons</span>
            </a>
          </li>
          <li>
            <a href="icons-boxicons.html">
              <i class="bi bi-circle"></i><span>Boxicons</span>
            </a>
          </li>
        </ul>
      </li><!-- End Icons Nav -->

      <li class="nav-heading">Pages</li>

      <li class="nav-item">
        <a class="nav-link collapsed" href="users-profile.html">
          <i class="bi bi-person"></i>
          <span>Profile</span>
        </a>
      </li><!-- End Profile Page Nav -->

      <li class="nav-item">
        <a class="nav-link collapsed" href="pages-faq.html">
          <i class="bi bi-question-circle"></i>
          <span>F.A.Q</span>
        </a>
      </li><!-- End F.A.Q Page Nav -->

      <li class="nav-item">
        <a class="nav-link collapsed" href="pages-contact.html">
          <i class="bi bi-envelope"></i>
          <span>Contact</span>
        </a>
      </li><!-- End Contact Page Nav -->

      <li class="nav-item">
        <a class="nav-link collapsed" href="pages-register.html">
          <i class="bi bi-card-list"></i>
          <span>Register</span>
        </a>
      </li><!-- End Register Page Nav -->

      <li class="nav-item">
        <a class="nav-link collapsed" href="/login">
          <i class="bi bi-box-arrow-in-right"></i>
          <span>Login</span>
        </a>
      </li><!-- End Login Page Nav -->

      <li class="nav-item">
        <a class="nav-link collapsed" href="pages-error-404.html">
          <i class="bi bi-dash-circle"></i>
          <span>Error 404</span>
        </a>
      </li><!-- End Error 404 Page Nav -->

      <li class="nav-item">
        <a class="nav-link collapsed" href="pages-blank.html">
          <i class="bi bi-file-earmark"></i>
          <span>Blank</span>
        </a>
      </li><!-- End Blank Page Nav -->

    </ul>

  </aside><!-- End Sidebar-->

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

        <!-- 채팅창 시작 -->
        <div class="col-lg-4">

          
          <div class="card-body" style="height:50px; margin-bottom:0;">
          	<h1>hello</h1>
          </div>
          <div class="card" style="height : 400px; margin-bottom:0;" id="chatTable">
            
			<!-- 채팅 보이는 부분 -->
            <div class="card-body">
           		<div class="container">
					<table class="table table-bordered" >		
						<tr style="border:none;">
							<td colspan="2" style="border:none;"><div id="chatList"></div></td>
						</tr>		
					</table>
				</div>	
        	</div>	
          </div>
          
          <!-- 내용입력, 연결/종료 버튼 -->
          <div class="card" style="height : 130px; margin-top:0;">
          		<input type="text" name="msg" id="msg" placeholder="대화 내용을 입력하세요." class="form-control" disabled>
          		<button type="button" class="btn btn-default" id="btnConnect">연결</button>
				<button type="button" class="btn btn-default" id="btnDisconnect" disabled>종료</button>
          		
          </div>
          
          <!-- 채팅 스크립트 -->
          <script>
				let userId = '${userInfo.userId }'; //학번
				let userName = '${userInfo.userName}';//이름

				let USER = userName + "(" + userId + ")";//이름 + 학번

				//let url = "ws://146.56.165.103:8080/chatserver"; //채팅 서버 146.56.165.103
				let url="ws://localhost:8080/chatserver";
				//웹 소켓
				let ws;
				

				//연결 버튼 클릭 시	
				$('#btnConnect').click(function() {

					// 연결
					ws = new WebSocket(url);
	
					// 소켓 이벤트 매핑
					// 웹 소켓 연결이 될때(소켓 만들자 마자 메세지 전송하면 실패하기 쉬워서 연결이 되었는지 onopen으로 확인하고 메세지 전송 시작)
					ws.onopen = function(evt) {
	
						//1. 내 채팅 창에 접속했음을 알림
						printMe(USER, '님이 입장했습니다.');
	
						//2. 다른 사람 채팅 창에 내가 접속했음을 알림
						ws.send('1#' + USER + '#');//처음 접속해서 send하면 ws.onmessage가 받아서 처리
	
						//print(userName+"("+userId+")", '님이 입장했습니다.');// 입장할 때 유저명+"입장했습니다" 출력
	
						// 현재 사용자가 입장했다고 서버에게 통지(유저명 전달)
						// -> 1#유저명
	
						//속성
						$('#btnConnect').attr('disabled', true);
						$('#btnDisconnect').attr('disabled', false);
						$('#msg').attr('disabled', false);
						$('#msg').focus();
						
					};

					//send하면 얘가 받아서 처리
					ws.onmessage = function(evt) {
						
						//evt.data--> 1#김가영(22371004)# (처음 접속할 때), 1#김가영(22371004)#메세지 (메세지 전송할때)
						let index = evt.data.indexOf("#", 2); // #을 2번 인덱스 부터 찾으면 맨끝의 #이 찾아짐
		
						let no = evt.data.substring(0, 1); //1
		
						let user = evt.data.substring(2, index);// 유저이름 뽑기
		
						let txt = evt.data.substring(index + 1);//전할 메세지
		
						if (no == '1') {
							print2(user);//다른 클라이언트한테 내가 접속했음을 알림
						} else if (no == '2') {
							print(user, txt);//메세지 전송
						} else if (no == '3') {
							print3(user);//클라이언트 접속 해제 알림
						}
						
						$('#chatTable').scrollTop($('#chatTable').prop('scrollHeight'));
						
					};

					//소켓이 닫힐 때
					ws.onclose = function(evt) {
						console.log('소켓이 닫힙니다.');
					};
	
					//소켓 에러 날 때
					ws.onerror = function(evt) {
						console.log(evt.data);
					};

				});

		
				// 접속했을 때 내 채팅방에 보일 메세지
				function printMe(user, txt) {
					let temp = '';
					temp += '<div align="center" style="margin-bottom:3px;">';
					temp += '[' + user + '] ';
					temp += txt;
					temp += ' <span style="font-size:11px;color:#777;"> </span>';
					temp += '</div>';
		
					$('#chatList').append(temp);//채팅창에 추가
					$('#chatTable').scrollTop($('#chatTable').prop('scrollHeight'));
				}

				//메세지 전송할 때 내 채팅방에 보일 메세지
				function printMe2(user, txt) {
					let temp = '';
		
					temp += '<div align="right" style=" margin-bottom:3px; word-break:break-all;">';
					temp += ' <span style="font-size:11px;color:#777;">'
							+ new Date().toLocaleTimeString() + '</span>';
					temp += " " + txt;
					temp += '</div>';
		
					$('#chatList').append(temp);//채팅창에 추가
					$('#chatTable').scrollTop($('#chatTable').prop('scrollHeight'));
				}

				//메세지 전송할 때 다른 클라이언트 한테 보일 메세지
				function print(user, txt) {
					let temp = '';
					temp += '<div style=" margin-bottom:3px; word-break:break-all;">';
					temp += '[' + user + '] : ';
					temp += txt;
					temp += ' <span style="font-size:11px;color:#777;">'
							+ new Date().toLocaleTimeString() + '</span>';
					temp += '</div>';
		
					$('#chatList').append(temp);//채팅창에 추가
					$('#chatTable').scrollTop($('#chatTable').prop('scrollHeight'));
				}

				// 클라이언트가 접속했다는 것을 다른 클라이언트에 알림		
				function print2(user) {
					let temp = '';
					temp += '<div align="center" style="margin-bottom:3px;">';
					temp += "[" + user + "] 님이 입장했습니다.";
					temp += ' <span style="font-size:11px;color:#777;"> </span>';
					temp += '</div>';
		
					$('#chatList').append(temp);
					$('#chatTable').scrollTop($('#chatTable').prop('scrollHeight'));
				}

				// client 접속 종료
				function print3(user) {
					let temp = '';
					temp += '<div style="margin-bottom:3px;">';
					temp += "'" + user + "' 이(가) 종료했습니다.";
					temp += ' <span style="font-size:11px;color:#777;">'
							+ new Date().toLocaleTimeString() + '</span>';
					temp += '</div>';
		
					$('#chatList').append(temp);
					$('#chatTable').scrollTop($('#chatTable').prop('scrollHeight'));
				}

				//보낼 메세지 입력하고 엔터치면 메세지 전송
				$('#msg').keydown(function() {
					if (event.keyCode == 13) {
		
						//서버에게 메시지 전달
						//2#유저명#메시지
		
						ws.send('2#' + USER + '#' + $(this).val()); //다른 클라이언트에 메세지 전송
						printMe2(USER, $(this).val()); //본인 대화창에 메세지 출력
		
						$('#msg').val('');
						$('#msg').focus();
						
						
					}
				});

				$('#btnDisconnect').click(function() {
					ws.send('3#' + userName + "(" + userId + ")" + '#');
					ws.close();
		
					$('#user').attr('readonly', false);
					$('#user').val('');
		
					$('#btnConnect').attr('disabled', false);
					$('#btnDisconnect').attr('disabled', true);
		
					$('#msg').val('');
					$('#msg').attr('disabled', true);
				});
			</script>
			<!-- 채팅 스크립트 끝 -->
			

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
      Designed by <a href="#" onclick="test()">BootstrapMade</a>
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
