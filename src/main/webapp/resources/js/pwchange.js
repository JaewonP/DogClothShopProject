/**
 * pwchange 전용 자바스크립트
 */
var pwmessgae = false;
$(document).ready(function() {
	
	//비밀번호 정규화 체크
	$(".btn-block").click(function() {
        console.log("들어오는지");
		password1 = $("#password1").val();
		password2 = $("#password").val();
		 var num = password2.search(/[0-9]/g);
 		 var eng = password2.search(/[a-z]/ig);
 		 var spe = password2.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
		console.log(password1);
		console.log(password2);
		if(password1 == "" || password2 == "") {
			$("#pwmessage").css("color", "red");
			$("#pwmessage").val("입력칸을 공란없이 입력해주세요.");
		}
		else if (password1 != password2) {
			$("#pwmessage").css("color", "red");
			$("#pwmessage").val("비밀번호를 입력칸에 각각 다르게 입력하였습니다.");
		}
		else if(password2.length < 8 || password2.length > 20) {
			$("#pwmessage").css("color", "red");
			$("#pwmessage").val("비밀번호는 8~20자리 이내로 입력해주세요.");
			pwmessage = false;
		}else if(password2.search(/\s/) != -1) {			
			$("#pwmessage").css("color", "red");
			$("#pwmessage").val("비밀번호는 공백 없이 입력해주세요");
			pwmessage = false;
		}else if (num < 0 || eng < 0 || spe <0) {
			$("#pwmessage").css("color", "red");
			$("#pwmessage").val("영문, 숫자, 특수문자를 혼합하여 입력해주세요.");
			pwmessage=false;
		}else {
            $("#pwmessage").css("color", "blue");
			$("#pwmessage").val("사용 가능합니다");
			pwmessage=true;			
            $('#pwChange_form').submit();		
		}
		
	})
	
	
})