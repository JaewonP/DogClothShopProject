/**
 *  register_seller, register_user용 js
 */

var idok = false;
var pwok = false;
var emailok = false;
var codeok = false;
var emailcode;

$(document).ready(function() {
	
	//아이디 중복 체크
	$("#idok").click(function() {
		user_id = $("#user_id").val();
		console.log(user_id);
		if(user_id == "") {
			$("#idok_mid").css("color", "red");
			$("#idok_mid").val("아이디를 입력해주세요");
			idok = false;
		}else if(user_id.length > 20) {			
			$("#idok_mid").css("color", "red");
			$("#idok_mid").val("아이디가 너무 깁니다.");
			idok = false;
		}else if (user_id.search(/\s/) != -1) {
			$("#idok_mid").css("color", "red");
			$("#idok_mid").val("공백은 포함될 수 없습니다.");
			idok=false;
		}else {
 	          $.ajax({
 	            	    url :'isIdOk?id=' + user_id,
 	            	    type : 'post',
 		               	dataType : 'JSON',
 	               		success : function(data){
 	              		console.log(data);

 	            		if(data == false) {
                            $("#idok_mid").css("color", "red");
			                $("#idok_mid").val("중복된 아이디가 있습니다.");
 	            			idok = false;
                            
 	            		}
 	            		else {
                          $("#idok_mid").css("color", "blue");    
 	                      $("#idok_mid").val("사용 가능합니다.");
			              idok=true;

 	            		}

 	               },
 	               error : function(){	
 	                  console.log("통신실패");
 	               }
 	               
 	              
 	            });  				
			
			
			
		}
		
	})
	
	//비밀번호 정규화 체크
	$("#pwok").click(function() {
        console.log("들어오는지");
		password = $("#password").val();
		 var num = password.search(/[0-9]/g);
 		 var eng = password.search(/[a-z]/ig);
 		 var spe = password.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
		console.log(password);
		if(password.length < 8 || password.length > 20) {
			$("#pwok_mid").css("color", "red");
			$("#pwok_mid").val("비밀번호는 8~20자리 이내로 입력해주세요.");
			pwok = false;
		}else if(password.search(/\s/) != -1) {			
			$("#pwok_mid").css("color", "red");
			$("#pwok_mid").val("비밀번호는 공백 없이 입력해주세요");
			pwok = false;
		}else if (num < 0 || eng < 0 || spe <0) {
			$("#pwok_mid").css("color", "red");
			$("#pwok_mid").val("영문, 숫자, 특수문자를 혼합하여 입력해주세요.");
			pwok=false;
		}else {
            $("#pwok_mid").css("color", "blue");
			$("#pwok_mid").val("사용 가능합니다");
			pwok=true;
		}
		
	})
	
	$("#emailok").click(function() {
		var email = $("#email").val();
        var btn = $(this);
		console.log(email);
		if(!/^[a-z0-9_+.-]+@([a-z0-9-]+\.)+[a-z0-9]{2,4}$/.test(email)){
			$("#emailok_mid").css("color","red");
			$("#emailok_mid").val("이메일 형식이 맞지 않습니다.");
			emailok=false;
            
        
		}else {
				$.ajax({
 	            	    url :'isEmailOk?email=' + email,
 	            	    type : 'post',
 		               	dataType : 'JSON',
 	               		success : function(data){
 	              		console.log(data);

 	            		if(data == false) {
                            $("#emailok_mid").css("color", "red");
			                $("#emailok_mid").val("중복된 이메일이 있습니다.");
 	            			emailok = false;
                            
 	            		}
 	            		else {
			              emailcode = Math.floor(Math.random() * 1000000)+100000;
                            if(emailcode > 1000000) {
                                emailcode = emailcode - 100000;
                            }

                                emailjs.init("user_vzZ8R3RtfEqba9uOzHVYV");	
                                 var templateParams = {	
                                 //각 요소는 emailJS에서 설정한 템플릿과 동일한 명으로 작성!
                                 email : email,
                                 emailcode : emailcode
                                };

                            emailjs.send('service_nj8lrqc', 'template_tem4jf3', templateParams)
                                .then(function(response) {
                                   console.log('SUCCESS!', response.status, response.text);
                                }, function(error) {
                                   console.log('FAILED...', error);
                                });

                                $("#emailok_mid").css("color","blue");
                                $("#emailok_mid").val("이메일 전송 완료");				
                                console.log(templateParams);
                                console.log(btn);
                                btn.text("다시보내기");
                                emailok=true;

                                        }

                            },
                            error : function(){	
                            console.log("통신실패");
                        }


                });  				
            
            
			
			
		}
		
		
	});
	
	$("#codeok").click(function() {
		var confirmEmail = $("#confirmEmail").val();
		if(confirmEmail != emailcode) {
			$("#codeok_mid").css("color", "red");
			$("#codeok_mid").val("인증코드가 맞지 않습니다.");
			codeok = false;
		}
		else {
			$("#codeok_mid").css("color", "blue");
			$("#codeok_mid").val("인증코드가 맞습니다.");
			codeok = true;
		}
	});
	
	
	$('.button-register').click(function() {
        if(emailok == true && idok == true && pwok == true && codeok == true) {
            $('#register_form').submit();
        } else {
            	   Swal.fire({
	        				  icon: 'error',
	        				  title: '필수사항을 전부 입력하세요',
	        				  text: '아이디, 이메일, 비밀번호를 확인해주십시오.'      				  
	        			});
        }
    });
	
});