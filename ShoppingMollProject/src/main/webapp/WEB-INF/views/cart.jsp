<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath">${pageContext.request.contextPath }</c:set>
<!-- Header Include -->
<jsp:include page="header.jsp"/>
<style>
.thStyle{
	background: white; 
	font-size:13px; 
	color: gray;
	text-align: center;
	padding: 0px;
}
</style>
<script>
function checkAll(){
	const checkAll = $("#allCheck").is(":checked");
	if(checkAll == true){
// 		$("#agreeServiceCheck").prop("checked", true);
	}
	else if(checkAll == false){
// 		$("#agreeServiceCheck").prop("checked", false);
	}
}</script>
<div class="container overlap">
	<form id = "frm">
		<h6 class="text-uppercase font-weight-bold">장바구니</h6>
		<div class = "agreeForm" style = "font-size:13px; padding:13px;">
			<strong class="font-weight-bold">상품 (2)</strong>
		</div>
		<table class="table">
    		<thead>
      			<tr>
        			<th class = "thStyle">
   						<input type="checkbox" class="form-check-input" 
   						style = "position:unset;"id="allCheck" onclick="checkAll()">
        			</th>
        			<th class = "thStyle">이미지</th>
        			<th class = "thStyle">상품정보</th>
        			<th class = "thStyle">판매가</th>
        			<th class = "thStyle">수량</th>
        			<th class = "thStyle">적립금</th>
        			<th class = "thStyle">배송구분</th>
        			<th class = "thStyle">배송비</th>
        			<th class = "thStyle">합계</th>
        			<th class = "thStyle">수량</th>
      			</tr>
    		</thead>
    		<tbody>
    			<tr>
    				<td></td>
      			</tr>
    		</tbody>
		</table>
	</form>
</div>
<!-- Footer Include -->
<jsp:include page = "footer.jsp"/>
</body>
</html>