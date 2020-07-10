<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<link rel="stylesheet" href="http://52.78.116.59:8080/teuching/resources/css/manager/managerAnswer.css">

</head>
<body>
	<%@ include file="../include/top.jsp"%>
	<div class="wrapper">
		<div class="ansbox-top">
			<div
				class="img rounded-circle ftco-animate mb-2 fadeInUp ftco-animated"
				style="float: left; background-image: url(http://52.78.116.59:8080/teuching/resources/upload/profileImg/${res.tr_email}.PNG); width: 15%; height: 75%;">
				<c:if test="${ res.ans_yn eq 'Y'}">
					<div
						style="text-align: right; transform: translate(-70%, -35%); color: #b91e2d; font-size: 5vw">✔</div>
				</c:if>
			</div>

			<form
				action="http://52.78.116.59:8080/teuching/manager/reportdetail/modify.do"
				method="post">
				<h5>${res.report_date }
					<c:if test="${res.type eq 'tra' }">
						<input type="hidden" name="type" value="tra">
					</c:if>
					<c:if test="${res.type eq 'rev' }">
						<input type="hidden" name="type" value="rev">
					</c:if>
					<input type="hidden" name="report_idx" value="${res.report_idx }">
					<button type="submit" class="btn btn-outline-primary"
						style="transform: translateX(250%);">작성완료</button>
				</h5>
				<c:if test="${res.type eq 'tra' }">
					<h2>${ res.nick_name}님의 문의내역 입니다</h2>
				</c:if>
				<c:if test="${res.type eq 'rev' }">
					<h2>${ res.trainer_name}님의 문의내역 입니다</h2>
				</c:if>
		</div>
		<div class="ansbox-bottom">

			<div class="col-lg-8 ftco-animate">
				<h3 class="mb-4">신고내용</h3>
				<p id="font-size">${res.rep_cont }</p>
			</div>

			<div class="col-lg-8 ftco-animate">
				<h3 class="mb-4">처리결과</h3>

				<div class="form-group purple-border">
					<textarea name="report_handel" class="form-control"
						id="exampleFormControlTextarea4" rows="3">${res.report_handel }</textarea>
				</div>

			</div>

			<div class="col-lg-8 ftco-animate">
				<h3 class="mb-4">처리내용</h3>
				<div class="form-group green-border-focus">
					<textarea name="handel_cont" class="form-control"
						id="exampleFormControlTextarea5" rows="3" style="">${res.handel_cont }</textarea>
				</div>
			</div>
		</div>
		</form>
	</div>
	<br>
	<br>
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