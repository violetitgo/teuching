<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
<meta http-equiv="Expires" content="Mon, 06 Jan 1990 00:00:01 GMT">
<title>Teu-Ching Teu-Ching</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
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
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<style type="text/css">
#failMsg {
	color: #ff7761;
	font-weight: bold;
	font-size: medium;
}

#failImg {
	width: 40px;
	display: block;
	margin-left: auto;
	margin-right: auto;
	margin-bottom: 20px;
}

.blog-entry .text .heading a {
	color: #000;
	font-size: medium;
	font-weight: bold;
}

.text pl-md-4 ml-md-2 pt-4 {
	font-size: small;
}

#ftco-nav{
	padding-left: 15% !important;
}
.clickreview{
	cursor: pointer;
}


</style>

</head>
<body onload="imgLoad('${loginInfo.photo}');">

	<%@ include file="../include/top.jsp"%>
	<hr>
	<div class="container bootstrap snippet"
		style="margin-bottom: 2% !important;">
		<div class="row">
			<div class="col-sm-10">
				<h1>Trainer ${loginInfo.trainerName}</h1>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-3">
				<!--left col-->


				<div id="imgWrap" class="text-center">
					<div id="profileImg"></div>
					<form id="imgForm">
						<input type="file" class="text-center center-block file-upload"
							id="profileImage">
						<button type="button" onclick="changeImage();">변경하기</button>
					</form>
				</div>
				<br>

				<ul class="list-group">
					<li class="list-group-item text-muted">Activity <i
						class="fa fa-dashboard fa-1x"></i></li>
					<li class="list-group-item text-right"><span class="pull-left"><strong>Likes♡</strong></span>
						${loginInfo.tr_like}</li>
					<li class="list-group-item text-right"><span class="pull-left"><strong>Posts</strong></span>
						${postCount}</li>
				</ul>
				<div style="text-align: center;">
				<button class="clickpw">비밀번호 변경하기</button>
				</div>
			</div>
			<!--/col-3-->
			<div class="col-sm-9">
				<ul class="nav nav-tabs">
					<li class="active"><a data-toggle="tab" href="#home">회원정보
							수정하기</a></li>
					<li><a data-toggle="tab" href="#messages">작성한 게시글</a></li>
					<li><a data-toggle="tab" href="#match">매칭내역</a></li>
					<li><a data-toggle="tab" href="#report">신고/인증</a></li>
				</ul>


				<div class="tab-content">
					<div class="tab-pane active" id="home">
						<hr>
						<form class="form" method="post" id="trainerMypage"
							action="http://52.78.116.59:8080/teuching/member/mypageupdatet.do">
							<div class="form-group">

								<div class="col-xs-6">
									<label><h4>Email Address</h4></label>
									<div class="form-control" id="email">
										<span style="color: black;">${loginInfo.tr_email}</span> <input
											type="hidden" name="email" value="${loginInfo.tr_email}" />
									</div>
								</div>
							</div>
							<div class="form-group">

								<div class="col-xs-6">
									<label><h4>Trainer Name</h4></label>
									<div class="form-control">
										<span style="color: black;">${loginInfo.trainerName}</span>
									</div>
								</div>
							</div>

							<div class="form-group">
								<div class="col-xs-6">
									<label><h4>Phone</h4></label> <span style="font-size: small;">붙임표(-)까지
										입력해주세요.</span></label> <input type="text" id="cell" name="cell"
										maxlength="13" class="form-control"
										placeholder="${loginInfo.cell}">
								</div>
							</div>

							<div class="form-group">
								<div class="col-xs-6">
									<label><h4>Gender</h4></label> <select
										class="form-control form-control-alternative"
										style="font-size: small;" name="gender" id="gender">
										<option value="${loginInfo.gender}" selected>${loginInfo.gender}</option>
										<option>남성</option>
										<option>여성</option>
									</select>
								</div>
							</div>
							<div class="form-group">

								<div class="col-xs-6">
									<label><h4>Height(cm)</h4></label> <input type="text"
										id="height" name="height"
										class="form-control form-control-alternative"
										placeholder="${loginInfo.height}">
								</div>
							</div>
							<div class="form-group">

								<div class="col-xs-6">
									<label><h4>Weight(kg)</h4></label> <input type="text"
										id="weight" name="weight"
										class="form-control form-control-alternative"
										placeholder="${loginInfo.weight}">
								</div>
							</div>
							<div class="form-group">
								<div class="col-md-12">
									<div class="form-group focused">
										<label><h4>
												GYM Address
												<h4></h4></label><br> <input type="text" id="sample6_postcode"
											placeholder="우편번호"> <input type="button"
											onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
										<label></label><br> <input type="text"
											id="sample6_address"
											placeholder="현재 주소 : ${loginInfo.address}" name="address"
											style="width: 55%; height: 30px;"> <label
											class="form-control-label" for="input-address"></label><br>
										<br> <input type="text" id="sample6_detailAddress"
											placeholder="${loginInfo.address_detail}"
											name="address_detail"> <label
											class="form-control-label" for="input-address"></label> <input
											type="text" id="sample6_extraAddress" placeholder="참고항목">
									</div>
								</div>
							</div>
							<br>
							<div class="form-group">

								<div class="col-xs-6">
									<div class="form-group focused">
										<label class="form-control-label" for="input-address">선호
											지역 선택하기</label> 
											<br> 지역 1 <select name="prefer1-1" id="sido1"></select>
										<select name="prefer1-2" id="gugun1"></select><br>
										<span>현재 설정중인 지역 1 : ${loginInfo.prefer_add1}</span> 
										<br>지역 2<select name="prefer2-1" id="sido2"></select> 
										<select name="prefer2-2" id="gugun2"></select><br>
										<span>현재 설정중인 지역 2 : ${loginInfo.prefer_add2}</span> 
										<br> 지역 3 <select name="prefer3-1" id="sido3"></select> 
										<select name="prefer3-2" id="gugun3"></select><br>
										<span>현재 설정중인 지역 3 : ${loginInfo.prefer_add3}</span> 
									</div>
								</div>
							</div>
							<br>
							<div class="form-group">
								<div class="col-xs-12">
									<label><h4>Trainer Information</h4></label>
									<textarea class="form-control form-control-alternative"
										cols="80" rows="10" id="career"
										placeholder="${loginInfo.career}"
										name="career"></textarea>
									<br> <span style="color: #aaa;" id="counter">(0 / 최대
										500자)</span>
								</div>
							</div>
							<div class="form-group">
								<div class="col-xs-12">
								<label class="form-control-label">트레이닝 가능 종목 변경하기</label><br>
								<span>현재 등록된 트레이닝 종목 : ${loginInfo.purpose_keyword}</span> <br>
									<div class="row">
										<div class="col-lg-2">
											<div class="form-group focused">
												 <input type="text" id="keyword1" name="keyword1"
													class="form-control form-control-alternative">
											</div>
										</div>
										<div class="col-lg-2">
											<div class="form-group focused">
												<input type="text" id="keyword2" name="keyword2"
													class="form-control form-control-alternative">
											</div>
										</div>
										<div class="col-lg-2">
											<div class="form-group focused">
												<input type="text" id="keyword3" name="keyword3"
													class="form-control form-control-alternative">
											</div>
										</div>
										<div class="col-lg-2">
											<div class="form-group focused">
												<input type="text" id="keyword4" name="keyword4"
													class="form-control form-control-alternative">
											</div>
										</div>
										<div class="col-lg-2">
											<div class="form-group focused">
												<input type="text" id="keyword5" name="keyword5"
													class="form-control form-control-alternative">
											</div>
										</div>
									</div>
								</div>
								</div>
							<div class="form-group">
								<div class="col-xs-12">
									<br>
									<button class="btn btn-lg btn-success" type="button"
										id="updateT">
										<i class="glyphicon glyphicon-ok-sign"></i> Save
									</button>
									<button class="btn btn-lg" type="reset"
										onClick="window.location.reload()" style="cursor: pointer;">
										<i class="glyphicon glyphicon-repeat"></i> Reset
									</button>
									<a type="button" href="http://52.78.116.59:8080/teuching/member/goodbye.do" class="btn btn-primary"> 회원 탈퇴 </a>
								</div>
							</div>
						</form>
					</div>
					<!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
					<!--/tab-pane-->
					<div class="tab-pane" id="messages">
						<h2></h2>

						<hr>
						<form class="form" action="##" method="post" id="registrationForm">
							<div class="col-xs-12">
								<section class="container"
									style="margin-top: 2%; margin-bottom: 2%; width: 100%;">
									<table id="postTable"></table>
								</section>
							</div>
						</form>
					</div>
					<!--/tab-pane-->
					<div class="tab-pane" id="match">
						<h2></h2>
						<hr>
						<div class="col-xs-12">
							<section class="container"
								style="margin-top: 2%; margin-bottom: 2%; width: 100%;">
								<table id="matchTable" style="width: 70%">
									<thead>
										<tr>
											<th>State</th>
											<th>Mail</th>
											<th>Time</th>
											<th>Date</th>
											<th></th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${match }" var="m" varStatus="cnt">
											<c:if test="${cnt.index < 15 }">
												<tr>
													<c:if test="${m.match_yn eq 'N' }">
														<td id="state${m.match_idx}">✖</td>
													</c:if>
													<c:if test="${m.match_yn eq 'Y' }">
														<td id="state${m.match_idx}">✔</td>
													</c:if>
													<td>${m.mem_email }</td>
													<td>${m.match_time }</td>
													<td>${m.match_date }</td>
													<td><a onclick="match(${m.match_idx});"
														style="cursor: pointer" id="match${m.match_idx }"
														data-match_date="${m.match_date }"
														data-match_time="${m.match_time }"> <c:if
																test="${m.match_yn eq 'Y' }">
                                       수락완료
                                       </c:if> <c:if
																test="${m.match_yn eq 'N' }">
                                   		  수락하기
                                       </c:if>
													</a></td>
												</tr>
											</c:if>
											<c:if test="${cnt.index >= 15 }">
												<tr id="moreview${cnt.index }" style="display: none">
													<c:if test="${m.match_yn eq 'N' }">
														<td id="state${m.match_idx}">✖</td>
													</c:if>
													<c:if test="${m.match_yn eq 'Y' }">
														<td id="state${m.match_idx}">✔</td>
													</c:if>
													<td>${m.mem_email }</td>
													<td>${m.match_time }</td>
													<td>${m.match_date }</td>
													<td><a onclick="match(${m.match_idx});"
														style="cursor: pointer" id="match${m.match_idx }"
														data-match_date="${m.match_date }"
														data-match_time="${m.match_time }"> <c:if
																test="${m.match_yn eq 'Y' }">
                                       수락완료
                                       </c:if> <c:if
																test="${m.match_yn eq 'N' }">
                                       수락하기
                                       </c:if>
													</a></td>
												</tr>
											</c:if>
										</c:forEach>
									</tbody>
								</table>
								<a id="morea" onclick="moreview();">더보기</a>
							</section>
						</div>
					</div>
					<!--/tab-pane-->
					<!--/tab-pane-->
					<div class="tab-pane" id="report">
						<h4>
							자격증명 <a
								href="http://52.78.116.59:8080/teuching/quali/qualirequest.do">작성</a>
						</h4>

						<div class="col-xs-12">
							<section class="container"
								style="margin-top: 2%; margin-bottom: 2%; width: 100%;">
								<table id="reportTable" style="width: 60%;">
									<thead>
										<tr>
											<th>State</th>
											<th>Content</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${quali }" var="q">
											<tr>
												<c:if test="${q.auth_yn eq 'N' }">
													<td>✖</td>
												</c:if>
												<c:if test="${q.auth_yn eq 'Y' }">
													<td>✔</td>
												</c:if>
												<td>${q.quali_auth }</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</section>
						</div>
						<h4>나의 신고내역</h4>
						<hr>
						<div class="col-xs-12">
							<section class="container"
								style="margin-top: 2%; margin-bottom: 2%; width: 100%;">
								<table id="reportTable" style="width: 60%;">
									<thead>
										<tr>
											<th>State</th>
											<th>Content</th>
											<th style="width: 20%">Date</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${report }" var="r">
											<tr>
												<c:if test="${r.ans_yn eq 'Y' }">
													<td>✔</td>
												</c:if>
												<c:if test="${r.ans_yn eq 'N' }">
													<td>✖</td>
												</c:if>
												<td><a
													href="http://52.78.116.59:8080/teuching/report/mypagereport.do?revid=${r.report_idx}">
														${fn:substring(r.rep_cont,0,20) }...</a></td>
												<td>${r.report_date }</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</section>
						</div>
					</div>
					<!--/tab-pane-->
				</div>
				<!--/tab-pane-->
			</div>
			<!--/tab-content-->
		</div>
		<!--/col-9-->
	</div>
	<!--/row-->
	
	
