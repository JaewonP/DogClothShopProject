<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="/resources/vendors/nouislider/nouislider.min.js"></script>
<script src="/resources/ckeditor/ckeditor.js"></script>

<title>강아지 옷가게 | 상품등록</title>


<style>
.switch {
	position: relative;
	display: inline-block;
	width: 60px;
	height: 34px;
	float: right;
}
/* Hide default HTML checkbox */
.switch input {
	display: none;
}
/* The slider */
.slider {
	position: absolute;
	cursor: pointer;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	background-color: #ccc;
	-webkit-transition: .4s;
	transition: .4s;
}
.slider:before {
	position: absolute;
	content: "";
	height: 26px;
	width: 26px;
	left: 4px;
	bottom: 4px;
	background-color: white;
	-webkit-transition: .4s;
	transition: .4s;
}
input.default:checked+.slider {
	background-color: #444;
}
input.primary:checked+.slider {
	background-color: #2196F3;
}
input.success:checked+.slider {
	background-color: #8bc34a;
}
input.info:checked+.slider {
	background-color: #3de0f5;
}
input.warning:checked+.slider {
	background-color: #FFC107;
}
input.danger:checked+.slider {
	background-color: #f44336;
}
input:focus+.slider {
	box-shadow: 0 0 1px #2196F3;
}
input:checked+.slider:before {
	-webkit-transform: translateX(26px);
	-ms-transform: translateX(26px);
	transform: translateX(26px);
}
/* Rounded sliders */
.slider.round {
	border-radius: 34px;
}
.slider.round:before {
	border-radius: 50%;
}
</style>


<body>



	<div class="row" style="margin: 20px 200px 20px 200px;">
		<div class="col-lg-12">
			<h1 class="page-header">상품 등록</h1>
		</div>
	</div>

	<div class="row" style="margin: 0px 200px 20px 200px;">
		<div class="col-lg-12">
			<div class="panel panel-default"></div>
			<div class="panel-body">
				<form action="" role="form" method="post"
					enctype="multipart/form-data">
					<input class="form-control" name="s_id" type="hidden">
					<div class="form-group">
						<label>상품명</label><input class="form-control" name="p_name">
					</div>
					<div class="form-group">
					<!-- 체크박스  -->
						<label>견종 크기 : </label><!-- <input class="form-control" name="size"> -->
						<div class="form-check form-check-inline">
						  <input class="form-check-input" type="checkbox" name="size" id="inlineCheckbox1" value="소">
						  <label class="form-check-label" for="inlineCheckbox1">소</label>
						</div>
						<div class="form-check form-check-inline">
						  <input class="form-check-input" type="checkbox" name="size" id="inlineCheckbox2" value="중">
						  <label class="form-check-label" for="inlineCheckbox2">중</label>
						</div>
						<div class="form-check form-check-inline">
						  <input class="form-check-input" type="checkbox" name="size" id="inlineCheckbox3" value="대">
						  <label class="form-check-label" for="inlineCheckbox3">대</label>
						</div>
					</div>
					<div class="form-group">
					<!-- 체크박스  -->
						<label>상품계절 : </label>
						<div class="form-check form-check-inline">
						  <input class="form-check-input" type="checkbox" name="season" id="inlineCheckbox1" value="봄">
						  <label class="form-check-label" for="inlineCheckbox1">봄</label>
						</div>
						<div class="form-check form-check-inline">
						  <input class="form-check-input" type="checkbox" name="season" id="inlineCheckbox2" value="여름">
						  <label class="form-check-label" for="inlineCheckbox2">여름</label>
						</div>
						<div class="form-check form-check-inline">
						  <input class="form-check-input" type="checkbox" name="season" id="inlineCheckbox3" value="가을">
						  <label class="form-check-label" for="inlineCheckbox3">가을</label>
						</div>
						<div class="form-check form-check-inline">
						  <input class="form-check-input" type="checkbox" name="season" id="inlineCheckbox3" value="겨울">
						  <label class="form-check-label" for="inlineCheckbox3">겨울</label>
						</div>
					</div>
					<div class="form-group">
					<!-- 체크박스  -->
						<label>색상 : </label>
						<div class="form-check form-check-inline">
						  <input class="form-check-input" name="color" type="checkbox" id="inlineCheckbox1" value="빨강">
						  <label class="form-check-label" for="inlineCheckbox1">빨강</label>
						</div>
						<div class="form-check form-check-inline">
						  <input class="form-check-input" name="color" type="checkbox" id="inlineCheckbox2" value="노랑">
						  <label class="form-check-label" for="inlineCheckbox2">노랑</label>
						</div>
						<div class="form-check form-check-inline">
						  <input class="form-check-input" name="color" type="checkbox" id="inlineCheckbox3" value="하양">
						  <label class="form-check-label" for="inlineCheckbox3">하양</label>
						</div>
						<div class="form-check form-check-inline">
						  <input class="form-check-input" name="color" type="checkbox" id="inlineCheckbox3" value="검정">
						  <label class="form-check-label" for="inlineCheckbox4">검정</label>
						</div>
						<div class="form-check form-check-inline">
						  <input class="form-check-input" name="color" type="checkbox" id="inlineCheckbox3" value="핑크">
						  <label class="form-check-label" for="inlineCheckbox4">핑크</label>
						</div>
					</div>
					<div class="form-group">
					<!-- 체크박스  -->
						<label>카테고리명 : </label>
						<div class="form-check form-check-inline">
						  <input class="form-check-input" type="checkbox" name="c_name" id="inlineCheckbox1" value="의류">
						  <label class="form-check-label" for="inlineCheckbox1">의류</label>
						</div>
						<div class="form-check form-check-inline">
						  <input class="form-check-input" type="checkbox" name="c_name" id="inlineCheckbox2" value="장난감">
						  <label class="form-check-label" for="inlineCheckbox2">장난감</label>
						</div>
						<div class="form-check form-check-inline">
						  <input class="form-check-input" type="checkbox" name="c_name" id="inlineCheckbox3" value="기타">
						  <label class="form-check-label" for="inlineCheckbox3">기타</label>
						</div>
					</div>
					<div class="form-group">
						<label>상품가격</label><input class="form-control" name="amount"
							id="amount">
					</div>
					<div class="form-group">
						<label>남은수량</label><input class="form-control" name="quantity"
							id="quantity">
					</div>
					<div class="form-group">
						<label>상품설명</label>
						<textarea class="form-control" id="discribe" name="discribe"></textarea>
						<script type="text/javascript">
						 CKEDITOR.replace('discribe'
					                , {height: 500,
					                enterMode: CKEDITOR.ENTER_BR,
					          });
						 
						 
						</script>
					</div>
					<div class="form-group">
						<label>이미지</label> <input type="file" class="form-control"
							name="prod_img" multiple="multiple" id="image"
							onchange="setThumbnail(event);" data-width="500" data-heihgt="500">
						<div id="image_container"></div>
						
						
					<div class="form-group">
						<label>영상 업로드</label><input class="form-control" name="video"
							id="video">
					</div>

					</div>

					<input type="button" class="btn btn-default" value="등록" id="btsCk">
