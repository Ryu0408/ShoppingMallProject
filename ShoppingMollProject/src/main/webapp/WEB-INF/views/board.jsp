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
<script>
$(document).ready(function(){
	$("#btnWrite").click(function(){
		location.href="${cpath}/board/"
	});
});
function list(page){
	location.href="${cpath}/board/?curPage="+page+"&searchOption=${searchOption}"+"&keyword=${keyword}"+"&kind=${kind}";
}
</script>
<div class="container overlap">
	<h6 class="text-uppercase font-weight-bold" style = "margin-top: 30px;">${kind}</h6>
	<br>
	<br>
	<hr style = "margin-top: 0rem; margin-bottom: 0rem;">
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
    		<c:forEach var = "row" items="${list}">
      		<tr style = "text-align: center">
        		<th class = "thStyle">${row.boardnumber }</th>
        		<th class = "thStyle"><a href="${cpath }/board/detailBoard/${row.boardnumber}/">${row.title }</a></th>
        		<th class = "thStyle">${row.writer}</th>
        		<th class = "thStyle">${row.register }</th>
        		<th class = "thStyle">${row.hit }</th>
      		</tr>
      		</c:forEach>
      		<tr>
      			<td colspan = "5" style = "text-align: center">
      				<c:if test="${boardPager.curBlock > 1 }">
      					<a href="javascript:list('1')">[처음]</a>
      				</c:if>
      				<c:if test = "${boardPager.curBlock>1 }">
      					<a href="javascript:list('${boardPager.prevPage }')">[이전 페이지]</a>
      				</c:if>
      				<c:forEach var="num" begin="${boardPager.blockBegin }"
      				end="${boardPager.blockEnd }">
      					<c:choose>
      						<c:when test ="${num == boardPager.curPage }">
      							<span style = "color:red">${num }</span>&nbsp;
      						</c:when>
      						<c:otherwise>
      							<a href = "javascript:list('${num }')">${num }</a>&nbsp;
      						</c:otherwise>
      					</c:choose>
      				</c:forEach>
      				<c:if test = "${boardPager.curBlock  <= boardPager.totBlock}">
      					<a href="javascript:list('${boardPager.nextPage }')">[다음 페이지]</a>
      				</c:if>
      				<c:if test = "${boardPager.curPage <= boardPager.totPage }">
      					<a href = "javascript:list('${ boardPager.totPage}')">[끝]</a>
      				</c:if>
      			</td>
      		</tr>
    	</tbody>
	</table>
	<hr>				
	<br>
	<form id = "frm" action="${cpath}/board/">
		<div>
			<select class="form-control selectStyle" name="searchOption">
				<option value = "">구분</option>
				<option value = "title" <c:if test="${searchOption}">selected="selected"</c:if>>제목</option>
				<option value = "content" <c:if test="${searchOption}">selected="selected"</c:if>>내용</option>
				<option value = "writer" <c:if test="${searchOption}">selected="selected"</c:if>>글쓴이</option>
			</select>
		</div>
		<input type = "hidden" value = "${kind }" name = "kind">
		<input class="form-control form-control-sm"
	    style = "width:162px; float: left; margin-right:10px" name ="keyword"
	    value="${keyword }">
	    <button type="submit" class="btn btn-secondary"
			style="width:72px; font-size: 12px; background-color: #060606  !important;
			margin:0px; padding: 8px;">
	   		조회
	   	</button>
	   	<button type="button" class="btn btn-secondary"  onClick="location.href='${cpath}/board/write/${kind}/'"
			style="width:72px; font-size: 12px; background-color: #007bff  !important;
			margin:0px; padding: 8px;">
	   		글쓰기
		</button>
	</form>
</div>
<br>
<br>
<!-- Footer Include -->
<jsp:include page = "footer.jsp"/>
</body>
</html>