<div class="modal fade" id="pwModal" tabindex="-1" role="dialog" >
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <!-- 닫기버튼 -->
      </div>
				<div class="modal-body">
						<form class="form"
							action="http://52.78.116.59:8080/teuching/member/pwupdate.do"
							method="post" id="pwUpdateform">
							<div class="form-group">
								<input type="hidden" name="email" value="${loginInfo.tr_email}" />
								<input type="hidden" name="memberType" value="${memberType}" />
								<label><h4>New Password</h4></label><br> <input
									type="password" class="form-control" id="password_1"
									name="password" class="pw" maxlength="20">
							</div>
							<div class="form-group">
								<label><h4>Password Check</h4></label> <input type="password"
									id="password_2" class="form-control"> 
							</div>
							<div style="text-align: left; margin-left: 1%;">
								<a type="button" id="pwSubmit" class="btn btn-primary" href="#">
									비밀번호 변경하기 </a>
							</div>
						</form>
				</div>
				<div class="modal-footer">
        <a type="button" class="btn btn-default" data-dismiss="modal">닫기</a>
      </div>
    </div>
  </div>
</div>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- 카카오 주소 -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=42e0be41ec144283c6bfe7c0ed8dae35&libraries=services"></script>

<script type="text/javascript">

/* 비밀번호모달 */

