<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ShoppingMoll</title>
</head>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/emailjs-com@2.3.2/dist/email.min.js"></script>
<script type="text/javascript">
   (function(){
      emailjs.init("user_wAOnGTB7GJOAaLetrZSWj");
   })();
</script>
<script type="text/javascript">
console.log("실행")
var templateParams = {	
	email: "${usersVO.email}",
	name: "${usersVO.name}",
	password: "${usersVO.password}",
	id:"{usersVO.id}"
};
console.log("메일보내기전")
emailjs.send('ShoppingMall','shoppingmall',templateParams);
console.log("메일보낸후")
alert("귀하의 메일로 임시 비밀번호를 발송하였습니다^^");
window.location = ${pageContext.request.contextPath }/login/;
</script>
<body>

</body>
</html>