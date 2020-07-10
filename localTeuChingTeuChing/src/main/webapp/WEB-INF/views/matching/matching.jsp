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
</head>
<body>
<%@ include file="../include/top.jsp" %>
	<input type="hidden" id="memberType" value="${memberType}">
	<header id="header" class="ftco-section">
		<div class="container">
			<div class="searchWordWrapper">
				<div style="margin-left: 35px;">
					<select id="searchOption">
						<option value="trainer">트레이너</option>
						<option value="post">게시판</option>
					</select>
					<div>
						<input type="text" id="keywordInput" class="form-control" placeholder="검색어를 입력하세요.">
						<button id="inputBtn" class="icon-search"></button>
					</div>
				</div>
			</div>
		</div>
	</header>
	<a href="#header" id="topUp">
		<img style="width: 52px;" src="http://52.78.116.59:8080/teuching/resources/img/topUp.png">
	</a>
	<section class="container" style="width: 840px;">
		<div>
			<table class="keywordSearchTable">
				<tr>
					<th class="searchTableTh">운동목적</th>
					<td class="searchTableTd">
						<input type="button" class="keywordBtn" name="purpose" value="체형교정">
						<input type="button" class="keywordBtn" name="purpose" value="건강증진">
						<input type="button" class="keywordBtn" name="purpose" value="다이어트">
						<input type="button" class="keywordBtn" name="purpose" value="바디프로필">
						<input type="button" class="keywordBtn" name="purpose" value="취미">
						<input type="button" class="keywordBtn" name="purpose" value="대회준비">
						<input type="button" class="keywordBtn" name="purpose" value="재활치료">
						<input type="button" class="keywordBtn" name="purpose" value="벌크업">
						<input type="button" class="keywordBtn" name="purpose" value="기초체력">
						<input type="button" class="keywordBtn" name="purpose" value="시험준비">
					</td>
				</tr>
				<tr>
					<th class="searchTableTh">운동종목</th>
					<td class="searchTableTd">
						<input type="button" class="keywordBtn" name="sports" value="요가">
						<input type="button" class="keywordBtn" name="sports" value="필라테스">
						<input type="button" class="keywordBtn" name="sports" value="스피닝">
						<input type="button" class="keywordBtn" name="sports" value="헬스">
						<input type="button" class="keywordBtn" name="sports" value="크로스핏">
						<input type="button" class="keywordBtn" name="sports" value="수영">
						<input type="button" class="keywordBtn" name="sports" value="기타">
					</td>
				</tr>
				<tr>
					<th class="searchTableTh">지역</th>
					<td class="searchTableTd">
						<input type="button" class="keywordBtn" id="registration" name="area" value="등록지 기준">
						<input type="hidden" id="memberArea" value="${loginInfo.address}">
						<input type="button" class="keywordBtn" name="area" value="타지역">
						<select id="placeSelect">
							<option value="서울">서울</option>
							<option value="세종">세종</option>
							<option value="부산">부산</option>
							<option value="대구">대구</option>
							<option value="인천">인천</option>
							<option value="광주">광주</option>
							<option value="대전">대전</option>
							<option value="울산">울산</option>
							<option value="제주">제주</option>
							<option value="서귀포">서귀포</option>
							<option value="수원">수원</option>
							<option value="고양">고양</option>
							<option value="성남">성남</option>
							<option value="용인">용인</option>
							<option value="부천">부천</option>
							<option value="안산">안산</option>
							<option value="남양주">남양주</option>
							<option value="안양">안양</option>
							<option value="화성">화성</option>
							<option value="평택">평택</option>
							<option value="의정부">의정부</option>
							<option value="시흥">시흥</option>
							<option value="파주">파주</option>
							<option value="김포">김포</option>
							<option value="광명">광명</option>
							<option value="광주">광주</option>
							<option value="군포">군포</option>
							<option value="오산">오산</option>
							<option value="이천">이천</option>
							<option value="양주">양주</option>
							<option value="안성">안성</option>
							<option value="구리">구리</option>
							<option value="포천">포천</option>
							<option value="의왕">의왕</option>
							<option value="하남">하남</option>
							<option value="여주">여주</option>
							<option value="동두천">동두천</option>
							<option value="과천">과천</option>
							<option value="춘천">춘천</option>
							<option value="원주">원주</option>
							<option value="강릉">강릉</option>
							<option value="동해">동해</option>
							<option value="태백">태백</option>
							<option value="속초">속초</option>
							<option value="삼척">삼척</option>
							<option value="청주">청주</option>
							<option value="충주">충주</option>
							<option value="제천">제천</option>
							<option value="천안">천안</option>
							<option value="공주">공주</option>
							<option value="보령">보령</option>
							<option value="아산">아산</option>
							<option value="서산">서산</option>
							<option value="논산">논산</option>
							<option value="계룡">계룡</option>
							<option value="전주">전주</option>
							<option value="군산">군산</option>
							<option value="익산">익산</option>
							<option value="정읍">정읍</option>
							<option value="남원">남원</option>
							<option value="김제">김제</option>
							<option value="목포">목포</option>
							<option value="여수">여수</option>
							<option value="순천">순천</option>
							<option value="나주">나주</option>
							<option value="광양">광양</option>
							<option value="포항">포항</option>
							<option value="경주">경주</option>
							<option value="김천">김천</option>
							<option value="안동">안동</option>
							<option value="구미">구미</option>
							<option value="영주">영주</option>
							<option value="영천">영천</option>
							<option value="상주">상주</option>
							<option value="문경">문경</option>
							<option value="경산">경산</option>
							<option value="창원">창원</option>
							<option value="전주">전주</option>
							<option value="통영">통영</option>
							<option value="사천">사천</option>
							<option value="김해">김해</option>
							<option value="밀양">밀양</option>
							<option value="거제">거제</option>
							<option value="양산">양산</option>
						</select>
					</td>
				</tr>
				<tr>
					<th class="searchTableTh">수업 인원</th>
					<td class="searchTableTd">
						<input type="button" class="keywordBtn" name="classSize" value="1:1">
						<input type="button" class="keywordBtn" name="classSize" value="N:1">
					</td>
				</tr>
				<tr>
					<th class="searchTableTh">성별</th>
					<td class="searchTableTd">
						<input type="button" class="keywordBtn" name="gender" value="남">
						<input type="button" class="keywordBtn" name="gender" value="여">
					</td>
				</tr>
				<tr>
					<th class="searchTableTh">장소</th>
					<td class="searchTableTd">
						<input type="button" class="keywordBtn" name="place" value="INDOOR EXERCIES">
						<input type="button" class="keywordBtn" name="place" value="OUTDOOR EXERCIES">
					</td>
				</tr>
			</table>
			<button id="keywordSearchBtn">Search</button>
			<c:if test="${memberType == 'trainer'}">
				<button id="writeBtn">Write</button>
			</c:if>
		</div>
	</section>
	<section class="container" style="margin-top: 13%; margin-bottom: 10%;">
		<table id="postTable" style="margin-left: auto; margin-right: auto;">
		</table>
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
	<script src="http://52.78.116.59:8080/teuching/resources/js/matching/matching.js"></script>
</body>
</html>