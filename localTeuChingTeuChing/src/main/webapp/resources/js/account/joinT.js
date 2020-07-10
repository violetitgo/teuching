var idx_email = false;
var check_email = false;
var check_cell = false;
var check_pw = false;

		$('#signUp').click(function(){
			if($.trim($('#email').val()) == ''){
				alert("이메일을 입력해주세요.");
				$('#email').focus();
				setTimeout(function(){ $('#email').focus(); }, 10)
				return;
			}else if($.trim($('#name').val()) == ''){
				alert("성함을 입력해주세요.");
				setTimeout(function(){ $('#name').focus(); }, 10)
				return;
			}else if($.trim($('#password_1').val()) == ''){
				alert("비밀번호를 입력해주세요.");
				setTimeout(function(){ $('#password_1').focus(); }, 10)
				return;
			}
			// 패스워드 확인
			else if($('#password_1').val() != $('#password_2').val()){
				alert('비밀번호가 일치하지 않습니다. 비밀번호를 재확인해주세요.');
				setTimeout(function(){ $('#password_2').focus(); }, 10)
				return;
			}
			else if($.trim($('#cell').val()) == ''){
				alert("연락처를 입력해주세요.");
				setTimeout(function(){ $('#cell').focus(); }, 10)
				return;
			}
			else if($.trim($('#sample6_address').val()) == ''){
				alert("주소를 입력해주세요.");
				setTimeout(function(){ $('#sample6_address').focus(); }, 10)
				return;
			}else if($.trim($('#keyword1').val()) == ''){
				alert("최소 한 가지 이상의 트레이닝 가능 종목을 작성해 주세요.");
				setTimeout(function(){ $('#keyword1').focus(); }, 10)
				return;
			}
			
			if(check_email==false){
				alert("잘못된 형식의 이메일 주소입니다.");
				return;
			}else if(idx_email==false){
				alert("이메일 중복체크를 해주세요.");
				return;
			}else{
				alert("작성하신 이메일로 인증메일이 전송되었습니다.                              메일 인증 시 회원가입이 완료됩니다.");
				$('#signFrm').submit();
			} 
			
		});
		
		$('#check_email').click(function(){
			console.log("시작");
			$.ajax({
				url: "http://52.78.116.59:8080/teuching/member/emailchk.do",
				type: "POST",
				data:{"email":$('#email').val()},
				success: function(data){
					if(data == 0 && $.trim($('#email').val()) != '' ){
						idx_email=true;
						var html="<tr><td colspan='3' style='color: green'>사용가능</td></tr>";
						$('#emailChk').empty();
						$('#emailChk').append(html);
					}else{
						var html="<tr><td colspan='3' style='color: red'>이미 사용중인 이메일 입니다.</td></tr>";
						$('#emailChk').empty();
						$('#emailChk').append(html);
					}
				},
				error: function(){
					alert("서버에러");
				}
			});
		});
		
		// 이메일 유효성 체크
		// 정규표현식 정의
		function email_check(email) {    
		    var regex=/([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
		    return (email != '' && email != 'undefined' && regex.test(email)); 
		}
	    // name 속성이 'email'인 input 이 focus를 잃었을때 처리한다.
	    $("input[name='email']").blur(function(){

	        var email = $(this).val();

	        // 값을 입력안한경우는 아예 체크를 하지 않는다.
	        if( email == '' || email == 'undefined') return;

	        // 이메일 유효성 검사
	        if(! email_check(email) ) {
	            alert('잘못된 형식의 이메일 주소입니다.');
	            setTimeout(function(){ $('#email').focus(); }, 10)
	            return false;
	        }else{
	        	check_email = true;
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

// 비밀번호 체크
$('.pw').focusout(function () {
        var pwd1 = $("#password_1").val();
        var pwd2 = $("#password_2").val();
 
        if ( pwd1 != '' && pwd2 == '' ) {
            null;
        } else if (pwd1 != "" || pwd2 != "") {
            if (pwd1 == pwd2) {
                $("#alert-success").css('display', 'inline-block');
                $("#alert-danger").css('display', 'none');
            } else {
                $("#alert-success").css('display', 'none');
                $("#alert-danger").css('display', 'inline-block');
            }
        }
});

	




// 프로필 사진 등록하기

function setThumbnail(event) { 
	
	var reader = new FileReader(); 
	
	reader.onload = function(event) { 
		
		var div = $('#imagePreview');
		
		var img = document.getElementById("img");
		img.setAttribute("src", event.target.result); 
		
		var divAspect = div.offsetHeight / div.offsetWidth; // div의 가로세로비는 알고 있는
															// 값이다
		var imgAspect = img.height / img.width;
		
		if (imgAspect <= divAspect) {
		    // 이미지가 div보다 납작한 경우 세로를 div에 맞추고 가로는 잘라낸다
		    var imgWidthActual = div.offsetHeight / imgAspect;
		    var imgWidthToBe = div.offsetHeight / divAspect;
		    var marginLeft = -Math.round((imgWidthActual - imgWidthToBe) / 2);
		    img.style.cssText = 'width: auto; height: 100%; margin-left: '
		                      + marginLeft + 'px;'
		} else {
		    // 이미지가 div보다 길쭉한 경우 가로를 div에 맞추고 세로를 잘라낸다
		    img.style.cssText = 'width: 100%; height: auto; margin-left: 0; ';
		}
		
	}; 
	
	reader.readAsDataURL(event.target.files[0]); 

}
	
// 커리어 글자 제한두기
$('#career').keyup(function (e){
    var content = $(this).val();
    $('#counter').html("("+content.length+" / 최대 500자)");    // 글자수 실시간 카운팅

    if (content.length > 500){
        alert("최대 500자까지 입력 가능합니다.");
        $(this).val(content.substring(0, 500));
        $('#counter').html("(500 / 최대 500자)");
    }
});



// 선호지역 등록
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
  var area = "area"+$("option",$(this)).index($("option:selected",$(this))); // 선택지역의
																				// 구군
																				// Array
  var $gugun = $(this).next(); // 선택영역 군구 객체
  $("option",$gugun).remove(); // 구군 초기화

  if(area == "area0")
   $gugun.append("<option value=''>구/군 선택</option>");
  else {
   $.each(eval(area), function() {
    $gugun.append("<option value='"+this+"'>"+this+"</option>");
   });
  }
 });


});



// 카카오지도
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
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