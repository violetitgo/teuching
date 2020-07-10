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
<link
	href="https://rawgithub.com/hayageek/jquery-upload-file/master/css/uploadfile.css"
	rel="stylesheet">
<link rel="stylesheet" href="http://52.78.116.59:8080/teuching/resources/css/manager/writeReport.css">
</head>
<body>
	<%@ include file="../include/top.jsp"%>

	<div class="wrapper">
		<div class="ansbox-top">
			<div
				style="background-image:url(http://52.78.116.59:8080/teuching/resources/upload/profileImg/${res.tr_email}.PNG)"
				class="img rounded-circle ftco-animate mb-2 fadeInUp ftco-animated"
				id="person"></div>
			<form
				action="http://52.78.116.59:8080/teuching/report/insertreport.do"
				method="post" enctype="multipart/form-data">
				<h5>
					트레이너
					<button type="submit" class="btn btn-outline-primary" id="btn"
						onclick="if(!confirm('신고하시겠습니까?')){return false;}">작성완료</button>
				</h5>
				<h2>신고하기</h2>
		</div>
		<div class="ansbox-bottom">

			<div class="col-lg-8 ftco-animate">
				<input type="file" multiple id="startbutton"
					class="ajax-file-upload-green" name="files" value="Upload">
				<textarea name="rep_cont" class="form-control" id="textarea"
					style=""></textarea>
			</div>
			<input type="hidden" name="type" value="${res.type }"> <input
				type="hidden" name="tr_email" value="${res.tr_email }"> <input
				type="hidden" name="mem_email" value="${res.mem_email }">
			<c:if test="${res.type eq 'tra' }">
				<input type="hidden" name="nick_name" value="${res.nick_name }">
			</c:if>
			<c:if test="${res.type eq 'rev' }">
				<input type="hidden" name="trainer_name"
					value="${res.trainer_name }">
			</c:if>
		</div>
		</form>

	</div>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<script>
		$('#textarea').keyup(function(e) {
			var content = $(this).val();
			if (content.length > 700) {
				alert("최대 700자까지 입력 가능합니다.");
				$(this).val(content.substring(0, 700));
			}
		});
	</script>
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
	<script src="http://52.78.116.59:8080/teuching/resources/js/main.js"></script>
	<script
		src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js"></script>
	<script
		src="https://rawgithub.com/hayageek/jquery-upload-file/master/js/jquery.uploadfile.min.js"></script>
</body>
</html>