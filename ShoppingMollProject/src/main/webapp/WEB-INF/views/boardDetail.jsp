<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath">${pageContext.request.contextPath }</c:set>
<!-- Header Include -->
<jsp:include page="header.jsp"/>
<div class="container overlap">
	<h6 class="text-uppercase font-weight-bold" style = "margin-top: 30px;">${boardVO.kind}</h6>
	<br>
	<br>
	<form id = "frm">
		<input type = "hidden" value = "${boardVO.boardnumber }" name = "boardnumber" name = "boardnumber">
		<table class="table">
			<tbody>
	 			<tr>
	   				<td style = "width:15%; font-size: 13px; text-align: center">제목</td>
	   				<td style = "width:40%">
	   					<input type="text" class="form-control form-control-sm" id = "title" name = "title"
	   					value = "${boardVO.title }" readonly>
	   				</td>
	   				<td style = "width:15%; font-size: 13px; text-align: center">작성자</td>
	   				<td	style = "width:30%">
	   					<input type="text" class="form-control form-control-sm" id = "writer" name = "writer"
	   					value = "${boardVO.writer }" readonly>
	   				</td>
	 			</tr>
	 			<tr>
	   				<td style = "width:160px; font-size: 13px" colspan="4">	
	   					${boardVO.content }
	   				</td>
	 			</tr>
		  	</tbody>
		</table>
		<hr style="margin-top: -1rem;">				
		<br>
		<button type="button" class="btn btn-secondary" onClick="checkEdit()"
			style="width:72px; font-size: 12px; background-color: #060606  !important;
			margin:0px; padding: 8px;">
	   		편집
	   	</button>
	   	<button type="button" class="btn btn-secondary"  onClick="history.go(-1)"
			style="width:72px; font-size: 12px; background-color: #007bff  !important;
			margin:0px; padding: 8px;">
	   		이전
		</button>
		<button type="button" class="btn btn-secondary"  onClick="checkDelete()"
			style="width:72px; font-size: 12px; background-color: #007bff  !important;
			margin:0px; padding: 8px;">
	   		삭제
		</button>
	</form>
</div>
<!-- Footer Include -->
<jsp:include page = "footer.jsp"/>
</body>
<script>
function checkEdit(){
	$("#frm").attr("method","get");
	$("#frm").attr("action", "${cpath}/board/passwordCheck/");
	$("#frm").submit();
		
}
</script>
</html>