<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath">${pageContext.request.contextPath }</c:set>
<!-- Header Include -->
<jsp:include page="header.jsp"/>
<style>
.tdStyle{
	background: white; 
	font-size:13px; 
	color: black;
	text-align: center;
}
</style>
<div class="container overlap">
	<div class = "row" style = "margin-top: 60px">
		<div class = "col-sm-4">
			<img src="${cpath}/img/product/${productVO.kind }/${productVO.kind }${productVO.productnumber }-1.jpg" 
			class = "img-fluid" style = "width: 100%; height:490px">
		</div>
		<div class = "col-sm-8">
			<form>
				<table class="table" style = "margin:0px;">
		    		<tbody class = "addList" style = "border-top: 2px solid black;">
		      			<tr>
		        			<td class="font-weight-bold"
		        			style = "font-size: 16px; text-align: center;" colspan="3">
		        			<b>${productVO.title }</b>
		        			</td>
		      			</tr>
		      			<tr>
		        			<td
		        			style = "font-size: 12px; text-align: center;" colspan="3">
		        			<b>${productVO.subtitle }</b>
		        			</td>
		      			</tr>
		      			<tr>
		        			<td style = "font-size: 13px; width:25%">
		        				판매가
		        			</td>
		        			<td colspan="2">
		        				${productVO.price }
		        			</td>
		      			</tr>
		      			<tr>
		        			<td style = "font-size: 13px">
		        				컬러
		        			</td>
		        			<td colspan="2">
		        				<select class="form-control form-control-sm color" id = "clothColor" name = "clothColor" 
		        				style = "width:95px; float: left;">
		        					<c:forEach var = "color" items="${colorVO}">
		        						<option value="${color.clothColor }">${color.clothColor }</option>
		        					</c:forEach>
		        				</select>
		        			</td>
		        			
		      			</tr>
		      			<tr>
		        			<td style = "font-size: 13px">
		        				사이즈
		        			</td>
		        			<td colspan="2">
		        				<select class="form-control form-control-sm size" id = "clothSize" name = "clothSize" 
		        				style = "width:95px; float: left;">
		        					<c:forEach var = "size" items="${sizesVO}">
		        						<option value="${size.clothSize }">${size.clothSize }</option>
		        					</c:forEach>
		        				</select>
		        				<button type="button" class="btn btn-secondary" onClick="addProduct()"
									style="width:64px; margin:0px; margin-left:10px; height:30px; font-size: 12px; 
									background-color: #00000061 !important; padding: 0px;">
										추가
								</button>
		        			</td>
		      			</tr >
		      			<tr>
		        			<td style = "width:160px; font-size: 13px">
		        				상품컬러(사이즈)
		        			</td>
		        			<td style = "width:160px; font-size: 13px; text-align:center;">
		        				상품수
		        			</td>
		        			<td style = "width:160px; font-size: 13px; text-align:center;">
		        				가격
		        			</td>
		      			</tr>
		    		</tbody>
	    		</table>
				<table class="table">
		    		<tbody id = "productSum">
	    				<tr>
		        			<td style = "font-size: 13px; width:76%">
	    						합계
	    					</td> 
	    					<td id = "total" class = "font-weight-bold" st></td>
	    				</tr>
	    			</tbody>
	    		</table>
	    		<hr style = "border-top: 2px solid black;">
    		</form>
			<button type="button" class="btn btn-secondary" onClick="order()"
				style="width:90px; margin:0px; margin-left:10px; height:50px; font-size: 12px; 
				background-color: #000000 !important; padding: 0px;">
					상품구매
			</button>
			<button type="button" class="btn btn-secondary" onClick="addCart()"
				style="width:90px; margin:0px; margin-left:20px; height:50px; font-size: 12px; 
				background-color: #00000061 !important; padding: 0px;">
					장바구니
			</button>
		</div>
	</div>
