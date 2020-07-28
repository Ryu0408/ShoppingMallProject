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
			if (data === '사용 가능한 ID입니다') {
				var filter = /^[a-z]+[a-z0-9]{5,19}$/g; // 영문자로 시작하는 6~20자 영문자 또는 숫자
				var checkid = $("#id").val();
				if(!checkid.match(filter)){
					$("#idmsg").text('아이디 형식에 맞지 않습니다');
					$("#idmsg").css('color', 'red');	
				}else{
					$("#idmsg").css('color', 'blue');	
				}
			} else {
				$("#idmsg").css('color', 'red');
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
</script>
<div class="container overlap">
	<h6 class="text-uppercase font-weight-bold">회원 가입</h6>
	<br>
	<form>
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
        				<input type="text" class="form-control form-control-sm"  id = "name" name = "name"
        				style = "width:155px; float: left;">
        			</td>
      			</tr>
      			<tr>
        			<td style = "width:160px; font-size: 13px">휴대전화</td>
        			<td>
        				<select class="form-control form-control-sm" style = "width:70px; float: left;">
        					<option value="010">010</option>
        					<option value="010">011</option>
        					<option value="010">016</option>
        					<option value="010">017</option>
        					<option value="010">018</option>
        					<option value="010">019</option>
        				</select>
        				<b style = "float: left;">-</b>
        				<input type="text" class="form-control form-control-sm" style = "width:70px; float: left;">
        				<b style = "float: left;">-</b>
        				<input type="text" class="form-control form-control-sm" style = "width:70px; float: left;"> 
        			</td>
      			</tr>
      			<tr>
        			<td style = "width:160px; font-size: 13px">이메일<b class="text-danger">(필수)</b></td>
        			<td>
        				<select class="form-control form-control-sm" style = "width:70px; float: left;">
        					<option value="010">010</option>
        					<option value="010">011</option>
        					<option value="010">016</option>
        					<option value="010">017</option>
        					<option value="010">018</option>
        					<option value="010">019</option>
        				</select>
        				<b style = "float: left;">-</b>
        				<input type="text" class="form-control form-control-sm" style = "width:70px; float: left;">
        				<b style = "float: left;">-</b>
        				<input type="text" class="form-control form-control-sm" style = "width:70px; float: left;">        				
        			</td>
      			</tr>
    		</tbody>
		</table>
	</form>
	<hr style = "margin-top: -1rem;">
</div>
<!-- Footer Include -->
<jsp:include page = "footer.jsp"/>
</body>
</html>