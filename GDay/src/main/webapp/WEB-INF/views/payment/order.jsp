<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문/결제</title>

<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/payment/order.css" >

</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	
	<div id="order-wrapper">
	
		<h1>주문/결제</h1>
		
		<h2>주문 상품</h2>
		<table id="goods" class="tables">
			<tr id="goods-header">
				<th class="goods-header-th1">상품명</th>
				<th class="goods-header-th2">가격</th>
				<th class="goods-header-th3">수량</th>
			</tr>
			<tr id="goods-list">
				<td class="goods-list">상품명</td>
				<td class="goods-list">1,000</td>
				<td class="goods-list">1개</td>
			</tr>
			
			<tr id="goods-list">
				<td class="goods-list">상품명</td>
				<td class="goods-list">1,000</td>
				<td class="goods-list">1개</td>
			</tr>
		</table>
		
		<br>
		
		
		<h2>주문자 정보</h2>
		<table id="member-info" class="tables">	
			<tr class="member-info-tr">
				<td class="member-info-td">이름</td>
				<td><input size="8" type="text" class="member-info-input" id="member-name" name="member-name" value="강성혁"/></td>
			</tr>
			<tr class="member-info-tr">
				<td class="member-info-td">이메일</td>
				<td><input type="email" class="member-info-input" id="email" name="email" value="kang2x2@naver.com"/></td>
			</tr>
			<tr class="member-info-tr">
				<td class="member-info-td">휴대폰 번호</td>
				<td><input type="tel" class="member-info-input" id="phone" name="phone" value="010-9462-2303"/></td>
			</tr>	
		</table>
	
	
		<h2>배송 주소</h2>
		
		<div id="address-area">
			<h3><i class="fas fa-thumbtack"></i>&nbsp;배송지</h3>
			
			<div class="address-div">
				<input size="8" type="text" class="member-address" id="address1" name="address" value="우편번호"/>
				<button type="button">우편번호 검색</button>
			</div>
			<div class="address-div">
				<input size="30" type="text" class="member-address" id="address2" name="address" value="주소"/>
			</div>
			<div class="address-div">
				<input size="30" type="text" class="member-address" id="address3" name="address" value="상세주소"/>
			</div>	
			
			<button type="button">배송지 변경</button>	
		</div>
		
		
		
		<h2>결제 수단</h2>	
		
		<div id="payment-area">
			<div id="payment-api">
				api 들어가는 곳
			</div>
			
			<div id="payment-other">
				<h3>결제 금액</h3>
				
			</div>
		</div>

	</div>
	



</body>
</html>