<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ</title>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
</head>
<body>

    <div class="alert alert-warning alert-dismissible" role="alert">
        <button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        This section contains a FAQ about <strong>강아지 용품샵</strong>. If you cannot find an answer to your question, 
        make sure to contact us. 
    </div>

    <br />

 <div class="container ">
                 <h3 class="panel-title">
                    자주 묻는 질문</h3>
                    
    <div class="panel-group" id="faqAccordion" style="padding-top:10px">
    	<c:forEach items="${list}" var="list">
        <div class="panel panel-default ">
            <div class="panel-heading accordion-toggle question-toggle collapsed" data-toggle="collapse" data-parent="#faqAccordion" data-target="#question0">
                 <h4 class="panel-title">
                    <a href="#" class="ing">Q. <c:out value="${list.title}"/></a>
              </h4>

            </div>
            <div id="question0" class="panel-collapse collapse" style="height: 0px;">
                <div class="panel-body">
                     <h5><span class="label label-primary">Answer</span></h5>

                    <p><c:out value="${list.content}"/>
                        </p>
                </div>
            </div>
        </div>
        </c:forEach>
<!--         <div class="panel panel-default ">
            <div class="panel-heading accordion-toggle collapsed question-toggle" data-toggle="collapse" data-parent="#faqAccordion" data-target="#question1">
                 <h4 class="panel-title">
                    <a href="#" class="ing">Q: 개발자와 컨텍 어떻게 하나요?</a>
              </h4>

            </div>
            <div id="question1" class="panel-collapse collapse" style="height: 0px;">
                <div class="panel-body">
                     <h5><span class="label label-primary">Answer</span></h5>

                    <p>집콕코딩단으로 연락 부탁드립니다. </p>
                </div>
            </div>
        </div>
        <div class="panel panel-default ">
            <div class="panel-heading accordion-toggle collapsed question-toggle" data-toggle="collapse" data-parent="#faqAccordion" data-target="#question2">
                 <h4 class="panel-title">
                    <a href="#" class="ing">Q: 비밀번호가 기억이 나지 않습니다.</a>
              </h4>

            </div>
            <div id="question2" class="panel-collapse collapse" style="height: 0px;">
                <div class="panel-body">
                     <h5><span class="label label-primary">Answer</span></h5>

                    <p>로그인창에서 forgot Password? 클릭 후 이메일인증을 통해 비밀번호를 변경해주세요</p>
                </div>
            </div>
        </div>
        <div class="panel panel-default ">
            <div class="panel-heading accordion-toggle collapsed question-toggle" data-toggle="collapse" data-parent="#faqAccordion" data-target="#question3">
                 <h4 class="panel-title">
                    <a href="#" class="ing">Q: 더 많은 질문은 어디서 하나요?</a>
              </h4>

            </div>
            <div id="question3" class="panel-collapse collapse" style="height: 0px;">
                <div class="panel-body">
                     <h5><span class="label label-primary">Answer</span></h5>

                    <p>개발자에게 컨텍 부탁드립니다.</p>
                </div>
            </div>
        </div> -->
        
    </div> 
    <!--/panel-group-->
</div>

    <br />

    <br />
<hr>

<%@ include file="../include/footer.jsp"%>
</body>
</html>