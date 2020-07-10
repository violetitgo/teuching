var purpose = "null";
var sports = "null";
var area = "null";
var classSize = "null";
var gender = "null";
var place = "null";
var select = document.getElementById('placeSelect');
var pList;

document.querySelectorAll(".keywordBtn").forEach(function(el) {
	el.addEventListener('click', function(v) {
		if(el.checked == true) {
			el.checked = false;
			v.target.style.background = "white";
			v.target.style.color = "#ff9090";
			
			reset(el.name, 'null');
		} else {
			el.checked = true;
			v.target.style.background = "#ff9090";
			v.target.style.color = "white";

			reset(el.name, el.value);
		}
		
		
		if(el.value == '타지역') {
			select.style.display = "inline";
			area = "타지역";
		} else if(el.value == '등록지 기준') {
			select.style.display = "none";
			// 바꿀거야.
			area = "등록지";
		}
	})
})

function reset(name, value) {
	document.getElementsByName(name).forEach(function(el) {
		if(el.checked) {
			if(el.value != value) {
				el.checked = false;
				el.style.background = "white";
				el.style.color = "#ff9090";
			} 
		}
	})
	
	switch(name) {
		case "purpose":
			purpose = value;
			break;
		case "sports":
			sports = value;
			break;
		case "classSize":
			classSize = value;
			break;
		case "gender":
			gender = value;
			break;
		case "place":
			example = value;
			break;
	}
}

// 검색어로 검색
document.getElementById("inputBtn").addEventListener('click', function(el) {
	pList = new Array();
	var input = document.getElementById("keywordInput");
	var option = document.getElementById("searchOption");
	
	$.ajax({
		url : "http://52.78.116.59:8080/teuching/matching/searchword.do",
		data : {
			"input" : input.value,
			"option" : option.value
		},
		success : function(v) {
			for(i = 0; i < v.length; i++) {
				pList.push(v[i]);
			}
			
			createTable();
		}
	})
})

// 키워드로 검색
var eight_provinces = ['경기', '경북', '경남', '충북', '충남', '전남', '전북', '강원'];
document.getElementById("keywordSearchBtn").addEventListener('click', function(el) {
	pList = new Array();
	var registration = document.getElementById('registration');
	
	if(area == '타지역') {
		area = select.value;
	} else {
		area = document.getElementById('memberArea').value;
		area = area.split(" ");
		if(area[0] in eight_provinces) {
			area = area[1];
		} else {
			area = area[0];
		}
	}
	
	// area는 input #memberAread의 값이 들어있음
	// 비회원이면 아무것도 안들어있고, 회원이면 회원의 주소가 담겨있음
	if(area.length < 1) { // 비회원일 경우
		if(registration.checked == true) { // 등록지 기준 버튼을 클릭했는지에 대한 여부
			alert("비회원은 등록지 기준 매칭이 불가능합니다. 타지역 선택 후 직접 골라주세요."); // 클릭했을 경우 해당 알림창 띄움
		} else {
			// 등록지 기준 버튼을 클릭하지 않으면, 자동으로 지역을 서울로 매칭하는 것에 대한 찬반
			if(confirm('비회원은 서울을 기준으로 매칭합니다. 괜찮으신가요?')) {
				area = '서울';
				keywordSearch();
			} else {
				alert("타지역 선택 후 직접 골라주세요.");
			}
		}
	} else { // 회원일 경우
		keywordSearch();
	}
})

function keywordSearch() {
	$.ajax({
		url: "http://52.78.116.59:8080/teuching/matching/keyword.do",
		data: {
			purpose : purpose,
			sports : sports,
			area : area,
			classSize : classSize,
			gender : gender,
			place : place
		},
		success: function(v) {
			for(i = 0; i < v.length; i++) {
				pList.push(v[i]);
			}
			
			createTable();
		}
	})
}

if(document.getElementById('memberType').value == 'trainer') {
	document.getElementById('writeBtn').addEventListener('click', function() {
		location.href="http://52.78.116.59:8080/teuching/post/writepost.do?postIdx=0";
	})
}

