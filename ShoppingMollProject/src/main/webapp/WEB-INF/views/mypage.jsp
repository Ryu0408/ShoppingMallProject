<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<c:set var="cpath">${pageContext.request.contextPath }</c:set>

<!-- Header Include -->
<jsp:include page="header.jsp"/>
<style>
.useratag{
	color: black;
}
.imgStyle{
	width: 70px;
	height: 80px;
}
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
	width : 180px; height: 26px; padding: 0px;
	color : gray; font-size: 12px; margin: 0 auto;
}
</style>
<div class="container overlap">
	<form id = "frm">
		<h6 class="text-uppercase font-weight-bold" style ="margin-top: 30px;">마이페이지</h6>
		<div>
			<div class = "row" style = "margin-top: 40px">
				<div class = "col-sm-2" style = "text-align: center">
					<img src="${cpath}/img/mypage/user.gif" class = "img-fluid" 
					style = "width: 100px; height:100px; border-radius: 100%;">
					<br>
					<strong class = "font-weight-bold" style="color:black;font-size: 13px">${usersVO.name }</strong>
					<p  style = "color : gray; font-size: 13px">${usersVO.classes }</p>
				</div>
				<div class = "col-sm-10" style = "font-size: 13px">
					<div class = "row">
						<div class = "col-sm-8">
							<p style = "color : gray;">
								환영합니다
								<strong class = "font-weight-bold" style="color:black">${usersVO.name }</strong> 
								회원님
							</p>
						</div>
						<div class = "col-sm-4">
							<a href=" ${cpath}/userinfochange/">
							<button type = "button" class = "form-control form-control-sm" 
							style = "width:110px; float : right; font-size: 12px; color:gray">
								회원정보 수정
							</button>
							</a>
						</div>
					</div>
					<nav class="navbar-expand-sm">
						<ul class="navbar-nav mr-auto " style = "border:1px dotted #ced4da; padding:10px;
						border-radius: 15px;">
							<li class="nav-item" 
							style = "padding-right: 10px; border-right : 0.5px dotted #ced4da;">
								<br>
								<p style = "color : gray; margin-top: -10px;">총 주문</p>
								<b class = "font-weight-bold useratag">
									<fmt:formatNumber var = "totalorderprice" value="${usersVO.totalorderprice}" type="number"/>
									${totalorderprice}원
								</b>
								(${usersVO.totalorder}회)
    						</li>
							<li class="nav-item" style = "padding-right: 10px; padding-left: 10px; 
								border-left : 0.5px solid #ced4da; border-right : 0.5px dotted #ced4da;">
								<br>
								<p style = "color : gray; margin-top: -10px;">가용 적립금</p>
								<b class = "font-weight-bold useratag">
									<fmt:formatNumber var = "residualreserve" value="${usersVO.residualreserve }" type="number"/>
									${residualreserve}원
								</b>
 							</li>
							<li class="nav-item" style = "padding-right: 10px; padding-left: 10px; 
								border-left : 0.5px solid #ced4da; border-right : 0.5px dotted #ced4da;">
								<br>
								<p style = "color : gray; margin-top: -10px;">총 적립금</p>
								<b class = "font-weight-bold useratag">
									<fmt:formatNumber var = "totalreserve" value="${usersVO.totalreserve }" type="number"/>
									${totalreserve }원
								</b>
    						</li>
							<li class="nav-item" style = "padding-right: 10px; padding-left: 10px; 
								border-left : 0.5px solid #ced4da; border-right : 0.5px dotted #ced4da;">
								<br>
								<p style = "color : gray; margin-top: -10px;">사용 적립금</p>
								<b class = "font-weight-bold useratag">
									<fmt:formatNumber var = "usereserve" value="${usersVO.usereserve }" type="number"/>
									${usereserve}원
								</b>(${usersVO.countreserve}회)
				    		</li>
							<li class="nav-item" 
							style = "padding-left: 10px; border-left : 0.5px dotted #ced4da;">
								<br>
								<p style = "color : gray; margin-top: -10px;">쿠폰</p>
								<b class = "font-weight-bold useratag">${fn:length(listCouponVO)}  개</b>
				    		</li>
				  		</ul>
			  		</nav>
				</div>
			</div>
			<br><br>
			<nav class="navbar-expand-sm">
	  			<ul class="navbar-nav mr-auto " style = "border:1px dotted #ced4da; padding:10px;
				border-radius: 15px;">
					<li class="nav-item" 
					style = "padding-right: 10px; border-right : 0.5px dotted #ced4da;
					padding-left: 30px; padding-right: 30px">
						<br>
						<p>
							<b class = "font-weight-bold useratag" style ="font-size: 12px">회원님의 혜택정보</b>
						</p>
					</li>
					<li class="nav-item" 
					style = "padding-left: 15px; border-left : 0.5px dotted #ced4da;">
						<br>
						<p style = "font-size:12px; color: gray; margin-top: 5px">
							저희 쇼핑몰을 이용해 주셔서 감사합니다. 
							<b class = "font-weight-bold useratag">
								${usersVO.name }
							</b> 회원님은 
							<b class = "font-weight-bold useratag">
								${usersVO.classes } 
							</b> 등급 회원이십니다.
						</p>
		    		</li>
				</ul>
	  		</nav>
	  		<br><br>
			<b class = "font-weight-bold useratag" style ="font-size: 12px">주문처리현황</b>
			<br>
			<br>
			<c:set var="deliveryReady" value = "0"/>
			<c:set var="deliverying" value = "0"/>
			<c:set var="deliverySuccees" value = "0"/>
			<c:forEach var="ordersVO" items="${listOrdersVO}">
				<c:if test="${ordersVO.state eq '배송준비중' }">
					<c:set var="deliveryReady" value = "${deliveryReady + 1 }"/>
				</c:if>
				<c:if test="${ordersVO.state eq '배송중' }">
					<c:set var="deliverying" value = "${deliverying + 1 }"/>
				</c:if>
				<c:if test="${ordersVO.state eq '배송완료' }">
					<c:set var="deliverySuccees" value = "${deliverySuccees + 1 }"/>
				</c:if>
			</c:forEach>
	  		<nav class="navbar-expand-sm">
	  			<ul class="navbar-nav mr-auto " style = "border:1px dotted #ced4da; padding:10px;
				border-radius: 15px;">
					<li class="nav-item" style ="width:25%; text-align: center">
						<b class = "font-weight-bold useratag" style ="font-size: 12px">입금전</b><br>
						<b class = "font-weight-bold useratag" style ="font-size: 35px">0</b>
					</li>
					<li class="nav-item" style ="width:25%; text-align: center">
						<b class = "font-weight-bold useratag" style ="font-size: 12px">배송준비중</b><br>
						<b class = "font-weight-bold useratag" style ="font-size: 35px">${deliveryReady }</b>
					</li>
					<li class="nav-item" style ="width:25%; text-align: center">
						<b class = "font-weight-bold useratag" style ="font-size: 12px">배송중</b><br>
						<b class = "font-weight-bold useratag" style ="font-size: 35px">${deliverying }</b>
					</li>
					<li class="nav-item" style ="width:25%; text-align: center">
						<b class = "font-weight-bold useratag" style ="font-size: 12px">배송완료</b><br>
						<b class = "font-weight-bold useratag" style ="font-size: 35px">${deliverySuccees }</b>
					</li>
				</ul>
	  		</nav>
	  		<br>
			<br>
	  		<b class = "font-weight-bold useratag" style ="font-size: 12px">주문상품정보</b>
			<br>
			<br>
			<hr style = " margin-top: 0rem; margin-bottom: 0rem;">
	  		<table class="table" style = "2px solid #dee2e6">
	    		<thead>
	      			<tr style = "text-align: center">
	        			<th class = "thStyle">주문번호</th>
	        			<th class = "thStyle">이미지</th>
	        			<th class = "thStyle">상품정보</th>
	        			<th class = "thStyle">수량</th>
	        			<th class = "thStyle">상품구매금액</th>
	        			<th class = "thStyle">주문처리상태</th>
	      			</tr>
	    		</thead>
	    		<tbody>
	    		<c:forEach var="ordersVO" items="${listOrdersVO}" varStatus="st">
	    		<c:set var="index">${st.index }</c:set>
	    			<tr style = "text-align: center">
	    				<td class = "tdStyle sell" style = "vertical-align: middle;">
	    					<p class = "font-weight-bold">
	    						${ordersVO.ordernumber }
	    					</p>
	    				</td>
	    				<td class = "tdStyle" style = "vertical-align: middle;">
							<a href = "${cpath}/productdetail/${listProductVO[index].productnumber }/">
								<img src="${cpath}/img/product/${listProductVO[index].kind }/${listProductVO[index].kind }${listProductVO[index].productnumber }-1.jpg" 
								class = "img-fluid" style = "width: 110px; height:110px">
							</a>    
	    				</td>
	    				<td class = "tdStyle" style = "vertical-align: middle;">
	    					<p class="font-weight-bold" style = "margin-bottom: 3px">
	    						${listProductVO[index].title}
	    					</p>
	    					<p style = "color:gray;">[옵션: ${ordersVO.color }(${ordersVO.sizes })]</p>
	    				</td>
	    				<td class = "tdStyle sell" style = "vertical-align: middle;">
	    					<p class = "font-weight-bold text">
	    						 ${ordersVO.amount }
	    					</p>
	    				</td>
	    				<td class = "tdStyle" style = "vertical-align: middle;">
	    					<p class = "font-weight-bold">
	    						<fmt:formatNumber var = "price" value="${ordersVO.price * ordersVO.amount }" type="number"/>
									${price}원
	    					</p>
	    				</td>
	    				<td class = "tdStyle reservetd" style = "vertical-align: middle;">
	    					<p class = "font-weight-bold">
	    						${ordersVO.state }
	    					</p>
	    				</td>
	      			</tr>
	      			</c:forEach>
	    		</tbody>
			</table>
			<hr>
			<br>
			<br>
			<b class = "font-weight-bold useratag" style ="font-size: 12px">내 쿠폰 목록</b>
			<br>
			<br>
			<hr style = " margin-top: 0rem; margin-bottom: 0rem;">
			<table class="table">
	    		<thead>
	      			<tr style = "text-align: center">
	        			<th class = "thStyle">쿠폰명</th>
	        			<th class = "thStyle">혜택</th>
	      			</tr>
	    		</thead>
	    		<tbody>
	    			<c:if test="${listCouponVO != null }">
	    			<c:forEach var="couponVO" items="${listCouponVO}">
	    			<tr>
	    				<td>
	    					<p class = "font-weight-bold tdStyle">
	    						${couponVO.name }
	    					</p>	    				
	    				</td>
	    				<td>
	    					<p class = "font-weight-bold tdStyle">
	    						${couponVO.price }
	    					</p>	    				
	    				</td>
	    			</tr>
	    			</c:forEach>
	    			</c:if>
	    			<c:if test="${listCouponVO == null }">
	    			<tr>
	    				<td colspan="6">
	    					<p class = "font-weight-bold tdStyle" style = "color: gray">
	    						보유하고 계신 쿠폰 내역이 없습니다
	    					</p>	    				
	    				</td>
	    			</tr>
	    			</c:if>
	    		</tbody>
			</table>
			<hr>
			<br>
			<b class = "font-weight-bold useratag" style ="font-size: 12px">내 게시글</b>
			<br>
			<br>
			<hr style = " margin-top: 0rem; margin-bottom: 0rem;">
			<table class="table">
	    		<thead>
	      			<tr style = "text-align: center">
	        			<th class = "thStyle">번호</th>
	        			<th class = "thStyle">분류</th>
	        			<th class = "thStyle">제목</th>
	        			<th class = "thStyle">작성자</th>
	        			<th class = "thStyle">작성일</th>
	        			<th class = "thStyle">조회</th>
	      			</tr>
	    		</thead>
	    		<tbody>
	    			<tr>
	    				<td colspan="6">
	    					<p class = "font-weight-bold tdStyle" style = "color: gray">
	    						게시물이 없습니다
	    					</p>	    				
	    				</td>
	    			</tr>
	    		</tbody>
			</table>
			<hr>
		</div>
	</form>
</div>
<!-- Footer Include -->
<jsp:include page = "footer.jsp"/>
</body>
</html>
