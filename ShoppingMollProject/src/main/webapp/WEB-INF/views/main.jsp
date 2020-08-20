<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath">${pageContext.request.contextPath }</c:set>
<!-- Header Include -->
<jsp:include page="header.jsp"/>
<style>
.carousel-inner img {
	width: 100%;
    height: 100%;
}
.carousel-indicators li {
    width: 20px;
    height: 20px;
    border-radius: 100%;
    background-color:black;
    border-top: transparent;
    border-bottom: transparent
}
</style>
<div class="container overlap">
  	<div id="main" class="carousel slide" data-ride="carousel">
  		<ul class="carousel-indicators">
    		<li data-target="#main" data-slide-to="0" class="active"></li>
    		<li data-target="#main" data-slide-to="1"></li>
    		<li data-target="#main" data-slide-to="2"></li>
   			<li data-target="#main" data-slide-to="3"></li>
  		</ul>
  		<div class="carousel-inner">
    		<div class="carousel-item active">
      			<img src="${cpath}/img/main/mainsc1.jpg">
    		</div>
   			<div class="carousel-item">
     			<img src="${cpath}/img/main/mainsc2.jpg">
    		</div>
    		<div class="carousel-item">
      			<img src="${cpath}/img/main/mainsc3.jpg"> 
    		</div>
   			<div class="carousel-item">
   			  	<img src="${cpath}/img/main/mainsc4.jpg">
    		</div>
  		</div>
  		<a class="carousel-control-prev" href="#main" data-slide="prev">
    		<span class="carousel-control-prev-icon"></span>
  		</a>
  		<a class="carousel-control-next" href="#main" data-slide="next">
    		<span class="carousel-control-next-icon"></span>
  		</a>
	</div>
	<br>
	<br>
	<div class="text-center">
		<p style = "font-family:Black Han Sans; font-size: 30px">
			신상품
		</p>
	</div>
	  	<c:forEach var = "productVO" items="${listProductVO}" varStatus="st">
  		<c:if test="${st.index % 4 == 0 }">
  	<div class = "row">
  		</c:if>
		<div class="col-sm-3">
			<div class="view overlay" style = "text-align: center;">
				<a href = "${cpath}/productdetail/${productVO.productnumber }/">
				<img src="${cpath}/img/product/${productVO.kind }/${productVO.kind }${productVO.productnumber }-1.jpg" 
				class = "img-fluid" style = "width: 100%; height:350px"></a>
				<br>
				<a href = "${cpath}/productdetail/${productVO.productnumber }/" style = "color: black;">
				<p class="font-weight-bold" style="font-family:Single Day;">${productVO.title }</p>
				</a>
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
	<br>
	<div class="text-center">
		<p style = "font-family:Black Han Sans; font-size: 30px">
			REVIEW
		</p>
	</div>
	<div class="row" style="border-top: 1px solid gray">
		<div class="col-sm-2" style = "text-align: center;">	
			<br>
			<img src="${cpath}/img/main/recommand/recommend01.jpg" class = "img-fluid" style = "width: 110px; height:110px">
		</div>
		<div class="col-sm-10">
			<br>
			<p style="font-family:Single Day; color: gray">[빈티지한 무드] 플라워 루즈핏 셔츠/포인트 주기 좋아요!</p>
			<p class="font-weight-bold" style="font-family:Single Day;">너무 이뻐요~~~200%만족입니다!!</p>
			<p style="font-family:Single Day; color: black">
				진~~짜 짱 넘 이뻐요 만족도 끝판왕이구요 퍼프는 적당한 느낌에 원단은 제가 원하는 바스락 느낌이에요 ! 딱 어깨도 살아있고 슬랙스나 롱한 와이드 연청에 입으면 이쁠것같아요 바로 다른컬러도 구매했습니다!! 진짜 색상 다양하게 찐한 블루나 노랑 오렌지 여러 컬러있었으면 다 샀을것같아요ㅠㅠ 다른 컬로도 추가로 만들어주시면 좋겠당 ...❤️🥺❤️ 가격도 만족!!! 좋은 옷 많이 판매해주세요❤️❤️❤️❤️❤️❤️❤️❤️
			</p>
		</div>
	</div>
	<div class="row" style="border-top: 1px solid gray">
		<div class="col-sm-2" style = "text-align: center;">	
			<br>
			<img src="${cpath}/img/main/recommand/recommend01.jpg" class = "img-fluid" style = "width: 110px; height:110px">
		</div>
		<div class="col-sm-10">
			<br>
			<p style="font-family:Single Day; color: gray">[빈티지한 무드] 플라워 루즈핏 셔츠/포인트 주기 좋아요!</p>
			<p class="font-weight-bold" style="font-family:Single Day;">너무 이뻐요~~~200%만족입니다!!</p>
			<p style="font-family:Single Day; color: black">
				진~~짜 짱 넘 이뻐요 만족도 끝판왕이구요 퍼프는 적당한 느낌에 원단은 제가 원하는 바스락 느낌이에요 ! 딱 어깨도 살아있고 슬랙스나 롱한 와이드 연청에 입으면 이쁠것같아요 바로 다른컬러도 구매했습니다!! 진짜 색상 다양하게 찐한 블루나 노랑 오렌지 여러 컬러있었으면 다 샀을것같아요ㅠㅠ 다른 컬로도 추가로 만들어주시면 좋겠당 ...❤️🥺❤️ 가격도 만족!!! 좋은 옷 많이 판매해주세요❤️❤️❤️❤️❤️❤️❤️❤️
			</p>
		</div>
	</div>
	<div class="row" style="border-top: 1px solid gray">
		<div class="col-sm-2" style = "text-align: center;">	
			<br>
			<img src="${cpath}/img/main/recommand/recommend01.jpg" class = "img-fluid" style = "width: 110px; height:110px">
		</div>
		<div class="col-sm-10">
			<br>
			<p style="font-family:Single Day; color: gray">[빈티지한 무드] 플라워 루즈핏 셔츠/포인트 주기 좋아요!</p>
			<p class="font-weight-bold" style="font-family:Single Day;">너무 이뻐요~~~200%만족입니다!!</p>
			<p style="font-family:Single Day; color: black">
				진~~짜 짱 넘 이뻐요 만족도 끝판왕이구요 퍼프는 적당한 느낌에 원단은 제가 원하는 바스락 느낌이에요 ! 딱 어깨도 살아있고 슬랙스나 롱한 와이드 연청에 입으면 이쁠것같아요 바로 다른컬러도 구매했습니다!! 진짜 색상 다양하게 찐한 블루나 노랑 오렌지 여러 컬러있었으면 다 샀을것같아요ㅠㅠ 다른 컬로도 추가로 만들어주시면 좋겠당 ...❤️🥺❤️ 가격도 만족!!! 좋은 옷 많이 판매해주세요❤️❤️❤️❤️❤️❤️❤️❤️
			</p>
		</div>
	</div>
	<div class="row" style="border-top: 1px solid gray">
		<div class="col-sm-2" style = "text-align: center;">	
			<br>
			<img src="${cpath}/img/main/recommand/recommend01.jpg" class = "img-fluid" style = "width: 110px; height:110px">
		</div>
		<div class="col-sm-10">
			<br>
			<p style="font-family:Single Day; color: gray">[빈티지한 무드] 플라워 루즈핏 셔츠/포인트 주기 좋아요!</p>
			<p class="font-weight-bold" style="font-family:Single Day;">너무 이뻐요~~~200%만족입니다!!</p>
			<p style="font-family:Single Day; color: black">
				진~~짜 짱 넘 이뻐요 만족도 끝판왕이구요 퍼프는 적당한 느낌에 원단은 제가 원하는 바스락 느낌이에요 ! 딱 어깨도 살아있고 슬랙스나 롱한 와이드 연청에 입으면 이쁠것같아요 바로 다른컬러도 구매했습니다!! 진짜 색상 다양하게 찐한 블루나 노랑 오렌지 여러 컬러있었으면 다 샀을것같아요ㅠㅠ 다른 컬로도 추가로 만들어주시면 좋겠당 ...❤️🥺❤️ 가격도 만족!!! 좋은 옷 많이 판매해주세요❤️❤️❤️❤️❤️❤️❤️❤️
			</p>
		</div>
	</div>
	<div class="row" style="border-top: 1px solid gray">
		<div class="col-sm-2" style = "text-align: center;">	
			<br>
			<img src="${cpath}/img/main/recommand/recommend01.jpg" class = "img-fluid" style = "width: 110px; height:110px">
		</div>
		<div class="col-sm-10">
			<br>
			<p style="font-family:Single Day; color: gray">[빈티지한 무드] 플라워 루즈핏 셔츠/포인트 주기 좋아요!</p>
			<p class="font-weight-bold" style="font-family:Single Day;">너무 이뻐요~~~200%만족입니다!!</p>
			<p style="font-family:Single Day; color: black">
				진~~짜 짱 넘 이뻐요 만족도 끝판왕이구요 퍼프는 적당한 느낌에 원단은 제가 원하는 바스락 느낌이에요 ! 딱 어깨도 살아있고 슬랙스나 롱한 와이드 연청에 입으면 이쁠것같아요 바로 다른컬러도 구매했습니다!! 진짜 색상 다양하게 찐한 블루나 노랑 오렌지 여러 컬러있었으면 다 샀을것같아요ㅠㅠ 다른 컬로도 추가로 만들어주시면 좋겠당 ...❤️🥺❤️ 가격도 만족!!! 좋은 옷 많이 판매해주세요❤️❤️❤️❤️❤️❤️❤️❤️
			</p>
		</div>
	</div>
	<div class="row" style="border-top: 1px solid gray">
		<div class="col-sm-2" style = "text-align: center;">	
			<br>
			<img src="${cpath}/img/main/recommand/recommend01.jpg" class = "img-fluid" style = "width: 110px; height:110px">
		</div>
		<div class="col-sm-10">
			<br>
			<p style="font-family:Single Day; color: gray">[빈티지한 무드] 플라워 루즈핏 셔츠/포인트 주기 좋아요!</p>
			<p class="font-weight-bold" style="font-family:Single Day;">너무 이뻐요~~~200%만족입니다!!</p>
			<p style="font-family:Single Day; color: black">
				진~~짜 짱 넘 이뻐요 만족도 끝판왕이구요 퍼프는 적당한 느낌에 원단은 제가 원하는 바스락 느낌이에요 ! 딱 어깨도 살아있고 슬랙스나 롱한 와이드 연청에 입으면 이쁠것같아요 바로 다른컬러도 구매했습니다!! 진짜 색상 다양하게 찐한 블루나 노랑 오렌지 여러 컬러있었으면 다 샀을것같아요ㅠㅠ 다른 컬로도 추가로 만들어주시면 좋겠당 ...❤️🥺❤️ 가격도 만족!!! 좋은 옷 많이 판매해주세요❤️❤️❤️❤️❤️❤️❤️❤️
			</p>
		</div>
	</div>
	<div class="row" style="border-top: 1px solid gray">
		<div class="col-sm-2" style = "text-align: center;">	
			<br>
			<img src="${cpath}/img/main/recommand/recommend01.jpg" class = "img-fluid" style = "width: 110px; height:110px">
		</div>
		<div class="col-sm-10">
			<br>
			<p style="font-family:Single Day; color: gray">[빈티지한 무드] 플라워 루즈핏 셔츠/포인트 주기 좋아요!</p>
			<p class="font-weight-bold" style="font-family:Single Day;">너무 이뻐요~~~200%만족입니다!!</p>
			<p style="font-family:Single Day; color: black">
				진~~짜 짱 넘 이뻐요 만족도 끝판왕이구요 퍼프는 적당한 느낌에 원단은 제가 원하는 바스락 느낌이에요 ! 딱 어깨도 살아있고 슬랙스나 롱한 와이드 연청에 입으면 이쁠것같아요 바로 다른컬러도 구매했습니다!! 진짜 색상 다양하게 찐한 블루나 노랑 오렌지 여러 컬러있었으면 다 샀을것같아요ㅠㅠ 다른 컬로도 추가로 만들어주시면 좋겠당 ...❤️🥺❤️ 가격도 만족!!! 좋은 옷 많이 판매해주세요❤️❤️❤️❤️❤️❤️❤️❤️
			</p>
		</div>
	</div>
	<div class="row" style="border-top: 1px solid gray">
		<div class="col-sm-2" style = "text-align: center;">	
			<br>
			<img src="${cpath}/img/main/recommand/recommend01.jpg" class = "img-fluid" style = "width: 110px; height:110px">
		</div>
		<div class="col-sm-10">
			<br>
			<p style="font-family:Single Day; color: gray">[빈티지한 무드] 플라워 루즈핏 셔츠/포인트 주기 좋아요!</p>
			<p class="font-weight-bold" style="font-family:Single Day;">너무 이뻐요~~~200%만족입니다!!</p>
			<p style="font-family:Single Day; color: black">
				진~~짜 짱 넘 이뻐요 만족도 끝판왕이구요 퍼프는 적당한 느낌에 원단은 제가 원하는 바스락 느낌이에요 ! 딱 어깨도 살아있고 슬랙스나 롱한 와이드 연청에 입으면 이쁠것같아요 바로 다른컬러도 구매했습니다!! 진짜 색상 다양하게 찐한 블루나 노랑 오렌지 여러 컬러있었으면 다 샀을것같아요ㅠㅠ 다른 컬로도 추가로 만들어주시면 좋겠당 ...❤️🥺❤️ 가격도 만족!!! 좋은 옷 많이 판매해주세요❤️❤️❤️❤️❤️❤️❤️❤️
			</p>
		</div>
	</div>
	<div class="row" style="border-top: 1px solid gray">
		<div class="col-sm-2" style = "text-align: center;">	
			<br>
			<img src="${cpath}/img/main/recommand/recommend01.jpg" class = "img-fluid" style = "width: 110px; height:110px">
		</div>
		<div class="col-sm-10">
			<br>
			<p style="font-family:Single Day; color: gray">[빈티지한 무드] 플라워 루즈핏 셔츠/포인트 주기 좋아요!</p>
			<p class="font-weight-bold" style="font-family:Single Day;">너무 이뻐요~~~200%만족입니다!!</p>
			<p style="font-family:Single Day; color: black">
				진~~짜 짱 넘 이뻐요 만족도 끝판왕이구요 퍼프는 적당한 느낌에 원단은 제가 원하는 바스락 느낌이에요 ! 딱 어깨도 살아있고 슬랙스나 롱한 와이드 연청에 입으면 이쁠것같아요 바로 다른컬러도 구매했습니다!! 진짜 색상 다양하게 찐한 블루나 노랑 오렌지 여러 컬러있었으면 다 샀을것같아요ㅠㅠ 다른 컬로도 추가로 만들어주시면 좋겠당 ...❤️🥺❤️ 가격도 만족!!! 좋은 옷 많이 판매해주세요❤️❤️❤️❤️❤️❤️❤️❤️
			</p>
		</div>
	</div>
	<div class="row" style="border-top: 1px solid gray">
		<div class="col-sm-2" style = "text-align: center;">	
			<br>
			<img src="${cpath}/img/main/recommand/recommend01.jpg" class = "img-fluid" style = "width: 110px; height:110px">
		</div>
		<div class="col-sm-10">
			<br>
			<p style="font-family:Single Day; color: gray">[빈티지한 무드] 플라워 루즈핏 셔츠/포인트 주기 좋아요!</p>
			<p class="font-weight-bold" style="font-family:Single Day;">너무 이뻐요~~~200%만족입니다!!</p>
			<p style="font-family:Single Day; color: black">
				진~~짜 짱 넘 이뻐요 만족도 끝판왕이구요 퍼프는 적당한 느낌에 원단은 제가 원하는 바스락 느낌이에요 ! 딱 어깨도 살아있고 슬랙스나 롱한 와이드 연청에 입으면 이쁠것같아요 바로 다른컬러도 구매했습니다!! 진짜 색상 다양하게 찐한 블루나 노랑 오렌지 여러 컬러있었으면 다 샀을것같아요ㅠㅠ 다른 컬로도 추가로 만들어주시면 좋겠당 ...❤️🥺❤️ 가격도 만족!!! 좋은 옷 많이 판매해주세요❤️❤️❤️❤️❤️❤️❤️❤️
			</p>
		</div>
	</div>
	<div style="border-top: 1px solid gray; text-align: center;">
		<br>
		<button type="button" class="btn btn-secondary">상품리뷰 모두보기</button>
	</div>
</div>
<!-- Footer Include -->
<jsp:include page = "footer.jsp"/>
</body>
</html>