$(function(){
		
		$('.clickpw').click(function() {
			$('#pwModal').modal();
		});
	});


function imgLoad(img) {
   window.setTimeout(function() {
      var div = document.getElementById('profileImg');
      var imgDiv = document.createElement('img');
      imgDiv.className="avatar img-circle img-thumbnail";
      imgDiv.alt="avatar";
      imgDiv.src = "http://52.78.116.59:8080/teuching/uplaod/profileImg/" + img;
      div.append(imgDiv);
   }, 1000);
}

function changeImage() {
   var form = document.getElementById('imgForm');
   if(form[0].files.length > 0) {
      var formdata = new FormData();
      formdata.append('file', form[0].files[0]);
      
      $.ajax({
         url: 'http://52.78.116.59:8080/teuching/member/photoupdate.do',
         type: 'post',
             data: formdata,
           processData : false,
           contentType: false,
           success: function(v) {
              if(v > 0) {
                 alert("사진이 정상적으로 변경되었습니다.");
              } else {
                 alert("사진 변경 중 오류가 발생했습니다.");
              }
           }
      })
   } else {
      alert("변경할 사진이 존재하지 않습니다.");
   }
}

$(document).ready(function() {
    var readURL = function(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                $('.avatar').attr('src', e.target.result);
            }
            reader.readAsDataURL(input.files[0]);
        }
    }
    $(".file-upload").on('change', function(){
        readURL(this);
    });
});


