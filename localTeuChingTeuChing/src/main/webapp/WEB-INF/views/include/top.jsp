<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	
	<style type="text/css">

.toggle_radio{
  background: #ffb5b5;
  margin: 4px auto;
  overflow: hidden;
  padding: 0 !important;
  -webkit-border-radius: 50px;
  -moz-border-radius: 50px;
  border-radius: 50px;
  position: relative;
  height: 26px;
  width: 215px;
  padding-left: 10%;
}
.toggle_radio > * {
  float: left;
}
.toggle_radio input[type=radio]{
  display: none;
  /*position: fixed;*/
}
.toggle_radio label{
  font: 90%/1.618 "Source Sans Pro";
  color: rgba(255,255,255,.9);
  z-index: 0;
  display: block;
  width: 100px;
  height: 20px;
  margin: 3px 3px;
  -webkit-border-radius: 50px;
  -moz-border-radius: 50px;
  border-radius: 50px;
  cursor: pointer;
  z-index: 1;
  /*background: rgba(0,0,0,.1);*/
  text-align: center;
  /*margin: 0 2px;*/
  /*background: blue;*/ /*make it blue*/
}
.toggle_option_slider{
  /*display: none;*/
  /*background: red;*/
  width: 100px;
  height: 20px;
  position: absolute;
  top: 3px;
  -webkit-border-radius: 50px;
  -moz-border-radius: 50px;
  border-radius: 50px;
  -webkit-transition: all .4s ease;
  -moz-transition: all .4s ease;
  -o-transition: all .4s ease;
  -ms-transition: all .4s ease;
  transition: all .4s ease;
}

#first_toggle:checked ~ .toggle_option_slider{
  background: rgba(255,255,255,.3);
  left: 3px;
}
#second_toggle:checked ~ .toggle_option_slider{
  background: rgba(255,255,255,.3);
  left: 109px;
}

#title{
	padding-left: 32%;
	 color: #695f5f;
}
#Jointitle{
	padding-left: 19%;
	font-size:1.2vw;
	 color: #695f5f;
}

#atag{

	color:white;
}
#headerTitle{
	padding-left: 0%;
	font-size:1.2vw;
	 color: #695f5f;
	
}

.navbar-brand{
	 font-size: 40px !important;
}
</style>
<header
	class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light"
	id="ftco-navbar">
	<div class="container">
		<div class="row m-auto">
			<div class="col-12 w-100 text-center">
				<a class="navbar-brand w-100" href="http://52.78.116.59:8080/teuching/index/index.do">TeuChing</a>
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#ftco-nav" aria-controls="ftco-nav"
					aria-expanded="false" aria-label="Toggle navigation">
					<span class="oi oi-menu"></span> Menu
				</button>
			</div>
			<div class="col-12 w-100 text-center">
				<div class="collapse navbar-collapse" id="ftco-nav">
				
					<ul class="navbar-nav m-auto">
						<li class="nav-item active">
							<a href="http://52.78.116.59:8080/teuching/index/aboutus.do" class="nav-link">AboutUs</a>
						</li>
						<li class="nav-item active">
							<a href="http://52.78.116.59:8080/teuching/matching/main.do" class="nav-link">Matching</a>
						</li>
						<li class="nav-item active">
							<a href="http://52.78.116.59:8080/teuching/notice/notice.do?start=0&end=5" class="nav-link">Notice</a>
						</li>
					</ul>
				</div>
			</div>
		</div>

		<div class="topWrapper" id="topWrapper"
			style="position: absolute; top: 1vw; right: 1vw;">
			<c:if test="${loginInfo == null}">
			<!-- 로그인  -->
				<div class="topLogin">
					<a id="btnModal" href="#">Login &nbsp;</a> <span
						style="color: #ffb5b5;">|</span> <a id="btnJModal"
						href="#"> &nbsp; Join</a>
				</div>
			</c:if>
			<c:if test="${loginInfo != null}">
				<div class="topLogOut">
				<c:if test="${memberType eq 'member'}">
					<a style="color:black" href="http://52.78.116.59:8080/teuching/message/msgboxrecv.do">✉</a>
					<a onclick="location= 'detail.cs?id=${loginInfo.nickname}">${loginInfo.nickname}	님  환영합니다. &nbsp;</a>
					<span style="color: #ffb5b5;">|</span>
					<a href ="<%=request.getContextPath()%>/member/mypagem.do">&nbsp;  MyPage&nbsp;</a>
					</c:if>
				<c:if test="${memberType eq 'trainer'}">
					<a style="color:black" href="http://52.78.116.59:8080/teuching/profile/reviewforTR.do?trainerEmail=${loginInfo.tr_email}">🇲🇵</a>
					<a style="color:black" href="http://52.78.116.59:8080/teuching/message/msgboxrecv.do">✉</a>
					<a onclick="location= 'detail.cs?id=${loginInfo.trainerName}">${loginInfo.trainerName}	트레이너님  환영합니다. &nbsp;</a>
					</c:if>	
				<c:if test="${memberType eq 'manager'}">
								<a href="http://52.78.116.59:8080/teuching/manager/report.do">Manager &nbsp;</a>
							</c:if>	
						<!-- <a>MyPage</a>  -->
						<span style="color: #ffb5b5;">|</span>
						<a href="http://52.78.116.59:8080/teuching/member/logout.do">&nbsp; LogOut</a>
				</div>
			</c:if>



		</div>
	</div>

	
	
	



