<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>    


<%@ include file="../include/header.jsp"%>

<script type="text/javascript" src="/resources/js/pwchange.js"></script>
<title>Password Change</title>

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
			    	<h2 class="panel-title" style="font-size:18px; color:#1B93E7;">회원님의 ID는 [ ${id} ]입니다.</h2>
			 	</div>
			  	<div class="panel-heading">
			    	<h3 class="panel-title" style="font-size:15px;">변경할 비밀번호를 입력해주세요</h3>
			 	</div>
			 	<div class="panel-body">
				 	<div class="form-group"  style="margin-bottom:3px">
				    	<input class="form-control" placeholder="Password" name="password1" id="password1" type="password">
				    </div>
				</div>
				<div class="panel-heading">
			    	<h3 class="panel-title" style="font-size:15px;">비밀번호를 다시 입력해주세요</h3>
			 	</div>
			  	<div class="panel-body">
			    	<form accept-charset="UTF-8" role="form" id="pwChange_form" method="post">
                    <fieldset>
                    	<input name="id" value="${id}" id="id" type="hidden">
			    	  	<div class="form-group"  style="margin-bottom:3px">
			    		    <input class="form-control" placeholder="Password" name="pw" id="password" type="password">
			    		</div>
						<div class="form-group"  style="margin-bottom:3px; font-size:10px;">
							<input type="text" id="pwmessage" class="pwmessage" tabindex="-1" readonly>
						</div>
			    		<input class="btn btn-lg btn-success btn-block" type="button" value="비밀번호 변경하기">
			    	</fieldset>
			      	</form>
			    </div>
			</div>
		</div>
	</div>
</div>
<%@ include file="../include/footer.jsp"%>