// 회원정보 업데이트
$(document).ready(function(e){
	
   $('#updateT').click(function(){
    	  
    		 if($.trim($('#gender').val()) == ''){
				document.getElementById('gender').value = "${loginInfo.gender}";
			}
			if($.trim($('#cell').val()) == ''){
				document.getElementById('cell').value = "${loginInfo.cell}";
			}
			if($.trim($('#sample6_address').val()) == ''){
				document.getElementById('sample6_address').value = "${loginInfo.address}";
			}
			if($.trim($('#sample6_detailAddress').val()) == ''){
				document.getElementById('sample6_detailAddress').value = "${loginInfo.address_detail}";
			}
			if($.trim($('#weight').val()) == ''){
				document.getElementById('weight').value = "${loginInfo.weight}";
			}
			if($.trim($('#height').val()) == ''){
				document.getElementById('height').value = "${loginInfo.height}";
			}
			if($.trim($('#career').val()) == ''){
				document.getElementById('career').value = "${loginInfo.career}";
			}
			if($.trim($('#sido1').val()) == '시/도 선택'){
				document.getElementById('sido1').value = null;
				
			}
			if($.trim($('#sido2').val()) == '시/도 선택'){
				document.getElementById('sido2').value = null;
				
			}
			if($.trim($('#sido3').val()) == '시/도 선택'){
				document.getElementById('sido3').value = null;
				
			}
    	  
       	  alert("회원정보 수정이 완료되었습니다.");
       	  $('#trainerMypage').submit();
       
   });
   
});

