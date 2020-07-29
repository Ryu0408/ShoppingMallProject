<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath">${pageContext.request.contextPath }</c:set>
<footer>
<div class="container text-center text-md-left mt-5">
    <!-- Grid row -->
    <div class="row mt-3 dark-grey-text">
      	<div class="col-md-3 col-lg-4 col-xl-3 mb-4">
        	<h6 class="text-uppercase font-weight-bold">CUSTOMER CENTER</h6>
        	<hr class="teal accent-3 mb-4 mt-0 d-inline-block mx-auto" style="width: 60px;">
	        <br>
        	<img src="${cpath}/img/footer/tel.jpg" alt="tel" style="width:20px;">
        	<h3 style='display:inline; vertical-align: middle;'>1555-5555</h3>
        	<br>
        	<br>
       		<p style = "font-family:Nanum Pen Script;">
        		MON-FRI AM 10:00 ~ PM 05:00<br>
        		LUNCH PM 12:00 ~ 01:00<br>
        		SAT, SUN, HOLIDAY OFF
        	</p>
      	</div>
  		<div class="col-md-2 col-lg-2 col-xl-2 mx-auto mb-4">
        	<h6 class="text-uppercase font-weight-bold">ACCOUNT INFO</h6>
        	<hr class="teal accent-3 mb-4 mt-0 d-inline-block mx-auto" style="width: 60px;">
       		<p style = "font-family:Nanum Pen Script;">
        		신한 110-248-445116<br><br>
        		예금주 : 류승환<br>
        	</p>
     	</div>
		<div class="col-md-3 col-lg-2 col-xl-2 mx-auto mb-4">
      		<h6 class="text-uppercase font-weight-bold">FAVORITE MENU</h6>
        	<hr class="teal accent-3 mb-4 mt-0 d-inline-block mx-auto" style="width: 60px;">
       		<p style = "font-family:Nanum Pen Script;">
         		<a class="dark-grey-text" href="${cpath}/login/" style="text-decoration: none; color:#212529;">로그인</a>
        	</p>
        	<p style = "font-family:Nanum Pen Script;">
          		<a class="dark-grey-text" href="${cpath}/join/" style="text-decoration: none; color:#212529;">회원가입</a>
        	</p>
        	<p style = "font-family:Nanum Pen Script;">
          		<a class="dark-grey-text" href="#!" style="text-decoration: none; color:#212529;">관심상품</a>
        	</p>
        	<p style = "font-family:Nanum Pen Script;">
          		<a class="dark-grey-text" href="#!" style="text-decoration: none; color:#212529;">장바구니</a>
        	</p>
        	<p style = "font-family:Nanum Pen Script;">
        		<a class="dark-grey-text" href="#!" style="text-decoration: none; color:#212529;">주문조회</a>
        	</p>
        	<p style = "font-family:Nanum Pen Script;">
        		<a class="dark-grey-text" href="#!" style="text-decoration: none; color:#212529;">마이페이지</a>
        	</p>
      	</div>
      	<div class="col-md-4 col-lg-3 col-xl-3 mx-auto mb-md-0 mb-4">
        	<h6 class="text-uppercase font-weight-bold">RETURN / EXCHANGE</h6>
        	<hr class="teal accent-3 mb-4 mt-0 d-inline-block mx-auto" style="width: 60px;">
        	<p style = "font-family:Nanum Pen Script;">
				부산광역시 연제구 묘봉산로 4 한일UNI APT 101동 402호<br><br>
				자세한 교환 반품절차 안내는 문의란 및 공지사항을 참고해주세요
        	</p>
      	</div>
    </div>
</div>
<div class="container">
	<div class="footer-copyright text-center text-black-50 py-3 b bg-light">
  	 	<p style = "font-family:Nanum Pen Script;">
			COMPANY : <b class="font-weight-bold">SH브랜드</b>	/ OWNER : <b class="font-weight-bold">류승환</b> / BUSINESS LICENSE : <b class="font-weight-bold">2008211609</b><br>
			ADDRESS : <b class="font-weight-bold">부산광역시 연제구 묘봉산로 4 한일UNI APT 101동 402호</b> / TEL : <b class="font-weight-bold">1555-5555</b><br>
			MALL-ORDER LICENSE : 신고준비중 / CEO : <b class="font-weight-bold">류승환(fbtmdghks11@naver.com)</b> / CONTACT US : 
			<a href="mailto:fbtmdghks11@naver.com"><img src="${cpath}/img/footer/mail.png" alt="mail" style="width:20px;"></a><br>
			<b class="font-weight-bold">2020 Copyright © SH브랜드 ALL RIGHTS RESERVED. HOSTING CAFE24 | DESIGNED By SH</b><br>
		</p>
	</div>
</div>
</footer>

<!-- Optional JavaScript -->
<!-- jQuery, then Popper.js, then Bootstrap JS -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" 
integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" 
integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
<script type="text/javascript" src="${cpath}/js/mdb.min.js"></script>