<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<div class="container">
  	<div id="main" class="carousel slide" data-ride="carousel">
  		<ul class="carousel-indicators">
    		<li data-target="#main" data-slide-to="0" class="active"></li>
    		<li data-target="#main" data-slide-to="1"></li>
    		<li data-target="#main" data-slide-to="2"></li>
   			<li data-target="#main" data-slide-to="3"></li>
  		</ul>
  		<div class="carousel-inner">
    		<div class="carousel-item active">
      			<img src="${pageContext.request.contextPath}/img/main/mainsc1.jpg">
    		</div>
   			<div class="carousel-item">
     			<img src="${pageContext.request.contextPath}/img/main/mainsc2.jpg">
    		</div>
    		<div class="carousel-item">
      			<img src="${pageContext.request.contextPath}/img/main/mainsc3.jpg"> 
    		</div>
   			<div class="carousel-item">
   			  	<img src="${pageContext.request.contextPath}/img/main/mainsc4.jpg">
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
	<div class="text-center">
		<p style = "font-family:Black Han Sans; font-size: 30px">
			추천상품
		</p>
	</div>
	<div id="recommend" class="carousel slide" data-ride="carousel">
  		<ul class="carousel-indicators">
    		<li data-target="#recommend" data-slide-to="0" class="active"></li>
    		<li data-target="#recommend" data-slide-to="1"></li>
    		<li data-target="#recommend" data-slide-to="2"></li>
  		</ul>
  		<div class="carousel-inner">
    		<div class="carousel-item active">
    			<div class="row">
    				<div class="col-sm-3">
    					<div class="view overlay hm-black-strong">
    						<img src="${pageContext.request.contextPath}/img/main/recommand/recommend01.jpg" class = "img-fluid" style = "width: 100%; height:350px">
                        	<div class="mask flex-center">
        						<p class="white-text">Strong overlay</p>
        					</div>
    					</div>
    				</div>
    				<div class="col-sm-3">
    					<img src="${pageContext.request.contextPath}/img/main/recommand/recommend02.jpg" style = "width: 100%; height:350px">
    				</div>
    				<div class="col-sm-3">
    					<img src="${pageContext.request.contextPath}/img/main/recommand/recommend03.jpg" style = "width: 100%; height:350px">
    				</div>
					<div class="col-sm-3">
						<img src="${pageContext.request.contextPath}/img/main/recommand/recommend04.jpg" style = "width: 100%; height:350px">
    				</div>
    			</div>
    			<br>
    			<div class="row">
    				<div class="col-sm-3">
    					<img src="${pageContext.request.contextPath}/img/main/recommand/recommend05.jpg" style = "width: 100%; height:350px">
    				</div>
    				<div class="col-sm-3">
    					<img src="${pageContext.request.contextPath}/img/main/recommand/recommend06.jpg" style = "width: 100%; height:350px">
    				</div>
    				<div class="col-sm-3">
    					<img src="${pageContext.request.contextPath}/img/main/recommand/recommend07.jpg" style = "width: 100%; height:350px">
    				</div>
					<div class="col-sm-3">
						<img src="${pageContext.request.contextPath}/img/main/recommand/recommend08.jpg" style = "width: 100%; height:350px">
					</div>
    			</div>
   			</div>
			<div class="carousel-item">
    			<div class="row">
    				<div class="col-sm-3">
    					<img src="${pageContext.request.contextPath}/img/main/recommand/recommend11.jpg" style = "width: 100%; height:350px">
    				</div>
    				<div class="col-sm-3">
    					<img src="${pageContext.request.contextPath}/img/main/recommand/recommend12.jpg" style = "width: 100%; height:350px">
    				</div>
    				<div class="col-sm-3">
    					<img src="${pageContext.request.contextPath}/img/main/recommand/recommend13.jpg" style = "width: 100%; height:350px">
    				</div>
					<div class="col-sm-3">
						<img src="${pageContext.request.contextPath}/img/main/recommand/recommend14.jpg" style = "width: 100%; height:350px">
					</div>
    			</div>
    			<br>
    			<div class="row">
    				<div class="col-sm-3">
    					<img src="${pageContext.request.contextPath}/img/main/recommand/recommend15.jpg" style = "width: 100%; height:350px">
    				</div>
    				<div class="col-sm-3">
    					<img src="${pageContext.request.contextPath}/img/main/recommand/recommend16.jpg" style = "width: 100%; height:350px">
    				</div>
    				<div class="col-sm-3">
    					<img src="${pageContext.request.contextPath}/img/main/recommand/recommend17.jpg" style = "width: 100%; height:350px">
    				</div>
					<div class="col-sm-3">
						<img src="${pageContext.request.contextPath}/img/main/recommand/recommend18.jpg" style = "width: 100%; height:350px">
					</div>
    			</div>
    		</div>
			<div class="carousel-item">
    			<div class="row">
    				<div class="col-sm-3">
    					<img src="${pageContext.request.contextPath}/img/main/recommand/recommend21.jpg" style = "width: 100%; height:350px">
    				</div>
    				<div class="col-sm-3">
    					<img src="${pageContext.request.contextPath}/img/main/recommand/recommend22.jpg" style = "width: 100%; height:350px">
    				</div>
    				<div class="col-sm-3">
    					<img src="${pageContext.request.contextPath}/img/main/recommand/recommend23.jpg" style = "width: 100%; height:350px">
    				</div>
					<div class="col-sm-3">
						<img src="${pageContext.request.contextPath}/img/main/recommand/recommend24.jpg" style = "width: 100%; height:350px">
					</div>
    			</div>
    			<br>
    			<div class="row">
    				<div class="col-sm-3">
    					<img src="${pageContext.request.contextPath}/img/main/recommand/recommend25.jpg" style = "width: 100%; height:350px">
    				</div>
    				<div class="col-sm-3">
    					<img src="${pageContext.request.contextPath}/img/main/recommand/recommend26.jpg" style = "width: 100%; height:350px">
    				</div>
    				<div class="col-sm-3">
    					<img src="${pageContext.request.contextPath}/img/main/recommand/recommend27.jpg" style = "width: 100%; height:350px">
    				</div>
					<div class="col-sm-3">
						<img src="${pageContext.request.contextPath}/img/main/recommand/recommend28.jpg" style = "width: 100%; height:350px">
					</div>
    			</div>
    		</div>
  		</div>
	</div>	
</div>
<!-- Footer Include -->
<jsp:include page = "footer.jsp"/>
</body>
</html>

