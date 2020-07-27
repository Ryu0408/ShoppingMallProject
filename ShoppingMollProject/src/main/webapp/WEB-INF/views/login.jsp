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
</style>
<div class="container" style = "margin-top: 300px; text-align: center;">
	<h6 class="text-uppercase font-weight-bold" style ="font-size: 30px">LOGIN</h6>
	<br>
	<ul class="nav nav-tabs" style = "width:430px;margin-left: auto;margin-right: auto;">
  		<li class="nav-item" style="width: 215px;">
    		<a class="nav-link active" data-toggle="pill" href="#home">회원 로그인</a>
  		</li>
  		<li class="nav-item" style="width: 215px;">
    		<a class="nav-link" data-toggle="pill" href="#menu1">비회원 로그인</a>
  		</li>

	</ul>
	<div class="tab-content">
  		<div class="tab-pane container active" id="home">
  			<h3>HOME</h3>
      		<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
  		</div>
  		<div class="tab-pane container fade" id="menu1">
  			<h3>HOME</h3>
      		<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
  		</div>
	</div>
</div>
<!-- Footer Include -->
<jsp:include page = "footer.jsp"/>
</body>
</html>
