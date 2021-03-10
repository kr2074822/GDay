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
					<li><input class="check-all" type="checkbox" style="margin-bottom: 10px;"/>&nbsp; 전체 선택</li>
					<c:forEach var="cartItem" items="${bList}" varStatus="vs">	
						<c:if test="${cartItem.prdtType eq 'G' }">	
							<li class="cart-content">
								<input type="text" class="hidden-input item-prdt-no" value="${cartItem.prdtNo}"/>
								<input type="text" class="hidden-input item-opt_no" value="${cartItem.gOptNo}"/>
								<input type="text" class="hidden-input item-price" value="${cartItem.prdtPrice}"/>
								<i class="cancle-icon fas fa-times"></i>
								<input type="text" class="hidden-input cart-number" value="${cartItem.cartNo}"/>
								<input type="checkbox" class="product-check"/>
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
									<input type="text" class="item-amount" value="${cartItem.cartAmount}" readonly />
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
					<li><input class="check-all" type="checkbox" style="margin-bottom: 10px;"/>&nbsp; 전체 선택</li>
					<c:forEach var="cartItem" items="${bList}" varStatus="vs">	
						<c:if test="${cartItem.prdtType eq 'C' }">	
							<li class="cart-content">
								<input type="text" class="hidden-input item-prdt-no" value="${cartItem.prdtNo}"/>
								<input type="text" class="hidden-input item-opt_no" value="${cartItem.gOptNo}"/>
								<input type="text" class="hidden-input item-price" value="${cartItem.prdtPrice}"/> 
								<i class="cancle-icon fas fa-times"></i>
								<input type="text" class="hidden-input cart-number" value="${cartItem.cartNo}"/>
								<input type="checkbox" class="product-check"/>
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
									<input type="text" class="item-amount" value="${cartItem.cartAmount}" readonly />
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
					<span>$</span> <span id="price-sum"></span>
				</div>			
			</div>
			
			<button class="order-btn">주문하기</button>
			
		</div>
				
	</div>
	
	<jsp:include page="../../common/footer.jsp"/>
	
