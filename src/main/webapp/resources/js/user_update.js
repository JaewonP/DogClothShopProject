var pwdok = true;
var nameok = true;
var phoneok = true;
var emailok = true;
var sample2_addressok = true;
var sample2_detailAddressok = true;
var before_email = $("#email").val();

$(document).ready(
	function() {
		console.log("레디 완료");

		//비밀번호 수정
		$(document).on("blur", '#pwd', function() {
			pwd = $("#pwd").val();
			var checkNum = pwd.search(/[0-9]/g);
			var checkEng = pwd.search(/[a-z]/ig);
			if ((!/^[a-zA-Z0-9]{8,15}$/.test(pwd)) || checkNum < 0 || checkEng < 0) {
				$("#mpwd").css("color", "red");
				$("#mpwd").val("숫자와 영문자 조합으로 8~15자리를 사용해야 합니다.");
				pwdok = false;
			} else {
				$("#mpwd").val("");
				pwdok = true;
				console.log(pwdok);
			}
		});

		//이름 수정
		$(document).on("blur", '#name', function() {
			name = $("#name").val();
			console.log(name);
			if (name.length > 20) {
				$("#mname").val("이름이 너무 깁니다.");
				nameok = false;
			} else {
				$("#mname").val("");
				nameok = true;
			}
		});

		//전화번호 수정
		$(document).on("blur", '#phone', function() {
			var phoneCheck = /^\d{3}-\d{3,4}-\d{4}$/;
			phone = $("#phone").val();
			console.log(phone);
			if (!phoneCheck.test(phone)) {
				$("#mphone").val("전화번호 형식이 맞지 않습니다.");
				phoneok = false;
			} else {
				$("#mphone").val("");
				phoneok = true;
			}
		});

		//이메일 수정
		$(document).on(
			"blur",
			'#email',
			function() {
				toemail = $("#email").val();
				console.log(toemail);
				if (!/^[a-z0-9_+.-]+@([a-z0-9-]+\.)+[a-z0-9]{2,4}$/.test(toemail)) {
					$("#memail").val("이메일 형식이 맞지 않습니다.");
					emailok = false;
				} else {

					if (before_email != toemail) {

						$.ajax({
							url: 'toemailcheck?toemail=' + toemail,
							type: 'get',
							dataType: 'json',
							success: function(data) {
								$("#memail").val("가입된 이메일이 있습니다");
								emailok = false;
							},
							error: function() {
								$("#memail").val("");
								emailok = true;
							}
						})
					} else {
						$("#memail").val("");
						emailok = true;
					}
				}
			});

		//주소 수정
		$(document).on("blur", '#sample2_address', function() {
			sample2_address = $("#sample2_address").val();
			console.log(sample2_address);
			if (sample2_address == "") {
				sample2_addressok = false;
			} else {
				sample2_addressok = true;
			}
		});

		//상세주소 수정
		$(document).on("blur", '#sample2_detailAddress', function() {
			sample2_detailAddress = $("#sample2_detailAddress").val();
			console.log(sample2_detailAddress);
			if (sample2_detailAddress == "") {
				sample2_detailAddressok = false;
			} else {
				sample2_detailAddressok = true;
			}
		});




	})
//수정 버튼을 누르면 최종실행
function finalcheck() {

	//모든 항목에 값을 입력했는지 체크
	if (pwdok && nameok && emailok && phoneok && sample2_addressok && sample2_detailAddressok) {
		console.log("수정완료");
		return true;

	} else {
		console.log("수정 실패");
		swal("모든 항목을 올바르게 입력해주세요.");
		return false;

	}
}