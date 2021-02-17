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
<title>저리카 | 회원정보 수정 </title>
<body>

	<div class="content py-5  bg-light">
		<div class="container">
			<div class="row">
				<div class="col-md-8 offset-md-2">
					<span class="anchor" id="formUserEdit"></span>
					<!-- form user info -->
					<div class="card card-outline-secondary">
						<div class="card-header">
							<h3 class="mb-0">회원 정보 수정</h3>
						</div>
					<div class="card-body">
						<form method="post" action="user_updateok" onsubmit="return finalcheck()">
										<div class="form-group row">
											<label class="col-lg-3 col-form-label form-control-label">회원
												ID : </label>
											<div class="col-lg-9">
												<input class="form-control" type="text" name="s_id"
													value="<c:out value="${user.s_id}"></c:out>"
													readonly="readonly">
											</div>
										</div>
										<div class="form-group row" style="margin-bottom: 0.1rem">
											<label class="col-lg-3 col-form-label form-control-label">비밀번호
												: </label>
											<div class="col-lg-9">
												<input type="hidden" name="s_pw" value="<c:out value="${user.s_pw}"></c:out>">
												<input class="form-control" type="button"
													value="비밀번호 찾기/변경 바로가기" onclick="location.href='/cutieshop/pwsearch'">
												<div class="tip_massage_div">
													<input type="text" value="" class="tip_massage" id="mpwd"
														style="width: 300px" tabindex="-1" readonly>
												</div>
											</div>
										</div>
							<div class="form-group row" style="margin-bottom: 0.1rem">
								<label class="col-lg-3 col-form-label form-control-label">이름
									:</label>
								<div class="col-lg-9">
									<input class="form-control" type="text" name="name" id="name"
										value="<c:out value="${user.name}"></c:out>">
									<div class="tip_massage_div">
										<input type="text" value="" class="tip_massage" id="mname"
											style="width: 250px" tabindex="-1" readonly>
									</div>
								</div>
							</div>
							<div class="form-group row" style="margin-bottom: 0.1rem">
								<label class="col-lg-3 col-form-label form-control-label">전화번호
									:</label>
								<div class="col-lg-9">
									<input class="form-control" type="text" name="phone" id="phone"
										value="<c:out value="${user.phone}"></c:out>">
									<div class="tip_massage_div">
										<input type="text" value="" class="tip_massage" id="mphone"
											style="width: 250px" tabindex="-1" readonly>
									</div>
								</div>
							</div>
							<div class="form-group row" style="margin-bottom: 0.1rem">
								<label class="col-lg-3 col-form-label form-control-label">이메일
									: </label>
								<div class="col-lg-9">
									<input class="form-control" type="email" name="email"
										id="email" value="<c:out value="${user.email}"></c:out>">
									<div class="tip_massage_div">
										<input type="text" value="" class="tip_massage" id="memail"
											style="width: 250px" tabindex="-1" readonly>
									</div>
								</div>
							</div>
							
							<div class="form-group row" style="margin-bottom: 0.1rem">
								<label class="col-lg-3 col-form-label form-control-label">사업자 번호
									: </label>
								<div class="col-lg-9">
									<input class="form-control" type="text" name="b_no"
										id="b_no" value="<c:out value="${user.b_no}"></c:out>">	
									<div class="tip_massage_div">
										<input type="text" value="" class="tip_massage" id="memail"
											style="width: 250px" tabindex="-1" readonly>
									</div>								
								</div>

							</div>
							
							<div class="form-group row" style="margin-bottom: 0.1rem">
								<label class="col-lg-3 col-form-label form-control-label">상호명
									: </label>
								<div class="col-lg-9">
									<input class="form-control" type="text" name="b_name"
										id="b_name" value="<c:out value="${user.b_name}"></c:out>">	
									<div class="tip_massage_div">
										<input type="text" value="" class="tip_massage" id="memail"
											style="width: 250px" tabindex="-1" readonly>
									</div>								
								</div>

							</div>
							

							<div class="form-group row">
								<label class="col-lg-3 col-form-label form-control-label">주소
									: </label>
								<div class="col-lg-9">
										<input type="text" id="sample6_postcode" placeholder="우편번호">
										<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
										<input type="text" id="sample6_address" name="addr1" value="<c:out value="${user.addr1}"></c:out>"><br>
										<input type="text" id="sample6_detailAddress" name="addr2" value="<c:out value="${user.addr2}"></c:out>">
										<input type="text" id="sample6_extraAddress" name="addr3" value="<c:out value="${user.addr3}"></c:out>">	
								</div>
							</div>

							<div class="form-group row" style="float: right">
								<input type="submit" class="btn btn-primary" value="수정">
							</div>
						</form>
						</div>
					</div>
					<!-- /form user info -->

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