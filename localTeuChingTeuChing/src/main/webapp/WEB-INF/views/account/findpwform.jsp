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
    <link rel="icon" href="Favicon.png">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
	<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">

<title>Teu-Ching Teu-Ching</title>

<style type="text/css">

input::placeholder {
  font-size: 11px;
}
.btn-primary{
	background: #ffb5b5 !important;
	border-color: #ffb5b5 !important;
}  
.btn-link{
	color: #cc9de4 !important;
}  
.btn-link:hover {
    color: #ffb5b5 !important;
}
  
</style>


</head>
<body>
	
	<main class="login-form" style="margin-top: 5% !important; margin-bottom: 4% !important;">
		<div class="cotainer">
			<div class="row justify-content-center" style="background-color: transparent !important;">
				<div class="col-md-8">
					<div class="card" style="width	: 50% !important; left: 22%;">
						<div class="card-header">비밀번호 찾기</div>
						<div class="card-body">
							<form name="signFrm" id="signFrm"
							action="http://52.78.116.59:8080/teuching/member/findpw.do" method="post">
								<div class="form-group row">
									<label for="email"
										class="col-md-4 col-form-label text-md-right">가입한 E-Mail</label>
									<div class="col-md-6">
										<input type="text" id="email" class="form-control" placeholder="이메일로 임시 비밀번호를  발송해드립니다."
											name="email" required autofocus>
									</div>
								</div>
								<div class="col-md-6 offset-md-4">
									<button type="button" id="signUp" class="btn btn-primary">임시 비밀번호 발송하기</button>
									<a href="http://52.78.116.59:8080/teuching/index/index.do" class="btn btn-link"> 메인으로 돌아가기 </a>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	
	</main>

<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="http://52.78.116.59:8080/teuching/resources/js/account/findpwform.js"></script>

</body>
</html>