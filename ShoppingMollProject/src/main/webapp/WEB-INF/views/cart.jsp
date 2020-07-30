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
.tdStyle{
	background: white; 
	font-size:13px; 
	color: black;
	text-align: center;
}
.imgStyle{
	width: 70px;
	height: 80px;
}
</style>
<script>
function checkAll(){
	const checkAll = $("#allCheck").is(":checked");
	if(checkAll == true){
		$("#check1").prop("checked", true);
		$("#check2").prop("checked", true);
	}
	else if(checkAll == false){
		$("#agreeServiceCheck").prop("checked", false);
	}
}
</script>
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
   						style = "position:unset; margin: 0px "id="allCheck" onclick="checkAll()">
        			</th>
        			<th class = "thStyle">이미지</th>
        			<th class = "thStyle">상품정보</th>
        			<th class = "thStyle">판매가</th>
        			<th class = "thStyle">수량</th>
        			<th class = "thStyle">적립금</th>
        			<th class = "thStyle">배송구분</th>
        			<th class = "thStyle">배송비</th>
        			<th class = "thStyle">합계</th>
        			<th class = "thStyle">선택</th>
      			</tr>
    		</thead>
    		<tbody>
    			<tr>
    				<td class = "tdStyle" style = "vertical-align: middle;">
    					<input type="checkbox" class="form-check-input" 
   						style = "position:unset; margin: 0px" id="check1">
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
    				<td class = "tdStyle" style = "vertical-align: middle;">
    					<p class = "font-weight-bold">
    						25,000원
    					</p>
    				</td>
    				<td class = "tdStyle" style = "vertical-align: middle;">
    					<input type ="text" class= "form-control form-control-sm"
    					style = "width: 34px;height: 30px; 	text-align: center; margin: 0 auto;" value = "1">
    					<a href="#" class="increaseQuantity"><img src="${cpath}/img/cart/btnup.gif"></a>
    					<a href="#" class="decreaseQuantity"><img src="${cpath}/img/cart/btndown.gif"></a>
    				</td>
    				<td class = "tdStyle" style = "vertical-align: middle;">
    					<p>
    						250원
    					</p>
    				</td>
    				<td class = "tdStyle" style = "vertical-align: middle;">
    					<p>
    						기본배송
    					</p>
    				</td>
    				<td class = "tdStyle" style = "vertical-align: middle;">
    					<p>
    						무료
    					</p>
    				</td>
    				<td class = "tdStyle" style = "vertical-align: middle;">
    					<p class = "font-weight-bold">
    						25,000원
    					</p>
    				</td>
    				<td class = "tdStyle" style = "vertical-align: middle;">
    					<button type="button" class="btn btn-secondary" onclick="checkMenu()"
						style="width:72px; font-size: 10px; background-color: #0a090aad !important; padding:6px">
   							주문하기
   						</button><br>
   						<button type="button" class="btn btn-secondary" onclick="checkMenu()"
   							style="width:72px; font-size: 10px; background-color: #40a55fad !important; padding:6px">
   							관심상품등록
   						</button><br>
   						<button type="button" class="btn btn-secondary" onclick="checkMenu()"
   							style="width:72px; font-size: 10px; background-color: #40a55fad !important; padding:6px">
   							삭제
   						</button>
    				</td>
      			</tr>
      			<tr>
    				<td class = "tdStyle" style = "vertical-align: middle;">
    					<input type="checkbox" class="form-check-input" 
   						style = "position:unset; margin: 0px" id="check2">
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
    				<td class = "tdStyle" style = "vertical-align: middle;">
    					<p class = "font-weight-bold">
    						35,000원
    					</p>
    				</td>
    				<td class = "tdStyle" style = "vertical-align: middle;">
    					<input type ="text" class= "form-control form-control-sm"
    					style = "width: 34px;height: 30px; 	text-align: center; margin: 0 auto;" value = "1">
    					<a href="#" class="increaseQuantity"><img src="${cpath}/img/cart/btnup.gif"></a>
    					<a href="#" class="decreaseQuantity"><img src="${cpath}/img/cart/btndown.gif"></a>
    				</td>
    				<td class = "tdStyle" style = "vertical-align: middle;">
    					<p>
    						350원
    					</p>
    				</td>
    				<td class = "tdStyle" style = "vertical-align: middle;">
    					<p>
    						기본배송
    					</p>
    				</td>
    				<td class = "tdStyle" style = "vertical-align: middle;">
    					<p>
    						무료
    					</p>
    				</td>
    				<td class = "tdStyle" style = "vertical-align: middle;">
    					<p class = "font-weight-bold">
    						35,000원
    					</p>
    				</td>
    				<td class = "tdStyle" style = "vertical-align: middle;">
    					<button type="button" class="btn btn-secondary" onclick="checkMenu()"
						style="width:72px; font-size: 10px; background-color: #0a090aad !important; padding:6px">
   							주문하기
   						</button><br>
   						<button type="button" class="btn btn-secondary" onclick="checkMenu()"
   							style="width:72px; font-size: 10px; background-color: #40a55fad !important; padding:6px">
   							관심상품등록
   						</button><br>
   						<button type="button" class="btn btn-secondary" onclick="checkMenu()"
   							style="width:72px; font-size: 10px; background-color: #40a55fad !important; padding:6px">
   							삭제
   						</button>
    				</td>
      			</tr>
    		</tbody>
		</table>
	</form>
</div>
<!-- Footer Include -->
<jsp:include page = "footer.jsp"/>
<script>
$(function(){
	$('.decreaseQuantity').click(function(){
		var count = $(this).parent().children(".form-control").val();
		console.log(count);
		$(this).parent().children(".form-control").val(count);
	});
});
</script>
</body>
</html>