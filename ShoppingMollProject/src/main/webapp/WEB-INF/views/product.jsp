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
    			<a class="nav-link" href="${cpath}/productpage/${product}/newSort/">신상품</a>
    		</li>
			<li class="nav-item" style="font-family:Nanum Pen Script;">
   				<a class="nav-link" href="${cpath}/productpage/${product}/lowSort/">낮은가격</a>
 			</li>
			<li class="nav-item" style="font-family:Nanum Pen Script;">
      			<a class="nav-link" href="${cpath}/productpage/${product}/highSort/">높은가격</a>
    		</li>
			<li class="nav-item" style="font-family:Nanum Pen Script;">
      			<a class="nav-link" href="${cpath}/productpage/${product}/productSort/">상품명</a>
    		</li>
  		</ul>
  	</nav>
  	<hr style = "margin-top: 0px">
  	<c:set var="loog_flag" value="false"/>
  	<c:forEach var = "productVO" items="${listProductVO}" varStatus="st">
  		<c:if test ="${not loog_flag }">
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
  			<c:if test="${st.index == 27 }">
  				<c:set var="loog_flag" value="true"/>
  			</c:if>
  		</c:if>
  	</c:forEach>
  	</div>
	<br>
	<nav>
  		<ul class="pagination pg-purple justify-content-center">
    		<li class="page-item">
      			<a class="page-link" aria-label="Previous">
        			<span aria-hidden="true">&laquo;</span>
        			<span class="sr-only">Previous</span>
      			</a>
    		</li>
    		<c:forEach begin="1" end="${pageSize }" var = "page">
    			<c:if test="${page eq '1'}">
    			    <li class="page-item active ${page }page"><a class="page-link" onclick="paging(${page})">${page }</a></li>
    			</c:if>
    			<c:if test="${page ne '1' }">
    			    <li class="page-item ${page }page"><a class="page-link" onclick="paging(${page})">${page }</a></li>
    			</c:if>
    		</c:forEach>
    		<li class="page-item">
      			<a class="page-link" aria-label="Next">
        			<span aria-hidden="true">&raquo;</span>
        			<span class="sr-only">Next</span>
      			</a>
    		</li>
  		</ul>
	</nav>
</div>
<<script type="text/javascript">
function paging(page){
	for(var i = 1 ; i <= ${pageSize} ; i++){
		if(i == page){
			$('.'+page+'page').addClass("active");
			break;
		}
		console.log($('.'+page+'page'))
		$('.'+page+'page').removeClass("active");
	}
}
</script>
<!-- Footer Include -->
<jsp:include page = "footer.jsp"/>
</body>
</html>
