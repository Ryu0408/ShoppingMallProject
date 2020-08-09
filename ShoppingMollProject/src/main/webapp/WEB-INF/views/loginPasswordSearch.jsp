<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath">${pageContext.request.contextPath }</c:set>
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
<div class="container overlap" style = "text-align: center;">
	<h6 class="text-uppercase font-weight-bold" 
	style ="font-size: 30px; margin-top: 30px;">비밀번호 찾기</h6>
	<br>
	<ul class="nav nav-tabs" style = "width:430px;margin-left: auto;margin-right: auto;">
  		<li class="nav-item" style="width: 215px;">
    		<a class="nav-link active" data-toggle="pill" href="#emailSearch">이메일로 찾기</a>
  		</li>
  		<li class="nav-item" style="width: 215px;">
    		<a class="nav-link" data-toggle="pill" href="#phoneNumberSearch">휴대폰번호로 찾기</a>
  		</li>
	</ul>
	<div class="tab-content">
  		<div class="tab-pane container active" id="emailSearch">
  			<form action="${cpath }/login/passwordSearch/" method="POST">
    			<div class="form-group" style = "width:430px;margin-left: auto;margin-right: auto;">
    			     <input type="text" class="form-control" placeholder="아이디" name="id">
      				<input type="text" class="form-control" placeholder="이름" name="name">
      				<input type="text" class="form-control" placeholder="이메일" name="email">
    			</div>
   				<button type="submit" class="btn btn-secondary" style="width:320px; font-size: 15px; background-color: #0a090aad !important;">
   					<b class="font-weight-bold">확인</b>
   				</button>
  			</form>
  	  	</div>
  		<div class="tab-pane container fade" id="phoneNumberSearch">
  			<form action="${cpath }/login/passwordSearch/" method="POST">
    			<div class="form-group" style = "width:430px;margin-left: auto;margin-right: auto;">
    			    <input type="text" class="form-control" placeholder="아이디" name="id">
      				<input type="text" class="form-control" placeholder="이름" name="name">
      			</div>
      			<div class = "form-control" style = "width:430px;margin-left: auto;margin-right: auto;
      			padding-top: 20px;">	
      				<select class="form-control-sm" id = "phone1" name = "phone1" 
        				style = "width:70px;">
        					<option value="010">010</option>
        					<option value="010">011</option>
        					<option value="010">016</option>
        					<option value="010">017</option>
        					<option value="010">018</option>
        					<option value="010">019</option>
        			</select>
        			<b>&nbsp;-&nbsp;</b>
        			<input type="number" class="form-control-sm" id = "phone2" name = "phone2" 
        			style = "width:70px;">
        			<b>&nbsp;-&nbsp;</b>
        			<input type="number" class="form-control-sm" id = "phone3" name = "phone3" 
        			style = "width:70px;"> 
    			</div>
    			<br>
   				<button type="submit" class="btn btn-secondary" style="width:320px; font-size: 15px; background-color: #0a090aad !important;">
   					<b class="font-weight-bold">확인</b>
   				</button>
   			</form>
  		</div>
	</div>
	<hr>
</div>
<!-- Footer Include -->
<jsp:include page = "footer.jsp"/>
</body>
</html>
