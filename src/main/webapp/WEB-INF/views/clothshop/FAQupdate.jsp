<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../include/header.jsp"%>
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">

<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css"
	rel="stylesheet"
	integrity="sha384-T8Gy5hrqNKT+hzMclPo118YTQO6cYprQmhrYwIiQ/3axmI1hQomh7Ud2hPOy8SP1"
	crossorigin="anonymous">
<!-- 주소 api를 위한 js -->
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="/resources/js/user_update.js"></script>
<title>FAQ update</title>
<body>

	<div class="content py-5  bg-light">
		<div class="container">
			<div class="row">
				<div class="col-md-8 offset-md-2">
					<span class="anchor" id="formUserEdit"></span>
					<!-- form user info -->
					<div class="card card-outline-secondary">
						<div class="card-header">
							<h3 class="mb-0">FAQ 추가하기</h3>
						</div>
					<div class="card-body">
						<form method="post" action="updateFAQ" onsubmit="return finalcheck()">
										
							<div class="form-group row" style="margin-bottom: 0.1rem">
								<label class="col-lg-3 col-form-label form-control-label">제목
									:</label>
								<div class="col-lg-9">
									<textarea class="form-control" rows="3" cols="" name="title"></textarea>
								</div>
									<div class="tip_massage_div">
										<input type="text" value="" class="tip_massage" id="mphone"
											style="width: 250px" tabindex="-1" readonly>
									</div>
							</div>
							<div class="form-group row" style="margin-bottom: 0.1rem">
								<label class="col-lg-3 col-form-label form-control-label">설명
									: </label>
								<div class="col-lg-9">
									<textarea class="form-control" rows="3" cols="" name="content"></textarea>
								</div>
									<div class="tip_massage_div">
										<input type="text" value="" class="tip_massage" id="mphone"
											style="width: 250px" tabindex="-1" readonly>
									</div>
							</div>

							<div class="form-group row" style="float: right">
								<input type="submit" class="btn btn-primary" value="추가">
							</div>
						</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>

<style>

/************* GENERIC  *****************/
a {
	color: #696969;
}

img {
	width: 100%;
}

.twhite {
	color: #fff !important;
}

.twhite a {
	color: #fff !important;
}
/************* Background ****************/
.bglight1 {
	background: #f2f2f2;
}
/************* TOP-HEAD *****************/
.top-head ul li {
	padding-right: 8px;
}
/****************** Navigation **************/
.navbar-toggler {
	border-color: #dd0000;
}

.navbar-toggler-icon {
	background-image:
		url("data:image/svg+xml;charset=utf8,%3Csvg viewBox='0 0 32 32' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath stroke='rgb(221, 0, 0, 0.7)' stroke-width='2' stroke-linecap='round' stroke-miterlimit='10' d='M4 8h24M4 16h24M4 24h24'/%3E%3C/svg%3E");
}
/**************** Banner Slider Carousel **************/
.carousel-inner img {
	width: 100%;
}

.carousel-caption {
	color: #000;
	top: 110px;
	bottom: auto;
	text-align: left;
}

.carousel-caption h1 {
	color: #dd0000;
	background-color: #;
}
/************ Services **************/
.most-car-box:hover {
	background:;
	box-shadow: 0 3px 6px rgba(0, 0, 0, 0.16), 0 3px 6px rgba(0, 0, 0, 0.23);
}
/*********** TABS *******/
.nav-tabs {
	border-bottom: 1px solid #ccc;
}

.nav-tabs .nav-link.active {
	border-bottom: 1px solid #dd0000;
	border-radius: 0px;
}
/**************** Social ICONS ***************/
.social-icons {
	margin: 0;
	padding: 0;
	font-size: 8px;
}

.social {
	margin: 7px 7px 7px 0px;
}

#social-fb:hover {
	color: #3B5998;
	transition: all .25s;
}

#social-tw:hover {
	color: #4099FF;
	transition: all .25s;
}

#social-gp:hover {
	color: #d34836;
	transition: all .25s;
}

#social-em:hover {
	color: #f39c12;
	transition: all .25s;
}

#btnCloseLayer {
	width: 20px !important;
	height: 20px;
}

.addr_search_btn {
	width: 110px;
	height: 30px;
	margin: 5px;
	font-size: 14px;
}

/* 툴팁 실패 -> 인풋박스 밑에 만든 div. 이 안에 인풋있음 */
.tip_massage_div {
	font-size: 12px;
	float: left;
}
/* div안에 있는 인풋들 */
.tip_massage {
	border: none;
	color: red;
}
</style>
<%@ include file="../include/footer.jsp"%>