<script>

	var price = 0; // 상품 가격 합계를 담기 위한 변수
	var itemArys = []; // 선택된 상품 정보를 담기 위한 배열
	
	$(document).ready(function(){
		$("#price-sum").text(price);
	});
		
	
	/* 장바구니 취소 버튼(X) */
	$(".cancle-icon").on("click", function() {
		var cartNo = $(this).next().val(); // 장바구니 번호
		var li = $(this).parent();
		var itemPrice = $(this).prev().val(); // 아이템 가격
		var itemAmount = li.find(".item-amount").val(); // 아이템 수량
		
		if(window.confirm("장바구니에서 삭제하시겠습니까?")) {
			$.ajax({
				url : "${contextPath}/cart/deleteCart/" + cartNo,
				success : function(result) {
					if(result > 0) {
						for(var i = 0; i < itemArys.length; ++i) {
							if(itemArys[i].cartNo == cartNo) {
								itemArys.splice(i, 1);
								price = Number(price) - (Number(itemPrice) * Number(itemAmount));
							}
						} 	
						li.remove();
						console.log(itemArys);
						$("#price-sum").text(price);
					}
				}, error : function() {
					
				}
			});
		}
		
	});
	
	
	
	/* 장바구니 상품 수량 버튼(+,-) */
	$(".plus-btn").on("click", function() {
		var li = $(this).parent().parent(); // 전체를 감싸는 li
		var checkBox = li.find(".product-check"); // 아이템 별 체크 박스
		var itemPrice = li.find(".item-price"); // 아이템 가격
		var itemAmount = li.find(".item-amount"); // 아이템 수량
		
		itemAmount.val(Number(itemAmount.val()) + 1); // 수량 1증가
		
 		if(checkBox.is(":checked")) {
 			price += Number(itemPrice.val());
		}   
		
 		$("#price-sum").text(price);
	});
	$(".minus-btn").on("click", function() {
		var li = $(this).parent().parent(); // 전체를 감싸는 li
		var checkBox = li.find(".product-check"); // 아이템 별 체크 박스
		var itemPrice = li.find(".item-price"); // 아이템 가격
		var itemAmount = li.find(".item-amount"); // 아이템 수량
		
		if(itemAmount.val() > 1) {
			itemAmount.val(Number(itemAmount.val()) - 1);
	 		if(checkBox.is(":checked")) {	
	 			price -= Number(itemPrice.val());
			}   
		}	
		
 		$("#price-sum").text(price);
	});
	
	
	
	/* 선물 , 클래스 전환 */
	$("#gift-btn").on("click", function() {
		$("#gift-list-area").css("display", "block");
		$("#class-list-area").css("display", "none");
		
		/* 체크박스 다 비워버리기 */
		$(".product-check").prop("checked", false);
		$(".check-all").prop("checked", false);
		itemArys = [];
		price = 0;
		$("#price-sum").text(price);
		
		console.log(itemArys);
	});
	
	$("#class-btn").on("click", function() {
		$("#gift-list-area").css("display", "none");		
		$("#class-list-area").css("display", "block");	
		
		/* 체크박스 다 비워버리기 */
		$(".product-check").prop("checked", false);
		$(".check-all").prop("checked", false);
		itemArys = [];
		price = 0;
		$("#price-sum").text(price);
		
		console.log(itemArys);
	});	
	
	/* 주문하기 영역 */
 		
	/* 전체 선택 */
	$(".check-all").on("click", function(){
		var ul = $(this).parent().parent();
		var checkLength = ul.find(".cart-number").length;
		var cartNo = ul.find(".cart-number"); // 카트 번호
		var itemPrice = ul.find(".item-price"); // 아이템 가격
		var itemAmount = ul.find(".item-amount"); // 아이템 수량		
		var prdtNo = ul.find(".item-prdt-no"); // 상품 번호
		var itemName = ul.find(".product-name"); // 아이템 이름
		var itemOptNo = ul.find(".item-opt_no"); // 아이템 옵션 이름
		
		// 한번 비우기
		itemArys = [];
		price = 0;
		
		// 상품 가격의 전체 합계
	 	for(var i = 0; i < ul.find(".item-price").length; ++i) {
	 		price = Number(price) + (Number(itemPrice.eq(i).val()) * Number(itemAmount.eq(i).val()));
	 	} 
		
		if($(this).is(":checked")) {						
 			for(var i = 0; i < checkLength; ++i) {
 				var itemInfo = {
 					cartNo : cartNo.eq(i).val(),
 					prdtNo : prdtNo.eq(i).val(),
 					prdtName : itemName.eq(i).text(),
 					optNo : itemOptNo.eq(i).val(),
 					prdtPrice : itemPrice.eq(i).val(),
 					prdtAmount : itemAmount.eq(i).val()
 				}
	
 				$(".plus-btn").on("click", function() {
 					var itemInfo = {
 						cartNo : cartNo.val(),
 						prdtNo : prdtNo.val(),
 						prdtName : itemName.text(),
 						optNo : itemOptNo.val(),
 						prdtPrice : itemPrice.val(),
 						prdtAmount : itemAmount.val()
 			 		}
 					for(var i = 0; i < itemArys.length; ++i) {
 						if(itemInfo.cartNo == itemArys[i].cartNo) {
 							itemArys[i].prdtAmount = itemInfo.prdtAmount;
 						}
 					}
 				});
 				
 				$(".minus-btn").on("click", function() {
 					var itemInfo = {
 							cartNo : cartNo.val(),
 							prdtNo : prdtNo.val(),
 							prdtName : itemName.text(),
 							optNo : itemOptNo.val(),
 							prdtPrice : itemPrice.val(),
 							prdtAmount : itemAmount.val()
 				 		}
 						for(var i = 0; i < itemArys.length; ++i) {
 							if(itemInfo.cartNo == itemArys[i].cartNo) {
 								itemArys[i].prdtAmount = itemInfo.prdtAmount;
 							}
 						}
 				});
 				
 				itemArys.push(itemInfo);
			} 
 			
 			ul.find($(".product-check")).prop("checked", true);
 			
 			
 			
 			
		} else {
			itemArys = [];			
			price = 0;
			ul.find($(".product-check")).prop("checked", false);
		}
		
		$("#price-sum").text(price);
	});
	
	/* 개별 선택 */
	$(".product-check").on("change", function() {
		var ul = $(this).parent().parent(); // 전체를 감싸는 ul
		var li = $(this).parent(); // 전체를 감싸는 li
		var cartNo = li.find(".cart-number"); // 카트 번호
		var itemPrice = $(this).prev().prev().prev(); // 아이템 가격
		var itemAmount = li.find(".item-amount"); // 아이템 수량
		var prdtNo = li.find(".item-prdt-no"); // 상품 번호
		var itemName = li.find(".product-name"); // 아이템 이름
		var itemOptNo = li.find(".item-opt_no"); // 아이템 옵션 이름
		
		if($(this).is(":checked")) {
			var itemInfo = {
				cartNo : cartNo.val(),
				prdtNo : prdtNo.val(),
				prdtName : itemName.text(),
				optNo : itemOptNo.val(),
				prdtPrice : itemPrice.val(),
				prdtAmount : itemAmount.val()
 			}
			itemArys.push(itemInfo);
			price = Number(price) + (Number(itemPrice.val()) * Number(itemAmount.val()));

			$(".plus-btn").on("click", function() {
				var itemInfo = {
					cartNo : cartNo.val(),
					prdtNo : prdtNo.val(),
					prdtName : itemName.text(),
					optNo : itemOptNo.val(),
					prdtPrice : itemPrice.val(),
					prdtAmount : itemAmount.val()
		 		}
				for(var i = 0; i < itemArys.length; ++i) {
					if(itemInfo.cartNo == itemArys[i].cartNo) {
						itemArys[i].prdtAmount = itemInfo.prdtAmount;
					}
				}
				console.log(itemArys);
			});
			
			$(".minus-btn").on("click", function() {
				var itemInfo = {
						cartNo : cartNo.val(),
						prdtNo : prdtNo.val(),
						prdtName : itemName.text(),
						optNo : itemOptNo.val(),
						prdtPrice : itemPrice.val(),
						prdtAmount : itemAmount.val()
			 		}
					for(var i = 0; i < itemArys.length; ++i) {
						if(itemInfo.cartNo == itemArys[i].cartNo) {
							itemArys[i].prdtAmount = itemInfo.prdtAmount;
						}
					}
				console.log(itemArys);
			});
			
			
			
		} else {
			for(var i = 0; i < itemArys.length; ++i) {
				if(itemArys[i].cartNo == $(this).prev().val()) {
					itemArys.splice(i, 1);
					price = Number(price) - (Number(itemPrice.val()) * Number(itemAmount.val()));
				}
			} 		
		}
		
		$("#price-sum").text(price);
	});	
	
	
	/* 결제 페이지로 선택된 상품들 보내기 */
	/* 상품번호 / 상품명 / 상품옵션(번호) / 가격 / 수량 */
	$(".order-btn").on("click", function() {	
		
		if(itemArys.length > 0) {
			$.ajax({
				url : "${contextPath}/payment/order",
				type : "post",
				data : JSON.stringify(itemArys),
				contentType : "application/json",
				traditional: true,
				success : function(result) {
					if(result > 0) {
						location.href ="${contextPath}/payment/paymentForm"
					} 
				}, error : function() {
					window.alert("에러!");
				}
			});
		} else {
			window.alert("하나 이상의 상품을 선택해주세요.");
		}
		
		
	});
	
</script>

</body>
</html>