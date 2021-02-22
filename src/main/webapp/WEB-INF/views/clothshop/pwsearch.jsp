<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>    


<%@ include file="../include/header.jsp"%>
<!-- 이메일 보내는 js -->
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/emailjs-com@2/dist/email.min.js"></script>
<script type="text/javascript" src="/resources/js/pwsearch.js"></script>
<title>강아지 옷가게 | 비밀번호 찾기</title>

<style>

.container {
	margin-top : 50px;
	margin-bottom : 100px;
}

.pwmessage {
	 border:none; border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px; width:400px;
}
</style>
<script src = " https://unpkg.com/sweetalert/dist/sweetalert.min.js " ></script>     <!-- sweetAlert -->
<script src="https://code.jquery.com/jquery-3.5.1.js" ></script>

<div class="container">
    <div class="row">
		<div class="col-md-4 col-md-offset-4">
    		<div class="panel panel-default">
			  	<div class="panel-heading">
			    	<h3 class="panel-title" style="font-size:18px;">이메일을 입력해주세요</h3>
			 	</div>
			  	<div class="panel-body">
			    	<form accept-charset="UTF-8" role="form">
                    <fieldset>
			    	  	<div class="form-group"  style="margin-bottom:3px">
			    		    <input class="form-control" placeholder="E-mail" name="email" id="email" type="text">
			    		</div>
						<div class="form-group"  style="margin-bottom:3px; font-size:10px;">
							<input type="text" id="pwmessage" class="pwmessage" tabindex="-1" readonly>
						</div>
			    		<input class="btn btn-lg btn-success btn-block" type="button" value="비밀번호 찾기">
			    	</fieldset>
			      	</form>
			    </div>
			</div>
		</div>
	</div>
</div>
<%@ include file="../include/footer.jsp"%>