<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../include/header.jsp"%>

	<title>강아지 옷가게 | 주문이력</title>
	<link rel="stylesheet" href="/resources/vendors/linericon/style.css">
	<link rel="stylesheet" href="/resources/vendors/nouislider/nouislider.min.css">
	<link href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i" rel="stylesheet">
	<link href='/resources/lib/main.css' rel='stylesheet' />
	<script src='/resources/lib/main.min.js'></script>
	<script src='/resources/lib/main.js'></script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10.13.0/dist/sweetalert2.all.min.js"></script>
<body>
	<!-- ================ start banner area ================= -->	
 	<section class="blog-banner-area" id="category">
 	<img class="img-fluid" src="/resources/img/cart/dogBanner.jpg" alt="배너"
		style="position: absolute; top: 0; left: 0; width: 100%; height: 100%" />
		<div class="container h-100">
			<div class="blog-banner">
				<div class="text-center">
					<h1><img src="/resources/img/confirmation/bill.png" style="width:80px; heigh:100%; padding-right:10px"/>주문 확인서</h1>
					<nav aria-label="breadcrumb" class="banner-breadcrumb">
            <ol class="breadcrumb">
              <li class="breadcrumb-item"><a href="#">구매이력을 조회합니다.</a></li>
            </ol>
          </nav>
				</div>
			</div>
    </div>
	</section> 
	
	<!-- ================ end banner area ================= -->
  
  <!--================Order Details Area =================-->
  <section class="order_details section-margin--small">
    <div class="container">
      <p class="text-center billing-alert">감사합니다. 주문 상세정보를 확인하세요.</p>
		
      <div class="order_details_table">
        <h2>주문 상세정보</h2> 
        <div class="table-responsive">
          <table class="table" style="display:">
            <thead>
              <tr>
              	<th scope="col">주문번호</th>
                <th scope="col">구매물품</th>
                <th scope="col">상품수량</th>
                <th scope="col">총가격</th>
                <th scope="col">결제수단</th>
                <th scope="col">구매날짜</th>
              </tr>
            </thead>
            <tbody id="originalTr">
             <c:forEach items="${buylist}" var ="buylist" varStatus="status">              
                  <tr>
                      <td><c:out value="${buylist.ono}"></c:out></td>               
                      <td><a href="/cutieshop/product/details?p_no=<c:out value="${buylist.pno}"></c:out>"><c:out value="${buylist.pname}"></c:out></a></td>
                      <td><c:out value="${buylist.quantity}"></c:out></td>
                      <td><c:out value="${buylist.total}"></c:out></td>
                      <td><c:out value="${buylist.pay}"></c:out></td>
             		  <td><c:out value="${buylist.order_date}"></c:out></td>              		             		
             		</tr>
             	</c:forEach>	      
            </tbody>
            <tbody id="emptyTr">
            </tbody>
          </table>          
        </div>
      </div>
    </div>
  </section>
 </body>
<script type="text/javascript">
	  
</script>
<%@ include file="../include/footer.jsp"%>