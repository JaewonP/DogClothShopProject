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
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10.13.0/dist/sweetalert2.all.min.js"></script>
<script type="text/javascript" src="/resources/js/register.js"></script>
<title>강아지 옷가게 | 회원가입 </title>
<!-- ================ start banner area ================= -->
<section class="blog-banner-area" id="category">
	<div class="container h-100">
		<div class="blog-banner">
			<div class="text-center" id="toLogin" style="text-align: center !important;">
				<h1>회원 가입하기</h1>
				<a id="toLogin" href="/cutieshop/login" style="">로그인으로 돌아가시겠습니까?</a>				
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
						<h4>판매자로 등록하시겠습니까?</h4>
						<a class="button button-account" href="register_seller">판매회원 회원가입</a>	
					</div>
				</div>
			</div>
			<div class="col-lg-6 col-log-6_registerForm">
				<div class="login_form_inner register_form_inner" style="">
					<h3>구매회원 정보를 입력해주세요</h3>
					<form class="row login_form" action="register" id="register_form" method="post">
							<div class="col-md-12 form-group" style="margin-bottom:1px">
								<span class="input-group-btn" style="display:flex;flex-direction:row;">		
									<input style="" type="text" class="form-control" id="user_id" name="u_id" placeholder="UserID" onfocus="this.placeholder = ''" onblur="this.placeholder = 'UserID'"> <button class="btn btn-default" id="idok" type="button" style="float:right;">확인</button>
	     						</span>							
	     					</div>
	     					<div class="textMessageBox" style="padding-left:15px">
								<input type="text" id="idok_mid" style="width:200px; height:20px; border:none;" readonly>
							</div>
							<div class="col-md-12 form-group">
								<input type="text" class="form-control" id="name" name="name" placeholder="Username" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Username'">
							</div>
				            <div class="col-md-12 form-group" style="margin-bottom:1px">				              		
								<span class="input-group-btn" style="display:flex;flex-direction:row;">
									<input style="" type="text" class="form-control" id="password" name="u_pw" placeholder="Password" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Password'"> <button class="btn btn-default" id="pwok" type="button" style="float:right;">확인</button>
	     						</span>
				            </div>
				            <div class="textMessageBox" style="padding-left:15px">
								<input type="text" id="pwok_mid" style="width:1000px; height:20px; border:none;" readonly>
							</div>  
							<div class="col-md-12 form-group">
								<input type="text" class="form-control" id="phone" name="phone" placeholder="Phone Number" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Phone Number'">
							</div>
							<div class="col-md-12 form-group" style="text-align:initial;">
								<input type="text" id="sample6_postcode" placeholder="우편번호">
								<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
								<input type="text" id="sample6_address" name="addr1" placeholder="주소"><br>
								<input type="text" id="sample6_detailAddress" name="addr2" placeholder="상세주소">
								<input type="text" id="sample6_extraAddress" name="addr3" placeholder="참고항목">
							</div>
							<div class="col-md-12 form-group" style="margin-bottom:1px">
								<span class="input-group-btn" style="display:flex;flex-direction:row;">
									<input type="text" class="form-control" id="email" name="email" placeholder="Email Address" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Email Address'"> <button class="btn btn-default" id="emailok" type="button" style="float:right;">인증 보내기</button>
	     						</span>
				              </div>
				            <div class="textMessageBox" style="padding-left:15px">
								<input type="text" id="emailok_mid" style="width:1000px; height:20px; border:none;" readonly>
							</div>				              
				            <div class="col-md-12 form-group" style="margin-bottom:1px; display:flex; flex-direction:row;" >
								<input type="text" class="form-control" id="confirmEmail" name="confirmEmail" placeholder="Confirm Email code" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Confirm Email code'"> <button class="btn btn-default" id="codeok" type="button" style="float:right;">확인</button>
							</div>
							<div class="textMessageBox" style="padding-left:15px">
								<input type="text" id="codeok_mid" style="width:200px; height:20px; border:none;" readonly>
							</div>
							<div class="col-md-12 form-group">
								<button type="button" value="submit" class="button button-register w-100">Register</button>
							</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<script>
	 function sample6_execDaumPostcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var addr = ''; // 주소 변수
	                var extraAddr = ''; // 참고항목 변수

	                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    addr = data.roadAddress;
	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    addr = data.jibunAddress;
	                }

	                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	                if(data.userSelectedType === 'R'){
	                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있고, 공동주택일 경우 추가한다.
	                    if(data.buildingName !== '' && data.apartment === 'Y'){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                    if(extraAddr !== ''){
	                        extraAddr = ' (' + extraAddr + ')';
	                    }
	                    // 조합된 참고항목을 해당 필드에 넣는다.
	                    document.getElementById("sample6_extraAddress").value = extraAddr;
	                
	                } else {
	                    document.getElementById("sample6_extraAddress").value = '';
	                }

	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById('sample6_postcode').value = data.zonecode;
	                document.getElementById("sample6_address").value = addr;
	                // 커서를 상세주소 필드로 이동한다.
	                document.getElementById("sample6_detailAddress").focus();
	            }
	        }).open();
	    }
	
	</script>
	
</section>

<!--================End Login Box Area =================-->
<%@ include file="../include/footer.jsp"%>
