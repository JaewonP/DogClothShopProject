<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<style>
/*팝업창 css style 생성 2021.01.09 yun.hj*/
button {
   height: 2.5em;
   cursor: pointer;
}

#popup {
   display: flex;
   justify-content: center;
   align-items: center;
   position: fixed;
   top: 0;
   left: 0;
   width: 100%;
   height: 100%;
   background: rgba(0, 0, 0, .7);
   z-index: 1;
}

#popup.hide {
   display: none;
}

#popup.has-filter {
   backdrop-filter: blur(4px);
   -webkit-backdrop-filter: blur(4px);
}

#popup .content {
   padding: 20px;
   background: #fff;
   border-radius: 5px;
   box-shadow: 1px 1px 3px rgba(0, 0, 0, .3);
}
</style>
<HEAD>
<title>강아지 옷가게 | Cart</title>
</HEAD>

<!-- ================ start banner area ================= -->
<section class="blog-banner-area" id="category">

   <img class="img-fluid" src="/resources/img/cart/title.png" alt="cart배너"
      style="position: absolute; top: 0; left: 0; width: 100%; height: 100%" />
   <div class="blog-banner">
      <div class="text-center">
         <h1>CART</h1>
         <nav aria-label="breadcrumb" class="banner-breadcrumb">
            <ol class="breadcrumb">
               <li class="breadcrumb-item active" aria-current="page">
               장바구니에   담긴 상품은 10일 동안 보관됩니다.</li>
            </ol>
         </nav>
      </div>
   </div>
</section>
<!-- ================== end banner area =================== -->




<!--=======================Cart Area ========================-->
<section class="cart_area">
   <div class="container">
      <div class="cart_inner">
         <div class="table-responsive">
            <table class="table">
      <tbody>
         <c:choose>
             <c:when test="${empty u_id}">로그인 후 이용해 주시기 바랍니다.</c:when>
                   <c:otherwise>
               <thead>
                  <tr align="center">
                     <th scope="col"><b>장바구니</b></th>
                     <th scope="col">price</th>
                     <th scope="col"><b>수량</b></th>
                     <th scope="col">total</th>
                     <th scope="col"><b>삭제 </b></th>
                  </tr>
               </thead>
                  <form name="form1" id="form1" method="post" action="/carshop/cart-update" >
                  
                     <c:forEach items="${cartList}" var="cart">
                     <div class = "productArea"></div>
                        <tr align="center">
                           <td>${cart.pname}</td>
                           <td><fmt:formatNumber value="${cart.amount}"
                                 pattern="#,###,###" />원</td>
                           <td>
                              <label for="cart_qty" style="float: left"></label> <input
                              value="${cart.quantity}" type="number" name="quantity"
                              size="1" maxlength="12" min="1" title="Quantity"
                              style="float: left" class= "cart-update"data-pno="${cart.pno}" data-amount="${cart.amount}">
                              <input type="hidden" name="p_no" value="${cart.pno}">
                           </td>
                           <td id="productTotal_${cart.pno}" class="product-total-amount" data-cart-total="${cart.total}">${cart.total}원
                           </td> 
                           <td><a class="gray_btn ml-2"
                              href="cart_delete?u_id=${cart.u_id}&pno=${cart.pno}">삭제</a></td>
                        </tr>
                     </c:forEach>
                     
                  </form>
                  <!--  </form>-->

                  <tr>
                     <td>
                        <div class="checkout_btn_inner d-flex align-items-center">
                           <a class="gray_btn ml-2" id="btnDelete"
                              href="cart_deleteAll?u_id=${u_id}">비우기</a>
                        </div>
                     </td>
                  </tr>

                  <tr class="total-amount_area">
                     <td class="d-none d-md-block"></td>
                     <td></td>
                     <td></td>
                     <td>
                        <h5>total</h5>
                     </td>
                     <td id="totalMoney"></td>
                  </tr>

                  <tr class="out_button_area">
                     <td class="d-none-l"></td>
                     <td class=""></td>
                     <td></td>
                     <td></td>
                     <td></td>
                     <td>
                        <div class="checkout_btn_inner d-flex align-items-center">
                           <a class="gray_btn" href="productList" id="btnList">쇼핑계속하기</a>
                           <a class="primary-btn ml-2" href="checkout"   >상품주문</a>

                        </div>
                     </td>
                  </tr>
      </c:otherwise>
</c:choose>
               </tbody>
            </table>
         </div>
      </div>
   </div>
   
</section>
<!--================End Cart Area =================-->
<%@ include file="../include/footer.jsp"%>

<!--================쿼리문 start Area ===============-->

<script>


   $(document).ready(function(){
      productTotalCalc();
      inputNumChange();
   })
   
   function productTotalCalc(){//장바구니 총 합계
      
     let productTotalAmount = 0; // 초기화 선언
      console.log("ready 동작 ");
      $(".product-total-amount").each(function(index,item){
    	  productTotalAmount += $(this).data("cartTotal");
      });
      $("#totalMoney").html(productTotalAmount + "원");
   }
 
   var u_id = '<c:out value="${userId}"></c:out>'; 
   
   function inputNumChange(){
	   
	   $('.cart-update').change(function(){
		  let obj = $(this);
	      let pno = obj.data("pno");
	      let amount = obj.data("amount")
	      let quantity = obj.val();
	      
	      console.log(pno + ", " + amount + ", " + quantity);
	      
	      let productTotal = $("#productTotal_"+pno);
	      productTotal.html(amount * quantity + "원");
	      productTotal.data("cartTotal", amount * quantity);
	      productTotalCalc();
	      
	      
	      //장바구니 테이블 업데이트
	      
	      var url  = 'quantityUpdate';
	      $.ajax({
				url : url,
				type : 'Post',
				data : {
					"pno" : pno,
					"u_id" : u_id,
					"quantity" : quantity
				}, 
				dataType : 'JSON',
	
				success : function(stats) {
					console.log("장바구니테이블 값 변경했나? " + stats);

				},
				error : function(e) {
					console.log("상품출력 통신실패");
					console.log(e);
				}
			})
	      
	   });
   }
</script>