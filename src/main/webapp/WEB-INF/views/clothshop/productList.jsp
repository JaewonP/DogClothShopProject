<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../include/header.jsp"%>

<title>강아지 옷가게 | 상품 카테고리</title>
<link rel="stylesheet" href="/resources/vendors/linericon/style.css">
<link rel="stylesheet"
	href="/resources/vendors/nouislider/nouislider.min.css">

<style>
.card-product__imgOverlay li button:hover .ti-heart {
	margin: 0;
	width: 15px;
	height: 15.2px;
	background-size: cover;
	background-position: center;
	background-image: url(/resources/img/heart/heart_white_full.png);
}

.heart_white_full {
	margin: 0;
	width: 15px;
	height: 15.2px;
	background-size: cover;
	background-position: center;
	background-image: url(/resources/img/heart/heart_white_full.png);
}

.filter-bar {
	background: lightgoldenrodyellow;
}

.option p {
    margin-bottom: 0;
    font-size: 16px;
    font-weight: bold;
}

#selectOK {
    
    float: right;
    font-size: 18px;
    background: white;
    font-weight: bold;
    cursor:pointer;
}

.option {
	width : 100%;
}
</style>

<!-- ================ start banner area ================= -->
<section class="blog-banner-area" id="category">
	<img class="img-fluid" src="/resources/img/cart/dogBanner.jpg" alt="배너"
		style="position: absolute; top: 0; left: 0; width: 100%; height: 100%" />
	<div class="container h-100">
		<div class="blog-banner">
			<div class="text-center">
				<h1></h1>
				<nav aria-label="breadcrumb" class="banner-breadcrumb"></nav>
			</div>
		</div>
	</div>
</section>
<!-- ================ end banner area ================= -->


<!-- ================ category section start ================= -->
<section class="section-margin--small mb-5">
	<div class="container">
		<div class="row" style="justify-content: center" id="tt">
			<div class="col-xl-9 col-lg-8 col-md-7"
				style="justify-content: center">
				<!-- search bar start -->
				<div class="filter-bar d-flex flex-wrap align-items-center"
					style="margin-bottom: 10px">
						<!-- 검 색 창 -->
						<div>
							<div class="input-group filter-bar-search">
								<input type="text" id="search-input-box" placeholder="Search">
								<div class="input-group-append">
									<button type="button" onClick="searchProduct()">
										<i class="ti-search"></i>
									</button>
								</div>
							</div>
						</div>
				</div>
				<!-- Start Filter Bar -->
				<div class="filter-bar d-flex flex-wrap align-items-center">
					<!-- <form method="get" action="filter" id="optionForm"> -->
							<!-- 옵션 설정 -->
							<div class="option">
							<p>크기</p>
								<label><input type="radio" name="size" value="소"> 소</label>
								<label><input type="radio" name="size" value="중"> 중</label>
								<label><input type="radio" name="size" value="대"> 대</label>
								
							<p>계절</p>
								<label><input type="radio" name="season" value="봄"> 봄</label>
								<label><input type="radio" name="season" value="여름"> 여름</label>
								<label><input type="radio" name="season" value="가을"> 가을</label>
								<label><input type="radio" name="season" value="겨울"> 겨울</label>
								
							<p>색상</p>
								<label><input type="radio" name="color" value="빨강"> 빨강</label>
								<label><input type="radio" name="color" value="노랑"> 노랑</label>
								<label><input type="radio" name="color" value="하양"> 하양</label>
								<label><input type="radio" name="color" value="검정"> 검정</label>
								<label><input type="radio" name="color" value="핑크"> 핑크</label>
							
							<p>정렬순서</p>
								<label><input type="radio" name="sorting" value="amount ASC"> 가격 낮은 순</label>
								<label><input type="radio" name="sorting" value="amount DESC"> 가격 높은 순</label>
								<label><input type="radio" name="sorting" value="p_name ASC"> 이름 순(a-z)</label>
								<label><input type="radio" name="sorting" value="p_name DESC"> 이름 순(z-a)</label>
							<input type="button" value="선택완료" id="selectOK" Onclick="appendProduct()">
							</div>
					<!-- </form> -->
				</div>
				<!-- End Filter Bar -->
				<!-- Start Product -->
				<section class="lattest-product-area pb-40 category-list">
					<div class="row" id="product-list-area">
						<c:forEach items="${list}" var="list" begin="0" end="5" step="1"
							varStatus="status">
							<div class="col-md-6 col-lg-4">
								<div class="card text-center card-product">
									<div class="card-product__img">
										<img class="card-img" onerror="this.src='/resources/img/noimage.gif'" src="/resources/img/product/${list.img1}" alt="" onClick="location.href='product/details?p_no=${list.p_no}'">
										<ul class="card-product__imgOverlay">
											<li><button onClick="location.href='product/details?p_no=${list.p_no}'">
													<i class="ti-search"></i>
												</button></li>
											<li><button class="btn_shopping-cart" value="${list.p_no}">
													<i class="ti-shopping-cart"></i>
												</button></li>
											<li><button class="btn_like_toggle" value="${list.p_no}">
													<i class="ti-heart"></i>
												</button></li>
										</ul>
									</div>
									<div class="card-body">
										<h4 class="card-product__title">
											<a href="product/details?p_no=${list.p_no}">${list.p_name}</a>
										</h4>
										<p class="card-product__price">${list.amount}</p>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</section>
				<!-- End Product -->
				<!-- Button trigger modal -->

			</div>
		</div>
	</div>