//비밀번호 변경  체크
$('#pwSubmit').click(function() {

if ($.trim($('#password_1').val()) == '') {
	alert("비밀번호를 입력해주세요.");
	setTimeout(function(){ $('#password_1').focus(); }, 10)
	return;
}
//패스워드 확인
else if ($('#password_1').val() != $('#password_2').val()) {
	alert('비밀번호가 일치하지 않습니다. 비밀번호를 재확인해주세요.');
	setTimeout(function(){ $('#password_2').focus(); }, 10)
	return;
}else{
	$('#pwUpdateform').submit();
}

});

// 비밀번호 정규식
function pw_check(password) {    
	var regex = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/;
return (password != '' && password != 'undefined' && regex.test(password)); 
}
$("input[name='password']").blur(function(){

    var password = $(this).val();
    if( password == '' || password == 'undefined') return;

    if(! pw_check(password) ) {
    	alert("잘못된 비밀번호 번호입니다. 숫자와 문자, 기호를 포함한 8자리 이상의 비밀번호를 입력하세요.");
        setTimeout(function(){ $('#password_1').focus(); }, 10)
        return false;
    }else{
    	check_pw = true;
    }
});

//휴대폰 번호 정규식
function cell_check(cell) {    
var regex = /^\d{2,3}-\d{3,4}-\d{4}$/;
return (cell != '' && cell != 'undefined' && regex.test(cell)); 
}
$("input[name='cell']").blur(function(){

    var cell = $(this).val();
    if( cell == '' || cell == 'undefined') return;

    if(! cell_check(cell) ) {
    	alert("잘못된 휴대폰 번호입니다. 숫자, - 를 포함한 숫자만 입력하세요.");
        setTimeout(function(){ $('#cell').focus(); }, 10)
        return false;
    }else{
    	check_cell = true;
    }
});


//커리어 글자 제한두기 
$('#career').keyup(function (e){
   var content = $(this).val();
   $('#counter').html("("+content.length+" / 최대 500자)");    //글자수 실시간 카운팅
   if (content.length > 500){
          alert("최대 500자까지 입력 가능합니다.");
          $(this).val(content.substring(0, 500));
          $('#counter').html("(500 / 최대 500자)");
      }
});



