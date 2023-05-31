<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>

  <script src="http://code.jquery.com/jquery-latest.js"></script>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>FHAK Login</title>
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
	<main>
    <div class="container">

      <section class="section register min-vh-100 d-flex flex-column align-items-center justify-content-center py-4">
        <div class="container">
          <div class="row justify-content-center">
            <div class="col-lg-4 col-md-6 d-flex flex-column align-items-center justify-content-center">

              <div class="d-flex justify-content-center py-4">
                <a class="logo d-flex align-items-center w-auto">
                  <img src="assets/img/logo.png" alt="">
                  <span class="d-none d-lg-block">FHAK</span>
                </a>
              </div><!-- End Logo -->

              <div class="card mb-3">

                <div class="card-body">
                <!-- 헤더 -->
                  <div class="pt-4 pb-2">
                    <h5 class="card-title text-center pb-0 fs-4">Login to Your Account</h5>
                    <p class="text-center small">Enter your username & password to login</p>
                  </div>
                  
                  <!-- 로그인 입력받는 스프링 폼 -->
                  <form:form modelAttribute="loginData" action="/loginProc" method="post" class="row g-3 needs-validation">
                  
                  	<!-- 아이디 입력 -->
                    <div class="col-12">
                      <label for="yourUsername" class="form-label">ID</label>
                      <div class="input-group has-validation">
                        <input type="text" name="userId" class="form-control" id="yourUsername" value="${user.userId}" required>
                        <div class="invalid-feedback">Please enter your username.</div>
                      </div>
                    </div>
                    
                    <!-- 비밀번호 입력 -->
                    <div class="col-12">
                      <label for="yourPassword" class="form-label">Password</label>
                      <input type="password" name="userPw" class="form-control" id="yourPassword" required>
                      <div class="invalid-feedback">Please enter your password!</div>
                    </div>
                    
                    <!-- 로그인 버튼 -->
                    <div class="col-12">
                      <button class="btn btn-primary w-100" type="submit">Login</button>
                    </div>
                    
                    <!-- 회원가입 모달 -->
                    <div class="col-12">
                      <p class="small mb-0">Don't have account? <a href="" data-bs-toggle="modal" data-bs-target="#signUpModal">Create an account</a></p>
                    </div>
                    
                    <!-- 로그인 실패 메시지 -->
                    ${alert}
                  </form:form>
                </div>
                
                <!-- Modal을 이용한 회원가입 -->
					<div class="modal fade" id="signUpModal" tabindex="-1">
		                <div class="modal-dialog modal-lg">
		                  <div class="modal-content">
		                    <div class="modal-header">
		                      <h5 class="modal-title">Sign Up</h5>
		                      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		                    </div>
	                    		<form:form class="row g-3 needs-validation" modelAttribute="signupData" action="/signupProc" method="post">
			                    <div class="modal-body">
				                 	<!-- 학번 입력란 -->
				                    <div class="col-12">
				                      <label for="userId" class="form-label">Your Student ID</label>
				                      <input type="text" id="userId" name="userId" value="${user.userId }" class="form-control" required>
				                      <div class="invalid-feedback">Please, enter your Student ID!</div>
				                    </div>
				                    
				                    <!-- 비밀번호 입력란 -->
				                    <div class="col-12">
				                      <label for="userPw" class="form-label">Password</label>
				                      <input type="password" id="userPw" name="userPw" value="${user.userPw }" class="form-control" required>
				                      <div class="invalid-feedback">Please enter your password!</div>
				                    </div>
				                    
				                    <!-- 이름 입력란 -->
				                    <div class="col-12">
				                      <label for="userName" class="form-label">Your Name</label>
				                      <input type="text" id="userName" name="userName" value="${user.userName }" class="form-control" required>
				                      <div class="invalid-feedback">Please, enter your name!</div>
				                    </div>
				                    
				                    <!-- 이메일 입력란 -->
				                    <div class="col-12">
				                      <label for="userEmail" class="form-label">Your Email</label>
				                      <input type="email" id="userEmail" name="userEmail" pattern="[a-zA-Z0-9]+[@][a-zA-Z0-9]+[.]+[a-zA-Z]+[.]*[a-zA-Z]*[.]*[a-zA-Z]*" 
				                      size="40" value="${user.userEmail }"class="form-control" required>
				                      <div class="invalid-feedback">Please enter a valid Email adddress!</div>
				                    </div>
				                    
				                    <!-- 전화번호 입력란 -->
				                    <div class="col-12">
				                     <label for="userPhoneNumber" class="form-label">Phone</label>
				                      <input type="text" id="userPhoneNumber" name="userPhoneNumber" placeholder="하이픈(-)을 제외하고 입력하세요" 
				                      value="${user.userPhoneNumber }" class="form-control" required>
				                      <div class="invalid-feedback">Please enter a valid Phone Number!</div>
				                    </div>
				                    
				                    <!-- 약관 동의란 -->
				                    <div class="col-12">
				                      <div class="form-check">
				                        <input class="form-check-input" name="terms" type="checkbox" value="" id="acceptTerms" required>
				                        <label class="form-check-label" for="acceptTerms">I agree and accept the <a href="#">terms and conditions</a></label>
				                        <div class="invalid-feedback">You must agree before submitting.</div>
				                      </div>
				                    </div>
							        
							     </div>
				                    <div class="modal-footer">
				                      <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
				                      <button type="submit" class="btn btn-primary">Sign Up</button>
				                    </div>
			                    </form:form>
		                  </div>
		                </div>
	              	</div>
              </div>
              
              <!-- Pro 버전 아니면 이거 지우면 혼남 -->
              <div class="credits">
                Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
              </div>
            </div>
          </div>
        </div>

      </section>

    </div>
  </main>

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
  <script src="/assets/js/main.js"></script>

</body>
</html>