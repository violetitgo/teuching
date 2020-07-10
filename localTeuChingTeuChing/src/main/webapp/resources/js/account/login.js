


$(function(){
	
	$('#btnModal').click(function() {
		$('#loginModal').modal();
	});
});

$(function(){
	
	$('#btnJModal').click(function() {
		$('#joinModal').modal();
	});
});



$('#btnLogin').click(function(){
			
			if($.trim($('#email').val()) == ''){
				alert("이메일을 입력해주세요.");
				$('#email').focus();
				return;
			}else if($.trim($('#password').val()) == ''){
				alert("패스워드를 입력해주세요.");
				$('#password').focus();
				return;
			}else{
				$('#signFrm').submit();
				
			}
			
		});