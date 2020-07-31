<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath">${pageContext.request.contextPath }</c:set>
<!-- Header Include -->
<jsp:include page="header.jsp"/>
<style>
.useratag{
	color: black;
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
					<strong class = "font-weight-bold" style="color:black;font-size: 13px">류승환</strong>
					<p  style = "color : gray; font-size: 13px">일반회원</p>
				</div>
				<div class = "col-sm-10" style = "font-size: 13px">
					<div class = "row">
						<div class = "col-sm-8">
							<p style = "color : gray;">
								환영합니다
								<strong class = "font-weight-bold" style="color:black">류승환</strong> 
								회원님
							</p>
						</div>
						<div class = "col-sm-4">
							<a>
								<button class = "form-control form-control-sm"
								style = "width:121px; float : right; font-size: 12px; color:gray">
									배송주소록 관리
								</button>
							</a>
							<a>
								<button class = "form-control form-control-sm"
								style = "width:110px; float : right; font-size: 12px; color:gray">
									회원정보 수정
								</button>
							</a>
						</div>
					</div>
					<a href = "#" class = "font-weight-bold useratag">주문내역</a>
					<a href = "#" class = "font-weight-bold useratag"> │ 장바구니</a>
					<a href = "#" class = "font-weight-bold useratag"> │ 관심상품</a>
					<a href = "#" class = "font-weight-bold useratag"> │ 최근 본 상품</a>
					<a href = "#" class = "font-weight-bold useratag"> │ 내 게시글</a>
					<br>
					<br>
					<nav class="navbar-expand-sm">
						<ul class="navbar-nav mr-auto " style = "border:1px dotted #ced4da; padding:10px;
						border-radius: 15px;">
							<li class="nav-item" 
							style = "padding-right: 10px; border-right : 0.5px dotted #ced4da;">
								<br>
								<p style = "color : gray; margin-top: -10px;">총 주문</p>
								<b class = "font-weight-bold useratag">75,000원</b>(2회)
    						</li>
							<li class="nav-item" style = "padding-right: 10px; padding-left: 10px; 
								border-left : 0.5px solid #ced4da; border-right : 0.5px dotted #ced4da;">
								<br>
								<p style = "color : gray; margin-top: -10px;">가용 적립금</p>
								<b class = "font-weight-bold useratag">350원</b>
								<button type="button" class="btn btn-secondary" onclick="checkMenu()"
								style="width:35px; height:21px; font-size: 12px; 
								background-color: #0a090aad !important;padding:0px;">
   									조회
   								</button>
 							</li>
							<li class="nav-item" style = "padding-right: 10px; padding-left: 10px; 
								border-left : 0.5px solid #ced4da; border-right : 0.5px dotted #ced4da;">
								<br>
								<p style = "color : gray; margin-top: -10px;">총 적립금</p>
								<b class = "font-weight-bold useratag">750원</b>(2회)
    						</li>
							<li class="nav-item" style = "padding-right: 10px; padding-left: 10px; 
								border-left : 0.5px solid #ced4da; border-right : 0.5px dotted #ced4da;">
								<br>
								<p style = "color : gray; margin-top: -10px;">사용 적립금</p>
								<b class = "font-weight-bold useratag">0원</b>(2회)
				    		</li>
							<li class="nav-item" 
							style = "padding-left: 10px; border-left : 0.5px dotted #ced4da;">
								<br>
								<p style = "color : gray; margin-top: -10px;">쿠폰</p>
								<b class = "font-weight-bold useratag">0개</b>
								<button type="button" class="btn btn-secondary" onclick="checkMenu()"
								style="width:35px; height:21px; font-size: 12px; 
								background-color: #0a090aad !important;padding:0px;">
   									조회
   								</button>
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
								류승환
							</b> 회원님은 
							<b class = "font-weight-bold useratag">
								[일반회원] 
							</b> 등급 회원이십니다.
						</p>
		    		</li>
				</ul>
	  		</nav>
	  		<br><br>
			<b class = "font-weight-bold useratag" style ="font-size: 12px">주문처리현황</b>
			<br>
			<br>
	  		<nav class="navbar-expand-sm">
	  			<ul class="navbar-nav mr-auto " style = "border:1px dotted #ced4da; padding:10px;
				border-radius: 15px;">
					<li class="nav-item" style ="width:25%; text-align: center">
						<b class = "font-weight-bold useratag" style ="font-size: 12px">입금전</b><br>
						<b class = "font-weight-bold useratag" style ="font-size: 35px">0</b>
					</li>
					<li class="nav-item" style ="width:25%; text-align: center">
						<b class = "font-weight-bold useratag" style ="font-size: 12px">배송준비중</b><br>
						<b class = "font-weight-bold useratag" style ="font-size: 35px">1</b>
					</li>
					<li class="nav-item" style ="width:25%; text-align: center">
						<b class = "font-weight-bold useratag" style ="font-size: 12px">배송중</b><br>
						<b class = "font-weight-bold useratag" style ="font-size: 35px">1</b>
					</li>
					<li class="nav-item" style ="width:25%; text-align: center">
						<b class = "font-weight-bold useratag" style ="font-size: 12px">배송완료</b><br>
						<b class = "font-weight-bold useratag" style ="font-size: 35px">5</b>
					</li>
					<li class="nav-item" style ="width:25%;">
						취소:
					</li>
				</ul>
	  		</nav>
		</div>
	</form>
</div>
<!-- Footer Include -->
<jsp:include page = "footer.jsp"/>
</body>
</html>
