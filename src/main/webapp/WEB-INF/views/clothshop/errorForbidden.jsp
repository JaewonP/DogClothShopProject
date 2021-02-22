<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>    


<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<style>

.page-wrap {
    min-height: 100vh;
}

</style>


<div class="page-wrap d-flex flex-row align-items-center">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-12 text-center">
                <span class="display-1 d-block">잘못된 접근입니다</span>
                <div class="mb-4 lead">요청하신 페이지에 사용 권한이 없습니다.</div>
                <a href="/cutieshop/login" class="btn btn-link">Back to Login</a>
            </div>
        </div>
    </div>
</div>

<%@ include file="../include/footer.jsp"%>