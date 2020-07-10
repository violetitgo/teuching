<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Teu-Ching Teu-Ching</title>
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=EB+Garamond:400,400i,500,500i,600,600i,700,700i&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="http://52.78.116.59:8080/teuching/resources/css/open-iconic-bootstrap.min.css">
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
<link rel="stylesheet" href="http://52.78.116.59:8080/teuching/resources/css/matching/matching.css"/>
<link rel="stylesheet" href="http://52.78.116.59:8080/teuching/resources/css/post/post.css"/>
</head>
<body>
	<%@ include file="../include/top.jsp"%>
	<section style="margin-bottom: 40px;">
		<form action="http://52.78.116.59:8080/teuching/notice/writeNotice.do" method="post" onsubmit="return submit_result();" class="postForm">
			<div>
				<div style="margin-top: 36px; margin-left: 50px; width: 1000px;">
					<div class="titleWrapper">
						<c:if test="${notice == null }">
							<input class="titleInput" name="noticeTitle" placeholder="제목을 입력하세요.">
						</c:if>
						<c:if test="${notice != null }">
							<input class="titleInput" name="noticeTitle" placeholder="제목을 입력하세요." value="${notice.noticeTitle}">
						</c:if>
					</div>
					<hr>
					<div class="contentWrapper">
						<c:if test="${notice == null }">
							<textarea class="contentInput" name="noticeCont" placeholder="내용을 입력하세요."></textarea>
						</c:if>
						<c:if test="${notice != null }">
							<textarea class="contentInput" name="noticeCont" placeholder="내용을 입력하세요.">${notice.noticeCont}</textarea>
							<script>
								var content = document.querySelector('.contentInput').value;
								content = content.replace(/<br>/g, '\r\n');
								document.querySelector('.contentInput').value = content;
							</script>
						</c:if>
					</div>
				</div>
			</div>
			<c:if test="${notice != null}">
					<input type="hidden" name="noticeIdx" value="${notice.noticeIdx}">
				</c:if>
			<div>
				<button class="uploadBtn">저장</button>
			</div>
		</form>
	</section>
	
	<script>
		function submit_result() {
			content = document.querySelector('.contentInput').value;
			content = content.replace(/(?:\r\n|\r|\n)/g, '<br>');
			document.querySelector('.contentInput').value = content;
		}
	</script>
</body>
</html>