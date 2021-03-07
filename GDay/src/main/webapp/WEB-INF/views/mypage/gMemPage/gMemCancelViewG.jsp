<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 화폐단위 체크용 -->
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>선물 취소/반품 신청 정보</title>
    <link rel="stylesheet" href="${contextPath}/resources/css/common/reset.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/mypage/mypageList.css?ver=1.0"> <!-- 같은 클래스 공유 -->
    <link rel="stylesheet" href="${contextPath}/resources/css/mypage/gmemOrderView.css?ver=1.0"> <!-- 상세 페이지 고유 css -->

    <!-- Bootstrap core JS-->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">

    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

    <!-- swal2 -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9.17.2/dist/sweetalert2.all.min.js"></script>
    <!-- <script src="//cdn.jsdelivr.net/npm/promise-polyfill@8/dist/polyfill.js"></script> -->
  	
  	<style>
  	
  	#wrapper-list {
  		display : flex; 
  	}
  	
  	</style>
</head>
<body>

<jsp:include page="../../common/header.jsp"/>

<div id="wrapper-list">
		<jsp:include page="gMemSidebar.jsp"/>

    <div id="container-list-all" class="container-view">
        <div class="list-title">
            <span>취소·반품 상세 정보</span>
        </div>
    
        <div id="order-info">
            <span class="order-date">취소·반품 신청일&nbsp;&nbsp;</span><span class="order-date">${refund.rfDate}</span>
            <span class="separate" style="font-size : 16px;">&nbsp; ┃ &nbsp;</span>
            <br> <!-- flex-direction: row에서는 br이 적용X column일 때(반응형) 적용 -->
            <span class="order-no">주문 상품 번호&nbsp; &nbsp;</span><span class="order-no">${order.opNo}</span>
        </div>

        <div class="container-orders"><!-- 반응형 관련 -->
        <!-- 취소 주문 상품 리스트 -->
            <div class="container-list">
                <div class="list-card">
                    <c:set var="imgUrl" value="${contextPath}${thumbnail.filePath}/${thumbnail.fileName}"/>
		                <div class="list-thumb" style="background-image: url(${imgUrl});"></div>
                    <div class="list-text">
                        <span class="orderNo list-hidden">${order.orderNo}</span> <!-- 주문번호 -->
                        <span class="list-name">${order.prdtName}</span><!-- 클릭시 해당 판매글로 이동 -->
                        <span class="list-text-1"><fmt:formatNumber value="${order.prdtPrice * order.opAmount}"/>원</span>
                        <span class="list-text-2">
                        		<c:if test="${gOption.gOptNo == order.giftOpNo}">
                        			${gOption.gOptName} / 
                        		</c:if>
                        		${order.opAmount}개
                        </span>
                    </div>
                </div>
                <div class="list-btn">
                    <div class="list-seller">
                        <span class="seller-name">${order.sellerName}</span>
                        <a class="btn-inquiry" onclick="gotoInquiry(${order.sellerNo})">문의하기</a><!-- 팝업창? 모달창? -->
                    </div>
                 	  <div class="list-status">
                    		<a class="btn-detail" onclick="gotoDetail(${order.orderNo})">주문 정보</a>
                    </div>
                </div>
            </div><!-- container-list 끝 -->
	     <%-- </c:forEach> --%>
        </div> 
        <!-- container-orders 끝 -->

        <div class="list-title">
            <span>취소·반품 사유</span>
        </div>
        <div class="container-table" id="cancel-info">
            <div class="columns">
                <span class="column-label">취소·반품 사유</span>
                <span class="column-content" id="rfReason">${refund.rfReasonName}</span>
            </div>
            <div class="columns">
                <span class="column-label">사유 상세 내용</span>
                <span class="column-content" id="rfContent">${refund.rfContent}</span>
            </div>
        </div>

        <div class="list-title">
            <span>환불 예정 금액</span>
        </div>
        <div class="container-table" id="pay-info">
            <div class="columns">
                <span class="column-label">환불 금액</span>
                <span class="column-content" id="total-order"><fmt:formatNumber value="${order.prdtPrice * order.opAmount}"/>원</span>
            </div>
            <div class="columns">
                <span class="column-label">환불 방식</span>
                <span class="column-content" id="payType">신용카드</span>
            </div>
        </div>

        <div class="list-title">
            <span>수거지 정보</span>
        </div>
        <div class="container-table" id="ship-info">
            <div class="columns"><!-- 왼 레이블 / 오 내용 -->
                <span class="column-label">반송자</span>
                <span class="column-content" id="ship-name">${order.shipName}</span>
            </div>
            <div class="columns">
                <span class="column-label">연락처</span>
                <span class="column-content" id="ship-phone">${order.shipPhone}</span>
            </div>
            <div class="columns">
                <span class="column-label">반송지</span>
                <span class="column-content" id="ship-addr">${order.shipAddr}</span>
            </div>
        </div>
    </div>
</div>


<script>
//ready 함수
$(function(){
	
});//ready 함수 끝

//썸네일, 상품명 클릭 시 상세 주문 내역으로 이동
function gotoDetail(orderNo){
	url = "../../orderView/G/" + orderNo;
	
	location.href = url;
}

//판매자한테 문의하기
function gotoInquiry(sellerNo) {
	
}

</script>

</body>
</html>