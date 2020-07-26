<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  	<!-- Bootstrap관련 CSS -->
    <link rel="stylesheet" 				
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" 
    integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" 
	crossorigin="anonymous"> 
	
	<style>
		@import url('https://fonts.googleapis.com/css2?family=Ranchers&display=swap');
		@import url('https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap');
	</style>

	<title>ShoppingMoll</title>
</head>
<body>
<header>
<div class="container">
	<nav class="navbar navbar-expand-sm bg-light navbar-light">
		<!-- Brand/logo -->
  		<a class="navbar-brand" href="#">
    		<img src="${pageContext.request.contextPath}/img/main/logo.png" alt="logo" style="width:80px;">
  		</a>
  
		<!-- Links -->
		<ul class="navbar-nav mr-auto">
			<li class="nav-item" style="font-family:Ranchers;">
    			<a class="nav-link" href="#">NEW</a>
    		</li>
 			<li class="nav-item" style="font-family:Ranchers;">
   				<a class="nav-link" href="#">OUTER</a>
 			</li>
    		<li class="nav-item" style="font-family:Ranchers;">
      			<a class="nav-link" href="#">TOP</a>
    		</li>
    		<li class="nav-item" style="font-family:Ranchers;">
      			<a class="nav-link" href="#">BOTTOM</a>
    		</li>
    		<li class="nav-item" style="font-family:Ranchers;">
      			<a class="nav-link" href="#">DRESS</a>
    		</li>
    		<li class="nav-item" style="font-family:Ranchers;">
      			<a class="nav-link" href="#">BAG</a>
    		</li>
    		<li class="nav-item" style="font-family:Ranchers;">
      			<a class="nav-link" href="#">SHOSE</a>
    		</li>
    		<li class="nav-item" style="font-family:Ranchers;">
      			<a class="nav-link" href="#">ACCESSORY</a>
    		</li>
  		</ul>

		<!-- Links -->
		<ul class="navbar-nav">
			<li class="nav-item" style="font-family:Nanum Pen Script;">
    			<a class="nav-link" href="#">Login</a>
    		</li>
			<li class="nav-item" style="font-family:Nanum Pen Script;">
   				<a class="nav-link" href="#">Join us</a>
 			</li>
			<li class="nav-item" style="font-family:Nanum Pen Script;">
      			<a class="nav-link" href="#">Cart</a>
    		</li>
			<li class="nav-item" style="font-family:Nanum Pen Script;">
      			<a class="nav-link" href="#">Order</a>
    		</li>
			<li class="nav-item" style="font-family:Nanum Pen Script;">
      			<a class="nav-link" href="#">Mypage</a>
    		</li>
			<li class="nav-item" style="font-family:Nanum Pen Script;">
      			<a class="nav-link" href="#">Community</a>
    		</li>
  		</ul>
	</nav>
</div> 
</header>