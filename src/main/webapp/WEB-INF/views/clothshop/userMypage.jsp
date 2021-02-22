<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강아지 옷가게 | 마이페이지</title>
<link rel="shortcut icon" type="image/x-icon" href="/resources/img/papicon.png">
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.23/css/dataTables.bootstrap5.min.css">

<script src="https://code.jquery.com/jquery-3.5.1.js" ></script>
<script type="text/javascript" src="/resources/js/twbsPagination.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/1.10.23/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/1.10.23/js/dataTables.bootstrap5.min.js"></script>
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
<style>


body{
margin-top:20px;

}

.btn {
    margin-bottom: 5px;
}

.grid {
    position: relative;
    width: 100%;
    background: #fff;
    color: #666666;
    border-radius: 2px;
    margin-bottom: 25px;
    box-shadow: 0px 1px 4px rgba(0, 0, 0, 0.1);
}

.grid .grid-body {
    padding: 15px 20px 15px 20px;
    font-size: 0.9em;
    line-height: 1.9em;
}

.search table tr td.rate {
    color: #f39c12;
    line-height: 50px;
}

.search table tr:hover {
    cursor: pointer;
}

.search table tr td.image {
	width: 50px;
}

.search table tr td img {
	width: 50px;
	height: 50px;
}

.search table tr td.rate {
	color: #f39c12;
	line-height: 50px;
}

.search table tr td.price {
	font-size: 1.5em;
	line-height: 50px;
}

.search #price1,
.search #price2 {
	display: inline;
	font-weight: 600;
}

</style>

</head>
<body>
   <!-- ================ start banner area ================= -->
   <section class="blog-banner-area" id="blog">
   <img class="img-fluid" src="/resources/img/cart/dogBanner.jpg" alt="배너"
      style="position: absolute; top: 0; left: 0; width: 100%; height: 100%" />
      <div class="container h-100">
         <div class="blog-banner">
            <div class="text-center">
               <h1>My Page</h1>
               <nav aria-label="breadcrumb" class="banner-breadcrumb">
                  <ol class="breadcrumb">
                     <li class="breadcrumb-item"><a href="#">마이 페이지</a></li>
                  </ol>
               </nav>
            </div>
         </div>
      </div>
   </section>
   <!-- ================ end banner area ================= -->
   <!--================Blog Categorie Area =================-->
   <section class="blog_categorie_area">
      <div class="container">
         <div class="row">
            <div class="col-sm-6 col-lg-4 mb-4 mb-lg-0">
               <div class="categories_post">
                  <img class="card-img rounded-0"
                     src="/resources/img/blog/cat-post/blog_1.jpg" alt="post">
                        <div class="categories_details" onclick="location.href='/cutieshop/FAQ'">
                           <div class="categories_text">
                              <h5>Q & A </h5>
                              <div class="border_line"></div>
                              <p>고객선터 바로가기</p>
                           </div>
                        </div>
               </div>
            </div>
            <div class="col-sm-6 col-lg-4 mb-4 mb-lg-0">
               <div class="categories_post">
                  <img class="card-img rounded-0"
                     src="/resources/img/blog/cat-post/blog_4.jpg" alt="post">

                        <div class="categories_details" onclick="location.href='/cutieshop/user/cart'">
                           <div class="categories_text">
                              <h5>장바구니</h5>
                              <div class="border_line"></div>
                              <p>장바구니 관리하기</p>
                           </div>
                        </div>
               </div>
            </div>
            <div class="col-sm-6 col-lg-4 mb-4 mb-lg-0">
               <div class="categories_post">
                  <img class="card-img rounded-0"
                     src="/resources/img/blog/cat-post/blog_8.jpg" alt="post">

                        <div class="categories_details" onclick="location.href='/cutieshop/user/confirmation'">
                           <div class="categories_text">
                              <h5>주문 이력</h5>
                              <div class="border_line"></div>
                              <p>교환/반품하기</p>
                           </div>
                        </div>
               </div>
            </div>
         </div>
      </div>
   </section>
   <!--================Blog Categorie Area =================-->

   <!--================Blog Area =================-->
   <section class="blog_area">
      <div class="container">
         <div class="row">
            <div class="col-lg-8">
               <div class="blog_left_sidebar">                 
                  <article class="row blog_item">
					    <div class="container">
					       <div class="row">
							  <!-- BEGIN SEARCH RESULT -->
							  <div class="col-md-12">
							    <div class="grid search">
							      <div class="grid-body">
							        <div class="row">
							            <h4>최근 구입한 상품</h4>  
							            <!-- BEGIN TABLE RESULT -->
							            <div class="table-responsive">
							              <table class="table table-hover">
							              	<thead>
							              	<tr>
							                  <td>Image</td>
							                  <td>상품이름</td>							                  
							                  <td>가격</td>
							                  <td>개수</td>
							                  <!-- <td>구매 날짜</td> -->
							                </tr>	
							              	</thead>
							                <tbody>
							                <c:forEach var="list" items="${list}">
							                <tr>							                  
							                  <td class="image"><img src="/resources/img/product/<c:out value="${list.img}"/>" alt=""></td>
							                  <td class="product"><strong><c:out value="${list.pname}"/></strong><br><c:out value="${list.discribe}"/></td>							                  
							                  <td class="price text-right"><c:out value="${list.total}"/></td>
							                  <td class="price text-center"><c:out value="${list.quantity}"/></td>
							                 <%--  <td class="number"><c:out value="${list.order_date}"></c:out></td> --%>
							                </tr>
							                </c:forEach>							                
							               </tbody>
							              </table>
							            </div>
							            <!-- END TABLE RESULT -->
										</div>
							          <!-- END RESULT -->
							        </div>
							      </div>
							    </div>
							  </div>		    
						</div>          
                  </article>

               </div>               
            </div>
            <div class="col-lg-4">
               <div class="blog_right_sidebar">
                  <aside class="single_sidebar_widget author_widget">
                     <!-- 회원프로필 -->                     
						<img class="author_img rounded-circle"  
                        src="/resources/img/buyericon.png" alt="" style="width: 200px; height: 200px">
                     <h4 class='username'>${username}</h4>  <!-- 유저 이름 표시 -->
                     <p class='userstatus'>일반회원</p>
                     <div class="social_icon">
                        <a href="/cutieshop/user/userupdateform"> <i class="fas fa-user"></i> 계정정보 수정하기
                        </a>                       
                     </div>
                     <div class="br"></div>
                  </aside>
                  <aside class="single_sidebar_widget popular_post_widget">
                     <!-- best상품 창 -->
                     <h3 class="widget_title" onclick="location.href='/cutieshop/productList'">쇼핑하러 가기</h3>

                     <div class="br"></div>
                  </aside>
               </div>
            </div>
         </div>
      </div>
   </section>
   <!--================Blog Area =================-->

