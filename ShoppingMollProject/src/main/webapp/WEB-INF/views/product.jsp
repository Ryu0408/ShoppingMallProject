<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath">${pageContext.request.contextPath }</c:set>
<!-- Header Include -->
<jsp:include page="header.jsp"/>
<div class="container overlap">
	<h6 class="text-uppercase font-weight-bold" style = "margin-top: 30px;">${product}</h6>
	<nav class="navbar navbar-expand-sm navbar-light" style = "box-shadow: 0 2px 5px 0 rgba(0,0,0,0), 0 2px 10px 0 rgba(0,0,0,0);">
		<p class= "mr-auto" style="font-family:Nanum Pen Script; padding-top: 13px">
		Total <b class="font-weight-bold">${productSize}</b> Items</p>
		<ul class="navbar-nav">
			<li class="nav-item" style="font-family:Nanum Pen Script;">
    			<a class="nav-link" href="${cpath}/productpage/${product}/newSort/1/">신상품</a>
    		</li>
			<li class="nav-item" style="font-family:Nanum Pen Script;">
   				<a class="nav-link" href="${cpath}/productpage/${product}/lowSort/1/">낮은가격</a>
 			</li>
			<li class="nav-item" style="font-family:Nanum Pen Script;">
      			<a class="nav-link" href="${cpath}/productpage/${product}/highSort/1/">높은가격</a>
    		</li>
			<li class="nav-item" style="font-family:Nanum Pen Script;">
      			<a class="nav-link" href="${cpath}/productpage/${product}/productSort/1/">상품명</a>
    		</li>
  		</ul>
  	</nav>
  	<hr style = "margin-top: 0px">
  	
  	<c:set var="loog_flag" value="false"/>
  	<c:forEach var = "productVO" items="${listProductVO}" varStatus="st">
  		<c:if test="${st.index % 4 == 0 }">
  	<div class = "row">
  		</c:if>
		<div class="col-sm-3">
			<div class="view overlay" style = "text-align: center;">
				<img src="${cpath}/img/product/${productVO.kind }/${productVO.kind }${productVO.productnumber }-1.jpg" class = "img-fluid" style = "width: 100%; height:350px">
				<br>
				<p class="font-weight-bold" style="font-family:Single Day;">${productVO.title }</p>
				<hr class = "teal accent-3">
				<p style="font-family:Single Day;">${productVO.subtitle }</p>
				<p style="font-family:Single Day;">${productVO.price }</p>
			</div>
		</div>
		<c:if test="${st.index % 4 == 3 }">
  	</div>
  	<br>
  		</c:if>
  	</c:forEach>
  	</div>
	<br>
	<nav>
  		<ul class="pagination pg-purple justify-content-center">
    		<li class="page-item">
      			<a class="page-link" aria-label="Previous" onClick="previousPage(${page}, ${pageSize })">
        			<span aria-hidden="true">&laquo;</span>
        			<span class="sr-only">Previous</span>
      			</a>
    		</li>
    		<c:forEach begin="1" end="${pageSize }" var = "page">
    			<c:if test="${page eq '1'}">
    			    <li class="page-item active ${page }page"><a class="page-link" href="${cpath}/productpage/${product}/${sort}/${page}/">${page }</a></li>
    			</c:if>
    			<c:if test="${page ne '1' }">
    			    <li class="page-item ${page }page"><a class="page-link" href="${cpath}/productpage/${product}/${sort}/${page}/">${page }</a></li>
    			</c:if>
    		</c:forEach>
    		<li class="page-item">
      			<a class="page-link" aria-label="Next" onClick="nextPage(${page}, ${pageSize })">
        			<span aria-hidden="true">&raquo;</span>
        			<span class="sr-only">Next</span>
      			</a>
    		</li>
  		</ul>
	</nav>
</div>
<!-- Footer Include -->
<jsp:include page = "footer.jsp"/>
<script type="text/javascript">
for(var i = 1 ; i <= ${pageSize} ; i++){
	page = "${page}" * 1
	if(i == page){ $('.'+i+'page').addClass("active"); }
	if(i != page){ $('.'+i+'page').removeClass("active");}
}

function nextPage(page, pageSize){
	if(page < pageSize){
		page = page +1;
		window.location= "${cpath}/productpage/${product}/${sort}/" + page + "/";
	}
}
function previousPage(page, pageSize){
	if(page > 1){
		page = page - 1;
		window.location= "${cpath}/productpage/${product}/${sort}/" + page + "/";
	}
}
</script>
</body>
</html>
