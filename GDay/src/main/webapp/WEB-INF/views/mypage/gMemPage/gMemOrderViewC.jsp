<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>선물 주문 상세 정보</title>
    <link rel="stylesheet" href="${contextPath}/resources/css/common/reset.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/mypage/mypageList.css?ver=1.2"> <!-- 같은 클래스 공유 -->
    <link rel="stylesheet" href="${contextPath}/resources/css/mypage/gmemOrderView.css"> <!-- 상세 페이지 고유 css -->

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

<!-- 모달 파일 -->
<jsp:include page="../../review/reviewInsertForm.jsp"/>

<div id="wrapper-list">
		<jsp:include page="gMemSidebar.jsp"/>

    <div id="container-list-all" class="container-view">
        <div id="list-title">
            <span>수강 클래스 상세 정보</span>
        </div>
    
        <div id="order-info">
            <span class="order-date">수강 신청일</span><span class="order-date">2021.02.04</span>
            <span class="separate" style="font-size : 16px;">&nbsp; ┃ &nbsp;</span>
            <br> <!-- flex-direction: row에서는 br이 적용X column일 때(반응형) 적용 -->
            <span class="order-no">수강 신청 번호</span><span class="order-no">2021020412345</span>
        </div>

        <div class="container-table" id="ship-info">
            <div class="columns"><!-- 왼 레이블 / 오 내용 -->
                <span class="column-hidden opNo">21234</span><!-- 클래스 상품 주문번호 -->
                <span class="column-label">클래스명</span>
                <span class="column-content" >
	                <span class="column-content-1" id="class-name">손뜨개 클래스</span>
	                <a href="${contextPath}/gMember/cancelRequest/2/1" class="btn-request btn-view">신청 취소</a>
	                <a class="btn-review btn-view" onclick="popUp(1, 'c')">후기 쓰기</a>
                </span>
            </div>
            <div class="columns">
                <span class="column-label">클래스 기간(회차)</span>
                <span class="column-content" id="class-period">2021.03.30. ~ 2021.04.30.(4회차)</span>
            </div>
            <div class="columns">
                <span class="column-label">클래스 시간</span>
                <span class="column-content" id="class-dates">토 2시</span>
            </div>
            <div class="columns">
                <span class="column-label">강사명</span>
                <div class="column-content">
	                <span class="column-content-1" id="teacher">강사님</span>
	                <a href="#" class="btn-inquiry btn-view">문의하기</a>
                </div>
            </div>
            <div class="columns">
                <span class="column-label">클래스 장소</span>
                <div class="column-content">
	                <span class="column-content-1" id="class-addr">서울특별시 중구 남대문로 120 대일빌딩 2층</span>
  	              <a href="#" class="btn-map btn-view">지도보기</a>
  	            </div>  
            </div>
        </div>
        
        <div id="list-title">
            <span>수강생 정보</span>
        </div>
        <div class="container-table" id="ship-info">
            <div class="columns"><!-- 왼 레이블 / 오 내용 -->
                <span class="column-label">신청인(명)</span>
                <span class="column-content" id="ship-name">김땡땡(2명)</span>
            </div>
            <div class="columns">
                <span class="column-label">대표 연락처</span>
                <span class="column-content" id="ship-phone">010-8888-8888</span>
            </div>
        </div>
        

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

        <a href="#" class="btn-gotolist btn-view">목록</a>
    </div>
</div>

</body>
</html>