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
	href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
</head>

<style>
#time, #date {
	border: 1px solid lightgray;
	border-radius: 4px;
	width: 163px;
	height: 24px;
	font-family: "나눔고딕";
	font-weight: bold;
	color: gray;
}

#cont {
	margin-top: 3%;
	height: 140px;
	width: 90%;
	border: 1px solid lightgray;
	border-radius: 4px;
	color: black;
	padding: 1% 1% 1% 1%;
	font-family: "나눔고딕";
}
</style>
</head>

<body>
	<form style="transform: translateX(10%); width: 90%;" onsubmit="return check();"
		action="http://52.78.116.59:8080/teuching/message/matchformsend.do">
		<div class="container">
			<h2>보낸쪽지</h2>
			<h5> | ${res.write_date } | ${res.mem_email }</h5>
			<ul class="nav navbar-nav">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown">요청내역 <span class="caret"></span></a>
					<ul class="dropdown-menu" role="menu">
						<c:forEach items="${match }" var="m">
							<li><a> <c:if test="${m.match_yn eq 'N' }">❎</c:if> <c:if
										test="${m.match_yn eq 'Y' }">✅</c:if> ${m.match_date }
									${m.match_time } &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <c:if
										test="${m.match_yn eq 'N' }">승인 요청중</c:if> <c:if
										test="${m.match_yn eq 'Y' }">승인 완료</c:if>
							</a></li>
						</c:forEach>
					</ul></li>
			</ul>
			<div id="cont">${res.msg_cont }</div>
		</div>
	</form>
	<script>
		$(document).ready(
				function() {
					$(".dropdown").hover(
							function() {
								$('.dropdown-menu', this).not(
										'.in .dropdown-menu').stop(true, true)
										.slideDown("fast");
								$(this).toggleClass('open');
							},
							function() {
								$('.dropdown-menu', this).not(
										'.in .dropdown-menu').stop(true, true)
										.slideUp("fast");
								$(this).toggleClass('open');
							});
				});
		
		function check(){
			if(document.querySelector('#textarea').value == ''){
				alert('내용을 입력해주세요');
				return false;
			}
		}
	</script>
</body>
</html>