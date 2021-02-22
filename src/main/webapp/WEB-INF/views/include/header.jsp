<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String sessId = (String)session.getAttribute("id");
%>
<!DOCTYPE html>
<html lang="UTF-8">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="Content-Type" content="text/html">
<!--  TITLE 삭제 2021.01.12 YHJ 개별 타이틀 속성 제공예정 -->
<script src="https://code.jquery.com/jquery-3.5.1.js" ></script>


<style>
.searchbar {
	margin-bottom: auto;
	margin-top: auto;
	height: 60px;
	background-color: #353b48;
	border-radius: 30px;
	padding: 10px;
}

.search_input {
	color: white;
	border: 0;
	outline: 0;
	background: none;
	width: 0;
	caret-color: transparent;
	line-height: 40px;
	transition: width 0.4s linear;
}

.searchbar:hover>.search_input {
	padding: 0 10px;
	width: 450px;
	caret-color: red;
	transition: width 0.4s linear;
}

.searchbar:hover>.search_icon {
	background: white;
	color: #e74c3c;
}

.search_icon {
	height: 40px;
	width: 40px;
	float: right;
	display: flex;
	justify-content: center;
	align-items: center;
	border-radius: 50%;
	color: white;
	text-decoration: none;
}
.header_area .main_menu .navbar .container .collapse .nav-right{
	display : flex;
	align-items : center;
}
.header_area .main_menu .navbar .container .collapse .nav-right .nav-log .nav-login {
	margin-top : 20px;
	margin-bottom : 20px;
}
</style> 
<link rel="shortcut icon" type="image/x-icon" href="/resources/img/dogshop1.png">
<!-- 파피콘 이미지 수정 2020/01/08 yunhj -->
<link rel="stylesheet"
	href="/resources/vendors/bootstrap/bootstrap.min.css">
<link rel="stylesheet"
	href="/resources/vendors/fontawesome/css/all.min.css">
<link rel="stylesheet"
	href="/resources/vendors/themify-icons/themify-icons.css">
<link rel="stylesheet"
	href="/resources/vendors/nice-select/nice-select.css">
<link rel="stylesheet"
	href="/resources/vendors/owl-carousel/owl.theme.default.min.css">
<link rel="stylesheet"
	href="/resources/vendors/owl-carousel/owl.carousel.min.css">

<link rel="stylesheet" href="/resources/css/style.css">
<script> 
	$.ajax({
		url: '/cutieshop/headerAjax',
		type : 'get',
		dataType : "json",
	    contentType: "application/json; charset=utf-8",
		success:function(data){
			if(data){
				console.log("header if완료완료");
			}else {
				console.log("header else완료");
				$('.nav-login').attr("style","show");
				$('.nav-logout').hide();
			}
		},
		error :function(){
			console.log("실패함");
		},
		complete : function(){
			console.log("ajax통신완료");
		}
	});
</script>
</head>

<body>
	<!--================ Start Header Menu Area =================-->
	<header class="header_area">
		<div class="main_menu">
			<nav class="navbar navbar-expand-lg navbar-light">
				<div class="container">
					<a class="navbar-brand logo_h" href="/cutieshop/productList"><img src="/resources/img/dogshop2.png" alt="로고" style= "width: 70px; height: 70px;"></a>

					<!-- yun.hj 2020.01.07 logo img change & 규격이 상이해서 style 추가 함 -->
					<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<div class="collapse navbar-collapse offset" id="navbarSupportedContent">
						<ul class="nav navbar-nav menu_nav ml-auto mr-auto">
							<li class="nav-item"><a class="nav-link" href="/cutieshop/productList">Shop</a></li>
							<!-- admin과 mypage위치 변경(간격문제) Bomi 2021.01.11 -->
						
							<li class="nav-item"><a class="nav-link" href="/cutieshop/mypage">Mypage</a></li>
	
						</ul>

						<div class="nav-right">
							<ul class="nav-shop">
								<li class="nav-item"><a href="/cutieshop/user/cart"><button><i class="ti-shopping-cart"></i><span class="nav-shop__circle"></span></button></a></li>
							</ul><!-- yun.hj 2020/01/07 장바구니 경로 설정 -->
								<!-- uin.hj 2020/01/08 mypage, home, shop, contact 경로 설정 -->
								<!-- 결로 버그 수정 2021.01.11 hyejeong -->
							<div class="nav-log">
								<div class="nav-login" style="position:relative; visibility:hidden"><a class="button button-header" href="/cutieshop/login" >login</a></div>
								<div class="nav-logout" style="position:relative; left : 0px; top:-50px;"><a class="button button-header"  href="/logoutProcess" >logout</a></div>
							</div>
						</div>
					</div>
				</div>
			</nav>
		</div>
	</header>
</body>