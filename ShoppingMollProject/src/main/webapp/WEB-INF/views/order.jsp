<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<div class="container overlap">
	<h6 class="text-uppercase font-weight-bold" style="margin-top: 30px;">주문서 작성</h6>
	<div class = "agreeForm" style = "font-size:13px; padding:13px;">
		<strong class="font-weight-bold">상품(${fn:length(listProductVO)}) </strong>
	</div>
	<input type = "hidden" value = "${usersVO.residualreserve }" id = "residualreserve">
	<table class="table">
   		<thead>
     			<tr>
     			<th class = "thStyle">이미지</th>
       			<th class = "thStyle">상품정보</th>
       			<th class = "thStyle">판매가</th>
       			<th class = "thStyle">수량</th>
       			<th class = "thStyle">적립금</th>
       			<th class = "thStyle">배송구분</th>
       			<th class = "thStyle">합계</th>
     			</tr>
   		</thead>
   		<tbody>
   			<c:set var="priceSum" value="0"></c:set>
   			<c:set var="reserveSum" value="0"></c:set>
   		  	<c:forEach var = "productVO" items="${listProductVO}" varStatus="st">
   		  	<c:set var="index">${st.index }</c:set>
   			<tr id = "tr${index }">
   				<td class = "tdStyle" style = "vertical-align: middle;">
   					<input type = "hidden" value = "${productVO.productnumber }" class="productNumber">
					<a href = "${cpath}/productdetail/${productVO.productnumber }/">
					<img src="${cpath}/img/product/${productVO.kind }/${productVO.kind }${productVO.productnumber }-1.jpg" 
					class = "img-fluid" style = "width: 110px; height:110px"></a>    				</td>
   				<td class = "tdStyle" style = "vertical-align: middle;">
   					<p class="font-weight-bold" style = "margin-bottom: 3px">
   						${productVO.title }
   					</p>
   					<p style = "color:gray;">[옵션: <b class="color">${color[index]}</b>(<b class="sizes">${sizes[index]}</b>)]</p>
   				</td>
   				<td class = "tdStyle sell" style = "vertical-align: middle;">
   					<p class = "font-weight-bold price">
   						${productVO.price }
   						<c:set var="price" value="${productVO.price }"/>
   						<c:set var="priceFirstChange" value="${fn:replace(price, ',', '')}"/>
   						<c:set var="priceSecondChange" value="${fn:replace(priceFirstChange, '원', '')}"/>
   						<c:set var="priceSum" value = "${priceSum + priceSecondChange * amount[index] }"/>
   					</p>
   				</td>
   				<td class = "tdStyle" style = "vertical-align: middle;">
   					<p class = "amount">
   						${amount[index]  }
   					</p>
   				</td>
   				<td class = "tdStyle reservetd" style = "vertical-align: middle;">
   					<p class = "reserve">
   						<fmt:formatNumber var = "priceWonChange" value="${priceSecondChange * amount[index]*0.01 }" type="number"/>
   						<c:set var="reserveSum" value="${reserveSum + priceSecondChange * amount[index]*0.01 }"></c:set>
   						${priceWonChange }원
   					</p>
   				</td>
   				<td class = "tdStyle" style = "vertical-align: middle;">
   					<p>
   						기본배송
   					</p>
   				</td>
   				<td class = "tdStyle sum" style = "vertical-align: middle;">
   					<p class = "font-weight-bold">
   						<fmt:formatNumber var = "priceSumChange" value="${priceSecondChange * amount[index]}" type="number"/>
   						${priceSumChange }원
   					</p>
   				</td>
     			</tr>
     			<fmt:formatNumber var = "reserveTotalSum" value="${reserveSum}" type="number"/>
     			</c:forEach>
   		</tbody>
	</table>
	<hr>
	<div class = "agreeForm" style = "font-size:13px; padding:13px;
	text-align: right;">
		상품구매금액 <strong class="font-weight-bold total">${priceSum }</strong> + 배송비(5만원 이하 무료) 
		<c:if test="${priceSum*1 <= 50000}">
			<fmt:formatNumber var = "deliveryPrice" value="2500" type="number"/>
			<strong class="font-weight-bold deleverly">${deliveryPrice }</strong>
			<fmt:formatNumber var = "priceTotalSum" value="${priceSum + 2500}" type="number"/>
		</c:if>
		<c:if test="${priceSum*1 > 50000}">
			<fmt:formatNumber var = "deliveryPrice" value="0" type="number"/>
			<strong class="font-weight-bold deleverly">${deliveryPrice }</strong>
			<fmt:formatNumber var = "priceTotalSum" value="${priceSum}" type="number"/>
		</c:if>			
		= 합계 : <strong class="font-weight-bold total" style = "font-size: 20px">${priceTotalSum }원</strong>	
		<c:if test="${not empty usersVO }">
		(적립금:${reserveTotalSum }원)
		</c:if>
		<input type = "hidden" value = "${priceSum}" id = priceSum>
		<input type = "hidden" value = "${reserveSum}" id = reserveSum>
	</div>
	<br>
	<b class = "font-weight-bold useratag" style ="font-size: 12px">배송정보</b>
	<table class="table">
   		<tbody>
     			<tr>
       			<td style = "width:160px; font-size: 13px">받으시는분<b class="text-danger">(필수)</b></td>
       			<td>
       				<input type="text" class="form-control form-control-sm" id = "name" name = "name"
       				style = "width:155px; float: left;" value = "${usersVO.name }">
       			</td>
     			</tr>
     			<tr>
       			<td style = "width:160px; font-size: 13px">휴대전화<b class="text-danger">(필수)</b></td>
       			<td>
       				<select class="form-control form-control-sm" id = "phone1" name = "phone1" 
       				style = "width:70px; float: left;">
       					<option value="010">010</option>
       					<option value="010">011</option>
       					<option value="010">016</option>
       					<option value="010">017</option>
       					<option value="010">018</option>
       					<option value="010">019</option>
       				</select>
       				<b style = "float: left;">&nbsp;-&nbsp;</b>
       				<input type="number" class="form-control form-control-sm" id = "phone2" name = "phone2" 
       				style = "width:70px; float: left;" value="${usersVO.phone2 }">
       				<b style = "float: left;">&nbsp;-&nbsp;</b>
       				<input type="number" class="form-control form-control-sm" id = "phone3" name = "phone3" 
       				 style = "width:70px; float: left;" value="${usersVO.phone3 }"> 
       			</td>
     			</tr>
     			<tr>
       			<td style = "width:160px; font-size: 13px">이메일<b class="text-danger">(필수)</b></td>
       			<td>    
       				<input type="email" class="form-control form-control-sm"  id = "email" name = "email"
       				style = "width:200px; float: left;" value="${usersVO.email }">
       			</td>
     			</tr>
     			<tr>
       			<td style = "width:160px; font-size: 13px">주소<b class="text-danger">(필수)</b></td>
       			<td>    
       				<div style = "margin-bottom: 10px;">
       					<input type="text" class="form-control form-control-sm"  id = "postCode" name = "postCode"
       					style = "width:100px; float: left;" value="${usersVO.postCode }">
						<button type="button" class="btn btn-secondary" onClick="sample2_execDaumPostcode()"
						style="width:64px; margin:0px; margin-left:10px; height:30px; font-size: 12px; 
						background-color: #00000061 !important; padding: 0px;">
							우편번호
						</button>
					</div>
       				<div style = "margin-bottom: 10px;">
						<input type="text" class="form-control form-control-sm"  id = "address" name = "address"
						style = "width:400px; clear: both;" value="${usersVO.address }">			
					</div>
					<div>
						<input type="text" class="form-control form-control-sm"  id = "detailAddress" name = "detailAddress"
						style = "width:400px;" value="${usersVO.detailAddress }">		
       				</div>
       				<div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
						<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" style="c ursor:pointer;
						position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
					</div>
       			</td>
     			</tr>
     			<tr>
       			<td style = "width:160px; font-size: 13px">배송메시지</td>
       			<td>    
       				<textarea class="form-control" rows="7" id="deliveryMessage"
 						style="background: white; font-size:13px; color: gray"></textarea>
       			</td>
     			</tr>
   		</tbody>
	</table>
	<hr style = "margin-top: -1rem;">
	<c:if test="${not empty usersVO }">
	<b class = "font-weight-bold useratag" style ="font-size: 12px">쿠폰정보</b>
	<hr style = "margin-bottom: 2px;">
	<table class="table">
   		<thead>
     			<tr>
       			<th class = "thStyle">쿠폰사용</th>
       			<th class = "thStyle">쿠폰이름</th>
       			<th class = "thStyle">혜택</th>
     			</tr>
   		</thead>
   		<tbody>
   		    <c:if test="${not empty listCounponVO }">
   			<c:forEach var = "couponVO" items="${listCounponVO}" varStatus="st">
   			<c:set var="index">${st.index }</c:set>
   			<tr>
   				<td class = "tdStyle" style = "vertical-align: middle;">
   					<input type="checkbox" class="form-check-input coupon" id = "trcoupon${index }"
  						style = "position:unset; margin: 0px" onclick="couponCheck(${index})">
   				</td>
   				<td class = "tdStyle" style = "vertical-align: middle;" >
   					<p class="font-weight-bold couponName" style = "margin-bottom: 3px">
						${couponVO.name }
					</p>
				</td>
   				<td class = "tdStyle" style = "vertical-align: middle;">
   					<p class="font-weight-bold" style = "margin-bottom: 3px" id = "trcouponprice${index }">
   					   <fmt:formatNumber var = "couponPrice" value="${couponVO.price}" type="number"/>
   						${couponPrice}원
   					</p>
   				</td>
     			</tr>
     			</c:forEach>
     			</c:if>
     			<c:if test="${empty listCounponVO }">
     				<td colspan="9">
     				    <p class = "font-weight-bold" style = "text-align: center">
   						쿠폰이 없습니다^^
   					</p>
     				</td>
     			</c:if>
   		</tbody>
	</table>
	</c:if>
	<hr style = "margin-top: -1rem;">
	<c:if test="${not empty usersVO }">
	<b class = "font-weight-bold useratag" style ="font-size: 12px">적립금정보</b>
	<table class="table">
   		<thead>
     			<tr>
       			<th class = "thStyle">적립금사용</th>
       			<th class = "thStyle">사용가능 적립금</th>
       			<th class = "thStyle">사용할 금액</th>
     			</tr>
   		</thead>
   		<tbody>
   			<tr>
   				<td class = "tdStyle" style = "vertical-align: middle;">
   					<input type="checkbox" class="form-check-input check"  id = "trreserve"
  						style = "position:unset; margin: 0px" onclick="reserveCheck()">
   				</td>
   				<td class = "tdStyle" style = "vertical-align: middle;">
   					<p class="font-weight-bold" style = "margin-bottom: 3px">
   						<fmt:formatNumber var = "totalreserve" value="${usersVO.residualreserve }" type="number"/>
							${totalreserve }원
					</p>
   				</td>
   				<td class = "tdStyle" style = "vertical-align: middle;">
       				<input type="number" class="form-control form-control-sm" id = "reserveinput" name = "reserveinput"
       				style = "width:100px; margin: 0 auto" onblur="checkReserve()">
       			</td>
     			</tr>
   		</tbody>
	</table>
	<hr style = "margin-top: -1rem;">
	</c:if>
	<b class = "font-weight-bold useratag" style ="font-size: 12px">결제예정금액</b>
	<hr style = "margin-bottom: 2px;">
	<table class="table">
   		<thead>
     			<tr>
       			<th class = "thStyle">총주문금액</th>
       			<th class = "thStyle">쿠폰사용금액</th>
       			<th class = "thStyle">적립금사용금액금액</th>
       			<th class = "thStyle">결제예정금액</th>
     			</tr>
   		</thead>
   		<tbody>
   			<tr>
   				<td class = "tdStyle" style = "vertical-align: middle;">
   					<p style = "margin-bottom: 3px">
						${priceTotalSum }원
					</p>
   				</td>
   				<td class = "tdStyle" style = "vertical-align: middle;">
   					<p style = "margin-bottom: 3px" id = "couponuse">
						0원
					</p>
				</td>
   				<td class = "tdStyle" style = "vertical-align: middle;">
   					<p style = "margin-bottom: 3px" id = "reserveuse">
   						0원
   					</p>
   				</td>
   				<td class = "tdStyle" style = "vertical-align: middle;">
   					<p class="font-weight-bold" style = "margin-bottom: 3px" id = finaltotalsum>
   					   <fmt:formatNumber var = "couponPrice" value="${couponVO.price}" type="number"/>
   						${priceTotalSum }원
   					</p>
   				</td>
     			</tr>
   		</tbody>
	</table>
	<div class = "text-center">
		<button type="button" class="btn btn-secondary" id = "arrOrder" onclick="order()"
			style="width:140px; font-size: 11px; background-color: #0a090aad !important;">
  				<b class="font-weight-bold">상품주문</b>
  			</button>
	</div>
