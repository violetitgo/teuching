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
<link rel="stylesheet" href="http://52.78.116.59:8080/teuching/resources/css/message/msgBoxSend.css">
</head>
<body>
	<%@ include file="../include/top.jsp"%>

	<div class="wrapper">
		<div class="innerwrapper">
			<div class="menu">
				<a
					style="float: left; border-bottom: 2px solid lightgray; color: black"
					href="http://52.78.116.59:8080/teuching/message/msgboxrecv.do">
					📬 받은쪽지</a> <a
					style="float: right; border-bottom: 2px solid pink; color: black"
					href="http://52.78.116.59:8080/teuching/message/msgboxsend.do">
					📪 보낸쪽지</a>
			</div>
			<div id="table">
				<table>
					<thead>
						<tr>
							<th>Num</th>
							<th id="title">Title</th>
							<th>To</th>
							<th>Date</th>
						</tr>
					</thead>
					<tbody id="tbody">
						<c:forEach items="${res.msg }" var="msg" varStatus="cnt">
							<form id="form"
								action="http://52.78.116.59:8080/teuching/message/msgsenddetail.do"
								target="pop">
								<tr>
									<td id="num">${(res.paging.currentPage-1) * 5 + cnt.count }</td>
									<td><button onclick="openPopUp();" id="btn">
									<c:if test="${fn:length(msg.msg_cont) > 15 }">
										${fn:substring(msg.msg_cont, 0, 15) }...
									</c:if>
									<c:if test="${fn:length(msg.msg_cont) <= 15 }">
										${ msg.msg_cont}
									</c:if>
									<c:if test="${type eq 'Trainer'}">
										<td>${msg.nick_name }</td>
									</c:if>
									<c:if test="${type eq 'Member'}">
										<td>${msg.trainer_name }</td>
									</c:if>
									<td>${msg.write_date }</td>
								</tr>
								<input type="hidden" name="message_idx" value="${msg.message_idx }">
							</form>
						</c:forEach>
					</tbody>
				</table>
				<div class="col">
					<div class="block-27">
						<ul>
							<c:if test="${res.paging.blockStart le 1 }">
								<li><a
									href="http://52.78.116.59:8080/teuching/message/msgboxsend.do?currentpage=${res.paging.blockStart}">&lt;</a></li>
							</c:if>
							<c:if test="${res.paging.blockStart gt 1 }">
								<li><a
									href="http://52.78.116.59:8080/teuching/message/msgboxsend.do?currentpage=${res.paging.blockStart-1}">&lt;</a></li>
							</c:if>

							<c:forEach begin="${res.paging.blockStart }"
								end="${res.paging.blockEnd }" var="p">
								<c:if test="${res.paging.currentPage eq p }">
									<li class="active"><a
										href="http://52.78.116.59:8080/teuching/message/msgboxsend.do?currentpage=${p}">${p }</a></li>
								</c:if>
								<c:if test="${res.paging.currentPage ne p }">
									<li><a
										href="http://52.78.116.59:8080/teuching/message/msgboxsend.do?currentpage=${p}">${p }</a></li>
								</c:if>
							</c:forEach>

							<c:if test="${res.paging.blockEnd lt res.paging.lastPage }">
								<li><a
									href="http://52.78.116.59:8080/teuching/message/msgboxsend.do?currentpage=${res.paging.blockEnd+1}">&gt;</a></li>
							</c:if>
							<c:if test="${res.paging.blockEnd ge res.paging.lastPage }">
								<li><a
									href="http://52.78.116.59:8080/teuching/message/msgboxsend.do?currentpage=${res.paging.blockEnd}">&gt;</a></li>
							</c:if>
						</ul>
					</div>
				</div>
			</div>
		</div>

	</div>

<%@ include file="../include/footer.jsp" %>

	<script>
		function openPopUp() {
			const form = document.querySelector('#form');
			window
					.open("", 'pop',
							'width=450,height=300,left=420,top=150,toolbars=no,scrollbars=no');
			form.submit();
		}
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
	<script src="http://52.78.116.59:8080/teuching/resources/js/google-map.js"></script>
	<script src="http://52.78.116.59:8080/teuching/resources/js/main.js"></script>
</body>
</html>