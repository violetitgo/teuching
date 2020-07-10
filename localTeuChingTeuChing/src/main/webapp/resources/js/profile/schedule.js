
     var currentTitle = document.getElementById('current-year-month');
     /* 현재 년도와 월 */
      var calendarBody = document.getElementById('calendar-body');
      var mainTodayDay = document.getElementById('main-day');
      var mainTodayDate = document.getElementById('main-date');
     
      
      /* Date객체를 사용하여 오늘의 날짜, 연도, 요일등의 정보를 담기. */
      var today = new Date();
      var first = new Date(today.getFullYear(), today.getMonth(),1);
      var dayList = ['Sun','Mon','Tue','Wed','Thu','Fri','Sat'];
      var monthList = ['1','2','3','4','5','6','7','8','9','10','11','12'];
      var leapYear=[31,29,31,30,31,30,31,31,30,31,30,31];
      var notLeapYear=[31,28,31,30,31,30,31,31,30,31,30,31];
      var pageFirst = first;
      var pageYear;
      var date = today.getDate();
      var month = today.getMonth()+1;
      var year = today.getFullYear();
      var nextyear = today.getFullYear()+1;
      
      if(first.getFullYear() % 4 === 0){
         /* 윤년을 체크하기 위한 IF문. 윤년일 경우  leapYear 배열을 pageYear에 담고 */
          pageYear = leapYear;
      }else{
         /* 아닐 경우 notLeapYear배열을 pageYear에 담는다.  */
          pageYear = notLeapYear;
      }
      
      /* 이렇게 되면 leapYear, notLeapYear 배열에는 각각 1월부터 12월까지의 총 일수가 들어가있게 됨. */

      function showCalendar(){
         
          let monthCnt = 100;
          let cnt = 1;
          
          for(var i = 0; i < 6; i++){
             /* 주(week)를 만들기 (최대 6주니까!)*/
              var $tr = document.createElement('tr');
             /* 그 6주에 해당하는 tr요소 생성하기. */
              $tr.setAttribute('id', monthCnt);   
             /* tr(주)의 id에 '월' 로 속성주기 */
              
              for(var j = 0; j < 7; j++){
                 /* 일(date)를 만들기 (일주일은 최대 7일이니까) */
                  if((i === 0 && j < first.getDay()) || cnt > pageYear[first.getMonth()]){
                     /* 만약 첫번째 주라면 시작하는 요일부터 출력을 해야해. 
                     || 달력 출력 종료 조건. 월마다 총 일수가 다르니까 pageYear에 담아논 총 월마다의 일수와 비교하여 날짜를 출력. */
                      var $td = document.createElement('td');
                     /* td로 생성된 요소를 $td로 담아  */
                      $tr.appendChild($td);
                     /* 아까 주에서 추가할때 썼던 $tr에 appendChild 해주기. */
                     $td.setAttribute('class','text-center');
                     $td.style.wordBreak="break-all";
                  }else{
                     /* 만약 첫번째 주가 아니라면(2,3,4,5,6...) */
                      var $td = document.createElement('td');
                      $td.innerHTML = "<p>"+cnt + "</p>";
                      /* td 변수에 날짜를 text로 넣기!! */
                      $td.setAttribute('id', cnt);     
                      /* $td(일)의 id값을 cnt로 주기 */
                      $tr.appendChild($td);
                      /* tr(주) 밑에 td(일) appendChild하기 */
                      
                      $td.setAttribute('class','text-center');
                     $td.style.wordBreak="break-all";
                     
                     
                     var $at = document.createElement('a');
                     var $pt = document.createElement('a');
                     console.log(nextyear);
                     
                     
                     
                     /* 예약하기 버튼 생성 */
                     $td.appendChild($at);
                     $at.innerHTML = "예약하기";
                     $at.setAttribute('href','#a');
                     $at.setAttribute('class','reply');
                     
                        
                        
                     
                     /*  */
                     $at.setAttribute('id', "day");
                     $at.setAttribute('data-date', cnt);
                     $at.onclick = click;
                     $pt.onclick = noclick;
                     /*  */
                      cnt++;
                      
                  }
              }
              monthCnt++;
              /* 월이 for문 도는동안 계속 증가하게. */
              
              calendarBody.appendChild($tr);
              /* calendarBody 태그 밑에 tr(주) appendChild 하기 */
              currentTitle.innerHTML = first.getFullYear() + '&nbsp;&nbsp;&nbsp;&nbsp;'+ monthList[first.getMonth()];
          }
      }
      showCalendar();
      
      var clickedDate1 = document.getElementById(today.getDate());
      clickedDate1.classList.add('active');
      var prevBtn = document.getElementById('prev');
      var nextBtn = document.getElementById('next');
      prevBtn.addEventListener('click',prev);
      nextBtn.addEventListener('click',next);
      var tdGroup = [];
      

      function removeCalendar(){
         /* 추후 달력 업데이를 위해 미리 만들어놓는  부분  */
          let catchTr = 100;
          for(var i = 100; i< 106; i++){
              var $tr = document.getElementById(catchTr);
              $tr.remove();
              catchTr++;
          }
      }

      
      
      function clickStart(){
          for(let i = 1; i <= pageYear[first.getMonth()]; i++){
              tdGroup[i] = document.getElementById(i);
              tdGroup[i].addEventListener('click',changeToday);
          }
      }
      function changeToday(e){
          for(let i = 1; i <= pageYear[first.getMonth()]; i++){
              if(tdGroup[i].classList.contains('active')){
                  tdGroup[i].classList.remove('active');
              }
          }
          clickedDate1 = e.currentTarget;
          clickedDate1.classList.add('active');
          today = new Date(today.getFullYear(), today.getMonth(), clickedDate1.id);
          keyValue = today.getFullYear() + '' + today.getMonth()+ '' + today.getDate();
         
      }
      
      function prev(){
         /* 이전 달로 이동하는 함수 */
      
             /* pageFirst(월 첫번째 날에 대한 정보가 담겨있는 변수) 와 
            pageYear(월 마다의 총 일수)를 업데이트 할거야.
            (넘기기 전의 데이터들을 삭제하는 과정)*/
          
            
          if(pageFirst.getMonth() === 1){
             /* 만약 1월이라면 연도를 변경해야 함 */
             
              pageFirst = new Date(first.getFullYear()-1, 12, 1);
             /* 월 첫번째 날을 작년도의 12월 1일정보로 가져오기 */
              first = pageFirst;
             /* first에 전년도 12월 1일을 담아서  */
             
              if(first.getFullYear() % 4 === 0){
                 /* 윤달이면 leapYear */
                  pageYear = leapYear;
              }else{
                 /* 윤달이 아니면 notLeapYear */
                  pageYear = notLeapYear;
              }
          }else{
             /* 12월이여도 연도를 변경해야돼. */
             
              pageFirst = new Date(first.getFullYear(), first.getMonth()-1, 1);
             /* 내년의 1월 1일을 가져오게. */
              first = pageFirst;
              /* first에 내년의 1월 1일을 담아  */
          }
          today = new Date(today.getFullYear(), today.getMonth()-1, today.getDate());
          /* today에 해당하는 Date를 담아서 */
          currentTitle.innerHTML = first.getFullYear() + '&nbsp;&nbsp;&nbsp;&nbsp;'+ monthList[first.getMonth()];
          
          removeCalendar();
          showCalendar();
          /* 다시 showCalendar함수를 호출해서 달력 불러 */
          clickedDate1 = document.getElementById(today.getDate());
          clickedDate1.classList.add('active');
          clickStart();
      }
      
      

      function next(){
        
          if(pageFirst.getMonth() === 12){
              pageFirst = new Date(first.getFullYear()+1, 1, 1);
              first = pageFirst;
              if(first.getFullYear() % 4 === 0){
                  pageYear = leapYear;
              }else{
                  pageYear = notLeapYear;
              }
          }else{
              pageFirst = new Date(first.getFullYear(), first.getMonth()+1, 1);
              first = pageFirst;
          }
          today = new Date(today.getFullYear(), today.getMonth() + 1, today.getDate());
          currentTitle.innerHTML = first.getFullYear() + '&nbsp;&nbsp;&nbsp;&nbsp;'+ monthList[first.getMonth()];
          removeCalendar();
          showCalendar(); 
          clickedDate1 = document.getElementById(today.getDate());
          clickedDate1.classList.add('active');  
          clickStart();
      }
      
      
     
     /* 트레이너 상담신청시 띄울 팝업용 */
     function openPopUp() {
         const form = document.querySelector('#form');
         window.open("", 'pop',
                     'width=450,height=400,left=420,top=150,toolbars=no,scrollbars=no');
         form.submit();
      }
     
      
         function click(e){
            let month_year = $('#current-year-month').text();
          let click_year = month_year.substring(0,4);
         let click_month = month_year.substring(8);
         let click_date = e.target.dataset.date;
            
         $('#year').val(click_year);
         $('#month').val(click_month);
         $('#date').val(click_date);
         
               /* openPopUp(); */
         
            
            if((year > click_year) || (year == click_year && month > click_month) || 
                  (year == click_year && month == click_month && date > click_date)){
               noclick();
            }else{
               openPopUp();
            }
            
         }
         
         function noclick() {
         alert("이전 날짜에는 예약이 불가합니다.")
      }
     