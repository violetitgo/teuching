<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
<!-- 기존꺼말고 새로갖다박은거임 -->
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
	<style>
	#ftco-nav{
		transform: translateX(15%); !important
	}
	</style>
	
</head>
<body>
	<%@ include file="../include/top.jsp"%>

	<script
		src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
	<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
	<!------ Include the above in your HEAD tag ---------->
	
	<div style="height:50px;width:18%;transform:translateX(220%);"class="div">
		<h4 style="float:left;padding-bottom:3%;border-bottom:2px solid lightblue;padding-left:1%;padding-right:1%;"><a style="color:black;" href="http://52.78.116.59:8080/teuching/manager/report.do">🚨 신고</a></h4>
		<h4 style="float:right;padding-bottom:3%;border-bottom:2px solid lightgray;padding-right:1%;"><a style="color:black;" href="http://52.78.116.59:8080/teuching/manager/quali.do">🏅 자격증명</a></h4>
	</div>
	<br>
	<div class="container" style="width:62%;">

		<div class="row" style="transform:translateX(-10%)">

			<ul class="nav nav-pills nav-stacked admin-menu"
				style="float:left;transform: translate(80%,30%)">
				<li class="active"><a href="http://52.78.116.59:8080/teuching/manager/report.do" data-target-id="profile">트레이너 신고</a></li>
			</ul>
			<ul class="nav nav-pills nav-stacked admin-menu"
				style="float:left;">
				<li class="active"><a href="http://52.78.116.59:8080/teuching/manager/reviewreport.do" data-target-id="profile">리뷰 신고</a></li>
			</ul>

			<div class="col-md-9  admin-content" id="profile" style="transform:translate(35%,-12%);">
				<c:forEach items="${res.resTra.selectTraReport }" var="r">
					<div class="panel panel-info" style="margin: 1em;">
						<div class="panel-heading">
							<c:if test="${r.ans_yn eq 'Y' }">
								<h4 style="float: right; transform: translateY(-50%)">✔답변완료</h4>
							</c:if>
							<a
								href="http://52.78.116.59:8080/teuching/manager/reportdetail.do?traid=${r.report_idx}">
							<h3 class="panel-title">${ r.report_date}</h3>
							</a>
						</div>
						<div class="panel-body">
							<a
								href="http://52.78.116.59:8080/teuching/manager/reportdetail.do?traid=${r.report_idx}">
								
								<c:if test="${fn:length(r.rep_cont) > 35 }">
										${fn:substring(r.rep_cont, 0, 35) }...
								</c:if>
								<c:if test="${fn:length(r.rep_cont) <= 35 }">
									${ r.rep_cont}
								</c:if>
								
								</a>
						</div>
					</div>
				</c:forEach>
				<div class="row mt-5" style="transform: translateX(22%)">
					<div class="col">
						<div class="block-27">
							<ul>
								<c:if test="${res.resTra.pagingTra.blockStart le 1 }">
									<li><a
										href="http://52.78.116.59:8080/teuching
								/manager/report.do?tracurrentpage=${res.resTra.pagingTra.blockStart}">&lt;</a></li>
								</c:if>
								<c:if test="${res.resTra.pagingTra.blockStart gt 1 }">
									<li><a
										href="http://52.78.116.59:8080/teuching
								/manager/report.do?tracurrentpage=${res.resTra.pagingTra.blockStart-1}">&lt;</a></li>
								</c:if>
								<c:forEach begin="${res.resTra.pagingTra.blockStart }"
									end="${res.resTra.pagingTra.blockEnd }" var="pt">
									<li class="active"><span> <a
											href="http://52.78.116.59:8080/teuching/manager/report.do?tracurrentpage=${pt}">${pt }</a>
									</span></li>
								</c:forEach>
								<c:if
									test="${res.resTra.pagingTra.blockEnd lt res.resTra.pagingTra.lastPage }">
									<li><a
										href="http://52.78.116.59:8080/teuching
								/manager/report.do?tracurrentpage=${res.resTra.pagingTra.blockEnd+1}">&gt;</a></li>
								</c:if>
								<c:if
									test="${res.resTra.pagingTra.blockEnd ge res.resTra.pagingTra.lastPage }">
									<li><a
										href="http://52.78.116.59:8080/teuching
								/manager/report.do?tracurrentpage=${res.resTra.pagingTra.blockEnd}">&gt;</a></li>
								</c:if>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<br><br>
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
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
	<script src="http://52.78.116.59:8080/teuching/resources/js/google-map.js"></script>
	<script src="http://52.78.116.59:8080/teuching/resources/js/main.js"></script>
</body>
</html>