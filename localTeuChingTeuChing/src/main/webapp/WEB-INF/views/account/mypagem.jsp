<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
	<link
	href="https://fonts.googleapis.com/css2?family=Gamja+Flower&display=swap"
	rel="stylesheet">
	
<style type="text/css">
input::placeholder {
	color: black !important;
}

.form-height {
	height: 110px;
}

.col-sm-9 {
	width: 100%;
	margin-left: 10%;
	color: black !important;
}

#ftco-nav{
	padding-left: 15% !important;
}

#star {
	cursor: pointer;
}

#star a.on {
	color: red;
}

.reviewform {
display: block;
    width: 40%;
    height: 34px;
    padding: 6px 12px;
    font-size: 14px;
    line-height: 1.42857143;
    color: #555;
    background-color: #fff;
    background-image: none;
    border: 1px solid #ccc;
    border-radius: 4px;
    -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
    box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
    -webkit-transition: border-color ease-in-out .15s,-webkit-box-shadow ease-in-out .15s;
    -o-transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
    transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
}
.reviewctform {
display: block;
    width: 40%;
    height: 120px;
    padding: 6px 12px;
    font-size: 14px;
    line-height: 1.42857143;
    color: #555;
    background-color: #fff;
    background-image: none;
    border: 1px solid #ccc;
    border-radius: 4px;
    -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
    box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
    -webkit-transition: border-color ease-in-out .15s,-webkit-box-shadow ease-in-out .15s;
    -o-transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
    transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
}

.clickreview{
    background: #ffb5b5 !important;
    border: 1px solid #ffb5b5 !important;
    color: #fff;
	cursor: pointer;
		font-family: 'Gamja Flower', cursive;
	font-size: 0.9vw;
}




</style>