<script type="text/javascript">

function moveToShop() {
	
}

$(document).ready(function() {  //제이쿼리 동작을 위한 구역 -Monica 2020.12.31
    
    $('#pagination').twbsPagination({
    	  totalPages: 35,
    	  visiblePages: 7,
    	  onPageClick: function (event, page) {
    	    $('#page-content').text('Page ' + page);
    	  }
   });
   
   $('.table').DataTable(
		   {
			   "lengthMenu": [[3, 5, 8, -1], [3, 5, 8, "All"]]
			   
		   });
 	
 	
});
</script>

<!-- pagination이 작동하지 않아서 푸터 임의적으로 넣음 -->
<!--================ Start footer Area  =================-->
   <footer class="footer">
   <div class="footer-area">
      <div class="container">
         <div class="row section_gap">
            <div class="col-lg-3 col-md-6 col-sm-6">
               <div class="single-footer-widget tp_widgets">
                  <h4 class="footer_title large_title">집콕코딩단</h4>

               </div>
            </div>
            <div class="offset-lg-1 col-lg-2 col-md-6 col-sm-6">
               <div class="single-footer-widget tp_widgets">
                  <h4 class="footer_title">Quick Links</h4>
                  <ul class="list">
                     <li><a href="productList">Shop</a></li>
                     <li><a href="mypage">MyPage</a></li>
                     <li><a href="#">Contact</a></li>
                  <!-- 2020/01/08 yun.hj 경로설정 -->
                  </ul>
               </div>
            </div>
            <div class="col-lg-2 col-md-6 col-sm-6">
               <div class="single-footer-widget instafeed">
                  <h4 class="footer_title">member</h4>
                  <ul class="list instafeed d-flex flex-wrap">
                     <li>박재원</li>
                     <li>노가빈</li>

                  </ul>
               </div>
            </div>
            <div class="offset-lg-1 col-lg-3 col-md-6 col-sm-6">
               <div class="single-footer-widget tp_widgets">
                  <h4 class="footer_title">Contact Us</h4>
                  <div class="ml-40">
                     <p class="sm-head">
                        <span class="fa fa-location-arrow"></span> Head Office
                     </p>
                     <p>경기도 성남시 JIP.CO.K codingdan company 2층</p>

                     <p class="sm-head">
                        <span class="fa fa-phone"></span> INSTAGRAM
                     </p>
                     <p>
                        @jipcok <br>  Fax.0504-093-7765
                     </p>

                     <p class="sm-head">
                        <span class="fa fa-envelope"></span> Email
                     </p>
                     <p>
                        findme0@naver.com <br> www.jipcokcodingdan.com
                     </p>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>

   <div class="footer-bottom">
      <div class="container">
         <div class="row d-flex">
            <p class="col-lg-12 footer-text text-center">
               <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
               Copyright &copy;
               <script>
                  document.write(new Date().getFullYear());
               </script>
               All rights reserved | This template is made with by JIPCOK 
               <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
            </p>
         </div>
      </div>
   </div>
</footer>
<!--================ End footer Area  =================-->
</body>
</html>