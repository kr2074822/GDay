<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<% response.setContentType("text/html; charset=utf-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문/결제</title>
<link rel="stylesheet" href="${contextPath}/resources/css/common/reset.css?ver=1.0">
<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/payment/order.css?ver=1.0" >

</head>
<body>
   <jsp:include page="../common/header.jsp"/>
   
   <div id="order-wrapper">
   
      <h1>주문/결제</h1>
      
      <h2>주문 상품</h2>
      <table id="goods" class="tables">
         <tr id="goods-header">
            <th class="goods-header-th1" colspan="2">상품</th>
            <th class="goods-header-th2">가격</th>
            <th class="goods-header-th3">수량</th>
         </tr>
         	<c:if test="${item != null }">         	      	
		         <tr id="goods-list" class="items">
		            <td class="goods-list img-box">
	         			<c:forEach items="${tList}" var="th">
							<img src="${contextPath}${th.filePath}/${th.fileName}">										
						</c:forEach> 
		            </td>         
		            <td class="goods-list prdt-name"  style="vertical-align: middle;">${item.prdtName}</td>
		            <td class="goods-list prdt-price"  style="vertical-align: middle;">${item.prdtPrice}</td>
		            <td class="goods-list cart-amount"  style="vertical-align: middle;">${item.prdtAmount}</td>
		         </tr>   
	         </c:if>      
      </table>
      
      <c:remove var="item" scope="session"/>
      <c:remove var="tList" scope="session"/>
      
      <br>
      
      
      <h2>주문자 정보</h2>
      <table id="member-info" class="tables">   
         <tr class="member-info-tr">
            <td class="member-info-td">이름</td>
            <td><input size="8" type="text" class="member-info-input" id="member-name" name="member-name" value="${loginMember.memberName}"/></td>
         </tr>
         <tr class="member-info-tr">
            <td class="member-info-td">이메일</td>
            <td><input type="email" class="member-info-input" id="email" name="email" value="${loginMember.memberEmail}"/></td>
         </tr>
         <tr class="member-info-tr">
            <td class="member-info-td">휴대폰 번호</td>
            <td><input type="tel" class="member-info-input" id="phone" name="phone" value="${loginMember.memberPhone}"/></td>
         </tr>   
      </table>
   
   
      <h2>배송 주소</h2>
      
      <div id="address-area">
         <h3><i class="fas fa-thumbtack address-icon"></i>&nbsp;배송지</h3>
         
			<div class="row mb-3 form-row address-info">
				<div class="col-md-3 address-info">
					<input type="text" name="post" id="post" class="form-control postcodify_postcode5">
				</div>
				<div class="col-md-3 address-info">
					<button type="button" class="btn btn-success addr-btn" id="postcodify_search_button">검색</button>
				</div>
			</div>

			<div class="row mb-3 form-row address-info">
				<div class="col-md-9 address-info">
					<input type="text" class="form-control postcodify_address" name="address1" id="address1" style="width: 400px;">
				</div>
			</div>

			<div class="row mb-3 form-row address-info">
				<div class="col-md-9 address-info">
					<input type="text" class="form-control postcodify_details" name="address2" id="address2" style="width: 400px;">
				</div>
			</div>
          
      </div>
      
      
      <div id="payment-area">
         <div id="payment-other">
         	<h3></h3>
            <button class="pink-btn" onclick="requestPay()">결제하기</button>
         </div>
      </div>

   </div>
   
   <jsp:include page="../common/footer.jsp"/>
   
   <!-- jQuery -->
  <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
  <!-- iamport.payment.js --> <!-- 결제 라이브러리 -->
  <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
  
  <!-- 환불관련 임시로 라이브러리 임시-->
   <script
       src="https://code.jquery.com/jquery-3.3.1.min.js"
       integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
       crossorigin="anonymous">
   </script><!-- jQuery CDN --->
   
   	<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
	<script>
		// 검색 단추를 누르면 팝업 레이어가 열리도록 설정한다.
		$(function() {
			$("#postcodify_search_button").postcodifyPopUp();
		});
		
/* 		$memberAddress = $("<input>", {type : "hidden", name : "memberAddress",
			value : $("#post").val() + "," + $("#address1").val() + "," + $("#address2").val()
		}); */
	</script>
   
   
   
  <script>  
     var IMP = window.IMP; 
     IMP.init("imp81888393"); 
     
     var prices = $(".prdt-price");
     var amounts = $(".cart-amount");
     
     var sum = 0;
     
     for(var i = 0; i < prices.length; ++i) {
    	 var price = Number(prices.eq(i).text()) * Number(amounts.eq(i).text());
    	 sum += price;
     }
     
     console.log(sum);
     
     $("#payment-other > h3").append("결제금액 : " + sum);
     
     /* 결제 */
     var requestPay = function(){
        var phone = $("#phone").val();
        var memberName = $("#member-name").val();
        var prdtName = $(".prdt-name").text();
        var memberEmail = $("#email").val();
/*         var memberPhone = phone.substr(0,3) + "-" + phone.substr(3,4) + "-" + phone.substr(7, 4); */
        var postCode = $("#post").val();
    	var memberAddress = $("#address1").val() + "," + $("#address2").val();    	
    	
    	for(var i = 0; i < $(".prdt-name").length; ++i) {
    		if(i > 1) {
    			prdtName = $(".prdt-name").eq(0).text() + "외 " + (i-1);
    		}
    	}
    	
        IMP.request_pay({
             pg : 'inicis', // version 1.1.0부터 지원.
             pay_method : 'card',
             merchant_uid : 'merchant_' + new Date().getTime(),
             name : prdtName,
             amount : 100,
             buyer_email : memberEmail,
             buyer_name : memberName,
             buyer_tel : phone,
             buyer_addr : memberAddress,
             buyer_postcode : postCode,
             m_redirect_url : 'https://www.myservice.com/payments/complete/mobile'
         }, function(rsp) {
             if ( rsp.success ) {
                 var msg = '결제가 완료되었습니다.';
                 msg += '고유ID : ' + rsp.imp_uid;
                 msg += '상점 거래ID : ' + rsp.merchant_uid;
                 msg += '결제 금액 : ' + rsp.paid_amount;
                 msg += '카드 승인번호 : ' + rsp.apply_num; 
                 jQuery.ajax({
                     url: "${contextPath}/payment/insertOrderInfo", // 가맹점 서버
                     method: "POST",
                     data: {
                         imp_uid: rsp.imp_uid,
                         merchant_uid: rsp.merchant_uid,
                         "memberName" : rsp.buyer_name,
                         "memberAddress" : rsp.buyer_addr,
                         "memberPhone" : rsp.buyer_tel              
                     },
                 }).done(function (data) {
                   // 가맹점 서버 결제 API 성공시 로직
                   location.href = "${contextPath}/payment/orderSuccess";
                 });
             } else {
                  var msg = '결제에 실패하였습니다.';
                 msg += '에러내용 : ' + rsp.error_msg; 
                 alert("결제에 실패하였습니다. 에러 내용: " +  rsp.error_msg);
             }
             alert(msg);
         });
     }
     
     
      
     
     /* 임시환불 */

     function cancelPay() {
         jQuery.ajax({
              url: "http://www.myservice.com/payments/cancel",
              type: "POST",
              contentType: "application/json",
              data: JSON.stringify({
                "merchant_uid": "mid_" + new Date().getTime(), // 주문번호
                "cancel_request_amount": 2000, // 환불금액
                "reason": "테스트 결제 환불", // 환불사유
                "refund_holder": "홍길동", // [가상계좌 환불시 필수입력] 환불 수령계좌 예금주
                "refund_bank": "88", // [가상계좌 환불시 필수입력] 환불 수령계좌 은행코드(ex. KG이니시스의 경우 신한은행은 88번)
                "refund_account": "56211105948400" // [가상계좌 환불시 필수입력] 환불 수령계좌 번호
              }),
                dataType: "json"
              });
      }
     
     
   </script>



</body>
</html>