//선호지역 등록
$('document').ready(function() {
var area0 = ["시/도 선택","서울특별시","인천광역시","대전광역시","광주광역시","대구광역시","울산광역시","부산광역시","경기도","강원도","충청북도","충청남도","전라북도","전라남도","경상북도","경상남도","제주도"];
var area1 = ["강남구","강동구","강북구","강서구","관악구","광진구","구로구","금천구","노원구","도봉구","동대문구","동작구","마포구","서대문구","서초구","성동구","성북구","송파구","양천구","영등포구","용산구","은평구","종로구","중구","중랑구"];
var area2 = ["계양구","미추홀구","남동구","동구","부평구","서구","연수구","중구","강화군","옹진군"];
var area3 = ["대덕구","동구","서구","유성구","중구"];
var area4 = ["광산구","남구","동구","북구","서구"];
var area5 = ["남구","달서구","동구","북구","서구","수성구","중구","달성군"];
var area6 = ["남구","동구","북구","중구","울주군"];
var area7 = ["강서구","금정구","남구","동구","동래구","부산진구","북구","사상구","사하구","서구","수영구","연제구","영도구","중구","해운대구","기장군"];
var area8 = ["고양시","과천시","광명시","광주시","구리시","군포시","김포시","남양주시","동두천시","부천시","성남시","수원시","시흥시","안산시","안성시","안양시","양주시","오산시","용인시","의왕시","의정부시","이천시","파주시","평택시","포천시","하남시","화성시","가평군","양평군","여주군","연천군"];
var area9 = ["강릉시","동해시","삼척시","속초시","원주시","춘천시","태백시","고성군","양구군","양양군","영월군","인제군","정선군","철원군","평창군","홍천군","화천군","횡성군"];
var area10 = ["제천시","청주시","충주시","괴산군","단양군","보은군","영동군","옥천군","음성군","증평군","진천군","청원군"];
var area11 = ["계룡시","공주시","논산시","보령시","서산시","아산시","천안시","금산군","당진군","부여군","서천군","연기군","예산군","청양군","태안군","홍성군"];
var area12 = ["군산시","김제시","남원시","익산시","전주시","정읍시","고창군","무주군","부안군","순창군","완주군","임실군","장수군","진안군"];
var area13 = ["광양시","나주시","목포시","순천시","여수시","강진군","고흥군","곡성군","구례군","담양군","무안군","보성군","신안군","영광군","영암군","완도군","장성군","장흥군","진도군","함평군","해남군","화순군"];
var area14 = ["경산시","경주시","구미시","김천시","문경시","상주시","안동시","영주시","영천시","포항시","고령군","군위군","봉화군","성주군","영덕군","영양군","예천군","울릉군","울진군","의성군","청도군","청송군","칠곡군"];
var area15 = ["거제시","김해시","마산시","밀양시","사천시","양산시","진주시","진해시","창원시","통영시","거창군","고성군","남해군","산청군","의령군","창녕군","하동군","함안군","함양군","합천군"];
var area16 = ["서귀포시","제주시","남제주군","북제주군"];


// 시/도 선택 박스 초기화
$("select[id^=sido]").each(function() {
   $selsido = $(this);
   $.each(eval(area0), function() {
      $selsido.append("<option value='"+this+"'>"+this+"</option>");
   });
   $selsido.next().append("<option value=''>구/군 선택</option>");
});

// 시/도 선택시 구/군 설정

$("select[id^=sido]").change(function() {
var area = "area"+$("option",$(this)).index($("option:selected",$(this))); // 선택지역의 구군 Array
   var $gugun = $(this).next(); // 선택영역 군구 객체
   $("option",$gugun).remove(); // 구군 초기화
   
   if(area == "area0") {
      $gugun.append("<option value=''>구/군 선택</option>");
      
   } else {
      $.each(eval(area), function() {
         $gugun.append("<option value='"+this+"'>"+this+"</option>");
      });
   }
});
});

//카카오지도 
function sample6_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 조합된 참고항목을 해당 필드에 넣는다.
                document.getElementById("sample6_extraAddress").value = extraAddr;
            
            } else {
                document.getElementById("sample6_extraAddress").value = '';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample6_postcode').value = data.zonecode;
            document.getElementById("sample6_address").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("sample6_detailAddress").focus();
        }
    }).open();
}

