<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		<div id="gift-list-area">
			<ul id="cart-list">
				<li><input type="checkbox" style="margin-bottom: 10px;"/>&nbsp; 전체 선택</li>
				<li class="cart-content">
					<i class="cancle-icon fas fa-times"></i>
					<input type="checkbox"/>
					<div class="img-box"> <img/> </div>					
					<span class="product-name">상품명</span>
					<span>[선물 옵션]</span>
					<div class="acount-area">
						<button class="plus-btn">-</button>
						<input type="text" value="1" readonly />
						<button class="minus-btn">+</button>
					</div>
				</li>
			</ul>	
		</div>
		
		
		
		
		<!-- 클래스 부분 -->
		<div id="class-list-area">
			<ul id="cart-list">
				<li><input type="checkbox" style="margin-bottom: 10px;"/>&nbsp; 전체 선택</li>
				<li class="cart-content">
					<i class="cancle-icon fas fa-times"></i>
					<input type="checkbox"/>
					<div class="img-box"> <img/> </div>
					<span class="product-name">클래스명</span>
					<div class="acount-area">
						<button class="plus-btn">-</button>
						<input type="text" value="1" readonly />
						<button class="minus-btn">+</button>
					</div>
				</li>
			</ul>	
		</div>


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
	$(".cancle-icon").on("click", function() {
		console.log("x버튼 클릭 확인");
	});
	
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