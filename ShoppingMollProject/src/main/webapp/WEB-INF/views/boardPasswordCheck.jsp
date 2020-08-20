<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath">${pageContext.request.contextPath }</c:set>
<!-- Header Include -->
<jsp:include page="header.jsp"/>
<div class="container overlap" style="text-align: center">
	<h6 class="text-uppercase font-weight-bold" style = "margin-top: 30px;">${boardVO.kind}</h6>
	<br>
	<br>
	<form id = "frm">
		<input type = "hidden" value = "${boardVO.boardnumber }" name = "boardnumber" name = "boardnumber">
      	<input type="password" class="form-control" placeholder="비밀번호를 입력해주세요" name="password"
      	style = "width: 300px; margin: 0 auto">
      	<br>
      	<br>
		<button type="button" class="btn btn-secondary" onClick="ok()"
			style="width:72px; font-size: 12px; background-color: #060606  !important;
			margin:0px; padding: 8px;">
	   		확인
	   	</button>
	</form>
</div>
<!-- Footer Include -->
<jsp:include page = "footer.jsp"/>
</body>
<script>
function ok(){
	$("#frm").attr("method","POST");
	$("#frm").attr("action", "${cpath}/board/passwordCheck/");
	$("#frm").submit();
		
}
</script>
</html>