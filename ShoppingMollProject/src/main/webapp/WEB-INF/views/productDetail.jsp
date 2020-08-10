<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath">${pageContext.request.contextPath }</c:set>
<!-- Header Include -->
<jsp:include page="header.jsp"/>
<div class="container overlap">
	<div class = "row" style = "margin-top: 60px">
		<div class = "col-sm-4">
			<img src="${cpath}/img/product/${productVO.kind }/${productVO.kind }${productVO.productnumber }-1.jpg" 
			class = "img-fluid" style = "width: 100%; height:350px">
		</div>
		<div class = "col-sm-8">
			<form>
				<table class="table">
		    		<tbody style = "border-top: 2px solid black;">
		      			<tr>
		        			<td class="font-weight-bold"
		        			style = "font-size: 16px; text-align: center;" colspan="2">
		        			<b>${productVO.title }</b>
		        			</td>
		      			</tr>
		      			<tr>
		        			<td
		        			style = "font-size: 12px; text-align: center;" colspan="2">
		        			<b>${productVO.subtitle }</b>
		        			</td>
		      			</tr>
		      			<tr>
		        			<td style = "width:160px; font-size: 13px">
		        				판매가
		        			</td>
		        			<td>
		        				${productVO.price }
		        			</td>
		      			</tr>
		      			<tr>
		        			<td style = "width:160px; font-size: 13px">
		        				컬러
		        			</td>
		        			<td>
		        				<select class="form-control form-control-sm" id = "clothColor" name = "clothColor" 
		        				style = "width:95px; float: left;">
		        					<c:forEach var = "color" items="${colorVO}">
		        						<option value="${color.clothColor }">${color.clothColor }</option>
		        					</c:forEach>
		        				</select>
		        			</td>
		        			
		      			</tr>
		      			<tr>
		        			<td style = "width:160px; font-size: 13px">
		        				사이즈
		        			</td>
		        			<td>
		        				<select class="form-control form-control-sm" id = "clothSize" name = "clothSize" 
		        				style = "width:95px; float: left;">
		        					<c:forEach var = "size" items="${sizesVO}">
		        						<option value="${size.clothSize }">${size.clothSize }</option>
		        					</c:forEach>
		        				</select>
		        				<button type="button" class="btn btn-secondary" onClick="sample2_execDaumPostcode()"
									style="width:64px; margin:0px; margin-left:10px; height:30px; font-size: 12px; 
									background-color: #00000061 !important; padding: 0px;">
										추가
								</button>
		        			</td>
		      			</tr>
		      			<tr>
		      			</tr>
		    		</tbody>
	    		</table>
	    		<hr style = "border-top: 2px solid black;">
    		</form>
		</div>
	</div>

</div>
<!-- Footer Include -->
<jsp:include page = "footer.jsp"/>
</body>
</html>
