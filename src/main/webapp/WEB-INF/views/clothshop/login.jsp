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
<script type="text/javascript"></script>	
<script>
	function submitLogin(){              //제대로 입력된 id,pw를 컨트롤러로 보내는 메서드
		var id = $('#id').val();   
		var pw = $('#pw').val();  
		$.ajax({
	        url: '/carshop/login',
	        type : 'post',
	        async : false,				 //동기적통신을 위해 false처리
	        dataType : "json",
	         contentType: "application/json; charset=utf-8",
	         data : JSON.stringify({
	            'id' : id,
	            'pw' : pw,
	            }),
	        success:function(data){
	           if(data == "-1"){  				  //로그인에 실패할 경우
	              preventDefault;
	           }else if(data == "1"){	
	              console.log("관리자로 로그인 성공");
	              location.href="/carshop/index";  //로그인 성공시 해당세션을 갖고 로그인
	           }else if(data == "2"){
	              console.log("회원으로 로그인 성공");
	              location.href="/carshop/index";  //로그인 성공시 해당세션을 갖고 로그인
	           }
	        },
	        error :function(){
	           console.log("실패함");
	        }
	  });// ajax
	};// submitLogin
function showSwal(){
	
	//ajax순서대로 id,pw를 각각 db와 비교하기 위함
	var id = $('#id').val();   
	var pw = $('#pw').val();  
	
	$.ajax({						//로그인 ID칸에 입력된 값이 가입되어있는지 확인
		url: '/carshop/onlyId',
		type : 'post',
		async : false,				//동기통신(false) : ajax통신을 순서대로 처리하기위함
		dataType : "json",
	    contentType: "application/json; charset=utf-8",
	    data : JSON.stringify({
	    	'id' : id,
	    	}),
		success:function(data){
			if(data == "-1"){
				$('#idmessage').attr("type","text").css("color","red");  //입력된 id값이 틀릴경우 뜨는 안내문구
				 preventDefault;
			}
		},
		error :function(){
			console.log("아이디만 가져오기 성공");
		}
	});  //ajax

	$.ajax({						//로그인 ID,PW칸에 입력된 값이 가입되어있는지 확인
			url: '/carshop/onlyPw',
			type : 'post',
			async : false,			//동기통신(false) : ajax통신을 순서대로 처리하기위함
			dataType : "json",
		    contentType: "application/json; charset=utf-8", 
		    data : JSON.stringify({
		    	'id' : id,
		    	'pw' : pw,
		    	}),
			success:function(data){
				console.log("success 들어옴")
				if(data == "-1"){
					$('#pwmessage').attr("type","text").css("color","red");  //입력된 pw값이 틀릴경우 뜨는 안내문구
					preventDefault;
				}
				else if(data=="2"){
					submitLogin();   //id,pw이 db와 일치할경우 submitLogin메서드로 이동
				}
			},
			error :function(){
				console.log("pw만 가져오기 통신실패");
			}
	});   //ajax
	
};//showSwal

</script>	
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
	margin-left : 190px;
	margin-top : -23px;
}
.login_box_area .container .row .col-lg-6 .login_form_inner .login_form .message2 .pwmessage{

	width : 180px;
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
							<h4>New to our website?</h4>
							<a class="button button-account" href="register">Create an Account</a>
						</div>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="login_form_inner">
						<h3>Log in to enter</h3>
						<form class="row login_form" action="" id="contactForm" method="post">
							<div class="col-md-12 form-group">
								<input type="text" class="form-control" id="id" name="id" placeholder="UserID" onfocus="this.placeholder = ''" onblur="">
							</div>
							<div class="message">
								<input type="hidden" id="idmessage" class="idmessage" tabindex="-1" value="ID를 확인해주세요" readonly>
							</div>
							<div class="col-md-12 form-group">
								<input type="password" class="form-control" id="pw" name="pw" placeholder="Password" onfocus="this.placeholder = ''" onblur="">
							</div>
							<div class="message2">
								<input type="hidden" id="pwmessage" class="pwmessage" tabindex="-1" value="영문/숫자조합 8~15자리로 입력" readonly>
							</div>
							<div class="col-md-12 form-group">

							</div>
							<div class="col-md-12 form-group">
								<button type="button" onclick="showSwal()" class="button button-login w-100">Log In</button>
								<a href="pwsearch">Forgot Password?</a>
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