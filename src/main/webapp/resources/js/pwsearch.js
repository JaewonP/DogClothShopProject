/**
 * pwsearch 용 js 
 */

var pwmessgae = false;
var pwChange;

$(document).ready(function() {
	
	//이메일이 db에 있는지 체크 
	$(".btn-block").click(function() {
		
		var email = $("#email").val();
		var btn = $(this);
		console.log(email);
		console.log(btn);
		$.ajax({
			
			url :'isEmail?email=' + email,
 	        type : 'get',
			contentType: 'application/json; charset=utf-8',
 		    dataType : 'JSON',
 	        success : function(data){
 	           console.log(data);
			   
			   let id = '';
			   let role_name ='';
			   $.each(data,function(key,value){
				id = value.id;
				role_name = value.role_name;
			   });
		
		       console.log(id);

 	            if(data == null) {
                     $("#pwmessage").css("color", "red");
			         $("#pwmessage").val("해당 이메일을 찾을 수 없습니다.");
 	            	  pwmessage = false;
                            
 	            	}
 	            	else {
						pwChange = 'http://localhost:8009/cutieshop/pwchange/' + role_name +'/'+ id;
                        emailjs.init("user_vzZ8R3RtfEqba9uOzHVYV");	
                        var templateParams = {	
                                 //각 요소는 emailJS에서 설정한 템플릿과 동일한 명으로 작성!
                                 email : email,
                                 message : pwChange
                            };

                            emailjs.send('service_oy63mel', 'template_bu418dk', templateParams)
                                .then(function(response) {
                                   console.log('SUCCESS!', response.status, response.text);
                                }, function(error) {
                                   console.log('FAILED...', error);
                                });
                        $("#pwmessage").css("color", "blue");    
 	                    $("#pwmessage").val("이메일을 확인하였습니다. 비밀번호 변경을 위해 해당 이메일에 인증 메일을 확인해주세요.");
			           
						 console.log(templateParams);
                         console.log(btn);
                         btn.text("다시보내기");
						 pwmessage=true;

 	            	}

 	              },
 	               error : function(request, status, error){	
 	                // alert("code:"+request.status+"\n"+ "message:"+request.responseText+"\n"+"error"+error);
					 $("#pwmessage").css("color", "red");
			         $("#pwmessage").val("해당 이메일을 찾을 수 없습니다.");
 	            	  pwmessage = false;
 	           }
			
		});
		
	});
	
	
	
})