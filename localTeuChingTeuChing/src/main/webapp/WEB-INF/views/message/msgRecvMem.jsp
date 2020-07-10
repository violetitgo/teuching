<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Teu-Ching Teu-Ching</title>
<link
	href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<style>
html, body, form {
	height: 96%;
	width: 96%;
	margin-left: 3%;
}

.wrapper {
	height: 100%;
	width: 96%;
	margin-left: 2%;
}

#text {
	border: 1px solid black;
	height: 77px;
	width: 91%;
	border-radius: 4px;
	border: 1px solid lightgray;
	padding: 1% 1% 1% 1%;
}

a {
	margin-left: 1%;
	text-decoration: none;
}

#textarea {
	width: 91%;
	height: 75px;
	border-radius: 4px;
	border: 1px solid lightgray;
	margin-top: 3%;
	font-size: 3vw;
}

#btn {
	width: 75px;
	height: 35px;
	float: right;
	transform: translateX(-37%);
	left: 20%;
	margin-top: 3%;
	margin-bottom: 1%;
	border: 1px solid lightgray;
	background-color: white;
	outline: 0;
	cursor: pointer;
	color: black;
	text-align: center;
	padding-top: 2%;
}

h1 {
	font-weight: 500;
}
</style>
</head>
<body>
	<form action="http://52.78.116.59:8080/teuching/message/msgansmem.do"
		onsubmit="return check();">
		<div class="wrapper">
			<h2>받은 쪽지</h2>
			<h5>| ${res.write_date} | ${res.tr_email }</h5>
			<c:if test="${res.tr_email ne 'teuching.official@gmail.com'}">
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
			</c:if>
			<c:if test="${res.tr_email ne 'teuching.official@gmail.com'}">
				<div id="text">${res.msg_cont }</div>
			</c:if>
			<c:if test="${res.tr_email eq 'teuching.official@gmail.com'}">
				<br>
				<div id="text" style="height: 250px;">${res.msg_cont }</div>
			</c:if>
			<c:if test="${res.tr_email ne 'teuching.official@gmail.com'}">
				<textarea name="msg_cont" id="textarea" placeholder="내용을 입력해주세요"></textarea>
				<button id="btn" style="transform: translateX(-52%)">답장하기</button>
			</c:if>
		</div>
		<input type="hidden" name="tr_email" value="${res.tr_email }">
		<input type="hidden" name="trainer_name" value="${res.trainer_name }">
	</form>
	<script src="https://code.jquery.com/jquery-3.5.1.js"
		integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
		crossorigin="anonymous"></script>
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

		function check() {
			if($('#textarea').val() == ''){
				alert('내용을 입력해주세요');
				return false;
			}
		}

		$('#textarea').keyup(function(e) {
			var content = $(this).val();
			if (content.length > 200) {
				alert("최대 200자까지 입력 가능합니다.");
				$(this).val(content.substring(0, 200));
			}
		});
	</script>
</body>
</html>