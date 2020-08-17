<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath">${pageContext.request.contextPath }</c:set>
<!-- Header Include -->
<jsp:include page="header.jsp"/>
<style>
.thStyle {
    background: white;
    font-size: 13px;
    color: gray;
    text-align: center;
    padding: 0px;
}
.tdStyle{
	background: white; 
	font-size:13px; 
	color: black;
	text-align: center;
}
.selectStyle{
	width : 90px; height: 30px; padding: 0px;
	color : gray; font-size: 12px; margin: 0 auto;
	float:left; margin-right: 10px;
}
</style>
<div class="container overlap">
	<form id = "frm">
		<h6 class="text-uppercase font-weight-bold" style = "margin-top: 30px;">Q&A</h6>
		<br>
		<br>
		<hr style = " margin-top: 0rem; margin-bottom: 0rem;">
		<table class="table">
	    	<thead>
	      		<tr style = "text-align: center">
	        		<th class = "thStyle">번호</th>
	        		<th class = "thStyle">제목</th>
	        		<th class = "thStyle">작성자</th>
	        		<th class = "thStyle">작성일</th>
	        		<th class = "thStyle">조회</th>
	      		</tr>
	    	</thead>
	    	<tbody>
	    		<c:forEach var = "boardVO" items="${listBoardVO}">
	      		<tr style = "text-align: center">
	        		<th class = "thStyle">${boardVO.boardnumber }</th>
	        		<th class = "thStyle"><a href="${cpath }/board/detailBoard/${boardVO.boardnumber}">${boardVO.title }</a></th>
	        		<th class = "thStyle">${boardVO.writer}</th>
	        		<th class = "thStyle">${boardVO.register }</th>
	        		<th class = "thStyle">${boardVO.hit }</th>
	      		</tr>
	      		</c:forEach>
	    	</tbody>
		</table>
		<hr>				
		<div style="display: block; text-align: center;">		
		<c:if test="${paging.startPage != 1 }">
			<a href="${cpath }/board/${listBoardVO[0].kind }/${paging.startPage -1}/${paging.cntPerPage }">&lt;</a>
		</c:if>
		<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
			<c:choose>
				<c:when test="${p == paging.nowPage }">
					<b>${p }</b>
				</c:when>
				<c:when test="${p != paging.nowPage }">
					<a href="${cpath }/board/${listBoardVO[0].kind }/${p }/${paging.cntPerPage}/">${p }</a>
				</c:when>
			</c:choose>
		</c:forEach>
		<c:if test="${paging.endPage != paging.lastPage}">
			<a href="${cpath }/board/${listBoardVO[0].kind }/${paging.endPage+1 }/${paging.cntPerPage}/">&gt;</a>
		</c:if>
		</div>
		<br>
		<div>
			<select class="form-control selectStyle">
					<option value = "*">일주일</option>
					<option value = "**">한달</option>
					<option>세달</option>
					<option>전체</option>
			</select>
			<select class="form-control selectStyle">
					<option value = "*">제목</option>
					<option value = "**">내용</option>
					<option>글쓴이</option>
					<option>아이디</option>
					<option>별명</option>
			</select>
		</div>
		<input type="text" class="form-control form-control-sm"
	    style = "width:162px; float: left; margin-right:10px">
	    <button type="button" class="btn btn-secondary"
			style="width:72px; font-size: 12px; background-color: #060606  !important;
			margin:0px; padding: 8px;">
	   		찾기
	   	</button><br>
	</form>
</div>
<br>
<br>
<!-- Footer Include -->
<jsp:include page = "footer.jsp"/>
</body>
</html>