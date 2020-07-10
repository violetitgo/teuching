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

#reviewDelete {
	cursor: pointer;
}

#TRheart{
cursor:pointer ;
}

#reviewnn {
	border-top: 1px solid #9C9C9C;
	border-bottom: 1px solid #F6F6F6;
	color: #767575;
	font-family: 'Gamja Flower', cursive;
	font-size: 1.4vw;
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
}

#trainer {
	font-family: 'Poor Story', cursive;
}

.heading a {
	font-family: 'Noto Sans KR', sans-serif;
}

#gogo {
	color: #ffb5b5;
	font-family: 'Nanum Pen Script', cursive;
	font-size: 1.5vw;
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

#orderbyLike{
	padding-left: 65%;
	font-size: 1.2vw;
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
								<h3 id="trainer">${Trainer.trainerName}님의프로필입니다.</h3>
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
								<p>
									LIKE : <a id="trlikeatag" onclick="likeTR();"><i class="fas fa-heart" id="TRheart" style="font-size: 16px; color: #ffb5b5;"></i></a><span id="trcount"></span>
									
									<span id="wow" style="color:#ffb5b5"></span> 
								</p>
								<div class="tag-widget post-tag-container mb-5 mt-5">

									<div class="tagcloud">
										<a href="#" class="tag-cloud-link">${Trainer.prefer_add1}</a>
										<c:if test="${Trainer.prefer_add2 ne '시/도 선택 ' and Trainer.prefer_add2 ne '시/도 선택'}">
										<a href="#" class="tag-cloud-link">${Trainer.prefer_add2}</a>
										</c:if>
										<c:if test="${Trainer.prefer_add3 ne '시/도 선택 ' and Trainer.prefer_add3 ne '시/도 선택'}">
										<a href="#" class="tag-cloud-link">${Trainer.prefer_add3}</a>
										</c:if>
									</div>
									<br>

									<div class="comment-body">
										<a
											href="http://52.78.116.59:8080/teuching/profile/schedule.do?tr_email=${Trainer.tr_email}"
											id="gogo">스케줄로 이동 → 📅</a>
											<a
											href="http://52.78.116.59:8080/teuching/report/reportrequest.do?tr_email=${Trainer.tr_email}&type=tra"
											id="gogo">&nbsp&nbsp&nbsp 트레이너 신고 → 🚨</a>

									</div>
									</div>
								
					</c:forEach>
				

			</div>
			
		</div>



		<!-- 댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글 -->

		<div class="pt-5 mt-5">

			<!-- 코멘트 리스트 수 가져와서 뿌려 -->
			<h3 class="mb-5">${reviewList.paging.total}&nbspComments 
			<i class="fas fa-list-ul" id="orderbyLike" onclick="orderbyList()"></i> </h3>
			<input type="hidden" name="orderby" value="" id="jisoo">
			

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

									<c:if test="${loginInfo.nickname eq review.mem_nickname}">
										<div class="meta">${review.rev_date}</div>
										<span id="reviewnn">${review.mem_nickname} <a
											id="reviewDelete"
											onclick="deleteReview(${review.review_idx});"> <i
												class="far fa-trash-alt"></i>
										</a> <a id="loginrecUpdate"
											onclick="likeit(${review.review_idx});"> <i
												class="fas fa-heart" id="heart" style="font-size: 16px; color: #ffb5b5;"></i>
										</a> <span class="likecnt" id="id${review.review_idx}">${review.recommend}</span>
											<input type="hidden" id="click${review.review_idx}"
											value="true" />
										</span>

										<p>${review.rev_cont}</p>
										
									</c:if>


									<c:if test="${loginInfo.nickname ne review.mem_nickname}">
										<div class="meta">${review.rev_date}</div>
										<span id="reviewnn">${review.mem_nickname} <a
											id="recUpdate" onclick="likeit(${review.review_idx});"> <i
												class="fas fa-heart" id="heart"
												style="font-size: 16px; color: #ffb5b5;"></i>
										</a><span class="likecnt" id="id${review.review_idx}">${review.recommend}</span>
											<input type="hidden" id="click${review.review_idx}"
											value="true" />
										</span>

										<p>${review.rev_cont}</p>


										
									</c:if>

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
											href="http://52.78.116.59:8080/teuching/profile/review.do?trainerEmail=${Trainer.tr_email}&reviewPage=${reviewList.paging.blockStart-1}">&lt;</a></span></li>
								</c:if>

								<c:if test="${reviewList.paging.blockStart le 1 }">
									<li><span><a
											href="http://52.78.116.59:8080/teuching/profile/review.do?trainerEmail=${Trainer.tr_email}&reviewPage=${reviewList.paging.blockStart}">&lt;</a></span></li>
								</c:if>


								<c:forEach begin="${reviewList.paging.blockStart}"
									end="${reviewList.paging.blockEnd}" var="page">
									<li class="active"><span><a
											href="http://52.78.116.59:8080/teuching/profile/review.do?trainerEmail=${Trainer.tr_email}&reviewPage=${page}"
											class="num active">${page}</a></span></li>
								</c:forEach>

								<c:if
									test="${reviewList.paging.blockEnd+1 ge reviewList.paging.lastPage}">
									<li><span><a
											href="http://52.78.116.59:8080/teuching/profile/review.do?trainerEmail=${Trainer.tr_email}&reviewPage=${reviewList.paging.blockEnd}">&gt;</a></span></li>
								</c:if>
								<c:if
									test="${reviewList.paging.blockEnd+1 lt reviewList.paging.lastPage }">
									<li><span><a
											href="http://52.78.116.59:8080/teuching/profile/review.do?trainerEmail=${Trainer.tr_email}&reviewPage=${reviewList.paging.blockEnd+1}">&gt;</a></span></li>
								</c:if>

							</ul>
						</div>
					</div>
				</div>
			</c:forEach>
			<!-- END comment-list -->



			<!-- 댓글쓰기댓글쓰기댓글쓰기댓글쓰기댓글쓰기댓글쓰기댓글쓰기댓글쓰기댓글쓰기댓글쓰기댓글쓰기댓글쓰기댓글쓰기댓글쓰기댓글쓰기댓글쓰기댓글쓰기댓글쓰기댓글쓰기댓글쓰기댓글쓰기댓글쓰기댓글쓰기댓글쓰기댓글쓰기댓글쓰기댓글쓰기 -->
			
		</div>

		</div>



		<!-- 댓글쓰기끝댓글쓰기끝댓글쓰기끝댓글쓰기끝댓글쓰기끝댓글쓰기끝댓글쓰기끝댓글쓰기끝댓글쓰기끝댓글쓰기끝댓글쓰기끝댓글쓰기끝댓글쓰기끝댓글쓰기끝댓글쓰기끝댓글쓰기끝댓글쓰기끝댓글쓰기끝댓글쓰기끝댓글쓰기끝-->






		<!-- .col-md-8  여기서부터 오른쪽 카테고리 -->
			
		<div class="col-lg-4 sidebar ftco-animate">		
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
								<a href="http://52.78.116.59:8080/teuching/post/detail.do?postNo=${Post.postIdx}">${Post.postTitle}</a>
							</h3>
							<div class="meta">
								<div>
									<a href="http://52.78.116.59:8080/teuching/post/detail.do?postNo=${Post.postIdx}"><span
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
   <script type="text/javascript">
   
   /* 마우스 올라고내릴때 추천구걸 */
   $(function(){
	   $('#TRheart').mouseenter(function(){
	     $('#wow').text('이 트레이너가 좋으시다면 ♥ 를 눌러주세요! :)');
	   });
	   $('#TRheart').mouseleave(function(){
		   $('#wow').text('');
		  });
	 });
	 
   /* 해당 프로필의 트레이너정보를 갖고오기 위해 url에서 파라미터 추출하는 부분 */
 var getParameters = function (paramName) { 
    // 리턴값을 위한 변수 선언
    var returnValue; 
    // 현재 URL 가져오기 
    var url = location.href; 
    // get 파라미터 값을 가져올 수 있는 ? 를 기점으로 slice 한 후 split 으로 나눔
    var parameters = (url.slice(url.indexOf('?') + 1, url.length)).split('&'); 
    // 나누어진 값의 비교를 통해 paramName 으로 요청된 데이터의 값만 return 
    for (var i = 0; i < parameters.length; i++) { 
       var varName = parameters[i].split('=')[0]; 
          if (varName.toUpperCase() == paramName.toUpperCase()) { 
             returnValue = parameters[i].split('=')[1]; 
             return decodeURIComponent(returnValue); 
          } 
       } 
    };


