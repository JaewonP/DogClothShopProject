<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<!--================ End Header Menu Area =================-->
<link rel="stylesheet" href="/resources/css/register.css">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
<link rel="icon" href="/favicon.ico" type="image/x-icon">
<!-- 이메일 보내는 js -->
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/emailjs-com@2/dist/email.min.js"></script>
<!-- 주소 api를 위한 js -->
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<title>저리카 | 회원가입 </title>
<!-- ================ start banner area ================= -->
<section class="blog-banner-area" id="category">
	<div class="container h-100">
		<div class="blog-banner">
			<div class="text-center" id="toLogin" style="text-align: center !important;">
				<h1>회원 가입하기</h1>
				<a id="toLogin" href="login" style="">로그인으로 돌아가시겠습니까?</a>				
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
				<div class="login_box_img" style="height:100%; padding:100px; padding-top:120px;">
					<div class="hover">						
						<h4>구매자로 등록하시겠습니까?</h4>
						<a class="button button-account" href="register">구매회원 회원가입</a>	
					</div>
				</div>
			</div>
			<div class="col-lg-6 col-log-6_registerForm">
				<div class="login_form_inner register_form_inner" style="">
					<h3>판매회원 정보를 입력해주세요</h3>
					<form class="row login_form" action="onregister" id="register_form" >
							<div class="col-md-12 form-group">
								<input type="text" class="form-control" id="user_id" name="user_id" placeholder="UserID" onfocus="this.placeholder = ''" onblur="this.placeholder = 'UserID'">
							</div>
							<div class="col-md-12 form-group">
								<input type="text" class="form-control" id="name" name="name" placeholder="Username" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Username'">
							</div>
				              <div class="col-md-12 form-group">				              		
								<span class="input-group-btn" style="display:flex;flex-direction:row;">
									<input style="" type="text" class="form-control" id="password" name="password" placeholder="Password" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Password'"> <button class="btn btn-default" type="button" style="float:right;">Go!</button>
	     						</span>
				              </div>
							<div class="col-md-12 form-group">
								<input type="text" class="form-control" id="phone" name="phone" placeholder="Phone Number" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Phone Number'">
							</div>
							<div class="col-md-12 form-group" style="text-align:initial;">
								<input type="text" id="sample6_postcode" placeholder="우편번호">
								<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
								<input type="text" id="sample6_address" placeholder="주소"><br>
								<input type="text" id="sample6_detailAddress" placeholder="상세주소">
								<input type="text" id="sample6_extraAddress" placeholder="참고항목">
							</div>
							<div class="col-md-12 form-group">
								<span class="input-group-btn" style="display:flex;flex-direction:row;">
									<input type="text" class="form-control" id="email" name="email" placeholder="Email Address" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Email Address'"> <button class="btn btn-default" type="button" style="float:right;">Go!</button>
	     						</span>
				              </div>
				            <div class="col-md-12 form-group">
								<input type="text" class="form-control" id="confirmEmail" name="confirmEmail" placeholder="Confirm Email" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Confirm Email'">
							</div>
							<div class="col-md-12 form-group">
								<div class="creat_account">
									<input type="text" id="b_no" name="b_no" placeholder="사업자등록번호">
									<input type="text" id="b_name" name="b_name" placeholder="상호명">
								</div>
							</div>
							<div class="col-md-12 form-group">
								<button type="submit" value="submit" class="button button-register w-100">Register</button>
							</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</section>

<!--================End Login Box Area =================-->
<%@ include file="../include/footer.jsp"%>
