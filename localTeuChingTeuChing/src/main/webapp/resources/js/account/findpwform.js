var idx_email = false;

		$('#signUp').click(function() {

			if ($.trim($('#email').val()) == '') {
				alert("이메일을 입력해주세요.");
				$('#email').focus();
				return;
			}

			$.ajax({
				url : "http://52.78.116.59:8080/teuching/member/emailchk.do",
				type : "POST",
				data : {
					"email" : $('#email').val()
				},
				success : function(data) {
					if (data == 0 && $.trim($('#email').val()) != '') {
						alert("가입 정보가 없습니다 이메일을 확인해 주세요.");
						$("#email").empty();
						return;
					} else {
						alert("작성하신 이메일로 임시 비밀번호가 발송되었습니다.");
						$('#signFrm').submit();
					}
				},
				error : function() {
					alert("서버에러");
				}
			});
		});
		
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