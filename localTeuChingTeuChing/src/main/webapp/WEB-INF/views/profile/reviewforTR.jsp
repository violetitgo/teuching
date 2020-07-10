<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Teu-Ching Teu-Ching</title>
<style>
#star {
	cursor: pointer;
}

#star a.on {
	color: red;
}

#reviewDelete {
	cursor: pointer;
}

#reviewnn {
	border-top: 1px solid #9C9C9C;
	border-bottom: 1px solid #F6F6F6;
	color: #767575;
	font-family: 'Gamja Flower', cursive;
	font-size: 1.4vw;
}

.likecnt {
	color: #ffb5b5;
}

#sidebarTitle {
	color: #ffb5b5;
	font-family: 'Nanum Pen Script', cursive;
	font-size: 2vw;
}

#span {
	color: #524040;
}

#recentList {
	font-size: 0.7vw;
}

#heart {
	cursor: pointer;
	text-decoration: none;
	color: gray;
}

#trainer {
	font-family: 'Poor Story', cursive;
}

.heading a {
	font-family: 'Noto Sans KR', sans-serif;
}

#gogo {
	color: #ffb5b5;
	padding-left: 80%;
}

#box {
	width: 300px;
	height: 300px;
	border-radius: 70%;
	overflow: hidden;
}

#photo {
	width: 100%;
	height: 120%;
	object-fit: cover;
}
</style>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Poor+Story&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Gamja+Flower&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap"
	rel="stylesheet">
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
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">

</head>