</section>
<!-- ================ category section end ================= -->
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
				<div id="cart-btn-area"></div>
			</div>
		</div>
	</div>
</div>
<!-- Modal end -->



<%@ include file="../include/footer.jsp"%>

<script src="/resources/vendors/nouislider/nouislider.min.js"></script>
<script src="/resources/js/shopproduct.js"></script>
<script type="text/javascript" src="/resources/js/twbsPagination.js"></script>
<script>

function init(){ //이벤트함수 init
	
	appendProduct();
	
}

//상품추가위한 text생성하는 코드가 중복되어 만든 함수
function makeText(product){
	text = '';
	let productName = product.p_name;
						//text는 백틱으로 처음부터 끝까지 해결하려했으나 태그 다음에 오류 ex) `src="${product.img}"`동작 안함
					  	text += `<div class="col-md-6 col-lg-4">`;
					  	text += `<div class="card text-center card-product">
						<div class="card-product__img">
							<img class="card-img" onerror="this.src='/resources/img/noimage.gif'"  src="/resources/img/product/`;
						text += product.img1;
						text += `"alt="" onClick="location.href='product/details?p_no='`;
						text += product.p_no;
						text += ` ">
							<ul class="card-product__imgOverlay">
								<li><button
										onClick="location.href='product/details?p_no=`;
						text += product.p_no;
						text += `'">
										<i class="ti-search"></i>
									</button></li>
								<li><button class="btn_shopping-cart" value="`
						text += product.p_no;
						text += `">
										<i class="ti-shopping-cart"></i>
									</button></li>
								<li><button class="btn_like_toggle" value="`;
						text += product.p_no;
						text += `"><i class="ti-heart"></i></button></li></ul></div><div class="card-body"`;
						text +=`<h4 class="card-product__title">
									<a href="product/details?p_no=`;
						text += product.p_no;
						text += `">`;
						text += productName;
						text += `</a></h4><p class="card-product__price">`;
						text += product.amount;
						text += `원</p></div></div></div>`;
						return text;
}

var selectProdList;

function searchProduct(){
		let searchName = $("#search-input-box").val();
		stopindex = 6;
		let url= "searchList";
		
		    $.ajax({
				url : url,
				type : 'Post',
				data : {
					"p_name" : searchName
				}, //검색단어 전달
				dataType : 'JSON',
	
				success : function(data) {
					let $productListArea = $("#product-list-area");//상품을 그려넣을 장소
					$productListArea.empty();
					selectProdList = data;
				
					let text; //append 할 html문을 저장한다.
					$.each(data,function(index, product) {
						
						var text = makeText(product); //상품출력하기 위한 text생성
						
											$productListArea.append(text);//상품 출력
						
											if(index == 5){
												return false;
											}
									})
					$productListArea.show();
					clickEvent();
					
				},
				error : function(e) {
					console.log("상품출력 통신실패");
					console.log(e);
				}
			})
		
}

