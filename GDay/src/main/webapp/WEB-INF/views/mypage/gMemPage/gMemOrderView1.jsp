<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>선물 주문 상세 정보</title>
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

<!-- js 파일 -->
<jsp:include page="gMemOrderViewJS1.jsp"></jsp:include>


<div id="wrapper-list">
		<jsp:include page="gMemSidebar.jsp"/>

    <div id="container-list-all" class="container-view">
        <div id="list-title">
            <span>선물 주문 상세 정보</span>
        </div>
    
        <div id="order-info">
            <span class="order-date">주문 일자</span><span class="order-date">2021.02.04</span>
            <span class="separate" style="font-size : 16px;">&nbsp; ┃ &nbsp;</span>
            <br> <!-- flex-direction: row에서는 br이 적용X column일 때(반응형) 적용 -->
            <span class="order-no">주문 번호</span><span class="order-no">2021020412345</span>
        </div>

        <div class="container-orders"><!-- 반응형 관련 -->
        <!-- 주문 목록 리스트 -->
        <%-- <c:forEach  var="order" items="oList"> --%>
            <div class="row container-list">
                <div class="list-card">
                    <div class="list-thumb">
                        <img src="#"> <!-- 클릭시 해당 판매글로 이동 -->
                    </div>
                    <div class="list-text">
                        <span class="orderNo list-hidden">21020411334</span> <!-- 주문번호 -->
                        <span class="orderPrdtNo list-hidden">21020423456</span> <!-- 상품 주문 번호 -->
                        <span class="list-name">선물명</span><br><!-- 클릭시 해당 판매글로 이동 -->
                        <span class="list-text-1">100,000원/1개</span><br>
                        <span class="list-text-2">옵션</span><br>
                        <span class="list-text-3">[구매 확정]</span>
                    </div>
                </div>
                <div class="list-btn">
                    <div class="list-seller">
                        <span class="seller-name">판매업체</span>
                        <a href="#" class="btn-inquiry">문의하기</a><!-- 팝업창? 모달창? -->
                    </div>
                    <div class="list-status">
                        <!-- 구매 확정 후 : 후기 쓰기(팝업창) -->
                        <a href="#" class="btn-review">후기 쓰기</a>

                        <!-- 결제 완료 후 : 취소 요청(팝업창)-->
                        <a href="#" class="btn-cancel">취소 요청</a> 
                        
                        <!-- 선물 발송 후 : 구매확정(confirm) / 반품 요청(팝업창) -->
                        <a href="#" class="btn-confirm">구매 확정</a> <!-- 발송 후 30일 이후에는 자동으로 확정 -->
                        <a href="#" class="btn-takeback">반품 요청</a> 
                    </div>
                </div>
            </div><!-- container-list 끝 -->
	     <%-- </c:forEach> --%>
        </div> 
        <!-- container-orders 끝 -->

        <div id="list-title">
            <span>최종 결제 정보</span>
        </div>
        <div class="container-table" id="pay-info">
            <div class="columns">
                <span class="column-label">최종 결제 금액</span>
                <span class="column-content" id="total-order">200,000원</span>
            </div>
            <div class="columns">
                <span class="column-label">결제 수단</span>
                <span class="column-content" id="payType">신용카드/일시불</span>
            </div>
        </div>

        <div id="list-title">
            <span>배송지 정보</span>
        </div>
        <div class="container-table" id="ship-info">
            <div class="columns"><!-- 왼 레이블 / 오 내용 -->
                <span class="column-label">받는 사람</span>
                <span class="column-content" id="ship-name">김땡땡</span>
            </div>
            <div class="columns">
                <span class="column-label">연락처</span>
                <span class="column-content" id="ship-phone">010-8888-8888</span>
            </div>
            <div class="columns">
                <span class="column-label">배송지</span>
                <span class="column-content" id="ship-addr">서울특별시 중구 남대문로 120 대일빌딩 2층, 3층</span>
            </div>
        </div>
        <a href="#" class="btn-gotolist">목록</a>
    </div>
</div>

</body>
</html>