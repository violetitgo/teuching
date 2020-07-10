		$('#goodbye').click(function() {

			if ($.trim($('#password').val()) == '') {
				alert("비밀번호를 입력해주세요.");
				$('#password').focus();
				return;
			}else{
				$('#goodbyeFrm').submit();
			}
		});