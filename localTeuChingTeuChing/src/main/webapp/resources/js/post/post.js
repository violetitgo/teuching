var final = true;
var uploadResult = true;
var keywordResult = true;
var contentResult = true;
var imageResult = true;
var existResult = false;

var exist = document.querySelectorAll('.pre_img');
if(exist != null) {
	existResult = true;
}

function changeImg() {
	document.querySelector('.addImageIcon').src = 'http://52.78.116.59:8080/teuching/resources/img/addImage.png';
	document.querySelector('.addImageText').style.color = "#ffb5b5";
}

function resetImg() {
	document.querySelector('.addImageIcon').src = 'http://52.78.116.59:8080/teuching/resources/img/addImage2.png';
	document.querySelector('.addImageText').style.color = "#444444";
}

function preview(target) {
	var files = target.files;
	var fileArr = Array.prototype.slice.call(files);
	
	var preview = document.querySelector('.pre_div');
	preview.innerHTML = "";
	
	if(files.length > 5 ) {
		alert("최대 5장까지만 업로드 가능합니다.");
		uploadResult = false;
	} else {
		fileArr.forEach(function(f) {
			if(!f.type.match("image/.*")) {
				alert("이미지만 업로드 가능합니다.");
				uploadResult = false;
				return;
			} else {
				var reader = new FileReader();
				reader.onload = function(e) {
					var img = document.createElement('img');
					img.src = e.target.result;
					img.dataFile = f.name;
					img.className = 'pre_img';
					preview.append(img);
				}
				reader.readAsDataURL(f);
				
				uploadResult = true;
			}
		})
	}
}

document.querySelectorAll(".keywordBtn").forEach(function(el) {
	el.addEventListener('click', function(v) {
		if(el.checked == true) {
			el.checked = false;
			v.target.style.background = "white";
			v.target.style.color = "#ff9090";
			
			reset(el.name, null);
		} else {
			el.checked = true;
			v.target.style.background = "#ff9090";
			v.target.style.color = "white";

			reset(el.name, el.value);
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
	
	document.getElementById(name).value = value;
}

function submit_result() {
	var imgs = document.querySelector('#addImageHidden');
	var price = document.getElementById('price');
	var purpose = document.getElementById('purpose');
	var classSize = document.getElementById('classSize');
	var place = document.getElementById('place');
	var title = document.querySelector('.titleInput');
	var content = document.querySelector('.contentInput');
	
	if(!uploadResult) {
		alert("파일 갯수 혹은 확장자를 확인해주세요.");
	}
	
	if(!existResult) {
		if(imgs.files.length < 1) {
			alert("사진은 1장 이상 첨부해야합니다.");
			imageResult = false;
		} else {
			imageResult = true;
		}
	}
	
	if(price.value == "" || purpose.value == "" || classSize.value == "" || place.value == "") {
		alert("금액과 키워드는 필수 선택사항입니다. 한 가지씩 선택해주세요.");
		keywordResult = false;
	} else {
		keywordResult = true;
	}
	
	if(title.value == "" || content.value == "") {
		alert("제목과 내용은 필수로 작성하셔야 합니다.");
		contentResult = false;
	} else if(content.value.length >= 3000 ){
		alert("내용은 3,000자 이하로 작성하셔야 합니다. 현재 글자 수 : " + content.value.length);
		contentResult = false;
	} else {
		contentResult = true;
	}
	
	if(uploadResult == true && imageResult == true && keywordResult == true && contentResult == true) {
		content = content.value;
		content = content.replace(/(?:\r\n|\r|\n)/g, '<br>');
		document.querySelector('.contentInput').value = content;
		alert("게시글이 정상적으로 작성되었습니다.");
		final = true;
	} else {
		final = false;
	}
	
	return final;
}