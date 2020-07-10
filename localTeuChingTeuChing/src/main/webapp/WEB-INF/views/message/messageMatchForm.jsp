<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>Teu-Ching Teu-Ching</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
</head>

<body>
	<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
	<link rel="stylesheet" href="/css/jquery-ui.min.css">
	<link rel="stylesheet"
		href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" />
	<script
		src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
	<script type='text/javascript' src='//code.jquery.com/jquery-1.8.3.js'></script>
	<link rel="stylesheet"
		href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/css/bootstrap-datepicker3.min.css">
	<script type='text/javascript'
		src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/js/bootstrap-datepicker.min.js"></script>
	<script src="/js/bootstrap-datepicker.kr.js" charset="UTF-8"></script>
	<script type='text/javascript'>
		$(function() {
			$('.input-group.date').datepicker({
				calendarWeeks : false,
				todayHighlight : true,
				autoclose : true,
				format : "yyyy-mm-dd",
				language : "kr"
			});
		});
	</script>
	<link rel="stylesheet"
		href="http://52.78.116.59:8080/teuching/resources/css/message/messageMatchForm.css">
</head>

<body>
	<form
		action="http://52.78.116.59:8080/teuching/message/matchformsend.do" onsubmit="return check()">
		<div class="container">
			<h1>상담신청</h1>
			Date
			<div class="input-group date" style="width: 50%;">
				<input type="text" name="match_date" placeholder="날짜를 선택해주세요"
					value="${year }-<c:if test="${month < 10 }">0${month }</c:if><c:if test="${month >= 10 }">${month }</c:if>-<c:if test="${date < 10}">0${date }</c:if><c:if test="${date >= 10}">${date }</c:if>"
					class="form-control"> <span class="input-group-addon">
					<i class="glyphicon glyphicon-calendar"></i>
				</span>
			</div>
			<div class="row">
				<div class="col-sm-4">
					Time <select name="match_time" class="form-control">
						<optgroup label="오전">
							<option value="07:00">07:00</option>
							<option value="07:30">07:30</option>
							<option value="08:00">08:00</option>
							<option value="08:30">08:30</option>
							<option value="09:00">09:00</option>
							<option value="09:30">09:30</option>
							<option value="10:00">10:00</option>
							<option value="10:30">10:30</option>
							<option value="11:00">11:00</option>
							<option value="11:30">11:30</option>
							<option value="12:00">12:00</option>
						</optgroup>
						<optgroup label="오후">
							<option value="13:00">13:00</option>
							<option value="13:30">13:30</option>
							<option value="14:00">14:00</option>
							<option value="14:30">14:30</option>
							<option value="15:00">15:00</option>
							<option value="15:30">15:30</option>
							<option value="16:00">16:00</option>
							<option value="16:30">16:30</option>
							<option value="17:00">17:00</option>
							<option value="17:30">17:30</option>
							<option value="18:00">18:00</option>
							<option value="18:30">18:30</option>
							<option value="19:00">19:00</option>
							<option value="19:30">19:30</option>
							<option value="20:00">20:00</option>
							<option value="20:30">20:30</option>
							<option value="21:00">21:00</option>
							<option value="21:30">21:30</option>
							<option value="22:00">22:00</option>
							<option value="22:30">22:30</option>
							<option value="23:00">23:00</option>
						</optgroup>
					</select>
				</div>
			</div>
			<textarea name="msg_cont" id="textarea" placeholder="내용을 입력해주세요"></textarea>
			<br> 
			<input type="hidden" name="tr_email" value="${tr_email }">
			<button id="btn">신청하기</button>
		</div>
	</form>
	<script>
		function check(){
			if(document.querySelector('#textarea').value == ''){
				alert('내용을 입력해주세요');
				return false;
			}
		}
	</script>
</body>
</html>