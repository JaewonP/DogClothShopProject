<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<%@ include file="../include/header.jsp"%>

<title>강아지 옷가게 | 상품 디테일</title>
<link rel="stylesheet" href="/resources/vendors/linericon/style.css">
<style>
.video-container {
position: relative;
padding-bottom: 56.25%;
padding-top: 30px;
height: 0;
overflow: hidden;

    text-align: center;
    margin-top: 20px;
    margin-bottom: 40px;
}

.video-container iframe,
.video-container object,
.video-container embed {
position: absolute;
top: 0;
left: 0;
width: 100%;
height: 100%;
}

.entry-content img,
.entry-content iframe,
.entry-content object,
.entry-content embed {
max-width: 100%;
}
</style>
<!-- ================ start banner area ================= -->
<section class="blog-banner-area" id="blog">
<img class="img-fluid" src="/resources/img/cart/dogBanner.jpg" alt="배너"
		style="position: absolute; top: 0; left: 0; width: 100%; height: 100%" />
	<div class="container h-100">
		<div class="blog-banner">
			<div class="text-center">
				<h1>Shop Single</h1>
				<nav aria-label="breadcrumb" class="banner-breadcrumb">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="#">Home</a></li>
						<li class="breadcrumb-item active" aria-current="page">Shop
							Single</li>
					</ol>
				</nav>
			</div>
		</div>
	</div>
</section>
<!-- ================ end banner area ================= -->


<!--================Single Product Area =================-->
<div class="product_image_area">
	<div class="container">
		<div class="row s_product_inner">
			<div class="col-lg-6">
				<div class="owl-carousel owl-theme s_Product_carousel">
					<div class="single-prd-item">
						<img class="img-fluid" src="/resources/img/product/${product.img1}"
							onerror="this.src='/resources/img/noimage.gif'">
					</div>

				</div>
			</div>
			<div class="col-lg-5 offset-lg-1">

				<div class="s_product_text">
					<h3>
						<c:out value="${product.p_name}" />
					</h3>
					<h2>
						<fmt:formatNumber type="number" value="${product.amount}" />
						원
					</h2>
					<ul class="list">
						<li><span>카테고리 </span> : ${product.c_name }</li>
					</ul>
					<div class="card_area d-flex align-items-center">
					
						<div class="product_count"
							style="margin-top: 20px; float: left; vertical-align: middle;">
							
							<label for="qty" style="margin-top:10px;float: left">수량 : </label> 
							<input
								type="number" min="1" name="qty" id="sst" size="2" maxlength="12"
								value="1" title="Quantity" class="input-text qty"
								style="margin-top:8px;float: left"> 
							
							
						</div>
					</div>
				</div><div>
						<div>
							<button class="button primary-btn btn-shopping-cart"
								style="float: left; margin-left: 30px; background-color: blue;">장바구니</button>
						</div></div>
						
			</div>
		</div>
	</div>
</div>
<!--================End Single Product Area =================-->

<!--================Product Description Area =================-->
<section class="product_description_area">
	<div class="container">
		<ul class="nav nav-tabs" id="myTab" role="tablist">
			<li class="nav-item">상세설명</li>
			
		</ul>
		<div class="tab-content" id="myTabContent">
			<div>
				
				<c:if test="${product.video != null && product.video != ''}">
					<div class = "video-container">
						<iframe width="560" height="315" src="${product.video}" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
					</div>
				</c:if>
				
				${product.discribe}
				
				
			</div>
		</div>
	</div>
</section>
<!-- Modal -->
<div class="modal fade" id="notice" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLongTitle">알림</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">...</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
				<div id = "cart-btn-area"></div>
			</div>
		</div>
	</div>
</div>
<!-- Modal end -->

<!--================End Product Description Area =================-->

<%@ include file="../include/footer.jsp"%>
<script>
function clickEvent(){
	//장바구니 추가 이벤트
	let btnShoppingCart = $(".btn-shopping-cart");
	btnShoppingCart.click(function(){
		var p_no = getP_no();
		let quantity = $(".product_count").children("input").val();
		console.log(quantity);
		addCartEvent(p_no,quantity);
	})
	
}
function getUserId(){ //유저아이디 getter
	var u_id = '<c:out value="${userId}"></c:out>'; //js파일에서 읽히지 않는다. jstl임포트 불가능 (해결방안 : js파일을 jsp로 변환 or json을 이용)
	console.log("u_id : " + u_id);
	return u_id;
}
function getP_no(){
	let p_no = "${product.p_no}";
	return p_no;
}
function getS_id(){
	let s_id = "${product.s_id}";
	return s_id;
}

function getSellerCheck(){
	let sellerCheck = "${role_name}"
	console.log("sellerCheck : " +  sellerCheck);
	if(sellerCheck == '[USER]'){
		return false;
	}else if(sellerCheck == '[SELLER]') {
		return true;
	}
}

$(document).ready(function() {
					clickEvent();
					let u_id = "${user.id}";
					let seller ="${user.seller}";
					let seller_id = "${product.s_id}";
					let p_no = "${product.p_no}";
					let s_id = "${product.s_id}";
					let list = $("#ask");
					let text = '';
				

		
			
})
	 function addCartEvent(p_no,quantity) { //장바구니
			let userId = getUserId();
			
			if(loginTypeCheck()){ // 비회원, 판매자 아이디면 각각상황에 따른 모달창을 띄워준다.
				return false;
			}
			console.log("굳");

			var url = '/cutieshop/product/addcart';
			
			$.ajax({
				url : url, //컨트롤러 주소
				type : 'POST', //메소드 방식
				data : { //넘겨줄 데이터
					"u_id" : userId, // "넘겨줄 데이터 이름(key) : 넘겨줄 값(value)"
					"p_no" : p_no,
					"quantity":quantity
				},
				dataType : 'JSON', //데이터 방식? json방식으로 데이터를 넘겨줘요 
				success : function(stats) {
					console.log(stats);
					$(".modal-body").html("\""+getUserId() + "\"님 장바구니에 넣었습니다.");
					
					$("#cart-btn-area").html(`<button type="button" onClick="location.href='/cutieshop/user/cart'"
													class="btn btn-primary" data-dismiss="modal">장바구니로 이동</button>`);
					$('#notice').modal('show');

					
				},
				error : function(e) {
					console.log("장바구니 통신실패");
				}
			})
		}
		
	function sessoinExistenceChecked(){
		let userId = getUserId();
		if(userId === "" || typeof userId === "undefined" || userId === null){
			
			return true;
		}
		return false;
	}
	function loginTypeCheck(){
		
		let result = false;
		if(sessoinExistenceChecked()){
			$("#notice .modal-body").html("로그인 후 이용해주세요.");
			$("#cart-btn-area").empty();
			$('#notice').modal('show');
			result = true;
		}else if(getSellerCheck()){
			$("#notice .modal-body").html("판매자는 이용할수 없습니다. 일반유저 로그인 후 이용해주세요.");
			$("#cart-btn-area").empty();
			$('#notice').modal('show');
			result = true;
		}
		return result;
	}
</script>
