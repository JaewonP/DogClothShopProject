<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
	<!--================ End Header Menu Area =================-->
<!DOCTYPE html>
<html lang="UTF-8">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="Content-Type" content="text/html">
<title>저리카 | Login </title>
<script src="https://kit.fontawesome.com/faeeff50dd.js" crossorigin="anonymous"></script>
<script src = " https://unpkg.com/sweetalert/dist/sweetalert.min.js " ></script>     <!-- sweetAlert -->
<script src="https://code.jquery.com/jquery-3.5.1.js" ></script>
<style>
.login_box_area .container .row .col-lg-6 .login_form_inner .login_form .message {
	margin-left : 260px;
	margin-top : -23px;
}
.login_box_area .container .row .col-lg-6 .login_form_inner .login_form .message .idmessage{

	width : 130px;
	color : red;
	border : none;
	border-radius : 10px;
	font-size : 12px;
}
.login_box_area .container .row .col-lg-6 .login_form_inner .login_form .message2 {
	margin-left : 170px;
	margin-top : -23px;
}
.login_box_area .container .row .col-lg-6 .login_form_inner .login_form .message2 .pwmessage{

	width : 500px;
	color : red;
	border : none;
	border-radius : 10px;
	font-size : 12px;
}

</style>
</head>
  <!-- ================ start banner area ================= -->	
  <body>
	<section class="blog-banner-area" id="category">
		<div class="container h-100">
			<div class="blog-banner">
				<div class="text-center">
					<h1>Login</h1>
					<nav aria-label="breadcrumb" class="banner-breadcrumb">
            <ol class="breadcrumb">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active" aria-current="page">Login</li>
            </ol>
          </nav>
				</div>
			</div>
    </div>
	</section>
	<!-- ================ end banner area ================= -->

	<!--================Login Box Area =================-->
	<section class="login_box_area section-margin">
		<div class="container">
			<div class="row">
				<div class="col-lg-6">
					<div class="login_box_img">
						<div class="hover">
							<h4>회원가입 하시겠습니까?</h4>
							<a class="button button-account" href="register">회원가입 바로가기</a>
						</div>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="login_form_inner">
						<h3>Sign in</h3>
						<form class="row login_form" action="/loginProcess" id="contactForm" method="post">
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
							<div class="col-md-12 form-group">
								<input type="text" class="form-control" id="id" name="id" placeholder="UserID" onfocus="this.placeholder = ''" onblur="">
							</div>
							<div class="col-md-12 form-group">
								<input type="password" class="form-control" id="pw" name="pw" placeholder="Password" onfocus="this.placeholder = ''" onblur="">
							</div>
							<div class="message2">
								<input type="text" id="pwmessage" class="pwmessage" tabindex="-1" value="${errorMessage}" readonly>
							</div>
							<div class="col-md-12 form-group">

							</div>
							<div class="col-md-12 form-group">
								<button type="submit" class="button button-login w-100">Log In</button>
								<a href="/cutieshop/pwsearch">Forgot Password?</a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
	<!--================End Login Box Area =================-->


	
<%@ include file="../include/footer.jsp"%>