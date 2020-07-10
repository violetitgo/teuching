<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Fonts -->
    <link rel="dns-prefetch" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css?family=Raleway:300,400,600" rel="stylesheet" type="text/css">

    <link rel="stylesheet" href="http://52.78.116.59:8080/teuching/resources/css/loginform.css">

    <link rel="icon" href="Favicon.png">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">

	<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
	<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

	<!-- 라디오 css -->
	<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
	<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	

<title>Teu-Ching Teu-Ching</title>

<style type="text/css">

.toggle_radio{
  position: relative;
  background: #215d9e;
  margin: 4px auto;
  overflow: hidden;
  padding: 0 !important;
  -webkit-border-radius: 50px;
  -moz-border-radius: 50px;
  border-radius: 50px;
  position: relative;
  height: 26px;
  width: 215px;
}
.toggle_radio > * {
  float: left;
}
.toggle_radio input[type=radio]{
  display: none;
  /*position: fixed;*/
}
.toggle_radio label{
  font: 90%/1.618 "Source Sans Pro";
  color: rgba(255,255,255,.9);
  z-index: 0;
  display: block;
  width: 100px;
  height: 20px;
  margin: 3px 3px;
  -webkit-border-radius: 50px;
  -moz-border-radius: 50px;
  border-radius: 50px;
  cursor: pointer;
  z-index: 1;
  /*background: rgba(0,0,0,.1);*/
  text-align: center;
  /*margin: 0 2px;*/
  /*background: blue;*/ /*make it blue*/
}
.toggle_option_slider{
  /*display: none;*/
  /*background: red;*/
  width: 100px;
  height: 20px;
  position: absolute;
  top: 3px;
  -webkit-border-radius: 50px;
  -moz-border-radius: 50px;
  border-radius: 50px;
  -webkit-transition: all .4s ease;
  -moz-transition: all .4s ease;
  -o-transition: all .4s ease;
  -ms-transition: all .4s ease;
  transition: all .4s ease;
}

#first_toggle:checked ~ .toggle_option_slider{
  background: rgba(255,255,255,.3);
  left: 3px;
}
#second_toggle:checked ~ .toggle_option_slider{
  background: rgba(255,255,255,.3);
  left: 109px;
}
</style>


</head>
<body>
	
	<main class="login-form">
		<div class="cotainer">
			<div class="row justify-content-center">
				<div class="col-md-8">
					<div class="card" style="width	: 50% !important; left: 22%;">
						<div class="card-header">Login</div>
						<div class="card-body">
							<form name="signFrm" id="signFrm"
							action="http://52.78.116.59:8080/teuching/member/loginImple.do" method="post">
								<!-- 일반회원, 트레이너 체크버튼 -->
								<div class="form-group row">
									<div class="col-md-6 offset-md-4">
										<div class="wrapper">
											<div class="toggle_radio">
												<input type="radio" class="toggle_option" id="first_toggle"	name="account" value="member"checked> 
													<input type="radio" class="toggle_option" id="second_toggle" name="account" value="trainer"> 
													 <label for="first_toggle"><p>Member</p></label> 
													<label for="second_toggle"><p>Trainer</p></label>
												<div class="toggle_option_slider"></div>
											</div>
										</div>
									</div>
									<br>
								</div>

								<div class="form-group row">
									<label for="email"
										class="col-md-4 col-form-label text-md-right">E-Mail
										Address</label>
									<div class="col-md-6">
										<input type="text" id="email" class="form-control"
											name="email" required autofocus>
									</div>
								</div>

								<div class="form-group row">
									<label for="password"
										class="col-md-4 col-form-label text-md-right">Password</label>
									<div class="col-md-6">
										<input type="password" id="password" class="form-control"
											name="password" required>
									</div>
								</div>

								<div class="form-group row">
									<div class="col-md-6 offset-md-4">
										<div class="checkbox">
											<label> <input type="checkbox" name="remember">
												아이디 저장하기
											</label>
										</div>
									</div>
								</div>

								<div class="col-md-6 offset-md-4">
									<button type="button" id="signUp" class="btn btn-primary">로그인</button>
									<a href="http://52.78.116.59:8080/teuching/member/findpwform.do" class="btn btn-link"> 비밀번호 찾기 </a>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	
	</main>

	<script type="text/javascript">
	
	
		$('#signUp').click(function(){
			
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
		
		
	</script>






</body>
</html>