</head>
<body>
	<%@ include file="../include/top.jsp"%>
	<hr>
	<div class="main-content">
		<div class="container mt-7"
			style="margin-top: 1% !important; margin-bottom: 2% !important;">
			<div class="row">
				<div class="col-xl-8 m-auto order-xl-1">
				<!--  -->
					<div class="col-sm-9">
						<ul class="nav nav-tabs">
							<li class="active"><a data-toggle="tab" href="#home">회원정보
									수정하기</a></li>
							<li><a data-toggle="tab" href="#pwUpdate">비밀번호 변경하기 </a></li>
							<li><a data-toggle="tab" href="#match">매칭내역</a></li>
							<li><a data-toggle="tab" href="#report">신고내역</a></li>
						</ul>

						<div class="tab-content">
							<div class="tab-pane active" id="home">
							<h2></h2>
								<form class="form"
									action="http://52.78.116.59:8080/teuching/member/mypageupdatem.do"
									method="post" id="memberMypage">
									<div class="col-xs-6 form-height">
										<h4>Email Address</h4>
										<div class="form-control" id="email">
											<span style="color: black;">${loginInfo.mem_email}</span> <input
												type="hidden" name="email" value="${loginInfo.mem_email}" />
										</div>
									</div>
									<div class="col-xs-6 form-height">
										<h4>Name</h4>
										<div class="form-control">
											<span style="color: black;">${loginInfo.nickname}</span>
										</div>
									</div>
									<div class="col-xs-6 form-height">
										<h4>
											Phone&nbsp;&nbsp;<span style="font-size: 11px;">붙임표(-)까지
												입력해주세요.</span>
										</h4>
										<input type="text" id="cell" name="cell" maxlength="13"
											class="form-control" placeholder="${loginInfo.cell}">
									</div>
									<div class="col-xs-6 form-height">
										<h4>Gender</h4>
										<select class="form-control form-control-alternative"
											style="font-size: small;" name="gender" id="gender">
											<option value="${loginInfo.gender}" selected>${loginInfo.gender}</option>
											<option>남성</option>
											<option>여성</option>
										</select>
									</div>
									<div class="col-md-12">
										<div class="form-group focused">
											<label><h4>GYM Address</h4></label><br> <input
												type="text" id="sample6_postcode" placeholder="우편번호">
											<input type="button" onclick="sample6_execDaumPostcode()"
												value="우편번호 찾기"> <br> <br> <input
												type="text" id="sample6_address"
												placeholder="현재 주소 : ${loginInfo.address}" name="address"
												style="width: 55%; height: 30px;"> <label
												class="form-control-label" for="input-address"></label> <br>
											<br> <label class="form-control-label"
												for="input-address"></label> <input type="text"
												id="sample6_extraAddress" placeholder="참고항목">
										</div>
									</div>
									<div class="col-xs-12 form-height">
										<br>
										<button class="btn btn-lg btn-success" type="button"
											id="memberUpdate">
											<i class="glyphicon glyphicon-ok-sign"></i> Save
										</button>
										<button class="btn btn-lg" type="reset"
											onClick="window.location.reload()" style="cursor: pointer;">
											<i class="glyphicon glyphicon-repeat"></i> Reset
										</button>
										<a type="button" href="http://52.78.116.59:8080/teuching/member/goodbye.do" class="btn btn-primary"> 회원 탈퇴 </a>
									</div>
								</form>
							</div>
							<!--  -->
							<div class="tab-pane" id="pwUpdate">
							<h2></h2>
								<form class="form" action="http://52.78.116.59:8080/teuching/member/pwupdate.do" method="post" id="pwUpdateform">
									<div class="col-xs-6 form-height">
									<input type="hidden" name="email" value="${loginInfo.mem_email}" />
									<input type="hidden" name="memberType" value="${memberType}" />
										<label><h4>New Password</h4></label><br> <input
											type="password" class="form-control" id="password_1"
											name="password" class="pw" maxlength="20">
									</div>
									<div class="col-xs-6 form-height">
										<label><h4>Password Check</h4></label> <input
											type="password" id="password_2" class="form-control">
									</div>
									<div style="text-align: left; margin-left: 3%;">
										<a type="button" id="pwSubmit" class="btn btn-primary" href="#"> 비밀번호 변경하기 </a>
									</div>
								</form>
							</div>
							<!--/tab-pane-->
							<!-- Post Table -->
							<div class="tab-pane" id="messages">
								<h2></h2>
								<form class="form" action="##" method="post"
									id="registrationForm">
									<div class="col-xs-12">
										<section class="container"
											style="margin-top: 2%; margin-bottom: 2%; width: 100%;">
											<table id="postTable"></table>
										</section>
									</div>
								</form>
							</div>
							<!-- /Post Table -->
							<div class="tab-pane" id="match">
								<h2></h2>
								<hr>
								<div class="col-xs-12">
									<section class="container"
										style="margin-top: 2%; margin-bottom: 2%; width: 100%;">
										<table style="width: 100%;">
											<thead>
												<tr>
													<th>State</th>
													<th>Trainer</th>
													<th>Time</th>
													<th>Date</th>
													<th></th>
												</tr>
											</thead>
											<tbody id="tbody">
												<c:forEach items="${match }" var="m" varStatus="cnt">
													<c:if test="${cnt.index < 10 }">
														<tr>
															<c:if test="${m.match_yn eq 'Y' }">
																<td>✔</td>
															</c:if>
															<c:if test="${m.match_yn eq 'N' }">
																<td>✖</td>
															</c:if>
															<td>${m.tr_email }</td>
															<td>${m.match_time }</td>
															<td>${m.match_date }</td>
															
															<c:if test="${m.match_yn eq 'Y' }">
																<td><button class="clickreview" value="${m.tr_email }">리뷰쓰기</button></td>
															</c:if>
														</tr>
											
													</c:if>
													<c:if test="${cnt.index >= 10 }">
														<tr id="moreview${cnt.index }" style="display: none">
															<c:if test="${m.match_yn eq 'Y' }">
																<td>✔</td>
															</c:if>
															<c:if test="${m.match_yn eq 'N' }">
																<td>✖</td>
															</c:if>
															<td>${m.tr_email }</td>
															<td>${m.match_time }</td>
															<td>${m.match_date }</td>
															
															<c:if test="${m.match_yn eq 'Y' }">
																<td><button class="clickreview" value="${m.tr_email }">리뷰쓰기</button></td>
															</c:if>
														</tr>
													</c:if>
												</c:forEach>
											</tbody>
										</table>
										<a id="morea" onclick="moreview();">더보기</a>
									</section>
								</div>
							</div>
							
							<div class="tab-pane" id="report">
								<h2></h2>
								<div class="col-xs-12">
									<section class="container"
										style="margin-top: 2%; margin-bottom: 2%; width: 100%;">
										<table style="width: 100%;">
											<thead>
												<tr>
													<th>State</th>
													<th style="width: 60%;">Title</th>
													<th>Date</th>
												</tr>
											</thead>
											<tbody id="tbody">
												<c:forEach items="${report }" var="r">
													<tr>
														<c:if test="${r.ans_yn eq 'Y'}">
															<td>✔</td>
														</c:if>
														<c:if test="${r.ans_yn eq 'N'}">
															<td>✖</td>
														</c:if>
														<td><a
															href="http://52.78.116.59:8080/teuching/report/mypagereport.do?traid=${r.report_idx}">
																${fn:substring(r.rep_cont,0,20) }...</a></td>
														<td>${r.report_date }</td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</section>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
	<div class="modal fade" id="reviewModal" tabindex="-1" role="dialog" >
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <!-- 닫기버튼 -->
      </div>
      
      <div class="modal-body">
        <div class="container">
             <form method="post" enctype="multipart/form-data"
                        id="uploadReview">
                        <input type="hidden" value="${m.tr_email }" name="tr_email" id="tr_email">
                        <div class="form-group">
                           <label for="TrainerName">TrainerEmail</label>
                           <div id="trnn" style="color:gray;"></div>
                        </div>

                        <div class="form-group">
                           <label for="memNickname">Nickname</label> <input type="hidden"
                              class="reviewform" id="memNickname"
                              name="memNickname" value="${loginInfo.nickname}">
                           <div style="color:gray;">${loginInfo.nickname}</div>
                        </div>

                        <div class="form-group">
                           <label for="reviewPw">Password</label> <input type="text"
                              class="reviewform" id="reviewPw" name="reviewPw">
                        </div>
                        <!-- 별점 -->
                        <div class="form-group">
                           <input type="hidden" name="rev_score" id="starvalue" value="">
                           <label for="revScore">Star rating</label>
                           <div id="star" name="revScore">
                              <a value="1">★</a> <a value="2">★</a> <a value="3">★</a> <a
                                 value="4">★</a> <a value="5">★</a>
                           </div>
                        </div>

                        <div class="form-group">
                           <label for="revCont">Review</label>
                           <textarea id="revCont" cols="30" rows="10" class="reviewctform"
                              name="revCont"></textarea>
                        </div>

                        <div class="form-group">
                           <input type="submit" value="Post Comment"
                              class="btn py-3 px-4 btn-primary" onclick="uploadReview()">
                        </div>

                     </form>
         
        </div>
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