</header>

<!-- 로그인모달  -->
<div class="modal fade" id="loginModal" tabindex="-1" role="dialog" >
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <!-- 닫기버튼 -->
      </div>
      
      <div class="modal-body">
        <div class="container">
          <form class="form-signin" action="http://52.78.116.59:8080/teuching/member/loginimple.do">
            <h2 id="title">Please sign in</h2>
            
            <div class="form-group row">
									<div class="col-md-6 offset-md-4">
										<div class="wrapper">
											<div class="toggle_radio">
												<input type="radio" class="toggle_option" id="first_toggle"	name="account" value="member"checked> 
													<input type="radio" class="toggle_option" id="second_toggle" name="account" value="trainer"> 
													 <label for="first_toggle"><p>Member</p></label> 
													<label for="second_toggle"><p>Trainer</p></label>
												<div class="toggle_option_slider"></div>
											</div>
										</div>
									</div>
									<br>
								</div>
            
            <label for="userEmail" class="sr-only">Email address</label>
            <input type="text" id="email" name="email" class="form-control" placeholder="Email address" required autofocus>
            <label for="userPwd" class="sr-only">Password</label>
            <input type="password" name="password" id="password" class="form-control" placeholder="Password" required>
            <div class="warning"></div>
            <button class="btn btn-lg btn-primary btn-block" id="btnLogin" type="submit">로그인</button>
          </form>
        </div>
      </div>
      
      
      
      <div class="modal-footer">
        <a type="button" class="btn btn-default" data-dismiss="modal">닫기</a>
        <a type="button" href="http://52.78.116.59:8080/teuching/member/findpwform.do" class="btn btn-primary"> 비밀번호 찾기 </a>
      </div>
    </div>
  </div>
</div>

<!-- 가입모달 -->
<div class="modal fade" id="joinModal" tabindex="-1" role="dialog" >
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
      	<h3 id="headerTitle">Welcome Teu-Ching!</h3>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <!-- 닫기버튼 -->
      </div>
      
      <div class="modal-body">
        <div class="container">
            <p id="Jointitle">만나서 반갑습니다! <br>가입하실 유형을 선택해주세요.</p>
            
            <div class="form-group row">
				<div class="col-md-6 offset-md-4">
					<div class="wrapper">
						<div class="toggle_radio">
							<label for="first_toggle"><a id="atag" href="http://52.78.116.59:8080/teuching/member/mjoin.do?data=member">Member</a></label> 
							<label for="second_toggle"><a id="atag" href="http://52.78.116.59:8080/teuching/member/mjoin.do?data=trainer"> Trainer</a></label>
						</div>
					</div>
				</div>
			</div>
      </div>
      </div>
      <div class="modal-footer">
        <a type="button" class="btn btn-default" data-dismiss="modal">닫기</a>
      </div>
    
  </div>
</div>

</div>
	<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
 <script src="http://52.78.116.59:8080/teuching/resources/js/account/login.js"></script>