</div>
<!-- Footer Include -->
<jsp:include page = "footer.jsp"/>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
function couponCheck(index){
	const couponCheck = $("#trcoupon" + index).is(":checked");
	if(couponCheck == true){
		var rgx3 = /,/gi;
		var couponPrice = $("#trcouponprice" + index).text().replace(rgx3,"").replace("원","");
		var couponuse = $("#couponuse").text().replace(rgx3,"").replace("원","");
		var finaltotalsum = $("#finaltotalsum").text().replace(rgx3,"").replace("원","");
		couponuse = couponuse * 1 + couponPrice * 1;
		finaltotalsum = finaltotalsum * 1 + couponPrice * 1;
		couponuse = couponuse.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + "원";
		finaltotalsum = finaltotalsum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + "원";
		$("#couponuse").text(couponuse);
		$("#finaltotalsum").text(finaltotalsum);
	}
	else if(couponCheck == false){
		var rgx3 = /,/gi;
		var couponPrice = $("#trcouponprice" + index).text().replace(rgx3,"").replace("원","");
		var couponuse = $("#couponuse").text().replace(rgx3,"").replace("원","");
		var finaltotalsum = $("#finaltotalsum").text().replace(rgx3,"").replace("원","");
		couponuse = couponuse * 1 - couponPrice * 1;
		finaltotalsum = finaltotalsum * 1 - couponPrice * 1;
		couponuse = couponuse.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + "원";
		finaltotalsum = finaltotalsum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + "원";
		$("#couponuse").text(couponuse);
		$("#finaltotalsum").text(finaltotalsum);
	}
}
function reserveCheck(){
	const reserveCheck = $("#trreserve").is(":checked");
	if(reserveCheck == true && $("#reserveinput").val() ==''){
		$("#trreserve").prop("checked", false);
		alert('쿠폰금액을 입력후 체크해주세요^^');
		return;
	}
	if(reserveCheck == true){
		var rgx3 = /,/gi;
		var reservePrice = $("#reserveinput").val()
		var reserveuse = $("#reserveuse").text().replace(rgx3,"").replace("원","");
		var finaltotalsum = $("#finaltotalsum").text().replace(rgx3,"").replace("원","");
		reserveuse = reserveuse * 1 - reservePrice * 1;
		finaltotalsum = finaltotalsum * 1 - reservePrice * 1;
		reserveuse = reserveuse.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + "원";
		finaltotalsum = finaltotalsum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + "원";
		$("#reserveinput").attr("readonly",true);
		$("#reserveuse").text(reserveuse);
		$("#finaltotalsum").text(finaltotalsum);
	}
	else if(reserveCheck == false){
		var rgx3 = /,/gi;
		var reservePrice = $("#reserveinput").val()
		var reserveuse = $("#reserveuse").text().replace(rgx3,"").replace("원","");
		var finaltotalsum = $("#finaltotalsum").text().replace(rgx3,"").replace("원","");
		reserveuse = reserveuse * 1 + reservePrice * 1;
		finaltotalsum = finaltotalsum * 1 + reservePrice * 1;
		reserveuse = reserveuse.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + "원";
		finaltotalsum = finaltotalsum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + "원";
		$("#reserveinput").attr("readonly",false);
		$("#reserveuse").text(reserveuse);
		$("#finaltotalsum").text(finaltotalsum);
	}
}
function checkMenu(){
	if($("#name").val() === ""){
		alert('이름을 입력해주세요');
	}
	else if($("#email").val() === ""){
		alert('이메일을 입력해주세요')
	}
	else if($("#address1").val() === "" || $("#address2").val() === "" || $("#address3").val() === ""){
		alert('주소를 입력해주세요')
	}
	else{
		$("#frm").submit();
	}
}

