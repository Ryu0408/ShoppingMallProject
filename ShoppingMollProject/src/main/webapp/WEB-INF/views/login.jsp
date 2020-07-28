<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- Header Include -->
<jsp:include page="header.jsp"/>
<style>
.nav-tabs .nav-link.active{
	color: #495057;
    background-color: #fff;
    border-color: #fff #fff black;
    border-bottom-width: 3px;
    font-weight: bold;
}
.nav-tabs .nav-link{
	color: #495057;
    background-color: #fff;
}
.form-control{
	height: calc(3.5em + 0.75rem + 7px);
	border-left: hidden;
	border-right:hidden;
}
</style>
<div class="container" style = "margin-top: 300px; text-align: center;">
	<h6 class="text-uppercase font-weight-bold" style ="font-size: 30px">LOGIN</h6>
	<br>
	<ul class="nav nav-tabs" style = "width:430px;margin-left: auto;margin-right: auto;">
  		<li class="nav-item" style="width: 215px;">
    		<a class="nav-link active" data-toggle="pill" href="#member">회원 로그인</a>
  		</li>
  		<li class="nav-item" style="width: 215px;">
    		<a class="nav-link" data-toggle="pill" href="#nonMember">비회원 로그인</a>
  		</li>
	</ul>
	<div class="tab-content">
  		<div class="tab-pane container active" id="member">
  			<form action="/action_page.php">
    			<div class="form-group" style = "width:430px;margin-left: auto;margin-right: auto;">
      				<input type="text" class="form-control" placeholder="아이디" name="ID">
      				<input type="text" class="form-control" placeholder="바밀번호" name="Password">
    			</div>
   				<button type="submit" class="btn btn-secondary" style="width:320px; font-size: 15px; background-color: #0a090aad !important;">
   					<b class="font-weight-bold">로그인</b>
   				</button>
  			</form>
  			<a href="#">
   				<button class="btn btn-secondary" style="width:320px; font-size: 15px; background-color: #0a090aad !important;">
  					<b class="font-weight-bold">회원가입</b>
  				</button>
  			</a>
			<br>  				
  			<a href="#">
   				<button class="btn btn-secondary" style="width:150px; font-size: 12px; background-color: #c3b0c3ad !important">
  					<b class="font-weight-bold">아이디찾기</b>
  				</button>
  			</a>
  			<a href="#">
   				<button class="btn btn-secondary" style="width:150px; font-size: 12px; background-color: #c3b0c3ad !important">
  					<b class="font-weight-bold">비밀번호찾기</b>
  				</button>
  			</a>
  	  	</div>
  		<div class="tab-pane container fade" id="nonMember">
  			<form action="/action_page.php">
  			<p style = "margin-top:20px; font-size: 13px; color:gray">
  				비회원의 경우, 주문시의 주문번호로 주문조회가 가능합니다.
  			</p>
    			<div class="form-group" style = "width:430px;margin-left: auto;margin-right: auto;">
      				<input type="text" class="form-control" placeholder="주문자명" name="orderName">
      				<input type="text" class="form-control" placeholder="주문번호" name="orderNumber">
      				<input type="text" class="form-control" placeholder="비회원주문 바밀번호" name="nonMemberOrderPassword">
    			</div>
   				<button type="submit" class="btn btn-secondary" style="width:320px; font-size: 15px; background-color: #0a090aad !important;">
   					<b class="font-weight-bold">주문조회</b>
   				</button>
  			</form>
  		</div>
	</div>
	<hr>
  	<p>
  		<b class="font-weight-bold">아직도 회원이 아니세요?</b>
  	</p>
  	<p>
  		지금 회원이 되어 다양한 이벤트에 참여해보세요.<br>
  		회원만의 특별한 혜택을 가장 먼저 만나보세요.
  	</p>
  	<img src="${pageContext.request.contextPath}/img/login/event1.jpg">
  	<img src="${pageContext.request.contextPath}/img/login/event2.jpg">
  	<img src="${pageContext.request.contextPath}/img/login/event3.jpg">
  	<img src="${pageContext.request.contextPath}/img/login/event4.jpg">
</div>
<!-- Footer Include -->
<jsp:include page = "footer.jsp"/>
</body>
</html>
