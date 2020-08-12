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
.table td, .table th {
    padding: 0;
}
</style>
<script>
function checkAll(){
	const checkAll = $("#allCheck").is(":checked");
	if(checkAll == true){
		$("#check1").prop("checked", true);
		$("#check2").prop("checked", true);
		$("#check3").prop("checked", true);
		$("#check4").prop("checked", true);

	}
	else if(checkAll == false){
		$("#check1").prop("checked", false);
		$("#check2").prop("checked", false);
		$("#check3").prop("checked", false);
		$("#check4").prop("checked", false);
	}
}
</script>
<div class="container overlap">
	<form id = "frm">
		<h6 class="text-uppercase font-weight-bold" style="margin-top: 30px;">장바구니</h6>
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
    				<td class = "tdStyle sell" style = "vertical-align: middle;">
    					<p class = "font-weight-bold">
    						25,000원
    					</p>
    				</td>
    				<td class = "tdStyle" style = "vertical-align: middle;">
    					<input type ="text" class= "form-control form-control-sm changeQuantity"
    					style = "width: 34px;height: 30px; 	text-align: center; margin: 0 auto;" value = "1">
    					<a class="increaseQuantity"><img src="${cpath}/img/cart/btnup.gif"></a>
    					<a class="decreaseQuantity"><img src="${cpath}/img/cart/btndown.gif"></a>
    				</td>
    				<td class = "tdStyle reservetd" style = "vertical-align: middle;">
    					<p class = "reserve">
    						250원
    					</p>
    				</td>
    				<td class = "tdStyle" style = "vertical-align: middle;">
    					<p>
    						기본배송
    					</p>
    				</td>
    				<td class = "tdStyle sum" style = "vertical-align: middle;">
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
    				<td class = "tdStyle sell" style = "vertical-align: middle;">
    					<p class = "font-weight-bold">
    						35,000원
    					</p>
    				</td>
    				<td class = "tdStyle" style = "vertical-align: middle;">
    					<input type ="text" class= "form-control form-control-sm changeQuantity"
    					style = "width: 34px;height: 30px; 	text-align: center; margin: 0 auto;" value = "1">
    					<a class="increaseQuantity"><img src="${cpath}/img/cart/btnup.gif"></a>
    					<a class="decreaseQuantity"><img src="${cpath}/img/cart/btndown.gif"></a>
    				</td>
    				<td class = "tdStyle reservetd" style = "vertical-align: middle;">
    					<p class = "reserve">
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
    				<td class = "tdStyle sum" style = "vertical-align: middle;">
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
   							삭제
   						</button>
    				</td>
      			</tr>
      			<tr>
    				<td class = "tdStyle" style = "vertical-align: middle;">
    					<input type="checkbox" class="form-check-input" 
   						style = "position:unset; margin: 0px" id="check3">
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
    						35,000원
    					</p>
    				</td>
    				<td class = "tdStyle" style = "vertical-align: middle;">
    					<input type ="text" class= "form-control form-control-sm changeQuantity"
    					style = "width: 34px;height: 30px; 	text-align: center; margin: 0 auto;" value = "1">
    					<a class="increaseQuantity"><img src="${cpath}/img/cart/btnup.gif"></a>
    					<a class="decreaseQuantity"><img src="${cpath}/img/cart/btndown.gif"></a>
    				</td>
    				<td class = "tdStyle reservetd" style = "vertical-align: middle;">
    					<p class = "reserve">
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
    				<td class = "tdStyle sum" style = "vertical-align: middle;">
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
   							삭제
   						</button>
    				</td>
      			</tr>
      			<tr>
    				<td class = "tdStyle" style = "vertical-align: middle;">
    					<input type="checkbox" class="form-check-input" 
   						style = "position:unset; margin: 0px" id="check4">
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
    						35,000원
    					</p>
    				</td>
    				<td class = "tdStyle" style = "vertical-align: middle;">
    					<input type ="text" class= "form-control form-control-sm changeQuantity"
    					style = "width: 34px;height: 30px; 	text-align: center; margin: 0 auto;" value = "1">
    					<a class="increaseQuantity"><img src="${cpath}/img/cart/btnup.gif"></a>
    					<a class="decreaseQuantity"><img src="${cpath}/img/cart/btndown.gif"></a>
    				</td>
    				<td class = "tdStyle reservetd" style = "vertical-align: middle;">
    					<p class = "reserve">
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
    				<td class = "tdStyle sum" style = "vertical-align: middle;">
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
   							삭제
   						</button>
    				</td>
      			</tr>
    		</tbody>
		</table>
		<hr>
		<div class = "agreeForm" style = "font-size:13px; padding:13px;
		text-align: right;">
			상품구매금액 <strong class="font-weight-bold total">140,000</strong> + 배송비(5만원 이하 무료) <strong class="font-weight-bold deleverly">0</strong>
			= 합계 : <strong class="font-weight-bold total" style = "font-size: 20px">140,000원</strong>
		</div>
		<br>
		<div class = "text-center">
			<button type="button" class="btn btn-secondary" onclick="checkMenu()"
				style="width:140px; font-size: 11px; background-color: #0a090aad !important;">
   				<b class="font-weight-bold">전체상품주문</b>
   			</button>
   			<button type="button" class="btn btn-secondary" onclick="checkMenu()"
				style="width:140px; font-size: 11px; background-color: #9a8888 !important;">
   				<b class="font-weight-bold">선택상품주문</b>
   			</button>
		</div>
	</form>
</div>
<!-- Footer Include -->
<jsp:include page = "footer.jsp"/>
<script>
$(function(){
	$('.increaseQuantity').click(function(){
		var count = $(this).parent().children(".form-control").val();
		count = count * 1;
		if(count >= 99){
			alert('수량은 최소 100개 미만입니다.');
		}
		else
		{
			count = count + 1;
			$(this).parent().children(".form-control").val(count);
			var state = $(this)
			changeMoney(state, count);
		}
	});
});
$(function(){
	$('.decreaseQuantity').click(function(){
		var count = $(this).parent().children(".form-control").val();
		count = count * 1;
		if(count <= 1){
			alert('수량은 최소 1개 이상입니다.');
		}
		else
		{
			count = count - 1;
			$(this).parent().children(".form-control").val(count);
			var state = $(this)
			changeMoney(state, count);

		}
	});
});
$(".changeQuantity").on("propertychange change keyup paste input", function() {
    var newValue = $(this).val();
	if(newValue < 1){
		$(this).val(1);
		alert('수량은 최소 1개 이상입니다.');
	}
	else if(newValue > 99){
		$(this).val(1);
		alert('수량은 최소 100개 미만입니다.');
	}
	else{
		var state = $(this)
		changeMoney(state, newValue);
	}
});
function changeMoney(state, newValue){
	var rgx3 = /,/gi;
	sell = state.parent().parent().children(".sell").children(".font-weight-bold")
	.text().replace(rgx3,"").replace("원","");
	var totals= 0;
	sell = sell * 1;
	var sum = sell * newValue;
	var reserve = sum * 0.01;
	sum = sum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + "원";
	reserve = reserve.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + "원";
	state.parent().parent().children(".sum").children(".font-weight-bold").text(sum);
	state.parent().parent().children(".reservetd").children(".reserve").text(reserve);
	for(i=0 ; i < state.parent().parent().parent().children().length ; i++){
		var total = state.parent().parent().parent().children().eq(i).children(".sum")
		.children(".font-weight-bold").text().replace(rgx3,"").replace("원","");
		totals = totals + total * 1
	}
	totals = totals.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + "원";
	$(".total").text(totals);
}
</script>
</body>
</html>