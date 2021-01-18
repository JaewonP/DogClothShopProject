var	idok=false;
var pwdok=false;
var nameok=false;
var emailok=false;
var emailcode;
var emailcodeok=false;
var phoneok=false;
var sample2_addressok=false;
var sample2_detailAddressok=false;

$(document).ready(function(){
	console.log("document ready!");
	
	//아이디 중복확인 버튼 클릭시 실행
	$("#id_check").click(function(){
		userid = $("#userid").val();
		if(userid == ""){
			$("#mid").css("color","red");
			$("#mid").val("아이디를 입력해주세요");
			idok=false;
		}else if(userid.length > 20){
			$("#mid").css("color","red");
			$("#mid").val("아이디가 너무 깁니다");
			idok=false;
		}else if(userid.search(/\s/) != -1){
			$("#mid").css("color","red");
			$("#mid").val("공백은 포함할 수 없습니다");
			console.log(userid.search(/\s/));
			idok=false;
		}else{
			//값이 있으면 success, 값이 없으면 error
			$.ajax({
				url : 'idcheck?id=' + userid,
				type : 'get',
				dataType : 'json',
				success : function(data) {
					$("#mid").css("color","red");
					$("#mid").val("중복된 아이디가 있습니다");
					idok=false;
				},
				error : function() {
					$("#mid").css("color","blue");
					$("#mid").val("사용 가능한 아이디입니다");
					idok=true;
				}
			})
			
		}
			
	});
	
	$("#email_send").click(function(){
		emailcheck();
	})
	$("#email_check").click(function(){
		emailcodecheck();
	})
	$("#submit").click(function(){
	
	})
	
	
})
	//가입완료 버튼을 누르면 실행
	function finalcheck(){
		var sample2_address = $("#sample2_address").val();
		var sample2_detailAddress = $("#sample2_detailAddress").val();
		if(sample2_address !== "") sample2_addressok=true;
		if(sample2_detailAddress !== "") sample2_detailAddressok=true;
		
		//모든 항목에 값을 입력했는지 체크
		if(idok&&pwdok&&nameok&&emailok&&emailcodeok&&phoneok&&sample2_addressok&&sample2_detailAddressok){
			var car = $("#cars option:selected").val();
			var address = sample2_address + sample2_detailAddress;
			if(confirm("가입이 완료되었습니다")) return true;
		}else{
			swal("모든 항목을 입력해주세요.");
			return false;
		}
	
	}

//비밀번호 정규화패턴에 맞는지 체크
function pwdcheck(){
	pwd = $("#password").val();
	var checkNum = pwd.search(/[0-9]/g);
	var checkEng = pwd.search(/[a-z]/ig);
	if((!/^[a-zA-Z0-9]{8,15}$/.test(pwd)) || checkNum <0 || checkEng <0){
		$("#mpwd").css("color","red");
		$("#mpwd").val("숫자와 영문자 조합으로 8~15자리를 사용해야 합니다.");
		pwdok=false;
	} else {
		$("#mpwd").val("");
		pwdok=true;
	}
}

//이름이 길면 쿼리문에서 에러가 나므로 막기위해 실행
function namecheck(){
	name = $("#username").val();
	if(name.length > 20){
		$("#mname").css("color","red");
		$("#mname").val("이름이 너무 깁니다.");
		nameok=false;
	} else {
		$("#mname").val("");
		nameok=true;
	}
	
}

//이메일 인증 클릭시 실행
function emailcheck(){
	toemail = $("#email").val();
	if(!/^[a-z0-9_+.-]+@([a-z0-9-]+\.)+[a-z0-9]{2,4}$/.test(toemail)){
		$("#memail").css("color","red");
		$("#memail").val("이메일 형식이 맞지 않습니다.");
		emailok=false;
	} else {
		//중복된 이메일이 있으면 seccess, 없으면 error
		$.ajax({
			url : 'toemailcheck?toemail=' + toemail,
			type : 'get',
			dataType : 'json',
			success : function(data) {
				$("#memail").css("color","red");
				$("#memail").val("가입된 이메일이 있습니다");
				emailok=false;
			},
			error : function() {
				//이메일 사용가능, 이메일 인증코드를 위한 난수 생성
				emailcode = Math.floor(Math.random() * 1000000)+100000;
				if(emailcode>1000000){
					emailcode = emailcode - 100000;
				}

				emailjs.init("user_rOnjfiky5XaIkAXuV0flv");
				
				//전달할 객체
				var templateParams = {	
					code : emailcode,
					email : toemail
				};
				                    
				//서비스id, 템플릿id, 객체를 파라미터로 전달. 이메일 전달 과정임.                	
				emailjs.send('service_9s6rhbj', 'template_n0q4nwz', templateParams)
				         	    .then(function(response) {
				         	       console.log('SUCCESS!', response.status, response.text);
				         	    }, function(error) {
				         	       console.log('FAILED...', error);
				         	    });
				
				
				$("#memail").css("color","blue");
				$("#memail").val("이메일 전송 완료");
				$("#email_send").val("다시 보내기");
				console.log(templateParams);
				emailok=true;
			}
		})
		
	}
}
	
	//입력한 인증코드와 일치하는지 확인
	function emailcodecheck(){
		if(emailok){
			var emailcode_input = $("#emailcode").val();
			if(emailcode == emailcode_input){
				$("#memailcode").css("color","blue");
			$("#memailcode").val("코드가 일치합니다");
			emailcodeok=true;
			} else {
				$("#memailcode").css("color","red");
			$("#memailcode").val("코드가 일치하지 않습니다");
			}
		} else {
				$("#memailcode").css("color","red");
			$("#memailcode").val("이메일인증을 눌러주세요");
		}
	}
	
	//휴대폰번호 정규화패턴에 맞는지 체크
	function phonecheck(){
		phone = $("#phone").val();
	if(!/(\d{2,4}).*(\d{3,4}).*(\d{4,4})/.test(phone)){
		$("#mphone").css("color","red");
		$("#mphone").val("전화번호 형식이 맞지 않습니다.");
		phoneok=false;
	} else {
		$("#mphone").val("");
		phoneok=true;
	}
}