<!-- 					<button onchange="btsCk" class="btn btn-default">등록</button> -->
					<button type="reset" class="btn btn-default">초기화</button>
				</form>
			</div>
		</div>
	</div>
</body>
<script>
    	$(document).ready(function(){
    	
			$("#amount").on("keyup",function(){
			    $(this).val($(this).val().replace(/[^0-9]/g,""));
			})
			
			$("#quantity").on("keyup",function(){
			    $(this).val($(this).val().replace(/[^0-9]/g,""));
			})
			
    		$("#btsCk").click(function(){
    			console.log("클릭됨");
    			let length = $("#image")[0].files.length;
    			console.log("imgae : " ,length);
    			if(length==0){
    				Swal.fire({
    					  icon: 'error',
    					  title: 'Oops...',
    					  text: '등록된 이미지가 없습니다'
    					})
    			}else{
    				$("#btsCk").attr({type : "submit"});
    			}
    		
    		})
    			
    		})

    		
	// onchange 로 input 태그 클릭 시 이벤트 발생
	function setDisplay(obj) {
		console.log("obj : " + obj);
		let cateParent = $('#cateParent');
		// 상위카테고리 name
		let cateName = $(obj).val();
		console.log("objVal", cateName);
		// 하위카테고리 id
		let cateId = $(obj).attr('id');
		// ajax 
		$
				.ajax({
					// get방식으로 cateId(jquery객체화 시킨 하위카테고리 id)를 보낸다 dataType은 JSON방식
					// 성공시 해당 data(카테고리 를 부모카테고리no와 비교해서 key 와 value로 )에 담긴다
					url : 'cateChek?cateId=' + cateId,
					type : 'get',
					dataType : 'JSON',
					success : function(data) {
						console.log(" success 데이터 값 : ", data);
						let text = '';
						let radio = $(".parts_radio");
						// 비우기
						radio.empty();
						$
								.each(
										data,
										function(key, value) {
											console.log("key의 값 : " + key + " "
													+ "value의 값 : "
													+ value.c_name);
											text += '<ul class="front_parts"><li class="filter-list"><input class="pixel-radio" type="radio" id="'+value.c_no+'" name="c_no"value="'+value.c_no+'"><label for="headlight">'
													+ value.c_name
													+ '</label></li></ul>';
										})
						radio.append(text);
						radio.show();
					},
					error : function() {
						console.log("통신실패");
					}
				})
	}
	// 이미지 미리보기
	function setThumbnail(event) {
		$("#image_container").empty();
		let size = event.target.files.length;
		if(size>=4){
			Swal.fire({
				  icon: 'error',
				  title: 'Oops...',
				  text: '최대 3개까지 가능합니다'
				})
			$("#image").val("");
			return false;
		}
		for (var image of event.target.files) { 
			var reader = new FileReader();
			reader.onload = function(event) { 
				var img = document.createElement("img");				
				img.setAttribute("src", event.target.result); 
				img.setAttribute("width", "150px;"); 
				img.setAttribute("height", "200px;"); 
				document.querySelector("div#image_container").appendChild(img)
				}; 
				console.log(image); reader.readAsDataURL(image); } 
				
			}
		
</script>

<%@ include file="../include/footer.jsp"%>