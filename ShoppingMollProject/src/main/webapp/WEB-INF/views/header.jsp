<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath">${pageContext.request.contextPath }</c:set>
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
	<link href="${cpath}/css/mdb.min.css" rel="stylesheet">
	
	<style>
		@import url('https://fonts.googleapis.com/css2?family=Ranchers&display=swap');
		@import url('https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap');
		@import url('https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap');
		@import url('https://fonts.googleapis.com/css2?family=Single+Day&display=swap');	
		.overlap{ padding-top: 90px; }
		@media screen and (max-width: 575px) {
   			 .overlap{ padding-top: 305px; }
   		}
   		.agreeForm{
			border: 1px solid #80808024; 
			background: #fafafa;
			padding: 20px;
		}
	</style>

	<title>ShoppingMoll</title>
</head>
<body>
<header>
<div class="container fixed-top">
	<nav class="navbar navbar-expand-sm bg-light navbar-light">
		<!-- Brand/logo -->
  		<a class="navbar-brand" href="${cpath}/">
    		<img src="${cpath}/img/header/logo.png" alt="logo" style="width:80px;">
  		</a>
  
		<!-- Links -->
		<ul class="navbar-nav mr-auto">
			<li class="nav-item" style="font-family:Ranchers;">
    			<a class="nav-link" href="${cpath}/productpage/new/newSort/1/">NEW</a>
    		</li>
 			<li class="nav-item" style="font-family:Ranchers;">
   				<a class="nav-link" href="${cpath}/productpage/outer/newSort/1/">OUTER</a>
 			</li>
    		<li class="nav-item" style="font-family:Ranchers;">
      			<a class="nav-link" href="${cpath}/productpage/top/newSort/1/">TOP</a>
    		</li>
    		<li class="nav-item" style="font-family:Ranchers;">
      			<a class="nav-link" href="${cpath}/productpage/skirt/newSort/1/">SKIRT</a>
    		</li>
    		<li class="nav-item" style="font-family:Ranchers;">
      			<a class="nav-link" href="${cpath}/productpage/dress/newSort/1/">DRESS</a>
    		</li>
    		<li class="nav-item" style="font-family:Ranchers;">
      			<a class="nav-link" href="${cpath}/productpage/pants/newSort/1/">PANTS</a>
    		</li>
    		<li class="nav-item" style="font-family:Ranchers;">
      			<a class="nav-link" href="${cpath}/productpage/accessory/newSort/1/">ACCESSORY</a>
    		</li>
  		</ul>

		<!-- Links -->
		<ul class="navbar-nav">
			<c:if test="${sessionScope.sessionID == null }">
			<li class="nav-item" style="font-family:Nanum Pen Script;">
    			<a class="nav-link" href="${cpath}/login/">Login</a>
    		</li>
    		</c:if>
    		<c:if test="${sessionScope.sessionID != null }">
			<li class="nav-item" style="font-family:Nanum Pen Script;">
    			<a class="nav-link" href="${cpath}/logout/">Logout</a>
    		</li>
    		</c:if>
    		<c:if test="${sessionScope.sessionID == null }">
			<li class="nav-item" style="font-family:Nanum Pen Script;">
   				<a class="nav-link" href="${cpath}/join/">Join us</a>
 			</li>
    		</c:if>
    		<c:if test="${sessionScope.sessionID != null }">
			<li class="nav-item" style="font-family:Nanum Pen Script;">
      			<a class="nav-link" href="${cpath}/mypage/">Mypage</a>
    		</li>
    		</c:if>
			<li class="nav-item" style="font-family:Nanum Pen Script;">
      			<a class="nav-link" href="${cpath}/cart/">Cart</a>
    		</li>
			<li class="nav-item" style="font-family:Nanum Pen Script;">
      			<a class="nav-link" href="${cpath}/board/?kind=notice&curPage=1&searchOption=title">Notice</a>
    		</li>
    		<li class="nav-item" style="font-family:Nanum Pen Script;">
      			<a class="nav-link" href="${cpath}/board/?kind=qna&curPage=1&searchOption=title">Q&A</a>
    		</li>
    		<li class="nav-item" style="font-family:Nanum Pen Script;">
      			<a class="nav-link" href="${cpath}/review/">REVIEW</a>
    		</li>
  		</ul>
	</nav>
</div> 
</header>