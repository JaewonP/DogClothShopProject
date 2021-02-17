var pwdok = true;
var nameok = true;
var phoneok = true;
var emailok = true;
var sample2_addressok = true;
var sample2_detailAddressok = true;
var before_email = $("#email").val();

$(document).ready(
	function() {
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


	})
//수정 버튼을 누르면 최종실행
function finalcheck() {

	//모든 항목에 값을 입력했는지 체크
	if (emailok) {
		console.log("수정완료");
		return true;

	} else {
		console.log("수정 실패");
		swal("모든 항목을 올바르게 입력해주세요.");
		return false;

	}
}