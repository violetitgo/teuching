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
      
      
      
      
           //변수를 선언합니다.
         var trKeyword = $('#trKeyword').val();
          var span = document.getElementById('span');
         var test = trKeyword.split(",");
   
         for(var i = 0; i < test.length; i++){
            
            console.log(test[i]);
            span.innerHTML += '<li><a>' + test[i] + '</a></li>'; 
         };
      
   