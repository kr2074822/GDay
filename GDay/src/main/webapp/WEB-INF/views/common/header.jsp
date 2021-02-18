<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<style>
	</style>

	<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/header.css" >
	<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
</head>
<body>
	<div id="headerWrapper">
	
		<c:set var="contextPath" value="${pageContext.servletContext.contextPath}" scope="application"/>
	
		<div id="logo">
			로고${contextPath}123
		</div>
		
		<div id="header-menu">
			<ul id="header-ul">
				<li class="header-li"><a href="#">선물찾기</a></li>
				<li class="header-li"><a href="#">클래스찾기</a></li>
				<li class="header-li"><a href="#">마이캘린더</a></li>
				<li class="header-li"><a href="#">매거진</a></li>
			</ul>
		</div>
		
		<div id="hemberger">
			<i class="fas fa-bars"></i>	
			<a href="payment/order">주문</a>
		</div>	
			
	</div>

	<script>

	</script>

</body>
</html>