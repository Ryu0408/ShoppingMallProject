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
							<button type = "button" class = "form-control form-control-sm" 
							style = "width:121px; float : right; font-size: 12px; color:gray">
								배송주소록 관리
							</button>
							<a href=" ${cpath}/userinfochange/">
							<button type = "button" class = "form-control form-control-sm" 
							style = "width:110px; float : right; font-size: 12px; color:gray">
								회원정보 수정
							</button>
							</a>
						</div>
					</div>
					<a href = "#" class = "font-weight-bold useratag">주문내역</a>
					<a href = "#" class = "font-weight-bold useratag"> │ 장바구니</a>
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
					<li class="nav-item" style ="width:25%; font-size:12px; text-align : center">
						취소 : <b class = "font-weight-bold useratag" style = "font-size:16px;">1</b><br>
						교환 : <b class = "font-weight-bold useratag" style = "font-size:16px;">2</b><br>
						반품 : <b class = "font-weight-bold useratag" style = "font-size:16px;">1</b><br>
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
	    			<tr style = "text-align: center">
	    				<td class = "tdStyle sell" style = "vertical-align: middle;">
	    					<p class = "font-weight-bold">
	    						0000-0001
	    					</p>
	    				</td>
	    				<td class = "tdStyle" style = "vertical-align: middle;">
	    					<img class= "imgStyle" src="${cpath}/img/main/recommand/recommend01.jpg">
	    				</td>
	    				<td class = "tdStyle" style = "vertical-align: middle;">
	    					<p class="font-weight-bold" style = "margin-bottom: 3px">
	    						[다양한 코디 가능] 크롭 체크 셔츠/자켓으로도 가능해요
	    					</p>
	    					<p style = "color:gray;">[옵션: 브라운]</p>
	    				</td>
	    				<td class = "tdStyle sell" style = "vertical-align: middle;">
	    					<p class = "font-weight-bold text">
	    						3
	    					</p>
	    				</td>
	    				<td class = "tdStyle" style = "vertical-align: middle;">
	    					<p class = "font-weight-bold">
	    						75,000원
	    					</p>
	    				</td>
	    				<td class = "tdStyle reservetd" style = "vertical-align: middle;">
	    					<p class = "font-weight-bold">
	    						배송중
	    					</p>
	    				</td>
	      			</tr>
	    			<tr style = "text-align: center">
	    				<td class = "tdStyle" style = "vertical-align: middle;">
	    					<p class = "font-weight-bold">
	    						0000-0002
	    					</p>
	    				</td>
	    				<td class = "tdStyle" style = "vertical-align: middle;">
	    					<img class= "imgStyle" src="${cpath}/img/main/recommand/recommend02.jpg">
	    				</td>
	    				<td class = "tdStyle" style = "vertical-align: middle;">
	    					<p class="font-weight-bold" style = "margin-bottom: 3px">
	    						[귀염귀염 리본 포인트] 앞,뒤 구분 없이 착용/민소매 코튼 블라우스
	    					</p>
	    					<p style = "color:gray;">[옵션: 화이트]</p>
	    				</td>
	    				<td class = "tdStyle sell" style = "vertical-align: middle;">
	    					<p class = "font-weight-bold">
	    						2
	    					</p>
	    				</td>
	    				<td class = "tdStyle" style = "vertical-align: middle;">
	    					<p class = "font-weight-bold">
	    						50,000원
	    					</p>
	    				</td>
	    				<td class = "tdStyle reservetd" style = "vertical-align: middle;">
	    					<p class = "font-weight-bold">
	    						배송준비중
	    					</p>
	    				</td>
	      			</tr>
	    			<tr style = "text-align: center">
	    				<td class = "tdStyle" style = "vertical-align: middle;">
	    					<p class = "font-weight-bold">
	    						0000-0003
	    					</p>
	    				</td>
	    				<td class = "tdStyle" style = "vertical-align: middle;">
	    					<img class= "imgStyle" src="${cpath}/img/main/recommand/recommend03.jpg">
	    				</td>
	    				<td class = "tdStyle" style = "vertical-align: middle;">
	    					<p class="font-weight-bold" style = "margin-bottom: 3px">
	    						[귀염귀염 리본 포인트] 앞,뒤 구분 없이 착용/민소매 코튼 블라우스
	    					</p>
	    					<p style = "color:gray;">[옵션: 화이트]</p>
	    				</td>
	    				<td class = "tdStyle sell" style = "vertical-align: middle;">
	    					<p class = "font-weight-bold">
	    						3
	    					</p>
	    				</td>
	    				<td class = "tdStyle" style = "vertical-align: middle;">
	    					<p class = "font-weight-bold">
	    						75,000원
	    					</p>
	    				</td>
	    				<td class = "tdStyle reservetd" style = "vertical-align: middle;">
	    					<p class = "font-weight-bold">
	    						입금전
	    					</p>
	    				</td>
	      			</tr>
	    			<tr style = "text-align: center">
	    				<td class = "tdStyle" style = "vertical-align: middle;">
	    					<p class = "font-weight-bold">
	    						0000-0004
	    					</p>
	    				</td>
	    				<td class = "tdStyle" style = "vertical-align: middle;">
	    					<img class= "imgStyle" src="${cpath}/img/main/recommand/recommend04.jpg">
	    				</td>
	    				<td class = "tdStyle" style = "vertical-align: middle;">
	    					<p class="font-weight-bold" style = "margin-bottom: 3px">
	    						[귀염귀염 리본 포인트] 앞,뒤 구분 없이 착용/민소매 코튼 블라우스
	    					</p>
	    					<p style = "color:gray;">[옵션: 화이트]</p>
	    				</td>
	    				<td class = "tdStyle sell" style = "vertical-align: middle;">
	    					<p class = "font-weight-bold">
	    						5
	    					</p>
	    				</td>
	    				<td class = "tdStyle" style = "vertical-align: middle;">
	    					<p class = "font-weight-bold">
	    						95,000원
	    					</p>
	    				</td>
	    				<td class = "tdStyle reservetd" style = "vertical-align: middle;">
	    					<p class = "font-weight-bold">
	    						배송완료
	    					</p>
	    				</td>
	      			</tr>
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
	        			<th class = "thStyle">번호</th>
	        			<th class = "thStyle">쿠폰명</th>
	        			<th class = "thStyle">적용상품</th>
	        			<th class = "thStyle">구매금액</th>
	        			<th class = "thStyle">혜택</th>
	        			<th class = "thStyle">사용기간</th>
	      			</tr>
	    		</thead>
	    		<tbody>
	    			<tr>
	    				<td colspan="6">
	    					<p class = "font-weight-bold tdStyle" style = "color: gray">
	    						보유하고 계신 쿠폰 내역이 없습니다
	    					</p>	    				
	    				</td>
	    			</tr>
	    		</tbody>
			</table>
			<hr>
			<br>
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