</head>
<body>

	<%@ include file="../include/top.jsp"%>




	<!-- 시작이오시작이오시작이오시작이오시작이오시작이오시작이오시작이오시작이오시작이오시작이오시작이오시작이오시작이오시작이오시작이오시작이오시작이오 -->


	<section class="hero-wrap hero-wrap-2"
		style="background-image: url('http://52.78.116.59:8080/teuching/resources/img/bg_3.jpg');"
		data-stellar-background-ratio="0.5">
		<div class="overlay"></div>
		<div class="container">
			<div
				class="row no-gutters slider-text js-fullheight align-items-center justify-content-center">
				<div class="col-md-9 ftco-animate text-center">
					<h1 class="mb-3 bread">P r o f i l e</h1>
					<p class="breadcrumbs">
						<span class="mr-2">Information</span> <span class="mr-2">Review</span>
					</p>
				</div>
			</div>
		</div>
	</section>

	<section class="ftco-section">
		<div class="container">
			<div class="row">

				<div class="col-lg-8 ftco-animate">
					<c:forEach items="${trainerInfo.tlist}" var="Trainer">
						<h2 class="mb-3" id="trainername"></h2>
						<div class="about-author d-flex">
							<div class="bio align-self-md-center mr-5" id="box">
								<img src="http://52.78.116.59:8080/teuching/resources/upload/profileImg/${Trainer.photo}"
									alt="${Trainer.photo}" class="img-fluid mb-4" id="photo">
							</div>
							<div class="desc align-self-md-center">
								<h3 id="trainer">${Trainer.trainerName}님의프로필입니다. </h3>
								<br>
								<p>
									Address : <span id="totalAdress">${Trainer.address}
										${Trainer.address_detail}</span>
								</p>
								<p>
									Gender : <span id="totalAdress">${Trainer.gender}</span>
								</p>
								<p>
									Phone Number : <span id="totalAdress">${Trainer.cell}</span>
								</p>
								<p>
									Career : <span id="totalAdress">${Trainer.career}</span>
								</p>
								<p>
									Qualification :
									<c:if test="${fn:length(quali) > 0}">
										<c:forEach items="${quali }" var="q" varStatus="cnt">
											<c:if test="${cnt.index == 0 }">
												<span id="totalAdress">${q }</span>
												<br>
											</c:if>
											<c:if test="${cnt.index >= 1 }">
												<span id="totalAdress">
													&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
													&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
													&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${q }</span>
												<br>
											</c:if>
										</c:forEach>
									</c:if>
									<c:if test="${fn:length(quali) <= 0}">
										<span id="totalAdress">인증된 자격증명이 없습니다</span>
									</c:if>
								</p>
								<p>
									<c:if test="${Trainer.black_yn eq 'Y' }">
									❗ 주의 : <span id="totalAdress">경고가 누적된 트레이너 입니다</span>
									</c:if>
								</p>
								<div class="tag-widget post-tag-container mb-5 mt-5">

									<div class="tagcloud">
										<a href="#" class="tag-cloud-link">${Trainer.prefer_add1}</a>
										<a href="#" class="tag-cloud-link">${Trainer.prefer_add2}</a>
										<a href="#" class="tag-cloud-link">${Trainer.prefer_add3}</a>
									</div>
									<a href ="http://52.78.116.59:8080/teuching/member/mypaget.do" id="gogo">수정하기</a>
					</c:forEach>
				</div>


			</div>
		</div>



		<!-- 댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글 -->
		
		<div class="pt-5 mt-5">

			<!-- 코멘트 리스트 수 가져와서 뿌려 -->
			<h3 class="mb-5">${reviewList.paging.total}&nbspComments</h3>

			<ul class="comment-list">


				<c:forEach items="${reviewList.rlist}" var="review">
					<li class="comment">
						<!-- 프사 별점별로 다르게 --> <c:choose>
							<c:when test="${review.rev_score < 3}">
								<div class="vcard bio">
									<img src="http://52.78.116.59:8080/teuching/resources/img/sad.png" alt="Image placeholder">
								</div>
							</c:when>

							<c:when test="${review.rev_score == 3}">
								<div class="vcard bio">
									<img src="http://52.78.116.59:8080/teuching/resources/img/soso.png" alt="Image placeholder">
								</div>
							</c:when>

							<c:otherwise>
								<div class="vcard bio">
									<img src="http://52.78.116.59:8080/teuching/resources/img/smile.png" alt="Image placeholder">
								</div>
							</c:otherwise>
						</c:choose>

				

						<div class="comment-body">
							<!-- 좋아요! -->
							<!-- 작성자만 삭제 가능하게 하기 -->	
					
							
								<div class="meta">${review.rev_date}</div>
								<span id="reviewnn">${review.mem_nickname} <a
									id="recUpdate" onclick="likeit(${review.review_idx});"> <i
										class="fas fa-heart" id="heart"
										style="font-size: 16px; color: grey"></i>
								</a><span class="likecnt" id="id${review.review_idx}">${review.recommend}</span>
									<input type="hidden" id="click${review.review_idx}"
									value="true" />
								</span>

								<p>${review.rev_cont}</p>


								<a
									href="http://52.78.116.59:8080/teuching/report/reportrequest.do?&nick_name=${review.mem_nickname }&type=rev"
									class="reply">🚨</a>
							
						</div>




					</li>
				</c:forEach>
			</ul>
			<c:forEach items="${trainerInfo.tlist}" var="Trainer">

				<div class="row mt-5" style="transform: translateX(25%)">
					<div class="col">
						<div class="block-27">
							<ul>
								<c:if test="${reviewList.paging.blockStart gt 1 }">
									<li><span><a
											href="http://52.78.116.59:8080/teuching/profile/reviewforTR.do?trainerEmail=${Trainer.tr_email}&reviewPage=${reviewList.paging.blockStart-1}">&lt;</a></span></li>
								</c:if>

								<c:if test="${reviewList.paging.blockStart le 1 }">
									<li><span><a
											href="http://52.78.116.59:8080/teuching/profile/reviewforTR.do?trainerEmail=${Trainer.tr_email}&reviewPage=${reviewList.paging.blockStart}">&lt;</a></span></li>
								</c:if>


								<c:forEach begin="${reviewList.paging.blockStart}"
									end="${reviewList.paging.blockEnd}" var="page">
									<li class="active"><span><a
											href="http://52.78.116.59:8080/teuching/profile/reviewforTR.do?trainerEmail=${Trainer.tr_email}&reviewPage=${page}"
											class="num active">${page}</a></span></li>
								</c:forEach>

								<c:if
									test="${reviewList.paging.blockEnd+1 ge reviewList.paging.lastPage}">
									<li><span><a
											href="http://52.78.116.59:8080/teuching/profile/reviewforTR.do?trainerEmail=${Trainer.tr_email}&reviewPage=${reviewList.paging.blockEnd}">&gt;</a></span></li>
								</c:if>
								<c:if
									test="${reviewList.paging.blockEnd+1 lt reviewList.paging.lastPage }">
									<li><span><a
											href="http://52.78.116.59:8080/teuching/profile/reviewforTR.do?trainerEmail=${Trainer.tr_email}&reviewPage=${reviewList.paging.blockEnd+1}">&gt;</a></span></li>
								</c:if>

							</ul>
						</div>
					</div>
				</div>
			</c:forEach>
			<!-- END comment-list -->



		</div>
	
		</div>
		


		<!-- 댓글쓰기끝댓글쓰기끝댓글쓰기끝댓글쓰기끝댓글쓰기끝댓글쓰기끝댓글쓰기끝댓글쓰기끝댓글쓰기끝댓글쓰기끝댓글쓰기끝댓글쓰기끝댓글쓰기끝댓글쓰기끝댓글쓰기끝댓글쓰기끝댓글쓰기끝댓글쓰기끝댓글쓰기끝댓글쓰기끝-->






		<!-- .col-md-8  여기서부터 오른쪽 카테고리 -->
		<div class="col-lg-4 sidebar ftco-animate">
			<div class="sidebar-box"></div>
			<div class="sidebar-box ftco-animate">


				<div class="categories">

					<h3 class="heading-2" id="sidebarTitle">KeyWord</h3>
					<c:forEach items="${trainerInfo.tlist}" var="Trainer">
						<input type="hidden" id="trKeyword"
							value="${Trainer.purpose_keyword}">
						<span id="span"> </span>

					</c:forEach>
				</div>

			</div>


			<!-- -----------최근 게시글--------------------- -->
			<div class="sidebar-box ftco-animate">
				<h3 class="heading-2" id="sidebarTitle">최근 게시글</h3>
				<p id="recentList">가장 최근 5개의 게시글만 표시됩니다.</p>
				<c:forEach items="${postList.plist}" var="Post" end="4">
					<hr>
					<div class="block-21 mb-4 d-flex">

						<div class="text">
							<h3 class="heading">
								<a href="#">${Post.postTitle}</a>
							</h3>
							<div class="meta">
								<div>
									<a
										href="http://52.78.116.59:8080/teuching/post/detail.do?postNo=${Post.postIdx}"><span
										class="icon-calendar"></span>&nbsp${Post.writeDate}</a>
								</div>
								<div>
									<a
										href="http://52.78.116.59:8080/teuching/post/detail.do?postNo=${Post.postIdx}"><span
										class="icon-person"></span>${Post.trainerName}</a>
								</div>
							</div>
						</div>
					</div>

				</c:forEach>
			</div>


		</div>

		</div>
		</div>
	</section>

	<!-- .section -->



	<!-- -----------------------------------끝-------------------------------------------- -->

	<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
 <script src="http://52.78.116.59:8080/teuching/resources/js/profile/reviewforTR.js"></script>
	  
   

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