</div>
<!-- Footer Include -->
<jsp:include page = "footer.jsp"/>
<script>
var i = 0;
function addProduct(){
	var rgx3 = /,/gi;
	var color = $(".color").val();
	var size = $(".size").val();
	var price = "${productVO.price}"
	$(".addList").
	append('<tr id = tr' + i + ' class="cartList">' +
				'<td class = "selectProduct">' + color + '(' + size + ')' +
				'<input type="button" class="btn btn-secondary" onClick="deleteProduct('+i+'\, \''+price+'\')"'+' ' +
					'style="width:30px; margin:0px; margin-left:20px; height:23px; font-size: 12px;'+
					'background-color: #000000f7 !important; padding: 0px;" value = "삭제">'+
				'</button>'+
				 '</td>' +
				'<td class = "tdStyle" style = "vertical-align:middle;">' +
					'<input type ="text" class= "form-control form-control-sm changeQuantity"' +
					'style = "width: 34px;height: 30px; text-align: center; margin: 0 auto;" value = "1" readonly>' +
					'<a id="increaseQuantity' + i + '" onclick="increaseQuantity(' + i + ')">' +
						'<img src="${cpath}/img/cart/btnup.gif"></a>' +
					'<a id="decreaseQuantity' + i + '" onclick="decreaseQuantity(' + i + ')">' +
						'<img src="${cpath}/img/cart/btndown.gif"></a>' + 
				'</td>' + 
				'<td class="sell" style="text-align:center;">' + price +
				'</td>' + 

			'</tr>'
	);
	price = (price.replace(rgx3,"").replace("원","")) * 1;
	var total = ($("#total").text().replace(rgx3,"").replace("원","")) * 1;
	total = (total + price).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + "원";
	$("#total").text(total);
	i++;
}
function increaseQuantity(i){
	var count = $("#increaseQuantity" + i).parent().children(".form-control").val();
	count = count * 1;
	if(count >= 99){
		alert('수량은 최소 100개 미만입니다.');
	}
	else
	{
		count = count + 1;
		$("#increaseQuantity" + i).parent().children(".form-control").val(count);
		var state = $("#increaseQuantity" + i);
		changeMoney(state, count, '-1');
	}
}
function decreaseQuantity(i){
	var count = $("#decreaseQuantity" + i).parent().children(".form-control").val();
	count = count * 1;
	if(count <= 1){
		alert('수량은 최소 1개 이상입니다.');
	}
	else
	{
		count = count - 1;
		$("#decreaseQuantity" + i).parent().children(".form-control").val(count);
		var state =  $("#decreaseQuantity" + i)
		changeMoney(state, count, '1');
	}
}
function changeMoney(state, newValue, calculable){
	var rgx3 = /,/gi;
	calculable = calculable * 1;
	sell = state.parent().parent().children(".sell").text().replace(rgx3,"").replace("원","");
	var totals= 0;
	sell = sell / (newValue + calculable);
	var total = ($("#total").text().replace(rgx3,"").replace("원","")) * 1;
	if(calculable === -1){
		total = (total + sell).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + "원";
	}else{
		total = (total - sell).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + "원";		
	}
	$("#total").text(total);
	var sum = sell * newValue;
	sum = sum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + "원";
	state.parent().parent().children(".sell").text(sum);
}
function addCart(){
	const productnumber = "${productVO.productnumber }"
	const colors = $(".selectProduct");
	const amount = $(".changeQuantity");
	var productArray = new Array();
	if(colors.length == 0){
		alert("선택된 상품이 없습니다.");
		return;
	}else{
		for(i = 0 ; i< colors.length ; i++){
			productArray.push({
				productnumber : productnumber,
				color : colors.eq(i).text(),
				amount : amount.eq(i).val(),
			})
		}
	}
	$.ajax({
		url:"${cpath}/productaddcart/",
		method:"POST",
        data: JSON.stringify(productArray),
        dataType:'json',
        async:false,
        contentType :'application/json',
		success : function(data) {
			alert(data);
			window.location = "${pageContext.request.contextPath }/productdetail/${productVO.productnumber}/";
		},
		error:function(data){
			console.log("실패");
		}
	})
}
function deleteProduct(index, price){
	var rgx3 = /,/gi;
	price = price.replace(rgx3,"").replace("원","");
	var total = ($("#total").text().replace(rgx3,"").replace("원","")) * 1;
	total = (total - price).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + "원";		
	$("#total").text(total);
	$('#tr'+index).remove();
}
function order(){
	var rgx3 = /,/gi;
	var form = document.createElement("form");
	const amount = $(".changeQuantity");
	var price = "${productVO.price}"
	var cartList = $(".cartList");
	price = (price.replace(rgx3,"").replace("원","")) * 1;
	form.setAttribute("method","post");
	form.setAttribute("action", "${cpath}/order/productDetail/");
	document.body.appendChild(form);
	for(i=0;i<cartList.length;i++){
		var input_id = document.createElement("input");
		input_id.setAttribute("type", "hidden");
		input_id.setAttribute("name", "productnumber");      
		input_id.setAttribute("value", ${productVO.productnumber });        
		form.appendChild(input_id);
		var input_id = document.createElement("input");
		input_id.setAttribute("type", "hidden");
		input_id.setAttribute("name", "amount");      
		input_id.setAttribute("value", amount.eq(i).val());
		form.appendChild(input_id);  
		var input_id = document.createElement("input");
		input_id.setAttribute("type", "hidden");
		input_id.setAttribute("name", "price");      
		input_id.setAttribute("value", price);
		form.appendChild(input_id);  
		var input_id = document.createElement("input");
		input_id.setAttribute("type", "hidden");
		input_id.setAttribute("name", "colorAndSize");      
		input_id.setAttribute("value", cartList.eq(i).children(".selectProduct").text());
		form.appendChild(input_id);  
	}
	form.submit();
}
</script>
</body>
</html>
