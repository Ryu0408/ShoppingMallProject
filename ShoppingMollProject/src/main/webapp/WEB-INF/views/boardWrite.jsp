<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath">${pageContext.request.contextPath }</c:set>
<!-- Header Include -->
<jsp:include page="header.jsp"/>
<div class="container overlap" style = "text-align: center;">
	<textarea id = "editor4" name = "editor4"></textarea>
</div>
<!-- Footer Include -->
<jsp:include page = "footer.jsp"/>
<script src = "${cpath}/resources/ckeditor/ckeditor.js"></script>
<script>
	CKEDITOR.replace('editor4',{filebrowserUploadUrl:'${cpath}/image/upload/'});
</script>


</body>
</html>
