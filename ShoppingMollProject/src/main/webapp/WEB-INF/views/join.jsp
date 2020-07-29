<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath">${pageContext.request.contextPath }</c:set>
<!-- Header Include -->
<jsp:include page="header.jsp"/>
<style>

.circle{
	width:10px;
	height:10px;
	border-radius:50%;
	background: red;
	display:inline
}
.agreeForm{
	border: 1px solid #80808024; 
	background: #fafafa;
	padding: 20px;
}
</style>

<script>
function checkID(){
	const id = $("#id").val();
	if(id === ''){
		$("#idmsg").text('아이디를 입력하세요');
		$("#idmsg").css('color', 'red');
		return;
	}
	else{
		$("#idmsg").text('');
	}
	// Jquery를 이용한 ajax
	$.ajax({
		url:"${cpath}/join/checkid/",
		method:"GET",
		data:{id: id},
		dataType:"text",
		success : function(data) {
			$("#idmsg").text(data);
			if (data === '사용 가능한 계정입니다') {
				var filter = /^[a-z]+[a-z0-9]{5,19}$/g; // 영문자로 시작하는 6~20자 영문자 또는 숫자
				var checkid = $("#id").val();
				if(!checkid.match(filter)){
					$("#idmsg").text('아이디 형식에 맞지 않습니다');
					$("#idmsg").css('color', 'red');	
					$("#id").val('');
				}else{
					$("#idmsg").css('color', 'blue');	
				}
			} else {
				$("#idmsg").css('color', 'red');
				$("#id").val('');
			}
		},
		error:function(data){
			$("#idmsg").text('서버 통신 실패');
		}
	})
}
function checkPassword(){
	const password = $("#password").val();
	const password2 = $("#password2").val();
	if(password === password2){
		var filter = /^(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{6,20}$/; // '6~20 영문 대소문자 및 최소 1개 숫자 혹은 특수문자 포함
		if(!password.match(filter)){
			$("#passwordmsg").text('6~20 영문 대소문자 및 최소 1개 숫자 혹은 특수문자 포함');
			$("#passwordmsg").css('color', 'red');
			$("#password").val('');
			$("#password2").val('');
		}else{
			$("#passwordmsg").text('비밀번호가 일치합니다(사용가능)');
			$("#passwordmsg").css('color', 'blue');	
		}
	}else{
		$("#passwordmsg").text('비밀번호가 일치하지않습니다 다시한번 확인해주세요');
		$("#passwordmsg").css('color', 'red');
		$("#password").val('');
		$("#password2").val('');
	}
}
function checkEmail(){
	const email = $("#email").val();
	if (email === '') {
		$("#emailmsg").text('이메일를 입력하세요');
		$("#emailmsg").css('color', 'red');
		return;
	} else {
		$("#emailmsg").text('');
	}
	$.ajax({
		url:"${cpath}/join/checkemail/",
		method : "GET",
		data : {
			email : email
		},
		dataType : "text",
		success : function(data) {
			$("#emailmsg").text(data);
			if (data === '사용 가능한 EMAIL입니다') {
				var filter = /[0-9a-zA-Z][_0-9a-zA-Z-]*@[_0-9a-zA-Z-]+(\.[_0-9a-zA-Z-]+){1,2}$/;
				var checkEmail = $("#email").val();
				if(!checkEmail.match(filter)){
					$("#emailmsg").text('이메일 형식에 맞지 않습니다');
					$("#emailmsg").css('color', 'red');	
					$("#email").val('');
				}else{
					$("#emailmsg").css('color', 'blue');	
				}
			} else {
				$("#emailmsg").css('color', 'red');
				$("#email").val('');
			}
		},
		error : function(data) {
			$("#emailmsg").text('서버 통신 실패');
		}
	})
}
function checkAll(){
	const checkAll = $("#allCheck").is(":checked");
	if(checkAll == true){
		$("#agreeServiceCheck").prop("checked", true);
		$("#agreePrivacyCheck").prop("checked", true);
		$("#agreeSmsCheck").prop("checked", true);
		$("#agreeEmailCheck").prop("checked", true);
	}
	else if(checkAll == false){
		$("#agreeServiceCheck").prop("checked", false);
		$("#agreePrivacyCheck").prop("checked", false);
		$("#agreeSmsCheck").prop("checked", false);
		$("#agreeEmailCheck").prop("checked", false);
	}
}
function checkMenu(){
	if($("#id").val() === ""){
		alert('아이디를 입력해주세요');
	}
	else if($("#password").val() === ""){
		alert('비밀번호 입력해주세요');
	}
	else if($("#password2").val() === ""){
		alert('비밀번호 입력해주세요');
	}
	else if($("#name").val() === ""){
		alert('이름을 입력해주세요');
	}
	else if($("#email").val() === ""){
		alert('이메일을 입력해주세요')
	}
	else if($("#agreeServiceCheck").is(":checked") == false){
		alert('이용약관에 동의해주세요')
	}
	else if($("#agreePrivacyCheck").is(":checked") == false){
		alert('개인정보 수집 및 이용에 동의해주세요')
	}
	else{
		$("#frm").submit();
	}
}
</script>
<div class="container overlap">
	<form id = "frm">
		<h6 class="text-uppercase font-weight-bold">회원 가입</h6>
		<br>
		<table class="table">
    		<tbody>
      			<tr>
        			<td style = "width:160px; font-size: 13px">아이디<b class="text-danger">(필수)</b></td>
        			<td>
        				<input type="text" class="form-control form-control-sm" id = "id" name = "id"
        					   style = "width:155px; float: left;" onblur="checkID()">
        				<span id = "idmsg" style="float:left; padding: 4px;font-size: 12px"></span>
        				<div style = " float: left; padding: 4px;font-size: 12px">(영문소문자/숫자,6~20자)</div>
        			</td>
      			</tr>
      			<tr>
        			<td style = "width:160px; font-size: 13px">비밀번호<b class="text-danger">(필수)</b></td>
        			<td>
        				<input type="password" class="form-control form-control-sm" id = "password" name = "password"
        					   style = "width:155px; float: left;">
        				<div style = " float: left; padding: 4px;font-size: 12px">(6~20 영문 대소문자 및 최소 1개 숫자 혹은 특수문자 포함)</div>
        			</td>
      			</tr>
      			<tr>
        			<td style = "width:160px; font-size: 13px">비밀번호 확인<b class="text-danger">(필수)</b></td>
        			<td>
        				<input type="password" class="form-control form-control-sm" id = "password2" name = "password2"
        					   style = "width:155px; float: left;" onblur="checkPassword()">
        				<span id = "passwordmsg" style="float:left; padding: 4px;font-size: 12px"></span>
        			</td>
      			</tr>
      			<tr>
        			<td style = "width:160px; font-size: 13px">이름<b class="text-danger">(필수)</b></td>
        			<td>
        				<input type="text" class="form-control form-control-sm" id = "name" name = "name"
        				style = "width:155px; float: left;">
        			</td>
      			</tr>
      			<tr>
        			<td style = "width:160px; font-size: 13px">휴대전화</td>
        			<td>
        				<select class="form-control form-control-sm" id = "phone1" name = "phone1" 
        				style = "width:70px; float: left;">
        					<option value="010">010</option>
        					<option value="010">011</option>
        					<option value="010">016</option>
        					<option value="010">017</option>
        					<option value="010">018</option>
        					<option value="010">019</option>
        				</select>
        				<b style = "float: left;">&nbsp;-&nbsp;</b>
        				<input type="number" class="form-control form-control-sm" id = "phone2" name = "phone2" 
        				style = "width:70px; float: left;">
        				<b style = "float: left;">&nbsp;-&nbsp;</b>
        				<input type="number" class="form-control form-control-sm" id = "phone3" name = "phone3" 
        				 style = "width:70px; float: left;"> 
        			</td>
      			</tr>
      			<tr>
        			<td style = "width:160px; font-size: 13px">이메일<b class="text-danger">(필수)</b></td>
        			<td>    
        				<input type="email" class="form-control form-control-sm"  id = "email" name = "email"
        				style = "width:155px; float: left;" onblur="checkEmail()">
        				<span id = "emailmsg" style="float:left; padding: 4px;font-size: 12px"></span>
        			</td>
      			</tr>
    		</tbody>
		</table>
		<hr style = "margin-top: -1rem;">
		<h6 class="text-uppercase font-weight-bold">이용 약관</h6>
		<div class = "agreeForm">
			<div class="form-check">
   				<input type="checkbox" class="form-check-input" id="allCheck" onclick="checkAll()">
    			<label class="form-check-label" for="allCheck"><strong class="font-weight-bold">이용약관 및 개인정보수집 및 이용, 쇼핑정보 수신(선택)에 모두 동의합니다.</strong></label>
			</div>
		</div>
		
		<div class = "agreeForm">
			<p class="font-weight-bold" style = "font-size: 13px;">[필수]이용약관 동의</p>
  			<textarea class="form-control" rows="5" id="agreeService" readonly style="background: white;">
<c:forEach var="content" items="${agree0 }">${content}&#10;</c:forEach>
  			</textarea>
			<div class="form-check" style = "padding: 0px;">
				<strong style = "font-size:13px;">이용약관에 동의하십니까?</strong>
   				<input type="checkbox" class="form-check-input" id="agreeServiceCheck" style = "margin-left: 0px; margin-top:7px;">
    			<label class="form-check-label" for="agreeServiceCheck" style = "font-size:13px; margin-left: 18px">동의함</label>
			</div>
		</div>
		
		<div class = "agreeForm">
			<p class="font-weight-bold" style = "font-size: 13px;">[필수]개인정보 수집 및 이용 동의</p>
  			<textarea class="form-control" rows="5" id="agreePrivacy" readonly style="background: white;">
<c:forEach var="content" items="${agree1 }">${content}&#10;</c:forEach>
  			</textarea>
			<div class="form-check" style = "padding: 0px;">
				<strong style = "font-size:13px;">개인정보 수집 및 이용에 동의하십니까?</strong>
   				<input type="checkbox" class="form-check-input" id="agreePrivacyCheck" style = "margin-left: 0px; margin-top:7px;">
    			<label class="form-check-label" for="agreePrivacyCheck" style = "font-size:13px; margin-left: 18px">동의함</label>
			</div>
		</div>
		
		<div class = "agreeForm">
			<p class="font-weight-bold" style = "font-size: 13px;">[선택] 쇼핑정보 수신 동의</p>
  			<textarea class="form-control" rows="5" id="agreeSms" readonly style="background: white;">
<c:forEach var="content" items="${agree2 }">${content}&#10;</c:forEach>
  			</textarea>
			<div class="form-check" style = "padding: 0px;">
				<strong style = "font-size:13px;">SMS 수신을 동의하십니까?</strong>
   				<input type="checkbox" class="form-check-input" id="agreeSmsCheck" style = "margin-left: 0px; margin-top:7px;">
    			<label class="form-check-label" for="agreeagreeSmsCheck" style = "font-size:13px; margin-left: 18px">동의함</label>
    			<br>
    			<strong style = "font-size:13px;">이메일 수신을 동의하십니까?</strong>
    			<input type="checkbox" class="form-check-input" id="agreeEmailCheck" style = "margin-left: 0px; margin-top:7px;">
    			<label class="form-check-label" for="agreeSmsCheck" style = "font-size:13px; margin-left: 18px">동의함</label>
			</div>
		</div>
		
		<div class = "text-center">
			<button type="button" class="btn btn-secondary" onclick="checkMenu()"
				style="width:140px; font-size: 15px; background-color: #0a090aad !important;">
   				<b class="font-weight-bold">회원가입</b>
   			</button>
		</div>
	</form>
</div>
<!-- Footer Include -->
<jsp:include page = "footer.jsp"/>
</body>
</html>