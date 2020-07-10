<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<link rel="stylesheet" href="http://52.78.116.59:8080/teuching/resources/css/landing/aboutUs.css"/>
</head>
<body onload="move_text('false')">
   <%@ include file="../include/top.jsp" %>
   <div class="aboutUsModalWrap">
      <div class="aboutUsModal">
         <button class="aboutUsModalRemove" onclick="modalOnOff('false');">X</button>
         <video class="aboutUsVideo" controls autoplay width="1000" style="margin-left: 8px;">
            <source src="http://52.78.116.59:8080/teuching/resources/video/aboutUs.mp4" type="video/mp4">
         </video>
      </div>
   </div>
   
   <section>
      <ul class="slide_btn_wrap">
         <li><button class="slide_btn" id="btn1"></button></li>
         <li><button class="slide_btn" id="btn2"></button></li>
         <li><button class="slide_btn" id="btn3"></button></li>
      </ul>
      
      <ul class="about_slide">
         <li id="slide1" class="slide_common">
            <div class="blackBox">
               <h1 class="about_title">Our Service</h1>
               <p class="about_content">TeuChing은 회원이 원하는 운동을 적시적기에 할 수 있게 트레이너와 매칭해줍니다.</p>
               <p class="about_content">회원은 먼저 키워드를 선택하고, 그 키워드에 해당하는 트레이너들을 비교하여 선택합니다.</p>
               <p class="about_content">모든 트레이너의 리뷰와 수상 경력, 자격 증명으로 꼼꼼히 따져볼 수 있습니다.</p>
               <p class="about_content">물론, 궁금한 점이 생긴다면 쪽지를 통해 직접 물어볼 수도 있죠.</p>
               <p class="about_content">예약 또한 쪽지를 통해 가능하기 때문에 꼼꼼히 따져보고 물어가며 예약이 가능합니다!</p>
            </div>
         </li>
         <li id="slide2" class="slide_common">
            <div class="blackBox">
               <h1 class="about_title">Carefully</h1>
               <p class="about_content">COVID-19로 인해 예전처럼 선뜻 운동하러 나서기 힘든 요즘,</p>
               <p class="about_content">보다 안전하고 검증된 트레이너 인증 시스템으로 걱정 없는 운동을 즐기실 수 있습니다.</p>
               <p class="about_content">혹시 불쾌하게 했거나 적절하지 못한 트레이너나 회원은 신고해 주세요.</p>
               <p class="about_content">관리자의 철저한 검증을 통해 부적절한 트레이너, 회원이라고 판단이 되면</p>
               <p class="about_content">블랙리스트에 올라가고 이는 프로필을 통해 확인이 가능하답니다!</p>
            </div>
         </li>
         <li id="slide3" class="slide_common">
            <div class="blackBox">
               <h1 class="about_title">Top3 Trainers</h1>
               <p class="about_content">트레이너 프로필에 있는 리뷰에서 추천을 많이 받는 트레이너는 영광스러운 TOP 3에 올라갈 수 있습니다!</p>
               <p class="about_content">메인 페이지에서 확인이 가능하죠.</p>
               <p class="about_content">뭐가 좋은 거냐고요? 다른 트레이너보다 노출이 더 많이 되기 때문에 회원들의 접근성이 보다 뛰어납니다.</p>
               <p class="about_content">이보다 더 좋은 혜택이 어딨습니까?</p>
            </div>
         </li>
      </ul>
   </section>
   <section class="goModalWrap">
      <h1 class="black_font">사이트 이용 방법에 대해서 알아보시겠어요?</h1>
      <a class="goModal" onclick="modalOnOff('true');">동영상 보러가기</a>
   </section>
   <%@ include file="../include/footer.jsp" %>
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
   <script src="http://52.78.116.59:8080/teuching/resources/js/landing/aboutUs.js"></script>
</body>
</html>