function appendProduct(){
		let size = $("input[type=radio][name=size]:checked").val(); //크기값
		let season = $("input[type=radio][name=season]:checked").val(); //계절값
		let color = $("input[type=radio][name=color]:checked").val(); //색상값
		let sorting =  $("input[type=radio][name=sorting]:checked").val(); //정렬 순서의 값을 저장
		stopindex = 6;
		let url= "productList";
		
		    $.ajax({
				url : url,
				type : 'Post',
				data : {
					"size" : size, //크기
					"season" : season, //계절
					"color" : color, //색상
					"sorting" : sorting,//정렬 객체와 방향
				},
				dataType : 'JSON',
	
				success : function(data) {
					let $productListArea = $("#product-list-area");//상품을 그려넣을 장소
					$productListArea.empty();
					selectProdList = data;
				
					let text; //append 할 html문을 저장한다.
					$.each(data,function(index, product) {
						var text = makeText(product); //상품출력하기 위한 text생성
						
											$productListArea.append(text);//상품 출력
						
											if(index == 5){
												return false;
											}
									})
					$productListArea.show();
					clickEvent();
					
				},
				error : function(e) {
					console.log("상품출력 통신실패");
					console.log(e);
				}
			})
		
}

var stopindex = 6;
function scrollAppendProduct(){
    	console.log("스크롤 끝까지 내림");
		let $productListArea = $("#product-list-area");//상품을 그려넣을 장소
					let text; //append 할 html문을 저장한다.
					$.each(selectProdList,function(index, product) {
											if(index < stopindex){
												return true;
											}
											var text = makeText(product); //상품출력하기 위한 text생성
											
											$productListArea.append(text);//상품 출력
											
											if(index == stopindex + 5){
												return false;
											}
									})
				$productListArea.show();
				clickEvent(); //장바구니 클릭이벤트 등록
				stopindex +=7;	
				console.log(stopindex);
}

$(document).ready(function() {
	init();
		
	
	//스크롤 내리면 실행
	$(window).scroll(function() {
	    //스크롤 끝까지 내렸을 경우에 실행
	    if (Math.round( $(window).scrollTop() + 100 > $(document).height() - $(window).height())) {
	    	console.log("end");
	    	scrollAppendProduct();
	    }
         
	})

	
})

function getUserId(){ //유저아이디 getter
		var u_id = '<c:out value="${userId}"></c:out>'; //js파일에서 읽히지 않는다. jstl임포트 불가능 (해결방안 : js파일을 jsp로 변환 or json을 이용)
		console.log("u_id : " + u_id);
		return u_id;
}

function sessoinExistenceChecked(){
	let userId = getUserId();

	if(userId === "" || typeof userId === "undefined" || userId === null){
		
		return true;
	}
	return false;
}

function loginTypeCheck(){ //비회원, 판매자 접속시 모달창
	
	let result = false;
	if(sessoinExistenceChecked()){
		$("#notice .modal-body").html("로그인 후 이용해주세요.");
		$('#notice').modal('show');
		result = true;
	}else if(getSellerCheck()){
		$("#notice .modal-body").html("판매자는 이용할수 없습니다. 일반유저 로그인 후 이용해주세요.");
		$('#notice').modal('show');
		result = true;
	}
	return result;
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
			console.log("stats : " + stats);
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


function clickEvent(){ //찜, 장바구니 버튼 클릭 이벤트
	let shoppingCart = $(".btn_shopping-cart"); //장바구니 버튼
	//shoppingCart.off("click");//클릭이벤트 루프돌아서 클릭 이벤트 해제
	shoppingCart.click(function(){ //장바구니 add
		addCartEvent($(this).val(),1);// 카트 추가 (객체의 value,수량)
	})
	
}



</script>