//해당 트레이너의 포스트리스트 뽑아주기

   $('document').ready(function() {
                  pList = new Array();

                  $.ajax({
                     url : "http://52.78.116.59:8080/teuching/member/tpostlist.do",
                     data : {
                        "input" : "${loginInfo.tr_email}",
                        "option" : "trainer"
                     },
                     success : function(v) {
                        for (i = 0; i < v.length; i++) {
                           pList.push(v[i]);
                        }

                        createTable();
                     }
                  })

                  function createTable() {
                     // post list 생성할 table
                     var table = document.getElementById('postTable');
                     table.innerHTML = "";
                     if (pList.length > 0) {
                        for (i = 0; i < pList.length; i++) {
                           // row 생성
                           var tr = table.insertRow();
                           tr.className = 'blog-entry blog-entry-2 justify-content-end col-md-12 ftco-animate fadeInUp ftco-animated';

                           // 게시글 콘텐츠 담을 cell 생성
                           var contentTd = tr.insertCell();

                           // 콘텐츠 감싸줄 div 생성
                           var wrapper = document.createElement('div');
                           wrapper.className = 'text pl-md-4 ml-md-2 pt-4';
                           wrapper.style.width = 'auto';
                           contentTd.append(wrapper);

                           // 트레이너 이름, 작성일자, 댓글 수 담을 header
                           var header = document.createElement('div');
                           header.className = 'meta';
                           wrapper.append(header);

                           var writeDate = document
                                 .createElement('div');
                           writeDate.innerText = pList[i].writeDate;
                           header.append(writeDate);

                           var writer = document.createElement('div');
                           header.append(writer);

                           var writerLink = document.createElement('a');
                           // 트레이너 프로필로 이동할 수 있는 링크
                           writerLink.href = 'http://52.78.116.59:8080/teuching/profile/review.do?trainerEmail='+ pList[i].trEmail;
                           writerLink.innerText = pList[i].trainerName;
                           writer.append(writerLink);

                           var body = document.createElement('div');
                           wrapper.append(body);

                           var title = document.createElement('h3');
                           title.className = 'heading mt-2';
                           body.append(title);

                           var titleLink = document.createElement('a');
                           titleLink.href = 'http://52.78.116.59:8080/teuching/post/detail.do?postNo='+ pList[i].postIdx;
                           titleLink.innerText = pList[i].postTitle;
                           title.append(titleLink);
                        }
                     } else {
                        var failMsg = document.createElement('p');
                        var failImg = document.createElement('img');
                        failImg.src = "data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjUxMnB0IiB2aWV3Qm94PSIwIC0yIDUxMiA1MTIiIHdpZHRoPSI1MTJwdCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj48cGF0aCBkPSJtNDQ4IDUwOC44MDA3ODEtMTQ4LjU5Mzc1LTkyLjgwMDc4MWgtMjY3LjQwNjI1Yy0xNy42NzE4NzUgMC0zMi0xNC4zMjgxMjUtMzItMzJ2LTM1MmMwLTE3LjY3MTg3NSAxNC4zMjgxMjUtMzIgMzItMzJoNDQ4YzE3LjY3MTg3NSAwIDMyIDE0LjMyODEyNSAzMiAzMnYzNTJjMCAxNy42NzE4NzUtMTQuMzI4MTI1IDMyLTMyIDMyaC0zMnptMCAwIiBmaWxsPSIjZmY3NzYxIi8+PGcgZmlsbD0iI2ZmZiI+PHBhdGggZD0ibTI3MiAyNTZoLTMydi0xNDRjMC04LjgzNTkzOCA3LjE2NDA2Mi0xNiAxNi0xNnMxNiA3LjE2NDA2MiAxNiAxNnptMCAwIi8+PHBhdGggZD0ibTI0MCAyODhoMzJ2MzJoLTMyem0wIDAiLz48L2c+PC9zdmc+";
                        failImg.id = 'failImg';
                        failMsg.id = 'failMsg';
                        failMsg.innerText = "아직 등록하신 게시글이 없습니다. 게시글을 등록하여 튜터분들과 운동을 시작해볼까요?";
                        table.append(failImg);
                        table.append(failMsg);
                     }
                  }
               })
   function match(match_idx){
      if(confirm("수락하시겠습니까?")){
         $.ajax({
            url:"http://52.78.116.59:8080/teuching/message/msgaccept.do?match_idx=" + match_idx,
            type:"get",
            success: function(data){
               if(data == 'success'){
                  const match_date = $('#match' + match_idx).data("match_date");
                  const match_time = $('#match' + match_idx).data("match_time")
                  alert('수락완료');
                  $('#match' + match_idx).html("<a>수락완료</a>");
                  $('#state' + match_idx).html("✔");
               }else{
                  alert('이미 수락된 매칭입니다');
               }
            }
         });
      }
   }
   
   function moreview(){
      $('tr[id^="moreview"]').show();
      $('#morea').hide();
   }
   
</script>

</body>
</html>