<script>

/* 리뷰모달 */
 
 $(function(){
		
		$('.clickreview').click(function() {
			var value = $(this).val();
			console.log(value);
			$('#tr_email').val(value);
			$('#trnn').html(value);
			$('#reviewModal').modal();
		});
	});


 /* 벌점 */
 $('#star a').click(function() {
       $(this).parent().children("a").removeClass("on");
       $(this).addClass("on").prevAll("a").addClass("on");
       console.log($(this).attr("value"));
       $('#starvalue').val($(this).attr("value"));
    });

 /* 리뷰 업로드 */
 function uploadReview() {
    
    $.ajax({
       type:'POST',
       url: 'http://52.78.116.59:8080/teuching/review/uploadreview.do',
       data: $("#uploadReview").serialize(),
       success: function(data) {
             alert("리뷰가 성공적으로 등록되었습니다.");
       }
       
    })
 };



$('#memberUpdate').click(function() {
		
		if($.trim($('#gender').val()) == ''){
			document.getElementById('gender').value = "${loginInfo.gender}";
		}
		if($.trim($('#cell').val()) == ''){
			document.getElementById('cell').value = "${loginInfo.cell}";
		}
		if($.trim($('#sample6_address').val()) == ''){
			document.getElementById('sample6_address').value = "${loginInfo.address}";
		}
		alert("회원정보 수정이 완료되었습니다!");
		$('#memberMypage').submit();
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

// 휴대폰 번호 정규식
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

//카카오 지도
function sample6_execDaumPostcode() {
new daum.Postcode(
		{
			oncomplete : function(data) {
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
				if (data.userSelectedType === 'R') {
					// 법정동명이 있을 경우 추가한다. (법정리는 제외)
					// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
					if (data.bname !== ''
							&& /[동|로|가]$/g.test(data.bname)) {
						extraAddr += data.bname;
					}
					// 건물명이 있고, 공동주택일 경우 추가한다.
					if (data.buildingName !== ''
							&& data.apartment === 'Y') {
						extraAddr += (extraAddr !== '' ? ', '
								+ data.buildingName : data.buildingName);
					}
					// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
					if (extraAddr !== '') {
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
			}
		}).open();
}

function moreview() {
$('tr[id^="moreview"]').show();
$('#morea').hide();
}







</script>

</body>
</html>