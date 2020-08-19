<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath">${pageContext.request.contextPath }</c:set>
<!-- Header Include -->
<jsp:include page="header.jsp"/>
<div class="container overlap" style = "text-align: center;">
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
        			<td style = "width:160px; font-size: 13px" colspan="2">	
        				<textarea id = "editor4" name = "editor4"></textarea>
        			</td>
      			</tr>
    		</tbody>
		</table>
</div>
<!-- Footer Include -->
<jsp:include page = "footer.jsp"/>
<script src = "${cpath}/resources/ckeditor/ckeditor.js"></script>
<script>
	CKEDITOR.replace('editor4',{filebrowserUploadUrl:'${cpath}/image/upload/'});
</script>
</body>
</html>