function checkReserve(){
	var residualreserve = $("#residualreserve").val();
	var reservePrice = $("#reserveinput").val();
	if(reservePrice > residualreserve){
		 $("#reserveinput").val("");
		 alert("총 적립금보다 작게 적어주세요^^")
	}
	if(reservePrice < 0){
		 $("#reserveinput").val("");
		 alert("0보다 큰값을 적어주세요^^")
	}
	
}
var element_layer = document.getElementById('layer');
function closeDaumPostcode() {
    element_layer.style.display = 'none';
}
function sample2_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            var addr = ''; 
            var extraAddr = ''; 
            if (data.userSelectedType === 'R') {
                addr = data.roadAddress;
            } else {
                addr = data.jibunAddress;
            }
            if(data.userSelectedType === 'R'){
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                	extraAddr += data.bname;
                }
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
//                 document.getElementById("sample2_extraAddress").value = extraAddr;
            } else {
                extraAddr = '';
            }
            document.getElementById('postCode').value = data.zonecode;
            document.getElementById("address").value = addr  + extraAddr;
            document.getElementById("detailAddress").focus();
            element_layer.style.display = 'none';
        },
        width : '100%',
        height : '100%',
        maxSuggestItems : 5
    }).embed(element_layer);
    element_layer.style.display = 'block';
    initLayerPosition();
}
function initLayerPosition(){
    var width = 460;
    var height = 400; 
    var borderWidth = 5;
    element_layer.style.width = width + 'px';
    element_layer.style.height = height + 'px';
    element_layer.style.border = borderWidth + 'px solid';
    element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width)/2 - borderWidth) + 'px';
    element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height)/2 - borderWidth) + 'px';
}
function order(){
	var rgx3 = /,/gi;
	var form = document.createElement("form");
	const productNumber = $(".productNumber");
	const amount = $(".amount");
	const price = $(".price");
	const color = $(".color");
	const sizes = $(".sizes");
	const name = $("#name");
	const postCode = $("#postCode");
	const detailAddress = $("#detailAddress");
	const address = $("#address");
	const phone1 = $("#phone1");
	const phone2 = $("#phone2");
	const phone3 = $("#phone3");
	const email = $("#email");
	const deliveryMessage = $("#deliveryMessage");
	const reserveinput = $("#reserveinput");
	form.setAttribute("method","post");
	form.setAttribute("action", "${cpath}/order/finalOrder/");
	document.body.appendChild(form);
	for(var i=0;i<amount.length;i++){
		var input_id = document.createElement("input");
		input_id.setAttribute("type", "hidden");
		input_id.setAttribute("name", "productNumber");      
		input_id.setAttribute("value", productNumber.eq(i).val());
		form.appendChild(input_id);
		
		var input_id = document.createElement("input");
		input_id.setAttribute("type", "hidden");
		input_id.setAttribute("name", "amount");      
		input_id.setAttribute("value", amount.eq(i).text());
		form.appendChild(input_id);
		
		var input_id = document.createElement("input");
		input_id.setAttribute("type", "hidden");
		input_id.setAttribute("name", "price");      
		input_id.setAttribute("value", 
				price.eq(i).text().replace(rgx3,"").replace("원",""));
		form.appendChild(input_id);
		
		var input_id = document.createElement("input");
		input_id.setAttribute("type", "hidden");
		input_id.setAttribute("name", "color");      
		input_id.setAttribute("value", color.eq(i).text());
		form.appendChild(input_id);	
		
		var input_id = document.createElement("input");
		input_id.setAttribute("type", "hidden");
		input_id.setAttribute("name", "sizes");      
		input_id.setAttribute("value", sizes.eq(i).text());
		form.appendChild(input_id);
	}
	var input_id = document.createElement("input");
	input_id.setAttribute("type", "hidden");
	input_id.setAttribute("name", "name");      
	input_id.setAttribute("value", name.val());
	form.appendChild(input_id);

	var input_id = document.createElement("input");
	input_id.setAttribute("type", "hidden");
	input_id.setAttribute("name", "postCode");      
	input_id.setAttribute("value", postCode.val());
	form.appendChild(input_id);

	var input_id = document.createElement("input");
	input_id.setAttribute("type", "hidden");
	input_id.setAttribute("name", "detailAddress");      
	input_id.setAttribute("value", detailAddress.val());
	form.appendChild(input_id);

	var input_id = document.createElement("input");
	input_id.setAttribute("type", "hidden");
	input_id.setAttribute("name", "address");      
	input_id.setAttribute("value", address.val());
	form.appendChild(input_id);

	var input_id = document.createElement("input");
	input_id.setAttribute("type", "hidden");
	input_id.setAttribute("name", "phone1");      
	input_id.setAttribute("value", phone1.val());
	form.appendChild(input_id);

	var input_id = document.createElement("input");
	input_id.setAttribute("type", "hidden");
	input_id.setAttribute("name", "phone2");      
	input_id.setAttribute("value", phone2.val());	
	form.appendChild(input_id);

	var input_id = document.createElement("input");
	input_id.setAttribute("type", "hidden");
	input_id.setAttribute("name", "phone3");      
	input_id.setAttribute("value", phone3.val());
	form.appendChild(input_id);

	var input_id = document.createElement("input");
	input_id.setAttribute("type", "hidden");
	input_id.setAttribute("name", "email");      
	input_id.setAttribute("value", email.val());
	form.appendChild(input_id);

	var input_id = document.createElement("input");
	input_id.setAttribute("type", "hidden");
	input_id.setAttribute("name", "message");      
	input_id.setAttribute("value", deliveryMessage.val());
	form.appendChild(input_id);
	
	var input_id = document.createElement("input");
	input_id.setAttribute("type", "hidden");
	input_id.setAttribute("name", "reserveinput");      
	input_id.setAttribute("value", reserveinput.val());
	form.appendChild(input_id);
	
	const priceSum = $("#priceSum");
	var input_id = document.createElement("input");
	input_id.setAttribute("type", "hidden");
	input_id.setAttribute("name", "totalorderprice");      
	input_id.setAttribute("value", priceSum.val()*1);
	form.appendChild(input_id);
	
	const reserveSum = $("#reserveSum");
	var input_id = document.createElement("input");
	input_id.setAttribute("type", "hidden");
	input_id.setAttribute("name", "reserveSum");      
	input_id.setAttribute("value", reserveSum.val()*1);
	form.appendChild(input_id);
	
	const couponSize = $(".coupon");
	const couponName = $(".couponName");
	for(i = 0 ; i < couponSize.length;i++){
		if(couponSize.eq(i).is(":checked") == true){
			var input_id = document.createElement("input");
			input_id.setAttribute("type", "hidden");
			input_id.setAttribute("name", "couponName");     
			input_id.setAttribute("value", couponName.eq(i).text());
			form.appendChild(input_id);
		}
	}
 	form.submit();
}
</script>
</body>
</html>