<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- Header Include -->
<jsp:include page="header.jsp"/>
<style>
.circle{
	width:10px;
	height:10px;
	border-radius:50%;
	background: red;
}
</style>
<div class="container" style = "margin-top: 300px">
	<h6 class="text-uppercase font-weight-bold">회원 가입</h6>
	<br>
	<table class="table">
    	<tbody>
      		<tr>
        		<td style = "width:135px; font-size: 13px">아이디<div class="circle" style = "float: right;"></div></td>
        		<td>Doe</td>
      		</tr>
      		<tr>
        		<td style = "width:135px; font-size: 13px">비밀번호</td>
        		<td>Moe</td>
      		</tr>
      		<tr>
        		<td style = "width:135px; font-size: 13px">비밀번호 확인</td>
        		<td>Dooley</td>
      		</tr>
      		<tr>
        		<td style = "width:135px; font-size: 13px">이름</td>
        		<td>Dooley</td>
      		</tr>
      		<tr>
        		<td style = "width:135px; font-size: 13px">휴대전화</td>
        		<td>Dooley</td>
      		</tr>
      		<tr>
        		<td style = "width:135px; font-size: 13px">이메일</td>
        		<td>Dooley</td>
      		</tr>
    	</tbody>
	</table>
	<hr style = "margin-top: -1rem;">
</div>
<!-- Footer Include -->
<jsp:include page = "footer.jsp"/>
</body>
</html>