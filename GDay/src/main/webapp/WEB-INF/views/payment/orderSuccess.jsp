<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<% response.setContentType("text/html; charset=utf-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 완료</title>
<link rel="stylesheet" href="${contextPath}/resources/css/common/reset.css">
<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/payment/order.css" >

</head>
<body>
   <jsp:include page="../common/header.jsp"/>
   
   <div id="order-wrapper">
   
   		<h1>주문이 성공적으로 완료되었습니다.</h1>
		<button onclick="location.href = ''">메인으로</button>
		<button onclick="location.href = ''">선물 보러 가기</button>
		<button onclick="location.href = ''">클래스 보러 가기</button>
   </div>
   

</body>
</html>