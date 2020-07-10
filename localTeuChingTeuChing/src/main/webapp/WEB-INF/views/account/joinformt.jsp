<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Teu-Ching Teu-Ching</title>
<style>
input::placeholder {
	color: gray;
	font-size: small;
}

html {
	background-image: url(http://52.78.116.59:8080/teuching/resources/img/tr4.jpg) !important;
	-webkit-background-size: cover;
	-moz-background-size: cover;
	-o-background-size: cover;
	background-size: cover;
	overflow-x: hidden;
}

body {
	background-color: transparent !important;
}

#imagePreview {
	width: 240px;
	height: 300px;
	overflow: hidden !important;
}

</style>

<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
<!-- 카카오지도 -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=42e0be41ec144283c6bfe7c0ed8dae35&libraries=services"></script>

</head>
<body>

<div class="main-content">
		<div class="container mt-7">
			<!-- Table -->
			<div class="row">
				<div class="col-xl-8 m-auto order-xl-1" style="margin-top: 5% !important; margin-bottom: 4% !important;">
					<div class="card bg-secondary shadow" style="background-color: #f8f9fe !important;">
					<form id="signFrm" name="signFrm"
					  action="http://52.78.116.59:8080/teuching/member/t_joinemailCheck.do" 
	       					method="post" enctype="multipart/form-data">
						<div class="card-header bg-white border-0">
							<div class="row align-items-center">
								<div class="col-8">
									<h3 class="mb-0">트칭 트레이너 회원가입</h3>
								</div>
								<div class="col-4 text-right">
									<button type="button" id="signUp" class="btn btn-sm btn-primary">가입하기</button>
								</div>
							</div>
						</div>
						<div class="card-body">
							
								<h6 class="heading-small text-muted mb-4">User information</h6>
								<div class="pl-lg-4">
									<div class="row">
										<div class="col-lg-6">
											<div class="form-group">
												<label class="form-control-label">Email 주소</label> 
												<button type="button" id="check_email" style="font-size: small;">중복확인</button><br>
												<input type="email" id="email" name="email" maxlength="50"
													class="form-control form-control-alternative"
													placeholder="작성하신 주소로 인증메일이 발송됩니다."
													style= "font-size: small; width:100%; height:30px">
														<span id="emailChk"></span>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-lg-6">
											<div class="form-group focused">
												<label class="form-control-label">비밀번호
													</label> <input type="password" id="password_1"
													name="password" class="pw" maxlength="20"
													style="display: block; width: 100%; padding: .375rem .75rem; font-size: 1rem; line-height: 1.5; color: #495057; background-color: #fff; background-clip: padding-box; border: 1px solid #ced4da; border-radius: .25rem; transition: border-color .15s ease-in-out, box-shadow .15s ease-in-out;">
											</div>
										</div>
										<div class="col-lg-6">
											<div class="form-group focused">
												<label class="form-control-label">비밀번호 확인</label> 
												<input type="password" id="password_2"
													class="pw"
													style="display: block; width: 100%; padding: .375rem .75rem; font-size: 1rem; line-height: 1.5; color: #495057; background-color: #fff; background-clip: padding-box; border: 1px solid #ced4da; border-radius: .25rem; transition: border-color .15s ease-in-out, box-shadow .15s ease-in-out;">
												<span id="alert-success" style="display: none;">비밀번호가 일치합니다.</span>
    											<span id="alert-danger" style="display: none; color: #d92742; font-weight: bold; ">
    											비밀번호가 일치하지 않습니다.</span>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-lg-6">
											<div class="form-group focused">
												<label class="form-control-label">성함 
													</label> <input type="text" id="name" name="name" maxlength="20"
													class="form-control form-control-alternative">
											</div>
										</div>
										<div class="col-lg-6">
											<div class="form-group focused">
												<label class="form-control-label">성별
												</label> 
													<select class="form-control form-control-alternative"
													style="font-size: small;" name="gender" id="gender">
													<option>남성</option>
													<option>여성</option>
												</select>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-lg-6">
											<div class="form-group focused">
												<label class="form-control-label">신장 (cm)
													</label> <input type="text" id="height" name="height"
													class="form-control form-control-alternative"
													placeholder="HEIGHT">
											</div>
										</div>
										<div class="col-lg-6">
											<div class="form-group focused">
												<label class="form-control-label">체중 (kg)
													</label> <input type="text" id="weight" name="weight"
													class="form-control form-control-alternative"
													placeholder="WEIGHT">
											</div>
										</div>
									</div>
								</div>
								<hr class="my-4">
								<!-- Address -->
								<h6 class="heading-small text-muted mb-4">Contact
									information</h6>
								<div class="pl-lg-4">
								<div class="row">
										<div class="col-lg-4">
											<div class="form-group focused">
												<label class="form-control-label">연락처 <br><span style="font-size: small;">붙임표(-)까지 입력해주세요.</span></span></label>
												<input type="text" id="cell" name="cell" maxlength="13"
													class="form-control form-control-alternative">
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-md-12">
											<div class="form-group focused">
												<label class="form-control-label" for="input-address">트레이닝 가능 장소 주소 입력</label><br>
												<input type="text" id="sample6_postcode" placeholder="우편번호">
												<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
												<label class="form-control-label" for="input-address"></label><br>
												<input type="text" id="sample6_address" placeholder="주소" name="address"
												style="width:55%; height:30px;">
												<label class="form-control-label" for="input-address"></label><br><br>
												<input type="text" id="sample6_detailAddress" placeholder="상세주소" name="address_detail">
												<label class="form-control-label" for="input-address"></label>
												<input type="text" id="sample6_extraAddress" placeholder="참고항목">
											</div>
										</div>
									</div>
								</div>
								<hr class="my-4">
								<!-- Description -->
								<h6 class="heading-small text-muted mb-4">About Me</h6>
								<div class="pl-lg-4">
									<div class="row">
										<div class="col-lg-4">
											<div class="form-group focused">
												<label class="form-control-label">프로필 사진 등록</label>
												<div id="imagePreview">
													<img id="img">
												</div>
												<input type="file" id="photo" accept="image/*"
													onchange="setThumbnail(event);" name="file" />
											</div>
										</div>
									</div>
									<label class="form-control-label"><span>트레이닝 가능 종목 입력하기</span></label>
									<div class="row">
										<div class="col-lg-2">
											<div class="form-group focused">
												 <input type="text" id="keyword1" name="keyword1"
													class="form-control form-control-alternative">
											</div>
										</div>
										<div class="col-lg-2">
											<div class="form-group focused">
												<input type="text" id="keyword2" name="keyword2"
													class="form-control form-control-alternative">
											</div>
										</div>
										<div class="col-lg-2">
											<div class="form-group focused">
												<input type="text" id="keyword3" name="keyword3"
													class="form-control form-control-alternative">
											</div>
										</div>
										<div class="col-lg-2">
											<div class="form-group focused">
												<input type="text" id="keyword4" name="keyword4"
													class="form-control form-control-alternative">
											</div>
										</div>
										<div class="col-lg-2">
											<div class="form-group focused">
												<input type="text" id="keyword5" name="keyword5"
													class="form-control form-control-alternative">
											</div>
										</div>
									</div>
									<br>
									<div class="row">
										<div class="pl-lg-4">
											<div class="form-group focused">
												<label>트레이너님을 소개하는 인사말과 커리어</label>
												<textarea class="form-control form-control-alternative" cols="80" rows="10" id="career"
												placeholder="트레이너님을 나타낼 수 있는 정보와 커리어를 자유롭게 작성해 주세요." name="career"></textarea>	
												<br />
												<span style="color:#aaa;" id="counter">(0 / 최대 500자)</span>
											</div>
										</div>
									</div>
									<br>
									<div class="row">
										<div class="col-lg-12">
											<div class="form-group focused">
												<label class="form-control-label" for="input-address">선호 지역 선택하기</label>
												<br>
												지역 1 
												<select name="prefer1-1" id="sido1"></select>
												<select name="prefer1-2" id="gugun1"></select>
												<br>
												지역 2 
												<select name="prefer2-1" id="sido2"></select>
												<select name="prefer2-2" id="gugun2"></select>
												<br>
												지역 3 
												<select name="prefer3-1" id="sido3"></select>
												<select name="prefer3-2" id="gugun3"></select>
											</div>
										</div>
									</div>	
								</div>
								</div>
							</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script src="http://52.78.116.59:8080/teuching/resources/js/account/joinT.js"></script>

</body>
</html>