var trainerName = getParameters('trainerName');
var trainerEmail = getParameters('trainerEmail');
 $('#trainer').html(trainerName);
 $('#trnn').html(trainerName);
var nickname = '${loginInfo.nickname}';
console.log("nickname ", nickname);

/* 리뷰 좋아요 */
  function likeit(index) {

       var no = index;
       console.log("no ", no); 
       likeitajx(nickname,no);
      
    };

    
  function likeitajx(nickname,no) {
         $.ajax({
            url : 'http://52.78.116.59:8080/teuching/review/recupdate.do' ,
            type : 'POST',
            data : {
              nickname : nickname,
               no : no,
				tremail: trainerEmail
            },
            success : function(v) {
               console.log("likeitajax method ", v);
              if(v == 1){
                 alert("추천은 한번만 가능합니다.")
              }
               recCount(no);
            },
            error : function (error) {
               alert("여기에러야>?");
       }
         })
      };
      
    function recCount(no) {
       
        console.log("recCount ", no);
       
     $.ajax({
            url : 'http://52.78.116.59:8080/teuching/review/reccount.do',
            type : 'POST',
            data : {
               no : no
            },
            success : function(count) {
                   $('#id'+no).html(count);
                   
              
                
            },
            error : function (error) {
               alert("여기에러냐고");
       }
         })
                };
 

 /* 트레이너 좋아요 */

    
  function likeTR() {
         $.ajax({
            url : 'http://52.78.116.59:8080/teuching/review/trlikeupdate.do' ,
            type : 'POST',
            data : {
				tremail: trainerEmail,
				memname:nickname
            },
            success : function(v) {
               console.log("likeTR method ", v);
              if(v == 1){
                 alert("좋아요는 한번만 가능합니다.")
              }
               trrecCount();
            },
            error : function (error) {
               alert("여기에러야>?");
       }
         })
      };
      
    function trrecCount() {
       
       
     $.ajax({
            url : 'http://52.78.116.59:8080/teuching/review/trlikecount.do',
            type : 'POST',
            data : {
            	tremail: trainerEmail
            },
            success : function(count) {
                   $('#trcount').html("&nbsp;"+count);
              
                
            },
            error : function (error) {
               alert("여기에러냐고");
       }
         })
                };
                
     trrecCount();
 /* 리뷰 삭제 */
 
 function deleteReview(data) {
    console.log(data);
    $.ajax({
       type:'POST',
       url: 'http://52.78.116.59:8080/teuching/review/deletereview.do',
       data: {
          
          no : data
       },
       success: function(data) {
             alert("정상적으로 삭제되었습니다.");
             location.reload();
          
       }
       
    })
 };
 
 
 
      //변수를 선언합니다.
    var trKeyword = $('#trKeyword').val();
     var span = document.getElementById('span');
    var test = trKeyword.split(",");

    for(var i = 0; i < test.length; i++){
       
       console.log(test[i]);
       span.innerHTML += '<li><a>' + test[i] + '</a></li>'; 
    };
    
    function orderbyList() {
		
	}
    
    
    
   </script>


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