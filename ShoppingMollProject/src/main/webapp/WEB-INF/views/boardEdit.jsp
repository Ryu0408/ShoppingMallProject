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
	<form id = "frm" action="${cpath }/board/update/" method="POST">
		<input type = "hidden" id = "boardnumber" name = "boardnumber" value = ${boardVO.boardnumber}>
		<input type = "hidden" id = "kind" name = "kind" value = "${boardVO.kind }">
		<table class="table">
			<tbody>
	 			<tr>
	   				<td style = "width:15%; font-size: 13px; text-align: center">제목</td>
	   				<td style = "width:40%">
	   					<input type="text" class="form-control form-control-sm" id = "title" name = "title"
	   					value = "${boardVO.title }">
	   				</td>
	   				<td style = "width:15%; font-size: 13px; text-align: center">작성자</td>
	   				<td	style = "width:30%">
	   					<input type="text" class="form-control form-control-sm" id = "writer" name = "writer"
							value = "${boardVO.writer }">
	   				</td>
	 			</tr>
	 			<tr>
	   				<td style = "width:160px; font-size: 13px" colspan="4">	
	   					<textarea id = "ckeditor" name = "ckeditor">${boardVO.content }</textarea>
	   				</td>
	 			</tr>
	 			<tr>
	 				<td style = "font-size: 13px; text-align: center">비밀글 설정</td>
	      			<td style = "text-align: left">
	      				<label><input type="checkbox" id = "lockedCancle" name = "lockedCancle"
	      				style = "margin-top:7px;" onclick="check(0)" checked="checked">공개글</label>
	      				&nbsp;
	      				<label><input type="checkbox"  id="locked" name = "locked" 
	      				style = "margin-top:7px;" onclick="check(1)" value="1">비공개글</label>
	      			</td>
	   				<td style = "font-size: 13px; text-align: center">비밀번호</td>
	      			<td>
	      				<input type="password" class="form-control form-control-sm" id = "password" name = "password">
	      			</td>
	    		</tr>
		  	</tbody>
		</table>
		<hr style="margin-top: -1rem;">				
		<br>
		<button type="button" class="btn btn-secondary" onClick="checkMenu()"
			style="width:72px; font-size: 12px; background-color: #060606  !important;
			margin:0px; padding: 8px;">
	   		수정
	   	</button>
	   	<button type="button" class="btn btn-secondary"  onClick="history.go(-1)"
			style="width:72px; font-size: 12px; background-color: #007bff  !important;
			margin:0px; padding: 8px;">
	   		취소
		</button>
	</form>
</div>
<!-- Footer Include -->
<jsp:include page = "footer.jsp"/>
<script src = "${cpath}/resources/ckeditor/ckeditor.js"></script>
<script>
	CKEDITOR.replace('ckeditor',{
		filebrowserUploadUrl:'${cpath}/image/upload/',
		height : 500,
	});
	
	function check(check){
		if(check == 0){
			$("#lockedCancle").prop("checked", true);
			$("#locked").prop("checked", false);
		}
		else if(check == 1){
			$("#locked").prop("checked", true);
			$("#lockedCancle").prop("checked", false);
		}
	}
	function checkMenu(){
		if($("#title").val() === ""){
			alert('제목을 입력해주세요');
		}
		else if($("#writer").val() === ""){
			alert('작성자를 입력해주세요');
		}
		else if(CKEDITOR.instances.ckeditor.getData() === ""){
			alert('내용을 입력해주세요');
		}
		else if($("#password").val() === ""){
			alert('비밀번호를 입력해주세요');
		}
		else{
			var input_id = document.createElement("input");
			input_id.setAttribute("type", "hidden");
			input_id.setAttribute("name", "content");      
			input_id.setAttribute("value", CKEDITOR.instances.ckeditor.getData());
			$("#frm").append(input_id);
			$("#frm").submit();
		}
	}
</script>
</body>
</html>