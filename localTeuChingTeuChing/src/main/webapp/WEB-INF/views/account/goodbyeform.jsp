<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
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
						<div class="card-header">그동안 TeuChing을 이용해 주셔서 감사합니다.</div>
						<div class="card-body"> 
							<form name="goodbyeFrm" id="goodbyeFrm"
							action="http://52.78.116.59:8080/teuching/member/goodbyeupdate.do" method="post">
								<div class="form-group row">
									<label for="password"
										class="col-md-4 col-form-label text-md-right">비밀번호</label>
									<div class="col-md-6">
										<input type="password" id="password" class="form-control" placeholder="현재 비밀번호를 입력해주세요."
											name="password" required autofocus>
											 <input	type="hidden" name="account" value="${memberType}" />
										<c:if test="${loginInfo != null}">
											<c:if test="${memberType eq 'member'}">
												<input	type="hidden" name="email" value="${loginInfo.mem_email}" />
											</c:if>
											<c:if test="${memberType eq 'trainer'}">
												<input	type="hidden" name="email" value="${loginInfo.tr_email}" />
											</c:if>
										</c:if>
									</div>
								</div>
								<div class="col-md-6 offset-md-4">
									<button type="button" id="goodbye" class="btn btn-primary">회원 탈퇴하기</button>
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
<script src="http://52.78.116.59:8080/teuching/resources/js/account/goodbyeform.js"></script>

</body>
</html>