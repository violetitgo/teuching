var idx_email = false;
var idx_nick = false;
var check_email = false;
var check_cell = false;

$('#signUp').click(function(){
	if($.trim($('#email').val()) == ''){
		alert("이메일을 입력해주세요.");
		setTimeout(function(){ $('#email').focus(); }, 10)
		return;
	}else if($.trim($('#nickname').val()) == ''){
		alert("닉네임을 입력해주세요.");
		setTimeout(function(){ $('#nickname').focus(); }, 10)
		return;
	}else if($.trim($('#password_1').val()) == ''){
		alert("비밀번호를 입력해주세요.");
		setTimeout(function(){ $('#password_1').focus(); }, 10)
		return;
	}
	//패스워드 확인
	else if($('#password_1').val() != $('#password_2').val()){
		alert('비밀번호가 일치하지 않습니다. 비밀번호를 재확인해주세요.');
		setTimeout(function(){ $('#password_2').focus(); }, 10)
		return;
	}
	else if($.trim($('#cell').val()) == ''){
		alert("연락처를 입력해주세요.");
		setTimeout(function(){ $('#cell').focus(); }, 10)
		return;
	}
	else if($.trim($('#sample6_address').val()) == ''){
		alert("주소를 입력해주세요.");
		setTimeout(function(){ $('#sample6_address').focus(); }, 10)
		return;
	}
	
	if(idx_email==false){
		alert("이메일 중복체크를 해주세요.");
		return;
	}else if(check_email==false){
		alert("잘못된 형식의 이메일 주소입니다.");
		return;
	}else if(idx_email==false){
		alert("이메일 중복체크를 해주세요.");
		return;
	}else{
		alert("작성하신 이메일로 인증메일이 전송되었습니다.                              메일 인증 시 회원가입이 완료됩니다.");
		$('#signForm').submit();
	} 
});
		
	



$('#check_nick').click(function(){
	$.ajax({
		url: "http://52.78.116.59:8080/teuching/member/nickchk.do",
		type: "POST",
		data:{
			"nickname":$('#nickname').val()
		},
		success: function(data){
			if(data == 0 && $.trim($('#nickname').val()) != '' ){
				idx_nick=true;
				var html="<tr><td colspan='3' style='color: green'>사용가능</td></tr>";
				$('#nickChk').empty();
				$('#nickChk').append(html);
			}else{
				var html="<tr><td colspan='3' style='color: red'>이미 사용중인 닉네임 입니다.</td></tr>";
				$('#nickChk').empty();
				$('#nickChk').append(html);
			}
		},
		error: function(){
			alert("서버에러");
		}
	});
});	
	$('#check_email').click(function(){
		$.ajax({
			url: "http://52.78.116.59:8080/teuching/member/emailchk.do",
			type: "POST",
			data:{"email":$('#email').val()},
			success: function(data){
				if(data == 0 && $.trim($('#email').val()) != '' ){
					idx_email=true;
					var html="<tr><td colspan='3' style='color: green'>사용가능</td></tr>";
					$('#emailChk').empty();
					$('#emailChk').append(html);
				}else{
					var html="<tr><td colspan='3' style='color: red'>이미 사용중인 이메일 입니다.</td></tr>";
					$('#emailChk').empty();
					$('#emailChk').append(html);
				}
			},
			error: function(){
				alert("서버에러");
			}
		});
	});
// 이메일 유효성 체크
// 정규표현식 정의
function email_check(email) {    
    var regex=/([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
    return (email != '' && email != 'undefined' && regex.test(email)); 
}

// name 속성이 'email'인 input 이 focus를 잃었을때 처리한다.
$("input[name='email']").blur(function(){

    var email = $(this).val();

    // 값을 입력안한경우는 아예 체크를 하지 않는다.
    if( email == '' || email == 'undefined') return;

    // 이메일 유효성 검사
    if(! email_check(email) ) {
        alert('잘못된 형식의 이메일 주소입니다.');
        setTimeout(function(){ $('#email').focus(); }, 10)
        return false;
    }else{
    	check_email = true;
    }
});

// 휴대폰 번호 정규식
function cell_check(cell) {    
var regex = /^\d{2,3}-\d{3,4}-\d{4}$/;
return (cell != '' && cell != 'undefined' && regex.test(cell)); 
}
$("input[name='cell']").blur(function(){

    var cell = $(this).val();
    if( cell == '' || cell == 'undefined') return;

    if(! cell_check(cell) ) {
    	alert("잘못된 휴대폰 번호입니다. 숫자, - 를 포함한 숫자만 입력하세요.");
        setTimeout(function(){ $('#cell').focus(); }, 10)
        return false;
    }else{
    	check_cell = true;
    }
});

// 비밀번호 정규식
function pw_check(password) {    
	var regex = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/;
return (password != '' && password != 'undefined' && regex.test(password)); 
}
$("input[name='password']").blur(function(){

    var password = $(this).val();
    if( password == '' || password == 'undefined') return;

    if(! pw_check(password) ) {
    	alert("잘못된 비밀번호 번호입니다. 숫자와 문자, 기호를 포함한 8자리 이상의 비밀번호를 입력하세요.");
        setTimeout(function(){ $('#password_1').focus(); }, 10)
        return false;
    }else{
    	check_pw = true;
    }
});

$('.pw').focusout(function () {
var pwd1 = $("#password_1").val();
var pwd2 = $("#password_2").val();

if ( pwd1 != '' && pwd2 == '' ) {
    null;
} else if (pwd1 != "" || pwd2 != "") {
    if (pwd1 == pwd2) {
        $("#alert-success").css('display', 'inline-block');
        $("#alert-danger").css('display', 'none');
    } else {
        alert("비밀번호가 일치하지 않습니다. 비밀번호를 재확인해주세요.");
        $("#alert-success").css('display', 'none');
        $("#alert-danger").css('display', 'inline-block');
    }
}
});

function sample6_execDaumPostcode() {
new daum.Postcode({
    oncomplete: function(data) {
        // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

        // 각 주소의 노출 규칙에 따라 주소를 조합한다.
        // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
        var addr = ''; // 주소 변수
        var extraAddr = ''; // 참고항목 변수

        //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
        if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
            addr = data.roadAddress;
        } else { // 사용자가 지번 주소를 선택했을 경우(J)
            addr = data.jibunAddress;
        }

        // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
        if(data.userSelectedType === 'R'){
            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if(data.buildingName !== '' && data.apartment === 'Y'){
                extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if(extraAddr !== ''){
                extraAddr = ' (' + extraAddr + ')';
            }
            // 조합된 참고항목을 해당 필드에 넣는다.
            document.getElementById("sample6_extraAddress").value = extraAddr;
        
        } else {
            document.getElementById("sample6_extraAddress").value = '';
        }

        // 우편번호와 주소 정보를 해당 필드에 넣는다.
        document.getElementById('sample6_postcode').value = data.zonecode;
        document.getElementById("sample6_address").value = addr;
    }
}).open();
}