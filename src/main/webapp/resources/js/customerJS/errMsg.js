/**
 * 
 */

var insertError = "회원정보 입력에 실패하였습니다. \n 확인 후 다시 시도하세요.";
var updateError = "회원정보 수정에 실패하였습니다. \n 확인 후 다시 시도하세요.";
var deleteError = "회원정보 삭제에 실패하였습니다. \n 확인 후 다시 시도하세요.";
var passwordError = "회원 비밀번호가 틀립니다. \n 확인 후 다시 시도하세요.";
var idpwdError = "아이디와 비밀번호가 일치하지않습니다.. \n 확인 후 다시 시도하세요.";
function errorAlert(errorMsg) {
	alert(errorMsg);
	window.history.back();
}
