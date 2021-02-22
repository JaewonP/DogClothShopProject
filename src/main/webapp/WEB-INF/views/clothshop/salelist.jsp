<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../include/header.jsp"%>

<link rel="stylesheet" href="/resources/vendors/linericon/style.css">
<link rel="stylesheet"
	href="/resources/vendors/nouislider/nouislider.min.css">
<title>강아지 옷가게 | 판매목록 </title>

<!-- ================ start banner area ================= -->
<section class="blog-banner-area" id="category">
	<div class="container h-100">
		<div class="blog-banner">
			<div class="text-center">
				<h1>Sale List</h1>
				
			</div>
		</div>
	</div>
</section>
<!-- ================ end banner area ================= -->


<!-- ================ salelist section start ================= -->
<section class="section-margin--small mb-5">
	<div class="container">
		<div class="row" style="place-content:center">
			<div class="col-xl-9 col-lg-8 col-md-7">
				<!-- Start Filter Bar -->
				<div class="filter-bar d-flex flex-wrap align-items-center" style="place-content: center">
					
					<div>
						<p style="padding-top: 23px">판매상품 목록</p>
					</div>
				</div>
				
				<section class="lattest-product-area pb-40 category-list">
					<div class="row" id="product-list-area">
						<!-- salelist forEach start-->
						<c:forEach items="${salelist}" var="product">
							<%-- <div class="product-area" data-product-amount="${product.amount }" data-product-name="${product.p_name }"> --%>
							<div class="col-md-6 col-lg-4 product-area" data-product-amount="${product.amount }" data-product-name="${product.p_name }">
							<input type="hidden" value="${product.p_no}">
								<div class="card text-center card-product">
									<div class="card-product__img">
										<!-- 이미지 변수명만 수정 -성연 2021.01.07 -->
										<img class="card-img" src="/resources/img/product/${product.img1 } "  
											onClick="location.href='/cutieshop/product/details?p_no=${product.p_no}'"
											alt="">
										
									</div>
									<div class="card-body">
										<h4 class="card-product__title">
											<a href="/cutieshop/product/details?p_no=${product.p_no}">${product.p_name}</a>
										</h4>
										<p class="card-product__price"><fmt:formatNumber type="number" value="${product.amount}"/>원</p>

									</div>
								</div>
							</div>
						</c:forEach>
						<!-- salelist forEach end -->

					</div>
				</section>
			</div>
		</div>
	</div>
</section>
<!-- ================ salelist section end ================= -->

<%@ include file="../include/footer.jsp"%>