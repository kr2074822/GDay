<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
   <link rel="stylesheet" href="${contextPath}/resources/css/common/reset.css">
   <link rel="stylesheet" href="${contextPath}/resources/css/mypage/gMemSidebar.css"/>
   <link rel="stylesheet" href="${contextPath}/resources/css/mypage/memberCart.css"/>
   
</head>
<body>
	<jsp:include page="../../common/header.jsp"/>	
	
	<div id="cart-wrapper">
	
	<jsp:include page="gMemSidebar.jsp"/>
	
		<div id="select-area">
			<button id="gift-btn">선물</button>
			<button id="class-btn">클래스</button>
		</div>
	
	
		<!-- 선물 부분 -->
		<c:if test="${empty bList}">
			장바구니가 비어있습니다.
		</c:if>
		
		<c:if test="${!empty bList}">
			<div id="gift-list-area">
				<ul id="cart-list">
					<li><input type="checkbox" style="margin-bottom: 10px;"/>&nbsp; 전체 선택</li>
					<c:forEach var="cartItem" items="${bList}" varStatus="vs">	
						<c:if test="${cartItem.prdtType eq 'G' }">	
							<li class="cart-content">
								<i class="cancle-icon fas fa-times"></i>
								<input type="checkbox"/>
								<div class="img-box"> 
									<c:forEach items="${thList}" var="th">
										<c:if test="${th.prdtNo == cartItem.prdtNo}">								
											<img src="${contextPath}${th.filePath}/${th.fileName}">										
										</c:if>
									</c:forEach> 
								</div>					
								<span class="product-name" title="${cartItem.prdtName}">${cartItem.prdtName}</span>
								<span>${cartItem.gOptName}</span>
								<div class="acount-area">
									<button class="minus-btn">-</button>
									<input type="text" value="${cartItem.cartAmount}" readonly />
									<button class="plus-btn">+</button>
								</div>
							</li>
						</c:if>	
					</c:forEach>				
				</ul>	
			</div>				
		
		
			<!-- 클래스 부분 -->
			<div id="class-list-area">
				<ul id="cart-list">
					<li><input type="checkbox" style="margin-bottom: 10px;"/>&nbsp; 전체 선택</li>
					<c:forEach var="cartItem" items="${bList}" varStatus="vs">	
						<c:if test="${cartItem.prdtType eq 'C' }">	
							<li class="cart-content">
								<i class="cancle-icon fas fa-times"></i>
								<input type="checkbox"/>
								<div class="img-box"> 
									<c:forEach items="${thList}" var="th">
										<c:if test="${th.prdtNo == cartItem.prdtNo}">								
											<img src="${contextPath}${th.filePath}/${th.fileName}">										
										</c:if>
									</c:forEach> 
								</div>					
								<span class="product-name" title="${cartItem.prdtName}">${cartItem.prdtName}</span>
								<div class="acount-area">
									<button class="minus-btn">-</button>
									<input type="text" value="${cartItem.cartAmount}" readonly />
									<button class="plus-btn">+</button>
								</div>
							</li>
						</c:if>	
					</c:forEach>	
				</ul>	
			</div>
		</c:if>

		<!-- 결제 부분 -->
		<div id="payment-area">
			<div id="payment-info">
				<br/>
				<span>&nbsp;결제 예정 금액</span>
				<br/>
				<div id="price-text">
					<span>$</span> <span>10000원</span>
				</div>			
			</div>
			
			<button class="order-btn"  onclick="location.href='${contextPath}/payment/order'">주문하기</button>
			
		</div>
				
	</div>
	
	
	
	
<script>
	/* 장바구니 취소 버튼(X) */
	$(".cancle-icon").on("click", function() {
		console.log("x버튼 클릭 확인");
	});
	
	/* 장바구니 상품 수량 버튼(+,-) */
	$(".plus-btn").on("click", function() {
		var amount = $(this).prev();
		amount.val(Number(amount.val()) + 1);
	});
	$(".minus-btn").on("click", function() {
		var amount = $(this).next();
		if(amount.val() > 1) {
			amount.val(Number(amount.val()) - 1);
		}		
	});
	
	
	/* 선물 , 클래스 전환 */
	$("#gift-btn").on("click", function() {
		$("#gift-list-area").css("display", "block");
		$("#class-list-area").css("display", "none");
	});
	
	$("#class-btn").on("click", function() {
		$("#gift-list-area").css("display", "none");		
		$("#class-list-area").css("display", "block");	
	});	
	
</script>

</body>
</html>