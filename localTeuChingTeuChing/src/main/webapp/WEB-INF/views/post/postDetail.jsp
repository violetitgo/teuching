<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
			<section class="single">
			<div class="container">
				<div class="row">
					<div class="col-md-8 post_center">
						<article class="article main-article">
								<img class="backImg" src="data:image/svg+xml;utf8;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iaXNvLTg4NTktMSI/Pgo8IS0tIEdlbmVyYXRvcjogQWRvYmUgSWxsdXN0cmF0b3IgMTkuMC4wLCBTVkcgRXhwb3J0IFBsdWctSW4gLiBTVkcgVmVyc2lvbjogNi4wMCBCdWlsZCAwKSAgLS0+CjxzdmcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB4bWxuczp4bGluaz0iaHR0cDovL3d3dy53My5vcmcvMTk5OS94bGluayIgdmVyc2lvbj0iMS4xIiBpZD0iQ2FwYV8xIiB4PSIwcHgiIHk9IjBweCIgdmlld0JveD0iMCAwIDI0MC44MjMgMjQwLjgyMyIgc3R5bGU9ImVuYWJsZS1iYWNrZ3JvdW5kOm5ldyAwIDAgMjQwLjgyMyAyNDAuODIzOyIgeG1sOnNwYWNlPSJwcmVzZXJ2ZSIgd2lkdGg9IjUxMnB4IiBoZWlnaHQ9IjUxMnB4Ij4KPGc+Cgk8cGF0aCBpZD0iQ2hldnJvbl9SaWdodCIgZD0iTTU3LjYzMywxMjkuMDA3TDE2NS45MywyMzcuMjY4YzQuNzUyLDQuNzQsMTIuNDUxLDQuNzQsMTcuMjE1LDBjNC43NTItNC43NCw0Ljc1Mi0xMi40MzksMC0xNy4xNzkgICBsLTk5LjcwNy05OS42NzFsOTkuNjk1LTk5LjY3MWM0Ljc1Mi00Ljc0LDQuNzUyLTEyLjQzOSwwLTE3LjE5MWMtNC43NTItNC43NC0xMi40NjMtNC43NC0xNy4yMTUsMEw1Ny42MjEsMTExLjgxNiAgIEM1Mi45NDIsMTE2LjUwNyw1Mi45NDIsMTI0LjMyNyw1Ny42MzMsMTI5LjAwN3oiIGZpbGw9IiMwMDAwMDAiLz4KCTxnPgoJPC9nPgoJPGc+Cgk8L2c+Cgk8Zz4KCTwvZz4KCTxnPgoJPC9nPgoJPGc+Cgk8L2c+Cgk8Zz4KCTwvZz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8L3N2Zz4K" />
								<a href="javascript:history.back()" style="display: inline; color: #4c4c4c;">뒤로가기</a>
							<header>
									<h1>${data.post.postTitle}</h1>
									<p>Posted on ${data.post.writeDate}</p>
							</header>
							<hr>
							<div class="main">
								<p id="postCont">
								${data.post.postCont}
								</p>
							</div>
						</article>
						<div class="uploads">
						</div>
						<div class="authorWrapper">
							<hr>
							<div class="authorTitle">Author</div>
								<img class="authorImg" src="http://52.78.116.59:8080/teuching/resources/upload/profileImg/${data.post.trPhoto}">
							<div class="details authorInfo">
								<div class="job">Trainer</div>
								<a class="author" href="http://52.78.116.59:8080/teuching/profile/review.do?trainerEmail=${data.post.trEmail}">${data.post.trainerName}</a>
								<hr>
								<form id="form" action="${pageContext.request.contextPath }/message/messageform.do" target="pop">
								<input type="hidden" name="tr_email" value="${data.post.trEmail}">
								<input type="hidden" name="trainer_name" value="${data.post.trainerName}">
								</form>
								<button onclick="openPopUp()" class="btn btn-primary">Send Message</button>
								<c:if test="${memberType == 'trainer'}">
									<c:if test="${loginInfo.tr_email == data.post.trEmail}">
										<a href="http://52.78.116.59:8080/teuching/post/writepost.do?postIdx=${data.post.postIdx}"><button class="btn btn-primary">Edit Post</button></a>
										<a href="http://52.78.116.59:8080/teuching/post/deletepost.do?postIdx=${data.post.postIdx}"><button id="postDelBtn" class="btn btn-primary">Delete Post</button></a>
									</c:if>
								</c:if>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<script>
			if(${memberType == 'trainer'}) {
				document.getElementById('postDelBtn').addEventListener('click', function() {
					alert("게시글이 삭제되었습니다.");
				})
			}
			
			var uploads = document.querySelector('.uploads');
			
			<c:forEach items='${data.fList}' var='item'>
				var img = document.createElement('img');
				img.style.maxWidth = '400px';
				img.style.display = 'block'
				img.src = " http://52.78.116.59:8080/teuching/resources/upload/${item.rename_filename}";
				uploads.append(img);
			</c:forEach>
		</script>
		<script>
		function openPopUp() {
			const form = document.querySelector('#form');
			window
					.open("", 'pop',
							'width=460,height=300,left=420,top=150,toolbars=no,scrollbars=no');
			form.submit();
		}
		</script>
</body>
</html>