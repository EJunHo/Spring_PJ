/*
*   join.jsp 필수 항목 체크
*/
function signInChk() {
	if(!document.joinform.id.value) {
		//id 입력 확인
		alert("아이디를 입력하세요.");
		document.joinform.id.focus();
		return false;
	} else if(!document.joinform.password.value) {
		alert("비밀번호를 입력하세요.");
		document.joinform.password.focus();
		return false;
		//password 입력 확인
	} else if(!document.joinform.repassword.value) {
		//password 재입력 확인
		alert("확인 비밀번호를 입력하세요.");
		document.joinform.repassword.focus();
		return false;
	} else if(document.joinform.password.value != document.joinform.repassword.value) {
		//password 입력이 서로 일치하는지
		document.joinform.repassword.value = "";
		document.joinform.repassword.focus();
		alert("비밀번호가 일치하지 않습니다.");
		return false;
	} else if(!document.joinform.name.value) {
		//이름 입력 체크
		alert("이름을 입력해주세요.");
		document.joinform.name.focus();
		return false;
	} else if(!document.joinform.birthday.value) {
		//생년 월일 체크
		alert("생년월일을 입력해주세요.");
		document.joinform.birthday.focus();
		return false;
	} else if(!document.joinform.address.value) {
		//주소 체크
		alert("주소를 입력해주세요.");
		document.joinform.address.focus();
		return false;
	} else if(!document.joinform.email1.value) {
		//이메일 체크
		alert("이메일을 입력해주세요.");
		document.joinform.eamil1.focus();
		return false;
	} else if(!document.joinform.email2.value && document.joinform.email3.value=="0") {
		//이메일 형식 불일치
		alert("이메일 형식을 확인해주세요.");
		document.joinform.email2.focus();
		return false;
		//2-2
	} else if(document.joinform.hiddenId.value == "0") {
		//중복확인 체크 
		alert("중복확인 해주세요.");
		document.joinform.dupChk.focus();
		return false;
	}
}


/**
 *  join.jsp 중복회원 체크
 */
//1. 중복확인 페이지 open
function comfirmId() {
	if(!document.joinform.id.value) {
		//id 입력 확인
		alert("아이디를 입력하세요.");
		document.joinform.id.focus();
		return false;
		}
		
		//2. 중복 페이지 open
		var url = "/html_pj_105/confirmIdAction.do?id="+document.joinform.id.value;
		window.open(url, "confirm","menubar=no, width=500, height=500"); //window.open(url, ""별칭"", size);
}


/*
*	join.jsp 이메일 체크
*/

function selectEmailChk() {
	// 직접 입력이 아닌 경우 email3. value를 email2.value로 초기화
	if(document.joinform.email3.value != 0) {
		document.joinform.email2.value = document.joinform.email3.value;
	} else {
		// 직접입력 - email2 초기화
		document.joinform.email2.value = "";
		document.joinform.email2.focus();	
	}
}

function modifyEmailChk() {
	// 직접 입력이 아닌 경우 email3. value를 email2.value로 초기화
	if(document.modifyform.email3.value != 0) {
		document.modifyform.email2.value = document.modifyform.email3.value;
	} else {
		// 직접입력 - email2 초기화
		document.modifyform.email2.value = "";
		document.modifyform.email2.focus();	
	}
}

/*중복 확인 confirmIdAction.jsp*/
function confirmIdChk() {
	if(!document.confirmform.id.value){
		alert("아이디를 입력하세요.");
		document.confirmform.id.focus();
		return false;
	}	
}

//3. 중복확인창 포커스
function confirmIdFocus() {
	document.confirmform.value.focus();
	
}
//4. 자식 창에서 부모창으로 값을 전달
//opner : window 객체의 open() 메서드로 열린 새창(=중복확인창)에서 부모창(회원가입폼)에 접근할때 사용
//self.close() 내창 닫기
function setId(id) {
	opener.document.joinform.id.value = id;
	opener.document.joinform.hiddenId.value = "1";
	self.close();
	
	
}
