function createTable() {
	document.getElementById('topUp').style.display = 'block';
	// post list 생성할 table
	var table = document.getElementById('postTable');
	table.innerHTML = "";
	if(pList.length > 0) {
		for(i = 0; i < pList.length; i++) {
			// row 생성
			var tr = table.insertRow();
			tr.className = 'blog-entry blog-entry-2 justify-content-end col-md-12 ftco-animate fadeInUp ftco-animated';
			
			// 트레이너의 이미지 담을 cell 생성
			var imageTd = tr.insertCell();
			
			// 이미지 담을 div 생성
			var image = document.createElement('div');
			image.className = 'img rounded-circle mb-2';
			image.style.backgroundImage = 'url(http://52.78.116.59:8080/teuching/resources/upload/profileImg/' + pList[i].trPhoto + ')';
			image.style.width = '116px';
			image.style.height = '141px';
			image.style.marginTop = '54px';
			imageTd.append(image);
			
			// 게시글 콘텐츠 담을 cell 생성
			var contentTd = tr.insertCell();
			
			// 콘텐츠 감싸줄 div 생성
			var wrapper = document.createElement('div');
			wrapper.className = 'text pl-md-4 ml-md-2 pt-4';
			wrapper.style.width = '853px';
			contentTd.append(wrapper);
			
			// 트레이너 이름, 작성일자, 댓글 수 담을 header
			var header = document.createElement('div');
			header.className = 'meta';
			wrapper.append(header);
			
			var writeDate = document.createElement('div');
			writeDate.innerText = pList[i].writeDate;
			header.append(writeDate);
			
			var writer = document.createElement('div');
			header.append(writer);
			
			var writerLink = document.createElement('a');
			// 트레이너 프로필로 이동할 수 있는 링크
			writerLink.href = 'http://52.78.116.59:8080/teuching/profile/review.do?trainerEmail=' + pList[i].trEmail;
			writerLink.innerText = pList[i].trainerName;
			writer.append(writerLink);
			
			var body = document.createElement('div');
			wrapper.append(body);
			
			var title = document.createElement('h3');
			title.className = 'heading mt-2';
			body.append(title);
			
			var titleLink = document.createElement('a');
			titleLink.href = 'http://52.78.116.59:8080/teuching/post/detail.do?postNo=' + pList[i].postIdx;
			titleLink.innerText = pList[i].postTitle;
			title.append(titleLink);
			
			var content = document.createElement('div');
			content.style.height = '30px';
			content.style.overflow = 'hidden';
			var con = pList[i].postCont;
			con = con.replace('<br>', '\r\n');
			content.innerText = con;
			body.append(content);
		}
	} else {
		var failMsg = document.createElement('p');
		var failImg = document.createElement('img');
		failImg.src = "data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjUxMnB0IiB2aWV3Qm94PSIwIC0yIDUxMiA1MTIiIHdpZHRoPSI1MTJwdCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj48cGF0aCBkPSJtNDQ4IDUwOC44MDA3ODEtMTQ4LjU5Mzc1LTkyLjgwMDc4MWgtMjY3LjQwNjI1Yy0xNy42NzE4NzUgMC0zMi0xNC4zMjgxMjUtMzItMzJ2LTM1MmMwLTE3LjY3MTg3NSAxNC4zMjgxMjUtMzIgMzItMzJoNDQ4YzE3LjY3MTg3NSAwIDMyIDE0LjMyODEyNSAzMiAzMnYzNTJjMCAxNy42NzE4NzUtMTQuMzI4MTI1IDMyLTMyIDMyaC0zMnptMCAwIiBmaWxsPSIjZmY3NzYxIi8+PGcgZmlsbD0iI2ZmZiI+PHBhdGggZD0ibTI3MiAyNTZoLTMydi0xNDRjMC04LjgzNTkzOCA3LjE2NDA2Mi0xNiAxNi0xNnMxNiA3LjE2NDA2MiAxNiAxNnptMCAwIi8+PHBhdGggZD0ibTI0MCAyODhoMzJ2MzJoLTMyem0wIDAiLz48L2c+PC9zdmc+";
		failImg.id = 'failImg';
		failMsg.id = 'failMsg';
		failMsg.innerText = "죄송하지만 해당 키워드로 매칭할 수 없어요. 좀 더 넓은 영역으로 선택해보시겠어요?";
		table.append(failImg);
		table.append(failMsg);
	}
}