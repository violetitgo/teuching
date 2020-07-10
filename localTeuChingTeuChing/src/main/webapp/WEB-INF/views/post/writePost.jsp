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
		<form action="http://52.78.116.59:8080/teuching/post/write.do" method="post" onsubmit="return submit_result();" class="postForm" enctype="multipart/form-data">
			<div class="addImageWrapper">
				<div class="addImageDiv">
					<img src="http://52.78.116.59:8080/teuching/resources/img/addImage2.png" class="addImageIcon">
					<p class="addImageText">사진첨부</p>
					<input type="file" id="addImageHidden" name="images" onmouseover="changeImg();" onmouseout="resetImg();" onchange="preview(this);" multiple>
				</div>
			</div>
			<div>
				<div style="margin-top: 36px; margin-left: 50px; width: 1000px;">
					<div class="titleWrapper">
						<c:if test="${data == null }">
							<input class="titleInput" name="postTitle" placeholder="제목을 입력하세요.">
						</c:if>
						<c:if test="${data != null }">
							<input class="titleInput" name="postTitle" placeholder="제목을 입력하세요." value="${data.post.postTitle}">
						</c:if>
					</div>
					<hr>
					<div class="contentWrapper">
						<c:if test="${data == null }">
							<textarea class="contentInput" name="postCont" placeholder="내용을 입력하세요."></textarea>
						</c:if>
						<c:if test="${data != null }">
							<textarea class="contentInput" name="postCont" placeholder="내용을 입력하세요.">${data.post.postCont}</textarea>
							<script>
								var content = document.querySelector('.contentInput').value;
								content = content.replace(/<br>/g, '\r\n');
								document.querySelector('.contentInput').value = content;
							</script>
						</c:if>
					</div>
				</div>
			</div>
			<div>
				<div class="keywordWrapper">
					<p class="additional">매칭 키워드 선택</p>
					<p class="precautions">* 필수 선택입니다 *</p>
					<table class="keywordSearchTable">
						<tr>
							<th class="searchTableTh">가격</th>
							<c:if test="${data == null}">
								<td style="border-bottom: 1px solid #ffb5b7;"><input class="priceInput" type="text" name="price" id="price"></td>
							</c:if>
							<c:if test="${data != null}">
								<td style="border-bottom: 1px solid #ffb5b7;"><input class="priceInput" type="text" name="price" id="price" value="${data.post.price}"></td>
							</c:if>
						</tr>
						<tr>
							<th class="searchTableTh">수업목적</th>
							<td class="searchTableTd">
								<button type="button" class="keywordBtn" name="purpose" value="체형교정">체형교정</button>
								<button type="button" class="keywordBtn" name="purpose" value="건강증진">건강증진</button>
								<button type="button" class="keywordBtn" name="purpose" value="다이어트">다이어트</button>
								<button type="button" class="keywordBtn" name="purpose" value="바디프로필">바디프로필</button>
								<button type="button" class="keywordBtn" name="purpose" value="취미">취미</button>
								<button type="button" class="keywordBtn" name="purpose" value="대회준비">대회준비</button>
								<button type="button" class="keywordBtn" name="purpose" value="재활치료">재활치료</button>
								<button type="button" class="keywordBtn" name="purpose" value="벌크업">벌크업</button>
								<button type="button" class="keywordBtn" name="purpose" value="기초체력">기초체력</button>
								<button type="button" class="keywordBtn" name="purpose" value="시험준비">시험준비</button>
								<input type="hidden"name="purpose"  id="purpose">
							</td>
						</tr>
						<tr>
							<th class="searchTableTh">수업인원</th>
							<td class="searchTableTd">
								<button type="button" class="keywordBtn" name="classSize" value="1:1">1:1</button>
								<button type="button" class="keywordBtn" name="classSize" value="N:1">N:1</button>'
								<input type="hidden" name="classSize" id="classSize">
							</td>
						</tr>
						<tr>
							<th class="searchTableTh">장소</th>
							<td class="searchTableTd">
								<button type="button" class="keywordBtn" name="place" value="INDOOR EXERCIES">INDOOR EXERCIES</button>
								<button type="button" class="keywordBtn" name="place" value="OUTDOOR EXERCIES">OUTDOOR EXERCIES</button>
								<input type="hidden" name="place" id="place">
							</td>
						</tr>
					</table>
				</div>
			</div>
			<div class="previewWrapper">
				<p class="previewText">미리보기</p>
				<div class="pre_div">
					<c:if test="${data.fList != null}">
						<c:forEach items="${data.fList}" var="image">
							<img class="pre_img" src="http://52.78.116.59:8080/teuching/resources/upload/${image.rename_filename}">
						</c:forEach>
					</c:if>
				</div>
				<c:if test="${data != null}">
					<input type="hidden" name="postIdx" value="${data.post.postIdx}">
				</c:if>
			<button class="uploadBtn">저장</button>
			</div>
		</form>
	</section>
	<script src="http://52.78.116.59:8080/teuching/resources/js/post/post.js"></script>
	<script>
		var arr = ['purpose', 'classSize', 'place'];
		var keyword;
		var purpose;
		var classSize;
		var place;
		
		if(${data != null}) {
			purpose = '${data.post.purpose}';
			classSize = '${data.post.classSize}';
			place = '${data.post.place}';
			keyword = [purpose, classSize, place];
			
			for(i = 0; i < arr.length; i++) {
				document.getElementsByName(arr[i]).forEach(function(el) {
					if(el.value == keyword[i]) {
						el.checked = true;
						el.style.background = "#ff9090";
						el.style.color = "white";
						document.getElementById(arr[i]).value = el.value;
					}
				})
			}
		}
	</script>
</body>
</html>