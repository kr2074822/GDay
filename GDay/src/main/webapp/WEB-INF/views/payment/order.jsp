<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
            <th class="goods-header-th1" colspan="2">상품</th>
            <th class="goods-header-th2">가격</th>
            <th class="goods-header-th3">수량</th>
         </tr>
         <c:forEach var="paymentItem" items="${olList}" varStatus="vs">
	         <tr id="goods-list">
	            <td id="img-box" class="goods-list">
         			<c:forEach items="${thList}" var="th">
						<c:if test="${th.prdtNo == paymentItem.prdtNo}">								
							<img src="${contextPath}${th.filePath}/${th.fileName}">										
						</c:if>
					</c:forEach> 
	            </td>         
	            <td class="goods-list" style="vertical-align: middle;">${paymentItem.prdtName}</td>
	            <td class="goods-list" style="vertical-align: middle;">${paymentItem.prdtPrice}</td>
	            <td class="goods-list" style="vertical-align: middle;">${paymentItem.prdtAmount}</td>
	         </tr>         
         </c:forEach>
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
            <button class="pink-btn" type="button">우편번호 검색</button>
         </div>
         <div class="address-div">
            <input size="30" type="text" class="member-address" id="address2" name="address" value="주소"/>
         </div>
         <div class="address-div">
            <input size="30" type="text" class="member-address" id="address3" name="address" value="상세주소"/>
         </div>   
         
         <button class="pink-btn" type="button">배송지 변경</button>   
      </div>
      
      
      
      <h2>결제 수단</h2>   
      
      <div id="payment-area">
         <div id="payment-api">
            api 들어가는 곳
         </div>
         
         <div id="payment-other">
            <h3>결제 금액</h3>
            <button class="pink-btn" onclick="requestPay()">결제하기</button>
            <button class="pink-btn" onclick="cancelPay()">임시환불버튼</button>
            <a href="${contextPath}/cart/memberCart">임시장바구니 링크</a>
         </div>
      </div>

   </div>
   
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
   
  <script>
 
     var IMP = window.IMP; 
     IMP.init("imp81888393"); 
     
     /* 결제 */
     var requestPay = function(){
        IMP.request_pay({
             pg : 'inicis', // version 1.1.0부터 지원.
             pay_method : 'card',
             merchant_uid : 'merchant_' + new Date().getTime(),
             name : '주문명:결제테스트',
             amount : 100,
             buyer_email : 'kang2x2@naver.com',
             buyer_name : '구매자이름',
             buyer_tel : '010-9462-2303',
             buyer_addr : '서울특별시 동대문구 이문동 신이문 금호 어울림 아파트 102동 906호',
             buyer_postcode : '123-456',
             m_redirect_url : 'https://www.myservice.com/payments/complete/mobile'
         }, function(rsp) {
             if ( rsp.success ) {
                 var msg = '결제가 완료되었습니다.';
                 msg += '고유ID : ' + rsp.imp_uid;
                 msg += '상점 거래ID : ' + rsp.merchant_uid;
                 msg += '결제 금액 : ' + rsp.paid_amount;
                 msg += '카드 승인번호 : ' + rsp.apply_num; 
                 jQuery.ajax({
                     url: "https://www.myservice.com/payments/complete", // 가맹점 서버
                     method: "POST",
                     headers: { "Content-Type": "application/json" },
                     data: {
                         imp_uid: rsp.imp_uid, // 테이블에 들어가야 할 것
                         merchant_uid: rsp.merchant_uid
                     }
                 }).done(function (data) {
                   // 가맹점 서버 결제 API 성공시 로직
                    console.log("결제 성공했어요.");
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