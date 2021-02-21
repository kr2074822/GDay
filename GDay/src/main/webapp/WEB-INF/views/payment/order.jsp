<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문/결제</title>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	
	<div id="order-wrapper">
	
	<h1>주문/결제</h1>
	
	<h2>받는 사람 정보</h2>
	<table id="memberInfo">	
		<tr>
			<td>이름</td>
			<td>강성혁</td>
		</tr>
		<tr>
			<td>이메일</td>
			<td>kang2x2@naver.com</td>
		</tr>
		<tr>
			<td>휴대폰 번호</td>
			<td><input type="text" id="phone" name="phone">010-9462-2303</td>
		</tr>	
		<tr>
			<td>배송 주소</td>
			<td><input type="text">우편번호</td>
			<td></td>
		</tr>	
	</table>

	</div>
	



</body>
</html>