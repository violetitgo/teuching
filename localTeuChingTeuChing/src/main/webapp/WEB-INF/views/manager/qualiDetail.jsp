<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>Teu-Ching Teu-Ching</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">


<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700&display=swap"
	rel="stylesheet">

<link
	href="https://fonts.googleapis.com/css?family=EB+Garamond:400,400i,500,500i,600,600i,700,700i&display=swap"
	rel="stylesheet">

<link rel="stylesheet"
	href="http://52.78.116.59:8080/teuching/resources/css/open-iconic-bootstrap.min.css">
<link rel="stylesheet" href="http://52.78.116.59:8080/teuching/resources/css/animate.css">

<link rel="stylesheet" href="http://52.78.116.59:8080/teuching/resources/css/owl.carousel.min.css">
<link rel="stylesheet" href="http://52.78.116.59:8080/teuching/resources/css/owl.theme.default.min.css">
<link rel="stylesheet" href="http://52.78.116.59:8080/teuching/resources/css/magnific-popup.css">

<link rel="stylesheet" href="http://52.78.116.59:8080/teuching/resources/css/aos.css">

<link rel="stylesheet" href="http://52.78.116.59:8080/teuching/resources/css/ionicons.min.css">

<link rel="stylesheet" href="http://52.78.116.59:8080/teuching/resources/css/bootstrap-datepicker.css">
<link rel="stylesheet" href="http://52.78.116.59:8080/teuching/resources/css/jquery.timepicker.css">


<link rel="stylesheet" href="http://52.78.116.59:8080/teuching/resources/css/flaticon.css">
<link rel="stylesheet" href="http://52.78.116.59:8080/teuching/resources/css/icomoon.css">
<link rel="stylesheet" href="http://52.78.116.59:8080/teuching/resources/css/style.css">
<link rel="stylesheet" href="http://52.78.116.59:8080/teuching/resources/css/manager/qualiDetail.css">


</head>
<body>
	<%@ include file="../include/top.jsp"%>

	<div class="wrapper">
		<div class="ansbox-top">
			<h1 style="text-align: center; font-size: 2.5vw">
				<a
					href="http://52.78.116.59:8080/teuching
					/manager/qualidetail/auth.do?quali_idx=${ res.quali_idx}"
					class="btn btn-outline-primary"
					style="transform: translateX(200%);"
					onclick="if(!confirm('승인하시겠습니까?')){return false;}">승인하기</a><br>
				${res.trainer_name } 트레이너<br>
				
			</h1>
			<div style="transform: translateX(27%)">
				<img src="http://52.78.116.59:8080/teuching/resources/upload/profileImg/${res.tr_email}.PNG"
					style="width: 280px; height: 300px; float: left; border-radius: 1000px;">
				<p style="clear: both"></p>
				<div style="transform: translateX(5%); margin-top: -2%">
					<div>
						<h5 style="float: left; font-weight: bold; margin-right: 1%;">지역</h5>
						<h5 style="float: left">${trainer.address }</h5>
					</div>
					<p style="clear: both"></p>
					<div>
						<h5 style="float: left; font-weight: bold; margin-right: 1%;">번호</h5>
						<h5 style="float: left">${trainer.cell }</h5>
					</div>
					<p style="clear: both"></p>
					<div>
						<h5 style="float: left; font-weight: bold; margin-right: 1%;">메일</h5>
						<h5 style="float: left">${trainer.tr_email }</h5>
					</div>
					<p style="clear: both"></p>
					<div>
						<h5 style="float: left; font-weight: bold; margin-right: 1%;">요청</h5>
						<h5 style="float: left">${res.quali_auth }</h5>
					</div>
				</div>
			</div>
			<br> <br> <br>
			<div class="col-lg-8 ftco-animate">
				<div class="row">
					<div class="col-md-3 ftco-animate">
						<a
							href="http://52.78.116.59:8080/teuching/resources/upload/${file }"
							onerror="javascript:src={http://52.78.116.59:8080/teuching/resources/img/auth.jpg}"
							class="gallery image-popup img d-flex align-items-center"
							style="height: 195px; width: 400px; background-image: url(http://52.78.116.59:8080/teuching/resources/img/check.png); transform: translateX(6%)">
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<script src="http://52.78.116.59:8080/teuching/resources/js/jquery.min.js"></script>
	<script src="http://52.78.116.59:8080/teuching/resources/js/jquery-migrate-3.0.1.min.js"></script>
	<script src="http://52.78.116.59:8080/teuching/resources/js/popper.min.js"></script>
	<script src="http://52.78.116.59:8080/teuching/resources/js/bootstrap.min.js"></script>
	<script src="http://52.78.116.59:8080/teuching/resources/js/jquery.easing.1.3.js"></script>
	<script src="http://52.78.116.59:8080/teuching/resources/js/jquery.waypoints.min.js"></script>
	<script src="http://52.78.116.59:8080/teuching/resources/js/jquery.stellar.min.js"></script>
	<script src="http://52.78.116.59:8080/teuching/resources/js/owl.carousel.min.js"></script>
	<script src="http://52.78.116.59:8080/teuching/resources/js/jquery.magnific-popup.min.js"></script>
	<script src="http://52.78.116.59:8080/teuching/resources/js/aos.js"></script>
	<script src="http://52.78.116.59:8080/teuching/resources/js/jquery.animateNumber.min.js"></script>
	<script src="http://52.78.116.59:8080/teuching/resources/js/bootstrap-datepicker.js"></script>
	<script src="http://52.78.116.59:8080/teuching/resources/js/jquery.timepicker.min.js"></script>
	<script src="http://52.78.116.59:8080/teuching/resources/js/scrollax.min.js"></script>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
	<script src="http://52.78.116.59:8080/teuching/resources/js/google-map.js"></script>
	<script src="http://52.78.116.59:8080/teuching/resources/js/main.js"></script>
</body>
</html>