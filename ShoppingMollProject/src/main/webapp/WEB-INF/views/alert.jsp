<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath">${pageContext.request.contextPath }</c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ShoppingMoll</title>
</head>
<script>
	alert("${alertContent}");
	window.location = ${pageContext.request.contextPath }/ + "${path}";
</script>
</html>