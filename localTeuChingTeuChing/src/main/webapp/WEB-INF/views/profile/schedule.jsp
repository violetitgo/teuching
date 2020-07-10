<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>Teu-Ching Teu-Ching</title>

<style>

#current-year-month{
	font-weight: bold;
	font-size : 17px;
	color : #ffb5b5;
	font-family: 'Nanum Pen Script', cursive;
	font-family: 'Nunito', sans-serif;
}

td p{
	margin-top: -22px;
	font-weight: bold;
	color:#ffb5b5;
	font-family: 'Nanum Pen Script', cursive;
font-family: 'Nunito', sans-serif;
}

td a{
	width: 100px;
	transform: translateX(25%);
}

#sctitle {
	color:#ffb5b5;
	font-family: 'Nanum Pen Script', cursive;
	font-size:1.3vw;
	padding-left: -8%;
	
	
}
#noclick{
	color : red;

}


</style>



<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
	<link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&family=Nunito:ital,wght@1,600&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&family=Nunito:ital,wght@1,600&display=swap" rel="stylesheet">

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
</head>
<body>
	<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
	<%@include file="../include/top.jsp"%>


	<!-- 시작 시작시작시작시작시작시작시작시작시작시작시작시작시작시작시작시작시작시작시작시작시작시작시작시작시작시작시작시작시작시작시작시작시작시작시작시작시작시작 -->

	<section class="hero-wrap hero-wrap-2"
		style="background-image: url('http://52.78.116.59:8080/teuching/resources/img/bg_3.jpg');"
		data-stellar-background-ratio="0.5">
		<div class="overlay"></div>
		<div class="container">
			<div
				class="row no-gutters slider-text js-fullheight align-items-center justify-content-center">
				<div class="col-md-9 ftco-animate text-center">
					<h1 class="mb-3 bread">S C H E D U L E</h1>
					<p class="breadcrumbs">
						<span class="mr-2">Trainer</span> <span>Schedule</span>
					</p>
				</div>
			</div>
		</div>
	</section>

	<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center mb-8 pb-6">
				<div class="text-center">
					<p id="sctitle">예약은 해당 트레이너와 쪽지 후 최종 매칭이 가능합니다.</p>
					
					<br>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<div class="table-responsive">
						<table class="table table-bordered text-center" border="1" style="table-layout: fixed">
							<thead>
							
							<!-- 이전달, 다음달 -->
								<tr>
								<td>
									<a href="#a" id="prev"> 이전달 <i class="ion-ios-arrow-round-back"></i></a>											
								</td>	
								<td align="center" id="current-year-month" colspan="5"></td>
								<td>
									<a href="#a" id="next"> 다음달 <i class="ion-ios-arrow-round-forward"></i></a>
								</td>
								</tr>
								
								<!-- 요일 -->
								<tr class="bg-primary text-white">
									<td>Sun</td>
									<td>Mon</td>
									<td>Tue</td>
									<td>Wed</td>
									<td>Thu</td>
									<td>Fri</td>
									<td>Sat</td>
								</tr>
								
							</thead>
							
							<tbody id="calendar-body" class="calendar-body"></tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</section>
	<form id="form" action="http://52.78.116.59:8080/teuching/message/matchform.do" target="pop">
		<input type="hidden" id="year" value="" name="year">
		<input type="hidden" id="month" value="" name="month">
		<input type="hidden" id="date" value="" name="date">
		<input type="hidden" id="date" value="${tr_email }" name="tr_email">
	</form>
	
	
		<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
 <script src="http://52.78.116.59:8080/teuching/resources/js/profile/schedule.js"></script>
	  
	
	<%@ include file="../include/footer.jsp"%>
	
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
	<script src="http://52.78.116.59:8080/teuching/resources/js/main.js"></script>


</body>
</html>